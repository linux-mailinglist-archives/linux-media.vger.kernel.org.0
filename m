Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 422AA3B5E6D
	for <lists+linux-media@lfdr.de>; Mon, 28 Jun 2021 14:54:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232979AbhF1M4z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Jun 2021 08:56:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232896AbhF1M4z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Jun 2021 08:56:55 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A46B7C061574
        for <linux-media@vger.kernel.org>; Mon, 28 Jun 2021 05:54:29 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 4D4BB1F423D0
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Heiko Stuebner <heiko@sntech.de>,
        Alex Bee <knaerzche@gmail.com>, maccraft123mc@gmail.com,
        Chris Healy <cphealy@gmail.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Kever Yang <kever.yang@rock-chips.com>,
        Ezequiel Garcia <ezequiel@collabora.com>, kernel@collabora.com
Subject: [PATCH v2 01/10] hantro: vp8: Move noisy WARN_ON to vpu_debug
Date:   Mon, 28 Jun 2021 09:54:01 -0300
Message-Id: <20210628125410.9228-2-ezequiel@collabora.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210628125410.9228-1-ezequiel@collabora.com>
References: <20210628125410.9228-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When the VP8 decoders can't find a reference frame,
the driver falls back to the current output frame.

This will probably produce some undesirable results,
leading to frame corruption, but shouldn't cause
noisy warnings.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Tested-by: Alex Bee <knaerzche@gmail.com>
---
 drivers/staging/media/hantro/hantro_g1_vp8_dec.c    | 13 ++++++++++---
 .../staging/media/hantro/rockchip_vpu2_hw_vp8_dec.c | 13 ++++++++++---
 2 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_g1_vp8_dec.c b/drivers/staging/media/hantro/hantro_g1_vp8_dec.c
index 96622a7f8279..2afd5996d75f 100644
--- a/drivers/staging/media/hantro/hantro_g1_vp8_dec.c
+++ b/drivers/staging/media/hantro/hantro_g1_vp8_dec.c
@@ -376,12 +376,17 @@ static void cfg_ref(struct hantro_ctx *ctx,
 	vb2_dst = hantro_get_dst_buf(ctx);
 
 	ref = hantro_get_ref(ctx, hdr->last_frame_ts);
-	if (!ref)
+	if (!ref) {
+		vpu_debug(0, "failed to find last frame ts=%llu\n",
+			  hdr->last_frame_ts);
 		ref = vb2_dma_contig_plane_dma_addr(&vb2_dst->vb2_buf, 0);
+	}
 	vdpu_write_relaxed(vpu, ref, G1_REG_ADDR_REF(0));
 
 	ref = hantro_get_ref(ctx, hdr->golden_frame_ts);
-	WARN_ON(!ref && hdr->golden_frame_ts);
+	if (!ref && hdr->golden_frame_ts)
+		vpu_debug(0, "failed to find golden frame ts=%llu\n",
+			  hdr->golden_frame_ts);
 	if (!ref)
 		ref = vb2_dma_contig_plane_dma_addr(&vb2_dst->vb2_buf, 0);
 	if (hdr->flags & V4L2_VP8_FRAME_FLAG_SIGN_BIAS_GOLDEN)
@@ -389,7 +394,9 @@ static void cfg_ref(struct hantro_ctx *ctx,
 	vdpu_write_relaxed(vpu, ref, G1_REG_ADDR_REF(4));
 
 	ref = hantro_get_ref(ctx, hdr->alt_frame_ts);
-	WARN_ON(!ref && hdr->alt_frame_ts);
+	if (!ref && hdr->alt_frame_ts)
+		vpu_debug(0, "failed to find alt frame ts=%llu\n",
+			  hdr->alt_frame_ts);
 	if (!ref)
 		ref = vb2_dma_contig_plane_dma_addr(&vb2_dst->vb2_buf, 0);
 	if (hdr->flags & V4L2_VP8_FRAME_FLAG_SIGN_BIAS_ALT)
diff --git a/drivers/staging/media/hantro/rockchip_vpu2_hw_vp8_dec.c b/drivers/staging/media/hantro/rockchip_vpu2_hw_vp8_dec.c
index 951b55f58a61..704607511b57 100644
--- a/drivers/staging/media/hantro/rockchip_vpu2_hw_vp8_dec.c
+++ b/drivers/staging/media/hantro/rockchip_vpu2_hw_vp8_dec.c
@@ -453,12 +453,17 @@ static void cfg_ref(struct hantro_ctx *ctx,
 	vb2_dst = hantro_get_dst_buf(ctx);
 
 	ref = hantro_get_ref(ctx, hdr->last_frame_ts);
-	if (!ref)
+	if (!ref) {
+		vpu_debug(0, "failed to find last frame ts=%llu\n",
+			  hdr->last_frame_ts);
 		ref = vb2_dma_contig_plane_dma_addr(&vb2_dst->vb2_buf, 0);
+	}
 	vdpu_write_relaxed(vpu, ref, VDPU_REG_VP8_ADDR_REF0);
 
 	ref = hantro_get_ref(ctx, hdr->golden_frame_ts);
-	WARN_ON(!ref && hdr->golden_frame_ts);
+	if (!ref && hdr->golden_frame_ts)
+		vpu_debug(0, "failed to find golden frame ts=%llu\n",
+			  hdr->golden_frame_ts);
 	if (!ref)
 		ref = vb2_dma_contig_plane_dma_addr(&vb2_dst->vb2_buf, 0);
 	if (hdr->flags & V4L2_VP8_FRAME_FLAG_SIGN_BIAS_GOLDEN)
@@ -466,7 +471,9 @@ static void cfg_ref(struct hantro_ctx *ctx,
 	vdpu_write_relaxed(vpu, ref, VDPU_REG_VP8_ADDR_REF2_5(2));
 
 	ref = hantro_get_ref(ctx, hdr->alt_frame_ts);
-	WARN_ON(!ref && hdr->alt_frame_ts);
+	if (!ref && hdr->alt_frame_ts)
+		vpu_debug(0, "failed to find alt frame ts=%llu\n",
+			  hdr->alt_frame_ts);
 	if (!ref)
 		ref = vb2_dma_contig_plane_dma_addr(&vb2_dst->vb2_buf, 0);
 	if (hdr->flags & V4L2_VP8_FRAME_FLAG_SIGN_BIAS_ALT)
-- 
2.32.0

