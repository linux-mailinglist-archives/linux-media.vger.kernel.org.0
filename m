Return-Path: <linux-media+bounces-50244-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D70DD04666
	for <lists+linux-media@lfdr.de>; Thu, 08 Jan 2026 17:32:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F3BD63086E32
	for <lists+linux-media@lfdr.de>; Thu,  8 Jan 2026 16:08:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 917BA2773E4;
	Thu,  8 Jan 2026 16:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="q3tZU6rZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFEB723F424
	for <linux-media@vger.kernel.org>; Thu,  8 Jan 2026 16:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767888470; cv=none; b=VzcSx7jwKpOrR0HuYgjx01ZNcmwJXQDi2PGGzK6a6YML8wjoVknTt2nlDoPUsrdEWVe63Wxo5zWbiVFLdwQHagYyxmvm2Cq/+xoTMgV97dz30+ErfM3UIM6tQolzKfTk2RPIHu/M+mqu1wdVww19eRHO79vRWkS6+9LDYc+VWIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767888470; c=relaxed/simple;
	bh=mTf9sEcGsq5pgH+vC0cGQE5wZ2mcdJc0+XxHsynqTVc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Xm5bxwt9BIl8NuwPpTSCBDtpsqKYorOr1RNPWrVwBDFSmECS+T6aLXlX3bDutE+wPKYfIsHx88fL76Ao3ACNbxe4ay87PtM8aoakbrD5DGNEkIqH1q5iIci7B3MDr2oj6CBdtFCYdj5rD1hfo2UG0+gs/VZ+0F8YqVIDhwCtQmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=q3tZU6rZ; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-47918084ac1so36747095e9.2
        for <linux-media@vger.kernel.org>; Thu, 08 Jan 2026 08:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767888467; x=1768493267; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RTU34pB0E2OaLk5IsIU7Xzr9z7ILQq/Tcx7w31PZfiw=;
        b=q3tZU6rZcvbZ6Sr/wqFpAGm+GckDhUdi2ksceOVOrWX9bWSJDVAvBFmzIYmDMbnOYI
         Vk+KSh+m33nl0/SA8sJ+OKvnQMWxHTtpSTwA9QL+vh5aT0vQfEWnSQ3aBrvrKp3JKOV1
         9yS20sw2A0ZcAPObtMRQ3o1OCkgG1r6QPpIuY0tCPILs82KRvWI8t2Ug/j7YDgzGskOF
         FigR81+aTPHR763wGjL2ZhX8GzP4ooWAiGe8rF+27kio/g075aYVp/AgRWXsnYhj9lb4
         7l6DOkO95+fCKALgSA1Wuc13T1Ki41oEeSoQKKFewGqRxlUG5JZNDH3j05ii8321JOO4
         clig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767888467; x=1768493267;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RTU34pB0E2OaLk5IsIU7Xzr9z7ILQq/Tcx7w31PZfiw=;
        b=FCtNl2AqkyjG9ngCGjCWNDI0vfflRD3gd3qkEKBT5Sl4YrBj655WdpTo4lQoOpNzS0
         xTA1Sauxrr+DhCaf7Y6LEN9vA2cu4FcrEfivEf06iUK2N4sC0pPAkh3VSI/Ff3PqYGtH
         FhqYVxMzypKNHuwCxmkP/OQsBPe2SdTLyWrXzMpp0QHuZ3pB9cQ19r086jy3dE7mAWBy
         i1DeABn1haxaS36vIgmkOwIHWTgdEDNIW0Zxce0feeI3yFw/nqg4MlMCzhx2am47/hDW
         nI3G6iX0S+uWpWvbJn3BDEi9hLEWLY/iMlL/Tjd4G2lc/hU8ocxta+mzLDBHCcBhs4Mb
         J4Qw==
X-Forwarded-Encrypted: i=1; AJvYcCUmXUzANWhvvq079o17q6CsGsdOOkZ9nTyYxpFQqwMadP0CsRrE7Zlsf/zTXvK9YnZ0MQfYNoVZvw1ZKg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy18sEg+qvQWi34nEt6Gnemruk4VBRRC4Ofi/FOWUnUnkdnqNs7
	epsjSLVcl4xRtmoQV83mFGG1xZGahaBPOOjm1V+lABmMzIYQaUkICVMJR2kF32kZBEKm3q/9Pr8
	TJ/oqfW9P1dWU08Tm2Q==
X-Google-Smtp-Source: AGHT+IEquxao2u1gznMz6rOAlJNtr2hfkXjG6QXyfJHOZSmePEaS0s7pdoUwoBL4bEbheT3Ui1GPkLcXyFhqTH4=
X-Received: from wmlu20.prod.google.com ([2002:a05:600c:2114:b0:476:ddb0:2391])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:19c9:b0:477:63db:c718 with SMTP id 5b1f17b1804b1-47d84b18215mr89064215e9.16.1767888467119;
 Thu, 08 Jan 2026 08:07:47 -0800 (PST)
Date: Thu, 08 Jan 2026 16:07:33 +0000
In-Reply-To: <20260108-gpuvm-rust-v2-0-dbd014005a0b@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260108-gpuvm-rust-v2-0-dbd014005a0b@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2788; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=mTf9sEcGsq5pgH+vC0cGQE5wZ2mcdJc0+XxHsynqTVc=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpX9ZN0vyDZHPBSzdApEZIrAWhg/xXzI4Hqqp2Y
 reFFBJ1ZRmJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaV/WTQAKCRAEWL7uWMY5
 RhDSD/9oS18fSxYtpssxJynIAl9zae7i/jMxhAf+WNL06D3t4H9+yTlvcWgCKbBA/Nrwzd2Vt6O
 FHBDIa3tfaRsnyvCll+BhfZzhDo92RMLc1hkDYU9yVKjdM4TrN9omieV7xu2XPq2lTGnQecJU4f
 0HxGzt9bHytLn1rRzRNoRH85MDnQ+svAxPLs9rJP5z5nHvbd3HQAVP5W2jroMtd90Ls3BRXBMfb
 DFzSA54wm3Lugc/3SQEvkm27nN8aXKaGnKTaBiK4AgaWXTTBYGPcHL/rDOAGUmGjOJr/jTO0e1T
 qO7L5FN78bFKm3aTNvp9d3VCIA5vVwRyT+1VMhE7NEJ5Bm9VR6f88yvvMjoDddeRkRR4gpXIlBs
 xSaHdJO+wCNTkMaKGF9eAdJc3PfNQVSa1KUr+gPWCzzUddSkyRDDN0yLXoVc+T4H8JBa5nLpVPs
 9/8Z2YYt0YOTk9cOStAPEETLxS+0CqNUBGUOHySuIWN5loXveaKosADgoh0dqIJrWm/MA3WjKIS
 N3qjC6DaFlaBcjD4Fmpd/Gi8jQcab/Amn/AxypbqGu6vo3oDog42GwCZi5ZDABpjJtJqsf16Kl7
 aNrG+LE3ZOhVwc1OVFLrrbHP1EN3VkZzQnlr8GbkQSuyn+rU19wm7A3pFRf1uwEz+jKknTXRC7h /AAfJ5EnTSZ+RqQ==
X-Mailer: b4 0.14.2
Message-ID: <20260108-gpuvm-rust-v2-3-dbd014005a0b@google.com>
Subject: [PATCH v2 3/3] drm/gpuvm: use const for drm_gpuva_op_* ptrs
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>
Cc: Matthew Brost <matthew.brost@intel.com>, 
	"=?utf-8?q?Thomas_Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Lyude Paul <lyude@redhat.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	"=?utf-8?q?Christian_K=C3=B6nig?=" <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	nouveau@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	linux-media@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

These methods just read the values stored in the op pointers without
modifying them, so it is appropriate to use const ptrs here.

This allows us to avoid const -> mut pointer casts in Rust.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/gpu/drm/drm_gpuvm.c | 6 +++---
 include/drm/drm_gpuvm.h     | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index 37f0d97f653466285f036a5bf0246a5fea0234cd..6dfa9a3a90c17083d8c119c3b9509519c83e8d8b 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -2295,7 +2295,7 @@ EXPORT_SYMBOL_GPL(drm_gpuvm_interval_empty);
 void
 drm_gpuva_map(struct drm_gpuvm *gpuvm,
 	      struct drm_gpuva *va,
-	      struct drm_gpuva_op_map *op)
+	      const struct drm_gpuva_op_map *op)
 {
 	drm_gpuva_init_from_op(va, op);
 	drm_gpuva_insert(gpuvm, va);
@@ -2315,7 +2315,7 @@ EXPORT_SYMBOL_GPL(drm_gpuva_map);
 void
 drm_gpuva_remap(struct drm_gpuva *prev,
 		struct drm_gpuva *next,
-		struct drm_gpuva_op_remap *op)
+		const struct drm_gpuva_op_remap *op)
 {
 	struct drm_gpuva *va = op->unmap->va;
 	struct drm_gpuvm *gpuvm = va->vm;
@@ -2342,7 +2342,7 @@ EXPORT_SYMBOL_GPL(drm_gpuva_remap);
  * Removes the &drm_gpuva associated with the &drm_gpuva_op_unmap.
  */
 void
-drm_gpuva_unmap(struct drm_gpuva_op_unmap *op)
+drm_gpuva_unmap(const struct drm_gpuva_op_unmap *op)
 {
 	drm_gpuva_remove(op->va);
 }
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 0d3fc1f6cac9966a42f3bc82b0b491bfefaf5b96..655bd9104ffb24170fca14dfa034ee79f5400930 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -1121,7 +1121,7 @@ void drm_gpuva_ops_free(struct drm_gpuvm *gpuvm,
 			struct drm_gpuva_ops *ops);
 
 static inline void drm_gpuva_init_from_op(struct drm_gpuva *va,
-					  struct drm_gpuva_op_map *op)
+					  const struct drm_gpuva_op_map *op)
 {
 	va->va.addr = op->va.addr;
 	va->va.range = op->va.range;
@@ -1265,13 +1265,13 @@ int drm_gpuvm_sm_unmap_exec_lock(struct drm_gpuvm *gpuvm, struct drm_exec *exec,
 
 void drm_gpuva_map(struct drm_gpuvm *gpuvm,
 		   struct drm_gpuva *va,
-		   struct drm_gpuva_op_map *op);
+		   const struct drm_gpuva_op_map *op);
 
 void drm_gpuva_remap(struct drm_gpuva *prev,
 		     struct drm_gpuva *next,
-		     struct drm_gpuva_op_remap *op);
+		     const struct drm_gpuva_op_remap *op);
 
-void drm_gpuva_unmap(struct drm_gpuva_op_unmap *op);
+void drm_gpuva_unmap(const struct drm_gpuva_op_unmap *op);
 
 /**
  * drm_gpuva_op_remap_to_unmap_range() - Helper to get the start and range of

-- 
2.52.0.351.gbe84eed79e-goog


