Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F33FB20A32A
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2020 18:39:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406399AbgFYQjU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jun 2020 12:39:20 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:38426 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404014AbgFYQjS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jun 2020 12:39:18 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id B19C12A0B8A
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     kernel@collabora.com, Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 3/6] hantro: Rework how encoder and decoder are identified
Date:   Thu, 25 Jun 2020 13:35:22 -0300
Message-Id: <20200625163525.5119-4-ezequiel@collabora.com>
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200625163525.5119-1-ezequiel@collabora.com>
References: <20200625163525.5119-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

So far we've been using the .buf_finish hook to distinguish
decoder from encoder. This is unnecessarily obfuscated.

Moreover, we want to move the buf_finish, so use a cleaner
scheme to distinguish the driver decoder/encoder type.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/staging/media/hantro/hantro.h     | 2 ++
 drivers/staging/media/hantro/hantro_drv.c | 4 +++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
index 3005207fc6fb..028b788ad50f 100644
--- a/drivers/staging/media/hantro/hantro.h
+++ b/drivers/staging/media/hantro/hantro.h
@@ -199,6 +199,7 @@ struct hantro_dev {
  *
  * @dev:		VPU driver data to which the context belongs.
  * @fh:			V4L2 file handler.
+ * @is_encoder:		Decoder or encoder context?
  *
  * @sequence_cap:       Sequence counter for capture queue
  * @sequence_out:       Sequence counter for output queue
@@ -223,6 +224,7 @@ struct hantro_dev {
 struct hantro_ctx {
 	struct hantro_dev *dev;
 	struct v4l2_fh fh;
+	bool is_encoder;
 
 	u32 sequence_cap;
 	u32 sequence_out;
diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index 0db8ad455160..112ed556eb90 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -197,7 +197,7 @@ static void device_run(void *priv)
 
 bool hantro_is_encoder_ctx(const struct hantro_ctx *ctx)
 {
-	return ctx->buf_finish == hantro_enc_buf_finish;
+	return ctx->is_encoder;
 }
 
 static struct v4l2_m2m_ops vpu_m2m_ops = {
@@ -420,8 +420,10 @@ static int hantro_open(struct file *filp)
 	if (func->id == MEDIA_ENT_F_PROC_VIDEO_ENCODER) {
 		allowed_codecs = vpu->variant->codec & HANTRO_ENCODERS;
 		ctx->buf_finish = hantro_enc_buf_finish;
+		ctx->is_encoder = true;
 	} else if (func->id == MEDIA_ENT_F_PROC_VIDEO_DECODER) {
 		allowed_codecs = vpu->variant->codec & HANTRO_DECODERS;
+		ctx->is_encoder = false;
 	} else {
 		ret = -ENODEV;
 		goto err_ctx_free;
-- 
2.26.0.rc2

