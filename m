Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB479261588
	for <lists+linux-media@lfdr.de>; Tue,  8 Sep 2020 18:53:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731909AbgIHQwm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Sep 2020 12:52:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732090AbgIHQwM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Sep 2020 12:52:12 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8633C06134E
        for <linux-media@vger.kernel.org>; Tue,  8 Sep 2020 05:33:37 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id o8so9060383ejb.10
        for <linux-media@vger.kernel.org>; Tue, 08 Sep 2020 05:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=sN4+mZ5uhIAG0/WLkYctbIQcbAJtPn6Wi3GZq31qSIg=;
        b=ugYmjN2xSHhF+21F3d6hVWxMmiUDsryJHIXuwRUHRfhQ4TYfF/9IpxodOQvAjPwnrN
         KYGdkGCLqQgm9tAA6RaKgQALDbF1Y+Cn+PsB/1XAaBeUMoTNKilxf92q7/WiZxmXyO3n
         yR9eS3xfO/9Pg8zEzTGnoj59wcp+w/zE4FztcOxZhmW6/74rwJ4GapCfZ2wzJnSLmPFP
         StSHAYcGuP0QuR96/3HVpfU1mGfHnbHCXPHLCXN/Mrdf/g+22eWx5vM0gfLgQme42lB+
         BgXWfzPbr0Ip5OzxRgOsw6ywurxu4bv2EyqV3k6B5UiNvbYCYsW7TNOwS+WH7skgLnrZ
         4t4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=sN4+mZ5uhIAG0/WLkYctbIQcbAJtPn6Wi3GZq31qSIg=;
        b=QPdF48VHTZY9F0qP4s3opYXKFzcKcl8RguwAMhPt+zep0PsXZwZwEwWiGR/L6OB2oC
         +OKKxTxTfy1QPTDxv0+pVmZ+Yl1I8wTZIFnF4GZHlsc/aUYEzFGcEHmNnY1C+Ez69LbT
         IyoHE4TAuxmk1xhmBNUc3xJA+FS7aTefDsWWUXYb9vwN5WBhAOC7FS4zC5NomKpIFuGi
         GHMTRZ622/xi5QupbDsWTnxtigyKFoBMnN0titqj9re2KDPjewB9J226WlLt5zY26F5L
         53o4VNhuK3rH1FUDMXz8h9aQ2gED8t01t4NuExHKEtYsI+dpFLFi/DPHpZ7KOXqkmCz+
         AnCQ==
X-Gm-Message-State: AOAM531ruXIPP01dV9x0DDPJamGQybDPv8RieAw8Pg+rPk1MvNVfmnJK
        NIjqagkOLB36vnordh2DH/e0Aw==
X-Google-Smtp-Source: ABdhPJxHtd4i992YKOwmkNVnGZRsMiLfUfV15eGwYacP2ySW3da2CW4AtHELAQrxAQUN07P6vV4aUA==
X-Received: by 2002:a17:906:e103:: with SMTP id gj3mr25132826ejb.153.1599568416595;
        Tue, 08 Sep 2020 05:33:36 -0700 (PDT)
Received: from localhost.localdomain ([195.24.90.54])
        by smtp.gmail.com with ESMTPSA id y9sm17499744edo.37.2020.09.08.05.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 05:33:35 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        nicolas.dufresne@collabora.com,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v3 5/6] venus: vdec: Use helper to get profile and level
Date:   Tue,  8 Sep 2020 15:32:20 +0300
Message-Id: <20200908123221.2793-6-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200908123221.2793-1-stanimir.varbanov@linaro.org>
References: <20200908123221.2793-1-stanimir.varbanov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently the returned profile and level is not aligned with
v4l2 ctrl id. Correct that by use the helpers which translate
the v4l2 <-> hfi mapping internally.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/vdec_ctrls.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/vdec_ctrls.c b/drivers/media/platform/qcom/venus/vdec_ctrls.c
index f3f41c1baa6e..974110b75b93 100644
--- a/drivers/media/platform/qcom/venus/vdec_ctrls.c
+++ b/drivers/media/platform/qcom/venus/vdec_ctrls.c
@@ -42,9 +42,8 @@ static int vdec_op_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
 	struct venus_inst *inst = ctrl_to_inst(ctrl);
 	struct vdec_controls *ctr = &inst->controls.dec;
 	struct hfi_buffer_requirements bufreq;
-	union hfi_get_property hprop;
 	enum hfi_version ver = inst->core->res->hfi_version;
-	u32 ptype = HFI_PROPERTY_PARAM_PROFILE_LEVEL_CURRENT;
+	u32 profile, level;
 	int ret;
 
 	switch (ctrl->id) {
@@ -52,17 +51,17 @@ static int vdec_op_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_MPEG_VIDEO_MPEG4_PROFILE:
 	case V4L2_CID_MPEG_VIDEO_VP8_PROFILE:
 	case V4L2_CID_MPEG_VIDEO_VP9_PROFILE:
-		ret = hfi_session_get_property(inst, ptype, &hprop);
+		ret = venus_helper_get_profile_level(inst, &profile, &level);
 		if (!ret)
-			ctr->profile = hprop.profile_level.profile;
+			ctr->profile = profile;
 		ctrl->val = ctr->profile;
 		break;
 	case V4L2_CID_MPEG_VIDEO_H264_LEVEL:
 	case V4L2_CID_MPEG_VIDEO_MPEG4_LEVEL:
 	case V4L2_CID_MPEG_VIDEO_VP9_LEVEL:
-		ret = hfi_session_get_property(inst, ptype, &hprop);
+		ret = venus_helper_get_profile_level(inst, &profile, &level);
 		if (!ret)
-			ctr->level = hprop.profile_level.level;
+			ctr->level = level;
 		ctrl->val = ctr->level;
 		break;
 	case V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER:
-- 
2.17.1

