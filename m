Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A3DF314C16
	for <lists+linux-media@lfdr.de>; Tue,  9 Feb 2021 10:51:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231245AbhBIJtI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Feb 2021 04:49:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230470AbhBIJrF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Feb 2021 04:47:05 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58722C061793
        for <linux-media@vger.kernel.org>; Tue,  9 Feb 2021 01:46:25 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id z6so20750954wrq.10
        for <linux-media@vger.kernel.org>; Tue, 09 Feb 2021 01:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fSiros/bpA33DrxLIopBprg2PSwxl41ia1ZrqmhCZho=;
        b=vuymAfDyb9XWQJGjC4tFRu9OpDkqZ6wpjb+3cg+oJtEvl6F3yIguUVh2zjmPp0e/vk
         +glgf+5EvIHURqr9BnMpmoPB3fyPZQFNXrox+OkaUC/8lHwp8GbR+37c/V04gVQS0AvI
         5YYUbIf2uAq+uXt1vWaOU9wMWhxFNFF+YRfmDhqcPILso0AfKV3pRkZBSElXEhHe155H
         jBL15Mghp1LSsKAjzZbHsuHGTjGGgCuWq+S7cWKzaAG8eB9l6fX9bOioNgVUCM4owsG5
         3wskIW5DkZ78EPcPvchpZecKfdvbcu/u5vf/0DMGA/faJOnaoe8krNwjgKAZNPyKt7O+
         YrkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fSiros/bpA33DrxLIopBprg2PSwxl41ia1ZrqmhCZho=;
        b=BNwS+uYOlcfHG71Q/9mfnwN3Kmn0icWUvHk40y4EVVxLZm+3Vw9lVeQx5ERYchacLE
         LY8QWCZgY2aNyKuk2BRxjs0KcWqd53TROwf571kWnHyzW6xOBcTgdycMmBwGc0z/wSXd
         7LRiFUqS0UKpGvxwm5F19jHfiE7eroUlSv/4sZILoqWR9TXC6icskhvTmbfef4Dg6y7v
         rbgZXZ7/tEuBFIRwRQCphJJ4bcxxVqn4ASgsDbnnfaVfOnj0Rudicq8gTVGgVDmZpBAo
         MelHUXdn31iTCI3ERx2GUTO0CwxrK71+DAoGlfPAUkf6aVeaZ7PiaUlmwTBQlkC4tO20
         18+w==
X-Gm-Message-State: AOAM532tATqP8lAhFUaLn7eeOdZwdlqAGZmtFVLvbdiM+RKVeep+WQMe
        NgQW6fSFdPXhZj7hIgI7+icDkSKmJZhSdNFI
X-Google-Smtp-Source: ABdhPJy36oew79AJSVFEq7CckGFITCQIAO8op7d15QP81YFpuwBohfOwZRePgfOx82jKXyxQUCt7tQ==
X-Received: by 2002:adf:f749:: with SMTP id z9mr23848375wrp.327.1612863983827;
        Tue, 09 Feb 2021 01:46:23 -0800 (PST)
Received: from localhost.localdomain (hst-221-63.medicom.bg. [84.238.221.63])
        by smtp.gmail.com with ESMTPSA id u14sm1509627wro.10.2021.02.09.01.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 01:46:23 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 2/2] venus: vdec: Add support for conceal control
Date:   Tue,  9 Feb 2021 11:45:27 +0200
Message-Id: <20210209094527.2173690-3-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210209094527.2173690-1-stanimir.varbanov@linaro.org>
References: <20210209094527.2173690-1-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Adds support for decoder conceal color control.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/core.h       |  1 +
 drivers/media/platform/qcom/venus/hfi_cmds.c   | 18 ++++++++++++++++--
 drivers/media/platform/qcom/venus/hfi_helper.h | 10 ++++++++++
 drivers/media/platform/qcom/venus/vdec.c       | 11 ++++++++++-
 drivers/media/platform/qcom/venus/vdec_ctrls.c |  7 +++++++
 5 files changed, 44 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index a252ed32cc14..b70ff14e5a5b 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -172,6 +172,7 @@ struct vdec_controls {
 	u32 post_loop_deb_mode;
 	u32 profile;
 	u32 level;
+	u64 conceal_color;
 };
 
 struct venc_controls {
diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.c b/drivers/media/platform/qcom/venus/hfi_cmds.c
index 4f7565834469..884339aae6a7 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.c
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.c
@@ -760,7 +760,9 @@ static int pkt_session_set_property_1x(struct hfi_session_set_property_pkt *pkt,
 		struct hfi_conceal_color *color = prop_data;
 		u32 *in = pdata;
 
-		color->conceal_color = *in;
+		color->conceal_color = *in & 0xff;
+		color->conceal_color |= ((*in >> 10) & 0xff) << 8;
+		color->conceal_color |= ((*in >> 20) & 0xff) << 16;
 		pkt->shdr.hdr.size += sizeof(u32) + sizeof(*color);
 		break;
 	}
@@ -1255,7 +1257,19 @@ pkt_session_set_property_6xx(struct hfi_session_set_property_pkt *pkt,
 		cq->frame_quality = in->frame_quality;
 		pkt->shdr.hdr.size += sizeof(u32) + sizeof(*cq);
 		break;
-	} default:
+	}
+	case HFI_PROPERTY_PARAM_VDEC_CONCEAL_COLOR: {
+		struct hfi_conceal_color_v4 *color = prop_data;
+		u32 *in = pdata;
+
+		color->conceal_color_8bit = *in & 0xff;
+		color->conceal_color_8bit |= ((*in >> 10) & 0xff) << 8;
+		color->conceal_color_8bit |= ((*in >> 20) & 0xff) << 16;
+		color->conceal_color_10bit = *in;
+		pkt->shdr.hdr.size += sizeof(u32) + sizeof(*color);
+		break;
+	}
+	default:
 		return pkt_session_set_property_4xx(pkt, cookie, ptype, pdata);
 	}
 
diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
index 6b524c7cde5f..fa49b49170b7 100644
--- a/drivers/media/platform/qcom/venus/hfi_helper.h
+++ b/drivers/media/platform/qcom/venus/hfi_helper.h
@@ -685,10 +685,20 @@ struct hfi_vc1e_perf_cfg_type {
 	u32 search_range_y_subsampled[3];
 };
 
+/*
+ * 0 - 7bit -> Luma (def: 16)
+ * 8 - 15bit -> Chroma (def: 128)
+ * format is valid up to v4
+ */
 struct hfi_conceal_color {
 	u32 conceal_color;
 };
 
+struct hfi_conceal_color_v4 {
+	u32 conceal_color_8bit;
+	u32 conceal_color_10bit;
+};
+
 struct hfi_intra_period {
 	u32 pframes;
 	u32 bframes;
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index e4dc97f00fc3..8d98fca55db1 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -620,7 +620,7 @@ static int vdec_set_properties(struct venus_inst *inst)
 {
 	struct vdec_controls *ctr = &inst->controls.dec;
 	struct hfi_enable en = { .enable = 1 };
-	u32 ptype;
+	u32 ptype, conceal;
 	int ret;
 
 	if (ctr->post_loop_deb_mode) {
@@ -630,6 +630,15 @@ static int vdec_set_properties(struct venus_inst *inst)
 			return ret;
 	}
 
+	ptype = HFI_PROPERTY_PARAM_VDEC_CONCEAL_COLOR;
+	conceal = ctr->conceal_color & 0xffff;
+	conceal |= ((ctr->conceal_color >> 16) & 0xffff) << 10;
+	conceal |= ((ctr->conceal_color >> 32) & 0xffff) << 20;
+
+	ret = hfi_session_set_property(inst, ptype, &conceal);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
diff --git a/drivers/media/platform/qcom/venus/vdec_ctrls.c b/drivers/media/platform/qcom/venus/vdec_ctrls.c
index 974110b75b93..9ff3db1c4a0f 100644
--- a/drivers/media/platform/qcom/venus/vdec_ctrls.c
+++ b/drivers/media/platform/qcom/venus/vdec_ctrls.c
@@ -30,6 +30,9 @@ static int vdec_op_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_MPEG_VIDEO_VP9_LEVEL:
 		ctr->level = ctrl->val;
 		break;
+	case V4L2_CID_MPEG_VIDEO_DEC_CONCEAL_COLOR:
+		ctr->conceal_color = *ctrl->p_new.p_s64;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -158,6 +161,10 @@ int vdec_ctrl_init(struct venus_inst *inst)
 	if (ctrl)
 		ctrl->flags |= V4L2_CTRL_FLAG_VOLATILE;
 
+	v4l2_ctrl_new_std(&inst->ctrl_handler, &vdec_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_DEC_CONCEAL_COLOR, 0,
+			  0xffffffffffffLL, 1, 0x8000800010LL);
+
 	ret = inst->ctrl_handler.error;
 	if (ret) {
 		v4l2_ctrl_handler_free(&inst->ctrl_handler);
-- 
2.25.1

