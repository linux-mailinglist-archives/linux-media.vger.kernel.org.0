Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D17235D547
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 04:31:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343549AbhDMCbi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 22:31:38 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35890 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245746AbhDMCbi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 22:31:38 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7A86E8B7;
        Tue, 13 Apr 2021 04:31:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618281078;
        bh=Phel+1/fyT59zVDyiz2gboN8kRwtYXf6K/lP5c0phTY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SGt9uzvgRyE5AqKwkd6XDBi0a9T8tp5GtWz5N9xA1zbotgz4CkBTgEx1B1DikZUtX
         2cOvphM6/ZsPNFCzFDH045e3F5T+3IV7zsaPIQZbUNT2n3pVws87BcixKB10XXY3ee
         4qq+jWAlxKSVsxClCTVtOZFPawqAlyyiO8IMUXuY=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Marek Vasut <marex@denx.de>
Subject: [PATCH 14/23] media: imx: imx7_mipi_csis: Turn csi_state irq field into local variable
Date:   Tue, 13 Apr 2021 05:30:05 +0300
Message-Id: <20210413023014.28797-15-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
In-Reply-To: <20210413023014.28797-1-laurent.pinchart@ideasonboard.com>
References: <20210413023014.28797-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The irq field of the csi_state structure is only used in
mipi_csis_probe(). Turn it into a local variable.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 49b8afc0f2f8..0b164436117c 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -305,7 +305,6 @@ struct csi_state {
 	u8 index;
 	struct platform_device *pdev;
 	void __iomem *regs;
-	int irq;
 	u32 state;
 
 	struct dentry *debugfs_root;
@@ -1305,6 +1304,7 @@ static int mipi_csis_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct csi_state *state;
+	int irq;
 	int ret;
 
 	state = devm_kzalloc(dev, sizeof(*state), GFP_KERNEL);
@@ -1332,9 +1332,9 @@ static int mipi_csis_probe(struct platform_device *pdev)
 	if (IS_ERR(state->regs))
 		return PTR_ERR(state->regs);
 
-	state->irq = platform_get_irq(pdev, 0);
-	if (state->irq < 0)
-		return state->irq;
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
 
 	ret = mipi_csis_clk_get(state);
 	if (ret < 0)
@@ -1346,8 +1346,8 @@ static int mipi_csis_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = devm_request_irq(dev, state->irq, mipi_csis_irq_handler,
-			       0, dev_name(dev), state);
+	ret = devm_request_irq(dev, irq, mipi_csis_irq_handler, 0,
+			       dev_name(dev), state);
 	if (ret) {
 		dev_err(dev, "Interrupt request failed\n");
 		goto disable_clock;
-- 
Regards,

Laurent Pinchart

