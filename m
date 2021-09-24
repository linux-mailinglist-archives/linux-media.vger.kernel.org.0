Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 948FF4175D6
	for <lists+linux-media@lfdr.de>; Fri, 24 Sep 2021 15:32:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346324AbhIXNdu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Sep 2021 09:33:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345090AbhIXNdp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Sep 2021 09:33:45 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 115D8C035477;
        Fri, 24 Sep 2021 06:25:05 -0700 (PDT)
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:4cb:a870:60fa:cb2f:7fe1:65a3])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 88A751F44B7C;
        Fri, 24 Sep 2021 14:25:02 +0100 (BST)
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     p.zabel@pengutronix.de, mchehab@kernel.org,
        gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH v2] media: hantro: Auto generate the AXI ID to avoid conflicts
Date:   Fri, 24 Sep 2021 15:24:47 +0200
Message-Id: <20210924132447.2288167-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The AXI ID is an AXI bus configuration for improve bus performance. 
If read and write operations use different ID the operations can be paralleled,
whereas when they have the same ID the operations will be serialized. 
Right now, the write ID is fixed to 0 but we can set it to 0xff to get auto
generated ID to avoid possible conflicts.

This change has no functional changes, but seems reasonable to let the
hardware to autogenerate the ID instead of hardcoding in software.

Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
changes in version 2:
- Add a macro with comment about the value.
- Make VP8 and H264 codecs use the macro.
- fluster tests on the both codecs show no regressions.
  ./fluster.py run -ts VP8-TEST-VECTORS -d GStreamer-VP8-V4L2SL-Gst1.0
  ./fluster.py run -ts JVT-AVC_V1 -d GStreamer-H.264-V4L2SL-Gst1.0
- The both codec write other bits in the same configuration register
  so the simplest solution is to use the macro in the both cases.

 drivers/staging/media/hantro/hantro_g1_h264_dec.c | 2 +-
 drivers/staging/media/hantro/hantro_g1_regs.h     | 2 ++
 drivers/staging/media/hantro/hantro_g1_vp8_dec.c  | 3 ++-
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_g1_h264_dec.c b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
index 236ce24ca00c..f49dbfb8a843 100644
--- a/drivers/staging/media/hantro/hantro_g1_h264_dec.c
+++ b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
@@ -29,7 +29,7 @@ static void set_params(struct hantro_ctx *ctx, struct vb2_v4l2_buffer *src_buf)
 	u32 reg;
 
 	/* Decoder control register 0. */
-	reg = G1_REG_DEC_CTRL0_DEC_AXI_WR_ID(0x0);
+	reg = G1_REG_DEC_CTRL0_DEC_AXI_AUTO;
 	if (sps->flags & V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD)
 		reg |= G1_REG_DEC_CTRL0_SEQ_MBAFF_E;
 	if (sps->profile_idc > 66) {
diff --git a/drivers/staging/media/hantro/hantro_g1_regs.h b/drivers/staging/media/hantro/hantro_g1_regs.h
index c1756e3d5391..c623b3b0be18 100644
--- a/drivers/staging/media/hantro/hantro_g1_regs.h
+++ b/drivers/staging/media/hantro/hantro_g1_regs.h
@@ -68,6 +68,8 @@
 #define     G1_REG_DEC_CTRL0_PICORD_COUNT_E		BIT(9)
 #define     G1_REG_DEC_CTRL0_DEC_AHB_HLOCK_E		BIT(8)
 #define     G1_REG_DEC_CTRL0_DEC_AXI_WR_ID(x)		(((x) & 0xff) << 0)
+/* Setting AXI ID to 0xff to get auto generated ID to avoid possible conflicts */
+#define     G1_REG_DEC_CTRL0_DEC_AXI_AUTO		G1_REG_DEC_CTRL0_DEC_AXI_WR_ID(0xff)
 #define G1_REG_DEC_CTRL1				0x010
 #define     G1_REG_DEC_CTRL1_PIC_MB_WIDTH(x)		(((x) & 0x1ff) << 23)
 #define     G1_REG_DEC_CTRL1_MB_WIDTH_OFF(x)		(((x) & 0xf) << 19)
diff --git a/drivers/staging/media/hantro/hantro_g1_vp8_dec.c b/drivers/staging/media/hantro/hantro_g1_vp8_dec.c
index 6180b23e7d94..851eb67f19f5 100644
--- a/drivers/staging/media/hantro/hantro_g1_vp8_dec.c
+++ b/drivers/staging/media/hantro/hantro_g1_vp8_dec.c
@@ -463,7 +463,8 @@ int hantro_g1_vp8_dec_run(struct hantro_ctx *ctx)
 	      G1_REG_CONFIG_DEC_MAX_BURST(16);
 	vdpu_write_relaxed(vpu, reg, G1_REG_CONFIG);
 
-	reg = G1_REG_DEC_CTRL0_DEC_MODE(10);
+	reg = G1_REG_DEC_CTRL0_DEC_MODE(10) |
+	      G1_REG_DEC_CTRL0_DEC_AXI_AUTO;
 	if (!V4L2_VP8_FRAME_IS_KEY_FRAME(hdr))
 		reg |= G1_REG_DEC_CTRL0_PIC_INTER_E;
 	if (!(hdr->flags & V4L2_VP8_FRAME_FLAG_MB_NO_SKIP_COEFF))
-- 
2.30.2

