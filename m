Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68B37A9F5A
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 12:15:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733033AbfIEKPn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 06:15:43 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:45171 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732504AbfIEKPn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Sep 2019 06:15:43 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1i5onm-0001qT-D3; Thu, 05 Sep 2019 12:15:42 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        kernel@pengutronix.de
Subject: [PATCH 2/2] media: hantro: h264: per-slice num_ref_idx_l[01]_active override
Date:   Thu,  5 Sep 2019 12:15:33 +0200
Message-Id: <20190905101533.525-2-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190905101533.525-1-p.zabel@pengutronix.de>
References: <20190905101533.525-1-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If the slice header had the num_ref_idx_active_override flag set, we
should use the num_ref_idx_l[01]_active_minus1 fields instead of the
defaults from the PPS.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/staging/media/hantro/hantro_g1_h264_dec.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_g1_h264_dec.c b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
index 7ab534936843..544cf92ab62c 100644
--- a/drivers/staging/media/hantro/hantro_g1_h264_dec.c
+++ b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
@@ -28,6 +28,8 @@ static void set_params(struct hantro_ctx *ctx)
 	const struct v4l2_ctrl_h264_pps *pps = ctrls->pps;
 	struct vb2_v4l2_buffer *src_buf = hantro_get_src_buf(ctx);
 	struct hantro_dev *vpu = ctx->dev;
+	unsigned char refidx0_active;
+	unsigned char refidx1_active;
 	u32 reg;
 
 	/* Decoder control register 0. */
@@ -101,9 +103,16 @@ static void set_params(struct hantro_ctx *ctx)
 	vdpu_write_relaxed(vpu, reg, G1_REG_DEC_CTRL5);
 
 	/* Decoder control register 6. */
+	if (sps->flags & V4L2_H264_SLICE_FLAG_NUM_REF_IDX_ACTIVE_OVERRIDE) {
+		refidx0_active = slices[0].num_ref_idx_l0_active_minus1 + 1;
+		refidx1_active = slices[0].num_ref_idx_l1_active_minus1 + 1;
+	} else {
+		refidx0_active = pps->num_ref_idx_l0_default_active_minus1 + 1;
+		refidx1_active = pps->num_ref_idx_l1_default_active_minus1 + 1;
+	}
 	reg = G1_REG_DEC_CTRL6_PPS_ID(slices[0].pic_parameter_set_id) |
-	      G1_REG_DEC_CTRL6_REFIDX0_ACTIVE(pps->num_ref_idx_l0_default_active_minus1 + 1) |
-	      G1_REG_DEC_CTRL6_REFIDX1_ACTIVE(pps->num_ref_idx_l1_default_active_minus1 + 1) |
+	      G1_REG_DEC_CTRL6_REFIDX0_ACTIVE(refidx0_active) |
+	      G1_REG_DEC_CTRL6_REFIDX1_ACTIVE(refidx1_active) |
 	      G1_REG_DEC_CTRL6_POC_LENGTH(slices[0].pic_order_cnt_bit_size);
 	vdpu_write_relaxed(vpu, reg, G1_REG_DEC_CTRL6);
 
-- 
2.20.1

