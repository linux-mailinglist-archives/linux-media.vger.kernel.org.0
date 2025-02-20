Return-Path: <linux-media+bounces-26424-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFDFA3D1B6
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 08:05:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2A3A3B29F5
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 07:02:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 668731E5706;
	Thu, 20 Feb 2025 07:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="DAmvxxlB"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D921E32DA;
	Thu, 20 Feb 2025 07:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740034898; cv=none; b=dPYkJ/ZYL7gSVLghMSVtKv7lmb/69idbW8P86w7wVAxZq/CVMaHV6hyg9fSfTwrjh1bZ4HNr2OJx3HcKCtOmm+FjvV5lh+JuQAKvctbDOYBRooXQycx4+bJIcMh3DVrayk0JtMwr9tSTxaoNWJ7CmZAGPBhuUFcGTrorNkzYtU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740034898; c=relaxed/simple;
	bh=F4CiGUyrB0A1fY8ycASmkQnj+rMDtMCcYFc7KcUoTdY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s67BZD8nWh118yyHiOEVp8nys7UmDO0QisBsPdbtHrnB6DW/T2alDnZV+EC/aAcTorzZTKGILRVhl3jOdZbhLSm8Lzq1uv0sUXzmMQ38GSDX9ykmvLzdxC200gLOPl3gkonRbmLp4THIdocO9trITAgm7oc/ks1jfjybnnn4rBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=DAmvxxlB; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 7bfb5c84ef5811efaae1fd9735fae912-20250220
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=xTT8vf7I6/L7VI6F1k8nkxEKJoS7v7FFkrDf0HgTlpA=;
	b=DAmvxxlBLSetIsrqLZSFHqgJQ3XtPEhjCJSYlotdCmwLhf7tM9HHmLVD/QlHr//9LAaSodmN5ef2hExSgzZNQaBOhBeUVaW1KNaqKjwN66ukrp8753AFv7OSZngxX6HNafATJs65sigqAvmpp66S0Z9SocY+nyLsyutiGx0m2QU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:ef018e54-b35e-490f-b22e-e639b4a7164c,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:60aa074,CLOUDID:9d771ddc-d480-4873-806f-0f365159227b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:5,
	IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:
	0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7bfb5c84ef5811efaae1fd9735fae912-20250220
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <bo.kong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 585332294; Thu, 20 Feb 2025 15:01:18 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Thu, 20 Feb 2025 15:01:17 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Thu, 20 Feb 2025 15:01:17 +0800
From: bo.kong <bo.kong@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Conor
 Dooley" <conor+dt@kernel.org>, mtk29348 <Bo.Kong@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<zhaoyuan.chen@mediatek.com>, <teddy.chen@mediatek.com>
Subject: [PATCH v4 3/4] uapi: linux: add MT8188 AIE
Date: Thu, 20 Feb 2025 14:59:52 +0800
Message-ID: <20250220070114.15015-4-bo.kong@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250220070114.15015-1-bo.kong@mediatek.com>
References: <20250220070114.15015-1-bo.kong@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Bo Kong <Bo.Kong@mediatek.com>

Add AIE control related definitions.

Signed-off-by: Bo Kong <Bo.Kong@mediatek.com>
---
Changes in v4:
1. Add document to describe the detail of V4L2_META_FMT_MTFD_RESULT
2. Add the introduction of related variables

Changes in v3:
None

Changes in v2:
1. Fix coding style
---
 drivers/media/v4l2-core/v4l2-ioctl.c       |   3 +
 include/uapi/linux/mtk_aie_v4l2_controls.h | 134 +++++++++++++++++++++
 include/uapi/linux/videodev2.h             |   6 +
 3 files changed, 143 insertions(+)
 create mode 100644 include/uapi/linux/mtk_aie_v4l2_controls.h

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 0304daa8471d..4fdf693ddd1e 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1477,6 +1477,9 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_GENERIC_CSI2_16:	descr = "8-bit Generic Meta, 16b CSI-2"; break;
 	case V4L2_META_FMT_GENERIC_CSI2_20:	descr = "8-bit Generic Meta, 20b CSI-2"; break;
 	case V4L2_META_FMT_GENERIC_CSI2_24:	descr = "8-bit Generic Meta, 24b CSI-2"; break;
+	case V4L2_META_FMT_MTFD_RESULT:
+		descr = "MTK AIE Result Fmt";
+	break;
 
 	default:
 		/* Compressed formats */
diff --git a/include/uapi/linux/mtk_aie_v4l2_controls.h b/include/uapi/linux/mtk_aie_v4l2_controls.h
new file mode 100644
index 000000000000..d8fd30f9288c
--- /dev/null
+++ b/include/uapi/linux/mtk_aie_v4l2_controls.h
@@ -0,0 +1,134 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * AIE Controls Header
+ *
+ * Copyright (c) 2020 MediaTek Inc.
+ * Author: Fish Wu <fish.wu@mediatek.com>
+ */
+
+#ifndef __MTK_AIE_V4L2_CONTROLS_H__
+#define __MTK_AIE_V4L2_CONTROLS_H__
+
+#include <linux/types.h>
+
+/*
+ * The base for the mediatek Face Detection driver controls.
+ * We reserve 16 controls for this driver.
+ * Each CID represents different stages of AIE, with different structures and functions
+ * and cannot be reused
+ */
+#define V4L2_CID_USER_MTK_FD_BASE (V4L2_CID_USER_BASE + 0x1fd0)
+
+#define V4L2_CID_MTK_AIE_INIT (V4L2_CID_USER_MTK_FD_BASE + 1)
+#define V4L2_CID_MTK_AIE_PARAM (V4L2_CID_USER_MTK_FD_BASE + 2)
+
+#define V4L2_FLD_MAX_FRAME 15
+
+/**
+ * struct v4l2_ctrl_aie_init - aie init parameters.
+ *
+ * @max_img_width: maximum width of the source image.
+ * @max_img_height: maximum height of the source image.
+ * @pyramid_width: maximum width of the base pyramid.
+ * @pyramid_height: maximum height of the base pyramid.
+ * @feature_threshold: feature threshold for hareware.
+ */
+struct v4l2_ctrl_aie_init {
+	__u32 max_img_width;
+	__u32 max_img_height;
+	__u32 pyramid_width;
+	__u32 pyramid_height;
+	__s32 feature_threshold;
+};
+
+/**
+ * struct v4l2_aie_roi - aie roi parameters.
+ *
+ * @x1: x1 of the roi coordinate.
+ * @y1: y1 of the roi coordinate.
+ * @x2: x2 of the roi coordinate.
+ * @y2: y2 of the roi coordinate.
+ */
+struct v4l2_aie_roi {
+	__u32 x1;
+	__u32 y1;
+	__u32 x2;
+	__u32 y2;
+};
+
+/**
+ * struct v4l2_aie_padding - aie padding parameters.
+ *
+ * @left: the size of padding left.
+ * @right: the size of padding right.
+ * @down: the size of padding below.
+ * @up: the size of padding above.
+ */
+struct v4l2_aie_padding {
+	__u32 left;
+	__u32 right;
+	__u32 down;
+	__u32 up;
+};
+
+/**
+ * struct v4l2_fld_crop_rip_rop - aie fld parameters.
+ *
+ * @fld_in_crop_x1: x1 of the crop coordinate.
+ * @fld_in_crop_y1: y1 of the crop coordinate.
+ * @fld_in_crop_x2: x2 of the crop coordinate.
+ * @fld_in_crop_y2: y2 of the crop coordinate.
+ * @fld_in_rip: fld in rip.
+ * @fld_in_rop: fld in rop.
+ */
+struct v4l2_fld_crop_rip_rop {
+	__u32 fld_in_crop_x1;
+	__u32 fld_in_crop_y1;
+	__u32 fld_in_crop_x2;
+	__u32 fld_in_crop_y2;
+	__u32 fld_in_rip;
+	__u32 fld_in_rop;
+};
+
+/**
+ * struct v4l2_fld_crop_rip_rop - aie fld parameters.
+ *
+ * @fd_mode: select a mode(FDMODE, ATTRIBUTEMODE, FLDMODE) for current fd.
+ * @src_img_fmt: source image format.
+ * @src_img_width: the width of the source image.
+ * @src_img_height: the height of the source image.
+ * @src_img_stride: the stride of the source image.
+ * @pyramid_base_width: pyramid is the size of resizer, the width of the base pyramid.
+ * @pyramid_base_height: pyramid is the size of resizer, the width of the base pyramid.
+ * @number_of_pyramid: number of pyramid, min: 1, max: 3.
+ * @rotate_degree: the rotate degree of the image.
+ * @en_roi: enable roi(roi is a box diagram that selects a rectangle in a picture).
+ *          when en_roi is enable, AIE will return a rectangle face detection result
+ * @src_roi: roi params.
+ * @en_padding: enable padding.
+ * @src_padding: padding params.
+ * @freq_level: frequency level, Get value from user space.
+ * @fld_face_num: the number of faces in fld.
+ *                user space tells driver the number of detections.
+ * @fld_input: fld input params.
+ */
+struct v4l2_ctrl_aie_param {
+	__u32 fd_mode;
+	__u32 src_img_fmt;
+	__u32 src_img_width;
+	__u32 src_img_height;
+	__u32 src_img_stride;
+	__u32 pyramid_base_width;
+	__u32 pyramid_base_height;
+	__u32 number_of_pyramid;
+	__u32 rotate_degree;
+	__s32 en_roi;
+	struct v4l2_aie_roi src_roi;
+	__s32 en_padding;
+	struct v4l2_aie_padding src_padding;
+	__u32 freq_level;
+	__u32 fld_face_num;
+	struct v4l2_fld_crop_rip_rop fld_input[V4L2_FLD_MAX_FRAME];
+};
+
+#endif /* __MTK_AIE_V4L2_CONTROLS_H__ */
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index e7c4dce39007..8492f44eb55d 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -858,6 +858,9 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_RK_ISP1_STAT_3A	v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A Statistics */
 #define V4L2_META_FMT_RK_ISP1_EXT_PARAMS	v4l2_fourcc('R', 'K', '1', 'E') /* Rockchip ISP1 3a Extensible Parameters */
 
+/* Vendor-specific definition: used for the MediaTek camera subsystem's face detection results */
+#define V4L2_META_FMT_MTFD_RESULT	v4l2_fourcc('M', 'T', 'f', 'd')
+
 /* Vendor specific - used for RaspberryPi PiSP */
 #define V4L2_META_FMT_RPI_BE_CFG	v4l2_fourcc('R', 'P', 'B', 'C') /* PiSP BE configuration */
 #define V4L2_META_FMT_RPI_FE_CFG	v4l2_fourcc('R', 'P', 'F', 'C') /* PiSP FE configuration */
@@ -1961,6 +1964,9 @@ enum v4l2_ctrl_type {
 	V4L2_CTRL_TYPE_AV1_TILE_GROUP_ENTRY = 0x281,
 	V4L2_CTRL_TYPE_AV1_FRAME	    = 0x282,
 	V4L2_CTRL_TYPE_AV1_FILM_GRAIN	    = 0x283,
+
+	V4L2_CTRL_TYPE_AIE_INIT		= 0x0290,
+	V4L2_CTRL_TYPE_AIE_PARAM	= 0x0291,
 };
 
 /*  Used in the VIDIOC_QUERYCTRL ioctl for querying controls */
-- 
2.45.2


