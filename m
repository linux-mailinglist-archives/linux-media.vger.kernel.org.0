Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B35BA2260CC
	for <lists+linux-media@lfdr.de>; Mon, 20 Jul 2020 15:24:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728142AbgGTNYE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jul 2020 09:24:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728081AbgGTNYB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jul 2020 09:24:01 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2C5EC0619D4
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2020 06:24:00 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id d17so20240184ljl.3
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2020 06:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=UY1nsdPNSUSAf+7YLs436phqwdMpy28An6352a8KdMA=;
        b=WHDkbIXS1LKiXXQSdcPiZnulaypwcekKf5KQa61fI5WKRKDz+n7syHUpQsA9D1s1Rb
         Dl/jcNCpUoRiXIAuIPVtiv+bJNO0FLthaQIlhRVZtWebTtxRTcdNXmITs5tgDm4NpEQ3
         9Ehui6uPqOsqkqEigy5DPXOd2lclWimRV5uMUTYMIku2+01GvrXZU5E27p/O56Mo+GJN
         WgY66eKB7fOv3pgHfKPnr7hd0HmcF7aQ75is2+3g/gM3H8KMnnZaw2TJ/Ym/aUXO8xtm
         +WYyQZ5EYw2Uf9Ue0sJC2mtkq5IYNZ80PYDqygrBN+YzlqQehFxss+a0GofJFuWKLgOo
         MyVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=UY1nsdPNSUSAf+7YLs436phqwdMpy28An6352a8KdMA=;
        b=i+CXNkcZnxRzad84VDfFs6m7CPBGrXvT/Me8QABh8Jnt2MDeOzBKvSahg6upfzhplT
         pVhQSk18AeUrRniB6SEo20Jw49x966UaT8qpuxsy3VqLScFjK67j7XrYbQPZlzl06F3L
         UVGf1JpNELAKgBqatM4atuYqlWrEqKg7ZojwKfKvg82gC81Nt8MpRtk3o5aDVDz0dWuE
         oUYY0RqdTO0Rf4U8eQxhWGnu1VBixFTZVNgEm/RR5uLGMI92Ly2MmPrDYbbO4fDuQx4f
         ecS4WWCwBiPo2awhHuO0OuJ+9aabd5/7OTMu0VZsEUCQUVJbIBE68hdxGxlLNDat5BBB
         QWAg==
X-Gm-Message-State: AOAM531LJZU3JFi5iekxVY0EcrzcU2f6TxmCJymhhQqKT1vIf6IygElS
        Y96E5tpp2coQ2Ce3GvjLayGOoC3NRmQ=
X-Google-Smtp-Source: ABdhPJwn2QfqIIAwwdyfcJ7ddwVcrd4mwvFEAZLOkZmR0mP9kKGdVj8GwTiAQ5YgKc3z3tgxzyVUlA==
X-Received: by 2002:a2e:7a03:: with SMTP id v3mr11175750ljc.141.1595251439058;
        Mon, 20 Jul 2020 06:23:59 -0700 (PDT)
Received: from localhost.localdomain ([195.24.90.54])
        by smtp.gmail.com with ESMTPSA id h6sm867829lfc.84.2020.07.20.06.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 06:23:58 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kamil Debski <kamil@wypas.org>,
        Jeongtae Park <jtp.park@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maheshwar Ajja <majja@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 2/6] venus: venc: Add support for constant quality control
Date:   Mon, 20 Jul 2020 16:23:09 +0300
Message-Id: <20200720132313.4810-3-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200720132313.4810-1-stanimir.varbanov@linaro.org>
References: <20200720132313.4810-1-stanimir.varbanov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Adds implementation of V4L2_CID_MPEG_VIDEO_CONSTANT_QUALITY v4l
control when the bitrate mode is CQ.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/core.h      |  1 +
 drivers/media/platform/qcom/venus/hfi_cmds.c  | 37 ++++++++++++++++++-
 .../media/platform/qcom/venus/hfi_helper.h    | 10 ++++-
 drivers/media/platform/qcom/venus/venc.c      | 14 ++++++-
 .../media/platform/qcom/venus/venc_ctrls.c    |  8 +++-
 5 files changed, 66 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 7118612673c9..1bac30d4cf50 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -201,6 +201,7 @@ struct venc_controls {
 	u32 bitrate;
 	u32 bitrate_peak;
 	u32 rc_enable;
+	u32 const_quality;
 
 	u32 h264_i_period;
 	u32 h264_entropy_mode;
diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.c b/drivers/media/platform/qcom/venus/hfi_cmds.c
index c67e412f8201..7022368c1e63 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.c
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.c
@@ -640,6 +640,7 @@ static int pkt_session_set_property_1x(struct hfi_session_set_property_pkt *pkt,
 		case HFI_RATE_CONTROL_CBR_VFR:
 		case HFI_RATE_CONTROL_VBR_CFR:
 		case HFI_RATE_CONTROL_VBR_VFR:
+		case HFI_RATE_CONTROL_CQ:
 			break;
 		default:
 			ret = -EINVAL;
@@ -1218,6 +1219,37 @@ pkt_session_set_property_4xx(struct hfi_session_set_property_pkt *pkt,
 	return 0;
 }
 
+static int
+pkt_session_set_property_6xx(struct hfi_session_set_property_pkt *pkt,
+			     void *cookie, u32 ptype, void *pdata)
+{
+	void *prop_data;
+
+	if (!pkt || !cookie || !pdata)
+		return -EINVAL;
+
+	prop_data = &pkt->data[1];
+
+	pkt->shdr.hdr.size = sizeof(*pkt);
+	pkt->shdr.hdr.pkt_type = HFI_CMD_SESSION_SET_PROPERTY;
+	pkt->shdr.session_id = hash32_ptr(cookie);
+	pkt->num_properties = 1;
+	pkt->data[0] = ptype;
+
+	switch (ptype) {
+	case HFI_PROPERTY_CONFIG_HEIC_FRAME_QUALITY: {
+		struct hfi_heic_frame_quality *in = pdata, *cq = prop_data;
+
+		cq->frame_quality = in->frame_quality;
+		pkt->shdr.hdr.size += sizeof(u32) + sizeof(*cq);
+		break;
+	} default:
+		return pkt_session_set_property_4xx(pkt, cookie, ptype, pdata);
+	}
+
+	return 0;
+}
+
 int pkt_session_get_property(struct hfi_session_get_property_pkt *pkt,
 			     void *cookie, u32 ptype)
 {
@@ -1236,7 +1268,10 @@ int pkt_session_set_property(struct hfi_session_set_property_pkt *pkt,
 	if (hfi_ver == HFI_VERSION_3XX)
 		return pkt_session_set_property_3xx(pkt, cookie, ptype, pdata);
 
-	return pkt_session_set_property_4xx(pkt, cookie, ptype, pdata);
+	if (hfi_ver == HFI_VERSION_4XX)
+		return pkt_session_set_property_4xx(pkt, cookie, ptype, pdata);
+
+	return pkt_session_set_property_6xx(pkt, cookie, ptype, pdata);
 }
 
 void pkt_set_version(enum hfi_version version)
diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
index f6613df1d16b..758c70ac26fd 100644
--- a/drivers/media/platform/qcom/venus/hfi_helper.h
+++ b/drivers/media/platform/qcom/venus/hfi_helper.h
@@ -231,6 +231,7 @@
 #define HFI_RATE_CONTROL_VBR_CFR		0x1000003
 #define HFI_RATE_CONTROL_CBR_VFR		0x1000004
 #define HFI_RATE_CONTROL_CBR_CFR		0x1000005
+#define HFI_RATE_CONTROL_CQ			0x1000008
 
 #define HFI_VIDEO_CODEC_H264			0x00000002
 #define HFI_VIDEO_CODEC_H263			0x00000004
@@ -504,6 +505,7 @@
 #define HFI_PROPERTY_CONFIG_VENC_HIER_P_ENH_LAYER		0x200600b
 #define HFI_PROPERTY_CONFIG_VENC_LTRPERIOD			0x200600c
 #define HFI_PROPERTY_CONFIG_VENC_PERF_MODE			0x200600e
+#define HFI_PROPERTY_CONFIG_HEIC_FRAME_QUALITY			0x2006014
 
 /*
  * HFI_PROPERTY_PARAM_VPE_COMMON_START
@@ -520,7 +522,8 @@
 enum hfi_version {
 	HFI_VERSION_1XX,
 	HFI_VERSION_3XX,
-	HFI_VERSION_4XX
+	HFI_VERSION_4XX,
+	HFI_VERSION_6XX,
 };
 
 struct hfi_buffer_info {
@@ -725,6 +728,11 @@ struct hfi_quality_vs_speed {
 	u32 quality_vs_speed;
 };
 
+struct hfi_heic_frame_quality {
+	u32 frame_quality;
+	u32 reserved[3];
+};
+
 struct hfi_quantization {
 	u32 qp_i;
 	u32 qp_p;
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 513bbc07f7bc..4c30c3f3369e 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -740,14 +740,26 @@ static int venc_set_properties(struct venus_inst *inst)
 		rate_control = HFI_RATE_CONTROL_OFF;
 	else if (ctr->bitrate_mode == V4L2_MPEG_VIDEO_BITRATE_MODE_VBR)
 		rate_control = HFI_RATE_CONTROL_VBR_CFR;
-	else
+	else if (ctr->bitrate_mode == V4L2_MPEG_VIDEO_BITRATE_MODE_CBR)
 		rate_control = HFI_RATE_CONTROL_CBR_CFR;
+	else if (ctr->bitrate_mode == V4L2_MPEG_VIDEO_BITRATE_MODE_CQ)
+		rate_control = HFI_RATE_CONTROL_CQ;
 
 	ptype = HFI_PROPERTY_PARAM_VENC_RATE_CONTROL;
 	ret = hfi_session_set_property(inst, ptype, &rate_control);
 	if (ret)
 		return ret;
 
+	if (rate_control == HFI_RATE_CONTROL_CQ && ctr->const_quality) {
+		struct hfi_heic_frame_quality quality = {};
+
+		ptype = HFI_PROPERTY_CONFIG_HEIC_FRAME_QUALITY;
+		quality.frame_quality = ctr->const_quality;
+		ret = hfi_session_set_property(inst, ptype, &quality);
+		if (ret)
+			return ret;
+	}
+
 	if (!ctr->bitrate)
 		bitrate = 64000;
 	else
diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers/media/platform/qcom/venus/venc_ctrls.c
index 8362dde7949e..97a1e821c07e 100644
--- a/drivers/media/platform/qcom/venus/venc_ctrls.c
+++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
@@ -202,6 +202,9 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE:
 		ctr->rc_enable = ctrl->val;
 		break;
+	case V4L2_CID_MPEG_VIDEO_CONSTANT_QUALITY:
+		ctr->const_quality = ctrl->val;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -217,7 +220,7 @@ int venc_ctrl_init(struct venus_inst *inst)
 {
 	int ret;
 
-	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 31);
+	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 32);
 	if (ret)
 		return ret;
 
@@ -357,6 +360,9 @@ int venc_ctrl_init(struct venus_inst *inst)
 	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
 			  V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE, 0, 1, 1, 1);
 
+	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_CONSTANT_QUALITY, 0, 100, 1, 0);
+
 	ret = inst->ctrl_handler.error;
 	if (ret)
 		goto err;
-- 
2.17.1

