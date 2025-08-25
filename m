Return-Path: <linux-media+bounces-40974-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BBFB33BE1
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 11:55:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E321016A0C7
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 794172DF6FA;
	Mon, 25 Aug 2025 09:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YMm9Djbz"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5B62DE6F8
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 09:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756115513; cv=none; b=TE7JBNqf6TOkF3sobLNeAlURYPg/jgvFM/N8SO1sHFljwdJ6a1OGpRO74coxmuzx+OpJc9ve1Ysw1THPhhsvwntmh3wCbxqsONQ4EGBV0asUhtMrHRSRMgFyJft9U1GBQAfQMjoPRqV+7GWFlLc04D9DcWNFM+M+dWN1Ie9D47w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756115513; c=relaxed/simple;
	bh=3vLtuZWpeYm1zBpCm8NvsBmWSJGvk+QNNIihDZHWV8U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DkYug8Ekl/vykCMf08PejfLQgfqNMF+I/AUMjGBCe56tl3TqfXHJVV5ITDnNnRxEPT/adfRVLyT8h3vnOgzk4L3X83cpj8Wp/zBTmPMqLIpodt+WL+ndMT2/DHi5sLX98SwGR2G+nqzYV13wFm7Os3njtESHn1vFmI0MC/MgUY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YMm9Djbz; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756115513; x=1787651513;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3vLtuZWpeYm1zBpCm8NvsBmWSJGvk+QNNIihDZHWV8U=;
  b=YMm9DjbzL4bFdT8X4f4bgok+sajf4VLhs54ZLsi6CbDdeizkcT3yWxT5
   fb0PmnOcBU9BSZPjaewab3IXxRK14xg9+H4VHuGWqqgbroYQd0J3H0SZr
   ndXy9twwQSqVcfx8LEVqM3aNuECDQGpgTYbRYCMi4JeyvJtq8eHaQaWjG
   TaxMO4S7NzenOkHKUjR9enaeNU0mRRFK0aI6pA+DXpjxe7m6+i7qYwKKk
   x6hdvJpce0t/VYKWqvYqWix0AiEo9M4Mw042qjJ07y2AD8EikI6859MQ2
   xGJX8zI+s8+T+C6veRtGXrqe+0rKELdZTrA04qRYUMyrsl+nNK4hZTm/m
   A==;
X-CSE-ConnectionGUID: S+vUCAFDT+eU9qy50C+Y9A==
X-CSE-MsgGUID: WtNXeReyQp6gIX06fxUMQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="58032284"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58032284"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:46 -0700
X-CSE-ConnectionGUID: wQwyxldkQ0auMnIZVSfmSQ==
X-CSE-MsgGUID: kvPdhYvUTImtPxZKuXrqfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="173431088"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.7])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:38 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B351E121FF4;
	Mon, 25 Aug 2025 12:51:08 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uqTr2-00000005agf-2v5b;
	Mon, 25 Aug 2025 12:51:08 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
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
	Hans de Goede <hdegoede@redhat.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v11 43/66] media: uapi: Add V4L2_CID_BINNING control for binning configuration
Date: Mon, 25 Aug 2025 12:50:44 +0300
Message-ID: <20250825095107.1332313-44-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add V4L2_CID_BINNING control for configuring binning and enumerating a
camera sensor's binning capabilities. The control combines horizontal and
vertical binning into a single control as the two are generally related.

New drivers should use this control to configure binning.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 .../media/drivers/camera-sensor.rst           | 12 ++++++++
 .../media/v4l/ext-ctrls-camera.rst            | 29 +++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  2 ++
 include/uapi/linux/v4l2-controls.h            |  1 +
 4 files changed, 44 insertions(+)

diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
index 39f3f91c6733..ef1f51862980 100644
--- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
+++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
@@ -120,6 +120,18 @@ values programmed by the register sequences. The default values of these
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
+Binning isn't affected by flipping.
+
 .. _media_using_camera_sensor_drivers_embedded_data:
 
 Embedded data
diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
index cdc515c60468..18b484ff5d75 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
@@ -672,3 +672,32 @@ enum v4l2_scene_mode -
 
     As modes differ for each sensor, menu items are not standardized by this
     control and are left to the programmer.
+
+.. _v4l2-cid-camera-sensor-binning:
+
+``V4L2_CID_BINNING_FACTORS (integer menu)``
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
index a7ea380de5ee..5e1c28850e87 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -1087,6 +1087,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_CAMERA_ORIENTATION:	return "Camera Orientation";
 	case V4L2_CID_CAMERA_SENSOR_ROTATION:	return "Camera Sensor Rotation";
 	case V4L2_CID_HDR_SENSOR_MODE:		return "HDR Sensor Mode";
+	case V4L2_CID_BINNING_FACTORS:		return "Binning Factors";
 
 	/* FM Radio Modulator controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
@@ -1427,6 +1428,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_HDR_SENSOR_MODE:
 		*type = V4L2_CTRL_TYPE_MENU;
 		break;
+	case V4L2_CID_BINNING_FACTORS:
 	case V4L2_CID_LINK_FREQ:
 		*type = V4L2_CTRL_TYPE_INTEGER_MENU;
 		break;
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index e25c9d669687..90f47f4780e5 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1101,6 +1101,7 @@ enum v4l2_auto_focus_range {
 #define V4L2_CID_CAMERA_SENSOR_ROTATION		(V4L2_CID_CAMERA_CLASS_BASE+35)
 
 #define V4L2_CID_HDR_SENSOR_MODE		(V4L2_CID_CAMERA_CLASS_BASE+36)
+#define V4L2_CID_BINNING_FACTORS		(V4L2_CID_CAMERA_CLASS_BASE+37)
 
 /* FM Modulator class control IDs */
 
-- 
2.47.2


