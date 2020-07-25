Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B83BB22D893
	for <lists+linux-media@lfdr.de>; Sat, 25 Jul 2020 17:52:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726944AbgGYPwa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Jul 2020 11:52:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726567AbgGYPwa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Jul 2020 11:52:30 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EE25C08C5C0
        for <linux-media@vger.kernel.org>; Sat, 25 Jul 2020 08:52:30 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 57F9C296D1A
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Adrian Ratiu <adrian.ratiu@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>, kernel@collabora.com
Subject: [PATCH 1/2] hantro: h264: Get the correct fallback reference buffer
Date:   Sat, 25 Jul 2020 12:52:07 -0300
Message-Id: <20200725155208.897908-2-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200725155208.897908-1-ezequiel@collabora.com>
References: <20200725155208.897908-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If the bitstream and the application are incorrectly configuring
the reference pictures, the hardware will need to fallback
to using some other reference picture.

When the post-processor is enabled, the fallback buffer
should be a shadow buffer (postproc.dec_q), and not a
CAPTURE queue buffer, since the latter is post-processed
and not really the output of the decoder core.

Fixes: 8c2d66b036c77 ("media: hantro: Support color conversion via post-processing")
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/staging/media/hantro/hantro_h264.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/hantro/hantro_h264.c b/drivers/staging/media/hantro/hantro_h264.c
index 194d05848077..6dcd47bd9ed3 100644
--- a/drivers/staging/media/hantro/hantro_h264.c
+++ b/drivers/staging/media/hantro/hantro_h264.c
@@ -325,7 +325,7 @@ dma_addr_t hantro_h264_get_ref_buf(struct hantro_ctx *ctx,
 		 */
 		dst_buf = hantro_get_dst_buf(ctx);
 		buf = &dst_buf->vb2_buf;
-		dma_addr = vb2_dma_contig_plane_dma_addr(buf, 0);
+		dma_addr = hantro_get_dec_buf_addr(ctx, buf);
 	}
 
 	return dma_addr;
-- 
2.27.0

