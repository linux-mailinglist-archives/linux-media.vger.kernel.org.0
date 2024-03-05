Return-Path: <linux-media+bounces-6476-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F95D8723C9
	for <lists+linux-media@lfdr.de>; Tue,  5 Mar 2024 17:10:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA767288BAC
	for <lists+linux-media@lfdr.de>; Tue,  5 Mar 2024 16:10:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C154312BF13;
	Tue,  5 Mar 2024 16:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pufPkF9X"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1FA12B168
	for <linux-media@vger.kernel.org>; Tue,  5 Mar 2024 16:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709654970; cv=none; b=jB72zqpS0bD3kp4+MlPXV64FSm4UHWmhW7wWYhesc6F9P8m4CyMS+kvOFX9jLuxPX30fLXw783q8hTL2k692y6IX+B2WKiVSpny4BHoR4/XpUmznq83T1RE8ipOje5AG7F+nubRF8o9rsqA+rSPVQbsApFlXGZI7nk7RrxMUpYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709654970; c=relaxed/simple;
	bh=r3yR/VHo22ZrLSxcql8ILmtGixcZXAzbsRqZGI2JNv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dyZEqJr9l9RzYW3/+SOf+7ksZ/Ec8JtdkB3966nxFD4TVvtg2eccmE4tVHlC/ezfBXLU8TFLfUKNVINsvzDPgb0aHSuU6i3lRSuN/MXMyntDe3uIDKbL2U6oNflWNpoyEZohPtH5Wy0jJdsfC4KVoPpoWEn0iLSn4fbnjS3iQns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pufPkF9X; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (unknown [IPv6:2001:b07:5d2e:52c9:cc1e:e404:491f:e6ea])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 262791225;
	Tue,  5 Mar 2024 17:08:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1709654939;
	bh=r3yR/VHo22ZrLSxcql8ILmtGixcZXAzbsRqZGI2JNv4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pufPkF9XLGVjsUJvRRVnv+MgCyJD/41bWxoOuLcgOw7IZ3T9ApOE0kI3IPpFsTJQp
	 r0/0b+ghYL1zKPrE2Ysj3TVtzmI8FtB8F6MNJrhcpQZOe209CmWWy0cl37U785FLEh
	 1L8zr8KPxISyB+N+jqIzKHR9kTA4h3Vwcds/xdNs=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v3 5/9] media: uapi: Add meta pixel format for PiSP BE config
Date: Tue,  5 Mar 2024 17:08:48 +0100
Message-ID: <20240305160855.147483-6-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240305160855.147483-1-jacopo.mondi@ideasonboard.com>
References: <20240305160855.147483-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add format description for the PiSP Back End configuration parameter
buffer.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../userspace-api/media/v4l/meta-formats.rst  |  1 +
 .../media/v4l/metafmt-pisp-be.rst             | 46 +++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c          |  1 +
 include/uapi/linux/videodev2.h                |  3 ++
 4 files changed, 51 insertions(+)
 create mode 100644 Documentation/userspace-api/media/v4l/metafmt-pisp-be.rst

diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
index 0bb61fc5bc00..d96ff1ea3373 100644
--- a/Documentation/userspace-api/media/v4l/meta-formats.rst
+++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
@@ -14,6 +14,7 @@ These formats are used for the :ref:`metadata` interface only.
 
     metafmt-d4xx
     metafmt-intel-ipu3
+    metafmt-pisp-be
     metafmt-rkisp1
     metafmt-uvc
     metafmt-vsp1-hgo
diff --git a/Documentation/userspace-api/media/v4l/metafmt-pisp-be.rst b/Documentation/userspace-api/media/v4l/metafmt-pisp-be.rst
new file mode 100644
index 000000000000..f3d30ba989b3
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/metafmt-pisp-be.rst
@@ -0,0 +1,46 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. _v4l2-meta-fmt-rpi-be-cfg:
+
+************************
+V4L2_META_FMT_RPI_BE_CFG
+************************
+
+Raspberry Pi PiSP Back End configuration format
+===============================================
+
+The Raspberry Pi PiSP Back End memory-to-memory image signal processor is
+configured by userspace by providing a buffer of configuration parameters
+to the `pispbe-config` output video device node using the
+:c:type:`v4l2_meta_format` interface.
+
+The PiSP Back End processes images in tiles, and its configuration requires
+specifying two different sets of parameters by populating the members of
+:c:type:`pisp_be_tiles_config` defined in the ``pisp_be_config.h`` header file.
+
+The `Raspberry Pi PiSP technical specification
+<https://datasheets.raspberrypi.com/camera/raspberry-pi-image-signal-processor-specification.pdf>_`
+provide detailed description of the ISP back end configuration and programming
+model.
+
+Global configuration data
+-------------------------
+
+The global configuration data describe how the pixels in a particular image are
+to be processed and is therefore shared across all the tiles of the image. So
+for example, LSC (Lens Shading Correction) or Denoise parameters would be common
+across all tiles from the same frame.
+
+Global configuration data are passed to the ISP by populating the member of
+:c:type:`pisp_be_config`.
+
+Tile parameters
+---------------
+
+As the ISP processes images in tiles, each set of tiles parameters describe how
+a single tile in an image is going to be processed. A single set of tile
+parameters consist of 160 bytes of data and to process a batch of tiles several
+sets of tiles parameters are required.
+
+Tiles parameters are passed to the ISP by populating the member of
+:c:type:`pisp_tile` and the :c:type:`num_tiles` field.
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index a2f9c446a565..18e9aa1297e1 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1456,6 +1456,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_Y210:		descr = "10-bit YUYV Packed"; break;
 	case V4L2_PIX_FMT_Y212:		descr = "12-bit YUYV Packed"; break;
 	case V4L2_PIX_FMT_Y216:		descr = "16-bit YUYV Packed"; break;
+	case V4L2_META_FMT_RPI_BE_CFG:	descr = "RPi PiSP BE Config format"; break;
 
 	default:
 		/* Compressed formats */
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 89b2b409fc03..c3daf61f43d5 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -845,6 +845,9 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_RK_ISP1_PARAMS	v4l2_fourcc('R', 'K', '1', 'P') /* Rockchip ISP1 3A Parameters */
 #define V4L2_META_FMT_RK_ISP1_STAT_3A	v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A Statistics */
 
+/* Vendor specific - used for RaspberryPi PiSP */
+#define V4L2_META_FMT_RPI_BE_CFG v4l2_fourcc('R', 'P', 'B', 'C') /* PiSP BE configuration */
+
 /* priv field value to indicates that subsequent fields are valid. */
 #define V4L2_PIX_FMT_PRIV_MAGIC		0xfeedcafe
 
-- 
2.43.2


