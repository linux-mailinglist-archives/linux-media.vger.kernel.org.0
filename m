Return-Path: <linux-media+bounces-21819-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9499D5CF3
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 11:08:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F6371F22C50
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 10:08:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 810171DEFF4;
	Fri, 22 Nov 2024 10:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QoR9RvPn"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6B21DEFC8
	for <linux-media@vger.kernel.org>; Fri, 22 Nov 2024 10:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732270021; cv=none; b=bzzckiyLSwtsIiHVByDu7K362zuqo4RYiPd9VHT3qVSzrk4Ta9UKoneWIR3KNPEc45NfPDNQoMyM5OwlX0o3c7fNc6whcchAli26xF/bem/4I4zPO4qGHxBsdwMv+FC90geVNewnYR98YHfnO50ZuDLvBLZwJe7QtnepyHOD1Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732270021; c=relaxed/simple;
	bh=IBTh2/UEgKNe0qezwT15xLhzZdfHtCfTU4PgLROp9Cc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nfpNA9Id3HCZ3d9pzL0WHNR7UxFp9Hr6BEvVqt/sqt0ZLdUXGNYNg8+gs6mcGARA+M6vojTWM2ARdV1xiMHcYyw2fv/FvaYbo6bhlL4rEfSjKh5u7an4vUjYmig/05I/Yyu5GpYPUItahEEY9ts8nMZ+Qiq0NPO8xog0St6feB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QoR9RvPn; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732270021; x=1763806021;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IBTh2/UEgKNe0qezwT15xLhzZdfHtCfTU4PgLROp9Cc=;
  b=QoR9RvPnE9h8ow8FtrL7tKKmOOhTUjHdjQhIDqZ9C2eXYsJDaO68xxxv
   xHa6Ez3Gltb0gMYvkpkeQulyrZ13KRy9vnsNiEDkMPlYlcYKgx5QHBpAd
   nHmqthhkXdzdmRO5ahTjYvRvVCOcxT4TJ+fbI3cer7PERb9Siarrw9D1a
   quN3cmJSQlYEqUQq5+3WRGhgPCQv3Fq43Tm/ctrDh8g4ZR8cuDWHSvWqW
   e8vPlBp9wUYQA9rEklZSOSv+QOpURG4WAzGQczNv5vuJOOeDpSkMV/6qH
   4yaYt3CpgcatCVz4T0Jj065nhDHsSMBh3I8XIZwQYFyHg0ptMamDh7N/r
   Q==;
X-CSE-ConnectionGUID: aBh9ySxHQLGRAfCMYOHJRw==
X-CSE-MsgGUID: bIZNXSLNSEKmnUWcKZAw9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="54927640"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="54927640"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 02:07:00 -0800
X-CSE-ConnectionGUID: rRStLNDlRvCRrd4UikTPYg==
X-CSE-MsgGUID: 6JlMIGMhQbCzMZ/FL5PSAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="121403091"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 02:06:54 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 9DE05120B22;
	Fri, 22 Nov 2024 12:06:43 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1tEQYl-0002Lg-22;
	Fri, 22 Nov 2024 12:06:43 +0200
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
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: [PATCH 7/8] media: uapi: Add controls for sub-sampling configuration
Date: Fri, 22 Nov 2024 12:06:32 +0200
Message-Id: <20241122100633.8971-8-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241122100633.8971-1-sakari.ailus@linux.intel.com>
References: <20241122100633.8971-1-sakari.ailus@linux.intel.com>
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


