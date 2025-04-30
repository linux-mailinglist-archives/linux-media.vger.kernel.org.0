Return-Path: <linux-media+bounces-31395-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA75AA4626
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 11:00:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A35D61C00A3A
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 09:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F4AB21D3FD;
	Wed, 30 Apr 2025 08:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="nieKerRv"
X-Original-To: linux-media@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0365521C19B;
	Wed, 30 Apr 2025 08:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746003541; cv=none; b=IeRk0E+eolP7vM7fZQSgYh3fiquWpl3+FCklFAOJFLunjmxDGVHGiGyVgFhi53v3i9I57iFUQU9WaI5/r22++uBZZ2374XmT1JYWZeFl8vSGF88JU+jYKWI6iWVl0ZNpJRXj0/8HrkbTLtZa+YmkLNSONYjKhXSLQh6iX6mKdVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746003541; c=relaxed/simple;
	bh=zU0+RXXmztKoSwSkuceVsulTWenam3UOqTrV486ysVU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XQVSxXG+J6K6W4yn3wYBfpbPhppjLpQXdghjpa7IuCPJd917mRnH8ryGyMiBHn14eI0qY7fmx0qxnwviYSi+f9UnGYCHsQRTxtDp7BEeSJ4A0fViQzgaqGhbstSdGZIPdnjBCP7O0CBy/apNJzXwIIVqMO9W+QeoH+LtkEDEuD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=nieKerRv; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=VjGK2
	U//qa5zU2g/W3rDAI5DX37UsbjUdTqEkHSBYQc=; b=nieKerRvp0+jKgnHyLjuJ
	Ko1DdG3K5qv9HDR7CPQvYPBVTZ4Uz10cevI/Ld+CAdXkYZhoXTgJElXJ0h9hPTvw
	Nck4vqQA2fwl2eSah+UlyQwojJSSpKcKO19/ADBqm5Cr/+Epqlo8Qxtl2IzbOmrS
	kUaiv6bD9aYj0F42I+HoyM=
Received: from localhost.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgD351ze5RFo2yEaBg--.45889S4;
	Wed, 30 Apr 2025 16:58:00 +0800 (CST)
From: oushixiong1025@163.com
To: Sumit Semwal <sumit.semwal@linaro.org>
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Dave Airlie <airlied@redhat.com>,
	Sean Paul <sean@poorly.run>,
	Shixiong Ou <oushixiong@kylinos.cn>
Subject: [PATCH 3/3] drm/udl: Use the default gem_prime_import function
Date: Wed, 30 Apr 2025 16:56:58 +0800
Message-Id: <20250430085658.540746-3-oushixiong1025@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250430085658.540746-1-oushixiong1025@163.com>
References: <20250430085658.540746-1-oushixiong1025@163.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PCgvCgD351ze5RFo2yEaBg--.45889S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFy8tr4DGFWUKw4xZw47Jwb_yoW8GF4kpF
	43G34IkrWjqF4kKw13Aw4xAa45Ca17GayIgr48Jwna9F4vyr1UJFy5JFyFy3srAr97GF13
	tF1vyryUAF48KFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jxfHUUUUUU=
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/1tbiXRc-D2gR5W4O-wABs4

From: Shixiong Ou <oushixiong@kylinos.cn>

Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
---
 drivers/gpu/drm/udl/udl_drv.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_drv.c
index c00d8b8834f2..8107549b12e5 100644
--- a/drivers/gpu/drm/udl/udl_drv.c
+++ b/drivers/gpu/drm/udl/udl_drv.c
@@ -49,22 +49,6 @@ static int udl_usb_reset_resume(struct usb_interface *interface)
 	return drm_mode_config_helper_resume(dev);
 }
 
-/*
- * FIXME: Dma-buf sharing requires DMA support by the importing device.
- *        This function is a workaround to make USB devices work as well.
- *        See todo.rst for how to fix the issue in the dma-buf framework.
- */
-static struct drm_gem_object *udl_driver_gem_prime_import(struct drm_device *dev,
-							  struct dma_buf *dma_buf)
-{
-	struct udl_device *udl = to_udl(dev);
-
-	if (!udl->dmadev)
-		return ERR_PTR(-ENODEV);
-
-	return drm_gem_prime_import_dev(dev, dma_buf, udl->dmadev);
-}
-
 DEFINE_DRM_GEM_FOPS(udl_driver_fops);
 
 static const struct drm_driver driver = {
@@ -73,7 +57,6 @@ static const struct drm_driver driver = {
 	/* GEM hooks */
 	.fops = &udl_driver_fops,
 	DRM_GEM_SHMEM_SIMPLE_DRIVER_OPS,
-	.gem_prime_import = udl_driver_gem_prime_import,
 	DRM_FBDEV_SHMEM_DRIVER_OPS,
 
 	.name = DRIVER_NAME,
-- 
2.17.1


