Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C20862AC276
	for <lists+linux-media@lfdr.de>; Mon,  9 Nov 2020 18:36:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732153AbgKIRgO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Nov 2020 12:36:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731969AbgKIRgH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Nov 2020 12:36:07 -0500
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 344FEC0613D4
        for <linux-media@vger.kernel.org>; Mon,  9 Nov 2020 09:36:06 -0800 (PST)
Received: by mail-ej1-x644.google.com with SMTP id za3so13460999ejb.5
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2020 09:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=pFnWMBmOgfjRF3Cwrlx3uYofQt37aDdlePhMz4xU5fM=;
        b=iqaR9WXs1bpO3jxfnrqog2V3ZZ8NOeRIH1JbfpsU9eKC9o235qvTuKsqCqlmJgcOBw
         pbxE10HHH1JwPmFc67hRNVCOhSr8dplvvLeDmbpc5ysEas6Ms1+jtfNlPx+WkvfOAGhm
         4aBXO1QP4IafcuJ2LfpGCM4G/M3jQRaTWj92+SohjcOTyUk2sEUzdE8aC+hde4ZT5Ygg
         RgaxXMEpqLD1r3RUAlMR656YhCshu7WssWky6m0OVkdyX2/h5snkzfoMsFIiS3nwDfax
         7NRlWT96bzk7h7PT5uNlk1pK5ydXXtYiQO+XgMbHpxt8jkc8pOnDCFX9w8k9sVAx232O
         fkOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=pFnWMBmOgfjRF3Cwrlx3uYofQt37aDdlePhMz4xU5fM=;
        b=U3WV/qavbcNerk5SdR3vS3jLKTt4VQGhOiyaV7rbWstgIHfMZOQowLnKUbqP6GXTjy
         0Wbvk++UAp438vjD/8iwGWdwxninVS7R8ocE4VUwgEzjWOO3qWtMW7gFLWAj1wZ6aSOe
         m/9wgxZlZU1fumahla+EwhDoqp6ui3EHVLenu0pcVuRMJCyKaTQUafKhuQVEZTdjH2YS
         KJW0p4NtkYp38PAdS2ySKUKfp2+vo4sRB3QWyMwpVSp86oOoHaYEP2RVLWWh8aFO6F44
         H5YopzMBvt9ZIyNHck6g9/cuhE7GD14ZenPGrzbMpaHsZUzY0PabU7ClssMUUi5CaFri
         +gDw==
X-Gm-Message-State: AOAM531BEk/zCwNjcXFVmHiQDBGJ7StutfKNG1u+NYTNE+MkuIOnozDv
        M5z0XuTREmCUJ5fLycYGwFxtw4iJZWcjwdyy
X-Google-Smtp-Source: ABdhPJxUPFj4nGgGSzK1G1qrofBnlrXVnJNZzohF8BBx7bAX1rdpztMMWitJOyO4ATH/RlME7Q/nRw==
X-Received: by 2002:a17:906:1b09:: with SMTP id o9mr16814643ejg.79.1604943364389;
        Mon, 09 Nov 2020 09:36:04 -0800 (PST)
Received: from localhost.localdomain (hst-221-89.medicom.bg. [84.238.221.89])
        by smtp.gmail.com with ESMTPSA id jw7sm9123981ejb.54.2020.11.09.09.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 09:36:03 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Kyungmin Park <kyungmin.park@samsung.com>,
        Kamil Debski <kamil@wypas.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 2/4] venus: vdec: Add support for display delay and delay enable controls
Date:   Mon,  9 Nov 2020 19:35:39 +0200
Message-Id: <20201109173541.10016-3-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201109173541.10016-1-stanimir.varbanov@linaro.org>
References: <20201109173541.10016-1-stanimir.varbanov@linaro.org>
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
index 7b79a33dc9d6..a57fb6f70e61 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -210,6 +210,8 @@ struct vdec_controls {
 	u32 post_loop_deb_mode;
 	u32 profile;
 	u32 level;
+	u32 display_delay;
+	u32 display_delay_enable;
 };
 
 struct venc_controls {
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index ea13170a6a2c..1b3b819ccc83 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -615,7 +615,7 @@ static int vdec_set_properties(struct venus_inst *inst)
 {
 	struct vdec_controls *ctr = &inst->controls.dec;
 	struct hfi_enable en = { .enable = 1 };
-	u32 ptype;
+	u32 ptype, decode_order;
 	int ret;
 
 	if (ctr->post_loop_deb_mode) {
@@ -625,6 +625,14 @@ static int vdec_set_properties(struct venus_inst *inst)
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
index 974110b75b93..e1378532dec8 100644
--- a/drivers/media/platform/qcom/venus/vdec_ctrls.c
+++ b/drivers/media/platform/qcom/venus/vdec_ctrls.c
@@ -30,6 +30,12 @@ static int vdec_op_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_MPEG_VIDEO_VP9_LEVEL:
 		ctr->level = ctrl->val;
 		break;
+	case V4L2_CID_MPEG_VIDEO_DECODER_DISPLAY_DELAY:
+		ctr->display_delay = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_DECODER_DISPLAY_DELAY_ENABLE:
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
+			  V4L2_CID_MPEG_VIDEO_DECODER_DISPLAY_DELAY,
+			  0, 16383, 1, 0);
+
+	v4l2_ctrl_new_std(&inst->ctrl_handler, &vdec_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_DECODER_DISPLAY_DELAY_ENABLE,
+			  0, 1, 1, 0);
+
 	ret = inst->ctrl_handler.error;
 	if (ret) {
 		v4l2_ctrl_handler_free(&inst->ctrl_handler);
-- 
2.17.1

