Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 335883E1725
	for <lists+linux-media@lfdr.de>; Thu,  5 Aug 2021 16:45:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242021AbhHEOoJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Aug 2021 10:44:09 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59054 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229892AbhHEOnL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Aug 2021 10:43:11 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id 93B6B1F44098
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To:     linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-staging@lists.linux.dev
Cc:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Ezequiel Garcia <elezegarcia@gmail.com>,
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
Subject: [PATCH v3 01/10] hantro: postproc: Fix motion vector space size
Date:   Thu,  5 Aug 2021 16:42:37 +0200
Message-Id: <20210805144246.11998-2-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210805144246.11998-1-andrzej.p@collabora.com>
References: <20210805144246.11998-1-andrzej.p@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Ezequiel Garcia <ezequiel@collabora.com>

When the post-processor hardware block is enabled, the driver
allocates an internal queue of buffers for the decoder enginer,
and uses the vb2 queue for the post-processor engine.

For instance, on a G1 core, the decoder engine produces NV12 buffers
and the post-processor engine can produce YUY2 buffers. The decoder
engine expects motion vectors to be appended to the NV12 buffers,
but this is only required for CODECs that need motion vectors,
such as H.264.

Fix the post-processor logic accordingly.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 drivers/staging/media/hantro/hantro_postproc.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_postproc.c b/drivers/staging/media/hantro/hantro_postproc.c
index ed8916c950a4..07842152003f 100644
--- a/drivers/staging/media/hantro/hantro_postproc.c
+++ b/drivers/staging/media/hantro/hantro_postproc.c
@@ -132,9 +132,10 @@ int hantro_postproc_alloc(struct hantro_ctx *ctx)
 	unsigned int num_buffers = cap_queue->num_buffers;
 	unsigned int i, buf_size;
 
-	buf_size = ctx->dst_fmt.plane_fmt[0].sizeimage +
-		   hantro_h264_mv_size(ctx->dst_fmt.width,
-				       ctx->dst_fmt.height);
+	buf_size = ctx->dst_fmt.plane_fmt[0].sizeimage;
+	if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_H264_SLICE)
+		buf_size += hantro_h264_mv_size(ctx->dst_fmt.width,
+						ctx->dst_fmt.height);
 
 	for (i = 0; i < num_buffers; ++i) {
 		struct hantro_aux_buf *priv = &ctx->postproc.dec_q[i];
-- 
2.17.1

