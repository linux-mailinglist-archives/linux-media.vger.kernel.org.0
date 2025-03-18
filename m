Return-Path: <linux-media+bounces-28437-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 961F8A67D0C
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 20:25:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D464F19C6B63
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 19:24:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21B1A2139A1;
	Tue, 18 Mar 2025 19:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="OPfECu2S"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D644E1E5217;
	Tue, 18 Mar 2025 19:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742325829; cv=pass; b=IWxAAzU9LKkJFNlOEz3o1c1f1zb4eiOsQ6uMIbkm25duedxKYNOMNbCz/aNU6pdQHgbE8mPBr3u02FfpqpSn7Ai9kpMa8XJTbffF9NGB+jSYdJ13pVgKoA1E34QIPSXB2r/YG1QosOLmiy0Tw1F+BW1IWxNPenf3x2zr/vJ+qOw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742325829; c=relaxed/simple;
	bh=de2jq1yT+RGQkDq8v9mkyCtbheIxKJFWYU8ozp1q1I8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r2oZWlmvLFA2zUqokAC9AJx4mbxUWmyLusLQGGwsPjy1zVr2YpGgAXuBGy1kE1ff8tdP2u008v8paOAoPAyHjp8mA8+MDOmELduAVEFq5UqJPqkNAa3PtXKVkthBdse8gR/967t8JW0OEFvCQmBCiaX0ZvMD8SlGLB9XwLe8gTw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=OPfECu2S; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1742325783; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PTJaz09qFMbDsvagbvsS3rm9wHzpkAY9ZV5xoNNjdwYWo8dG2qShxrXnwuKXXMwLUZhI92VaqKOGglKgdC+MP3iUG/fU+QILWf+fZPQBxw2PHTvWCrYEUViuQTZ4DpKsuTpSyOBycOIlR6EmduZWQCc3f2JDeXeWWQ25QBibN6I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1742325783; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=9wCuwS7UKXaDgrz4jduawpF4mCPLt9l9JKYC4KOue28=; 
	b=XdXiUDcelySLk2ckYEsf5stweq8Yz6iScMd2F9AhMIaH9gen6M5nNXtCJIDdGQ25ETUKCx5BMF/taCXKlO8I8q87IiFPJEEyD64MzJ4IgJchF0OWVK2SVzB4sQtVbJXws87cQ3jKtc2cViwV1D0rDOrot61sdCZzIM8exo3xAiM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1742325783;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=9wCuwS7UKXaDgrz4jduawpF4mCPLt9l9JKYC4KOue28=;
	b=OPfECu2SmR5CTw0zvl0legVF9p8Dj5+hol1B1Qci4h90TRDOCAGN996H/6ccAel6
	o7DkE7aBV5hvC4MOiWgwWo2UQDDXCQag/pBhYti2K0OcK99ViaAxi2Lh1MiQKSR2LNB
	Pi6pQK/KMsUuN/r75o2pZHrbaxafqJljltjdfOho=
Received: by mx.zohomail.com with SMTPS id 1742325779988998.490270205079;
	Tue, 18 Mar 2025 12:22:59 -0700 (PDT)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Tue, 18 Mar 2025 16:22:35 -0300
Subject: [PATCH 1/7] drm/shmem-helper: Add lockdep asserts to vmap/vunmap
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-drm-gem-shmem-v1-1-64b96511a84f@collabora.com>
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

Since commit 21aa27ddc582 ("drm/shmem-helper: Switch to reservation
lock"), the drm_gem_shmem_vmap and drm_gem_shmem_vunmap functions
require that the caller holds the DMA reservation lock for the object.
Add lockdep assertions to help validate this.

Signed-off-by: Asahi Lina <lina@asahilina.net>
Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 5ab351409312b5a0de542df2b636278d6186cb7b..ec89e9499f5f02a2a35713669bf649dd2abb9938 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -338,6 +338,8 @@ int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem,
 	struct drm_gem_object *obj = &shmem->base;
 	int ret = 0;
 
+	dma_resv_assert_held(obj->resv);
+
 	if (obj->import_attach) {
 		ret = dma_buf_vmap(obj->import_attach->dmabuf, map);
 		if (!ret) {
@@ -404,6 +406,8 @@ void drm_gem_shmem_vunmap(struct drm_gem_shmem_object *shmem,
 {
 	struct drm_gem_object *obj = &shmem->base;
 
+	dma_resv_assert_held(obj->resv);
+
 	if (obj->import_attach) {
 		dma_buf_vunmap(obj->import_attach->dmabuf, map);
 	} else {

-- 
2.48.1


