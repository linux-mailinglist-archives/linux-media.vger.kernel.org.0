Return-Path: <linux-media+bounces-29289-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9E9A79D2B
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 09:41:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A4550174345
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 07:41:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A887242905;
	Thu,  3 Apr 2025 07:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="CLQAGMoi"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11E824061B;
	Thu,  3 Apr 2025 07:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743666020; cv=none; b=Ky26OcjsXPJf1Wu+KxexhsE83WL1tcdui6T1+Xp1t5YMmG/v1ldQBS982JdnmkweXm79eKg9GysXUfnOF9+FQGLLF/+o/F/neMrdDu1Q531Go3AdZrDGKE84savNOPUKhEJwA52mcfo+o/M8lFkMKNplm43zDzK/mexascjDs9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743666020; c=relaxed/simple;
	bh=LwaI1kMO10xWyf76erC0UdUJfIHS8MKQjlFi8nVMd70=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C0Bm8Q0cxSdqcPBVgr1fSiXuFDJYNk4BsJHU/gAKwFaMxAVXOtuKKOsxCna6G+xLQDSz7L2jPKVmv1bEpAqGUkq//7OntsQ3XQYhAF1vGw1J6Df7tCYx7Ru5tf4kKjQMz9ZsXIQ2EIzqJRrkXCxc03Gm7vXo4DhOOt/ki5AetOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=CLQAGMoi; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: df770a48105e11f0aae1fd9735fae912-20250403
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=wAT6CJcD8ytdYoyJijtAbZBEnVq+2dlyKKEa8H2Koi8=;
	b=CLQAGMoi7JxjSKpElYov9CGTEppJ7P8ReQ6udUdbzjv3GfmW3b4BRM7TQ4z2VK82oCqNIrPZzQttKVhK2nna/ViCzyT7rVh5xavtIyU0EmCyNvzAHmY/MYRdi5YOkyhuOl9GT462jGt2nWDzSYdA7y4kRPIIUkoIKzl3kAy46Bk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:2a0489ed-6327-408d-9db4-18132c23ac2c,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:fed524c7-16da-468a-87f7-8ca8d6b3b9f7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: df770a48105e11f0aae1fd9735fae912-20250403
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <bo.kong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1080452857; Thu, 03 Apr 2025 15:40:11 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 3 Apr 2025 15:40:09 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 3 Apr 2025 15:40:09 +0800
From: bo.kong <bo.kong@mediatek.com>
To: Rob Herring <robh@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, mtk29348 <Bo.Kong@mediatek.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: <zhaoyuan.chen@mediatek.com>, <Teddy.Chen@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v5 3/4] uapi: linux: add MT8188 AIE
Date: Thu, 3 Apr 2025 15:38:35 +0800
Message-ID: <20250403074005.21472-4-bo.kong@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250403074005.21472-1-bo.kong@mediatek.com>
References: <20250403074005.21472-1-bo.kong@mediatek.com>
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
Changes in v5:
1. Add an introduction for feature_threshold.
2. Change the name of v4l2_aie_roi to aie_roi_coordinate.
3. Change the name of v4l2_aie_padding to aie_padding_size.
4. Add an explanation for en_padding and describe the functions of the three modes of fd_mode.
5. Move the structures in the mtk_aie.h file to the uapi directory.

Changes in v4:
1. Add document to describe the detail of V4L2_META_FMT_MTFD_RESULT
2. Add the introduction of related variables

Changes in v3:
None

Changes in v2:
1. Fix coding style
---
 drivers/media/v4l2-core/v4l2-ioctl.c       |   3 +
 include/uapi/linux/mtk_aie_v4l2_controls.h | 308 +++++++++++++++++++++
 include/uapi/linux/videodev2.h             |   6 +
 3 files changed, 317 insertions(+)
 create mode 100644 include/uapi/linux/mtk_aie_v4l2_controls.h

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index a16fb44c7246..74d0d13f841f 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1479,6 +1479,9 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
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
index 000000000000..952dcdb23283
--- /dev/null
+++ b/include/uapi/linux/mtk_aie_v4l2_controls.h
@@ -0,0 +1,308 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * AIE Controls Header
+ *
+ * Copyright (c) 2020 MediaTek Inc.
+ * Author: Bo Kong <bo.kong@mediatek.com>
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
+#define V4L2_CID_MTK_AIE_INIT (V4L2_CID_USER_MTK_FD_BASE + 1)
+#define V4L2_CID_MTK_AIE_PARAM (V4L2_CID_USER_MTK_FD_BASE + 2)
+
+#define MAX_FACE_NUM			1024
+#define FLD_CUR_LANDMARK		11
+#define FLD_MAX_FRAME			15
+
+/**
+ * struct v4l2_ctrl_aie_init - aie init parameters.
+ *
+ * @max_img_width: maximum width of the source image.
+ * @max_img_height: maximum height of the source image.
+ * @pyramid_width: maximum width of the base pyramid.
+ * @pyramid_height: maximum height of the base pyramid.
+ * @feature_threshold: The threshold for the face confidence.Range: 100 ~ 400.
+ *                     The larger the value,the lower the face recognition rate
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
+ * struct aie_roi_coordinate - aie roi parameters.
+ *
+ * @x1: x1 of the roi coordinate.
+ * @y1: y1 of the roi coordinate.
+ * @x2: x2 of the roi coordinate.
+ * @y2: y2 of the roi coordinate.
+ */
+struct aie_roi_coordinate {
+	__u32 x1;
+	__u32 y1;
+	__u32 x2;
+	__u32 y2;
+};
+
+/**
+ * struct aie_padding_size - aie padding parameters.
+ *
+ * @left: the size of padding left.
+ * @right: the size of padding right.
+ * @down: the size of padding below.
+ * @up: the size of padding above.
+ */
+struct aie_padding_size {
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
+ * struct fd_ret - aie fd result parameters.
+ *
+ * @anchor_x0: X coordinate of the top-left corner of each detected face.
+ * @anchor_x1: X coordinate of the bottom-right corner of each detected face.
+ * @anchor_y0: Y coordinate of the top-left corner of each detected face.
+ * @anchor_y1: Y coordinate of the bottom-right corner of each detected face.
+ * @rop_landmark_score0: Score for the first rotation pose landmark.
+ * @rop_landmark_score1: Score for the second rotation pose landmark.
+ * @rop_landmark_score2: Score for the third rotation pose landmark.
+ * @anchor_score: Score for the anchor points.
+ * @rip_landmark_score0: Score for the first rotation-invariant pose landmark.
+ * @rip_landmark_score1: Score for the second rotation-invariant pose landmark.
+ * @rip_landmark_score2: Score for the third rotation-invariant pose landmark.
+ * @rip_landmark_score3: Score for the fourth rotation-invariant pose landmark.
+ * @rip_landmark_score4: Score for the fifth rotation-invariant pose landmark.
+ * @rip_landmark_score5: Score for the sixth rotation-invariant pose landmark.
+ * @rip_landmark_score6: Score for the seventh rotation-invariant pose landmark.
+ * @face_result_index: Index of each detected face.
+ * @anchor_index: Index of the anchor points.
+ * @fd_partial_result: Partial face detection result.
+ */
+struct fd_ret {
+	__u16 anchor_x0[MAX_FACE_NUM];
+	__u16 anchor_x1[MAX_FACE_NUM];
+	__u16 anchor_y0[MAX_FACE_NUM];
+	__u16 anchor_y1[MAX_FACE_NUM];
+	__s16 rop_landmark_score0[MAX_FACE_NUM];
+	__s16 rop_landmark_score1[MAX_FACE_NUM];
+	__s16 rop_landmark_score2[MAX_FACE_NUM];
+	__s16 anchor_score[MAX_FACE_NUM];
+	__s16 rip_landmark_score0[MAX_FACE_NUM];
+	__s16 rip_landmark_score1[MAX_FACE_NUM];
+	__s16 rip_landmark_score2[MAX_FACE_NUM];
+	__s16 rip_landmark_score3[MAX_FACE_NUM];
+	__s16 rip_landmark_score4[MAX_FACE_NUM];
+	__s16 rip_landmark_score5[MAX_FACE_NUM];
+	__s16 rip_landmark_score6[MAX_FACE_NUM];
+	__u16 face_result_index[MAX_FACE_NUM];
+	__u16 anchor_index[MAX_FACE_NUM];
+	__u32 fd_partial_result;
+};
+
+/**
+ * struct fd_result - Face detection results for different pyramid levels.
+ *
+ * @fd_pyramid0_num: Number of faces detected at pyramid level 0.
+ * @fd_pyramid1_num: Number of faces detected at pyramid level 1.
+ * @fd_pyramid2_num: Number of faces detected at pyramid level 2.
+ * @fd_total_num: Total number of faces detected across all pyramid levels.
+ * @pyramid0_result: Detection results for pyramid level 0.
+ * @pyramid1_result: Detection results for pyramid level 1.
+ * @pyramid2_result: Detection results for pyramid level 2.
+ */
+struct fd_result {
+	__u16 fd_pyramid0_num;
+	__u16 fd_pyramid1_num;
+	__u16 fd_pyramid2_num;
+	__u16 fd_total_num;
+	struct fd_ret pyramid0_result;
+	struct fd_ret pyramid1_result;
+	struct fd_ret pyramid2_result;
+};
+
+/**
+ * struct attr_result - Attribute detection results parameters.
+ *
+ * @gender_ret: Gender detection results.
+ * @ethnicity_ret: Ethnicity detection results.
+ * @merged_age_ret: Merged age detection results.
+ * @merged_gender_ret: Merged gender detection results.
+ * @merged_is_indian_ret: Merged results indicating if the subject is Indian.
+ * @merged_ethnicity_ret: Merged ethnicity detection results.
+ */
+struct attr_result {
+	__s16 gender_ret[2][64];
+	__s16 ethnicity_ret[4][64];
+	__s16 merged_age_ret[2];
+	__s16 merged_gender_ret[2];
+	__s16 merged_is_indian_ret[2];
+	__s16 merged_ethnicity_ret[4];
+};
+
+/**
+ * struct fld_landmark - FLD coordinates parameters.
+ *
+ * @x: X coordinate of the facial landmark.
+ * @y: Y coordinate of the facial landmark.
+ */
+struct fld_landmark {
+	__u16 x;
+	__u16 y;
+};
+
+/**
+ * struct fld_result - FLD detection results parameters.
+ *
+ * @fld_landmark: Array of facial landmarks, each with X and Y coordinates.
+ * @fld_out_rip: Output rotation-invariant pose value.
+ * @fld_out_rop: Output rotation pose value.
+ * @confidence: Confidence score of the facial landmark detection.
+ * @blinkscore: Blink score indicating the likelihood of eye blink.
+ */
+struct fld_result {
+	struct fld_landmark fld_landmark[FLD_CUR_LANDMARK];
+	__u16 fld_out_rip;
+	__u16 fld_out_rop;
+	__u16 confidence;
+	__s16 blinkscore;
+};
+
+/**
+ * struct aie_enq_info - V4L2 Kernelspace parameters.
+ *
+ * @sel_mode: select a mode(FDMODE, ATTRIBUTEMODE, FLDMODE) for current fd.
+ *           FDMODE: Face Detection.
+ *           ATTRIBUTEMODE: Gender and ethnicity detection
+ *           FLDMODE: Locations of eyebrows, eyes, ears, nose,and mouth
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
+ * @en_padding: enable padding, this is only used on the hardware of yuv to rgb.
+ *              and has noting to do with fd_mode
+ * @src_padding: padding params.
+ * @freq_level: frequency level, Get value from user space enque.
+ * @fld_face_num: the number of faces in fld.
+ *                user space tells driver the number of detections.
+ * @fld_input: fld input params.
+ * @src_img_addr: Source image address.
+ * @src_img_addr_uv: Source image address for UV plane.
+ * @fd_out: Face detection results.
+ * @attr_out: Attribute detection results.
+ * @fld_out: Array of facial landmark detection results for multiple frames.
+ * @irq_status: Interrupt request status.
+ */
+struct aie_enq_info {
+	__u32 sel_mode;
+	__u32 src_img_fmt;
+	__u32 src_img_width;
+	__u32 src_img_height;
+	__u32 src_img_stride;
+	__u32 pyramid_base_width;
+	__u32 pyramid_base_height;
+	__u32 number_of_pyramid;
+	__u32 rotate_degree;
+	int en_roi;
+	struct aie_roi_coordinate src_roi;
+	int en_padding;
+	struct aie_padding_size src_padding;
+	unsigned int freq_level;
+	unsigned int fld_face_num;
+	struct v4l2_fld_crop_rip_rop fld_input[FLD_MAX_FRAME];
+	__u32 src_img_addr;
+	__u32 src_img_addr_uv;
+	struct fd_result fd_out;
+	struct attr_result attr_out;
+	struct fld_result fld_out[FLD_MAX_FRAME];
+	__u32 irq_status;
+};
+
+/**
+ * struct v4l2_ctrl_aie_param - V4L2 Userspace parameters.
+ *
+ * @fd_mode: select a mode(FDMODE, ATTRIBUTEMODE, FLDMODE) for current fd.
+ *           FDMODE: Face Detection.
+ *           ATTRIBUTEMODE: Gender and ethnicity detection
+ *           FLDMODE: Locations of eyebrows, eyes, ears, nose,and mouth
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
+ * @en_padding: enable padding, this is only used on the hardware of yuv to rgb.
+ *              and has noting to do with fd_mode
+ * @src_padding: padding params.
+ * @freq_level: frequency level, Get value from user space enque.
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
+	struct aie_roi_coordinate src_roi;
+	__s32 en_padding;
+	struct aie_padding_size src_padding;
+	__u32 freq_level;
+	__u32 fld_face_num;
+	struct v4l2_fld_crop_rip_rop fld_input[FLD_MAX_FRAME];
+};
+
+#endif /* __MTK_AIE_V4L2_CONTROLS_H__ */
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index c8cb2796130f..329bbac9239e 100644
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
@@ -1965,6 +1968,9 @@ enum v4l2_ctrl_type {
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


