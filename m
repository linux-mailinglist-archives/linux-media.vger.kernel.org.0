Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 735A47BA63C
	for <lists+linux-media@lfdr.de>; Thu,  5 Oct 2023 18:33:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231175AbjJEQce (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Oct 2023 12:32:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232524AbjJEQcV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Oct 2023 12:32:21 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F70B5C695
        for <linux-media@vger.kernel.org>; Thu,  5 Oct 2023 07:50:50 -0700 (PDT)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 395C5OJ5014192;
        Thu, 5 Oct 2023 15:37:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding:content-type; s=
        selector1; bh=z7mZwxfo000nV9RjYsAl7O2aw4iXhCX5I97+YBsYwPk=; b=6g
        VeJ9N9r2gM9fUz0oml/1fh6Nrl/ngaTS6jHSEed0gb+Zco0HuqsR0tVUTKrucZRj
        bwkwhroeVL/lRg/jVWtekaqILtmYKF62ZYgb5m9LDbW8fXUEtpkwn8DrECST7ddR
        0xAP+FKEXmbzTyunRc5pwyU2puMm1sADzXPa7gA+VzyTsVvd+CGJU9+oWOcaUB4A
        9G5gKAhEOoS1XqM7lApL8hQqfAzdq+TnTh7tx0s7pH0fpJZ0C7xPjHPvPC5KxKgg
        EZ+/ZJw2Xc/4g4P8eLGSZiz+4ukPQ+SOFHpibNXvCaN/ZiuoJGLgVPKyc/9MM8SQ
        koZ5ihKnE5eiuteJldBA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3thvu4gcd2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 05 Oct 2023 15:37:32 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F2C9310005D;
        Thu,  5 Oct 2023 15:37:31 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E886324AAE8;
        Thu,  5 Oct 2023 15:37:31 +0200 (CEST)
Received: from localhost (10.201.20.120) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 5 Oct
 2023 15:37:31 +0200
From:   Hugues Fruchet <hugues.fruchet@foss.st.com>
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        <linux-media@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
CC:     Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Adam Ford <aford173@gmail.com>
Subject: [RFC v2 1/6] media: uapi: Add VP8 stateless encoder controls
Date:   Thu, 5 Oct 2023 15:37:05 +0200
Message-ID: <20231005133710.3589080-2-hugues.fruchet@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231005133710.3589080-1-hugues.fruchet@foss.st.com>
References: <20231005133710.3589080-1-hugues.fruchet@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.201.20.120]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-05_08,2023-10-05_01,2023-05-22_02
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

Add uAPI for stateless VP8 encoders.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 drivers/media/v4l2-core/v4l2-ctrls-core.c | 13 ++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c |  5 ++
 include/media/v4l2-ctrls.h                |  2 +
 include/uapi/linux/v4l2-controls.h        | 91 +++++++++++++++++++++++
 include/uapi/linux/videodev2.h            |  3 +
 5 files changed, 114 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index a662fb60f73f..c7799ceb3d6d 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -811,6 +811,7 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 	struct v4l2_ctrl_hevc_pps *p_hevc_pps;
 	struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering;
 	struct v4l2_ctrl_hevc_decode_params *p_hevc_decode_params;
+	struct v4l2_ctrl_vp8_encode_params *p_vp8_encode_params;
 	struct v4l2_area *area;
 	void *p = ptr.p + idx * ctrl->elem_size;
 	unsigned int i;
@@ -1047,6 +1048,15 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 		zero_padding(p_vp8_frame->coder_state);
 		break;
 
+	case V4L2_CTRL_TYPE_VP8_ENCODE_PARAMS:
+		p_vp8_encode_params = p;
+		if (p_vp8_encode_params->loop_filter_level > 63)
+			return -EINVAL;
+
+		if (p_vp8_encode_params->sharpness_level > 7)
+			return -EINVAL;
+		break;
+
 	case V4L2_CTRL_TYPE_HEVC_SPS:
 		p_hevc_sps = p;
 
@@ -1868,6 +1878,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	case V4L2_CTRL_TYPE_AREA:
 		elem_size = sizeof(struct v4l2_area);
 		break;
+	case V4L2_CTRL_TYPE_VP8_ENCODE_PARAMS:
+		elem_size = sizeof(struct v4l2_ctrl_vp8_encode_params);
+		break;
 	default:
 		if (type < V4L2_CTRL_COMPOUND_TYPES)
 			elem_size = sizeof(s32);
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index 8696eb1cdd61..bd26f1d89bd5 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -1236,6 +1236,8 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_STATELESS_AV1_TILE_GROUP_ENTRY:		return "AV1 Tile Group Entry";
 	case V4L2_CID_STATELESS_AV1_FRAME:			return "AV1 Frame Parameters";
 	case V4L2_CID_STATELESS_AV1_FILM_GRAIN:			return "AV1 Film Grain";
+	case V4L2_CID_STATELESS_VP8_ENCODE_PARAMS:		return "VP8 Encode Parameters";
+	case V4L2_CID_STATELESS_VP8_ENCODE_QP:			return "VP8 Encode QP";
 
 	/* Colorimetry controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
@@ -1592,6 +1594,9 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_STATELESS_AV1_FILM_GRAIN:
 		*type = V4L2_CTRL_TYPE_AV1_FILM_GRAIN;
 		break;
+	case V4L2_CID_STATELESS_VP8_ENCODE_PARAMS:
+		*type = V4L2_CTRL_TYPE_VP8_ENCODE_PARAMS;
+		break;
 	case V4L2_CID_UNIT_CELL_SIZE:
 		*type = V4L2_CTRL_TYPE_AREA;
 		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index 59679a42b3e7..a165719e1139 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -56,6 +56,7 @@ struct video_device;
  * @p_av1_tile_group_entry:	Pointer to an AV1 tile group entry structure.
  * @p_av1_frame:		Pointer to an AV1 frame structure.
  * @p_av1_film_grain:		Pointer to an AV1 film grain structure.
+ * @p_vp8_encode_params:	Pointer to a VP8 encode parameter structure.
  * @p:				Pointer to a compound value.
  * @p_const:			Pointer to a constant compound value.
  */
@@ -89,6 +90,7 @@ union v4l2_ctrl_ptr {
 	struct v4l2_ctrl_av1_tile_group_entry *p_av1_tile_group_entry;
 	struct v4l2_ctrl_av1_frame *p_av1_frame;
 	struct v4l2_ctrl_av1_film_grain *p_av1_film_grain;
+	struct v4l2_ctrl_vp8_encode_params *p_vp8_encode_params;
 	void *p;
 	const void *p_const;
 };
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index c3604a0a3e30..fdec5764e09c 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -3479,6 +3479,97 @@ struct v4l2_ctrl_av1_film_grain {
 	__u8 reserved[4];
 };
 
+#define V4L2_CID_STATELESS_VP8_ENCODE_PARAMS	(V4L2_CID_CODEC_STATELESS_BASE + 601)
+
+#define V4L2_VP8_FRAME_FLAG_SHOWFRAME			0x1
+#define V4L2_VP8_FRAME_FLAG_GOLDEN_REFRESH		0x2
+#define V4L2_VP8_FRAME_FLAG_ALTREF_REFRESH		0x4
+#define V4L2_VP8_FRAME_FLAG_SEGMENT_ENABLED		0x8
+#define V4L2_VP8_FRAME_FLAG_LOOP_FILTER_ADJ_ENABLED	0x10
+#define V4L2_VP8_FRAME_FLAG_REFRESH_ENTROPY_PROBS	0x20
+
+#define V4L2_VP8_FRAME_TYPE_KEYFRAME	0
+#define V4L2_VP8_FRAME_TYPE_INTER	1
+
+#define V4L2_VP8_FRAME_COLOR_SPACE_YUV		0
+#define V4L2_VP8_FRAME_COLOR_SPACE_RESERVED	1
+
+#define V4L2_VP8_FRAME_CLAMPING_REQUIRED	0
+#define V4L2_VP8_FRAME_CLAMPING_NO		1
+
+#define V4L2_VP8_FRAME_FILTER_TYPE_NORMAL	0
+#define V4L2_VP8_FRAME_FILTER_TYPE_SIMPLE	1
+
+#define V4L2_VP8_FRAME_NBR_DCT_PARTITIONS_1	0
+#define V4L2_VP8_FRAME_NBR_DCT_PARTITIONS_2	1
+#define V4L2_VP8_FRAME_NBR_DCT_PARTITIONS_4	2
+#define V4L2_VP8_FRAME_NBR_DCT_PARTITIONS_8	3
+
+#define V4L2_VP8_FRAME_GOLDEN_KEEP		0
+#define V4L2_VP8_FRAME_GOLDEN_LASTFRAME		1
+#define V4L2_VP8_FRAME_GOLDEN_ALTREF		2
+
+#define V4L2_VP8_FRAME_ALTREF_KEEP		0
+#define V4L2_VP8_FRAME_ALTREF_LASTFRAME		1
+#define V4L2_VP8_FRAME_ALTREF_GOLDEN		2
+
+#define V4L2_VP8_FRAME_REF_LAST		0
+#define V4L2_VP8_FRAME_REF_GOLDEN	1
+#define V4L2_VP8_FRAME_REF_ALT		2
+
+/**
+ * struct v4l2_ctrl_vp8_encode_params - VP8 encode parameters
+ * @flags: combination of V4L2_VP8_FRAME_FLAG_{} flags.
+ * @frame_type: specifies the frame type (key or inter).
+ *		Set to one of V4L2_VP8_FRAME_TYPE_{}.
+ * @color_space: defines the YUV color space of the sequence.
+ *		 V4L2_VP8_FRAME_TYPE_INTER frames shall set this field to zero.
+ *		 Set to one of V4L2_VP8_FRAME_COLOR_SPACE_{}.
+ * @clamping_type: defines pixel value clamping type.
+ *		   V4L2_VP8_FRAME_TYPE_INTER frames shall set this field to zero.
+ *		   Set to one of V4L2_VP8_FRAME_CLAMPING_{}.
+ * @loop_filter_type: selects the type of loop filter applied.
+ *		      Set to one of V4L2_VP8_FRAME_FILTER_TYPE_{}.
+ * @loop_filter_level: sets the strength of the applied loop filter.
+ *		       Set to a value from the rage 0..63.
+ * @sharpness_level: sets the sharpness of the applied loop filter.
+ *		     Set to a value from the range 0..7.
+ * @log2_nbr_of_dct_partitions: determines the number of separate partitions
+ *				containing the DCT coefficients of macroblocks.
+ *				Set to one of V4L2_VP8_FRAME_NBR_DCT_PARTITIONS_{}.
+ * @prob_intra: indicates the probability of an intra macroblock.
+ *		Set to a value from the range 0..255.
+ * @prob_last: indicates the probability that the last reference frame is used for inter-prediction.
+ *	       Set to a value from the range 0..255.
+ * @prob_gf: indicates the probability that the golden reference frame is used for inter-prediction.
+ *	     Set to a value from the range 0..255.
+ * @copy_buffer_to_golden: specifies the golden frame refresh strategy.
+ *			   Set to one of V4L2_VP8_FRAME_FLAG_GOLDEN_{}.
+ * @copy_buffer_to_alternate: specifies the atlref frame refresh strategy.
+ *			      Set to one of V4L2_VP8_FRAME_FLAG_ALTREF_{}.
+ * @reference_type: specifies what kind of reference to use for current inter frame.
+ *		    V4L2_VP8_FRAME_TYPE_KEYFRAME shall set this field to zero.
+ *		    Set to one of V4L2_VP8_FRAME_REF_{}.
+ */
+struct v4l2_ctrl_vp8_encode_params {
+	__u32 flags;
+	__u8 frame_type;
+	__u8 color_space;
+	__u8 clamping_type;
+	__u8 loop_filter_type;
+	__u8 loop_filter_level;
+	__u8 sharpness_level;
+	__u8 log2_nbr_of_dct_partitions;
+	__u8 prob_intra;
+	__u8 prob_last;
+	__u8 prob_gf;
+	__u8 copy_buffer_to_golden;
+	__u8 copy_buffer_to_alternate;
+	__u8 reference_type;
+};
+
+#define V4L2_CID_STATELESS_VP8_ENCODE_QP	(V4L2_CID_CODEC_STATELESS_BASE + 602)
+
 /* MPEG-compression definitions kept for backwards compatibility */
 #ifndef __KERNEL__
 #define V4L2_CTRL_CLASS_MPEG            V4L2_CTRL_CLASS_CODEC
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 78260e5d9985..b3cbdc60b82c 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1836,6 +1836,7 @@ struct v4l2_ext_control {
 		struct v4l2_ctrl_av1_tile_group_entry __user *p_av1_tile_group_entry;
 		struct v4l2_ctrl_av1_frame __user *p_av1_frame;
 		struct v4l2_ctrl_av1_film_grain __user *p_av1_film_grain;
+		struct v4l2_ctrl_vp8_encode_params __user *p_vp8_encode_params;
 		void __user *ptr;
 	};
 } __attribute__ ((packed));
@@ -1914,6 +1915,8 @@ enum v4l2_ctrl_type {
 	V4L2_CTRL_TYPE_AV1_TILE_GROUP_ENTRY = 0x281,
 	V4L2_CTRL_TYPE_AV1_FRAME	    = 0x282,
 	V4L2_CTRL_TYPE_AV1_FILM_GRAIN	    = 0x283,
+
+	V4L2_CTRL_TYPE_VP8_ENCODE_PARAMS	= 0x0290,
 };
 
 /*  Used in the VIDIOC_QUERYCTRL ioctl for querying controls */
-- 
2.25.1

