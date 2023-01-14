Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5469B66AD02
	for <lists+linux-media@lfdr.de>; Sat, 14 Jan 2023 18:18:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230359AbjANRSb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 14 Jan 2023 12:18:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230357AbjANRS1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 14 Jan 2023 12:18:27 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12C1EA5F9
        for <linux-media@vger.kernel.org>; Sat, 14 Jan 2023 09:18:25 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9853A189A;
        Sat, 14 Jan 2023 18:18:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673716703;
        bh=Fhh0ht2B/HJW06lVcP/Vedvq7XJEdfwLgS50Pse6Tp8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WC9JWctPC8m1Z81hWaMHn6WbQr9lJ0roVVywfoxiBb2oASSlPtLz01Cc9JQcvFBks
         U01oBEyIL3WEG58p9zXt0skhEZKAqm8H+WYSVU0HkOhqYkoYYoMkCdLlgSI/6KKWLn
         NgwIxAvdUbGW6+pH5yS1QjaiMXLM/CEPBK8RKyKk=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 16/17] media: i2c: imx290: Simplify imx290_set_data_lanes()
Date:   Sat, 14 Jan 2023 19:18:01 +0200
Message-Id: <20230114171802.13878-16-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.38.2
In-Reply-To: <20230114171802.13878-1-laurent.pinchart@ideasonboard.com>
References: <20230114171727.13830-1-laurent.pinchart@ideasonboard.com>
 <20230114171802.13878-1-laurent.pinchart@ideasonboard.com>
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

There's no need to check for an incorrect number of data lanes in
imx290_set_data_lanes() as the value is validated at probe() time. Drop
the check.

The PHY_LANE_NUM and CSI_LANE_MODE registers are programmed with a value
equal to the number of lanes minus one. Compute it instead of handling
it in the switch/case.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx290.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 67a2edd38e91..a8167119534b 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -512,28 +512,21 @@ static int imx290_set_register_array(struct imx290 *imx290,
 
 static int imx290_set_data_lanes(struct imx290 *imx290)
 {
-	int ret = 0, laneval, frsel;
+	int ret = 0;
+	u32 frsel;
 
 	switch (imx290->nlanes) {
 	case 2:
-		laneval = 0x01;
+	default:
 		frsel = 0x02;
 		break;
 	case 4:
-		laneval = 0x03;
 		frsel = 0x01;
 		break;
-	default:
-		/*
-		 * We should never hit this since the data lane count is
-		 * validated in probe itself
-		 */
-		dev_err(imx290->dev, "Lane configuration not supported\n");
-		return -EINVAL;
 	}
 
-	imx290_write(imx290, IMX290_PHY_LANE_NUM, laneval, &ret);
-	imx290_write(imx290, IMX290_CSI_LANE_MODE, laneval, &ret);
+	imx290_write(imx290, IMX290_PHY_LANE_NUM, imx290->nlanes - 1, &ret);
+	imx290_write(imx290, IMX290_CSI_LANE_MODE, imx290->nlanes - 1, &ret);
 	imx290_write(imx290, IMX290_FR_FDG_SEL, frsel, &ret);
 
 	return ret;
-- 
Regards,

Laurent Pinchart

