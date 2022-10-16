Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D55C65FFD84
	for <lists+linux-media@lfdr.de>; Sun, 16 Oct 2022 08:16:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229788AbiJPGQR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Oct 2022 02:16:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229792AbiJPGQQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Oct 2022 02:16:16 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08D5F3ED72
        for <linux-media@vger.kernel.org>; Sat, 15 Oct 2022 23:16:15 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 49CBD1BA7;
        Sun, 16 Oct 2022 08:16:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1665900973;
        bh=/btbO5MwJjMeeNnaDFUcpLNnbLMugjRkeioKw5PSEs4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=R3U28ntGSWMkq+bf8/wrvhhOmkv1VWjKFTt1m95kUMaIGmdsychsESlbzxYBEeAk9
         lj9tRJlB9QllP4SBM9sx5BRyzosXf6yHKqSTYRx3Tf4iEwj78Jlnh9E532RZJGCwP0
         mATylbJGp23OTWhqjxL5J2NEgV2/MVzeuV+h2XZ4=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 17/20] media: i2c: imx290: Move registers with fixed value to init array
Date:   Sun, 16 Oct 2022 09:15:20 +0300
Message-Id: <20221016061523.30127-18-laurent.pinchart@ideasonboard.com>
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

Registers 0x3012, 0x3013 and 0x3480 are not documented and are set in
the per-mode register arrays with values indentical for all modes. Move
them to the common array.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx290.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 93eab6c96ca0..0b34d60f8ce2 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -192,6 +192,7 @@ static const struct imx290_regval imx290_global_init_settings[] = {
 	{ IMX290_REG_8BIT(0x300f), 0x00 },
 	{ IMX290_REG_8BIT(0x3010), 0x21 },
 	{ IMX290_REG_8BIT(0x3012), 0x64 },
+	{ IMX290_REG_8BIT(0x3013), 0x00 },
 	{ IMX290_REG_8BIT(0x3016), 0x09 },
 	{ IMX290_REG_8BIT(0x3070), 0x02 },
 	{ IMX290_REG_8BIT(0x3071), 0x11 },
@@ -230,6 +231,7 @@ static const struct imx290_regval imx290_global_init_settings[] = {
 	{ IMX290_REG_8BIT(0x33b0), 0x50 },
 	{ IMX290_REG_8BIT(0x33b2), 0x1a },
 	{ IMX290_REG_8BIT(0x33b3), 0x04 },
+	{ IMX290_REG_8BIT(0x3480), 0x49 },
 };
 
 static const struct imx290_regval imx290_1080p_settings[] = {
@@ -239,15 +241,12 @@ static const struct imx290_regval imx290_1080p_settings[] = {
 	{ IMX290_OPB_SIZE_V, 10 },
 	{ IMX290_X_OUT_SIZE, 1920 },
 	{ IMX290_Y_OUT_SIZE, 1080 },
-	{ IMX290_REG_8BIT(0x3012), 0x64 },
-	{ IMX290_REG_8BIT(0x3013), 0x00 },
 	{ IMX290_INCKSEL1, 0x18 },
 	{ IMX290_INCKSEL2, 0x03 },
 	{ IMX290_INCKSEL3, 0x20 },
 	{ IMX290_INCKSEL4, 0x01 },
 	{ IMX290_INCKSEL5, 0x1a },
 	{ IMX290_INCKSEL6, 0x1a },
-	{ IMX290_REG_8BIT(0x3480), 0x49 },
 	/* data rate settings */
 	{ IMX290_REPETITION, 0x10 },
 	{ IMX290_TCLKPOST, 87 },
@@ -267,15 +266,12 @@ static const struct imx290_regval imx290_720p_settings[] = {
 	{ IMX290_OPB_SIZE_V, 4 },
 	{ IMX290_X_OUT_SIZE, 1280 },
 	{ IMX290_Y_OUT_SIZE, 720 },
-	{ IMX290_REG_8BIT(0x3012), 0x64 },
-	{ IMX290_REG_8BIT(0x3013), 0x00 },
 	{ IMX290_INCKSEL1, 0x20 },
 	{ IMX290_INCKSEL2, 0x00 },
 	{ IMX290_INCKSEL3, 0x20 },
 	{ IMX290_INCKSEL4, 0x01 },
 	{ IMX290_INCKSEL5, 0x1a },
 	{ IMX290_INCKSEL6, 0x1a },
-	{ IMX290_REG_8BIT(0x3480), 0x49 },
 	/* data rate settings */
 	{ IMX290_REPETITION, 0x10 },
 	{ IMX290_TCLKPOST, 79 },
-- 
Regards,

Laurent Pinchart

