Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DF4E4A75D
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2019 18:46:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730068AbfFRQpz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jun 2019 12:45:55 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:36039 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730002AbfFRQpp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jun 2019 12:45:45 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1hdHEt-0003WX-Ux; Tue, 18 Jun 2019 18:45:43 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@pengutronix.de
Subject: [PATCH 16/28] media: coda: allow flagging last output buffer internally
Date:   Tue, 18 Jun 2019 18:45:23 +0200
Message-Id: <20190618164535.20162-17-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190618164535.20162-1-p.zabel@pengutronix.de>
References: <20190618164535.20162-1-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since V4L2_BUF_FLAG_LAST is a CAPTURE only flag, clear it from OUTPUT
buffers in QBUF and DQBUF. This allows to use the flag internally to
signal the last buffer to decode after a decoder stop command was
issued.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/media/platform/coda/coda-common.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/platform/coda/coda-common.c
index ddd819ea13f2..29d050fbb899 100644
--- a/drivers/media/platform/coda/coda-common.c
+++ b/drivers/media/platform/coda/coda-common.c
@@ -879,9 +879,27 @@ static int coda_qbuf(struct file *file, void *priv,
 {
 	struct coda_ctx *ctx = fh_to_ctx(priv);
 
+	if (ctx->inst_type == CODA_INST_DECODER &&
+	    buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT)
+		buf->flags &= ~V4L2_BUF_FLAG_LAST;
+
 	return v4l2_m2m_qbuf(file, ctx->fh.m2m_ctx, buf);
 }
 
+static int coda_dqbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
+{
+	struct coda_ctx *ctx = fh_to_ctx(priv);
+	int ret;
+
+	ret = v4l2_m2m_dqbuf(file, ctx->fh.m2m_ctx, buf);
+
+	if (ctx->inst_type == CODA_INST_DECODER &&
+	    buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT)
+		buf->flags &= ~V4L2_BUF_FLAG_LAST;
+
+	return ret;
+}
+
 static bool coda_buf_is_end_of_stream(struct coda_ctx *ctx,
 				      struct vb2_v4l2_buffer *buf)
 {
@@ -1295,7 +1313,7 @@ static const struct v4l2_ioctl_ops coda_ioctl_ops = {
 
 	.vidioc_qbuf		= coda_qbuf,
 	.vidioc_expbuf		= v4l2_m2m_ioctl_expbuf,
-	.vidioc_dqbuf		= v4l2_m2m_ioctl_dqbuf,
+	.vidioc_dqbuf		= coda_dqbuf,
 	.vidioc_create_bufs	= v4l2_m2m_ioctl_create_bufs,
 	.vidioc_prepare_buf	= v4l2_m2m_ioctl_prepare_buf,
 
-- 
2.20.1

