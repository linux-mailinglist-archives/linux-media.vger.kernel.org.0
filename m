Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C6E04F5E54
	for <lists+linux-media@lfdr.de>; Wed,  6 Apr 2022 14:46:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230027AbiDFMsS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Apr 2022 08:48:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231772AbiDFMrd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Apr 2022 08:47:33 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2D934C38CE
        for <linux-media@vger.kernel.org>; Wed,  6 Apr 2022 01:51:49 -0700 (PDT)
Received: from dude03.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::39])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1nc1OG-0008Pe-6q; Wed, 06 Apr 2022 10:51:48 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>, kernel@pengutronix.de
Subject: [PATCH] media: coda: add JPEG downscale support
Date:   Wed,  6 Apr 2022 10:51:45 +0200
Message-Id: <20220406085145.2365446-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,PDS_OTHER_BAD_TLD,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The JPEG decoder in the CODA960 VPU can downscale images while decoding,
with a factor of 1/2, 1/4, or 1/8.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 .../media/platform/chips-media/coda-common.c  | 30 ++++++++++++++-----
 .../media/platform/chips-media/coda-jpeg.c    | 10 ++++++-
 drivers/media/platform/chips-media/coda.h     |  7 +++++
 3 files changed, 39 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/chips-media/coda-common.c b/drivers/media/platform/chips-media/coda-common.c
index a57822b05070..37360cb6ddb0 100644
--- a/drivers/media/platform/chips-media/coda-common.c
+++ b/drivers/media/platform/chips-media/coda-common.c
@@ -657,6 +657,8 @@ static int coda_try_fmt_vid_cap(struct file *file, void *priv,
 	const struct coda_q_data *q_data_src;
 	const struct coda_codec *codec;
 	struct vb2_queue *src_vq;
+	int hscale = 0;
+	int vscale = 0;
 	int ret;
 	bool use_vdoa;
 
@@ -673,8 +675,13 @@ static int coda_try_fmt_vid_cap(struct file *file, void *priv,
 	 */
 	src_vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT);
 	if (vb2_is_streaming(src_vq)) {
-		f->fmt.pix.width = q_data_src->width;
-		f->fmt.pix.height = q_data_src->height;
+		if (q_data_src->fourcc == V4L2_PIX_FMT_JPEG &&
+		    ctx->dev->devtype->product == CODA_960) {
+			hscale = coda_jpeg_scale(q_data_src->width, f->fmt.pix.width);
+			vscale = coda_jpeg_scale(q_data_src->height, f->fmt.pix.height);
+		}
+		f->fmt.pix.width = q_data_src->width >> hscale;
+		f->fmt.pix.height = q_data_src->height >> vscale;
 
 		if (q_data_src->fourcc == V4L2_PIX_FMT_JPEG) {
 			if (ctx->params.jpeg_chroma_subsampling ==
@@ -704,8 +711,8 @@ static int coda_try_fmt_vid_cap(struct file *file, void *priv,
 
 	/* The decoders always write complete macroblocks or MCUs */
 	if (ctx->inst_type == CODA_INST_DECODER) {
-		f->fmt.pix.bytesperline = round_up(f->fmt.pix.width, 16);
-		f->fmt.pix.height = round_up(f->fmt.pix.height, 16);
+		f->fmt.pix.bytesperline = round_up(f->fmt.pix.width, 16 >> hscale);
+		f->fmt.pix.height = round_up(f->fmt.pix.height, 16 >> vscale);
 		if (codec->src_fourcc == V4L2_PIX_FMT_JPEG &&
 		    f->fmt.pix.pixelformat == V4L2_PIX_FMT_YUV422P) {
 			f->fmt.pix.sizeimage = f->fmt.pix.bytesperline *
@@ -850,17 +857,26 @@ static int coda_s_fmt_vid_cap(struct file *file, void *priv,
 	struct coda_q_data *q_data_src;
 	const struct coda_codec *codec;
 	struct v4l2_rect r;
+	int hscale = 0;
+	int vscale = 0;
 	int ret;
 
+	q_data_src = get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT);
+
+	if (q_data_src->fourcc == V4L2_PIX_FMT_JPEG &&
+	    ctx->dev->devtype->product == CODA_960) {
+		hscale = coda_jpeg_scale(q_data_src->width, f->fmt.pix.width);
+		vscale = coda_jpeg_scale(q_data_src->height, f->fmt.pix.height);
+	}
+
 	ret = coda_try_fmt_vid_cap(file, priv, f);
 	if (ret)
 		return ret;
 
-	q_data_src = get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT);
 	r.left = 0;
 	r.top = 0;
-	r.width = q_data_src->width;
-	r.height = q_data_src->height;
+	r.width = q_data_src->width >> hscale;
+	r.height = q_data_src->height >> vscale;
 
 	ret = coda_s_fmt(ctx, f, &r);
 	if (ret)
diff --git a/drivers/media/platform/chips-media/coda-jpeg.c b/drivers/media/platform/chips-media/coda-jpeg.c
index a72f4655e5ad..5948ada75d43 100644
--- a/drivers/media/platform/chips-media/coda-jpeg.c
+++ b/drivers/media/platform/chips-media/coda-jpeg.c
@@ -1328,6 +1328,7 @@ static int coda9_jpeg_prepare_decode(struct coda_ctx *ctx)
 	struct coda_q_data *q_data_src, *q_data_dst;
 	struct vb2_v4l2_buffer *src_buf, *dst_buf;
 	int chroma_interleave;
+	int scl_hor_mode, scl_ver_mode;
 
 	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
 	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
@@ -1335,6 +1336,9 @@ static int coda9_jpeg_prepare_decode(struct coda_ctx *ctx)
 	q_data_dst = get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
 	dst_fourcc = q_data_dst->fourcc;
 
+	scl_hor_mode = coda_jpeg_scale(q_data_src->width, q_data_dst->width);
+	scl_ver_mode = coda_jpeg_scale(q_data_src->height, q_data_dst->height);
+
 	if (vb2_get_plane_payload(&src_buf->vb2_buf, 0) == 0)
 		vb2_set_plane_payload(&src_buf->vb2_buf, 0,
 				      vb2_plane_size(&src_buf->vb2_buf, 0));
@@ -1386,7 +1390,11 @@ static int coda9_jpeg_prepare_decode(struct coda_ctx *ctx)
 	coda_write(dev, 0, CODA9_REG_JPEG_ROT_INFO);
 	coda_write(dev, bus_req_num[chroma_format], CODA9_REG_JPEG_OP_INFO);
 	coda_write(dev, mcu_info[chroma_format], CODA9_REG_JPEG_MCU_INFO);
-	coda_write(dev, 0, CODA9_REG_JPEG_SCL_INFO);
+	if (scl_hor_mode || scl_ver_mode)
+		val = CODA9_JPEG_SCL_ENABLE | (scl_hor_mode << 2) | scl_ver_mode;
+	else
+		val = 0;
+	coda_write(dev, val, CODA9_REG_JPEG_SCL_INFO);
 	coda_write(dev, chroma_interleave, CODA9_REG_JPEG_DPB_CONFIG);
 	coda_write(dev, ctx->params.jpeg_restart_interval,
 			CODA9_REG_JPEG_RST_INTVAL);
diff --git a/drivers/media/platform/chips-media/coda.h b/drivers/media/platform/chips-media/coda.h
index dcf35641c603..ddfd0a32c653 100644
--- a/drivers/media/platform/chips-media/coda.h
+++ b/drivers/media/platform/chips-media/coda.h
@@ -380,6 +380,13 @@ u32 coda_mpeg4_parse_headers(struct coda_ctx *ctx, u8 *buf, u32 size);
 void coda_update_profile_level_ctrls(struct coda_ctx *ctx, u8 profile_idc,
 				     u8 level_idc);
 
+static inline int coda_jpeg_scale(int src, int dst)
+{
+	return (dst <= src / 8) ? 3 :
+	       (dst <= src / 4) ? 2 :
+	       (dst <= src / 2) ? 1 : 0;
+}
+
 bool coda_jpeg_check_buffer(struct coda_ctx *ctx, struct vb2_buffer *vb);
 int coda_jpeg_decode_header(struct coda_ctx *ctx, struct vb2_buffer *vb);
 int coda_jpeg_write_tables(struct coda_ctx *ctx);
-- 
2.30.2

