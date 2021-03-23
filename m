Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAF15345FF0
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 14:41:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231668AbhCWNlM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 09:41:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231639AbhCWNlA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 09:41:00 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 317AAC0613D9
        for <linux-media@vger.kernel.org>; Tue, 23 Mar 2021 06:41:00 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id l18so15302814edc.9
        for <linux-media@vger.kernel.org>; Tue, 23 Mar 2021 06:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=54fMzulxyHOS7Wa5z7A+h/N7/JoxoBYIy5OqkE1tzqE=;
        b=NYMIcABAAx9hRWPA5aVHH0/o4nUfU0gfso2WoxLyWfu/VeQfkotYP349F+UvXrfqlz
         pSfmcd4tpv/93FHMEHPhUp/hpyE4iUE8jSAuGr4D+B566YpMp9U7Yc9oygTTo7fQBq39
         hQ0Gj/ZALlp310s+9+G0tMApmHSlBEHwibpMZjlLI9oycHMbs+NnlPBzsMNctF4A9lcN
         PzxYCMEN6OnmHqkdMxE7BZrpfdw5VNnhBJ/mnvb/MeTEJCGHo2y0XLXwn7V6IS7A+pvZ
         2gAEBBr8dS/b+0qo0isYgM2ccDhYe9CnrxKhTXCAsTNQNOkd5gxNJjayOH2sMIMFXl8f
         CUTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=54fMzulxyHOS7Wa5z7A+h/N7/JoxoBYIy5OqkE1tzqE=;
        b=NXHzBhB7Xu2Zx3VYsFgGY4hok4DDC662P0tdtvoI8L28agUDx8sI2/xXZOzbH5p60b
         KzRoqacdGRL5pDAAGHcNRr6W1ZuHJe2oVXkBkeRplBE+glaZLVdmWDPAeDXgyVs/e54V
         7cRF2p5j+ehsDb1gdSrUJydwQS6QGpNZ/688wLWm9op3MkfQk9QdxLH8mbi6sfyAaS4w
         1V3D8lu043zPibpSAili4zFWgtW8aJOhazV0bEFyFARqKdDWzLTPiTnhJ2YsPu7GwOlq
         UCl861dSXduzKBCK8VENzyvZeQrH5gc1kKdYCgg5OYFZCr+DFekYVLtPDzT2G8ez6Duc
         sq7g==
X-Gm-Message-State: AOAM533l5WRrfhNbRXbPHwZejs4GL9FXEtfSR6xCvEJQtc5JZjREIOQR
        FzH3NkGNUecz/MvjYvDz9qLVNiWwAEtPaPZV
X-Google-Smtp-Source: ABdhPJwmrBCy5LjD2ofrZz51sHL9i8AO+gMPXPLF+m4PLspzUBSBFEWsX6OKazsFo2Xut4BQXCHX6w==
X-Received: by 2002:a05:6402:549:: with SMTP id i9mr4746720edx.379.1616506858726;
        Tue, 23 Mar 2021 06:40:58 -0700 (PDT)
Received: from localhost.localdomain (hst-221-13.medicom.bg. [84.238.221.13])
        by smtp.gmail.com with ESMTPSA id r10sm11207317eju.66.2021.03.23.06.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 06:40:58 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl, ezequiel@collabora.com,
        nicolas.dufresne@collabora.com,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v6 5/5] venus: venc: Add support for CLL and Mastering display controls
Date:   Tue, 23 Mar 2021 15:40:40 +0200
Message-Id: <20210323134040.943757-6-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210323134040.943757-1-stanimir.varbanov@linaro.org>
References: <20210323134040.943757-1-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Create CLL and Mastering display colour volume v4l2 controls for
encoder, add handling of HDR10 PQ SEI packet payloads for v4.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/core.h      |  2 ++
 drivers/media/platform/qcom/venus/hfi_cmds.c  |  8 +++++
 .../media/platform/qcom/venus/hfi_helper.h    | 20 +++++++++++++
 drivers/media/platform/qcom/venus/venc.c      | 29 +++++++++++++++++++
 .../media/platform/qcom/venus/venc_ctrls.c    | 16 +++++++++-
 5 files changed, 74 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 13c18c49714d..029f620a28ff 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -241,6 +241,8 @@ struct venc_controls {
 	} level;
 
 	u32 base_priority_id;
+	struct v4l2_ctrl_hdr10_cll_info cll;
+	struct v4l2_ctrl_hdr10_mastering_display mastering;
 };
 
 struct venus_buffer {
diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.c b/drivers/media/platform/qcom/venus/hfi_cmds.c
index 4f7565834469..d2edf3896cf1 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.c
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.c
@@ -1217,6 +1217,14 @@ pkt_session_set_property_4xx(struct hfi_session_set_property_pkt *pkt,
 		pkt->shdr.hdr.size += sizeof(u32) + sizeof(*info);
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
index 6b524c7cde5f..d32d926c7b2c 100644
--- a/drivers/media/platform/qcom/venus/hfi_helper.h
+++ b/drivers/media/platform/qcom/venus/hfi_helper.h
@@ -513,6 +513,7 @@
 #define HFI_PROPERTY_PARAM_VENC_VPX_ERROR_RESILIENCE_MODE	0x2005029
 #define HFI_PROPERTY_PARAM_VENC_HIER_B_MAX_NUM_ENH_LAYER	0x200502c
 #define HFI_PROPERTY_PARAM_VENC_HIER_P_HYBRID_MODE		0x200502f
+#define HFI_PROPERTY_PARAM_VENC_HDR10_PQ_SEI			0x2005036
 
 /*
  * HFI_PROPERTY_CONFIG_VENC_COMMON_START
@@ -809,6 +810,25 @@ struct hfi_ltr_mark {
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
index 505d092dc433..855761c01276 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -612,6 +612,35 @@ static int venc_set_properties(struct venus_inst *inst)
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
+			ctr->mastering.max_display_mastering_luminance;
+		hdr10.mastering.min_display_mastering_luminance =
+			ctr->mastering.min_display_mastering_luminance;
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
 	if (ctr->num_b_frames) {
 		u32 max_num_b_frames = NUM_B_FRAMES_MAX;
 
diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers/media/platform/qcom/venus/venc_ctrls.c
index 16d6c64d5f64..8a7cf6960811 100644
--- a/drivers/media/platform/qcom/venus/venc_ctrls.c
+++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
@@ -279,6 +279,12 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_MPEG_VIDEO_AU_DELIMITER:
 		ctr->aud_enable = ctrl->val;
 		break;
+	case V4L2_CID_COLORIMETRY_HDR10_CLL_INFO:
+		ctr->cll = *ctrl->p_new.p_hdr10_cll;
+		break;
+	case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:
+		ctr->mastering = *ctrl->p_new.p_hdr10_mastering;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -294,7 +300,7 @@ int venc_ctrl_init(struct venus_inst *inst)
 {
 	int ret;
 
-	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 52);
+	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 54);
 	if (ret)
 		return ret;
 
@@ -504,6 +510,14 @@ int venc_ctrl_init(struct venus_inst *inst)
 	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
 			  V4L2_CID_MPEG_VIDEO_AU_DELIMITER, 0, 1, 1, 0);
 
+	v4l2_ctrl_new_std_compound(&inst->ctrl_handler, &venc_ctrl_ops,
+				   V4L2_CID_COLORIMETRY_HDR10_CLL_INFO,
+				   v4l2_ctrl_ptr_create(NULL));
+
+	v4l2_ctrl_new_std_compound(&inst->ctrl_handler, &venc_ctrl_ops,
+				   V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY,
+				   v4l2_ctrl_ptr_create(NULL));
+
 	ret = inst->ctrl_handler.error;
 	if (ret)
 		goto err;
-- 
2.25.1

