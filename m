Return-Path: <linux-media+bounces-26-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45EAA7E7EE9
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 18:48:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EFA83281890
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 17:48:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83E583C063;
	Fri, 10 Nov 2023 17:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E3E3A28B
	for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 17:46:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60038A27A
	for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 00:53:03 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23328C433C8;
	Fri, 10 Nov 2023 08:53:01 +0000 (UTC)
Message-ID: <35ee2d37-949a-4878-b27b-b8431f685efb@xs4all.nl>
Date: Fri, 10 Nov 2023 09:53:00 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: [PATCH] media: drop CONFIG_MEDIA_CONTROLLER_REQUEST_API
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

This config option was added during the development of the Request API
to make it easy to disable it.

The Request API is now stable so it is time to drop this option altogether.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index c7a54d82a55e..9295ded50bc3 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -685,10 +685,8 @@ static void fill_buf_caps(struct vb2_queue *q, u32 *caps)
 		*caps |= V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF;
 	if (q->allow_cache_hints && q->io_modes & VB2_MMAP)
 		*caps |= V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS;
-#ifdef CONFIG_MEDIA_CONTROLLER_REQUEST_API
 	if (q->supports_requests)
 		*caps |= V4L2_BUF_CAP_SUPPORTS_REQUESTS;
-#endif
 }

 static void validate_memory_flags(struct vb2_queue *q,
diff --git a/drivers/media/mc/Kconfig b/drivers/media/mc/Kconfig
index 375b09612981..c82b07d2ef36 100644
--- a/drivers/media/mc/Kconfig
+++ b/drivers/media/mc/Kconfig
@@ -11,10 +11,3 @@ config MEDIA_CONTROLLER_DVB
 	  Enable the media controller API support for DVB.

 	  This is currently experimental.
-
-config MEDIA_CONTROLLER_REQUEST_API
-	bool
-	depends on MEDIA_CONTROLLER
-	help
-	  This option enables the Request API for the Media controller and V4L2
-	  interfaces. It is currently needed by a few stateless codec drivers.
diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
index 8cee956e38d4..c0dd4ae57227 100644
--- a/drivers/media/mc/mc-device.c
+++ b/drivers/media/mc/mc-device.c
@@ -372,16 +372,12 @@ static long media_device_get_topology(struct media_device *mdev, void *arg)

 static long media_device_request_alloc(struct media_device *mdev, void *arg)
 {
-#ifdef CONFIG_MEDIA_CONTROLLER_REQUEST_API
 	int *alloc_fd = arg;

 	if (!mdev->ops || !mdev->ops->req_validate || !mdev->ops->req_queue)
 		return -ENOTTY;

 	return media_request_alloc(mdev, alloc_fd);
-#else
-	return -ENOTTY;
-#endif
 }

 static long copy_arg_from_user(void *karg, void __user *uarg, unsigned int cmd)
diff --git a/drivers/media/platform/mediatek/vcodec/Kconfig b/drivers/media/platform/mediatek/vcodec/Kconfig
index 74b00eb1bc97..bc8292232530 100644
--- a/drivers/media/platform/mediatek/vcodec/Kconfig
+++ b/drivers/media/platform/mediatek/vcodec/Kconfig
@@ -24,7 +24,6 @@ config VIDEO_MEDIATEK_VCODEC
 	select V4L2_H264
 	select V4L2_VP9
 	select MEDIA_CONTROLLER
-	select MEDIA_CONTROLLER_REQUEST_API
 	help
 	  Mediatek video codec driver provides HW capability to
 	  encode and decode in a range of video formats on MT8173
diff --git a/drivers/media/platform/nvidia/tegra-vde/Kconfig b/drivers/media/platform/nvidia/tegra-vde/Kconfig
index f7454823bbbb..2fe13f39c95b 100644
--- a/drivers/media/platform/nvidia/tegra-vde/Kconfig
+++ b/drivers/media/platform/nvidia/tegra-vde/Kconfig
@@ -6,7 +6,6 @@ config VIDEO_TEGRA_VDE
 	select DMA_SHARED_BUFFER
 	select IOMMU_IOVA
 	select MEDIA_CONTROLLER
-	select MEDIA_CONTROLLER_REQUEST_API
 	select SRAM
 	select VIDEOBUF2_DMA_CONTIG
 	select VIDEOBUF2_DMA_SG
diff --git a/drivers/media/platform/verisilicon/Kconfig b/drivers/media/platform/verisilicon/Kconfig
index e65b836b9d78..24b927d8f182 100644
--- a/drivers/media/platform/verisilicon/Kconfig
+++ b/drivers/media/platform/verisilicon/Kconfig
@@ -8,7 +8,6 @@ config VIDEO_HANTRO
 	depends on V4L_MEM2MEM_DRIVERS
 	depends on VIDEO_DEV
 	select MEDIA_CONTROLLER
-	select MEDIA_CONTROLLER_REQUEST_API
 	select VIDEOBUF2_DMA_CONTIG
 	select VIDEOBUF2_VMALLOC
 	select V4L2_MEM2MEM_DEV
diff --git a/drivers/media/test-drivers/Kconfig b/drivers/media/test-drivers/Kconfig
index 459b433e9fae..5a5379524bde 100644
--- a/drivers/media/test-drivers/Kconfig
+++ b/drivers/media/test-drivers/Kconfig
@@ -12,7 +12,6 @@ config VIDEO_VIM2M
 	select VIDEOBUF2_VMALLOC
 	select V4L2_MEM2MEM_DEV
 	select MEDIA_CONTROLLER
-	select MEDIA_CONTROLLER_REQUEST_API
 	help
 	  This is a virtual test device for the memory-to-memory driver
 	  framework.
diff --git a/drivers/media/test-drivers/vicodec/Kconfig b/drivers/media/test-drivers/vicodec/Kconfig
index a7a828eec2a4..4ea0689c3abe 100644
--- a/drivers/media/test-drivers/vicodec/Kconfig
+++ b/drivers/media/test-drivers/vicodec/Kconfig
@@ -5,7 +5,6 @@ config VIDEO_VICODEC
 	select VIDEOBUF2_VMALLOC
 	select V4L2_MEM2MEM_DEV
 	select MEDIA_CONTROLLER
-	select MEDIA_CONTROLLER_REQUEST_API
 	help
 	  Driver for a Virtual Codec

diff --git a/drivers/media/test-drivers/visl/Kconfig b/drivers/media/test-drivers/visl/Kconfig
index 7508b904f196..37be9f267224 100644
--- a/drivers/media/test-drivers/visl/Kconfig
+++ b/drivers/media/test-drivers/visl/Kconfig
@@ -7,7 +7,6 @@ config VIDEO_VISL
 	select VIDEOBUF2_VMALLOC
 	select V4L2_MEM2MEM_DEV
 	select MEDIA_CONTROLLER
-	select MEDIA_CONTROLLER_REQUEST_API
 	select VIDEO_V4L2_TPG
 	help

diff --git a/drivers/media/test-drivers/vivid/Kconfig b/drivers/media/test-drivers/vivid/Kconfig
index 5b08a5ad291e..ec2e71d76965 100644
--- a/drivers/media/test-drivers/vivid/Kconfig
+++ b/drivers/media/test-drivers/vivid/Kconfig
@@ -10,7 +10,6 @@ config VIDEO_VIVID
 	select VIDEOBUF2_DMA_CONTIG
 	select VIDEO_V4L2_TPG
 	select MEDIA_CONTROLLER
-	select MEDIA_CONTROLLER_REQUEST_API
 	help
 	  Enables a virtual video driver. This driver emulates a webcam,
 	  TV, S-Video and HDMI capture hardware, including VBI support for
diff --git a/drivers/staging/media/rkvdec/Kconfig b/drivers/staging/media/rkvdec/Kconfig
index e963d60cc6ad..5f3bdd848a2c 100644
--- a/drivers/staging/media/rkvdec/Kconfig
+++ b/drivers/staging/media/rkvdec/Kconfig
@@ -4,7 +4,6 @@ config VIDEO_ROCKCHIP_VDEC
 	depends on ARCH_ROCKCHIP || COMPILE_TEST
 	depends on VIDEO_DEV
 	select MEDIA_CONTROLLER
-	select MEDIA_CONTROLLER_REQUEST_API
 	select VIDEOBUF2_DMA_CONTIG
 	select VIDEOBUF2_VMALLOC
 	select V4L2_MEM2MEM_DEV
diff --git a/drivers/staging/media/sunxi/cedrus/Kconfig b/drivers/staging/media/sunxi/cedrus/Kconfig
index 621944f9907a..cb07a343c9c2 100644
--- a/drivers/staging/media/sunxi/cedrus/Kconfig
+++ b/drivers/staging/media/sunxi/cedrus/Kconfig
@@ -6,7 +6,6 @@ config VIDEO_SUNXI_CEDRUS
 	depends on HAS_DMA
 	depends on OF
 	select MEDIA_CONTROLLER
-	select MEDIA_CONTROLLER_REQUEST_API
 	select SUNXI_SRAM
 	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_MEM2MEM_DEV

