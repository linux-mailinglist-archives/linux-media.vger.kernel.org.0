Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E54A29A7A8
	for <lists+linux-media@lfdr.de>; Tue, 27 Oct 2020 10:20:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2508741AbgJ0JT7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Oct 2020 05:19:59 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:37028 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2508750AbgJ0JT4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Oct 2020 05:19:56 -0400
Received: by mail-wr1-f65.google.com with SMTP id w1so1025981wrm.4
        for <linux-media@vger.kernel.org>; Tue, 27 Oct 2020 02:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=/wDjT/SlZ3lKVqpNwVDGAcf/aKgztmBHkRCUdNnZ+aw=;
        b=vdYfDY/TYNYCUgUHMhh+fIs/CSYiFFsyY+p6u4EvFhFraYVRB+9sfXxFgmnQVpjFFZ
         t7TQqqEObuDsMpVky/Lm1YJg3RVAG7ox13tpuFg0HgAPOKGsarXP2yD96nkoRJLMhdLT
         2D8UFmfF5BasOtQ+lnsgCxv2oqSiriPcMkUOzFmi6GPFZLdT+kkUrwT5gWOYUCdNUuTu
         z4i4xMc8jIu1Bb+eaE6fywlbRpVL5oe6C9YF7l/qXlAHl8i70CxhvxxdaGWAaJzHqsh7
         BvJkLbs/KDLQxns65ayk2DILD8HJfNGy6Bp/nFg2MUuCy85dzAV03YWyhPzx59Wc3tO5
         W5ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=/wDjT/SlZ3lKVqpNwVDGAcf/aKgztmBHkRCUdNnZ+aw=;
        b=XkePfA9XRWBg18NfNPijqb8rcqM5RRnyrb64EANU9kPz24zgMWbT5LwIuj/BcU1Acb
         M2Itxw9+oYFfB0mkHhbNb0zHK8FEwXEBaQaf+9jFEvFacXmznNZvQOcJU8MJCCrlbIrJ
         BoDgpbh7oRCMsrA/Dje1G8o/kV6wP9orUnoOe3+blfFllWivt6OR53sQAMRDLLBYfg5z
         fylEzjU4SVoy0c6cbXliBEI3J/HSrOMu1Jd9sjN4NOUhnS7Ibc7AONgxhuh8taUYRn1J
         lrJ1BACJ+k7yYZGP6a39kaYf0O+P3r4hXFKFjRzSkgAbNWYs32D6R5++oWtTFQFLXNJO
         mWdQ==
X-Gm-Message-State: AOAM531FOAcuBBhDHby41+IFrUgDY4hqTYtI+FFna0eCfCIITIp4ZApz
        FyfcyERG71+i5lu7Zet/LHeKBpU/uI/JGQ==
X-Google-Smtp-Source: ABdhPJwUKSYbFKqHrh9OmKMvhBJbJjb9tAmt/GvrtiqiTXS0wl6hQDRJ4luJ1lpqYuHMfpo6VttNog==
X-Received: by 2002:a5d:4001:: with SMTP id n1mr1680682wrp.426.1603790393873;
        Tue, 27 Oct 2020 02:19:53 -0700 (PDT)
Received: from localhost.localdomain ([84.238.208.210])
        by smtp.gmail.com with ESMTPSA id i10sm1292902wrq.27.2020.10.27.02.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 02:19:53 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2] venus: venc: Fix setting of profile and level
Date:   Tue, 27 Oct 2020 11:19:36 +0200
Message-Id: <20201027091936.14478-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The profile and level in op_set_ctrl was recently changed but during
v4l2_ctrl_handler_setup profile and level control values are mangled.

Fixes: 435c53c3698f ("media: venus: venc: Use helper to set profile and level")
Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---

v2: Fixed kernel test robot WARNING

 drivers/media/platform/qcom/venus/core.h      | 15 +++++++--
 drivers/media/platform/qcom/venus/venc.c      | 31 ++++++++++++++++++-
 .../media/platform/qcom/venus/venc_ctrls.c    | 14 +++++++--
 3 files changed, 55 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 7b79a33dc9d6..05c9fbd51f0c 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -243,8 +243,19 @@ struct venc_controls {
 
 	u32 header_mode;
 
-	u32 profile;
-	u32 level;
+	struct {
+		u32 h264;
+		u32 mpeg4;
+		u32 hevc;
+		u32 vp8;
+		u32 vp9;
+	} profile;
+	struct {
+		u32 h264;
+		u32 mpeg4;
+		u32 hevc;
+		u32 vp9;
+	} level;
 };
 
 struct venus_buffer {
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index f8b1484e7dcd..47246528ac7e 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -537,6 +537,7 @@ static int venc_set_properties(struct venus_inst *inst)
 	struct hfi_quantization quant;
 	struct hfi_quantization_range quant_range;
 	u32 ptype, rate_control, bitrate;
+	u32 profile, level;
 	int ret;
 
 	ret = venus_helper_set_work_mode(inst, VIDC_WORK_MODE_2);
@@ -684,7 +685,35 @@ static int venc_set_properties(struct venus_inst *inst)
 	if (ret)
 		return ret;
 
-	ret = venus_helper_set_profile_level(inst, ctr->profile, ctr->level);
+	switch (inst->hfi_codec) {
+	case HFI_VIDEO_CODEC_H264:
+		profile = ctr->profile.h264;
+		level = ctr->level.h264;
+		break;
+	case HFI_VIDEO_CODEC_MPEG4:
+		profile = ctr->profile.mpeg4;
+		level = ctr->level.mpeg4;
+		break;
+	case HFI_VIDEO_CODEC_VP8:
+		profile = ctr->profile.vp8;
+		level = 0;
+		break;
+	case HFI_VIDEO_CODEC_VP9:
+		profile = ctr->profile.vp9;
+		level = ctr->level.vp9;
+		break;
+	case HFI_VIDEO_CODEC_HEVC:
+		profile = ctr->profile.hevc;
+		level = ctr->level.hevc;
+		break;
+	case HFI_VIDEO_CODEC_MPEG2:
+	default:
+		profile = 0;
+		level = 0;
+		break;
+	}
+
+	ret = venus_helper_set_profile_level(inst, profile, level);
 	if (ret)
 		return ret;
 
diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers/media/platform/qcom/venus/venc_ctrls.c
index 0708b3b89d0c..cf860e6446c0 100644
--- a/drivers/media/platform/qcom/venus/venc_ctrls.c
+++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
@@ -103,15 +103,25 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
 		ctr->h264_entropy_mode = ctrl->val;
 		break;
 	case V4L2_CID_MPEG_VIDEO_MPEG4_PROFILE:
+		ctr->profile.mpeg4 = ctrl->val;
+		break;
 	case V4L2_CID_MPEG_VIDEO_H264_PROFILE:
+		ctr->profile.h264 = ctrl->val;
+		break;
 	case V4L2_CID_MPEG_VIDEO_HEVC_PROFILE:
+		ctr->profile.hevc = ctrl->val;
+		break;
 	case V4L2_CID_MPEG_VIDEO_VP8_PROFILE:
-		ctr->profile = ctrl->val;
+		ctr->profile.vp8 = ctrl->val;
 		break;
 	case V4L2_CID_MPEG_VIDEO_MPEG4_LEVEL:
+		ctr->level.mpeg4 = ctrl->val;
+		break;
 	case V4L2_CID_MPEG_VIDEO_H264_LEVEL:
+		ctr->level.h264 = ctrl->val;
+		break;
 	case V4L2_CID_MPEG_VIDEO_HEVC_LEVEL:
-		ctr->level = ctrl->val;
+		ctr->level.hevc = ctrl->val;
 		break;
 	case V4L2_CID_MPEG_VIDEO_H264_I_FRAME_QP:
 		ctr->h264_i_qp = ctrl->val;
-- 
2.17.1

