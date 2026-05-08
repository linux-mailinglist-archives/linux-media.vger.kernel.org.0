Return-Path: <linux-media+bounces-60935-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGzsNlgP/mm2mQAAu9opvQ
	(envelope-from <linux-media+bounces-60935-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 18:29:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6C84F9749
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 18:29:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 820AD300AED8
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2026 16:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24D633F660E;
	Fri,  8 May 2026 16:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BJWNlxPI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB98A3FFADA
	for <linux-media@vger.kernel.org>; Fri,  8 May 2026 16:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778257743; cv=none; b=Wx1Db/79hlo2hAINyGOBVnqek1AWz8980JXrbAjTBlu9gKl+WiwlkN4EGdDliGCAliQ2dghMfcUrnDngJRNt++jG4/UOJndX9TyhB4ca0LrxcNlZroNNyppdfVNERMLtL4S9B0LxKymjY0PECywdIM856uVb0Ze4gHbzZvcj7e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778257743; c=relaxed/simple;
	bh=fslODnGrP34cw1XXzt3gj2b4W4Kt6vCsqj4iE3sazao=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JFWX3vYQJm/Lffs7ml/fktucvo8dOnBhLixgBJxb14605om2TxCG9hg1xpQMQ2SFZCsjm8DktT3WlNrPkHxgsGqXlnOA6gFzGoydImu1C0raXcrhzXqZNiLT+Qgaum9+047dSe7TSbLBbR0wrVoiaxA+luIvgXMoadg/I1D2Mis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BJWNlxPI; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8b7105dfb35so20945106d6.3
        for <linux-media@vger.kernel.org>; Fri, 08 May 2026 09:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778257739; x=1778862539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VJ1nt1raVmWGZpEel8fILUUX9Nl0Zn9ZJYTC5Z/rJck=;
        b=BJWNlxPIRI5pP5hqILaTzifN1Nu38hO6o5pFySLnw46sRBfOPXEVZsp/MFNundrZ2+
         PO9/eJ4w++XM5qhDgqhWiepENTCqOwwWOgzPfPSjCvFk44XUP61yLQ53ijAtUXipvpzS
         yoGNfbhaWA2+c5PSb/6v1qwR6pVlJ7prjfNHA+AQTBgqcPWox4QhhJ4fxogBLGOJ5Y22
         4kHfg9ocrNPZAdRHQ3J0I87SuQ5ggth6XUBpEJyXXNt0G1EeirODhs9d0pRFwgaWFLap
         qXH3fP5yUWh7O96mVdpO2JTzwGZrmKYVaHV8yReCwMcWkdwtRSbhydBiZs56zykWrmrK
         C1vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778257739; x=1778862539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VJ1nt1raVmWGZpEel8fILUUX9Nl0Zn9ZJYTC5Z/rJck=;
        b=BY/5L/1d3gwagdSxG6gXmTgnikbOeEtI2Gs7W6ev54zXpGQBZaYBsEJph3xZvtdGze
         RbrWQJaTUabQjcsF+Bh9ldLCl6GTFUXZpziGDYrBi8GQpf5A9Rj/lfnaclpfROt9UtyY
         IRock2kZhWJR4CFEfkVqY7C1qW6cbeNtznKsh2UiBWK8o5y/77qImWKA8z6fRGvn9gBA
         T2/wXZmvbIRlSjYKZWz4M7V5fX6RMA58sMLHXWWAd3ZPX1e1J7G/3VyVf5gnmGjYaDfV
         p52Bm45ocinWTqS+th9+e4rl1/sRxetqX8SIQTjnAWOan+oMzj1AtWb+Mkzf57LAbBzj
         Pdhg==
X-Forwarded-Encrypted: i=1; AFNElJ+i8fQkvYevDGE5RUMPm8kXjZOqDqpScCcs4PnCAsIiMv3Rsql7HBfgPWgVOXkxae0LneD/NsGv8sqfHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxL/WdZbd22Vts6PgfgzSmJ+vqWBNP2xUlxVbRkZh9jNkl081gX
	KmARWQiKag7cfdXlhwD14t98q7I3myf/m294UZ+cynS/NrqHbbZErcmbEnTlvVyE
X-Gm-Gg: Acq92OEnlBmf7mbO1nyV6j4sAWF3fcA/hjh+GYsFFAn77tnmkC2guaCu9BUkjPMpShv
	vnkOi6DD3lThw0dtA6XrH43cLHV/+bGRCabsgCoRZprV4d1Sjtj10CZ4bt6YzQITMYXbKoOmMje
	+J4twXmZmZxlPF99+xt5OtrrJxeDRHQpBqEAyOP/IB/cjf7EpqZV+cs8kTTvK6VyqLHW0c4wH3S
	tBGrzlXlyKtockpf6aBl34PsoUlUEvdApIAqz+dQSQAiUvCxHqZ596xLsXj0ucTyyGw2cZ2HcBI
	5oed5godvKozUS8WZIYTeRCxVk31+F3Q/SOFi4S2SjdYDW3acVAkbWa5q7kldly47qO+61PdcE6
	tUG+SM9YKvfrhIt/0AiUllMmAuL3wdypGkCiT7Uw/DgESswh9HZ5MicLB3t8dNBr82yiDhm2nG7
	a+Drmycyhaos4WxQ+Cx8eVfa3VCgLgTVBLa2myOiz+283+UK4iVNGmS9wXse8xcWavUPIhG4t/H
	g9f0rhyNEzJYOD9nH1QdYynWyDe7k+qf/s5/qbtdE0=
X-Received: by 2002:a05:6214:3f81:b0:89c:a2b2:8d44 with SMTP id 6a1803df08f44-8bc451770demr211625746d6.39.1778257738686;
        Fri, 08 May 2026 09:28:58 -0700 (PDT)
Received: from security.cs.northwestern.edu (security.cs.northwestern.edu. [165.124.184.136])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8bf3b0c4db9sm21343796d6.4.2026.05.08.09.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 09:28:58 -0700 (PDT)
From: Ziyi Guo <guoziyi114@gmail.com>
X-Google-Original-From: Ziyi Guo <n7l8m4@u.northwestern.edu>
To: maciej.falkowski@linux.intel.com,
	karol.wachowski@linux.intel.com
Cc: ogabbay@kernel.org,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	Ziyi Guo <n7l8m4@u.northwestern.edu>
Subject: [PATCH] accel/ivpu: Reject PRIME export of userptr BOs
Date: Fri,  8 May 2026 16:28:56 +0000
Message-Id: <20260508162856.1131843-1-n7l8m4@u.northwestern.edu>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4E6C84F9749
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.84 / 15.00];
	SEM_URIBL(3.50)[northwestern.edu:email];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	TAGGED_FROM(0.00)[bounces-60935-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_ALLOW(0.00)[gmail.com:s=20251104];
	MIME_TRACE(0.00)[0:+];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[guoziyi114@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.018];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c04:e001:36c::/64:c];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,northwestern.edu:email]
X-Rspamd-Action: no action

  Userptr BOs wrap pinned user pages in a private dma-buf solely for
  internal use by the NPU driver. Allowing userspace to re-export such a
  BO via DRM_IOCTL_PRIME_HANDLE_TO_FD would expose those pages to other
  drivers through an interface that was never intended to be shared.

  Override the driver's prime_handle_to_fd callback to detect dma-bufs
  backed by ivpu_gem_userptr_dmabuf_ops and reject the export with
  -EINVAL.

Signed-off-by: Ziyi Guo <n7l8m4@u.northwestern.edu>
---
 drivers/accel/ivpu/ivpu_drv.c         |  1 +
 drivers/accel/ivpu/ivpu_gem.c         | 28 +++++++++++++++++++++++++++
 drivers/accel/ivpu/ivpu_gem.h         |  3 +++
 drivers/accel/ivpu/ivpu_gem_userptr.c |  5 +++++
 4 files changed, 37 insertions(+)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index 2801378e3e19..086d4c769b33 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -545,6 +545,7 @@ static const struct drm_driver driver = {
 
 	.gem_create_object = ivpu_gem_create_object,
 	.gem_prime_import = ivpu_gem_prime_import,
+	.prime_handle_to_fd = ivpu_gem_prime_handle_to_fd,
 
 	.ioctls = ivpu_drm_ioctls,
 	.num_ioctls = ARRAY_SIZE(ivpu_drm_ioctls),
diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
index 4f2005a8d496..82079f372b39 100644
--- a/drivers/accel/ivpu/ivpu_gem.c
+++ b/drivers/accel/ivpu/ivpu_gem.c
@@ -12,6 +12,7 @@
 #include <drm/drm_cache.h>
 #include <drm/drm_debugfs.h>
 #include <drm/drm_file.h>
+#include <drm/drm_prime.h>
 #include <drm/drm_utils.h>
 
 #include "ivpu_drv.h"
@@ -249,6 +250,33 @@ struct drm_gem_object *ivpu_gem_prime_import(struct drm_device *dev,
 	return ERR_PTR(ret);
 }
 
+int ivpu_gem_prime_handle_to_fd(struct drm_device *dev, struct drm_file *file_priv,
+				u32 handle, u32 flags, int *prime_fd)
+{
+	struct ivpu_device *vdev = to_ivpu_device(dev);
+	struct dma_buf *dmabuf;
+	int fd;
+
+	dmabuf = drm_gem_prime_handle_to_dmabuf(dev, file_priv, handle, flags);
+	if (IS_ERR(dmabuf))
+		return PTR_ERR(dmabuf);
+
+	if (ivpu_gem_is_userptr_dma_buf(dmabuf)) {
+		ivpu_dbg(vdev, IOCTL, "Exporting userptr BO is not allowed\n");
+		dma_buf_put(dmabuf);
+		return -EINVAL;
+	}
+
+	fd = dma_buf_fd(dmabuf, flags);
+	if (fd < 0) {
+		dma_buf_put(dmabuf);
+		return fd;
+	}
+
+	*prime_fd = fd;
+	return 0;
+}
+
 static struct ivpu_bo *ivpu_bo_alloc(struct ivpu_device *vdev, u64 size, u32 flags)
 {
 	struct drm_gem_shmem_object *shmem;
diff --git a/drivers/accel/ivpu/ivpu_gem.h b/drivers/accel/ivpu/ivpu_gem.h
index 0c3350f22b55..bfd15ce02354 100644
--- a/drivers/accel/ivpu/ivpu_gem.h
+++ b/drivers/accel/ivpu/ivpu_gem.h
@@ -29,6 +29,9 @@ void ivpu_bo_unbind_all_bos_from_context(struct ivpu_device *vdev, struct ivpu_m
 
 struct drm_gem_object *ivpu_gem_create_object(struct drm_device *dev, size_t size);
 struct drm_gem_object *ivpu_gem_prime_import(struct drm_device *dev, struct dma_buf *dma_buf);
+int ivpu_gem_prime_handle_to_fd(struct drm_device *dev, struct drm_file *file_priv,
+				u32 handle, u32 flags, int *prime_fd);
+bool ivpu_gem_is_userptr_dma_buf(struct dma_buf *dma_buf);
 struct ivpu_bo *ivpu_bo_create(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
 			       struct ivpu_addr_range *range, u64 size, u32 flags);
 struct ivpu_bo *ivpu_bo_create_runtime(struct ivpu_device *vdev, u64 addr, u64 size, u32 flags);
diff --git a/drivers/accel/ivpu/ivpu_gem_userptr.c b/drivers/accel/ivpu/ivpu_gem_userptr.c
index 7cbf3a4cdc73..45eabea5961e 100644
--- a/drivers/accel/ivpu/ivpu_gem_userptr.c
+++ b/drivers/accel/ivpu/ivpu_gem_userptr.c
@@ -61,6 +61,11 @@ static const struct dma_buf_ops ivpu_gem_userptr_dmabuf_ops = {
 	.release = ivpu_gem_userptr_dmabuf_release,
 };
 
+bool ivpu_gem_is_userptr_dma_buf(struct dma_buf *dma_buf)
+{
+	return dma_buf->ops == &ivpu_gem_userptr_dmabuf_ops;
+}
+
 static struct dma_buf *
 ivpu_create_userptr_dmabuf(struct ivpu_device *vdev, void __user *user_ptr,
 			   size_t size, uint32_t flags)
-- 
2.34.1


