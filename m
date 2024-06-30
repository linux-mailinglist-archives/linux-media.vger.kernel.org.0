Return-Path: <linux-media+bounces-14423-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B16B91D214
	for <lists+linux-media@lfdr.de>; Sun, 30 Jun 2024 16:19:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE5C52814F5
	for <lists+linux-media@lfdr.de>; Sun, 30 Jun 2024 14:19:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F9F0153BE4;
	Sun, 30 Jun 2024 14:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SY3BqshU"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138E31527A7;
	Sun, 30 Jun 2024 14:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719757133; cv=none; b=tGjcYvCp036u7xhmYBB9XktT51+yNetPp6we+XPECoZlLaklqbT+nzA+qDC2PG2x7EzFpm78b9ZXPjycicgKM/FKBGHgbj8LA+HWXMHEhjJ21pvEp/WcL+8s1Xysuew16aO/MJTuRDJwTiN62FSMbCiDbPdA81HOkeLHDg72TR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719757133; c=relaxed/simple;
	bh=bfTTii72MiSKvlslxu1FND8/U4/xz89TIniJgp8R6wU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YJGZu0nUgKD7v4ONVcbYpWtCT+eJHDGVnBY8pYsQA/EjgBzYObsFxW+G0ZcnePgSpvjRQqXxJ5TVf839nfQhvD/NoDDziHHNiWN1Z/RqpMbQT9b/u9tWIT1ZD0DlezbpNO6/z0tvT2DYIKSdVekKDjwPCOUrf2c+mqBd5CP/QPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SY3BqshU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (85-76-36-175-nat.elisa-mobile.fi [85.76.36.175])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B987766F;
	Sun, 30 Jun 2024 16:18:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1719757101;
	bh=bfTTii72MiSKvlslxu1FND8/U4/xz89TIniJgp8R6wU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SY3BqshUrDk76CT7t/sRXnpBFS36BHGhVX0yndyis2VnCjWMvIODynsP85V8X2wJI
	 Dpgc0HpAe7m3gyhpFxxYUe9Ld0Ap2u+tLO9puOmAUfIgmpaO+qNbmkmPpKjR/d34AW
	 ibKrtAUwjVyyWAabvTRXUodzIYC/VHbXlWah78MA=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH/RFC v1 8/9] media: v4l: ctrls: Add a control for companding
Date: Sun, 30 Jun 2024 17:17:58 +0300
Message-ID: <20240630141802.15830-9-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240630141802.15830-1-laurent.pinchart@ideasonboard.com>
References: <20240630141802.15830-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Companding refers to compression and expansion of pixel data to fit in a
smaller range. The control is named V4L2_CID_COMPANDING, and only
supports the A-law compression initially. More compression schemes will
be added as required by devices that support them.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../userspace-api/media/v4l/ext-ctrls-image-process.rst  | 4 ++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c                | 9 +++++++++
 include/uapi/linux/v4l2-controls.h                       | 5 +++++
 3 files changed, 18 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
index b1c2ab2854af..dfd106a1045c 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
@@ -55,3 +55,7 @@ Image Process Control IDs
     control value divided by e.g. 0x100, meaning that to get no
     digital gain the control value needs to be 0x100. The no-gain
     configuration is also typically the default.
+
+``V4L2_CID_COMPANDING (menu)``
+    Companding refers to compression and expansion of pixel data to fit in a
+    smaller range.
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index 8696eb1cdd61..9c3ee188a8f0 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -611,6 +611,11 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
 		"Cyclic",
 		NULL,
 	};
+	static const char * const companding[] = {
+		"Linear",
+		"A-Law",
+		NULL
+	};
 
 	switch (id) {
 	case V4L2_CID_MPEG_AUDIO_SAMPLING_FREQ:
@@ -750,6 +755,8 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
 		return camera_orientation;
 	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE:
 		return intra_refresh_period_type;
+	case V4L2_CID_COMPANDING:
+		return companding;
 	default:
 		return NULL;
 	}
@@ -1163,6 +1170,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_TEST_PATTERN:		return "Test Pattern";
 	case V4L2_CID_DEINTERLACING_MODE:	return "Deinterlacing Mode";
 	case V4L2_CID_DIGITAL_GAIN:		return "Digital Gain";
+	case V4L2_CID_COMPANDING:		return "Companding";
 
 	/* DV controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
@@ -1420,6 +1428,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_CAMERA_ORIENTATION:
 	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE:
 	case V4L2_CID_HDR_SENSOR_MODE:
+	case V4L2_CID_COMPANDING:
 		*type = V4L2_CTRL_TYPE_MENU;
 		break;
 	case V4L2_CID_LINK_FREQ:
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 99c3f5e99da7..4b61159e6bb0 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1223,6 +1223,11 @@ enum v4l2_jpeg_chroma_subsampling {
 #define V4L2_CID_TEST_PATTERN			(V4L2_CID_IMAGE_PROC_CLASS_BASE + 3)
 #define V4L2_CID_DEINTERLACING_MODE		(V4L2_CID_IMAGE_PROC_CLASS_BASE + 4)
 #define V4L2_CID_DIGITAL_GAIN			(V4L2_CID_IMAGE_PROC_CLASS_BASE + 5)
+#define V4L2_CID_COMPANDING			(V4L2_CID_IMAGE_PROC_CLASS_BASE + 6)
+enum v4l2_companding {
+	V4L2_COMPANDING_LINEAR	= 0,
+	V4L2_COMPANDING_ALAW	= 1,
+};
 
 /*  DV-class control IDs defined by V4L2 */
 #define V4L2_CID_DV_CLASS_BASE			(V4L2_CTRL_CLASS_DV | 0x900)
-- 
Regards,

Laurent Pinchart


