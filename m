Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C732645345E
	for <lists+linux-media@lfdr.de>; Tue, 16 Nov 2021 15:39:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237501AbhKPOly (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Nov 2021 09:41:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237433AbhKPOlt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Nov 2021 09:41:49 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43AA8C061746;
        Tue, 16 Nov 2021 06:38:52 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id 654951F457E2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
        t=1637073531; bh=LUdVtuHxt//jnw8IlKLffG0c7S4S8OodFPmOEkPDWmw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NLqt3CuJuPqzDVDr3EMbcxknqHGGIIs3xGK7YMTu9x0VD5WQrtXiXEfS1kGpEit+f
         j63oVD4c9DalEkLlthQ6yaI6NtweQAXs1jJPlW/YSS+vgr+5Mss7EMzOd3J2PP7aeD
         B+Mtiet2dshRM2JGF6OZIMOJBUE/44YOY9riUQ4xR/6/j3rlW1PB6CIG2wy1OJrrw0
         EPxro9CqGuCBTAdZj/ktbK1Wjow02yzp6NNDYvnjTLX26+VQ/C7m0nuDHUfS8+Vr9B
         0jMmuATO2VddCXgFuDnrIfX5aX98bngQ6yjQiXxYkaM2WcApftaLqsHOSNKVQVNtnL
         g4X1UlrIhvTkw==
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To:     linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-staging@lists.linux.dev
Cc:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Fabio Estevam <festevam@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Heiko Stuebner <heiko@sntech.de>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>, kernel@collabora.com,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v8 03/12] hantro: Simplify postprocessor
Date:   Tue, 16 Nov 2021 15:38:33 +0100
Message-Id: <20211116143842.75896-4-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211116143842.75896-1-andrzej.p@collabora.com>
References: <20211116143842.75896-1-andrzej.p@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Ezequiel Garcia <ezequiel@collabora.com>

Add a 'postprocessed' boolean property to struct hantro_fmt
to signal that a format is produced by the post-processor.
This will allow to introduce the G2 post-processor in a simple way.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 drivers/staging/media/hantro/hantro.h          | 2 ++
 drivers/staging/media/hantro/hantro_postproc.c | 8 +-------
 drivers/staging/media/hantro/imx8m_vpu_hw.c    | 1 +
 drivers/staging/media/hantro/rockchip_vpu_hw.c | 1 +
 drivers/staging/media/hantro/sama5d4_vdec_hw.c | 1 +
 5 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
index c2e01959dc00..dd5e56765d4e 100644
--- a/drivers/staging/media/hantro/hantro.h
+++ b/drivers/staging/media/hantro/hantro.h
@@ -263,6 +263,7 @@ struct hantro_ctx {
  * @max_depth:	Maximum depth, for bitstream formats
  * @enc_fmt:	Format identifier for encoder registers.
  * @frmsize:	Supported range of frame sizes (only for bitstream formats).
+ * @postprocessed: Indicates if this format needs the post-processor.
  */
 struct hantro_fmt {
 	char *name;
@@ -272,6 +273,7 @@ struct hantro_fmt {
 	int max_depth;
 	enum hantro_enc_fmt enc_fmt;
 	struct v4l2_frmsize_stepwise frmsize;
+	bool postprocessed;
 };
 
 struct hantro_reg {
diff --git a/drivers/staging/media/hantro/hantro_postproc.c b/drivers/staging/media/hantro/hantro_postproc.c
index 882fb8bc5ddd..4549aec08feb 100644
--- a/drivers/staging/media/hantro/hantro_postproc.c
+++ b/drivers/staging/media/hantro/hantro_postproc.c
@@ -53,15 +53,9 @@ const struct hantro_postproc_regs hantro_g1_postproc_regs = {
 bool hantro_needs_postproc(const struct hantro_ctx *ctx,
 			   const struct hantro_fmt *fmt)
 {
-	struct hantro_dev *vpu = ctx->dev;
-
 	if (ctx->is_encoder)
 		return false;
-
-	if (!vpu->variant->postproc_fmts)
-		return false;
-
-	return fmt->fourcc != V4L2_PIX_FMT_NV12;
+	return fmt->postprocessed;
 }
 
 static void hantro_postproc_g1_enable(struct hantro_ctx *ctx)
diff --git a/drivers/staging/media/hantro/imx8m_vpu_hw.c b/drivers/staging/media/hantro/imx8m_vpu_hw.c
index 22fa7d2f3b64..02e61438220a 100644
--- a/drivers/staging/media/hantro/imx8m_vpu_hw.c
+++ b/drivers/staging/media/hantro/imx8m_vpu_hw.c
@@ -82,6 +82,7 @@ static const struct hantro_fmt imx8m_vpu_postproc_fmts[] = {
 	{
 		.fourcc = V4L2_PIX_FMT_YUYV,
 		.codec_mode = HANTRO_MODE_NONE,
+		.postprocessed = true,
 	},
 };
 
diff --git a/drivers/staging/media/hantro/rockchip_vpu_hw.c b/drivers/staging/media/hantro/rockchip_vpu_hw.c
index 6c1ad5534ce5..f372f767d4ff 100644
--- a/drivers/staging/media/hantro/rockchip_vpu_hw.c
+++ b/drivers/staging/media/hantro/rockchip_vpu_hw.c
@@ -62,6 +62,7 @@ static const struct hantro_fmt rockchip_vpu1_postproc_fmts[] = {
 	{
 		.fourcc = V4L2_PIX_FMT_YUYV,
 		.codec_mode = HANTRO_MODE_NONE,
+		.postprocessed = true,
 	},
 };
 
diff --git a/drivers/staging/media/hantro/sama5d4_vdec_hw.c b/drivers/staging/media/hantro/sama5d4_vdec_hw.c
index f3fecc7248c4..b2fc1c5613e1 100644
--- a/drivers/staging/media/hantro/sama5d4_vdec_hw.c
+++ b/drivers/staging/media/hantro/sama5d4_vdec_hw.c
@@ -15,6 +15,7 @@ static const struct hantro_fmt sama5d4_vdec_postproc_fmts[] = {
 	{
 		.fourcc = V4L2_PIX_FMT_YUYV,
 		.codec_mode = HANTRO_MODE_NONE,
+		.postprocessed = true,
 	},
 };
 
-- 
2.25.1

