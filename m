Return-Path: <linux-media+bounces-22312-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 026289DC1B6
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 10:52:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9120E163AC9
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 09:52:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D1F117A90F;
	Fri, 29 Nov 2024 09:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QpmQ0wHe"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5DC18858A
	for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 09:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732873949; cv=none; b=SeNDIN89UExxzNf3wvAQLxOhZZ2/Inda+Y03cLpwljvnSPD6GykTCceeaT1+4D2cddkKTxkOBeEElydgFiFhRH2IqZL3+PxFy0LShLH4SWjLludXin4gxyRLJsyvVvNYNlu3og4V6myuz1DooHVX+p5siUgggSqyUQA9wLnMVXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732873949; c=relaxed/simple;
	bh=IBTh2/UEgKNe0qezwT15xLhzZdfHtCfTU4PgLROp9Cc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=f5utMGGlPOF84LYZMpOMWuRCNaYjeqBEogiSAukkBQexPIWMC9eN6lIwzhND4iXVgaZfsulLXvmI6GtEnsOqcgQGmEfPzI3K2v0QOoMCsTGVqi0pD6YsIoIzchHKFYM5zJ7OYCdDekqRsbka7+nBU70fnOhffWs96h9VSv+VwKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QpmQ0wHe; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732873948; x=1764409948;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IBTh2/UEgKNe0qezwT15xLhzZdfHtCfTU4PgLROp9Cc=;
  b=QpmQ0wHecsgMrIbNsDxO3pIVityh72VIJKC+bD7ob39K2DoL55Fkb1M5
   2zKQnnHRElCxhWkdNFLUeE2BM0+EAbNFAfEreTkTo9Bgur4N8pHn/65iw
   1qjwpAM+g5y757exF00L/jQQuiLr1olngEAZ9NikGhdcOMVbigedYkYyt
   0R6EzylRSQtL5uCkgojFXk+p43EoHXdkuUQzMQd8PwEBngG53CfrPpVA3
   2LVk8CrtjNcviLhS6/7+lVgr/hc3MYYe/0kCzuc9HSrZHzQH7zmK+cL3a
   5IdCiBN+fRGNSJq/H30ao1OXSQDCss32sID9a2aJb3JBr1PUGQ0kVvjgc
   Q==;
X-CSE-ConnectionGUID: zCJv0CXyQKSH4E3SS1SZeQ==
X-CSE-MsgGUID: weSU9SDiQY2ss4KaspvY+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="33258276"
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; 
   d="scan'208";a="33258276"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 01:52:28 -0800
X-CSE-ConnectionGUID: XbMxVtoeSdi1kJfcCxTaCA==
X-CSE-MsgGUID: GY0L2/KuS+aByS9oAsE7MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; 
   d="scan'208";a="97414400"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 01:52:22 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 7AB0E11F9C2;
	Fri, 29 Nov 2024 11:52:16 +0200 (EET)
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
Subject: [RFC v3 8/9] media: uapi: Add controls for sub-sampling configuration
Date: Fri, 29 Nov 2024 11:51:41 +0200
Message-Id: <20241129095142.87196-9-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241129095142.87196-1-sakari.ailus@linux.intel.com>
References: <20241129095142.87196-1-sakari.ailus@linux.intel.com>
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
index 3fbab0e78719..38fa97397793 100644
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
index 3a84051ec11c..62d19b09fd6d 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -1088,6 +1088,8 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_CAMERA_SENSOR_ROTATION:	return "Camera Sensor Rotation";
 	case V4L2_CID_HDR_SENSOR_MODE:		return "HDR Sensor Mode";
 	case V4L2_CID_BINNING:			return "Binning Factors";
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


