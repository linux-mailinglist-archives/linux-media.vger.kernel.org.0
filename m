Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 079215A0E13
	for <lists+linux-media@lfdr.de>; Thu, 25 Aug 2022 12:42:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241110AbiHYKl6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Aug 2022 06:41:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236313AbiHYKl5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Aug 2022 06:41:57 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EA8880F60
        for <linux-media@vger.kernel.org>; Thu, 25 Aug 2022 03:41:56 -0700 (PDT)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1oRAJ8-0006tN-CA; Thu, 25 Aug 2022 12:41:54 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>, kernel@pengutronix.de,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH] media: coda: jpeg: drop coda9_jpeg_dec_huff_setup() return value
Date:   Thu, 25 Aug 2022 12:41:49 +0200
Message-Id: <20220825104149.2447484-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

coda9_jpeg_dec_huff_setup() never returns anything but 0. Drop
return value and superfluous error handling at the call site.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/media/platform/chips-media/coda-jpeg.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/chips-media/coda-jpeg.c b/drivers/media/platform/chips-media/coda-jpeg.c
index a0b22b07f69a..435e7030fc2a 100644
--- a/drivers/media/platform/chips-media/coda-jpeg.c
+++ b/drivers/media/platform/chips-media/coda-jpeg.c
@@ -421,7 +421,7 @@ static inline void coda9_jpeg_write_huff_values(struct coda_dev *dev, u8 *bits,
 		coda_write(dev, (s32)values[i], CODA9_REG_JPEG_HUFF_DATA);
 }
 
-static int coda9_jpeg_dec_huff_setup(struct coda_ctx *ctx)
+static void coda9_jpeg_dec_huff_setup(struct coda_ctx *ctx)
 {
 	struct coda_huff_tab *huff_tab = ctx->params.jpeg_huff_tab;
 	struct coda_dev *dev = ctx->dev;
@@ -455,7 +455,6 @@ static int coda9_jpeg_dec_huff_setup(struct coda_ctx *ctx)
 	coda9_jpeg_write_huff_values(dev, huff_tab->luma_ac, 162);
 	coda9_jpeg_write_huff_values(dev, huff_tab->chroma_ac, 162);
 	coda_write(dev, 0x000, CODA9_REG_JPEG_HUFF_CTRL);
-	return 0;
 }
 
 static inline void coda9_jpeg_write_qmat_tab(struct coda_dev *dev,
@@ -1394,14 +1393,8 @@ static int coda9_jpeg_prepare_decode(struct coda_ctx *ctx)
 	coda_write(dev, ctx->params.jpeg_restart_interval,
 			CODA9_REG_JPEG_RST_INTVAL);
 
-	if (ctx->params.jpeg_huff_tab) {
-		ret = coda9_jpeg_dec_huff_setup(ctx);
-		if (ret < 0) {
-			v4l2_err(&dev->v4l2_dev,
-				 "failed to set up Huffman tables: %d\n", ret);
-			return ret;
-		}
-	}
+	if (ctx->params.jpeg_huff_tab)
+		coda9_jpeg_dec_huff_setup(ctx);
 
 	coda9_jpeg_qmat_setup(ctx);
 

base-commit: 568035b01cfb107af8d2e4bd2fb9aea22cf5b868
-- 
2.30.2

