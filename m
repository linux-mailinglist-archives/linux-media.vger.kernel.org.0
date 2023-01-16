Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C2DE66C2F8
	for <lists+linux-media@lfdr.de>; Mon, 16 Jan 2023 15:56:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232817AbjAPO4p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Jan 2023 09:56:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231562AbjAPO4M (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Jan 2023 09:56:12 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9555222DCD
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 06:45:18 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6EF1F18D7;
        Mon, 16 Jan 2023 15:45:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673880316;
        bh=m2ZN94ifHW8JD6k3IDffnI8FozK8zvvFG4WWASpDBPQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=u6ot23OPNyb4iSEHgQv2Ie7CrJe/pg2m/I6w+9oQjhsnbLCBcpGEVBDzVt5Az55f4
         wKZITL0QIEXNTnkbFV4sTY+nAh/5pge2pi0hTeBm0YifmHYvWkk5cx9CjwJ6ubbtjH
         1gpnt66i71gPdLighVEUziy+JPp5BQ3uYdCFb61E=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v3 16/17] media: i2c: imx290: Simplify imx290_set_data_lanes()
Date:   Mon, 16 Jan 2023 16:44:53 +0200
Message-Id: <20230116144454.1012-17-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.38.2
In-Reply-To: <20230116144454.1012-1-laurent.pinchart@ideasonboard.com>
References: <20230116144454.1012-1-laurent.pinchart@ideasonboard.com>
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
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/media/i2c/imx290.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 34278d098218..bb8713813e29 100644
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

