Return-Path: <linux-media+bounces-17718-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA7D96E5F8
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 00:54:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C8006B2348E
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 22:54:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D0B41B86D2;
	Thu,  5 Sep 2024 22:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Z66bvVOn"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C451482E9;
	Thu,  5 Sep 2024 22:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725576822; cv=none; b=LkhkXylVG/OhxM/tCQQCkj6BEAWkAG9Hs74LA/KFSttbqKWrBUwUEGhBkN7iVYy/B05ag42bLRHJPRAokelLiZdtRc/6hjZSfZUxjCjRh7222weBQ6tcAf1sfgkkk5XGQcoYvXqm9VRwWxbJa9TQmuwSgMRf7s3msfzLarNo7hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725576822; c=relaxed/simple;
	bh=vj3KhOD/5YRFjJ8FWlZ9KBorRcLXXcJfS5/189OR5l4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BE3tRmNd9muhKExqvh/B5TyPkK/Izxd9iHDRZO/Y5JqDsyC3OhZNJ6Sa/enX5xBEcg29hQApCubsySvtNxt3kk+wGVjPQ+yqhszrQJjpi/Plp9+TSr9GZbLUXrfsMCOv7Tp7X4WX6UJH8kJ1xE3QhAL68CobkYK98Z3vmHmxO2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Z66bvVOn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 08EE71BC1;
	Fri,  6 Sep 2024 00:52:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725576735;
	bh=vj3KhOD/5YRFjJ8FWlZ9KBorRcLXXcJfS5/189OR5l4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z66bvVOnwx4xr2E4EhSto8ruSOXEOx8IAEuB4NnquKIT0QGhPrLQLK34XKvpDrvSB
	 ivkjcI5eqvySaAA8qywZpIXOkTyRCX+ne1w1iJKQabNYlYbz/N8lThcRnL8patMwYG
	 n/PtXM4/Oxq9130e+eHLTIr0Q2UqkI4F7MZ6D1rY=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH/RFC v2 8/9] media: v4l: ctrls: Add a control for companding
Date: Fri,  6 Sep 2024 01:53:06 +0300
Message-ID: <20240905225308.11267-9-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240905225308.11267-1-laurent.pinchart@ideasonboard.com>
References: <20240905225308.11267-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Companding refers to compression and expansion of pixel data to fit in a
smaller range. The control is named V4L2_CID_COMPANDING, and only
supports compression initially.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v1:

- Rename V4L2_COMPANDING_ALAW to V4L2_COMPANDING_COMPRESS
- Document V4L2_COMPANDING_LINEAR and V4L2_COMPANDING_COMPRESS
---
 .../media/v4l/ext-ctrls-image-process.rst        | 16 ++++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c        |  9 +++++++++
 include/uapi/linux/v4l2-controls.h               |  5 +++++
 3 files changed, 30 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
index b1c2ab2854af..d529b0a8cd41 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
@@ -55,3 +55,19 @@ Image Process Control IDs
     control value divided by e.g. 0x100, meaning that to get no
     digital gain the control value needs to be 0x100. The no-gain
     configuration is also typically the default.
+
+``V4L2_CID_COMPANDING (menu)``
+    Companding refers to compression and expansion of pixel data to fit in a
+    smaller range.
+
+
+.. tabularcolumns:: |p{5.7cm}|p{11.8cm}|
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    * - ``V4L2_COMPANDING_LINEAR``
+      - No companding.
+    * - ``V4L2_COMPANDING_COMPRESS``
+      - Compress the data using a device-specific curve.
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index 1ea52011247a..841e415a88ae 100644
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
@@ -1164,6 +1171,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_TEST_PATTERN:		return "Test Pattern";
 	case V4L2_CID_DEINTERLACING_MODE:	return "Deinterlacing Mode";
 	case V4L2_CID_DIGITAL_GAIN:		return "Digital Gain";
+	case V4L2_CID_COMPANDING:		return "Companding";
 
 	/* DV controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
@@ -1421,6 +1429,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_CAMERA_ORIENTATION:
 	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE:
 	case V4L2_CID_HDR_SENSOR_MODE:
+	case V4L2_CID_COMPANDING:
 		*type = V4L2_CTRL_TYPE_MENU;
 		break;
 	case V4L2_CID_LINK_FREQ:
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 974fd254e573..ca9e25f72886 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1225,6 +1225,11 @@ enum v4l2_jpeg_chroma_subsampling {
 #define V4L2_CID_TEST_PATTERN			(V4L2_CID_IMAGE_PROC_CLASS_BASE + 3)
 #define V4L2_CID_DEINTERLACING_MODE		(V4L2_CID_IMAGE_PROC_CLASS_BASE + 4)
 #define V4L2_CID_DIGITAL_GAIN			(V4L2_CID_IMAGE_PROC_CLASS_BASE + 5)
+#define V4L2_CID_COMPANDING			(V4L2_CID_IMAGE_PROC_CLASS_BASE + 6)
+enum v4l2_companding {
+	V4L2_COMPANDING_LINEAR		= 0,
+	V4L2_COMPANDING_COMPRESS	= 1,
+};
 
 /*  DV-class control IDs defined by V4L2 */
 #define V4L2_CID_DV_CLASS_BASE			(V4L2_CTRL_CLASS_DV | 0x900)
-- 
Regards,

Laurent Pinchart


