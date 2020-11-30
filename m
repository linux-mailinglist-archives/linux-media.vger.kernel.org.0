Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C18602C80A7
	for <lists+linux-media@lfdr.de>; Mon, 30 Nov 2020 10:11:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727890AbgK3JLB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Nov 2020 04:11:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726498AbgK3JLB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Nov 2020 04:11:01 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 622D3C061A51
        for <linux-media@vger.kernel.org>; Mon, 30 Nov 2020 01:09:34 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id 7so20312723ejm.0
        for <linux-media@vger.kernel.org>; Mon, 30 Nov 2020 01:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=qDd5wvZU+POagS4ld3kHCXja5LSpbyG9oiFPo6cziGI=;
        b=MDQnnQJ9FCLHBxDYaYAnDa4Zaj+foOO+J5Mnj4m1j+fw4k8LbhNYojvRuL1aW5xQt8
         W/b850fl+W7uHugrqN7HkG/6jTalwFk8Ktg+VTKq7Ay7b310s5KySsYm9gqgcmO+qIFR
         xdSk2dBWfQrvQg3m424HH2K2knLTT+GHiorOwMhDacrKI+wPc8WF7wyJkaXvLMx4Sfso
         xn6lgfe1vWtQsfUeiKMnBZpDOgaCbIagyKaQ1qB/JvYy3qCYOTKLaFP+sXYT+q24X4vX
         qgbuumMUbReclRcD5Sh0v54yl5TcxEE5lZqhGXfyLyDH+I4lapH7JbR7h6fDAUmk7Z2L
         SU6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=qDd5wvZU+POagS4ld3kHCXja5LSpbyG9oiFPo6cziGI=;
        b=NTrt+sokmiYIe2rFqSt2SzN4HpUIH5m6cVZpLyZyPDId9B1H1J19oiamsqdFbOFkd8
         R3mzRlkeSGdSR6UY6PPfsalndRJLbdGwSPrPSW1lcqAMYbjAvtkU2mfRnIP0Vlz+VW2B
         wmG6UVPWLufXJh+JtYNWqU4+hinSE5i+gLi4CtUwpRX8w3L6WfmiPpX9A+eRq5RGA8zQ
         B254KXqq5ZwR9zwX8711kcJvMS/KA9lfXWH2WB+XxqtV18/UqILT7WyqOrsrimqWbTjW
         T/d99oOeU1Eu9EM2+jDXYSweNUD8p0v6a0wlcfr9Y3t36o81i9vmU6c4bWgdHZD4H+Hx
         SMuQ==
X-Gm-Message-State: AOAM5315+E2vQhg5PIvqBS3rJKur1DEyiULcQ3jtscchNsNbTnfmNEYe
        cZOry24nGNZEFhwDlFpw7385fx84wuvyzDrw
X-Google-Smtp-Source: ABdhPJy5vWEz9mQQidABL4fgPNSFp9kET9MWz4/NTY5Ii06XzG/1wa+2jr04gv+8d6je2TpN8fXAbQ==
X-Received: by 2002:a17:906:1294:: with SMTP id k20mr14656263ejb.404.1606727372858;
        Mon, 30 Nov 2020 01:09:32 -0800 (PST)
Received: from localhost.localdomain (hst-221-92.medicom.bg. [84.238.221.92])
        by smtp.gmail.com with ESMTPSA id t19sm8239101eje.86.2020.11.30.01.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 01:09:32 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Maheshwar Ajja <majja@codeaurora.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 4/4] venus: venc: Add support for AUD NALU control
Date:   Mon, 30 Nov 2020 11:08:59 +0200
Message-Id: <20201130090859.25272-5-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201130090859.25272-1-stanimir.varbanov@linaro.org>
References: <20201130090859.25272-1-stanimir.varbanov@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for Access Unit Delimiter control into encoder.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/core.h       |  1 +
 drivers/media/platform/qcom/venus/venc.c       | 14 ++++++++++++++
 drivers/media/platform/qcom/venus/venc_ctrls.c |  8 +++++++-
 3 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 52df8b3ea438..041d33ad7688 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -244,6 +244,7 @@ struct venc_controls {
 	u32 header_mode;
 	u32 intra_refresh_mode;
 	u32 intra_refresh_mbs;
+	bool aud_enable;
 
 	u32 profile;
 	u32 level;
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 71b525099e45..986d33b633db 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -696,6 +696,20 @@ static int venc_set_properties(struct venus_inst *inst)
 			return ret;
 	}
 
+	if (inst->fmt_cap->pixfmt == V4L2_PIX_FMT_H264 ||
+	    inst->fmt_cap->pixfmt == V4L2_PIX_FMT_HEVC) {
+		struct hfi_enable en = {};
+
+		ptype = HFI_PROPERTY_PARAM_VENC_H264_GENERATE_AUDNAL;
+
+		if (ctr->aud_enable)
+			en.enable = 1;
+
+		ret = hfi_session_set_property(inst, ptype, &en);
+		if (ret)
+			return ret;
+	}
+
 	ret = venus_helper_set_profile_level(inst, ctr->profile, ctr->level);
 	if (ret)
 		return ret;
diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers/media/platform/qcom/venus/venc_ctrls.c
index 74b4269e2e9c..8d34a5396306 100644
--- a/drivers/media/platform/qcom/venus/venc_ctrls.c
+++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
@@ -202,6 +202,9 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
 		ctr->intra_refresh_mbs = ctrl->val;
 		ctr->intra_refresh_mode = HFI_INTRA_REFRESH_RANDOM;
 		break;
+	case V4L2_CID_MPEG_VIDEO_AU_DELIMITER:
+		ctr->aud_enable = ctrl->val;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -217,7 +220,7 @@ int venc_ctrl_init(struct venus_inst *inst)
 {
 	int ret;
 
-	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 34);
+	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 35);
 	if (ret)
 		return ret;
 
@@ -372,6 +375,9 @@ int venc_ctrl_init(struct venus_inst *inst)
 			  V4L2_CID_MPEG_VIDEO_RANDOM_INTRA_REFRESH_MB, 0,
 			  ((7680 * 4320) >> 8), 1, 0);
 
+	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_AU_DELIMITER, 0, 1, 1, 0);
+
 	ret = inst->ctrl_handler.error;
 	if (ret)
 		goto err;
-- 
2.17.1

