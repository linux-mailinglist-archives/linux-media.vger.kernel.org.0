Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2108C181FF5
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2020 18:48:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730710AbgCKRr0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Mar 2020 13:47:26 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:33096 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730645AbgCKRr0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Mar 2020 13:47:26 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 80D4C2912DA
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Heiko Stuebner <heiko@sntech.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 4/6] hantro: Remove unneeded hantro_dec_buf_finish
Date:   Wed, 11 Mar 2020 14:42:58 -0300
Message-Id: <20200311174300.19407-5-ezequiel@collabora.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200311174300.19407-1-ezequiel@collabora.com>
References: <20200311174300.19407-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since now .buf_prepare takes care of setting the
buffer payload size, we can get rid of this,
at least for decoders.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/staging/media/hantro/hantro_drv.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index ec889d755cd6..bd204da6c669 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -80,15 +80,6 @@ hantro_enc_buf_finish(struct hantro_ctx *ctx, struct vb2_buffer *buf,
 	return 0;
 }
 
-static int
-hantro_dec_buf_finish(struct hantro_ctx *ctx, struct vb2_buffer *buf,
-		      unsigned int bytesused)
-{
-	/* For decoders set bytesused as per the output picture. */
-	buf->planes[0].bytesused = ctx->dst_fmt.plane_fmt[0].sizeimage;
-	return 0;
-}
-
 static void hantro_job_finish(struct hantro_dev *vpu,
 			      struct hantro_ctx *ctx,
 			      unsigned int bytesused,
@@ -422,7 +413,6 @@ static int hantro_open(struct file *filp)
 		ctx->buf_finish = hantro_enc_buf_finish;
 	} else if (func->id == MEDIA_ENT_F_PROC_VIDEO_DECODER) {
 		allowed_codecs = vpu->variant->codec & HANTRO_DECODERS;
-		ctx->buf_finish = hantro_dec_buf_finish;
 	} else {
 		ret = -ENODEV;
 		goto err_ctx_free;
-- 
2.25.0

