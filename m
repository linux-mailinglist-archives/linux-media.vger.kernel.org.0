Return-Path: <linux-media+bounces-32807-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FCAABC0CB
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 16:35:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B2253BDE02
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 14:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57C95284B2E;
	Mon, 19 May 2025 14:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wEaQNsoO"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2630D28369F;
	Mon, 19 May 2025 14:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747665273; cv=none; b=VbtWp6ZZpm1PrFLCnjBwLTjxF1JpsuBCgn3oaUfxF+RHhrrO9gIDzN0oOcDit6KFW/6M87vBfTmFpAf1AZCskuBjdoQy6UAqgzYFlq5OCBr547Ba2gVdVmvuP0rG2SQDrBmOlhaAnZoBlzGbLfGiQv3HPsHUtN51jBuHhPkkcL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747665273; c=relaxed/simple;
	bh=COAvt0o4cn/ba/HkYod//IDB//Kfb9fsgYRCp66Jyc0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LKQ4PY4XMM7z7C5LYnKYe11GpItbh+YYlv13WVsjDASqHck6/sOi40yRewc2CfNuNBAN/AAg9QCG3f3IPDFVeUTqLA7o6R3jsSKDa2UykWkidpZWLzYTlYHMFn3PbYp46zpcv6+Lqgys3HCGyEH5lnxWqoXj54g372RJK09WlBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wEaQNsoO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7CB121890;
	Mon, 19 May 2025 16:34:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747665243;
	bh=COAvt0o4cn/ba/HkYod//IDB//Kfb9fsgYRCp66Jyc0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=wEaQNsoONw3Jloia29Fk1uTjHEl9DxlG3hmyDAN097dLLhPsLX0sjScR43P3Rpb21
	 BbiVvLLW+kiQcAk6TCxVp85kfifRHBuXTE/KOLME1Knc8hEK3LSCXgishMcWUJbKqr
	 ghT8eXPRWEzcb8rri19BngHsrHEKlaVYF4WMmXtA=
From: Daniel Scally <dan.scally@ideasonboard.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Anthony.McGivern@arm.com,
	jacopo.mondi@ideasonboard.com,
	nayden.kanchev@arm.com,
	robh+dt@kernel.org,
	mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	jerome.forissier@linaro.org,
	kieran.bingham@ideasonboard.com,
	laurent.pinchart@ideasonboard.com,
	sakari.ailus@iki.fi,
	Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v9 06/17] media: uapi: Add controls for Mali-C55 ISP
Date: Mon, 19 May 2025 15:33:58 +0100
Message-Id: <20250519143409.451100-7-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250519143409.451100-1-dan.scally@ideasonboard.com>
References: <20250519143409.451100-1-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add definitions and documentation for the custom control that will
be needed by the Mali-C55 ISP driver. This will be a read only
bitmask of the driver's capabilities, informing userspace of which
blocks are fitted and which are absent.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v9:

	- New patch

 .../userspace-api/media/drivers/index.rst     |  1 +
 .../userspace-api/media/drivers/mali-c55.rst  | 55 +++++++++++++++++++
 .../uapi/linux/media/arm/mali-c55-config.h    | 26 +++++++++
 include/uapi/linux/v4l2-controls.h            |  6 ++
 4 files changed, 88 insertions(+)
 create mode 100644 Documentation/userspace-api/media/drivers/mali-c55.rst
 create mode 100644 include/uapi/linux/media/arm/mali-c55-config.h

diff --git a/Documentation/userspace-api/media/drivers/index.rst b/Documentation/userspace-api/media/drivers/index.rst
index d706cb47b112..02967c9b18d6 100644
--- a/Documentation/userspace-api/media/drivers/index.rst
+++ b/Documentation/userspace-api/media/drivers/index.rst
@@ -32,6 +32,7 @@ For more details see the file COPYING in the source distribution of Linux.
 	cx2341x-uapi
 	dw100
 	imx-uapi
+	mali-c55
 	max2175
 	npcm-video
 	omap3isp-uapi
diff --git a/Documentation/userspace-api/media/drivers/mali-c55.rst b/Documentation/userspace-api/media/drivers/mali-c55.rst
new file mode 100644
index 000000000000..e8519da77d73
--- /dev/null
+++ b/Documentation/userspace-api/media/drivers/mali-c55.rst
@@ -0,0 +1,55 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+Arm Mali-C55 ISP driver
+=======================
+
+The Arm Mali-C55 ISP driver implements a single driver-specific control:
+
+``V4L2_CID_MALI_C55_CAPABILITIES``
+    Detail the capabilities of the ISP by giving detail about the fitted blocks.
+
+    .. flat-table:: Bitmask meaning definitions
+	:header-rows: 1
+	:widths: 2 4 8
+
+	* - Bit
+	  - Macro
+	  - Meaning
+        * - 0
+          - MALI_C55_GPS_PONG_FITTED
+          - Pong configuration space is fitted in the ISP
+        * - 1
+          - MALI_C55_GPS_WDR_FITTED
+          - WDR Framestitch, offset and gain is fitted in the ISP
+        * - 2
+          - MALI_C55_GPS_COMPRESSION_FITTED
+          - Temper compression is fitted in the ISP
+        * - 3
+          - MALI_C55_GPS_TEMPER_FITTED
+          - Temper is fitted in the ISP
+        * - 4
+          - MALI_C55_GPS_SINTER_LITE_FITTED
+          - Sinter Lite is fitted in the ISP instead of the full Sinter version
+        * - 5
+          - MALI_C55_GPS_SINTER_FITTED
+          - Sinter is fitted in the ISP
+        * - 6
+          - MALI_C55_GPS_IRIDIX_LTM_FITTED
+          - Iridix local tone mappine is fitted in the ISP
+        * - 7
+          - MALI_C55_GPS_IRIDIX_GTM_FITTED
+          - Iridix global tone mapping is fitted in the ISP
+        * - 8
+          - MALI_C55_GPS_CNR_FITTED
+          - Colour noise reduction is fitted in the ISP
+        * - 9
+          - MALI_C55_GPS_FRSCALER_FITTED
+          - The full resolution pipe scaler is fitted in the ISP
+        * - 10
+          - MALI_C55_GPS_DS_PIPE_FITTED
+          - The downscale pipe is fitted in the ISP
+
+    The Mali-C55 ISP can be configured in a number of ways to include or exclude
+    blocks which may not be necessary. This control provides a way for the
+    driver to communicate to userspace which of the blocks are fitted in the
+    design.
\ No newline at end of file
diff --git a/include/uapi/linux/media/arm/mali-c55-config.h b/include/uapi/linux/media/arm/mali-c55-config.h
new file mode 100644
index 000000000000..2bd60a0d7878
--- /dev/null
+++ b/include/uapi/linux/media/arm/mali-c55-config.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * ARM Mali-C55 ISP Driver - Userspace API
+ *
+ * Copyright (C) 2023 Ideas on Board Oy
+ */
+
+#ifndef __UAPI_MALI_C55_CONFIG_H
+#define __UAPI_MALI_C55_CONFIG_H
+
+#include <linux/v4l2-controls.h>
+
+#define V4L2_CID_MALI_C55_CAPABILITIES		(V4L2_CID_USER_MALI_C55_BASE + 0x0)
+#define MALI_C55_GPS_PONG_FITTED		BIT(0)
+#define MALI_C55_GPS_WDR_FITTED			BIT(1)
+#define MALI_C55_GPS_COMPRESSION_FITTED		BIT(2)
+#define MALI_C55_GPS_TEMPER_FITTED		BIT(3)
+#define MALI_C55_GPS_SINTER_LITE_FITTED		BIT(4)
+#define MALI_C55_GPS_SINTER_FITTED		BIT(5)
+#define MALI_C55_GPS_IRIDIX_LTM_FITTED		BIT(6)
+#define MALI_C55_GPS_IRIDIX_GTM_FITTED		BIT(7)
+#define MALI_C55_GPS_CNR_FITTED			BIT(8)
+#define MALI_C55_GPS_FRSCALER_FITTED		BIT(9)
+#define MALI_C55_GPS_DS_PIPE_FITTED		BIT(10)
+
+#endif /* __UAPI_MALI_C55_CONFIG_H */
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 72e32814ea83..a31105115410 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -222,6 +222,12 @@ enum v4l2_colorfx {
  */
 #define V4L2_CID_USER_UVC_BASE			(V4L2_CID_USER_BASE + 0x11e0)
 
+/*
+ * The base for the Arm Mali-C55 ISP driver controls.
+ * We reserve 8 controls for this driver
+ */
+#define V4L2_CID_USER_MALI_C55_BASE		(V4L2_CID_USER_BASE + 0x1220)
+
 /* MPEG-class control IDs */
 /* The MPEG controls are applicable to all codec controls
  * and the 'MPEG' part of the define is historical */
-- 
2.34.1


