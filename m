Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89242AB775
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2019 13:55:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403887AbfIFLzj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Sep 2019 07:55:39 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:38562 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391385AbfIFLzi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Sep 2019 07:55:38 -0400
Received: by mail-pl1-f196.google.com with SMTP id w11so3053481plp.5
        for <linux-media@vger.kernel.org>; Fri, 06 Sep 2019 04:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rmvBNkTdsDRsEM61NjMf/X0IeoL67srtswcL/KipeCU=;
        b=lD7C87VcCfCC73o5yfmt2mC/BIZKrEeMM/aT6dR4o+mCr1k4uiXbUBCGjdmwVCK7f+
         xuR8XlsTWg3PNQMzw6MlyoZnkB09W7iSSH2oWnJ8xLBnFXifM9yzmQCi0zibzW0c1/Ge
         RlScRApeYLC5DHYB1nXWL5UsmHcTspdONkYsI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rmvBNkTdsDRsEM61NjMf/X0IeoL67srtswcL/KipeCU=;
        b=YagIkx+dXt613x5QZWKvHU0bxTTrQJzFAZslc0TiLy4BIUO36sNcRNnbbpXNgyoyoA
         cpTRmbWmnTrGqyIsKHLj6pUM9rgkI+VBXdz6moMPohoniBDlOnpb36YbpsxRcmKYcI/q
         MsHkjBRxpxcxGnpy78xYgkynpvGRNSNGfn6u10Pc0Q/mFITiMNdao+2FPT4lK2Nd2Lhc
         wrsNrltVgNxSpBycpnANiXKWuMrfVoZCmTXcOcHJXnHQlaDkAxrKgJ+m5CUpxBiuAYpc
         2Xf+qycMZ/7SkAOamlPLm4IrAdwWTWa3LuGTx9zhpXM/TO7egHoHQRCKhOdDfYqngR2d
         sq+g==
X-Gm-Message-State: APjAAAXU3QtVnWQXK8AzOQM8XJwA/rgMqngJpgT8VhTOqhA4BJMGrn4v
        tqVbS65TxYopl64xKwnPpMlpvw==
X-Google-Smtp-Source: APXvYqyUCSBsPgZieu0kGLJ172xmNCEYZ4dQ2c7hwk8o5f0gKm/e7v15Sxpv0rgcqXV8P/Q5bi7y3A==
X-Received: by 2002:a17:902:8690:: with SMTP id g16mr9003555plo.282.1567770937975;
        Fri, 06 Sep 2019 04:55:37 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:4:4:9712:8cf1:d0f:7d33])
        by smtp.gmail.com with ESMTPSA id o22sm3667394pjq.21.2019.09.06.04.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2019 04:55:37 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [RFC PATCH v2 03/13] media: mtk-vcodec: vdec: clean up vidioc_vdec_s_fmt a bit
Date:   Fri,  6 Sep 2019 20:55:03 +0900
Message-Id: <20190906115513.159705-4-acourbot@chromium.org>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
In-Reply-To: <20190906115513.159705-1-acourbot@chromium.org>
References: <20190906115513.159705-1-acourbot@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Check for a potentially NULL pointer that was overlooked and use shorter
accessors to the same data. While we are at it, sprinkle a few comments.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 .../media/platform/mtk-vcodec/mtk_vcodec_dec.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
index 653f111532ab..858727824889 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
@@ -841,12 +841,20 @@ static int vidioc_vdec_s_fmt(struct file *file, void *priv,
 		return -EINVAL;
 
 	pix_mp = &f->fmt.pix_mp;
+	/*
+	 * Setting OUTPUT format after OUTPUT buffers are allocated is invalid
+	 * if using the stateful API.
+	 */
 	if ((f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) &&
 	    vb2_is_busy(&ctx->m2m_ctx->out_q_ctx.q)) {
 		mtk_v4l2_err("out_q_ctx buffers already requested");
 		ret = -EBUSY;
 	}
 
+	/*
+	 * Setting CAPTURE format after CAPTURE buffers are allocated is
+	 * invalid.
+	 */
 	if ((f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) &&
 	    vb2_is_busy(&ctx->m2m_ctx->cap_q_ctx.q)) {
 		mtk_v4l2_err("cap_q_ctx buffers already requested");
@@ -865,6 +873,8 @@ static int vidioc_vdec_s_fmt(struct file *file, void *priv,
 			fmt = mtk_vdec_find_format(f);
 		}
 	}
+	if (fmt == NULL)
+		return -EINVAL;
 
 	q_data->fmt = fmt;
 	vidioc_try_fmt(f, q_data->fmt);
@@ -873,10 +883,10 @@ static int vidioc_vdec_s_fmt(struct file *file, void *priv,
 		q_data->coded_width = pix_mp->width;
 		q_data->coded_height = pix_mp->height;
 
-		ctx->colorspace = f->fmt.pix_mp.colorspace;
-		ctx->ycbcr_enc = f->fmt.pix_mp.ycbcr_enc;
-		ctx->quantization = f->fmt.pix_mp.quantization;
-		ctx->xfer_func = f->fmt.pix_mp.xfer_func;
+		ctx->colorspace = pix_mp->colorspace;
+		ctx->ycbcr_enc = pix_mp->ycbcr_enc;
+		ctx->quantization = pix_mp->quantization;
+		ctx->xfer_func = pix_mp->xfer_func;
 
 		if (ctx->state == MTK_STATE_FREE) {
 			ret = vdec_if_init(ctx, q_data->fmt->fourcc);
-- 
2.23.0.187.g17f5b7556c-goog

