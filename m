Return-Path: <linux-media+bounces-50525-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BDDD178CA
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 10:15:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 25C7330CF7D2
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 09:08:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69CBC381700;
	Tue, 13 Jan 2026 09:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cTaPW2xo"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFA83815C5
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 09:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768295286; cv=none; b=GlTBz/Xy2u5qycpZQgZvOKo4tNGd/vB2r83zCKSuq2wZXUDM+KL+y9l2FJ8Wb4zrRHFI/Z5mv4ubRc9rbSeJlNydT4ds3L/Ktehc6Cvw3xgBiQK5Dlt51pyTp55Y+K1HKkXTW90jGrxQ9LuzYyUScr5U4tsNcDyxMFBy7L1UKJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768295286; c=relaxed/simple;
	bh=scL/K3QjQ0/H8hzHNz3K8wFS/aDLqPs9oUM5JEDk+U0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nte1KkN7IsMVY5+PUYtqJCZCGXGilnS09NQ709ijjyv2e0iN30nQBInEPxRWtUr9G/7Bg3s8Ddg9XlnJE8kKcrSE1bHUzswp/S76v0XNdiie4XqMUXCdgDssdMs4nUVNGKVcEMTHkYrIfRwfNeGnsbagBh7tMXb3Uq/FDwXaw8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cTaPW2xo; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:a473:c554:ed1f:46ad:1ead])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7C9782E0;
	Tue, 13 Jan 2026 10:07:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768295258;
	bh=scL/K3QjQ0/H8hzHNz3K8wFS/aDLqPs9oUM5JEDk+U0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cTaPW2xoYQ4h5xOnBjzYVUmUJb4IVh6FOI8IM3fLIYHhJd82dXanhXjICfLquJlo3
	 paVsa9/Nq1nryRY7dG7dWswGq6JK2J3YeJsDjamWLlJHysym4Hp7PIYkSq0YkCr1ZJ
	 ZtwqTVuu0o/pfWBeoN/EwPMfAxXNcDqHUUNiL/0Q=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Tue, 13 Jan 2026 14:35:26 +0530
Subject: [PATCH 06/10] media: uapi: v4l-ctrls: Add CID base for the
 bcm2835-isp driver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260113-b4-vchiq-isp-v1-6-ea0b300bffc8@ideasonboard.com>
References: <20260113-b4-vchiq-isp-v1-0-ea0b300bffc8@ideasonboard.com>
In-Reply-To: <20260113-b4-vchiq-isp-v1-0-ea0b300bffc8@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Naushir Patuck <naush@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-media@vger.kernel.org, Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6622;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=Qsff1fosFHVeYD4/9z9e94GrIj8Lgf4vkb1cJ2u5WKg=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpZgtIzdm1gUEigeQFe+BcXCORRzU8+DahGs3gd
 JaWTil7DFWJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaWYLSAAKCRBD3pH5JJpx
 RYsRD/98jYJeNK7BRqmchxTCfVwgwqvWoibpuwHHIEFmzC60E8mv8uBq2S583KeSFuG0NzOYQCM
 zpgaco9lJBc0r7Fco42l34e+X1N81nj51hYCtAG0NmdV7BchJO5dulT8LY6BgNS5O8L4kqstYr1
 jek+DKhfyxP9AvXYst511XFCJDP3UtpLB9/3ON8GSyftBG1/+iSBaz7ChGz+/3fp34buStEjihi
 QixenlA6J2LsNnuLqiBIeFwIOMW0xn5Oyp6uztnwW0jJmwcPNI/xiy3PTEns+t8SMNkYZyxnsiH
 3L59toZKrwUizoD2dpQdsoiKoWJ+R/Avio/HZzUZ6l93XeWj3RDIXb+hTkAXcgu0NdfVFEfdE1g
 710qhRlmkzmT3fEpEK22QXC5RsEcU8t287WQkEPYIOzq33QlBpfcX+WQfdLJlcOBVs7AJZDiJ6J
 ej7Q5gVApgmCi4zz5JVzfoqhq+VpKfjlLwDSQWvurR1GgEdNec5qA/RV092mBEcapIUHOeONCmq
 fCOmlFDcM6YN/htCai4Gz9SSQcmy5m0llfKZbrp4LX1GbOKK3ALd59y+FnE0mLDePUjI+/DeDkI
 yKSHMhlS+SJZzdnLzlDtOZbHJOAMSx0V0ror4wZYPb1AE0stwXvL1gTccbM+p0jjtWK8fbq8WJ8
 K6tK8E03cpeHiVw==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: Naushir Patuck <naush@raspberrypi.com>

We are reserving controls for the new bcm2835-isp driver.

Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 Documentation/admin-guide/media/bcm2835-isp.rst    | 127 +++++++++++++++++++++
 .../userspace-api/media/drivers/index.rst          |   1 +
 include/uapi/linux/v4l2-controls.h                 |   6 +
 3 files changed, 134 insertions(+)

diff --git a/Documentation/admin-guide/media/bcm2835-isp.rst b/Documentation/admin-guide/media/bcm2835-isp.rst
new file mode 100644
index 0000000000000000000000000000000000000000..e1c19f78435e6b14d051607b6a8b0d4f442f0314
--- /dev/null
+++ b/Documentation/admin-guide/media/bcm2835-isp.rst
@@ -0,0 +1,127 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+BCM2835 ISP Driver
+==================
+
+Introduction
+------------
+
+The BCM2835 Image Sensor Pipeline (ISP) is a fixed function hardware pipeline
+for performing image processing operations.  Images are fed to the input
+of the ISP through memory frame buffers.  These images may be in various YUV,
+RGB, or Bayer formats.  A typical use case would have Bayer images obtained from
+an image sensor by the BCM2835 Unicam peripheral, written to a memory
+frame buffer, and finally fed into the input of the ISP.  Two concurrent output
+images may be generated in YUV or RGB format at different resolutions.
+Statistics output is also generated for Bayer input images.
+
+The bcm2835-isp driver exposes the following media pads as V4L2 device nodes:
+
+.. tabularcolumns:: |l|l|l|l|
+
+.. cssclass: longtable
+
+.. flat-table::
+
+    * - *Pad*
+      - *Direction*
+      - *Purpose*
+      - *Formats*
+
+    * - "bcm2835-isp0-output0"
+      - sink
+      - Accepts Bayer, RGB or YUV format frame buffers as input to the ISP HW
+        pipeline.
+      - :ref:`RAW8 <V4L2-PIX-FMT-SRGGB8>`,
+        :ref:`RAW10P <V4L2-PIX-FMT-SRGGB10P>`,
+        :ref:`RAW12P <V4L2-PIX-FMT-SRGGB12P>`,
+        :ref:`RAW14P <V4L2-PIX-FMT-SRGGB14P>`,
+        :ref:`RAW16 <V4L2-PIX-FMT-SRGGB16>`,
+        :ref:`RGB24/BGR24 <V4L2-PIX-FMT-RGB24>`,
+        :ref:`YUYV <V4L2-PIX-FMT-YUYV>`,
+        :ref:`YVYU <V4L2-PIX-FMT-YVYU>`,
+        :ref:`UYVY <V4L2-PIX-FMT-UYVY>`,
+        :ref:`VYUY <V4L2-PIX-FMT-VYUY>`,
+        :ref:`YUV420/YVU420 <V4L2-PIX-FMT-YUV420>`
+
+    * - "bcm2835-isp0-capture1"
+      - source
+      - High resolution YUV or RGB processed output from the ISP.
+      - :ref:`RGB565 <V4L2-PIX-FMT-RGB565>`,
+        :ref:`RGB24/BGR24 <V4L2-PIX-FMT-RGB24>`,
+        :ref:`ABGR32 <V4L2-PIX-FMT-ABGR32>`,
+        :ref:`YUYV <V4L2-PIX-FMT-YUYV>`,
+        :ref:`YVYU <V4L2-PIX-FMT-YVYU>`,
+        :ref:`UYVY <V4L2-PIX-FMT-UYVY>`,
+        :ref:`VYUY <V4L2-PIX-FMT-VYUY>`.
+        :ref:`YUV420/YVU420 <V4L2-PIX-FMT-YUV420>`,
+        :ref:`NV12/NV21 <V4L2-PIX-FMT-NV12>`,
+
+    * - "bcm2835-isp0-capture2"
+      - source
+      - Low resolution YUV processed output from the ISP. The output of
+        this pad cannot have a resolution larger than the "bcm2835-isp0-capture1" pad in any dimension.
+      - :ref:`YUYV <V4L2-PIX-FMT-YUYV>`,
+        :ref:`YVYU <V4L2-PIX-FMT-YVYU>`,
+        :ref:`UYVY <V4L2-PIX-FMT-UYVY>`,
+        :ref:`VYUY <V4L2-PIX-FMT-VYUY>`.
+        :ref:`YUV420/YVU420 <V4L2-PIX-FMT-YUV420>`,
+        :ref:`NV12/NV21 <V4L2-PIX-FMT-NV12>`,
+
+    * - "bcm2835-isp0-capture1"
+      - source
+      - Image statistics calculated from the input image provided on the
+        "bcm2835-isp0-output0" pad.  Statistics are only available for Bayer
+        format input images.
+      - :ref:`v4l2-meta-fmt-bcm2835-isp-stats`.
+
+Pipeline Configuration
+----------------------
+
+The ISP pipeline can be configure through user-space by calling
+:ref:`VIDIOC_S_EXT_CTRLS <VIDIOC_G_EXT_CTRLS>` on the “bcm2835-isp0-output0”
+node with the appropriate parameters as shown in the table below.
+
+.. tabularcolumns:: |p{2cm}|p{5.0cm}|
+
+.. cssclass: longtable
+
+.. flat-table::
+
+    * - *id*
+      - *Parameter*
+
+    * - ``V4L2_CID_USER_BCM2835_ISP_CC_MATRIX``
+      - struct :c:type:`bcm2835_isp_custom_ccm`
+
+    * - ``V4L2_CID_USER_BCM2835_ISP_LENS_SHADING``
+      - struct :c:type:`bcm2835_isp_lens_shading`
+
+    * - ``V4L2_CID_USER_BCM2835_ISP_BLACK_LEVEL``
+      - struct :c:type:`bcm2835_isp_black_level`
+
+    * - ``V4L2_CID_USER_BCM2835_ISP_GEQ``
+      - struct :c:type:`bcm2835_isp_geq`
+
+    * - ``V4L2_CID_USER_BCM2835_ISP_GAMMA``
+      - struct :c:type:`bcm2835_isp_gamma`
+
+    * - ``V4L2_CID_USER_BCM2835_ISP_DENOISE``
+      - struct :c:type:`bcm2835_isp_denoise`
+
+    * - ``V4L2_CID_USER_BCM2835_ISP_SHARPEN``
+      - struct :c:type:`bcm2835_isp_sharpen`
+
+    * - ``V4L2_CID_USER_BCM2835_ISP_DPC``
+      - struct :c:type:`bcm2835_isp_dpc`
+
+++++++++++++++++++++++++
+Configuration Parameters
+++++++++++++++++++++++++
+
+.. kernel-doc:: include/uapi/linux/bcm2835-isp.h
+   :functions: bcm2835_isp_rational bcm2835_isp_ccm bcm2835_isp_custom_ccm
+                bcm2835_isp_gain_format bcm2835_isp_lens_shading
+                bcm2835_isp_black_level bcm2835_isp_geq bcm2835_isp_gamma
+                bcm2835_isp_denoise bcm2835_isp_sharpen
+                bcm2835_isp_dpc_mode bcm2835_isp_dpc
diff --git a/Documentation/userspace-api/media/drivers/index.rst b/Documentation/userspace-api/media/drivers/index.rst
index 02967c9b18d6e90f414ccc1329c09bffee895e68..c4166be86ae9fff896b1094c59c049ba07b0f0a2 100644
--- a/Documentation/userspace-api/media/drivers/index.rst
+++ b/Documentation/userspace-api/media/drivers/index.rst
@@ -27,6 +27,7 @@ For more details see the file COPYING in the source distribution of Linux.
 	:numbered:
 
 	aspeed-video
+	bcm2835-isp
 	camera-sensor
 	ccs
 	cx2341x-uapi
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index f84ed133a6c9b2ddc1aedbd582ddf78cb71f34e5..ef0b3116314b20f394db85854b770a792366869d 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -234,6 +234,12 @@ enum v4l2_colorfx {
  */
 #define V4L2_CID_USER_MALI_C55_BASE		(V4L2_CID_USER_BASE + 0x1230)
 
+/*
+ * The base for the bcm2835-isp driver controls.
+ * We reserve 16 controls for this driver.
+ */
+#define V4L2_CID_USER_BCM2835_ISP_BASE		(V4L2_CID_USER_BASE + 0x1240)
+
 /* MPEG-class control IDs */
 /* The MPEG controls are applicable to all codec controls
  * and the 'MPEG' part of the define is historical */

-- 
2.52.0


