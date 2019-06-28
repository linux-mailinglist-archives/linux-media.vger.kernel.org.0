Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AE0D59C60
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2019 15:01:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726837AbfF1NBX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jun 2019 09:01:23 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:37987 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726941AbfF1NA1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jun 2019 09:00:27 -0400
Received: by mail-wm1-f67.google.com with SMTP id s15so8887350wmj.3
        for <linux-media@vger.kernel.org>; Fri, 28 Jun 2019 06:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=fBtq7kaIVPRsvKUzCzl5KDAdxqoIYBr/rU+qALMTKSc=;
        b=qnObovf0dgdVThBXHp4TM9zp+07NpQtylNFNkZwDDsvwArg7j42IQapGVbuUonaf9Z
         S0Y8DajsY0tEHZc30D7gM0RuxbzuBPA3rj0zTGinC5guvIKjToiyngXvw1D/DIjmGU4W
         cVHl60Zc1e8LMu9IypcFUxr0DqjlMCwZ5d1gFb4sgm5DqcsRjMnJnWkoFntoIMF/Y8Be
         PYZRjSa6Sn8NxSSGz26L7lBiCiZGD7C9WHTdenAf8pUSAiAdAbyIg/W4V5ycoPqxHC6K
         MKcmBOcOwkjawRJCCA30UVfNHWq4o+NE0Lpv8U2tkUFIrPSuZVSw+C6i3WewD3++CRaJ
         ZSOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=fBtq7kaIVPRsvKUzCzl5KDAdxqoIYBr/rU+qALMTKSc=;
        b=q3Ar7OTE5KMQjYVvjbMV7UhSTK5sWsJtv7otayD74AF6k6VIvJx5WRf1KViochkbaF
         qNJnYt8Uj7q4YVsxqpPjSJcuXaEedRLom37lRE3QZEAdpXapw2HBAERhwye6u7zM0Ks1
         3FTSEGGJ4CJEFYHPYobPIvi7sDBja6Hcwcee5qzzKh8dQHhl+3ZA9crHYVnfGEXJEauS
         kdDK0cNAwTJyhP996UBbplfcEuU2aflCPzM1974irZ6ePwORHTwFeFLJi+4JqmlwfzEG
         eVQJUZ7bv/icsRI+A0ZLflLAl6jbGM7A7hbKpxG9uQPpkUHmij0Pqj3SUd/rRHQUF7ZU
         N1gg==
X-Gm-Message-State: APjAAAVo5Lt1eyruET5BdyiT1QLPMPRjFQLCqpMGL8PP1few0KbWSrOo
        C+yKc9bkRmT0tNyGEwOUVJ96c/4P20s=
X-Google-Smtp-Source: APXvYqwptiM6Vwm0pmZRy1vFr1GIZCMCQqz0LnSLYCEDC7pY38tqbWIxjWEj//juZOVa+rcuoIQsIA==
X-Received: by 2002:a1c:2907:: with SMTP id p7mr7095504wmp.100.1561726825393;
        Fri, 28 Jun 2019 06:00:25 -0700 (PDT)
Received: from localhost.localdomain ([37.157.136.206])
        by smtp.gmail.com with ESMTPSA id w20sm3717174wra.96.2019.06.28.06.00.24
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 28 Jun 2019 06:00:24 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Malathi Gottam <mgottam@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 01/11] venus: venc: amend buffer size for bitstream plane
Date:   Fri, 28 Jun 2019 15:59:52 +0300
Message-Id: <20190628130002.24293-2-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190628130002.24293-1-stanimir.varbanov@linaro.org>
References: <20190628130002.24293-1-stanimir.varbanov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Malathi Gottam <mgottam@codeaurora.org>

Accept the buffer size requested by client and compare it
against driver calculated size and set the maximum to
bitstream plane.

Signed-off-by: Malathi Gottam <mgottam@codeaurora.org>
Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/venc.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index a5f3d2c46bea..1b7fb2d5887c 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -294,6 +294,7 @@ venc_try_fmt_common(struct venus_inst *inst, struct v4l2_format *f)
 	struct v4l2_pix_format_mplane *pixmp = &f->fmt.pix_mp;
 	struct v4l2_plane_pix_format *pfmt = pixmp->plane_fmt;
 	const struct venus_format *fmt;
+	u32 sizeimage;
 
 	memset(pfmt[0].reserved, 0, sizeof(pfmt[0].reserved));
 	memset(pixmp->reserved, 0, sizeof(pixmp->reserved));
@@ -325,9 +326,10 @@ venc_try_fmt_common(struct venus_inst *inst, struct v4l2_format *f)
 	pixmp->num_planes = fmt->num_planes;
 	pixmp->flags = 0;
 
-	pfmt[0].sizeimage = venus_helper_get_framesz(pixmp->pixelformat,
-						     pixmp->width,
-						     pixmp->height);
+	sizeimage = venus_helper_get_framesz(pixmp->pixelformat,
+					     pixmp->width,
+					     pixmp->height);
+	pfmt[0].sizeimage = max(ALIGN(pfmt[0].sizeimage, SZ_4K), sizeimage);
 
 	if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
 		pfmt[0].bytesperline = ALIGN(pixmp->width, 128);
@@ -399,8 +401,10 @@ static int venc_s_fmt(struct file *file, void *fh, struct v4l2_format *f)
 
 	if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
 		inst->fmt_out = fmt;
-	else if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+	else if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
 		inst->fmt_cap = fmt;
+		inst->output_buf_size = pixmp->plane_fmt[0].sizeimage;
+	}
 
 	return 0;
 }
@@ -918,6 +922,7 @@ static int venc_queue_setup(struct vb2_queue *q,
 		sizes[0] = venus_helper_get_framesz(inst->fmt_cap->pixfmt,
 						    inst->width,
 						    inst->height);
+		sizes[0] = max(sizes[0], inst->output_buf_size);
 		inst->output_buf_size = sizes[0];
 		break;
 	default:
-- 
2.17.1

