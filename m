Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BF4059C50
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2019 15:01:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727349AbfF1NBC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jun 2019 09:01:02 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:33888 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727231AbfF1NAj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jun 2019 09:00:39 -0400
Received: by mail-wm1-f67.google.com with SMTP id w9so9303549wmd.1
        for <linux-media@vger.kernel.org>; Fri, 28 Jun 2019 06:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=FBLKO27dHaQrao2r2KD0kPHzW+2HdrGXpaJBaZnrR7A=;
        b=ZAzZ4lAoYkAvxfaNWBiUuUnyQCQbbNKsMpfDtAC8redcT2OJnWdYZ5zLYRV7OxhU0M
         cTvnN9rKm0edBhzNW9YvVCIQfxKH1oCMLpqOI9D0kamX1Q+OxtfE/rRgXdoOfqDORyb2
         vo271veLtKQtd02Alrb9H2WZE3BF+ts+V99Qc9+pjEAoC5QzJqRgx5ykA6hd81UQ75dB
         BQF+FFDizh+8du1kybPRkxbff3Znk4xJz/0hhnoODYbwrd9hvmfJ/A1ommLfNWXLsbtA
         cEV4z2oRMm33vpwCmMFwuicwduGxtF7d03NUcgpzs+7xA/eeTwYATtYAaZI8gbHrVCrO
         Y9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=FBLKO27dHaQrao2r2KD0kPHzW+2HdrGXpaJBaZnrR7A=;
        b=S/aiUaXZJGxhjU3elsxXlGR7+JtAL+8SfWGiST/u7TRV0JMWPMDk2P/kujAzxE3A9T
         IvAQiwRrktJzihJWa/DwxQHGZsITuJM8mnA9/scOAQAzn7KJlvHeMXKm2JsRk/f/9BiM
         7NrIcaE69GvhRS8GHtDCP18q9+iSQ0n+GotSaMFlgEZo5LZ0+cMdcVc1NDFwk0M7DF90
         rFWUCaAW68dD74ZzKo6V+VSIo+8PASJxrwDfPd/v+uKJdI6YORdUhDpSo3JVE8za+Heo
         hNArgjipUpv6YyFUADbeasYOSPWN/BxUsLVvI6EwnPG92G3mrQUoM2bgfMLmAFx8UY4Y
         MD5A==
X-Gm-Message-State: APjAAAWc62E1Kma0gPXv0T1dDsY67iwrlPnySlSIf4+Dkh+HVESRPfTe
        1lFeOlwXcOGPQjoMH7mMIbbWn9IQ/hQ=
X-Google-Smtp-Source: APXvYqwqflrL3YrHtECcS2DZIVdWIdGzjH/ag05XABo4jCqYYqZOkm2MrVFedP1fWcXviFy1AABI6w==
X-Received: by 2002:a1c:9a03:: with SMTP id c3mr7324818wme.101.1561726837254;
        Fri, 28 Jun 2019 06:00:37 -0700 (PDT)
Received: from localhost.localdomain ([37.157.136.206])
        by smtp.gmail.com with ESMTPSA id w20sm3717174wra.96.2019.06.28.06.00.36
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 28 Jun 2019 06:00:36 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 08/11] venus: vdec: allow bigger sizeimage set by clients
Date:   Fri, 28 Jun 2019 15:59:59 +0300
Message-Id: <20190628130002.24293-9-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190628130002.24293-1-stanimir.varbanov@linaro.org>
References: <20190628130002.24293-1-stanimir.varbanov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In most of the cases the client will know better what could be
the maximum size for compressed data buffers. Change the driver
to permit the user to set bigger size for the compressed buffer
but make reasonable sanitation.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/vdec.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index e1f998656c07..fb9afee76793 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -133,6 +133,7 @@ vdec_try_fmt_common(struct venus_inst *inst, struct v4l2_format *f)
 	struct v4l2_pix_format_mplane *pixmp = &f->fmt.pix_mp;
 	struct v4l2_plane_pix_format *pfmt = pixmp->plane_fmt;
 	const struct venus_format *fmt;
+	u32 szimage;
 
 	memset(pfmt[0].reserved, 0, sizeof(pfmt[0].reserved));
 	memset(pixmp->reserved, 0, sizeof(pixmp->reserved));
@@ -161,14 +162,17 @@ vdec_try_fmt_common(struct venus_inst *inst, struct v4l2_format *f)
 	pixmp->num_planes = fmt->num_planes;
 	pixmp->flags = 0;
 
-	pfmt[0].sizeimage = venus_helper_get_framesz(pixmp->pixelformat,
-						     pixmp->width,
-						     pixmp->height);
+	szimage = venus_helper_get_framesz(pixmp->pixelformat, pixmp->width,
+					   pixmp->height);
 
-	if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+	if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
+		pfmt[0].sizeimage = szimage;
 		pfmt[0].bytesperline = ALIGN(pixmp->width, 128);
-	else
+	} else {
+		pfmt[0].sizeimage = clamp_t(u32, pfmt[0].sizeimage, 0, SZ_8M);
+		pfmt[0].sizeimage = max(pfmt[0].sizeimage, szimage);
 		pfmt[0].bytesperline = 0;
+	}
 
 	return fmt;
 }
@@ -266,6 +270,7 @@ static int vdec_s_fmt(struct file *file, void *fh, struct v4l2_format *f)
 		inst->ycbcr_enc = pixmp->ycbcr_enc;
 		inst->quantization = pixmp->quantization;
 		inst->xfer_func = pixmp->xfer_func;
+		inst->input_buf_size = pixmp->plane_fmt[0].sizeimage;
 	}
 
 	memset(&format, 0, sizeof(format));
@@ -728,6 +733,7 @@ static int vdec_queue_setup(struct vb2_queue *q,
 		sizes[0] = venus_helper_get_framesz(inst->fmt_out->pixfmt,
 						    inst->out_width,
 						    inst->out_height);
+		sizes[0] = max(sizes[0], inst->input_buf_size);
 		inst->input_buf_size = sizes[0];
 		*num_buffers = max(*num_buffers, in_num);
 		inst->num_input_bufs = *num_buffers;
-- 
2.17.1

