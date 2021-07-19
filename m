Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F201F3CD6B7
	for <lists+linux-media@lfdr.de>; Mon, 19 Jul 2021 16:38:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241051AbhGSN5V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Jul 2021 09:57:21 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:39216 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241040AbhGSN5P (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Jul 2021 09:57:15 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id D19DB1F42C33
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Heiko Stuebner <heiko@sntech.de>,
        Alex Bee <knaerzche@gmail.com>, maccraft123mc@gmail.com,
        Chris Healy <cphealy@gmail.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Rob Herring <robh+dt@kernel.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Kever Yang <kever.yang@rock-chips.com>,
        Ezequiel Garcia <ezequiel@collabora.com>, kernel@collabora.com
Subject: [PATCH RESEND v2 04/10] media: hantro: h264: Move DPB valid and long-term bitmaps
Date:   Mon, 19 Jul 2021 11:37:05 -0300
Message-Id: <20210719143711.55749-5-ezequiel@collabora.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210719143711.55749-1-ezequiel@collabora.com>
References: <20210719143711.55749-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In order to reuse these bitmaps, move this process to
struct hantro_h264_dec_hw_ctx. This will be used by
the Rockchip VDPU2 H.264 driver.

This idea was originally proposed by Jonas Karlman
in "[RFC 08/12] media: hantro: Fix H264 decoding of field encoded content"
which was posted a while ago.

Link: https://lore.kernel.org/linux-media/HE1PR06MB4011EA39133818A85768B91FACBF0@HE1PR06MB4011.eurprd06.prod.outlook.com/
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Tested-by: Alex Bee <knaerzche@gmail.com>
---
 .../staging/media/hantro/hantro_g1_h264_dec.c   | 17 ++---------------
 drivers/staging/media/hantro/hantro_h264.c      | 13 +++++++++++++
 drivers/staging/media/hantro/hantro_hw.h        |  4 ++++
 3 files changed, 19 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_g1_h264_dec.c b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
index 2aa37baad0c3..6faacfc44c7c 100644
--- a/drivers/staging/media/hantro/hantro_g1_h264_dec.c
+++ b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
@@ -129,25 +129,12 @@ static void set_ref(struct hantro_ctx *ctx)
 	struct v4l2_h264_dpb_entry *dpb = ctx->h264_dec.dpb;
 	const u8 *b0_reflist, *b1_reflist, *p_reflist;
 	struct hantro_dev *vpu = ctx->dev;
-	u32 dpb_longterm = 0;
-	u32 dpb_valid = 0;
 	int reg_num;
 	u32 reg;
 	int i;
 
-	/*
-	 * Set up bit maps of valid and long term DPBs.
-	 * NOTE: The bits are reversed, i.e. MSb is DPB 0.
-	 */
-	for (i = 0; i < HANTRO_H264_DPB_SIZE; ++i) {
-		if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE)
-			dpb_valid |= BIT(HANTRO_H264_DPB_SIZE - 1 - i);
-
-		if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM)
-			dpb_longterm |= BIT(HANTRO_H264_DPB_SIZE - 1 - i);
-	}
-	vdpu_write_relaxed(vpu, dpb_valid << 16, G1_REG_VALID_REF);
-	vdpu_write_relaxed(vpu, dpb_longterm << 16, G1_REG_LT_REF);
+	vdpu_write_relaxed(vpu, ctx->h264_dec.dpb_valid, G1_REG_VALID_REF);
+	vdpu_write_relaxed(vpu, ctx->h264_dec.dpb_longterm, G1_REG_LT_REF);
 
 	/*
 	 * Set up reference frame picture numbers.
diff --git a/drivers/staging/media/hantro/hantro_h264.c b/drivers/staging/media/hantro/hantro_h264.c
index ed6eaf11d96f..6d72136760e7 100644
--- a/drivers/staging/media/hantro/hantro_h264.c
+++ b/drivers/staging/media/hantro/hantro_h264.c
@@ -229,12 +229,25 @@ static void prepare_table(struct hantro_ctx *ctx)
 	const struct v4l2_ctrl_h264_decode_params *dec_param = ctrls->decode;
 	struct hantro_h264_dec_priv_tbl *tbl = ctx->h264_dec.priv.cpu;
 	const struct v4l2_h264_dpb_entry *dpb = ctx->h264_dec.dpb;
+	u32 dpb_longterm = 0;
+	u32 dpb_valid = 0;
 	int i;
 
 	for (i = 0; i < HANTRO_H264_DPB_SIZE; ++i) {
 		tbl->poc[i * 2] = dpb[i].top_field_order_cnt;
 		tbl->poc[i * 2 + 1] = dpb[i].bottom_field_order_cnt;
+
+		/*
+		 * Set up bit maps of valid and long term DPBs.
+		 * NOTE: The bits are reversed, i.e. MSb is DPB 0.
+		 */
+		if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE)
+			dpb_valid |= BIT(HANTRO_H264_DPB_SIZE - 1 - i);
+		if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM)
+			dpb_longterm |= BIT(HANTRO_H264_DPB_SIZE - 1 - i);
 	}
+	ctx->h264_dec.dpb_valid = dpb_valid << 16;
+	ctx->h264_dec.dpb_longterm = dpb_longterm << 16;
 
 	tbl->poc[32] = dec_param->top_field_order_cnt;
 	tbl->poc[33] = dec_param->bottom_field_order_cnt;
diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
index 5dcf65805396..ce678fedaad6 100644
--- a/drivers/staging/media/hantro/hantro_hw.h
+++ b/drivers/staging/media/hantro/hantro_hw.h
@@ -89,12 +89,16 @@ struct hantro_h264_dec_reflists {
  * @dpb:	DPB
  * @reflists:	P/B0/B1 reflists
  * @ctrls:	V4L2 controls attached to a run
+ * @dpb_longterm: DPB long-term
+ * @dpb_valid:	  DPB valid
  */
 struct hantro_h264_dec_hw_ctx {
 	struct hantro_aux_buf priv;
 	struct v4l2_h264_dpb_entry dpb[HANTRO_H264_DPB_SIZE];
 	struct hantro_h264_dec_reflists reflists;
 	struct hantro_h264_dec_ctrls ctrls;
+	u32 dpb_longterm;
+	u32 dpb_valid;
 };
 
 /**
-- 
2.32.0

