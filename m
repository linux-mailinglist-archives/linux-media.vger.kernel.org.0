Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8076E345FBF
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 14:36:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231526AbhCWNgH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 09:36:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231500AbhCWNfg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 09:35:36 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56540C061764
        for <linux-media@vger.kernel.org>; Tue, 23 Mar 2021 06:35:36 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id u9so27136291ejj.7
        for <linux-media@vger.kernel.org>; Tue, 23 Mar 2021 06:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tsEGpa4dqu8Xcycnuv/YrEf3ZyFT/539KnPTDuqzdP8=;
        b=mH9DyFhrr5BDsaj0c1NV4J7A2ukBV1DFd8j3i/o1qXbPmU1xxOFgIrvCIzD9yn+sz0
         r2Gb5Dq+5JcXWvjBjObjvLQ3/bmJxtAbn6OmZ/fM4H7AlCy4OQ2YmBzMqLlHs+vVjOsD
         hxGA1byVN8ode5lkSu9Nqw9KdG3w4gN1UheWkNvmYl3ELkOXzoH805/1YQHJWjxVW9ec
         7awsvuyVOhHmatQlwJ/ewBeU/u7lQ0A5h97COpOAW1ocidnmn9oofXcv1rHtsBt5Wa/4
         DhZOgVuQxRexG6C1qCklHBIRZjjFkcY+ZqKaN0ojps6v8A6hUjWAi3eAGYLCqB7EYk9M
         Jv+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tsEGpa4dqu8Xcycnuv/YrEf3ZyFT/539KnPTDuqzdP8=;
        b=cdrtgK/busLgRZyl+gYDq3MWZbWcmKqFpQyYWPcXd7NqMcwOMh8f6L0QL8hBlC+1te
         Z6TM5/IFmqMdni0wgp6gIn+EEbUbizqd/1heXQziiaivfTyc12TKpv6ighmMdh0E94ld
         tt3d59Np4dmShJF+AK5EysVPPwjsZV2SEwfVyTxsysXsdWO7/xeBH5QH141ceAdFu+WA
         iUB0sBTaNgICdnRsrLzB5xNDYimxoAmsQbFFi1JKiG2q1NAXi02hFPhwtY9bWq4crOzY
         0bJ5XxmDGP3Fpq+8ZkobxI4vA6y62lZ5pTRxoNmmI8wXvLnDRdHSgrO0Mzf7Nm+LFSUM
         VTvA==
X-Gm-Message-State: AOAM530cCuaCBEeAqXKN5RncspztwD0i/YuD+R9+kgF5oQDBYr3dAVQ4
        fW1Z69DKaLqJTDDg090/NVOexqvVJhFXO4gx
X-Google-Smtp-Source: ABdhPJwPqixCXPHpTdqmHxHjcReynBvL6XTAPgly76xA/rzaqs2csiRUYGIcvBS/GHLwKgtcubrbIg==
X-Received: by 2002:a17:906:379b:: with SMTP id n27mr5154146ejc.182.1616506534885;
        Tue, 23 Mar 2021 06:35:34 -0700 (PDT)
Received: from localhost.localdomain (hst-221-103.medicom.bg. [84.238.221.103])
        by smtp.gmail.com with ESMTPSA id m7sm12627104edp.81.2021.03.23.06.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 06:35:34 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v3 2/2] venus: vdec: Add support for conceal control
Date:   Tue, 23 Mar 2021 15:35:20 +0200
Message-Id: <20210323133520.943317-3-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210323133520.943317-1-stanimir.varbanov@linaro.org>
References: <20210323133520.943317-1-stanimir.varbanov@linaro.org>
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
 drivers/media/platform/qcom/venus/vdec_ctrls.c |  9 ++++++++-
 5 files changed, 45 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 13c18c49714d..177b4abcd3a6 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -174,6 +174,7 @@ struct vdec_controls {
 	u32 level;
 	u32 display_delay;
 	u32 display_delay_enable;
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
index c20496a14a55..ecb7deef5785 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -620,7 +620,7 @@ static int vdec_set_properties(struct venus_inst *inst)
 {
 	struct vdec_controls *ctr = &inst->controls.dec;
 	struct hfi_enable en = { .enable = 1 };
-	u32 ptype, decode_order;
+	u32 ptype, decode_order, conceal;
 	int ret;
 
 	if (ctr->post_loop_deb_mode) {
@@ -638,6 +638,15 @@ static int vdec_set_properties(struct venus_inst *inst)
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
index 07680aae0a36..fbe12a608b21 100644
--- a/drivers/media/platform/qcom/venus/vdec_ctrls.c
+++ b/drivers/media/platform/qcom/venus/vdec_ctrls.c
@@ -36,6 +36,9 @@ static int vdec_op_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE:
 		ctr->display_delay_enable = ctrl->val;
 		break;
+	case V4L2_CID_MPEG_VIDEO_DEC_CONCEAL_COLOR:
+		ctr->conceal_color = *ctrl->p_new.p_s64;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -95,7 +98,7 @@ int vdec_ctrl_init(struct venus_inst *inst)
 	struct v4l2_ctrl *ctrl;
 	int ret;
 
-	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 11);
+	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 12);
 	if (ret)
 		return ret;
 
@@ -172,6 +175,10 @@ int vdec_ctrl_init(struct venus_inst *inst)
 			  V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE,
 			  0, 1, 1, 0);
 
+	v4l2_ctrl_new_std(&inst->ctrl_handler, &vdec_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_DEC_CONCEAL_COLOR, 0,
+			  0xffffffffffffLL, 1, 0x8000800010LL);
+
 	ret = inst->ctrl_handler.error;
 	if (ret) {
 		v4l2_ctrl_handler_free(&inst->ctrl_handler);
-- 
2.25.1

