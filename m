Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E156D20ADE9
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 10:06:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729252AbgFZIGP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 04:06:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729246AbgFZIGO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 04:06:14 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 121EFC08C5C1
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2020 01:06:15 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id q90so3881861pjh.3
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2020 01:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NbohQFHY7x95L6QCxTobEstXc6fGTf3rPXBo2gDeR+4=;
        b=RZSRuHcg+fqMQQA3O2GKclz3AMt+0iakFG324G+yuOcaJSx1C2zvSZd7p3mh+isy0W
         fMrml0vILtGCti3TW2EGJrSE+2sMayf1xKMNfjGU2C7HO843sEKamFIG9eJ+bvLtiw/O
         U9A4K3YIbFGUboPjcnjlqNVcXfWMuih/PpKJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NbohQFHY7x95L6QCxTobEstXc6fGTf3rPXBo2gDeR+4=;
        b=FxBNdrZjD2xRZ+Bdt/bnWfsqdMXkdUkM5RA6MebNlsvB69Ofl/60FBpXQddBTlZyRE
         /lvBnJmnhD4WwcWf7ZBAOnFO0lusD/cwUXLIW6We428A1Th8ep6NGNQwCC/GdCcypGm3
         klXnbzBsApsLN7eLTjCSmN1epKa1uAHcAwqZ8j7cqXdCNLV6YPBHV0xyeyLu/Na0/X+W
         pEbKSXPiQxUWymcJ9un5fre7cJXR9s+/6Mx66ZC2RRh6bAyMIthT+xNGOmtw8S0ciX9q
         foTkijXaVIrdz2t1K9HX3oHGCc995d3nwu5U/zaMWcJUuyWPRoaqC2fJ2ymGagueQmOb
         49Bw==
X-Gm-Message-State: AOAM531sh2qJnVeO8IkKKbvhHmWdruoFz0I0/iDdNrg4qTbQYUH2UVDW
        9qa+4ztAaGuAM+bfdbDier0zUA==
X-Google-Smtp-Source: ABdhPJyo/eKnP9Mj39RkYn10v03lQbOGvoSfYy+bk02mQFN2DxVBCFGSYeL/vgwY7Jx0BX/7YKIjuw==
X-Received: by 2002:a17:902:aa97:: with SMTP id d23mr1663416plr.128.1593158774621;
        Fri, 26 Jun 2020 01:06:14 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:93d9:de4d:e834:3086])
        by smtp.gmail.com with ESMTPSA id 137sm21809843pgg.72.2020.06.26.01.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 01:06:13 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Rui Wang <gtk_ruiwang@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Pi-Hsun Shih <pihsun@chromium.org>,
        Maoguang Meng <maoguang.meng@mediatek.com>
Cc:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH v2 14/18] media: mtk-vcodec: venc: support ENUM_FRAMESIZES on OUTPUT formats
Date:   Fri, 26 Jun 2020 17:04:38 +0900
Message-Id: <20200626080442.292309-15-acourbot@chromium.org>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
In-Reply-To: <20200626080442.292309-1-acourbot@chromium.org>
References: <20200626080442.292309-1-acourbot@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

v4l2-compliance requires ENUM_FRAMESIZES to support OUTPUT formats.
Reuse mtk_venc_find_format() to make sure both queues are considered
when serving an ENUM_FRAMESIZES.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 72 +++++++++----------
 1 file changed, 34 insertions(+), 38 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
index f8d4fbe927f9..6cef61cb7883 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
@@ -123,28 +123,45 @@ static int vidioc_enum_fmt(struct v4l2_fmtdesc *f,
 	return 0;
 }
 
+static const struct mtk_video_fmt *mtk_venc_find_format(u32 fourcc,
+	const struct mtk_vcodec_enc_pdata *pdata)
+{
+	const struct mtk_video_fmt *fmt;
+	unsigned int k;
+
+	for (k = 0; k < pdata->num_capture_formats; k++) {
+		fmt = &pdata->capture_formats[k];
+		if (fmt->fourcc == fourcc)
+			return fmt;
+	}
+
+	for (k = 0; k < pdata->num_output_formats; k++) {
+		fmt = &pdata->output_formats[k];
+		if (fmt->fourcc == fourcc)
+			return fmt;
+	}
+
+	return NULL;
+}
+
+
 static int vidioc_enum_framesizes(struct file *file, void *fh,
 				  struct v4l2_frmsizeenum *fsize)
 {
-	const struct mtk_vcodec_enc_pdata *pdata =
-		fh_to_ctx(fh)->dev->venc_pdata;
-	int i = 0;
+	const struct mtk_video_fmt *fmt;
 
 	if (fsize->index != 0)
 		return -EINVAL;
 
-	for (i = 0; i < pdata->num_capture_formats; ++i) {
-		const struct mtk_video_fmt *fmt = &pdata->capture_formats[i];
-
-		if (fsize->pixel_format != fmt->fourcc)
-			continue;
+	fmt = mtk_venc_find_format(fsize->pixel_format,
+				   fh_to_ctx(fh)->dev->venc_pdata);
+	if (!fmt)
+		return -EINVAL;
 
-		fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
-		fsize->stepwise = mtk_venc_framesizes;
-		return 0;
-	}
+	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
+	fsize->stepwise = mtk_venc_framesizes;
 
-	return -EINVAL;
+	return 0;
 }
 
 static int vidioc_enum_fmt_vid_cap(struct file *file, void *priv,
@@ -222,27 +239,6 @@ static struct mtk_q_data *mtk_venc_get_q_data(struct mtk_vcodec_ctx *ctx,
 	return &ctx->q_data[MTK_Q_DATA_DST];
 }
 
-static const struct mtk_video_fmt *mtk_venc_find_format(struct v4l2_format *f,
-	const struct mtk_vcodec_enc_pdata *pdata)
-{
-	const struct mtk_video_fmt *fmt;
-	unsigned int k;
-
-	for (k = 0; k < pdata->num_capture_formats; k++) {
-		fmt = &pdata->capture_formats[k];
-		if (fmt->fourcc == f->fmt.pix.pixelformat)
-			return fmt;
-	}
-
-	for (k = 0; k < pdata->num_output_formats; k++) {
-		fmt = &pdata->output_formats[k];
-		if (fmt->fourcc == f->fmt.pix.pixelformat)
-			return fmt;
-	}
-
-	return NULL;
-}
-
 /* V4L2 specification suggests the driver corrects the format struct if any of
  * the dimensions is unsupported
  */
@@ -403,7 +399,7 @@ static int vidioc_venc_s_fmt_cap(struct file *file, void *priv,
 		return -EINVAL;
 	}
 
-	fmt = mtk_venc_find_format(f, pdata);
+	fmt = mtk_venc_find_format(f->fmt.pix.pixelformat, pdata);
 	if (!fmt) {
 		fmt = &ctx->dev->venc_pdata->capture_formats[0];
 		f->fmt.pix.pixelformat = fmt->fourcc;
@@ -467,7 +463,7 @@ static int vidioc_venc_s_fmt_out(struct file *file, void *priv,
 		return -EINVAL;
 	}
 
-	fmt = mtk_venc_find_format(f, pdata);
+	fmt = mtk_venc_find_format(f->fmt.pix.pixelformat, pdata);
 	if (!fmt) {
 		fmt = &ctx->dev->venc_pdata->output_formats[0];
 		f->fmt.pix.pixelformat = fmt->fourcc;
@@ -550,7 +546,7 @@ static int vidioc_try_fmt_vid_cap_mplane(struct file *file, void *priv,
 	struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
 	const struct mtk_vcodec_enc_pdata *pdata = ctx->dev->venc_pdata;
 
-	fmt = mtk_venc_find_format(f, pdata);
+	fmt = mtk_venc_find_format(f->fmt.pix.pixelformat, pdata);
 	if (!fmt) {
 		fmt = &ctx->dev->venc_pdata->capture_formats[0];
 		f->fmt.pix.pixelformat = fmt->fourcc;
@@ -570,7 +566,7 @@ static int vidioc_try_fmt_vid_out_mplane(struct file *file, void *priv,
 	struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
 	const struct mtk_vcodec_enc_pdata *pdata = ctx->dev->venc_pdata;
 
-	fmt = mtk_venc_find_format(f, pdata);
+	fmt = mtk_venc_find_format(f->fmt.pix.pixelformat, pdata);
 	if (!fmt) {
 		fmt = &ctx->dev->venc_pdata->output_formats[0];
 		f->fmt.pix.pixelformat = fmt->fourcc;
-- 
2.27.0.212.ge8ba1cc988-goog

