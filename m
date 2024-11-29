Return-Path: <linux-media+bounces-22311-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D23009DC1B5
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 10:52:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 384F2B2169F
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 09:52:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 436CB1865E1;
	Fri, 29 Nov 2024 09:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JtjMXe4T"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343DF18871F
	for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 09:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732873946; cv=none; b=X5hxVg1UttZQBh5IElrsF87DHvEZ4h736rz5F630KW11jqMXGK7VZVjG86tuYlDfzBFZe5ryRHat0ZGzem4WOzbgSGNyi917BKXCQSPc0QVi3/+VOpgk39GXlVNwaaLBm1a8GdpPmYmrte1Au46VsbwpRO2DAN8v/pKWMshu/dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732873946; c=relaxed/simple;
	bh=KdOyJnEFP41SwVnq1Bd9ebJvMIo6Ja44dGwb30mHvn0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AwcxcTTT7iVw9eGwtmhxyTNVJXz4DtM/zOHDiuzlnFUzGIfaAAmEY4veglHynKSGU/PUsCsE/q5Sd8X7/FACS8XCwZTVBc9DkNiVQ4hqf4acufXt+s/YshDgZtZaRJ1keEmxxzDXXOVWa0vQIdRa9gnpjWn175kfwtGt2thyxkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JtjMXe4T; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732873945; x=1764409945;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KdOyJnEFP41SwVnq1Bd9ebJvMIo6Ja44dGwb30mHvn0=;
  b=JtjMXe4T3aILoEkVAlKm/A1cF0Eyfa6cjiVw1mQfLqD3K40Nb9b0+Dvs
   znR2izW5TEVdLeOrnGeeigT/0/0zxw078XQn9kH20bqDee7LEbkzWNAH/
   uxBbcTG/yWs5+Zm8PvTGnxoFQ/JjeUxXHcl5amyaxrjx6WbLczo6FV1WH
   mqdBp/GjI9w7pMH02t76t2I5OI1bJTi3YQzOXBQsfDNYAM9NEFNYA+fR0
   S3CnqaDkJAwzLjVwou0z/rVCmv9mRQMENBIgnZBmKPCrg4Afjzc4MyPYJ
   fil9vZkl9fA+XOd85NSFJntq743Ytc0NssCdzuYczmZqASAglTmgTk12c
   Q==;
X-CSE-ConnectionGUID: VIx9GOiWSFyEsngpd/Dh+g==
X-CSE-MsgGUID: apB6txilQa2CSoGSARPt6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="33258261"
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; 
   d="scan'208";a="33258261"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 01:52:25 -0800
X-CSE-ConnectionGUID: M1RJh2riT2i17/SeZeHd1A==
X-CSE-MsgGUID: Poe/iobwRmGaNqIvA7vb8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; 
   d="scan'208";a="97414377"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 01:52:18 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D32B81203B2;
	Fri, 29 Nov 2024 11:52:12 +0200 (EET)
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
Subject: [RFC v3 7/9] media: uapi: Add V4L2_CID_BINNING control for binning configuration
Date: Fri, 29 Nov 2024 11:51:40 +0200
Message-Id: <20241129095142.87196-8-sakari.ailus@linux.intel.com>
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

Add V4L2_CID_BINNING control for configuting binning and enumerating a
camera sensor's binning capabilities. The control combines horizontal and
vertical binning into a single control as the two are generally related.

New drivers should use this control to configure binning.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../media/drivers/camera-sensor.rst           | 10 +++++++
 .../media/v4l/ext-ctrls-camera.rst            | 29 +++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  2 ++
 include/uapi/linux/v4l2-controls.h            |  1 +
 4 files changed, 42 insertions(+)

diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
index 5bc4c79d230c..c6167c91f46c 100644
--- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
+++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
@@ -107,6 +107,16 @@ values programmed by the register sequences. The default values of these
 controls shall be 0 (disabled). Especially these controls shall not be inverted,
 independently of the sensor's mounting rotation.
 
+Binning
+-------
+
+Binning has traditionally been configured using :ref:`the compose selection
+rectangle <v4l2-selection-targets-table>`. The :ref:`V4L2_CID_BINNING
+<v4l2-cid-camera-sensor-binning>` is also available for binning configuration and
+users should use it when it's available. Drivers supporting the control shall
+also support the compose rectangle, albeit the rectangle may be read-only when
+the control is present.
+
 .. _media_using_camera_sensor_drivers_embedded_data:
 
 Embedded data
diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
index cdc515c60468..3fbab0e78719 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
@@ -672,3 +672,32 @@ enum v4l2_scene_mode -
 
     As modes differ for each sensor, menu items are not standardized by this
     control and are left to the programmer.
+
+.. _v4l2-cid-camera-sensor-binning:
+
+``V4L2_CID_BINNING (integer menu)``
+
+    Horizontal and vertical binning factors. Binning combines several
+    horizontal, vertical or both pixel values into a single pixel. It is a way
+    to scale an image. Binning typically produces fairly good quality output.
+
+    Determines both horizontal and vertical binning factors for a camera
+    sensor. The values are encoded in the following way:
+
+.. flat-table::
+    :header-rows:  1
+    :stub-columns: 0
+
+    * - Bits
+      - Synopsis
+    * - 48--63
+      - Horizontal binning numerator.
+    * - 32--47
+      - Horizontal binning denominator.
+    * - 16--31
+      - Vertical binning numerator.
+    * - 0--15
+      - Vertical binning denominator.
+
+For instance, a value of ``0x0001000300020003`` indicates binning by 3
+(horizontally) * 3/2 (vertically).
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index 24c9c25e20d1..3a84051ec11c 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -1087,6 +1087,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_CAMERA_ORIENTATION:	return "Camera Orientation";
 	case V4L2_CID_CAMERA_SENSOR_ROTATION:	return "Camera Sensor Rotation";
 	case V4L2_CID_HDR_SENSOR_MODE:		return "HDR Sensor Mode";
+	case V4L2_CID_BINNING:			return "Binning Factors";
 
 	/* FM Radio Modulator controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
@@ -1424,6 +1425,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_HDR_SENSOR_MODE:
 		*type = V4L2_CTRL_TYPE_MENU;
 		break;
+	case V4L2_CID_BINNING:
 	case V4L2_CID_LINK_FREQ:
 		*type = V4L2_CTRL_TYPE_INTEGER_MENU;
 		break;
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 0152240229ab..8d5815a058d7 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1088,6 +1088,7 @@ enum v4l2_auto_focus_range {
 #define V4L2_CID_CAMERA_SENSOR_ROTATION		(V4L2_CID_CAMERA_CLASS_BASE+35)
 
 #define V4L2_CID_HDR_SENSOR_MODE		(V4L2_CID_CAMERA_CLASS_BASE+36)
+#define V4L2_CID_BINNING_FACTORS		(V4L2_CID_CAMERA_CLASS_BASE+37)
 
 /* FM Modulator class control IDs */
 
-- 
2.39.5


