//
//  Supabase.swift
//  TodoList
//
//  Created by junxi Yim on 2024/5/22.
//

import Foundation
import Supabase

let supabase = SupabaseClient(
  supabaseURL: URL(string: "https://tfvvjwlbjmujaftqssoj.supabase.co")!,
  supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRmdnZqd2xiam11amFmdHFzc29qIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTM0NjQxMjYsImV4cCI6MjAyOTA0MDEyNn0.NoOLBg7SBsuQrnpqZyAcSzf_fND8fp7qg9nq7Ehf0Zs"
)

