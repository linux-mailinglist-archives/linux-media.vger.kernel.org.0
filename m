Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D5FA634A1A
	for <lists+linux-media@lfdr.de>; Tue, 22 Nov 2022 23:35:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235104AbiKVWda (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Nov 2022 17:33:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235216AbiKVWd3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Nov 2022 17:33:29 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9BC09DBA6
        for <linux-media@vger.kernel.org>; Tue, 22 Nov 2022 14:33:28 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 682611381;
        Tue, 22 Nov 2022 23:33:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669156407;
        bh=c3ggw/yTbh55ye89FplO8fY9/IYd+XC5xzEpZnLCh9U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nThI42J4L+oBfZwRI1fD1BIvc7C65MOdlZsLYfXmT6ltKqG6gmydWXMj8OGg2PfiH
         0USoqn/KFl/Be5d4yYPDiSLPSDOEAzBtVZIt+o+FANQ4iXcY5/ufifD/mdlg8jc2Xe
         6PulN84x8tF0VLrYiiDZvisyhmbnTcd1Cya7baCI=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH v1 15/15] media: i2c: imx290: Simplify imx290_set_data_lanes()
Date:   Wed, 23 Nov 2022 00:32:50 +0200
Message-Id: <20221122223250.21233-16-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221122223250.21233-1-laurent.pinchart@ideasonboard.com>
References: <20221122223250.21233-1-laurent.pinchart@ideasonboard.com>
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
index 4dfa090f918d..369db35a7afd 100644
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

