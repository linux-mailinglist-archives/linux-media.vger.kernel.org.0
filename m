Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2DE532A86A
	for <lists+linux-media@lfdr.de>; Tue,  2 Mar 2021 18:44:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349828AbhCBRgn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Mar 2021 12:36:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343994AbhCBLse (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Mar 2021 06:48:34 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC914C0617AA
        for <linux-media@vger.kernel.org>; Tue,  2 Mar 2021 03:44:38 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id l12so24751678edt.3
        for <linux-media@vger.kernel.org>; Tue, 02 Mar 2021 03:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fSiros/bpA33DrxLIopBprg2PSwxl41ia1ZrqmhCZho=;
        b=CNiOAB/aDlzJx9jbByOgDWXCKNWzh8AJzgEz0m4qj5XspiYYDgtMl9nEejj/Y+v5oS
         qLbKQ9CvJaJ3+NrID6Tu+BUBGvcrrc61b8jK6nSFt830rNnGPFwzLYfYSdxzpq4LWwar
         DYgblksxROekZQeRoThk7ywNOChEPN5LiWDmF4Tdl+ahUIdLsHg6SaGnyGTi7qvaA+kI
         HYb4d+9Wwq4GT+nu7qnZSuTaqdje8i9mougNcFj0RpGnJLuummJovJ7CtGOBS+A6arNt
         NQ7UkYoZrRjFmnfN2VSGxYUOlugz2BY0hu+krFNXB5UbUbbxpRYAGhK11g9d5eCYxgkM
         /xDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fSiros/bpA33DrxLIopBprg2PSwxl41ia1ZrqmhCZho=;
        b=fgxNr92L6PO63HK8m4Ak7uz0Hd28ZUCIPP1e9S876jHT1K2YAEKCZfTWDTefIObSr/
         Rv4cZZH6aKDU4gW66xZ5ZhyXlElRzx49ksaXFq4U9xj0X+EWJC+Kh/p/rLHV9M/roKhh
         MsTdAiXdryLsT7A+NrqUAXzafMuEWX4FGzPfsbNprK0u3WqiHtfJSaGSP+q3eMY2Q/1J
         SepMibACZjyRRLOz6z1pJkyXbnl4h26fUoILtsLw7MV7b/Y8CCucgevtZOqqYtdKE1FK
         rlg++tc3qbn5oRI8nVESb4wXFLkGdTG39XU6NjnSaYBo4MaP/d0RRuvIVRNK2qmqX/j/
         TA1w==
X-Gm-Message-State: AOAM53123WKBtgdi9oeil9dO+Qj3rao3wIkm66wQYGXFGhFsBpG22wY0
        usrtl8DvpAPE3zu2Uui9nocuXIrlGYAIhP9Q
X-Google-Smtp-Source: ABdhPJwbHuuQPFtmc38SU8zyIEd/Ak7lLBGY51qRk27BvP/2szHwIi3IGa1Jqg5gpAWhRYaJTOXQnQ==
X-Received: by 2002:aa7:dc4e:: with SMTP id g14mr1337280edu.114.1614685476271;
        Tue, 02 Mar 2021 03:44:36 -0800 (PST)
Received: from localhost.localdomain (hst-208-217.medicom.bg. [84.238.208.217])
        by smtp.gmail.com with ESMTPSA id x17sm18494897edq.42.2021.03.02.03.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 03:44:36 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 2/2] venus: vdec: Add support for conceal control
Date:   Tue,  2 Mar 2021 13:44:30 +0200
Message-Id: <20210302114430.3594475-3-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210302114430.3594475-1-stanimir.varbanov@linaro.org>
References: <20210302114430.3594475-1-stanimir.varbanov@linaro.org>
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

