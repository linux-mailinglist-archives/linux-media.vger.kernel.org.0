Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D87228C393
	for <lists+linux-media@lfdr.de>; Mon, 12 Oct 2020 22:59:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731845AbgJLU7m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Oct 2020 16:59:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731801AbgJLU7K (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Oct 2020 16:59:10 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CF07C0613D1;
        Mon, 12 Oct 2020 13:59:04 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: aratiu)
        with ESMTPSA id F30831F44C5B
From:   Adrian Ratiu <adrian.ratiu@collabora.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Mark Brown <broonie@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Fruehberger Peter <Peter.Fruehberger@de.bosch.com>,
        kuhanh.murugasen.krishnan@intel.com,
        Daniel Vetter <daniel@ffwll.ch>, kernel@collabora.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 17/18] media: hantro: add dump registers debug option before decode start
Date:   Mon, 12 Oct 2020 23:59:56 +0300
Message-Id: <20201012205957.889185-18-adrian.ratiu@collabora.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201012205957.889185-1-adrian.ratiu@collabora.com>
References: <20201012205957.889185-1-adrian.ratiu@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It is very useful to know the status of all the decoder configuration
registers right before starting a decode operation, so add an option
to print them if register debugging is enabled (debug bit 7 is set).

Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
---
 drivers/staging/media/hantro/hantro.h          | 1 +
 drivers/staging/media/hantro/hantro_h264_dec.c | 9 ++++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
index 70aeb11b1149..1b0c441ff15a 100644
--- a/drivers/staging/media/hantro/hantro.h
+++ b/drivers/staging/media/hantro/hantro.h
@@ -304,6 +304,7 @@ struct hantro_reg {
  * bit 4 - detail fmt, ctrl, buffer q/dq information
  * bit 5 - detail function enter/leave trace information
  * bit 6 - register write/read information
+ * bit 7 - dump
  */
 extern int hantro_debug;
 
diff --git a/drivers/staging/media/hantro/hantro_h264_dec.c b/drivers/staging/media/hantro/hantro_h264_dec.c
index e64b59c84111..2c53394cbb0c 100644
--- a/drivers/staging/media/hantro/hantro_h264_dec.c
+++ b/drivers/staging/media/hantro/hantro_h264_dec.c
@@ -381,7 +381,9 @@ void hantro_g1_h264_dec_run(struct hantro_ctx *ctx)
 	struct hantro_dev *vpu = ctx->dev;
 	struct hantro_regmap_fields_dec *fields = vpu->reg_fields_dec;
 	bool do_high10 = (vpu->h264_hw_mode == HANTRO_H264_HIGH10);
-	int reg;
+	u32 max_reg = hantro_regmap_dec.max_register;
+	u32 reg_stride = hantro_regmap_dec.reg_stride;
+	int reg, i;
 
 	/* Prepare the H264 decoder context. */
 	if (hantro_h264_dec_prepare_run(ctx))
@@ -421,6 +423,11 @@ void hantro_g1_h264_dec_run(struct hantro_ctx *ctx)
 	regmap_field_write(fields->dec_max_burst, 16);
 	regmap_field_write(fields->dec_axi_rd_id, 16);
 
+	vpu_debug(7, "Reg dump at decoding start\n");
+	for (i = 0; hantro_debug & BIT(7) && i <= max_reg; i += reg_stride)
+		vpu_debug(7, "swreg %03d: %08x\n", i / 4, vdpu_read(vpu, i));
+	vpu_debug(7, "Reg dump end\n");
+
 	/* Start decoding! */
 	vdpu_write(vpu, G1_REG_INTERRUPT_DEC_E, G1_REG_INTERRUPT);
 }
-- 
2.28.0

