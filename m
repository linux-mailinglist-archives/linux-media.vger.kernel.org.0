Return-Path: <linux-media+bounces-25550-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0DFA25539
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 10:01:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 400FE166781
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 09:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 172B71FF1C6;
	Mon,  3 Feb 2025 09:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PmBpBEKa"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5710207DEA
	for <linux-media@vger.kernel.org>; Mon,  3 Feb 2025 09:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738573203; cv=none; b=RwqGZm/gmDtOy1BfHmJVVjiDsBS2i7+zm78W73beRkJdWWHhMotUOA6S3OHor9Vcl+GYNCXZyXh6YV3yWR6lSVhdtOnt2yKBqMgCcSFzFu2hv/LDPMVUIZW1sSF1A1OBvbVYqbUGeWt7WC5rOufNDglT4brdZlBkyS7mfKg8+Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738573203; c=relaxed/simple;
	bh=0bVoD49YZ1dwUgxndQAJNi/mPiubgmOqoCmQhkpeLZM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j15Gpa9R7tOBvtkZK6MLEM0tuJ3BLTKa/fgaFxLb9EMVk5wcZL51mlw8zCHJFDnbs2Kbz93j+XuVOc7oloj9kgSwrQriPKu3qSxlcjVqlSURnmy6TA0hjNc0GY3vtzmyUUCb9+sOlGZ0sdeI7lTC0+HvoPrEFuDZemnOom0DLZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PmBpBEKa; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738573202; x=1770109202;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0bVoD49YZ1dwUgxndQAJNi/mPiubgmOqoCmQhkpeLZM=;
  b=PmBpBEKaZrt1s9gK9CaZ25HB4eTbVLo/KYgcCBLI7jfGaIpVmyywYkYg
   ZVZ9oZbLm+hzkaRM34dZZLd5myb5sGDqeD2K4nbftr8+jyvWctH9pAfZw
   cy0EJB0mOOJUGRf7W01M5X5qhpYBCPuhQS6MJNSVbai3x9jqyZrDebVVJ
   CZB0xDzjPk7ERO0Ju4KYZqY42Qb1ukoZOTysf/Dv59g/IIna8MKVvUsaI
   f1tvKUWVp+u77k4EjCBPTVOB7hlBwKV+UmrpXQdwaT6SqdfqGroTSV/mB
   K49bW/TtH+39avYMN8aIU5uGVXAWVvAMap29KpnDJ6eotmt+4MoEYXv3u
   g==;
X-CSE-ConnectionGUID: jmuppUu4RLaECA6an0Phmg==
X-CSE-MsgGUID: Kt4rzdUdTmeV4+QsTMZXHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="39211614"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="39211614"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 01:00:01 -0800
X-CSE-ConnectionGUID: 6APj+ASAReO6aqIgToeTBQ==
X-CSE-MsgGUID: QVHL27wISnS3YCSF6dqNKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="109988813"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 00:59:55 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B4E7A11FC22;
	Mon,  3 Feb 2025 10:59:49 +0200 (EET)
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
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>
Subject: [RFC v5 14/15] media: uapi: Add controls for sub-sampling configuration
Date: Mon,  3 Feb 2025 10:58:52 +0200
Message-Id: <20250203085853.1361401-15-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250203085853.1361401-1-sakari.ailus@linux.intel.com>
References: <20250203085853.1361401-1-sakari.ailus@linux.intel.com>
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
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 .../userspace-api/media/drivers/camera-sensor.rst  | 14 ++++++++++++--
 .../userspace-api/media/v4l/ext-ctrls-camera.rst   | 11 +++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c          |  2 ++
 include/uapi/linux/v4l2-controls.h                 |  2 ++
 4 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
index 59431ab0b923..9e74eb02e02a 100644
--- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
+++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
@@ -120,8 +120,8 @@ values programmed by the register sequences. The default values of these
 controls shall be 0 (disabled). Especially these controls shall not be inverted,
 independently of the sensor's mounting rotation.
 
-Binning
--------
+Binning and sub-sampling
+------------------------
 
 Binning has traditionally been configured using :ref:`the compose selection
 rectangle <v4l2-selection-targets-table>`. The :ref:`V4L2_CID_BINNING
@@ -130,6 +130,16 @@ users should use it when it's available. Drivers supporting the control shall
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
index 6be3d4a37127..5f4a8cc9f53b 100644
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
index ac0e38e98a38..4eade177d40f 100644
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


