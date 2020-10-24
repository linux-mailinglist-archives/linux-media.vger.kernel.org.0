Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F80C297D7C
	for <lists+linux-media@lfdr.de>; Sat, 24 Oct 2020 18:35:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1762385AbgJXQe6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Oct 2020 12:34:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1762140AbgJXQe6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Oct 2020 12:34:58 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1B34C0613D4
        for <linux-media@vger.kernel.org>; Sat, 24 Oct 2020 09:34:57 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id c194so5667519wme.2
        for <linux-media@vger.kernel.org>; Sat, 24 Oct 2020 09:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=4VNllDn3e4my8IHs8+jRLXE/SyMCMN5aQ3NIL2dikb0=;
        b=oG0Y3nq6TQ3bwZjcsbPFe49O18MdzeUU+EOM+I99R6tMsXphrPXjN7K10jakAil+fu
         MNX014vsqbLVe1Ufn5ZAWBpaBnZ+jm8VqYiJT9c5dpfDQpG8oN5ucDeP/XlvjQTWRq7g
         Oih0IoKbt70eYRgwWqUh0ZYjlt0/uEzYU52MiF47g8u92IWXg5icEizL6mgyAg2M3AFQ
         NzYGeVNW6kpn6Mu2xOVdm/TRvWYGC4iygDkjq4z2iZPBdnJftrmZfjwm9x3CvxgkvR6/
         fyPFR8qufo4wXOgk5hqb5R4nimPz9BkeIPYFD35PHq0gDWNo50Pl6sNXt9QLdijl/MDw
         kYqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=4VNllDn3e4my8IHs8+jRLXE/SyMCMN5aQ3NIL2dikb0=;
        b=GQ05cQrSoAckc2q28hGvWIao+BuMiN+LKnXQ3ks30H6lqdmoSm7n8cJOomUTYNyNac
         iPhBx6fop5XazHa1uNg7WaJbjvKJWWSY1Uniej8zkwZ1llN+W2uuOC9J8YBYAWLtT2r0
         a/IgVkExDtr24Zuc6jIxqRthE0xaXqqh7OBAi0/G34x94OnjmmIfRXaGmf1veDOQMxiX
         F3IqKsTDLr+jtuaz0i75ohrNEqjaIX6nFCoFjdxiyXMLm3c+ZjzafTJptmtS5V1Fl4Lc
         ealW9JpLGTxJy/sOQ3Ahb24zJJ3tTN3ZguTviaIVJGUnkuz1FVIJjMslB3hdweFfoy/6
         w4Fg==
X-Gm-Message-State: AOAM533yhpdAIrH7lyzMbkgNoVOpMkoESylEe4/gT4qsXqZNxjgyvaE7
        KOoc1HRLSUuckxU/bDz60EYc0topuQHe8Q==
X-Google-Smtp-Source: ABdhPJyS/+l3MG2SypAEmW0Cs7sftot2it21ZRHSASfogm+FR68J55shUwTPUIAPcnwp9PvzzBDsEg==
X-Received: by 2002:a1c:1b46:: with SMTP id b67mr8061436wmb.82.1603557296339;
        Sat, 24 Oct 2020 09:34:56 -0700 (PDT)
Received: from localhost.localdomain ([84.238.208.204])
        by smtp.gmail.com with ESMTPSA id c130sm13000736wma.1.2020.10.24.09.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2020 09:34:55 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH] venus: venc: Fix setting of profile and level
Date:   Sat, 24 Oct 2020 19:34:36 +0300
Message-Id: <20201024163436.19638-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The profile and level in op_set_ctrl was recently changed but during
v4l2_ctrl_handler_setup profile and level control values are mangled.

Fixes: 435c53c3698f ("media: venus: venc: Use helper to set profile and level")
Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/core.h      | 15 +++++++--
 drivers/media/platform/qcom/venus/venc.c      | 32 ++++++++++++++++++-
 .../media/platform/qcom/venus/venc_ctrls.c    | 14 ++++++--
 3 files changed, 56 insertions(+), 5 deletions(-)

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
index f8b1484e7dcd..7322b01f2e3a 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -537,6 +537,7 @@ static int venc_set_properties(struct venus_inst *inst)
 	struct hfi_quantization quant;
 	struct hfi_quantization_range quant_range;
 	u32 ptype, rate_control, bitrate;
+	u32 profile, level;
 	int ret;
 
 	ret = venus_helper_set_work_mode(inst, VIDC_WORK_MODE_2);
@@ -684,7 +685,36 @@ static int venc_set_properties(struct venus_inst *inst)
 	if (ret)
 		return ret;
 
-	ret = venus_helper_set_profile_level(inst, ctr->profile, ctr->level);
+	switch (inst->hfi_codec) {
+	case HFI_VIDEO_CODEC_H264:
+		profile = ctr->profile.h264;
+		level = ctr->level.h264;
+		break;
+	case HFI_VIDEO_CODEC_MPEG2:
+		profile = 0;
+		level = 0;
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
+	default:
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

