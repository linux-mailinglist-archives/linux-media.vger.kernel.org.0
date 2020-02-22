Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8CE4168B03
	for <lists+linux-media@lfdr.de>; Sat, 22 Feb 2020 01:33:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726777AbgBVAdW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Feb 2020 19:33:22 -0500
Received: from mail-vk1-f201.google.com ([209.85.221.201]:48147 "EHLO
        mail-vk1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726697AbgBVAdW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Feb 2020 19:33:22 -0500
Received: by mail-vk1-f201.google.com with SMTP id d28so1620582vkn.15
        for <linux-media@vger.kernel.org>; Fri, 21 Feb 2020 16:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=OqxJ7uFM6QirldzKomGS86nipI+w+uqyhp1pa4CeHPE=;
        b=l11FZQE6V8RxsI2VoZDUgCeS8uBjfKYdayCEjmfzGtSLpL+FmxZ12lPTOzKCEfFbgy
         i9RNdPM+q2UeJsmzcwJQa8Tdae6rMQ1bWasVph50yejryH/Z4YlYOamP8H36JjznclMB
         rRxgBQsRfVrRFTr53kaiZNL9waTw0Z1B+N/1i/LhIf8913anKqsBkbYbVsCS+3juliBc
         +A1vV4p69SfiPwOt7gTBQTVB0/SFzNAiGhCy+77xg3zuq71zedQcuVoe6O+/bxMHZxdt
         cwPi9zKra5Usswsy5LnwTkbBsVUXVbHNSA9r+MS78gOA6xfnZTh5svOReq/s5ixaRwva
         RITA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=OqxJ7uFM6QirldzKomGS86nipI+w+uqyhp1pa4CeHPE=;
        b=GbtNFFeH2iBlisxpI6BPIrzdc+T2ZAKRW1TNBEc8gRf+8R8h3ckjlGTrRZp6+vWBTT
         1nJxB4ZM3FXoZRPKrolr9XS4VY84nlsw2Lp6NWq6cZvrttcjsXNKPL3YlOKEoYXLCPZr
         wDUzP7gultCCLZ16Kw35aDjNZ7GSdIsT2TdGep6F/mJ3LHNoKwW5OACC5WCeROE6NpFA
         Kqoc/AuKV6y5q8lqSE+V6DjI/rGdyr89VbtUsGbP0Bb+t0Db4eyJHocn7kzFzsuf3Nnb
         /zq3DFjQ8CQ7AOkMEw4Z1L7bU9MBv28XtsHgsZeYn6YEcMRL8DGNT+hV3p8EcdKJdWpZ
         mYwg==
X-Gm-Message-State: APjAAAU/+xUWWdIQScrl1C2N1NHWa6igSM7nTJl27mnEG5z26YXk0Udd
        kZJk3LJvejgDMtK+ddYkQT0iy6wbaqgwQbuqzq0a7lq8g0KM8rE9cx3Kzcko/z8SifsJLviuW9+
        7MWl6ci4mbas81adNBlPmiIoKfuEedjvQ1MJMiJUJ1T0YuX5tuIzZ5Mmtx5vGETh0l2eqv+SAs+
        WTcw==
X-Google-Smtp-Source: APXvYqzJyj0dXwKd98P0iXGqbwlTWwwl2aamL/zqvJJ4fLf8Lv9XUkRWOo26SYLGT5N3TT5VWhNkJbfmt7hgqfyB
X-Received: by 2002:a1f:6344:: with SMTP id x65mr18208843vkb.26.1582331601314;
 Fri, 21 Feb 2020 16:33:21 -0800 (PST)
Date:   Fri, 21 Feb 2020 16:33:11 -0800
Message-Id: <20200222003311.106837-1-jkardatzke@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
Subject: [PATCH v2] media: venus: support frame rate control
From:   Jeffrey Kardatzke <jkardatzke@google.com>
To:     linux-media@vger.kernel.org
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Kardatzke <jkardatzke@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add encoder control for enabling/disabling frame rate control via
V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE. It is enabled by default.

Signed-off-by: Jeffrey Kardatzke <jkardatzke@google.com>
---
 drivers/media/platform/qcom/venus/core.h       | 1 +
 drivers/media/platform/qcom/venus/venc.c       | 4 +++-
 drivers/media/platform/qcom/venus/venc_ctrls.c | 8 +++++++-
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 11585fb3cae3..2b0649ffbd92 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -187,6 +187,7 @@ struct venc_controls {
 	u32 bitrate_mode;
 	u32 bitrate;
 	u32 bitrate_peak;
+	u32 rc_enable;
 
 	u32 h264_i_period;
 	u32 h264_entropy_mode;
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 453edf966d4f..56079c9d9900 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -731,7 +731,9 @@ static int venc_set_properties(struct venus_inst *inst)
 	if (ret)
 		return ret;
 
-	if (ctr->bitrate_mode == V4L2_MPEG_VIDEO_BITRATE_MODE_VBR)
+	if (!ctr->rc_enable)
+		rate_control = HFI_RATE_CONTROL_OFF;
+	else if (ctr->bitrate_mode == V4L2_MPEG_VIDEO_BITRATE_MODE_VBR)
 		rate_control = HFI_RATE_CONTROL_VBR_CFR;
 	else
 		rate_control = HFI_RATE_CONTROL_CBR_CFR;
diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers/media/platform/qcom/venus/venc_ctrls.c
index 877c0b3299e9..0572a00b8380 100644
--- a/drivers/media/platform/qcom/venus/venc_ctrls.c
+++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
@@ -199,6 +199,9 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
 		}
 		mutex_unlock(&inst->lock);
 		break;
+	case V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE:
+		ctr->rc_enable = ctrl->val;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -214,7 +217,7 @@ int venc_ctrl_init(struct venus_inst *inst)
 {
 	int ret;
 
-	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 30);
+	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 31);
 	if (ret)
 		return ret;
 
@@ -351,6 +354,9 @@ int venc_ctrl_init(struct venus_inst *inst)
 	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
 			  V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME, 0, 0, 0, 0);
 
+	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+		V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE, 0, 1, 1, 1);
+
 	ret = inst->ctrl_handler.error;
 	if (ret)
 		goto err;
-- 
2.25.0.265.gbab2e86ba0-goog

