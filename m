Return-Path: <linux-media+bounces-35314-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 239B9AE04FA
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 14:05:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C98B75A32C2
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 12:02:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C8642472A6;
	Thu, 19 Jun 2025 11:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="igccHDfe"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428FE25A2D1
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 11:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334365; cv=none; b=brUb1Ot35y7Wd5T6b5pNv3Bi6GlSAemDORzg8F293S10VeKRW3CDYutFp56DG59bJdkguAMerppaEsDyAQaOFSHIO084cj4OPiOUa9xV098+szUWk9oK62pLkJ4yCVDaEYtj5h1qlcfXUkhtyT8pxhI7c9QbOhkYFbvbOu2fPiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334365; c=relaxed/simple;
	bh=fVP0ZFN1gX3DZ8wy3Q9u+dynZkzaIwgA4dosUBaQ1dU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=h1s4OifofkJu1oS2yUaFhE8uY5JxMtH+VwdHcJvUF4B/HomSIXikNFDNweE0BQ/7nHspd4kNnFfeTJG0CHsyo0lzZ6d08/NTiN4tmD0O44wdlHnRpE4/n9TEte3+gJz1cxEFN1k6/RtryiNwSeHI4BBwRC1c/13dobNNblVuheU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=igccHDfe; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750334363; x=1781870363;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fVP0ZFN1gX3DZ8wy3Q9u+dynZkzaIwgA4dosUBaQ1dU=;
  b=igccHDfeLxcOC31/QaisfeDmuOgf+1Cwf+6+6YONllK+qWHVeJHa+GIq
   KvJMe5a2Fps8W+58GW+gsNNNmiHq2UZOTQ0OKjShmcWqn0qb/bD0oE3NR
   M//VbqxqDyyDzH7/pLk1n2+KrE7xB1EgYFQXP68v/3bJJ4LLCV0pWbdYU
   b/FlTZmJO3A9hPVe/eixR7jKMfwbfk8dh4G8opIylFgg3E6ADlnpWOWv0
   1Xr/uAIWpkGMHMOG50DEpsoTcJO2N9+NCGzxqRECJKsEQ9/okodhMZn2z
   o8j6AK26bnzwAEPBYuJ7TE51JmZZU583Ua7O2WB3zZDh4yBiToWqmCof+
   w==;
X-CSE-ConnectionGUID: ngfv0NslRU+iltA6C8J+FQ==
X-CSE-MsgGUID: HdNZlZJuR1+Qb5yffiCkCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="56386723"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="56386723"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:59:12 -0700
X-CSE-ConnectionGUID: Mb1k/rABT9S4IP1kcWQMPA==
X-CSE-MsgGUID: GyC0dET+RKy/xd2U+6yvgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="154908454"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:59:05 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 40BA512323D;
	Thu, 19 Jun 2025 14:58:37 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uSDuf-008AL7-0l;
	Thu, 19 Jun 2025 14:58:37 +0300
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
Subject: [PATCH v10 44/64] media: uapi: Add controls for sub-sampling configuration
Date: Thu, 19 Jun 2025 14:58:16 +0300
Message-Id: <20250619115836.1946016-45-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
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
 .../media/drivers/camera-sensor.rst              | 16 +++++++++++++---
 .../userspace-api/media/v4l/ext-ctrls-camera.rst | 11 +++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c        |  2 ++
 include/uapi/linux/v4l2-controls.h               |  2 ++
 4 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
index ef1f51862980..b0ad0d778396 100644
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
@@ -130,7 +130,17 @@ users should use it when it's available. Drivers supporting the control shall
 also support the compose rectangle, albeit the rectangle may be read-only when
 the control is present.
 
-Binning isn't affected by flipping.
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
+Binning and sub-sampling aren't affected by flipping.
 
 .. _media_using_camera_sensor_drivers_embedded_data:
 
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
index 5e1c28850e87..9f8816bfffbe 100644
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
index 630850d237ad..61d82e250480 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1096,6 +1096,8 @@ enum v4l2_auto_focus_range {
 
 #define V4L2_CID_HDR_SENSOR_MODE		(V4L2_CID_CAMERA_CLASS_BASE+36)
 #define V4L2_CID_BINNING_FACTORS		(V4L2_CID_CAMERA_CLASS_BASE+37)
+#define V4L2_CID_SUBSAMPLING_HORIZONTAL		(V4L2_CID_CAMERA_CLASS_BASE+38)
+#define V4L2_CID_SUBSAMPLING_VERTICAL		(V4L2_CID_CAMERA_CLASS_BASE+39)
 
 /* FM Modulator class control IDs */
 
-- 
2.39.5


