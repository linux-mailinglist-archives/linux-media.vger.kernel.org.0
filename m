Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49B382F755F
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 10:28:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730376AbhAOJ2T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jan 2021 04:28:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728652AbhAOJ1o (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jan 2021 04:27:44 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFF0EC061799
        for <linux-media@vger.kernel.org>; Fri, 15 Jan 2021 01:26:26 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id f4so12323361ejx.7
        for <linux-media@vger.kernel.org>; Fri, 15 Jan 2021 01:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=NiDOyGK2bOsrwUw3iahcb+Ehu3HtnFpXGarV1c+5LM8=;
        b=ZFsRL5mF1MBomvAa3QRzKuOzv/1Y2Eeyf90TC5tvrq8mNB+QD2ypMStgZXbhQldc8Y
         khcdK5GjLd4UuwFsmyOrVdhCNH2h6Wnvr0mtmWbl3Gt9R88Vvb8PlwY9U3oJ1SxVPTua
         BtPPn8Q7/t+xiasgCXlLVnSDzgQz5lrfMJGjYPszGDp0eVkj3Am0Ip9r5srZ7/PO+VGJ
         mu6xZsT0UlAQW4r7SuRsNnCEwrZ6AKoPBYwzBsc2SCNk/++uSUzf19EVdz2x+eTfPi5c
         RJHhIRIKslEbyCiJS/I8QDI4YRQmHy6VjQWru77tNEHq98MigM2rCso4Uj21+3rq49+n
         A7Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=NiDOyGK2bOsrwUw3iahcb+Ehu3HtnFpXGarV1c+5LM8=;
        b=DaBylLJxglG1icNAw8SRGDcN7k/HBR49WtRIpT3WyKsF3A7w64Qouf642PigaQHcyV
         R/fwjPewL8DmPNbMcv4yldsm2+fFE2QhVZ6LS2jpp/vTxP5+WPrgwLFZpPkECm0Roa8I
         Y6pA+Z+LaFArwPPIIrbRnEZ9QuBllsE7EqjebXZ+rTOf0CzWWIZDT10U6Llp9QD8w0Ov
         1cr3t0RNLG2/Qk2RbDH/dQBJA/jggbOzeLdSozvxqxJcnwps+GExRhw7vrcJNvm3Nu5S
         4PJl/nsx3PUBzHuDT2nKFR2ws+HE3KlDCs44YRyvM4dJ10zTUpJK8FK+ah71ZBDWoZJr
         Nw+Q==
X-Gm-Message-State: AOAM533qqcsmJ49G5rKl/YIOpAErlcnULjf1XZKQHwvRlmOnArKB0kRY
        sOQPs697rR/DCIOtYKPSlNO2+ESBUUXncxkj
X-Google-Smtp-Source: ABdhPJyX7rZZcVY49O3f8EhLNpc21KMU6uOJ/7/y1etku1GyJRlAIo6rilAKq9+Pcp7XWLDZS2ChKg==
X-Received: by 2002:a17:907:96aa:: with SMTP id hd42mr3009334ejc.526.1610702785385;
        Fri, 15 Jan 2021 01:26:25 -0800 (PST)
Received: from localhost.localdomain (hst-221-63.medicom.bg. [84.238.221.63])
        by smtp.gmail.com with ESMTPSA id u24sm3004140eje.71.2021.01.15.01.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 01:26:24 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 2/4] venus: vdec: Add support for display delay and delay enable controls
Date:   Fri, 15 Jan 2021 11:26:05 +0200
Message-Id: <20210115092607.29849-3-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210115092607.29849-1-stanimir.varbanov@linaro.org>
References: <20210115092607.29849-1-stanimir.varbanov@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for display delay and display delay enable std controls.
With this we implement decoder decode output order (decode vs display).
Once firmware implement few new features the controls will be used
for other use-cases.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/core.h       |  2 ++
 drivers/media/platform/qcom/venus/vdec.c       | 10 +++++++++-
 drivers/media/platform/qcom/venus/vdec_ctrls.c | 16 +++++++++++++++-
 3 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index b984d508ed71..1028b492216c 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -172,6 +172,8 @@ struct vdec_controls {
 	u32 post_loop_deb_mode;
 	u32 profile;
 	u32 level;
+	u32 display_delay;
+	u32 display_delay_enable;
 };
 
 struct venc_controls {
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index e4dc97f00fc3..c20496a14a55 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -620,7 +620,7 @@ static int vdec_set_properties(struct venus_inst *inst)
 {
 	struct vdec_controls *ctr = &inst->controls.dec;
 	struct hfi_enable en = { .enable = 1 };
-	u32 ptype;
+	u32 ptype, decode_order;
 	int ret;
 
 	if (ctr->post_loop_deb_mode) {
@@ -630,6 +630,14 @@ static int vdec_set_properties(struct venus_inst *inst)
 			return ret;
 	}
 
+	if (ctr->display_delay_enable && ctr->display_delay == 0) {
+		ptype = HFI_PROPERTY_PARAM_VDEC_OUTPUT_ORDER;
+		decode_order = HFI_OUTPUT_ORDER_DECODE;
+		ret = hfi_session_set_property(inst, ptype, &decode_order);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 
diff --git a/drivers/media/platform/qcom/venus/vdec_ctrls.c b/drivers/media/platform/qcom/venus/vdec_ctrls.c
index 974110b75b93..07680aae0a36 100644
--- a/drivers/media/platform/qcom/venus/vdec_ctrls.c
+++ b/drivers/media/platform/qcom/venus/vdec_ctrls.c
@@ -30,6 +30,12 @@ static int vdec_op_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_MPEG_VIDEO_VP9_LEVEL:
 		ctr->level = ctrl->val;
 		break;
+	case V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY:
+		ctr->display_delay = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE:
+		ctr->display_delay_enable = ctrl->val;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -89,7 +95,7 @@ int vdec_ctrl_init(struct venus_inst *inst)
 	struct v4l2_ctrl *ctrl;
 	int ret;
 
-	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 9);
+	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 11);
 	if (ret)
 		return ret;
 
@@ -158,6 +164,14 @@ int vdec_ctrl_init(struct venus_inst *inst)
 	if (ctrl)
 		ctrl->flags |= V4L2_CTRL_FLAG_VOLATILE;
 
+	v4l2_ctrl_new_std(&inst->ctrl_handler, &vdec_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY,
+			  0, 16383, 1, 0);
+
+	v4l2_ctrl_new_std(&inst->ctrl_handler, &vdec_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE,
+			  0, 1, 1, 0);
+
 	ret = inst->ctrl_handler.error;
 	if (ret) {
 		v4l2_ctrl_handler_free(&inst->ctrl_handler);
-- 
2.17.1

