Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B5F92945CA
	for <lists+linux-media@lfdr.de>; Wed, 21 Oct 2020 02:10:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410830AbgJUAKH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 20:10:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2410816AbgJUAKG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 20:10:06 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54044C0613D4
        for <linux-media@vger.kernel.org>; Tue, 20 Oct 2020 17:10:05 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id 10so397141pfp.5
        for <linux-media@vger.kernel.org>; Tue, 20 Oct 2020 17:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Es1dpFQTuiiNlYwTsEw7UkWuaTMZ5bRe2lb/esylIPk=;
        b=DkFJtnGsN/NqjU4Gcguh6ZMWdPdaDDudzh7natzuoeZZ4rg0fq5jA9bG4zFJ2IOdLW
         ToSA2nME8bIpGp7+6ihkt6m+ZXEf4Ib6Gk4e66/LDAjFX6Pq/i1d85MUnCjcAwvChbvf
         awDWYlpBQ2GpuHOf8zIWuBgXpcCW8QScqj6aY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Es1dpFQTuiiNlYwTsEw7UkWuaTMZ5bRe2lb/esylIPk=;
        b=ZrDqHZubgNKd0sdZAxOtgZZNsC3rT+aH+AdWCCQP5lXe+uvpXr3bYyxPguJ1tub8ii
         VanDILjodlk2Lj9Kk2kHyy5wjcAt2PpzU6kopFUsTrTdWp5v9J0/FhShReGKuwZIgwAT
         L/UCrCQXUfgEgDk8MZGhKuzK0y2uB87mNeJ1S6uaVZBf9pOEVPWbtWcvRwm07TIUIKta
         CQueQD6E0hWTevet5MG1KQsFWTvOVDtW9Slw0A+b4R5Yv3RflqLo71EvyUwtFjCpPVKz
         3lHvNjfh+LFzVlYV7uns3a7uX1gv0nJ683KXtxam7C6ve/ln53C5puG6DCCVrwubKAq7
         hdRw==
X-Gm-Message-State: AOAM531mvC9DOGJ1CiFbiEsjKxGR9B8W7UGA2UJCsODGNUbAl4npd/bt
        HSaM/EIErlzU562IdvaNql5p8w==
X-Google-Smtp-Source: ABdhPJyzdyQnQDaBVvvLa8T1uYFZW2KdVfbQNNLZFMJGba7udQ5FlFZqIT/v6eKvJ4PaGcCEI+GIZg==
X-Received: by 2002:a62:6202:0:b029:15c:dac8:866 with SMTP id w2-20020a6262020000b029015cdac80866mr537873pfb.72.1603239004493;
        Tue, 20 Oct 2020 17:10:04 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:eeb1:d7ff:fe57:b7e5])
        by smtp.gmail.com with ESMTPSA id j15sm267368pgn.32.2020.10.20.17.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2020 17:10:03 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     Fritz Koenig <frkoenig@chromium.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH v2] venus: vdec: return parsed crop information from stream
Date:   Wed, 21 Oct 2020 09:09:43 +0900
Message-Id: <20201021000943.656247-1-acourbot@chromium.org>
X-Mailer: git-send-email 2.29.0.rc1.297.gfa9743e501-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Per the stateful codec specification, VIDIOC_G_SELECTION with a target
of V4L2_SEL_TGT_COMPOSE is supposed to return the crop area of capture
buffers containing the decoded frame. Until now the driver did not get
that information from the firmware and just returned the dimensions of
CAPTURE buffers.

The firmware unfortunately does not always provide the crop information
from the stream ; also make sure to detect when that happens and
fallback to providing the coded size in these cases.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
Changes since v1:
* Fall back to the previous behavior of returning the coded size if the
  firmware does not report any crop information.

 drivers/media/platform/qcom/venus/core.h |  1 +
 drivers/media/platform/qcom/venus/vdec.c | 32 ++++++++++++++++++++----
 2 files changed, 28 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 7b79a33dc9d6..3bc129a4f817 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -361,6 +361,7 @@ struct venus_inst {
 	unsigned int streamon_cap, streamon_out;
 	u32 width;
 	u32 height;
+	struct v4l2_rect crop;
 	u32 out_width;
 	u32 out_height;
 	u32 colorspace;
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index ea13170a6a2c..8488411204c3 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -325,6 +325,10 @@ static int vdec_s_fmt(struct file *file, void *fh, struct v4l2_format *f)
 
 	inst->width = format.fmt.pix_mp.width;
 	inst->height = format.fmt.pix_mp.height;
+	inst->crop.top = 0;
+	inst->crop.left = 0;
+	inst->crop.width = inst->width;
+	inst->crop.height = inst->height;
 
 	if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
 		inst->fmt_out = fmt;
@@ -343,6 +347,9 @@ vdec_g_selection(struct file *file, void *fh, struct v4l2_selection *s)
 	    s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
 		return -EINVAL;
 
+	s->r.top = 0;
+	s->r.left = 0;
+
 	switch (s->target) {
 	case V4L2_SEL_TGT_CROP_BOUNDS:
 	case V4L2_SEL_TGT_CROP_DEFAULT:
@@ -363,16 +370,12 @@ vdec_g_selection(struct file *file, void *fh, struct v4l2_selection *s)
 	case V4L2_SEL_TGT_COMPOSE:
 		if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
 			return -EINVAL;
-		s->r.width = inst->out_width;
-		s->r.height = inst->out_height;
+		s->r = inst->crop;
 		break;
 	default:
 		return -EINVAL;
 	}
 
-	s->r.top = 0;
-	s->r.left = 0;
-
 	return 0;
 }
 
@@ -1309,6 +1312,21 @@ static void vdec_event_change(struct venus_inst *inst,
 
 	inst->width = format.fmt.pix_mp.width;
 	inst->height = format.fmt.pix_mp.height;
+	/*
+	 * Some versions of the firmware do not report crop information for
+	 * all codecs. For these cases, set the crop to the coded resolution.
+	 */
+	if (ev_data->input_crop.width > 0 && ev_data->input_crop.height > 0) {
+		inst->crop.left = ev_data->input_crop.left;
+		inst->crop.top = ev_data->input_crop.top;
+		inst->crop.width = ev_data->input_crop.width;
+		inst->crop.height = ev_data->input_crop.height;
+	} else {
+		inst->crop.left = 0;
+		inst->crop.top = 0;
+		inst->crop.width = ev_data->width;
+		inst->crop.height = ev_data->height;
+	}
 
 	inst->out_width = ev_data->width;
 	inst->out_height = ev_data->height;
@@ -1412,6 +1430,10 @@ static void vdec_inst_init(struct venus_inst *inst)
 	inst->fmt_cap = &vdec_formats[0];
 	inst->width = frame_width_min(inst);
 	inst->height = ALIGN(frame_height_min(inst), 32);
+	inst->crop.left = 0;
+	inst->crop.top = 0;
+	inst->crop.width = inst->width;
+	inst->crop.height = inst->height;
 	inst->out_width = frame_width_min(inst);
 	inst->out_height = frame_height_min(inst);
 	inst->fps = 30;
-- 
2.29.0.rc1.297.gfa9743e501-goog

