Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E8B0285CF7
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 12:36:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727777AbgJGKgB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 06:36:01 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46296 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727737AbgJGKgB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 06:36:01 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 1F3CF29C2A9
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>, cphealy@gmail.com,
        Benjamin.Bara@skidata.com, l.stach@pengutronix.de,
        Ezequiel Garcia <ezequiel@collabora.com>, kernel@collabora.com
Subject: [PATCH v2 2/6] coda: Simplify H.264 small buffer padding logic
Date:   Wed,  7 Oct 2020 07:35:40 -0300
Message-Id: <20201007103544.22807-3-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201007103544.22807-1-ezequiel@collabora.com>
References: <20201007103544.22807-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The H.264 small buffer padding is done under
the (ctx->qsequence == 0 && payload < 512) condition.

Given this is the exact same condition immediately
above, we can move it right there, making the code
slightly clearer.

This change shouldn't affect functionality as it's just
cosmetics.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/media/platform/coda/coda-bit.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/coda/coda-bit.c b/drivers/media/platform/coda/coda-bit.c
index aa0a47c34413..659fcf77b0ed 100644
--- a/drivers/media/platform/coda/coda-bit.c
+++ b/drivers/media/platform/coda/coda-bit.c
@@ -293,12 +293,11 @@ static bool coda_bitstream_try_queue(struct coda_ctx *ctx,
 			coda_dbg(1, ctx,
 				 "could not parse header, sequence initialization might fail\n");
 		}
-	}
 
-	/* Add padding before the first buffer, if it is too small */
-	if (ctx->qsequence == 0 && payload < 512 &&
-	    ctx->codec->src_fourcc == V4L2_PIX_FMT_H264)
-		coda_h264_bitstream_pad(ctx, 512 - payload);
+		/* Add padding before the first buffer, if it is too small */
+		if (ctx->codec->src_fourcc == V4L2_PIX_FMT_H264)
+			coda_h264_bitstream_pad(ctx, 512 - payload);
+	}
 
 	ret = coda_bitstream_queue(ctx, vaddr, payload);
 	if (ret < 0) {
-- 
2.27.0

