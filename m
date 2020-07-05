Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39C90214C62
	for <lists+linux-media@lfdr.de>; Sun,  5 Jul 2020 14:12:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727043AbgGEMMI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 5 Jul 2020 08:12:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727028AbgGEMMH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 5 Jul 2020 08:12:07 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E50BC08C5DF
        for <linux-media@vger.kernel.org>; Sun,  5 Jul 2020 05:12:06 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id w16so39537058ejj.5
        for <linux-media@vger.kernel.org>; Sun, 05 Jul 2020 05:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=PVmLU+hVnh8Nuu06hzfy+sP04k3OApAgFHgahioSu+I=;
        b=HdJZqMAC9vwDwq/2+iB7h9yJXCGAIGf8xNMQ9liFjhLi/fvb1XZzTeWNBYjSiMHKOa
         98mdSBS50YvGC0BDVIhjIAFTKcDlIyz92ScwSNbaxLdwW6nf7N6Cj/zKQIe4jq7t2GvX
         wi+NVJRogKGWybka9wuVMlNXfLtjuhLHL0rZlVSNg//AcGoqJU1V43CPFBxjCSoK6zrB
         71KTZXPIyrDe+8RGyBhMaNUxMYCKdwbTc1Ghw6QNClu8AH4nbo72658WQJefPVrbG/51
         wDZsc7GMLht95gL3fkIsHaXRHdSFYj3mdO7pfHCvFX2yjFo0NPMC+JiMfVWs7wEH1dte
         i9+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=PVmLU+hVnh8Nuu06hzfy+sP04k3OApAgFHgahioSu+I=;
        b=hL/mpkAbzozWSO7IDXapkgPwOUVjQV7tfg+GLnVVl8LTyfDAxQoUWfVI7yGjn3E4KT
         q+E6K4y/HRjjhJchC3jOEFXLGHND+lNdsSbX7623KYHYnfidr9CHJqz9gvMCjSQO/Wed
         5l5K50MU9IJ1jkonALnmBw89MOD4eLtJFAm7Q3cISr76Qvi2MjLoa6PaMS6PkzT3UMHc
         PI5s/NwxXFI5CPBqO4sHHHxyNkovcfiyJcUfb5lz1tdGm+kSHsHTN3NQN6yCAVL70tHf
         QWRerMxGm2LJOPucIjCy72S6zPF1kcysiHC9a1XSmOWTxoxHED8GBnkR9F6ed2BA6FGE
         mjpQ==
X-Gm-Message-State: AOAM532E7F91ONiBAFndbyaOpXWLeGwRRp7N+FhltPdslr9sUgutParV
        8Cyyr7jUuVnchajdRFTlaCFRnPAfWSGR/Q==
X-Google-Smtp-Source: ABdhPJy4XaYVS+16tekoMGYfBYwnsNfJBNfDgfK15oRSsNfDpEBBKvFHSmrSAPvlhLCTRmzxo2y36w==
X-Received: by 2002:a17:906:1a59:: with SMTP id j25mr37496895ejf.398.1593951125047;
        Sun, 05 Jul 2020 05:12:05 -0700 (PDT)
Received: from localhost.localdomain (212-5-158-133.ip.btc-net.bg. [212.5.158.133])
        by smtp.gmail.com with ESMTPSA id j64sm1517458edd.61.2020.07.05.05.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2020 05:12:04 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Kyungmin Park <kyungmin.park@samsung.com>,
        Kamil Debski <kamil@wypas.org>,
        Jeongtae Park <jtp.park@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Maheshwar Ajja <majja@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 2/4] venus: venc: Add support for frame-skip mode v4l2 control
Date:   Sun,  5 Jul 2020 15:11:26 +0300
Message-Id: <20200705121128.5250-3-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200705121128.5250-1-stanimir.varbanov@linaro.org>
References: <20200705121128.5250-1-stanimir.varbanov@linaro.org>
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
index 7118612673c9..5e74d0441592 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -201,6 +201,7 @@ struct venc_controls {
 	u32 bitrate;
 	u32 bitrate_peak;
 	u32 rc_enable;
+	u32 frame_skip_mode;
 
 	u32 h264_i_period;
 	u32 h264_entropy_mode;
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 513bbc07f7bc..2279596d4d60 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -739,9 +739,11 @@ static int venc_set_properties(struct venus_inst *inst)
 	if (!ctr->rc_enable)
 		rate_control = HFI_RATE_CONTROL_OFF;
 	else if (ctr->bitrate_mode == V4L2_MPEG_VIDEO_BITRATE_MODE_VBR)
-		rate_control = HFI_RATE_CONTROL_VBR_CFR;
+		rate_control = ctr->frame_skip_mode ? HFI_RATE_CONTROL_VBR_VFR :
+						      HFI_RATE_CONTROL_VBR_CFR;
 	else
-		rate_control = HFI_RATE_CONTROL_CBR_CFR;
+		rate_control = ctr->frame_skip_mode ? HFI_RATE_CONTROL_CBR_VFR :
+						      HFI_RATE_CONTROL_CBR_CFR;
 
 	ptype = HFI_PROPERTY_PARAM_VENC_RATE_CONTROL;
 	ret = hfi_session_set_property(inst, ptype, &rate_control);
diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers/media/platform/qcom/venus/venc_ctrls.c
index 8362dde7949e..a418d7d6db0c 100644
--- a/drivers/media/platform/qcom/venus/venc_ctrls.c
+++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
@@ -202,6 +202,9 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE:
 		ctr->rc_enable = ctrl->val;
 		break;
+	case V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE:
+		ctr->frame_skip_mode = ctrl->val;
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
 
@@ -357,6 +360,13 @@ int venc_ctrl_init(struct venus_inst *inst)
 	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
 			  V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE, 0, 1, 1, 1);
 
+	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, &venc_ctrl_ops,
+			V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE,
+			V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT,
+			~((1 << V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED) |
+			  (1 << V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT)),
+			V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED);
+
 	ret = inst->ctrl_handler.error;
 	if (ret)
 		goto err;
-- 
2.17.1

