Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A22C22F613
	for <lists+linux-media@lfdr.de>; Mon, 27 Jul 2020 19:05:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729910AbgG0RFy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jul 2020 13:05:54 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:40212 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728626AbgG0RFy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jul 2020 13:05:54 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 7E85929626A
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Adrian Ratiu <adrian.ratiu@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Ezequiel Garcia <ezequiel@collabora.com>, kernel@collabora.com
Subject: [PATCH v2 2/2] hantro: postproc: Fix motion vector space allocation
Date:   Mon, 27 Jul 2020 14:05:38 -0300
Message-Id: <20200727170538.32894-3-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200727170538.32894-1-ezequiel@collabora.com>
References: <20200727170538.32894-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When the post-processor is enabled, the driver allocates
"shadow buffers" which are used for the decoder core,
and exposes the post-processed buffers to userspace.

For this reason, extra motion vector space has to
be allocated on the shadow buffers, which the driver
wasn't doing. Fix it.

This fix should address artifacts on high profile bitstreams.

Fixes: 8c2d66b036c77 ("media: hantro: Support color conversion via post-processing")
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/staging/media/hantro/hantro_postproc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/hantro/hantro_postproc.c b/drivers/staging/media/hantro/hantro_postproc.c
index 44062ffceaea..6d2a8f2a8f0b 100644
--- a/drivers/staging/media/hantro/hantro_postproc.c
+++ b/drivers/staging/media/hantro/hantro_postproc.c
@@ -118,7 +118,9 @@ int hantro_postproc_alloc(struct hantro_ctx *ctx)
 	unsigned int num_buffers = cap_queue->num_buffers;
 	unsigned int i, buf_size;
 
-	buf_size = ctx->dst_fmt.plane_fmt[0].sizeimage;
+	buf_size = ctx->dst_fmt.plane_fmt[0].sizeimage +
+		   hantro_h264_mv_size(ctx->dst_fmt.width,
+				       ctx->dst_fmt.height);
 
 	for (i = 0; i < num_buffers; ++i) {
 		struct hantro_aux_buf *priv = &ctx->postproc.dec_q[i];
-- 
2.27.0

