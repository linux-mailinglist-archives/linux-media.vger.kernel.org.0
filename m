Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37C043658A5
	for <lists+linux-media@lfdr.de>; Tue, 20 Apr 2021 14:12:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232279AbhDTMLo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 08:11:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232172AbhDTMLm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 08:11:42 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4837C06174A;
        Tue, 20 Apr 2021 05:11:10 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: benjamin.gaignard)
        with ESMTPSA id A45621F428E8
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     ezequiel@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org,
        robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        festevam@gmail.com, lee.jones@linaro.org,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, hverkuil-cisco@xs4all.nl,
        emil.l.velikov@gmail.com
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        kernel@collabora.com, cphealy@gmail.com,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v10 5/9] media: hantro: Only use postproc when post processed formats are defined
Date:   Tue, 20 Apr 2021 14:10:42 +0200
Message-Id: <20210420121046.181889-6-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210420121046.181889-1-benjamin.gaignard@collabora.com>
References: <20210420121046.181889-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If the variant doesn't support postprocessed formats make sure it will
be ok.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/staging/media/hantro/hantro.h          |  8 ++------
 drivers/staging/media/hantro/hantro_postproc.c | 14 ++++++++++++++
 drivers/staging/media/hantro/hantro_v4l2.c     |  4 +++-
 3 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
index 4368c0962768..e50d39b51902 100644
--- a/drivers/staging/media/hantro/hantro.h
+++ b/drivers/staging/media/hantro/hantro.h
@@ -413,12 +413,8 @@ hantro_get_dst_buf(struct hantro_ctx *ctx)
 	return v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
 }
 
-static inline bool
-hantro_needs_postproc(const struct hantro_ctx *ctx,
-		      const struct hantro_fmt *fmt)
-{
-	return !ctx->is_encoder && fmt->fourcc != V4L2_PIX_FMT_NV12;
-}
+bool hantro_needs_postproc(const struct hantro_ctx *ctx,
+			   const struct hantro_fmt *fmt);
 
 static inline dma_addr_t
 hantro_get_dec_buf_addr(struct hantro_ctx *ctx, struct vb2_buffer *vb)
diff --git a/drivers/staging/media/hantro/hantro_postproc.c b/drivers/staging/media/hantro/hantro_postproc.c
index 6d2a8f2a8f0b..ed8916c950a4 100644
--- a/drivers/staging/media/hantro/hantro_postproc.c
+++ b/drivers/staging/media/hantro/hantro_postproc.c
@@ -50,6 +50,20 @@ const struct hantro_postproc_regs hantro_g1_postproc_regs = {
 	.display_width = {G1_REG_PP_DISPLAY_WIDTH, 0, 0xfff},
 };
 
+bool hantro_needs_postproc(const struct hantro_ctx *ctx,
+			   const struct hantro_fmt *fmt)
+{
+	struct hantro_dev *vpu = ctx->dev;
+
+	if (ctx->is_encoder)
+		return false;
+
+	if (!vpu->variant->postproc_fmts)
+		return false;
+
+	return fmt->fourcc != V4L2_PIX_FMT_NV12;
+}
+
 void hantro_postproc_enable(struct hantro_ctx *ctx)
 {
 	struct hantro_dev *vpu = ctx->dev;
diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/staging/media/hantro/hantro_v4l2.c
index 1bc118e375a1..77d7fe62ce81 100644
--- a/drivers/staging/media/hantro/hantro_v4l2.c
+++ b/drivers/staging/media/hantro/hantro_v4l2.c
@@ -55,7 +55,9 @@ static const struct hantro_fmt *
 hantro_get_postproc_formats(const struct hantro_ctx *ctx,
 			    unsigned int *num_fmts)
 {
-	if (ctx->is_encoder) {
+	struct hantro_dev *vpu = ctx->dev;
+
+	if (ctx->is_encoder || !vpu->variant->postproc_fmts) {
 		*num_fmts = 0;
 		return NULL;
 	}
-- 
2.25.1

