Return-Path: <linux-media+bounces-24056-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C41BF9FC458
	for <lists+linux-media@lfdr.de>; Wed, 25 Dec 2024 10:02:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05C981883024
	for <lists+linux-media@lfdr.de>; Wed, 25 Dec 2024 09:02:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E4C11ADFEC;
	Wed, 25 Dec 2024 09:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Y+E7zPLn"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC2D158553;
	Wed, 25 Dec 2024 09:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735117294; cv=none; b=TQAVzjoXCqdYBaNmI9nylpLXr28SrqjRczcP5UKsVrkmiFg+M3jCplkqekxmVt/khnpKo+4X2A1hauZPn33D3tNSy3o8dpyYu0iruN4XFga4OY/GnzmAPq9CsnKvY85YTl8C7xurYd1UAqkZJNswXBsIs2tQUj63gvAMD1SlPik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735117294; c=relaxed/simple;
	bh=+9ADHESFhii0WAc3Jt4DUgUy5ZZ6OgZsOxvD3VK7ib8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bD8oYMRyGvzRFl8JxinU5RmOBuQSMXwoBaf/n/Mi0xLHPDmG29pfvqKRsBwetjZB4gkSi5N2FTcBaUZXSoAj1zHTUCmzzOvRdseJJAk0xlnncu6k/C7efu95KhZyOOsSEqjNCsvmiLjeg0sD/NycHlfHk/8aP2brw79IiWf4ZYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Y+E7zPLn; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: cd01adf4c29e11ef99858b75a2457dd9-20241225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Iz0XRZ0xLu1hC/eI8JE2iMO+H+JnIO69DMkS8xGu5Pc=;
	b=Y+E7zPLnlaaeIEC99fVe57gvixmberERkmQ1rOYPme4vEhlKdfJMLNQlwhtqVG9eulH3F/QIy7nofuHTAPY+bt+HrujT03wilOiP8Eoxl+eM3HRzE0g0/cgmAaNVvgBQmkRY5q1ZpR2O0nMm5PLxMnLGMd22r6M3/vi8snggnNw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:81bd790f-d0da-45d0-af21-c459a8b64c11,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:e50ed818-ec44-4348-86ee-ebcff634972b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: cd01adf4c29e11ef99858b75a2457dd9-20241225
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <bo.kong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 42176071; Wed, 25 Dec 2024 17:01:17 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 25 Dec 2024 17:01:16 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 25 Dec 2024 17:01:16 +0800
From: bo.kong <bo.kong@mediatek.com>
To: <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>
CC: <conor+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <Bo.Kong@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3 4/4] uapi: linux: add MT8188 AIE
Date: Wed, 25 Dec 2024 17:00:23 +0800
Message-ID: <20241225090113.17027-5-bo.kong@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241225090113.17027-1-bo.kong@mediatek.com>
References: <20241225090113.17027-1-bo.kong@mediatek.com>
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

Changes in v3:
none

Changes in v2:
1. Fix coding style
---
 include/uapi/linux/mtk_aie_v4l2_controls.h | 132 +++++++++++++++++++++
 include/uapi/linux/videodev2.h             |   6 +
 2 files changed, 138 insertions(+)
 create mode 100644 include/uapi/linux/mtk_aie_v4l2_controls.h

diff --git a/include/uapi/linux/mtk_aie_v4l2_controls.h b/include/uapi/linux/mtk_aie_v4l2_controls.h
new file mode 100644
index 000000000000..e635548c2cdf
--- /dev/null
+++ b/include/uapi/linux/mtk_aie_v4l2_controls.h
@@ -0,0 +1,132 @@
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
+ * @fd_mode: select a mode for current fd.
+ * @src_img_fmt: source image format.
+ * @src_img_width: the width of the source image.
+ * @src_img_height: the height of the source image.
+ * @src_img_stride: the stride of the source image.
+ * @pyramid_base_width: the width of the base pyramid.
+ * @pyramid_base_height: the width of the base pyramid.
+ * @number_of_pyramid: number of pyramid.
+ * @rotate_degree: the rotate degree of the image.
+ * @en_roi: enable roi.
+ * @src_roi: roi params.
+ * @en_padding: enable padding.
+ * @src_padding: padding params.
+ * @freq_level: frequency level.
+ * @fld_face_num: the number of faces in fld.
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
index e7c4dce39007..b23a9e99c835 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -877,6 +877,9 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_GENERIC_CSI2_24	v4l2_fourcc('M', 'C', '1', 'O') /* 24-bit CSI-2 packed 8-bit metadata */
 #endif
 
+/* Vendor-specific definition: used for the MediaTek camera subsystem's face detection results */
+#define V4L2_META_FMT_MTFD_RESULT v4l2_fourcc('M', 'T', 'f', 'd')
+
 /* priv field value to indicates that subsequent fields are valid. */
 #define V4L2_PIX_FMT_PRIV_MAGIC		0xfeedcafe
 
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


