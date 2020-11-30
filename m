Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C38AC2C809E
	for <lists+linux-media@lfdr.de>; Mon, 30 Nov 2020 10:11:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727722AbgK3JKs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Nov 2020 04:10:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726345AbgK3JKs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Nov 2020 04:10:48 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C5EBC061A48
        for <linux-media@vger.kernel.org>; Mon, 30 Nov 2020 01:09:31 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id jx16so19682472ejb.10
        for <linux-media@vger.kernel.org>; Mon, 30 Nov 2020 01:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=8QrjaTCkjPvuv3eCz5yZqJhYMQLwskQwM5C2/UPSspg=;
        b=yvPkWucn4mJgXMlkP1ZbweBgcSxIvQjRbegvcrUQI+tritWaokvLG9R51WM+xK1Nar
         ELIixBlaBoir/1LU7gYWJVaNm0H/7iEUXytw+gFaxGOqG0c2cv1IwBBZAzJiKQOmVj17
         i/GmMMwRLOBq9G/OoxbaveAvm12HjC7aOMFtWTCHmoLByP+jsjyoK203Rs/FhfzhfbXO
         uLxT4UdtVIiaHvL1XNbyv1lst0X0fd4cN96pAZViGalGcxJYk54J/HTMlOMKTmX9P08U
         9/yWcQddYTlju41dGTSco1VMf3DCyOp1ZiqQgLFrn8H2kPmqvyICXtD6A1Izyi38j/4t
         VzjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=8QrjaTCkjPvuv3eCz5yZqJhYMQLwskQwM5C2/UPSspg=;
        b=qe/cKz5TL5zKJ6NnL6ZzOsonT4eIHiFm/tE8p5r90OHpM4Iisxj4Pzy0TNDPiU/2Mq
         TJ9FPeioH2G/a4j/0KabkZmgu8mtmwsdn90OgWdTzUEA3q1PBBark57LOyXzntEw8Sr4
         RH0dx79/s4ttEWCbsQRKaGb3A0I7LMI+M7c/rufL0D/w0BCw/w8g97hwDLX2ZpG1O6O7
         9KeXW74Z0M3SWlEmE8L/r87QrCzaoBxCcFcg8wnzfRWbzhtOZmK4fuaULaTgxFdcZLAb
         MrcORx3fOsRIabgziGf/QTHgg4sTYZTcdpMp8chc436IkUNjxsYYCpNaOm0N2PhzDQTw
         SN9Q==
X-Gm-Message-State: AOAM530kdUsz7QXTkjzdMWiSbHUfPaaNWblNUKTySr9ofLpZ1foKSX12
        ZVa+O0sQOyaM02xkhr8yRfiGu83fgA+9sIOl
X-Google-Smtp-Source: ABdhPJzyaMm6dJcz+uPv2ZqV8DI4ArTq6Et2Wrq1S18xXNLzvErEQw43wjmjMQoDVoDWyE3GKDS1EA==
X-Received: by 2002:a17:906:4982:: with SMTP id p2mr19980724eju.416.1606727369480;
        Mon, 30 Nov 2020 01:09:29 -0800 (PST)
Received: from localhost.localdomain (hst-221-92.medicom.bg. [84.238.221.92])
        by smtp.gmail.com with ESMTPSA id t19sm8239101eje.86.2020.11.30.01.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 01:09:28 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Maheshwar Ajja <majja@codeaurora.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 2/4] venus: venc: Add support for intra-refresh modes
Date:   Mon, 30 Nov 2020 11:08:57 +0200
Message-Id: <20201130090859.25272-3-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201130090859.25272-1-stanimir.varbanov@linaro.org>
References: <20201130090859.25272-1-stanimir.varbanov@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for random intra-refresh mode and number of macroblocks.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/core.h       |  2 ++
 drivers/media/platform/qcom/venus/venc.c       | 12 ++++++++++++
 drivers/media/platform/qcom/venus/venc_ctrls.c | 10 +++++++++-
 3 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 3bc129a4f817..52df8b3ea438 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -242,6 +242,8 @@ struct venc_controls {
 	u32 multi_slice_max_mb;
 
 	u32 header_mode;
+	u32 intra_refresh_mode;
+	u32 intra_refresh_mbs;
 
 	u32 profile;
 	u32 level;
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 0bf92cc21f3a..71b525099e45 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -536,6 +536,7 @@ static int venc_set_properties(struct venus_inst *inst)
 	struct hfi_idr_period idrp;
 	struct hfi_quantization quant;
 	struct hfi_quantization_range quant_range;
+	struct hfi_intra_refresh intra_refresh = {};
 	u32 ptype, rate_control, bitrate;
 	int ret;
 
@@ -684,6 +685,17 @@ static int venc_set_properties(struct venus_inst *inst)
 	if (ret)
 		return ret;
 
+	if (inst->fmt_cap->pixfmt == V4L2_PIX_FMT_H264 ||
+	    inst->fmt_cap->pixfmt == V4L2_PIX_FMT_HEVC) {
+		ptype = HFI_PROPERTY_PARAM_VENC_INTRA_REFRESH;
+		intra_refresh.mode = ctr->intra_refresh_mode;
+		intra_refresh.cir_mbs = ctr->intra_refresh_mbs;
+
+		ret = hfi_session_set_property(inst, ptype, &intra_refresh);
+		if (ret)
+			return ret;
+	}
+
 	ret = venus_helper_set_profile_level(inst, ctr->profile, ctr->level);
 	if (ret)
 		return ret;
diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers/media/platform/qcom/venus/venc_ctrls.c
index 0708b3b89d0c..74b4269e2e9c 100644
--- a/drivers/media/platform/qcom/venus/venc_ctrls.c
+++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
@@ -198,6 +198,10 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE:
 		ctr->frame_skip_mode = ctrl->val;
 		break;
+	case V4L2_CID_MPEG_VIDEO_RANDOM_INTRA_REFRESH_MB:
+		ctr->intra_refresh_mbs = ctrl->val;
+		ctr->intra_refresh_mode = HFI_INTRA_REFRESH_RANDOM;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -213,7 +217,7 @@ int venc_ctrl_init(struct venus_inst *inst)
 {
 	int ret;
 
-	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 33);
+	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 34);
 	if (ret)
 		return ret;
 
@@ -364,6 +368,10 @@ int venc_ctrl_init(struct venus_inst *inst)
 			       (1 << V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT)),
 			       V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED);
 
+	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_RANDOM_INTRA_REFRESH_MB, 0,
+			  ((7680 * 4320) >> 8), 1, 0);
+
 	ret = inst->ctrl_handler.error;
 	if (ret)
 		goto err;
-- 
2.17.1

