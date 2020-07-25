Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 284D322D894
	for <lists+linux-media@lfdr.de>; Sat, 25 Jul 2020 17:52:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727019AbgGYPwf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Jul 2020 11:52:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726567AbgGYPwf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Jul 2020 11:52:35 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0326C08C5C0
        for <linux-media@vger.kernel.org>; Sat, 25 Jul 2020 08:52:34 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 568EA296D0C
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Adrian Ratiu <adrian.ratiu@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>, kernel@collabora.com
Subject: [PATCH 2/2] hantro: postproc: Fix motion vector space allocation
Date:   Sat, 25 Jul 2020 12:52:08 -0300
Message-Id: <20200725155208.897908-3-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200725155208.897908-1-ezequiel@collabora.com>
References: <20200725155208.897908-1-ezequiel@collabora.com>
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
wasn't doing. Fix this.

This fix removes artifacts on high profile bitstreams,
found on certain platforms.

While here, fix the MV layout comment, since the multicore
(MC) word is found before the MV buffer.

Fixes: 8c2d66b036c77 ("media: hantro: Support color conversion via post-processing")
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/staging/media/hantro/hantro_hw.h       | 4 ++--
 drivers/staging/media/hantro/hantro_postproc.c | 4 +++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
index f066de6b592d..989564485ca1 100644
--- a/drivers/staging/media/hantro/hantro_hw.h
+++ b/drivers/staging/media/hantro/hantro_hw.h
@@ -200,10 +200,10 @@ hantro_h264_mv_size(unsigned int width, unsigned int height)
 	 * +---------------------------+
 	 * | UV-plane  128 bytes x MBs |
 	 * +---------------------------+
-	 * | MV buffer  64 bytes x MBs |
-	 * +---------------------------+
 	 * | MC sync          32 bytes |
 	 * +---------------------------+
+	 * | MV buffer  64 bytes x MBs |
+	 * +---------------------------+
 	 */
 	return 64 * MB_WIDTH(width) * MB_WIDTH(height) + 32;
 }
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

