Return-Path: <linux-media+bounces-23895-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB819F9331
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 14:28:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9A871895D23
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 13:26:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76870215F5D;
	Fri, 20 Dec 2024 13:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N8RSn8zp"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683D4215F74
	for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 13:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734701103; cv=none; b=VK37LGcJk8nG9A5X1fpXk082hRTmtps0/CZ6VYKGmz8m+q65MjK/RUwXIrFSg+yyD/Z7d4/w+EDbBLuOSJUP3/Y6k5qLd/hYyiWm5CW9JFPOWg98YxTwZ3TB6jJe3NvaV8YvljM3fuklZdUVURwumWCIdT9/mH6QPV4fhh0vxHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734701103; c=relaxed/simple;
	bh=HTyCnoWk1tOz72CfpazuPbpDpgl7NgjnENNbzgKusig=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sGww83+sotjln8FWXmU45e+Oqljpjo8Qcfi3RZ4pNWycTOQVpuXu84t2l+7GhdarzLnjddlxJRdXWx52zvSesRUGHno9v/DtSZainjHZ26XkvaZcQH5dRKR35f9ioPvQRBItR6CrjRyUVhX+FKDs5BucWt++ONPPUnE9KQ5opZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N8RSn8zp; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734701102; x=1766237102;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HTyCnoWk1tOz72CfpazuPbpDpgl7NgjnENNbzgKusig=;
  b=N8RSn8zp1ddgpIN5u8DMXKVD3V/UvHDzZWLBVarR8mKAc0N4iE68RXPr
   2leOUTH28PvlElfeYCr0Cec66fbT5dCOygHujCbNk9n2GVKmm7/jw6jMh
   PCWs1S6IiqztFjGEhQEOm8qH0hCT06rxrBExtmXt/GsLGMk4fJ1b8nYkS
   qL2cBu9XpZ6CgMSNTUy53ebQatlu3kLNKM15Y7KVZsUj0/3mZHMb+raSC
   m7QsTAEF9x76xC1xiWJdhd3L3EtGas9CnRsfRoNh8T+akJPVrLRK4WT+c
   3HePpH+wfcNKbiTee5YwDRQ5t9wpOQJYMmgc4R74qjx26ZU28r1QWDIA9
   A==;
X-CSE-ConnectionGUID: XtAnTlocQ26F0WBtxZfocg==
X-CSE-MsgGUID: ZIpWVtZIQYGjvDPsWvp8Nw==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="45937666"
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; 
   d="scan'208";a="45937666"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 05:25:02 -0800
X-CSE-ConnectionGUID: CZYDqQ0tRtOdKFXr5VP1EQ==
X-CSE-MsgGUID: 2ojxIa/zS5Ko6ciXVON7IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103132530"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 05:24:57 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id DCE5311F984;
	Fri, 20 Dec 2024 15:24:49 +0200 (EET)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	"Wang, Hongju" <hongju.wang@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [RFC v4 8/9] media: uapi: Add controls for sub-sampling configuration
Date: Fri, 20 Dec 2024 15:24:18 +0200
Message-Id: <20241220132419.1027206-9-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241220132419.1027206-1-sakari.ailus@linux.intel.com>
References: <20241220132419.1027206-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sub-sampling is a way to decrease the data rates after the pixel array by
systematically discarding some samples, either vertically or horizontally
or both. Add two controls for the purpose and document them. The
sub-sampling configuration is taken into account in the compose rectangle.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../userspace-api/media/drivers/camera-sensor.rst  | 14 ++++++++++++--
 .../userspace-api/media/v4l/ext-ctrls-camera.rst   | 11 +++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c          |  2 ++
 include/uapi/linux/v4l2-controls.h                 |  2 ++
 4 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
index c6167c91f46c..e65e82c5940a 100644
--- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
+++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
@@ -107,8 +107,8 @@ values programmed by the register sequences. The default values of these
 controls shall be 0 (disabled). Especially these controls shall not be inverted,
 independently of the sensor's mounting rotation.
 
-Binning
--------
+Binning and sub-sampling
+------------------------
 
 Binning has traditionally been configured using :ref:`the compose selection
 rectangle <v4l2-selection-targets-table>`. The :ref:`V4L2_CID_BINNING
@@ -117,6 +117,16 @@ users should use it when it's available. Drivers supporting the control shall
 also support the compose rectangle, albeit the rectangle may be read-only when
 the control is present.
 
+Sub-sampling is often supported as part of a camera sensor's binning
+functionality and performed after the binning operation. Sub-sampling typically
+produces quality-wise worse results than binning. Sub-sampling factors are
+independent horizontally and vertically and they are controlled using two
+controls, :ref:`V4L2_CID_SUBSAMPLING_HORIZONTAL and
+V4L2_CID_SUBSAMPLING_VERTICAL <v4l2-cid-camera-sensor-subsampling>`. In
+sub-sampling, the image size before sub-sampling is horizontally and vertically
+divided by the respective sub-sampling factors. Drivers supporting the control shall
+also reflect the sub-sampling configuration in the compose rectangle.
+
 .. _media_using_camera_sensor_drivers_embedded_data:
 
 Embedded data
diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
index 18b484ff5d75..577b73045bee 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
@@ -701,3 +701,14 @@ enum v4l2_scene_mode -
 
 For instance, a value of ``0x0001000300020003`` indicates binning by 3
 (horizontally) * 3/2 (vertically).
+
+.. _v4l2-cid-camera-sensor-subsampling:
+
+``V4L2_CID_SUBSAMPLING_HORIZONTAL`` and ``V4L2_CID_SUBSAMPLING_VERTICAL``
+(integer)
+
+    Horizontal and vertical subsampling factors.
+
+    Sub-sampling is used to downscale an image, horizontally and vertically, by
+    discarding a part of the image data. Typically sub-sampling produces lower
+    quality images than binning.
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index 5945976b841f..cddece2876ce 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -1088,6 +1088,8 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_CAMERA_SENSOR_ROTATION:	return "Camera Sensor Rotation";
 	case V4L2_CID_HDR_SENSOR_MODE:		return "HDR Sensor Mode";
 	case V4L2_CID_BINNING_FACTORS:		return "Binning Factors";
+	case V4L2_CID_SUBSAMPLING_HORIZONTAL:	return "Sub-Sampling Factor, Horizontal";
+	case V4L2_CID_SUBSAMPLING_VERTICAL:	return "Sub-Sampling Factor, Vertical";
 
 	/* FM Radio Modulator controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 8d5815a058d7..e85747e2181b 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1089,6 +1089,8 @@ enum v4l2_auto_focus_range {
 
 #define V4L2_CID_HDR_SENSOR_MODE		(V4L2_CID_CAMERA_CLASS_BASE+36)
 #define V4L2_CID_BINNING_FACTORS		(V4L2_CID_CAMERA_CLASS_BASE+37)
+#define V4L2_CID_SUBSAMPLING_HORIZONTAL		(V4L2_CID_CAMERA_CLASS_BASE+38)
+#define V4L2_CID_SUBSAMPLING_VERTICAL		(V4L2_CID_CAMERA_CLASS_BASE+39)
 
 /* FM Modulator class control IDs */
 
-- 
2.39.5


