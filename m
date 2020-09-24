Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4CEA2777DC
	for <lists+linux-media@lfdr.de>; Thu, 24 Sep 2020 19:31:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728553AbgIXRbf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Sep 2020 13:31:35 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:33711 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726915AbgIXRbf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Sep 2020 13:31:35 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 24 Sep 2020 10:31:34 -0700
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 24 Sep 2020 10:31:31 -0700
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg01-blr.qualcomm.com with ESMTP; 24 Sep 2020 23:01:18 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id B049A4E7F; Thu, 24 Sep 2020 23:01:17 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH 1/2] venus: venc: update output format based on capture format.
Date:   Thu, 24 Sep 2020 23:01:13 +0530
Message-Id: <1600968674-11559-2-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1600968674-11559-1-git-send-email-dikshita@codeaurora.org>
References: <1600968674-11559-1-git-send-email-dikshita@codeaurora.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

update output format parameters when s_fmt is called on
capture port as recommended in encoder spec.

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
---
 drivers/media/platform/qcom/venus/venc.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index c591d00..7d2aaa8 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -382,31 +382,33 @@ static int venc_s_fmt(struct file *file, void *fh, struct v4l2_format *f)
 
 	memset(&format, 0, sizeof(format));
 
-	format.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
-	format.fmt.pix_mp.pixelformat = pixfmt_out;
+	format.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+	format.fmt.pix_mp.pixelformat = pixfmt_cap;
 	format.fmt.pix_mp.width = orig_pixmp.width;
 	format.fmt.pix_mp.height = orig_pixmp.height;
 	venc_try_fmt_common(inst, &format);
 
-	if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
-		inst->out_width = format.fmt.pix_mp.width;
-		inst->out_height = format.fmt.pix_mp.height;
-		inst->colorspace = pixmp->colorspace;
-		inst->ycbcr_enc = pixmp->ycbcr_enc;
-		inst->quantization = pixmp->quantization;
-		inst->xfer_func = pixmp->xfer_func;
+	if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
+		inst->width = format.fmt.pix_mp.width;
+		inst->height = format.fmt.pix_mp.height;
 	}
 
 	memset(&format, 0, sizeof(format));
 
-	format.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
-	format.fmt.pix_mp.pixelformat = pixfmt_cap;
+	format.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
+	format.fmt.pix_mp.pixelformat = pixfmt_out;
 	format.fmt.pix_mp.width = orig_pixmp.width;
 	format.fmt.pix_mp.height = orig_pixmp.height;
 	venc_try_fmt_common(inst, &format);
 
-	inst->width = format.fmt.pix_mp.width;
-	inst->height = format.fmt.pix_mp.height;
+	inst->out_width = format.fmt.pix_mp.width;
+	inst->out_height = format.fmt.pix_mp.height;
+	if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		inst->colorspace = pixmp->colorspace;
+		inst->ycbcr_enc = pixmp->ycbcr_enc;
+		inst->quantization = pixmp->quantization;
+		inst->xfer_func = pixmp->xfer_func;
+	}
 
 	if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
 		inst->fmt_out = fmt;
-- 
1.9.1

