Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31CCA5FFD78
	for <lists+linux-media@lfdr.de>; Sun, 16 Oct 2022 08:16:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229762AbiJPGQA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Oct 2022 02:16:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229760AbiJPGP7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Oct 2022 02:15:59 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAF8436DF0
        for <linux-media@vger.kernel.org>; Sat, 15 Oct 2022 23:15:58 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 964D3E65;
        Sun, 16 Oct 2022 08:15:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1665900956;
        bh=wGoPnD6bq0js73PR0yN/hApPnCYaUBESVytOiSJ7nJQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XTc68nssjkGeSsPs8S+H/IRGvxL1uuZcFAz0u7Gn21JwLQoNzCnHWQ82pFrfOI4v1
         O/blekJnbb8xjwrMP8NpaBVakhstcEPz8vQvvd1IY9LiixlIbWiICV3yDcuR+4XqZj
         6KnE2Esrpa4pFfKuRn3F1xR5Fdck//UEp5CI08G4=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 05/20] media: i2c: imx290: Drop imx290_write_buffered_reg()
Date:   Sun, 16 Oct 2022 09:15:08 +0300
Message-Id: <20221016061523.30127-6-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221016061523.30127-1-laurent.pinchart@ideasonboard.com>
References: <20221016061523.30127-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The imx290_write_buffered_reg() function wraps a register write with
register hold, to enable changing multiple registers synchronously. It
is used for the gain only, which is an 8-bit register, defeating its
purpose.

The feature is useful, but should be implemented differently. Drop the
function for now, to prepare for a rework of register access.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/media/i2c/imx290.c | 32 +-------------------------------
 1 file changed, 1 insertion(+), 31 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 0f32f391b2e7..5646f1704a1e 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -413,41 +413,11 @@ static int imx290_set_register_array(struct imx290 *imx290,
 	return 0;
 }
 
-static int imx290_write_buffered_reg(struct imx290 *imx290, u16 address_low,
-				     u8 nr_regs, u32 value)
-{
-	unsigned int i;
-	int ret;
-
-	ret = imx290_write_reg(imx290, IMX290_REGHOLD, 0x01);
-	if (ret) {
-		dev_err(imx290->dev, "Error setting hold register\n");
-		return ret;
-	}
-
-	for (i = 0; i < nr_regs; i++) {
-		ret = imx290_write_reg(imx290, address_low + i,
-				       (u8)(value >> (i * 8)));
-		if (ret) {
-			dev_err(imx290->dev, "Error writing buffered registers\n");
-			return ret;
-		}
-	}
-
-	ret = imx290_write_reg(imx290, IMX290_REGHOLD, 0x00);
-	if (ret) {
-		dev_err(imx290->dev, "Error setting hold register\n");
-		return ret;
-	}
-
-	return ret;
-}
-
 static int imx290_set_gain(struct imx290 *imx290, u32 value)
 {
 	int ret;
 
-	ret = imx290_write_buffered_reg(imx290, IMX290_GAIN, 1, value);
+	ret = imx290_write_reg(imx290, IMX290_GAIN, value);
 	if (ret)
 		dev_err(imx290->dev, "Unable to write gain\n");
 
-- 
Regards,

Laurent Pinchart

