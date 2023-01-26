Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CEA4967D7CA
	for <lists+linux-media@lfdr.de>; Thu, 26 Jan 2023 22:34:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232997AbjAZVez (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 16:34:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233028AbjAZVex (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 16:34:53 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2A2913E
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 13:34:52 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 351B92B3;
        Thu, 26 Jan 2023 22:34:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674768891;
        bh=+dPFE7U6/WzAOSvzpcq8tfC9al1H1McZFSTdZgZ9B3g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WqB6KqsHHPta9Pz8A+60Ku68nCDvwrqakFJ6pUYkg91SVgdeVki14yg50FbjXWSlP
         T8OB2e0N/elzIOopMEE32LIcCIjPQsR1wIs6Pzl7aVWG2tTS2d5VlrbhgD5oszVZ2g
         iIv03KY9cYSOL4h264KfNGPH0OVj1pynYLMvnzgs=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Adam Ford <aford173@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com
Subject: [PATCH v1 2/5] media: imx-mipi-csis: Don't take lock in runtime PM handlers
Date:   Thu, 26 Jan 2023 23:34:34 +0200
Message-Id: <20230126213437.20796-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126213437.20796-1-laurent.pinchart@ideasonboard.com>
References: <20230126213437.20796-1-laurent.pinchart@ideasonboard.com>
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

The runtime PM handlers don't need manual locking as

- they are serialized by the runtime PM core
- they can't race with other functions taking the same lock, as they
  don't access any data protect by that lock

Drop the locking.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 28 +++++++++-------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index d949b2de8e74..4e1363ff5646 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -1348,40 +1348,34 @@ static int __maybe_unused mipi_csis_runtime_suspend(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
-	int ret = 0;
-
-	mutex_lock(&csis->lock);
+	int ret;
 
 	ret = mipi_csis_phy_disable(csis);
 	if (ret)
-		goto unlock;
+		return -EAGAIN;
 
 	mipi_csis_clk_disable(csis);
 
-unlock:
-	mutex_unlock(&csis->lock);
-
-	return ret ? -EAGAIN : 0;
+	return 0;
 }
 
 static int __maybe_unused mipi_csis_runtime_resume(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
-	int ret = 0;
-
-	mutex_lock(&csis->lock);
+	int ret;
 
 	ret = mipi_csis_phy_enable(csis);
 	if (ret)
-		goto unlock;
+		return -EAGAIN;
 
-	mipi_csis_clk_enable(csis);
+	ret = mipi_csis_clk_enable(csis);
+	if (ret) {
+		mipi_csis_phy_disable(csis);
+		return ret;
+	}
 
-unlock:
-	mutex_unlock(&csis->lock);
-
-	return ret ? -EAGAIN : 0;
+	return 0;
 }
 
 static const struct dev_pm_ops mipi_csis_pm_ops = {
-- 
Regards,

Laurent Pinchart

