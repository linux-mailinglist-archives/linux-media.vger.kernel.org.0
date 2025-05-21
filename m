Return-Path: <linux-media+bounces-33065-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8F4ABFE77
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 22:51:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7AB011BC5E61
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 20:51:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83D532BE0E1;
	Wed, 21 May 2025 20:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ac+wvX6U"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496771FBC8D
	for <linux-media@vger.kernel.org>; Wed, 21 May 2025 20:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747860462; cv=none; b=RR9Dzuo85Uu9xCkNpYcyZr+uj67lkjaqT7YUoIOPhYtLmUbeOivvxOKHAt2QOukWE04t+cDOZKokiW2HlN0Vc3MKzCg2UyPSUMBKgrQjFhRnyHa+x3AsV/JPHSGUvAQhek1CB9oYlfciOWBcT1SRflvGVsZ1GZmyX2D5oExtewA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747860462; c=relaxed/simple;
	bh=0c2oplzE7ye6DqYq04TMP1x07rAa307O9OXTTRZnud4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L0YQk5XYyB8YxATmLEhtRrpjxKQajvZN+RSspaXpMa+ay/ucWfLs6CbATIL/4uCeGuYAaXadIYhvxGYiEEwuATHIGNC1/mOZSxfUvifhrTtEsxBKp6Rbb4CVjbFJgXANTxF3ToFwzwIGA3NJ0qGP4peUtsQVL6ycVduQs0LOwIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ac+wvX6U; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747860460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pDc7UrnplZlvIH+UwUNJeqjQtwIG9fWAmJ0c6OZ2V0k=;
	b=ac+wvX6U/Qe+SeHoWZibHGMlk3cIZdDJBf3wR8SNyuQ6B/Lg/ysPlNEoiENPqqwtMq+3ap
	QgAU7Wo5BooNz7qGwcRjWhnaYP82Um0StjYnowpQsYTXwaJugFALC/kpBCVP4HWlULqWS1
	opnffEyyIZf18+clO2UXr5syzLE0fmY=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-457-80NufYDvOvmNHzpndZQ9SQ-1; Wed,
 21 May 2025 16:47:35 -0400
X-MC-Unique: 80NufYDvOvmNHzpndZQ9SQ-1
X-Mimecast-MFC-AGG-ID: 80NufYDvOvmNHzpndZQ9SQ_1747860453
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B6B74180035C;
	Wed, 21 May 2025 20:47:31 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.80.100])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 34EC119560B7;
	Wed, 21 May 2025 20:47:26 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Asahi Lina <lina@asahilina.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b),
	linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b)
Subject: [PATCH v2 02/12] rust: drm: gem: Add raw_dma_resv() function
Date: Wed, 21 May 2025 16:29:09 -0400
Message-ID: <20250521204654.1610607-3-lyude@redhat.com>
In-Reply-To: <20250521204654.1610607-1-lyude@redhat.com>
References: <20250521204654.1610607-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

For retrieving a pointer to the struct dma_resv for a given GEM object. We
also introduce it in a new trait, BaseObjectPrivate, which we automatically
implement for all gem objects and don't expose to users outside of the
crate.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/gem/mod.rs | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index 992e098d0a3e2..1165417b22df6 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -186,6 +186,17 @@ fn create_mmap_offset(&self) -> Result<u64> {
 
 impl<T: IntoGEMObject> BaseObject for T {}
 
+/// Crate-private base operations shared by all GEM object classes.
+pub(crate) trait BaseObjectPrivate: IntoGEMObject {
+    /// Return a pointer to this object's dma_resv.
+    fn raw_dma_resv(&self) -> *mut bindings::dma_resv {
+        // SAFETY: `as_gem_obj()` always returns a valid pointer to the base DRM gem object
+        unsafe { (*self.as_raw()).resv }
+    }
+}
+
+impl<T: IntoGEMObject> BaseObjectPrivate for T {}
+
 /// A base GEM object.
 ///
 /// Invariants
-- 
2.49.0


