Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5443A2279DF
	for <lists+linux-media@lfdr.de>; Tue, 21 Jul 2020 09:52:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728259AbgGUHwF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jul 2020 03:52:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728275AbgGUHwE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jul 2020 03:52:04 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0E66C0619D8
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2020 00:52:03 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id d17so23048799ljl.3
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2020 00:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=d9a11gSXF5aVoEa1FEdqJhsu8ltL0Y4i64DGKwbk0NU=;
        b=eropNhXcr1qmSYp6MQSQH8SCCY9dO21OxwiQ1/J5Y5LeR7u3hA5MH8oE+cYQPI6DVx
         TYPSiUAy6Ut8hNsBEK92cXQWOa7Qq2i3XhtWkmNnbPHJ5EELeGDeQo8oR5J32k7XsHzH
         Zuk7Ak/5185SPlLvApm6s7jqjR1S90ixhxS8ZWZP4zfwFB2/iNcJAlSgvd+wldPaTFrh
         xv7PLeMbdMhmTrMAhxApSs7SXeRNq1tqkXlqExCp0HynF1VYnWCfP1FvDk1YMTmbt9Fv
         Y1f5fN/aGalPdqnJbP60drYGsFWFUP8z19AohHcccJu7jCHmo7sTX87wqN4qh4z7jsyD
         GU5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=d9a11gSXF5aVoEa1FEdqJhsu8ltL0Y4i64DGKwbk0NU=;
        b=nZmAj/qH+SAGcOF41bXMaMRZNiK2aGMOyIA3vkl6wlfkgpPSmvjBDBHearHwGn4iGc
         WpztYMnm8aV7Cv7w8YzndQC4eOLsvWXrDdx86vHPKSGDZ2X6n2Vu3JGobbgFao7cvtoC
         vAEo9mY1monjlEM3DvQtsyz8eSPBG2EqJfTqq6J74qmRPGqpUjrdNLAPi3A70uUlh4lo
         mRJybrWUWLXHwioui7bSRkDtem4GclDTOWPENvDS6BPe7Dc8qBWN0R3vnqz6HnFUa40f
         ufrrs0kdwSA8+J8zg8Y8mVZIM9meaecsz9Vmed77JaCMQ/WAn07kcxl4KMRh61XSaF8F
         Tp5A==
X-Gm-Message-State: AOAM532LSYDOM0sJrG8TJh8baAY7j60hcopS5ZTiRbG8G2GiL5BuMx6e
        zA/mgryM8qHIOsEekK6f59tRS32SWao=
X-Google-Smtp-Source: ABdhPJwf++3Kb/qsnwkDB7Vlea/x6zdJgR3gAfbfKNoqAwCOXuARDIJT4I0s9DJZnJNfkqzUYlUbEw==
X-Received: by 2002:a2e:9397:: with SMTP id g23mr13075463ljh.185.1595317921844;
        Tue, 21 Jul 2020 00:52:01 -0700 (PDT)
Received: from localhost.localdomain ([195.24.90.54])
        by smtp.gmail.com with ESMTPSA id d2sm4045334ljg.6.2020.07.21.00.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 00:52:01 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kamil Debski <kamil@wypas.org>,
        Jeongtae Park <jtp.park@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Maheshwar Ajja <majja@codeaurora.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 4/6] venus: venc: Add support for frame-skip mode v4l2 control
Date:   Tue, 21 Jul 2020 10:45:36 +0300
Message-Id: <20200721074538.505-5-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200721074538.505-1-stanimir.varbanov@linaro.org>
References: <20200721074538.505-1-stanimir.varbanov@linaro.org>
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
 drivers/media/platform/qcom/venus/venc_ctrls.c | 12 +++++++++++-
 3 files changed, 16 insertions(+), 3 deletions(-)

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
index 97a1e821c07e..440878928ab1 100644
--- a/drivers/media/platform/qcom/venus/venc_ctrls.c
+++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
@@ -205,6 +205,9 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_MPEG_VIDEO_CONSTANT_QUALITY:
 		ctr->const_quality = ctrl->val;
 		break;
+	case V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE:
+		ctr->frame_skip_mode = ctrl->val;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -220,7 +223,7 @@ int venc_ctrl_init(struct venus_inst *inst)
 {
 	int ret;
 
-	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 32);
+	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 33);
 	if (ret)
 		return ret;
 
@@ -363,6 +366,13 @@ int venc_ctrl_init(struct venus_inst *inst)
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

