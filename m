Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E70E2260D3
	for <lists+linux-media@lfdr.de>; Mon, 20 Jul 2020 15:24:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726782AbgGTNYO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jul 2020 09:24:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728172AbgGTNYN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jul 2020 09:24:13 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46224C0619D4
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2020 06:24:13 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id y18so9680169lfh.11
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2020 06:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=BEn8b19KNXeg8BFW/3OCgXOCsWUTohzxaH9qqztvhnA=;
        b=CIw7Kr4JtLkyvV0dl204XhbNYAfTMVrKzFJl3Lw2jjNU8u+uwKAPhn1po8GrGaeaog
         1l1O7/OOF7433cWd/EdEBHRzVqbJNwG+lYd41oXrhduywn/HpYL6OaCiknpw1DGxsTNg
         VC0pRGaaptJbwDUfJ5gwl9AM2XmAYFEDtGIEKHYHQtKVvsjQlxmAEWMHXbA6wpduqfBm
         NroLGPjfFqRhO4VoHiVtVEccBIIdfH4L2VCZiGcgdNXmuI/GWBqqW2xTc+U1OT4K/tc5
         7bNNEocdH8YWUJum2f5ARusglDb7ujbM3rBaDQbtvezoJfwr3WeDoQ1LX7VQT/GlM6BQ
         Q2Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=BEn8b19KNXeg8BFW/3OCgXOCsWUTohzxaH9qqztvhnA=;
        b=e3W48qfx2XBiJsHV68nOKJ4ySzlHIFVrN9LfY32kkUFX/X0GAxIBZP8f5ElMBQ1EQP
         PohPPBJsrni577KvXuocE3m+bn9VoOw5lyJKQTVK8YN8UTWKfk/RBff1CYsA6Qv5WPRo
         OJkr4s14LBT63+ZhmWOMwiW8u4xpexUNSV6rxlvGd1jKbl2ZwkIE12qWIWns6u7KGANB
         +AsdTVDB5F0mvOvKtu8HMNCm5KinADTh1fkpAx6AnZvHp/Gcbf+CE/BNnjQ953VXToX+
         wkkMtIq5as5MIt864469HXk7NaJGPPHzKYKcfXS6jZOKBG/qBEqq2Bz2GwQZ6XqETq6t
         r19A==
X-Gm-Message-State: AOAM532+v/U1JqloEytXtosTjkP6TuG4zQRnUNjdxG9FOxxZ18JFrQlZ
        avFBH1C9uANCdeCq/HgTDjGQbVSgp1M=
X-Google-Smtp-Source: ABdhPJyKrn5bk+q1D4Zgk7Suw0GD9WmiCJE0Ab+XJfJbVpPa0hFi8IWqOFR5dg0L5IrAI66aEwdQCw==
X-Received: by 2002:ac2:4550:: with SMTP id j16mr10846655lfm.37.1595251451216;
        Mon, 20 Jul 2020 06:24:11 -0700 (PDT)
Received: from localhost.localdomain ([195.24.90.54])
        by smtp.gmail.com with ESMTPSA id h6sm867829lfc.84.2020.07.20.06.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 06:24:10 -0700 (PDT)
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
Subject: [PATCH 4/6] venus: venc: Add support for frame-skip mode v4l2 control
Date:   Mon, 20 Jul 2020 16:23:11 +0300
Message-Id: <20200720132313.4810-5-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200720132313.4810-1-stanimir.varbanov@linaro.org>
References: <20200720132313.4810-1-stanimir.varbanov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This adds support for frame-skip-mode standard v4l2 control in
encoder driver. The control is implemented based on the
combination of client selected bitrate-mode and frame-skip-mode.
Once The client selected bitrate-mode (constant or variable) and
the frame-skip-mode is not disabled we set variable framerate for
rate controller.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/core.h       |  1 +
 drivers/media/platform/qcom/venus/venc.c       |  6 ++++--
 drivers/media/platform/qcom/venus/venc_ctrls.c | 11 ++++++++++-
 3 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 1bac30d4cf50..72e171ee05a8 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -202,6 +202,7 @@ struct venc_controls {
 	u32 bitrate_peak;
 	u32 rc_enable;
 	u32 const_quality;
+	u32 frame_skip_mode;
 
 	u32 h264_i_period;
 	u32 h264_entropy_mode;
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 4c30c3f3369e..e4bbaae9975a 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -739,9 +739,11 @@ static int venc_set_properties(struct venus_inst *inst)
 	if (!ctr->rc_enable)
 		rate_control = HFI_RATE_CONTROL_OFF;
 	else if (ctr->bitrate_mode == V4L2_MPEG_VIDEO_BITRATE_MODE_VBR)
-		rate_control = HFI_RATE_CONTROL_VBR_CFR;
+		rate_control = ctr->frame_skip_mode ? HFI_RATE_CONTROL_VBR_VFR :
+						      HFI_RATE_CONTROL_VBR_CFR;
 	else if (ctr->bitrate_mode == V4L2_MPEG_VIDEO_BITRATE_MODE_CBR)
-		rate_control = HFI_RATE_CONTROL_CBR_CFR;
+		rate_control = ctr->frame_skip_mode ? HFI_RATE_CONTROL_CBR_VFR :
+						      HFI_RATE_CONTROL_CBR_CFR;
 	else if (ctr->bitrate_mode == V4L2_MPEG_VIDEO_BITRATE_MODE_CQ)
 		rate_control = HFI_RATE_CONTROL_CQ;
 
diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers/media/platform/qcom/venus/venc_ctrls.c
index 97a1e821c07e..4ac8da2ad061 100644
--- a/drivers/media/platform/qcom/venus/venc_ctrls.c
+++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
@@ -204,6 +204,8 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	case V4L2_CID_MPEG_VIDEO_CONSTANT_QUALITY:
 		ctr->const_quality = ctrl->val;
+	case V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE:
+		ctr->frame_skip_mode = ctrl->val;
 		break;
 	default:
 		return -EINVAL;
@@ -220,7 +222,7 @@ int venc_ctrl_init(struct venus_inst *inst)
 {
 	int ret;
 
-	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 32);
+	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 33);
 	if (ret)
 		return ret;
 
@@ -363,6 +365,13 @@ int venc_ctrl_init(struct venus_inst *inst)
 	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
 			  V4L2_CID_MPEG_VIDEO_CONSTANT_QUALITY, 0, 100, 1, 0);
 
+	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, &venc_ctrl_ops,
+			       V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE,
+			       V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT,
+			       ~((1 << V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED) |
+			       (1 << V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT)),
+			       V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED);
+
 	ret = inst->ctrl_handler.error;
 	if (ret)
 		goto err;
-- 
2.17.1

