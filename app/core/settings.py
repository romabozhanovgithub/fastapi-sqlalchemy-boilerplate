from functools import lru_cache
from pydantic import BaseSettings


class Settings(BaseSettings):
    ENV: str = "dev"
    DEBUG: bool = True
    APP_TITLE: str = "FastAPI Boilerplate"
    APP_HOST: str = "0.0.0.0"
    APP_PORT: int = 8000
    DATABASE_URL: str = "sqlite:///./test.db"


class ProductionSettings(Settings):
    ENV: str = "prod"
    DEBUG: bool = False


class StagingSettings(Settings):
    ENV: str = "staging"
    DEBUG: bool = True


class DevelopmentSettings(Settings):
    ENV: str = "dev"
    DEBUG: bool = True


class LocalSettings(Settings):
    ENV: str = "local"
    DEBUG: bool = True


@lru_cache()
def get_settings():
    env = os.getenv("ENV", "local")
    if env == "prod":
        return ProductionSettings()
    elif env == "staging":
        return StagingSettings()
    elif env == "dev":
        return DevelopmentSettings()
    elif env == "local":
        return LocalSettings()
    else:
        raise ValueError(f"Unknown environment: {env}")


settings = get_settings()
