Return-Path: <linux-media+bounces-28443-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCDFA67D12
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 20:26:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2D18B7AAA3F
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 19:25:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFE07215181;
	Tue, 18 Mar 2025 19:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="WmQWxGoW"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DA41A264A;
	Tue, 18 Mar 2025 19:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742325849; cv=pass; b=fOLLSLbhoMuTJfRGMV43VgUG5+cgbAn/wrJb7zB17ECWlpaIoIGp9DCrn8bEF8IqIBujcTrK7LterxrNzSi+j6aBZVxMRF4vwnxa59p/AN/sTR33RWsP2LRh+bespx7IjGYSXt4R2oKvtdq+s4/gC7DdgXQmmqqIz+4ayHZUD3g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742325849; c=relaxed/simple;
	bh=FQEeIYlXqXUu0AIkMdzQBBWAMtn9hMMGYmCC3qrTfko=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ILn5d8QJ/szJdiAJrngIBzCRuPhesUnXofPjid/3S/bVqtE121W44XFDdagZQuAFYuJv8J/WYCsn+aiSpMTTCV9uuCDVEZbFILKh3EXwMqIcgyGmWOFZhMe9ss2uPuVQX5J9u326xWKylc4zvMNW6jZS+pfxniNJv8ruL7sVuwc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=WmQWxGoW; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1742325811; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Vx5MJl4hUvJH91lbjym/2lADGGJD2jYtwKDZ465CsMw4d9Bxta67gNDnAweZ8s4j8CA8ZBDc4/uTYKfSXl8BazdZhC0nNHufnloDsIKzlexo9VeJAIuPVxHgqYDmw4lxqJRQyD5EoNyAFgo4EnRCp56QzyI6wS1b/LS9w8OCuis=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1742325811; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=HfYRoG5Q5EHI6+e63eFq0AZL9BjmOXOU/I+lIAD4KZI=; 
	b=nq9N0vAqTtfkDrzV+6WGQaaHsBrl4g3L66VfEnT+PAK+FvuZTASNVfOnrc3OTh88zsD+d+Jg5nPetTdbktHJVjY8GTHfZK9fb7mXxCDVqXN6Q4Rg7SGsvdfVYMUVAUtLwc4QEkO7t/Cwf/RgA9iDh/mgkrWWcWuGMW65uSN80iY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1742325811;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=HfYRoG5Q5EHI6+e63eFq0AZL9BjmOXOU/I+lIAD4KZI=;
	b=WmQWxGoWdDH2xYTAw/hy191MJRCZTKLTqESfnsjq1GDTHjBy9A8eVICg5pqw4qTZ
	NA3e5R3AyJXgz/0yOPaWsdrJeHUi0i3UR3tOLj5Q1v2rfyNVQbfXwizUdp3YM+8eqeS
	PBT6Vy/O2ss0FNSAJTMBNqvogl+22h0q581cxjhs=
Received: by mx.zohomail.com with SMTPS id 1742325808686508.48664192225283;
	Tue, 18 Mar 2025 12:23:28 -0700 (PDT)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Tue, 18 Mar 2025 16:22:40 -0300
Subject: [PATCH 6/7] rust: drm: gem: Add set_exportable() method
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-drm-gem-shmem-v1-6-64b96511a84f@collabora.com>
References: <20250318-drm-gem-shmem-v1-0-64b96511a84f@collabora.com>
In-Reply-To: <20250318-drm-gem-shmem-v1-0-64b96511a84f@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Danilo Krummrich <dakr@kernel.org>, 
 Asahi Lina <lina@asahilina.net>, 
 Daniel Almeida <daniel.almeida@collabora.com>
X-Mailer: b4 0.14.2
X-ZohoMailClient: External

From: Asahi Lina <lina@asahilina.net>

This allows drivers to control whether a given GEM object is allowed to
be exported via PRIME to other drivers.

Signed-off-by: Asahi Lina <lina@asahilina.net>
Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 rust/kernel/drm/gem/mod.rs   | 13 +++++++++++++
 rust/kernel/drm/gem/shmem.rs |  4 ++++
 2 files changed, 17 insertions(+)

diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index 083faac8602885aee5ef213bb3302b79dfac4a95..3a7e9f80b414bf39301e342938ba33877bfac2cb 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -45,6 +45,10 @@ pub trait IntoGEMObject: Sized + crate::private::Sealed {
     /// this owning object is valid.
     fn gem_obj(&self) -> &bindings::drm_gem_object;
 
+    /// Returns a reference to the raw `drm_gem_object` structure, which must be valid as long as
+    /// this owning object is valid.
+    fn mut_gem_obj(&mut self) -> &mut bindings::drm_gem_object;
+
     /// Converts a pointer to a `drm_gem_object` into a pointer to this type.
     fn from_gem_obj(obj: *mut bindings::drm_gem_object) -> *mut Self;
 }
@@ -119,6 +123,10 @@ fn gem_obj(&self) -> &bindings::drm_gem_object {
         &self.obj
     }
 
+    fn mut_gem_obj(&mut self) -> &mut bindings::drm_gem_object {
+        &mut self.obj
+    }
+
     fn from_gem_obj(obj: *mut bindings::drm_gem_object) -> *mut Object<T> {
         // SAFETY: All of our objects are Object<T>.
         unsafe { crate::container_of!(obj, Object<T>, obj) as *mut Object<T> }
@@ -132,6 +140,11 @@ fn size(&self) -> usize {
         self.gem_obj().size
     }
 
+    /// Sets the exportable flag, which controls whether the object can be exported via PRIME.
+    fn set_exportable(&mut self, exportable: bool) {
+        self.mut_gem_obj().exportable = exportable;
+    }
+
     /// Creates a new reference to the object.
     fn reference(&self) -> ObjectRef<Self> {
         // SAFETY: Having a reference to an Object implies holding a GEM reference
diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
index cd080d820727fb39cb91cb0617df39310b5b68c8..fdf7dd7f2408bd2857f5b72027ef48e29c9dd9e3 100644
--- a/rust/kernel/drm/gem/shmem.rs
+++ b/rust/kernel/drm/gem/shmem.rs
@@ -261,6 +261,10 @@ fn gem_obj(&self) -> &bindings::drm_gem_object {
         &self.obj.base
     }
 
+    fn mut_gem_obj(&mut self) -> &mut bindings::drm_gem_object {
+        &mut self.obj.base
+    }
+
     fn from_gem_obj(obj: *mut bindings::drm_gem_object) -> *mut Object<T> {
         // SAFETY: The invariant guarantees this is correct.
         unsafe {

-- 
2.48.1


