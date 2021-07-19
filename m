Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51F5B3CEFC8
	for <lists+linux-media@lfdr.de>; Tue, 20 Jul 2021 01:27:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239051AbhGSWjN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Jul 2021 18:39:13 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:44782 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1387515AbhGSUNh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Jul 2021 16:13:37 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id AD03F1F42DEB
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rockchip@lists.infradead.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Heiko Stuebner <heiko@sntech.de>,
        Alex Bee <knaerzche@gmail.com>, maccraft123mc@gmail.com,
        Chris Healy <cphealy@gmail.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Kever Yang <kever.yang@rock-chips.com>,
        Ezequiel Garcia <ezequiel@collabora.com>, kernel@collabora.com
Subject: [PATCH v3 05/10] media: hantro: h264: Move reference picture number to a helper
Date:   Mon, 19 Jul 2021 17:52:37 -0300
Message-Id: <20210719205242.18807-6-ezequiel@collabora.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210719205242.18807-1-ezequiel@collabora.com>
References: <20210719205242.18807-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a hantro_h264_get_ref_nbr() helper function to get the reference
picture numbers. This will be used by the Rockchip VDPU2 H.264 driver.

This idea was originally proposed by Jonas Karlman in
"[RFC 09/12] media: hantro: Refactor G1 H264 code"
posted a while ago.

Link: https://lore.kernel.org/linux-media/HE1PR06MB401165F2BA0AD8A634FDFAF2ACBF0@HE1PR06MB4011.eurprd06.prod.outlook.com/
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Tested-by: Alex Bee <knaerzche@gmail.com>
---
 drivers/staging/media/hantro/hantro_g1_h264_dec.c | 14 ++------------
 drivers/staging/media/hantro/hantro_h264.c        | 11 +++++++++++
 drivers/staging/media/hantro/hantro_hw.h          |  2 ++
 3 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_g1_h264_dec.c b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
index 6faacfc44c7c..236ce24ca00c 100644
--- a/drivers/staging/media/hantro/hantro_g1_h264_dec.c
+++ b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
@@ -126,7 +126,6 @@ static void set_params(struct hantro_ctx *ctx, struct vb2_v4l2_buffer *src_buf)
 
 static void set_ref(struct hantro_ctx *ctx)
 {
-	struct v4l2_h264_dpb_entry *dpb = ctx->h264_dec.dpb;
 	const u8 *b0_reflist, *b1_reflist, *p_reflist;
 	struct hantro_dev *vpu = ctx->dev;
 	int reg_num;
@@ -143,17 +142,8 @@ static void set_ref(struct hantro_ctx *ctx)
 	 * subsequential reference pictures.
 	 */
 	for (i = 0; i < HANTRO_H264_DPB_SIZE; i += 2) {
-		reg = 0;
-		if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM)
-			reg |= G1_REG_REF_PIC_REFER0_NBR(dpb[i].pic_num);
-		else
-			reg |= G1_REG_REF_PIC_REFER0_NBR(dpb[i].frame_num);
-
-		if (dpb[i + 1].flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM)
-			reg |= G1_REG_REF_PIC_REFER1_NBR(dpb[i + 1].pic_num);
-		else
-			reg |= G1_REG_REF_PIC_REFER1_NBR(dpb[i + 1].frame_num);
-
+		reg = G1_REG_REF_PIC_REFER0_NBR(hantro_h264_get_ref_nbr(ctx, i)) |
+		      G1_REG_REF_PIC_REFER1_NBR(hantro_h264_get_ref_nbr(ctx, i + 1));
 		vdpu_write_relaxed(vpu, reg, G1_REG_REF_PIC(i / 2));
 	}
 
diff --git a/drivers/staging/media/hantro/hantro_h264.c b/drivers/staging/media/hantro/hantro_h264.c
index 6d72136760e7..0b4d2491be3b 100644
--- a/drivers/staging/media/hantro/hantro_h264.c
+++ b/drivers/staging/media/hantro/hantro_h264.c
@@ -348,6 +348,17 @@ dma_addr_t hantro_h264_get_ref_buf(struct hantro_ctx *ctx,
 	return dma_addr;
 }
 
+u16 hantro_h264_get_ref_nbr(struct hantro_ctx *ctx, unsigned int dpb_idx)
+{
+	const struct v4l2_h264_dpb_entry *dpb = &ctx->h264_dec.dpb[dpb_idx];
+
+	if (!(dpb->flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE))
+		return 0;
+	if (dpb->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM)
+		return dpb->pic_num;
+	return dpb->frame_num;
+}
+
 int hantro_h264_dec_prepare_run(struct hantro_ctx *ctx)
 {
 	struct hantro_h264_dec_hw_ctx *h264_ctx = &ctx->h264_dec;
diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
index ce678fedaad6..7a8048afe357 100644
--- a/drivers/staging/media/hantro/hantro_hw.h
+++ b/drivers/staging/media/hantro/hantro_hw.h
@@ -238,6 +238,8 @@ void hantro_jpeg_enc_done(struct hantro_ctx *ctx);
 
 dma_addr_t hantro_h264_get_ref_buf(struct hantro_ctx *ctx,
 				   unsigned int dpb_idx);
+u16 hantro_h264_get_ref_nbr(struct hantro_ctx *ctx,
+			    unsigned int dpb_idx);
 int hantro_h264_dec_prepare_run(struct hantro_ctx *ctx);
 int hantro_g1_h264_dec_run(struct hantro_ctx *ctx);
 int hantro_h264_dec_init(struct hantro_ctx *ctx);
-- 
2.32.0

