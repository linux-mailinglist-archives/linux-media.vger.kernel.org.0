Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 147B685FDA
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2019 12:35:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390017AbfHHKf0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Aug 2019 06:35:26 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:36778 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389923AbfHHKfZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Aug 2019 06:35:25 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 06D7B28C96B
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        fbuergisser@chromium.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 08/11] media: hantro: Move copy_metadata() before doing a decode operation
Date:   Thu,  8 Aug 2019 07:34:29 -0300
Message-Id: <20190808103432.12062-9-ezequiel@collabora.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190808103432.12062-1-ezequiel@collabora.com>
References: <20190808103432.12062-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Boris Brezillon <boris.brezillon@collabora.com>

Some decoders use intra slice/frame references. The capture buffer
pointed by these references might be new and thus have invalid
timestamp which prevents the decoder logic from retrieving the
vb2_buffer object based on the output buf timestamp.
Copy all metadata (including the timestamp) before starting the decode
operation.

Suggested-by: Jonas Karlman <jonas@kwiboo.se>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
Changes in v4:
* None.
---
 drivers/staging/media/hantro/hantro_drv.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index 4af6ee80229e..6e2351e46750 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -111,8 +111,6 @@ static void hantro_job_finish(struct hantro_dev *vpu,
 	src->sequence = ctx->sequence_out++;
 	dst->sequence = ctx->sequence_cap++;
 
-	v4l2_m2m_buf_copy_metadata(src, dst, true);
-
 	ret = ctx->buf_finish(ctx, &dst->vb2_buf, bytesused);
 	if (ret)
 		result = VB2_BUF_STATE_ERROR;
@@ -178,8 +176,12 @@ void hantro_finish_run(struct hantro_ctx *ctx)
 static void device_run(void *priv)
 {
 	struct hantro_ctx *ctx = priv;
+	struct vb2_v4l2_buffer *src, *dst;
 	int ret;
 
+	src = hantro_get_src_buf(ctx);
+	dst = hantro_get_dst_buf(ctx);
+
 	ret = clk_bulk_enable(ctx->dev->variant->num_clocks, ctx->dev->clocks);
 	if (ret)
 		goto err_cancel_job;
@@ -187,6 +189,8 @@ static void device_run(void *priv)
 	if (ret < 0)
 		goto err_cancel_job;
 
+	v4l2_m2m_buf_copy_metadata(src, dst, true);
+
 	ctx->codec_ops->run(ctx);
 	return;
 
-- 
2.22.0

