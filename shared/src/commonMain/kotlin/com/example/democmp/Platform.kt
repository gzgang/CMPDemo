package com.example.democmp

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform