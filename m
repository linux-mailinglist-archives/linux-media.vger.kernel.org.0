Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B5CB288580
	for <lists+linux-media@lfdr.de>; Fri,  9 Oct 2020 10:45:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732898AbgJIIpt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Oct 2020 04:45:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730726AbgJIIpq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Oct 2020 04:45:46 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D10BFC0613D5
        for <linux-media@vger.kernel.org>; Fri,  9 Oct 2020 01:45:44 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id y20so4119857pll.12
        for <linux-media@vger.kernel.org>; Fri, 09 Oct 2020 01:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ORjMAqZkzpP1CBUX3hMJCRTwWJbFlamPjNAuY/fQyLo=;
        b=U+15yQkQeJs/btau5BIG2D7ByHK7a1ek27TkHiV6qwJxbPFF2+afMtvhO5Xj6/E0gO
         oIplZv7qRTFoH2ROyu6YY3ceETHBmlGtzZd4EK4xfAGkU3qdj1jxxawBhQocl7YUPcqk
         hHLK1NPQro1DkOmcj4CdKffYZB5ssV2juSzL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ORjMAqZkzpP1CBUX3hMJCRTwWJbFlamPjNAuY/fQyLo=;
        b=YGpvf1LIjV0ZjnZj0f1fEQ3Pb2vGlhGWb3S79psfkB/RHMw8GnsTtjNiCxuLA53NUa
         7A82niZbS6IKjUOJMKWom9TgjCAE6qvolJHFPmUh38z2l+pRMlE+xYqWr3pRt4myi3NA
         NZQNoxiMTq0s1m6gdiVjvOfBaWqkjswoWN+lGgnuaUIx1acb72RU7frm7eNkKAEWxJIm
         +wur3aLcmDDFec5IxbO9w80YIp7bom/5VxrgfcDeAZGvKzNtNCyCFNnRhZwXmY27DBaT
         HUUsIqhgt0YKTwQO6cIoVm4Qg7X064LZrUE7OgJvKNWCWUZYtxLmdFeoAXw69czJYYh4
         WtRQ==
X-Gm-Message-State: AOAM5330FFRYt0X1Vk2F0Dj/MmIVtYkoCsSdOivCb2cNgQTWN+zThTfq
        BU75rMSew8Vw73tMQTptqB0iAg==
X-Google-Smtp-Source: ABdhPJzA0jWGMM2jo96MtVdKXdv8pv4bFGf3nZggi8s+JXNc15k3wzeGhC7sm6TVO8oYRFFSg9+qqQ==
X-Received: by 2002:a17:902:a588:b029:d3:7f4a:28a2 with SMTP id az8-20020a170902a588b02900d37f4a28a2mr11325987plb.26.1602233144239;
        Fri, 09 Oct 2020 01:45:44 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:eeb1:d7ff:fe57:b7e5])
        by smtp.gmail.com with ESMTPSA id w10sm9872760pjy.13.2020.10.09.01.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 01:45:43 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH] venus: vdec: return parsed crop information from stream
Date:   Fri,  9 Oct 2020 17:45:33 +0900
Message-Id: <20201009084533.2405320-1-acourbot@chromium.org>
X-Mailer: git-send-email 2.28.0.1011.ga647a8990f-goog
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

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 drivers/media/platform/qcom/venus/core.h |  1 +
 drivers/media/platform/qcom/venus/vdec.c | 21 ++++++++++++++++-----
 2 files changed, 17 insertions(+), 5 deletions(-)

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
index ea13170a6a2c..ee74346f0cae 100644
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
 
@@ -1309,6 +1312,10 @@ static void vdec_event_change(struct venus_inst *inst,
 
 	inst->width = format.fmt.pix_mp.width;
 	inst->height = format.fmt.pix_mp.height;
+	inst->crop.left = ev_data->input_crop.left;
+	inst->crop.top = ev_data->input_crop.top;
+	inst->crop.width = ev_data->input_crop.width;
+	inst->crop.height = ev_data->input_crop.height;
 
 	inst->out_width = ev_data->width;
 	inst->out_height = ev_data->height;
@@ -1412,6 +1419,10 @@ static void vdec_inst_init(struct venus_inst *inst)
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
2.28.0.1011.ga647a8990f-goog

