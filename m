Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D56792AC261
	for <lists+linux-media@lfdr.de>; Mon,  9 Nov 2020 18:32:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731676AbgKIRc3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Nov 2020 12:32:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732084AbgKIRcV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Nov 2020 12:32:21 -0500
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90B05C0613CF
        for <linux-media@vger.kernel.org>; Mon,  9 Nov 2020 09:32:21 -0800 (PST)
Received: by mail-ed1-x543.google.com with SMTP id e18so9643268edy.6
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2020 09:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ezO+DX9s/19HhOfnYGYVPy5hE139zPRMF2WAfs7c5YQ=;
        b=aD/roHpwAG/NHJo6730N73bntrF+DDKc+Y3fCEYr+bv+t0SUqksRQG2yws173ZywNx
         qMBR3Xhj9ScuhqQ2U7UP4CHX5hX+ED0yhX/LtsqQ2PRYCPWJ3oUiisFNVVgWfkxphfC9
         YiyRQ6PBvAfD7R1ct4wFrJ1KDp9GosPPheSKi6FCgA5nOKEtNH9E9Mwa3a6mxzmJrHlJ
         h0MfPuTCgGz/b91UEC/fKo48dpRGXKePqvXG3Zv6hToqqIh+uA0E+BTId5iDrp63Eu0q
         4OfPOfLAooUTq0KTNUmivZNDiUqkbfoDWFW602ULnPbbK5Gtc5BlkiOkPpTC0sYjxuv0
         x1Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ezO+DX9s/19HhOfnYGYVPy5hE139zPRMF2WAfs7c5YQ=;
        b=pvvKBauCqsjjhOtuZs6ymtuI+FQenfENXCmZzhP+hzpNn8cmLXLVnqmTFaW3IICH+0
         zJ/1MTY+wHXRN2DBAHHJHfzYOm103NWMvyyDSz7qzPHfFkBMCw9/48/plXD2jkpoV5Lc
         JrJ5bKBlzE8275STnn+J9CVo1HfaWkPKZcpkEDdp5x5Ib4GoAquRvV2hITLuUtd7cgta
         IXUw9tQHC80X+TIvxn5U49DX6qGduQfNhxYcoTSuhqipcpgGS63tqt4mm8D23yP4O+wu
         eiXTzbnJX/q1eMb1Q0MzWn3/QoE+sSXMtx+CIhXp86t12DPldeyOtY4he24Fw6dxL/5V
         f39Q==
X-Gm-Message-State: AOAM530mfj2+gQRn0rY7rLGDQ8PSsPyC0qDU2aVSOdu3wc9P8vlcmJcq
        wOXqI03Jj7CM4qn//3qMrgj8UGAdw54w9RG/
X-Google-Smtp-Source: ABdhPJyrafy7sjugJ5os+wXhvXf8LWQlbH/JtYhDRARkq4R19Mx8TlNdR2akvfC5FMLnovpZdua5Lw==
X-Received: by 2002:aa7:da44:: with SMTP id w4mr16724948eds.131.1604943140039;
        Mon, 09 Nov 2020 09:32:20 -0800 (PST)
Received: from localhost.localdomain (hst-221-32.medicom.bg. [84.238.221.32])
        by smtp.gmail.com with ESMTPSA id w18sm5037005edq.43.2020.11.09.09.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 09:32:19 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 3/3] venus: venc: Add support for CLL and Mastering display controls
Date:   Mon,  9 Nov 2020 19:31:53 +0200
Message-Id: <20201109173153.23720-4-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201109173153.23720-1-stanimir.varbanov@linaro.org>
References: <20201109173153.23720-1-stanimir.varbanov@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Create CLL and Mastering display colour volume v4l2 controls for
encoder, add handling of HDR10 PQ SEI packet payloads for v4.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/core.h      |  3 ++
 drivers/media/platform/qcom/venus/hfi_cmds.c  |  8 +++++
 .../media/platform/qcom/venus/hfi_helper.h    | 20 +++++++++++++
 drivers/media/platform/qcom/venus/venc.c      | 29 +++++++++++++++++++
 .../media/platform/qcom/venus/venc_ctrls.c    | 16 +++++++++-
 5 files changed, 75 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 7b79a33dc9d6..9d2637983927 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -245,6 +245,9 @@ struct venc_controls {
 
 	u32 profile;
 	u32 level;
+
+	struct v4l2_ctrl_hevc_cll_info cll;
+	struct v4l2_ctrl_hevc_mastering_display mastering;
 };
 
 struct venus_buffer {
diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.c b/drivers/media/platform/qcom/venus/hfi_cmds.c
index 7022368c1e63..081e5a816bca 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.c
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.c
@@ -1205,6 +1205,14 @@ pkt_session_set_property_4xx(struct hfi_session_set_property_pkt *pkt,
 		pkt->shdr.hdr.size += sizeof(u32) + sizeof(*cu);
 		break;
 	}
+	case HFI_PROPERTY_PARAM_VENC_HDR10_PQ_SEI: {
+		struct hfi_hdr10_pq_sei *in = pdata, *hdr10 = prop_data;
+
+		memcpy(hdr10, in, sizeof(*hdr10));
+		pkt->shdr.hdr.size += sizeof(u32) + sizeof(*hdr10);
+		break;
+	}
+
 	case HFI_PROPERTY_CONFIG_VENC_MAX_BITRATE:
 	case HFI_PROPERTY_CONFIG_VDEC_POST_LOOP_DEBLOCKER:
 	case HFI_PROPERTY_PARAM_BUFFER_ALLOC_MODE:
diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
index 60ee2479f7a6..8e8dc6b5c855 100644
--- a/drivers/media/platform/qcom/venus/hfi_helper.h
+++ b/drivers/media/platform/qcom/venus/hfi_helper.h
@@ -506,6 +506,7 @@
 #define HFI_PROPERTY_PARAM_VENC_VPX_ERROR_RESILIENCE_MODE	0x2005029
 #define HFI_PROPERTY_PARAM_VENC_HIER_B_MAX_NUM_ENH_LAYER	0x200502c
 #define HFI_PROPERTY_PARAM_VENC_HIER_P_HYBRID_MODE		0x200502f
+#define HFI_PROPERTY_PARAM_VENC_HDR10_PQ_SEI			0x2005036
 
 /*
  * HFI_PROPERTY_CONFIG_VENC_COMMON_START
@@ -791,6 +792,25 @@ struct hfi_ltr_mark {
 	u32 mark_frame;
 };
 
+struct hfi_mastering_display_colour_sei_payload {
+	u32 display_primaries_x[3];
+	u32 display_primaries_y[3];
+	u32 white_point_x;
+	u32 white_point_y;
+	u32 max_display_mastering_luminance;
+	u32 min_display_mastering_luminance;
+};
+
+struct hfi_content_light_level_sei_payload {
+	u32 max_content_light;
+	u32 max_pic_average_light;
+};
+
+struct hfi_hdr10_pq_sei {
+	struct hfi_mastering_display_colour_sei_payload mastering;
+	struct hfi_content_light_level_sei_payload cll;
+};
+
 struct hfi_framesize {
 	u32 buffer_type;
 	u32 width;
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index f8b1484e7dcd..ae593a6a5a22 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -587,6 +587,35 @@ static int venc_set_properties(struct venus_inst *inst)
 			return ret;
 	}
 
+	if (inst->fmt_cap->pixfmt == V4L2_PIX_FMT_HEVC) {
+		struct hfi_hdr10_pq_sei hdr10;
+		unsigned int c;
+
+		ptype = HFI_PROPERTY_PARAM_VENC_HDR10_PQ_SEI;
+
+		for (c = 0; c < 3; c++) {
+			hdr10.mastering.display_primaries_x[c] =
+				ctr->mastering.display_primaries_x[c];
+			hdr10.mastering.display_primaries_y[c] =
+				ctr->mastering.display_primaries_y[c];
+		}
+
+		hdr10.mastering.white_point_x = ctr->mastering.white_point_x;
+		hdr10.mastering.white_point_y = ctr->mastering.white_point_y;
+		hdr10.mastering.max_display_mastering_luminance =
+			ctr->mastering.max_luminance;
+		hdr10.mastering.min_display_mastering_luminance =
+			ctr->mastering.min_luminance;
+
+		hdr10.cll.max_content_light = ctr->cll.max_content_light_level;
+		hdr10.cll.max_pic_average_light =
+			ctr->cll.max_pic_average_light_level;
+
+		ret = hfi_session_set_property(inst, ptype, &hdr10);
+		if (ret)
+			return ret;
+	}
+
 	/* IDR periodicity, n:
 	 * n = 0 - only the first I-frame is IDR frame
 	 * n = 1 - all I-frames will be IDR frames
diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers/media/platform/qcom/venus/venc_ctrls.c
index 0708b3b89d0c..dab1286cbb1a 100644
--- a/drivers/media/platform/qcom/venus/venc_ctrls.c
+++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
@@ -198,6 +198,12 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE:
 		ctr->frame_skip_mode = ctrl->val;
 		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_CLL_INFO:
+		ctr->cll = *ctrl->p_new.p_hevc_cll;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_MASTERING_DISPLAY:
+		ctr->mastering = *ctrl->p_new.p_hevc_mastering;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -213,7 +219,7 @@ int venc_ctrl_init(struct venus_inst *inst)
 {
 	int ret;
 
-	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 33);
+	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 35);
 	if (ret)
 		return ret;
 
@@ -364,6 +370,14 @@ int venc_ctrl_init(struct venus_inst *inst)
 			       (1 << V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT)),
 			       V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED);
 
+	v4l2_ctrl_new_std_compound(&inst->ctrl_handler, &venc_ctrl_ops,
+				   V4L2_CID_MPEG_VIDEO_HEVC_CLL_INFO,
+				   v4l2_ctrl_ptr_create(NULL));
+
+	v4l2_ctrl_new_std_compound(&inst->ctrl_handler, &venc_ctrl_ops,
+				   V4L2_CID_MPEG_VIDEO_HEVC_MASTERING_DISPLAY,
+				   v4l2_ctrl_ptr_create(NULL));
+
 	ret = inst->ctrl_handler.error;
 	if (ret)
 		goto err;
-- 
2.17.1

