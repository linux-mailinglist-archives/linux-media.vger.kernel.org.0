Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C531257C656
	for <lists+linux-media@lfdr.de>; Thu, 21 Jul 2022 10:35:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230506AbiGUIfs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jul 2022 04:35:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229780AbiGUIfr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jul 2022 04:35:47 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2B8112AA2
        for <linux-media@vger.kernel.org>; Thu, 21 Jul 2022 01:35:46 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2DC498D0;
        Thu, 21 Jul 2022 10:35:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1658392545;
        bh=pr740Y17j8oM0gpGqXnfkdAMKrUsEH2IaEQO02DeynA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nxasu7jZGfcGh5FNkJ+vpv+r/gOPyi1fNpPNbM8GzlmCXQRbswQ9+Rd1lzfcfEWOg
         yWRZ32NkJsksI+6nl0HoUrXcFDrjIJemKrBDYcbPAj58M4U1DoLazRyUvf/eItnzGQ
         nOS4dqmscIwAnN/HMiM5Gui801k192uoQ2/8o57g=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH 02/19] media: i2c: imx290: Print error code when I2C transfer fails
Date:   Thu, 21 Jul 2022 11:35:23 +0300
Message-Id: <20220721083540.1525-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220721083540.1525-1-laurent.pinchart@ideasonboard.com>
References: <20220721083540.1525-1-laurent.pinchart@ideasonboard.com>
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

Knowing why I2C transfers fail is useful for debugging. Extend the error
message to print the error code.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx290.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index d97a5fb1d501..64bd43813dbf 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -370,7 +370,8 @@ static inline int __always_unused imx290_read_reg(struct imx290 *imx290, u16 add
 
 	ret = regmap_read(imx290->regmap, addr, &regval);
 	if (ret) {
-		dev_err(imx290->dev, "I2C read failed for addr: %x\n", addr);
+		dev_err(imx290->dev, "Failed to read register 0x%04x: %d\n",
+			addr, ret);
 		return ret;
 	}
 
@@ -385,7 +386,8 @@ static int imx290_write_reg(struct imx290 *imx290, u16 addr, u8 value)
 
 	ret = regmap_write(imx290->regmap, addr, value);
 	if (ret) {
-		dev_err(imx290->dev, "I2C write failed for addr: %x\n", addr);
+		dev_err(imx290->dev, "Failed to write register 0x%04x: %d\n",
+			addr, ret);
 		return ret;
 	}
 
-- 
Regards,

Laurent Pinchart

