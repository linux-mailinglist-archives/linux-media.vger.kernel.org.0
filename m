Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA69845345B
	for <lists+linux-media@lfdr.de>; Tue, 16 Nov 2021 15:39:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237476AbhKPOlx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Nov 2021 09:41:53 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:37544 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229644AbhKPOlr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Nov 2021 09:41:47 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id 9BAF61F457CA
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
        t=1637073529; bh=puTDVxKvsG/SEplOOyqAU/Pya4sBeAzzzC0bFdbbs+0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PIVORhVMNzko4EQKELvZyLkyGoUsK4DilBR48MDpP2eaQRuSLWOoRR3kme5xa/nYU
         VzRRf9ARrGI7eB5vutFaUOdED1kjx4dFngDZPm7nSpfLAeJCi6eqjJsFMsPoLgGocY
         vAUY1fVApPCEmmmZq7EA2REQQYc0VUs3fgSwTR31EqvHM+e7JOimegLDYnvqZqyVOc
         Y8VG7jgpacLXuZh/tZsV6nKklmv1b/kQkshXV77O6DUrp7bGaji2aP8ZQmzX649qKE
         bBIDjGggVdop+Mo+X5Yc1lUe4sAWmczIP0HszfRZ9hZwzl8mtAFYWWB81a9urfUi/M
         Y5zbPH8YDbTAg==
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
Subject: [PATCH v8 01/12] hantro: postproc: Fix motion vector space size
Date:   Tue, 16 Nov 2021 15:38:31 +0100
Message-Id: <20211116143842.75896-2-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211116143842.75896-1-andrzej.p@collabora.com>
References: <20211116143842.75896-1-andrzej.p@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
2.25.1

