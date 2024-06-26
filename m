Return-Path: <linux-media+bounces-14183-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9519186C7
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 18:07:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47FCB2826D8
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 16:07:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1B3419309D;
	Wed, 26 Jun 2024 16:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BAHKfFOv"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C500A18FDBE
	for <linux-media@vger.kernel.org>; Wed, 26 Jun 2024 16:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719417730; cv=none; b=PcKaynwFvOwcwL/1Oh65Tkn57BCYrOfxqXFFd7y3hE8MAr+z5Zr9NjEjdTN4hdIVy2+NS40GSypZn8EUoHmfZVniQIlMYDG+9D6fD6ugbLKcRb83bg8Jv6QBXfCsVkHdlAe3TRwSeP47iBxD5KJ+pH8fSHHojZc3zWlUgM354es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719417730; c=relaxed/simple;
	bh=GYYAMdywxQmaXpsx3KQC9VkLGXvSxPINV7N44bvxrxI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HElEEelGq1tmHD7o/nLIJmtkl3Rs9XHCc/Db3C6t3NN8DcQvd0l2pbkcQ3yMy7W6/kmj8B8NdxXVrboJPXKTYNesTejPrlho5RRMDHSrPt/iNRWIjSIgRuwGe/69agrHbjnOGE8VPPqUKHksGi9cFP+lP4N8jgj7FHuPAftqfHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BAHKfFOv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CEB9018D7;
	Wed, 26 Jun 2024 18:01:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1719417700;
	bh=GYYAMdywxQmaXpsx3KQC9VkLGXvSxPINV7N44bvxrxI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BAHKfFOv/7Ne0nXS5L7kXq6PROWfZzHphGJ9EW5pNrxTiHLOOFHUN3TB034MmCnA2
	 Tor+hSjnDosOV7KEBHb2mOheLAw+H4aH4DtWNkpXoCCmEE9Q6Fzmhkv7/1DIqO8FFA
	 aXB/bT2OW67eShCN/+slVGTjFRgbYYk4rkxDn5hY=
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
Subject: [PATCH v10 4/8] media: uapi: Add meta pixel format for PiSP BE config
Date: Wed, 26 Jun 2024 18:01:39 +0200
Message-ID: <20240626160144.87871-5-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240626160144.87871-1-jacopo.mondi@ideasonboard.com>
References: <20240626160144.87871-1-jacopo.mondi@ideasonboard.com>
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
Reviewed-by: Naushir Patuck <naush@raspberrypi.com>
---
 .../userspace-api/media/v4l/meta-formats.rst  |  1 +
 .../media/v4l/metafmt-pisp-be.rst             | 56 +++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c          |  1 +
 include/uapi/linux/videodev2.h                |  3 +
 4 files changed, 61 insertions(+)
 create mode 100644 Documentation/userspace-api/media/v4l/metafmt-pisp-be.rst

diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
index c23aac823d2c..c6e56b5888bc 100644
--- a/Documentation/userspace-api/media/v4l/meta-formats.rst
+++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
@@ -15,6 +15,7 @@ These formats are used for the :ref:`metadata` interface only.
     metafmt-d4xx
     metafmt-generic
     metafmt-intel-ipu3
+    metafmt-pisp-be
     metafmt-rkisp1
     metafmt-uvc
     metafmt-vivid
diff --git a/Documentation/userspace-api/media/v4l/metafmt-pisp-be.rst b/Documentation/userspace-api/media/v4l/metafmt-pisp-be.rst
new file mode 100644
index 000000000000..3281fe366c86
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/metafmt-pisp-be.rst
@@ -0,0 +1,56 @@
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
+<https://datasheets.raspberrypi.com/camera/raspberry-pi-image-signal-processor-specification.pdf>`_
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
+``pisp_tile`` and the ``num_tiles`` fields of :c:type:`pisp_be_tiles_config`.
+
+Raspberry Pi PiSP Back End uAPI data types
+==========================================
+
+This section describes the data types exposed to userspace by the Raspberry Pi
+PiSP Back End. The section is informative only, for a detailed description of
+each field refer to the `Raspberry Pi PiSP technical specification
+<https://datasheets.raspberrypi.com/camera/raspberry-pi-image-signal-processor-specification.pdf>`_.
+
+.. kernel-doc:: include/uapi/linux/media/raspberrypi/pisp_be_config.h
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index ee97643ff3a7..7c684788997c 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1465,6 +1465,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_Y210:		descr = "10-bit YUYV Packed"; break;
 	case V4L2_PIX_FMT_Y212:		descr = "12-bit YUYV Packed"; break;
 	case V4L2_PIX_FMT_Y216:		descr = "16-bit YUYV Packed"; break;
+	case V4L2_META_FMT_RPI_BE_CFG:	descr = "RPi PiSP BE Config format"; break;
 	case V4L2_META_FMT_GENERIC_8:	descr = "8-bit Generic Metadata"; break;
 	case V4L2_META_FMT_GENERIC_CSI2_10:	descr = "8-bit Generic Meta, 10b CSI-2"; break;
 	case V4L2_META_FMT_GENERIC_CSI2_12:	descr = "8-bit Generic Meta, 12b CSI-2"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index dd6876380fe3..96fc0456081e 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -843,6 +843,9 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_RK_ISP1_PARAMS	v4l2_fourcc('R', 'K', '1', 'P') /* Rockchip ISP1 3A Parameters */
 #define V4L2_META_FMT_RK_ISP1_STAT_3A	v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A Statistics */
 
+/* Vendor specific - used for RaspberryPi PiSP */
+#define V4L2_META_FMT_RPI_BE_CFG	v4l2_fourcc('R', 'P', 'B', 'C') /* PiSP BE configuration */
+
 #ifdef __KERNEL__
 /*
  * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when
-- 
2.45.2


