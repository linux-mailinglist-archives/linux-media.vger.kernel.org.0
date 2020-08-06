Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2500423DEF1
	for <lists+linux-media@lfdr.de>; Thu,  6 Aug 2020 19:36:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729851AbgHFRfX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Aug 2020 13:35:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729382AbgHFRfI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Aug 2020 13:35:08 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E085DC0086A5;
        Thu,  6 Aug 2020 08:19:32 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 0E7D429959A
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [PATCH v2 14/14] media: cedrus: h264: Fix frame list construction
Date:   Thu,  6 Aug 2020 12:13:10 -0300
Message-Id: <20200806151310.98624-15-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200806151310.98624-1-ezequiel@collabora.com>
References: <20200806151310.98624-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jernej Skrabec <jernej.skrabec@siol.net>

Current frame list construction algorithm assumes that decoded image
will be output into its own buffer. That is true for progressive content
but not for interlaced where each field is decoded separately into same
buffer.

Fix that by checking if capture buffer is listed in DPB. If it is, reuse
it.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/staging/media/sunxi/cedrus/cedrus_h264.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
index 91d88a96badc..7b2169d185b8 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
@@ -101,7 +101,7 @@ static void cedrus_write_frame_list(struct cedrus_ctx *ctx,
 	struct cedrus_dev *dev = ctx->dev;
 	unsigned long used_dpbs = 0;
 	unsigned int position;
-	unsigned int output = 0;
+	int output = -1;
 	unsigned int i;
 
 	cap_q = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
@@ -124,6 +124,11 @@ static void cedrus_write_frame_list(struct cedrus_ctx *ctx,
 		position = cedrus_buf->codec.h264.position;
 		used_dpbs |= BIT(position);
 
+		if (run->dst->vb2_buf.timestamp == dpb->reference_ts) {
+			output = position;
+			continue;
+		}
+
 		if (!(dpb->flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE))
 			continue;
 
@@ -131,13 +136,11 @@ static void cedrus_write_frame_list(struct cedrus_ctx *ctx,
 				    dpb->top_field_order_cnt,
 				    dpb->bottom_field_order_cnt,
 				    &pic_list[position]);
-
-		output = max(position, output);
 	}
 
-	position = find_next_zero_bit(&used_dpbs, CEDRUS_H264_FRAME_NUM,
-				      output);
-	if (position >= CEDRUS_H264_FRAME_NUM)
+	if (output >= 0)
+		position = output;
+	else
 		position = find_first_zero_bit(&used_dpbs, CEDRUS_H264_FRAME_NUM);
 
 	output_buf = vb2_to_cedrus_buffer(&run->dst->vb2_buf);
-- 
2.27.0

