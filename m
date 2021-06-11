Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82B813A4B56
	for <lists+linux-media@lfdr.de>; Sat, 12 Jun 2021 01:43:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230446AbhFKXp0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Jun 2021 19:45:26 -0400
Received: from mail-lj1-f180.google.com ([209.85.208.180]:33785 "EHLO
        mail-lj1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230349AbhFKXpY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Jun 2021 19:45:24 -0400
Received: by mail-lj1-f180.google.com with SMTP id r16so11825921ljc.0;
        Fri, 11 Jun 2021 16:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aRw7BPNktlSQ8Bpwkfd9XqquSjVtSyBra5TkrCf39nw=;
        b=SkSPQn1YLgf4eB2184cpjDPdofARNgCS+pxpukZiniDyhQ+CcJKIuPW4uzFOqaSXJv
         J+BmnsELecpkMSn6+1zDTxFIVg41BNTtm7SWehd7ua/9PPp76/FBwIHeQSQJScr/1oga
         JOvUPHKaygDlDhzaue76p5+osbFTwyRUV6eBewnkXL5pCR3Uuq1dVlxdHJ8FhfH6kcn2
         JQ/mSXN9I7k/NT0Xsh7/DTLiusg0wj7SHIF0EFUrDQiq3q5LQS4dQ78G1EdzrAAz1S89
         ychDj4dkNiXXzaXfEZbhabb1NcX94aZfvu2CXcx2jcfxupXtMxd1s7RaXQJ6519eNiHh
         Y0qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aRw7BPNktlSQ8Bpwkfd9XqquSjVtSyBra5TkrCf39nw=;
        b=ov9BtS/M0St9XrO7ipm0nwR/NqJLnYbnaLJJI3nDDdsRiqm04Cq+bTtMD7blOF9XI1
         ZCdCJMgW8zpE2mcocGk8blyT6uv67VtLwarEkFoeD8g7FbONQD7f69q8FNGhBEUHGiTL
         EHr5uTfesmnj7nbbl5AVpx8gToRgftbyVkHBBY1EpfgXRg0Mt2Po+39oopPro6AK3HnP
         +XPljKxlYeqDqc2TNIT2X2M8cLMIA7YCMNiGCW62M5xjOOpv8JuQXYtL0SsU1hAIv5H8
         Hkq/3PL6KM2aOdq6L97SWXYsAbUL8NMsMnph/c8+4EsRsTeVNhlGmxiiFTlJFGyMfPZR
         YQog==
X-Gm-Message-State: AOAM532GCyvjk4Iy8JiCRDCIhRuKDlx3tlrmhwFnD/DftWzIqaD5sut5
        +v16ZNOA389OcFU/NaL2bfY=
X-Google-Smtp-Source: ABdhPJzdZQgVxu8KHs5S94L9UZiEP/Hh55YTVP6uT5f2rUjXtodE9hgli7NLwIHJymqAJzMFLEgJjQ==
X-Received: by 2002:a2e:a4c2:: with SMTP id p2mr4821128ljm.365.1623454928898;
        Fri, 11 Jun 2021 16:42:08 -0700 (PDT)
Received: from localhost.localdomain (h-98-128-228-193.NA.cust.bahnhof.se. [98.128.228.193])
        by smtp.gmail.com with ESMTPSA id b23sm972246ljk.18.2021.06.11.16.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 16:42:08 -0700 (PDT)
From:   Rikard Falkeborn <rikard.falkeborn@gmail.com>
To:     Mirela Rabulea <mirela.rabulea@nxp.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>
Cc:     NXP Linux Team <linux-imx@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH 2/2] media: imx-jpeg: Constify static struct mxc_jpeg_fmt
Date:   Sat, 12 Jun 2021 01:42:01 +0200
Message-Id: <20210611234201.64832-3-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210611234201.64832-1-rikard.falkeborn@gmail.com>
References: <20210611234201.64832-1-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It is only read-from, so make it const. In order to be able to do this,
constify all places where mxc_jpeg_fmt is used, in function arguments,
return values and pointers. On top of that, make the name a pointer to
const char.

On aarch64, this shrinks object code size with 550 bytes with gcc 11.1.0,
and almost 2kB with clang 12.0.0.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/media/platform/imx-jpeg/mxc-jpeg.c | 16 ++++++++--------
 drivers/media/platform/imx-jpeg/mxc-jpeg.h | 18 +++++++++---------
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/imx-jpeg/mxc-jpeg.c
index 3a49007e1264..755138063ee6 100644
--- a/drivers/media/platform/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/imx-jpeg/mxc-jpeg.c
@@ -62,7 +62,7 @@
 #include "mxc-jpeg-hw.h"
 #include "mxc-jpeg.h"
 
-static struct mxc_jpeg_fmt mxc_formats[] = {
+static const struct mxc_jpeg_fmt mxc_formats[] = {
 	{
 		.name		= "JPEG",
 		.fourcc		= V4L2_PIX_FMT_JPEG,
@@ -341,7 +341,7 @@ static inline struct mxc_jpeg_ctx *mxc_jpeg_fh_to_ctx(struct v4l2_fh *fh)
 	return container_of(fh, struct mxc_jpeg_ctx, fh);
 }
 
-static int enum_fmt(struct mxc_jpeg_fmt *mxc_formats, int n,
+static int enum_fmt(const struct mxc_jpeg_fmt *mxc_formats, int n,
 		    struct v4l2_fmtdesc *f, u32 type)
 {
 	int i, num = 0;
@@ -368,13 +368,13 @@ static int enum_fmt(struct mxc_jpeg_fmt *mxc_formats, int n,
 	return 0;
 }
 
-static struct mxc_jpeg_fmt *mxc_jpeg_find_format(struct mxc_jpeg_ctx *ctx,
-						 u32 pixelformat)
+static const struct mxc_jpeg_fmt *mxc_jpeg_find_format(struct mxc_jpeg_ctx *ctx,
+						       u32 pixelformat)
 {
 	unsigned int k;
 
 	for (k = 0; k < MXC_JPEG_NUM_FORMATS; k++) {
-		struct mxc_jpeg_fmt *fmt = &mxc_formats[k];
+		const struct mxc_jpeg_fmt *fmt = &mxc_formats[k];
 
 		if (fmt->fourcc == pixelformat)
 			return fmt;
@@ -1536,7 +1536,7 @@ static int mxc_jpeg_enum_fmt_vid_out(struct file *file, void *priv,
 				MXC_JPEG_FMT_TYPE_RAW);
 }
 
-static int mxc_jpeg_try_fmt(struct v4l2_format *f, struct mxc_jpeg_fmt *fmt,
+static int mxc_jpeg_try_fmt(struct v4l2_format *f, const struct mxc_jpeg_fmt *fmt,
 			    struct mxc_jpeg_ctx *ctx, int q_type)
 {
 	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
@@ -1612,7 +1612,7 @@ static int mxc_jpeg_try_fmt_vid_cap(struct file *file, void *priv,
 	struct mxc_jpeg_ctx *ctx = mxc_jpeg_fh_to_ctx(priv);
 	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
 	struct device *dev = jpeg->dev;
-	struct mxc_jpeg_fmt *fmt;
+	const struct mxc_jpeg_fmt *fmt;
 	u32 fourcc = f->fmt.pix_mp.pixelformat;
 
 	int q_type = (jpeg->mode == MXC_JPEG_DECODE) ?
@@ -1643,7 +1643,7 @@ static int mxc_jpeg_try_fmt_vid_out(struct file *file, void *priv,
 	struct mxc_jpeg_ctx *ctx = mxc_jpeg_fh_to_ctx(priv);
 	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
 	struct device *dev = jpeg->dev;
-	struct mxc_jpeg_fmt *fmt;
+	const struct mxc_jpeg_fmt *fmt;
 	u32 fourcc = f->fmt.pix_mp.pixelformat;
 
 	int q_type = (jpeg->mode == MXC_JPEG_ENCODE) ?
diff --git a/drivers/media/platform/imx-jpeg/mxc-jpeg.h b/drivers/media/platform/imx-jpeg/mxc-jpeg.h
index 7697de490d2e..4c210852e876 100644
--- a/drivers/media/platform/imx-jpeg/mxc-jpeg.h
+++ b/drivers/media/platform/imx-jpeg/mxc-jpeg.h
@@ -51,7 +51,7 @@ enum mxc_jpeg_mode {
  * @flags:	flags describing format applicability
  */
 struct mxc_jpeg_fmt {
-	char					*name;
+	const char				*name;
 	u32					fourcc;
 	enum v4l2_jpeg_chroma_subsampling	subsampling;
 	int					nc;
@@ -74,14 +74,14 @@ struct mxc_jpeg_desc {
 } __packed;
 
 struct mxc_jpeg_q_data {
-	struct mxc_jpeg_fmt	*fmt;
-	u32			sizeimage[MXC_JPEG_MAX_PLANES];
-	u32			bytesperline[MXC_JPEG_MAX_PLANES];
-	int			w;
-	int			w_adjusted;
-	int			h;
-	int			h_adjusted;
-	unsigned int		sequence;
+	const struct mxc_jpeg_fmt	*fmt;
+	u32				sizeimage[MXC_JPEG_MAX_PLANES];
+	u32				bytesperline[MXC_JPEG_MAX_PLANES];
+	int				w;
+	int				w_adjusted;
+	int				h;
+	int				h_adjusted;
+	unsigned int			sequence;
 };
 
 struct mxc_jpeg_ctx {
-- 
2.32.0

