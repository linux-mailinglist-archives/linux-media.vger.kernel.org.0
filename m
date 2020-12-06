Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 767CF2D0650
	for <lists+linux-media@lfdr.de>; Sun,  6 Dec 2020 18:33:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726609AbgLFRdK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 6 Dec 2020 12:33:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726043AbgLFRdJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 6 Dec 2020 12:33:09 -0500
X-Greylist: delayed 140 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 06 Dec 2020 09:32:23 PST
Received: from mxf1.seznam.cz (mxf1.seznam.cz [IPv6:2a02:598:a::78:123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77C82C0613D0;
        Sun,  6 Dec 2020 09:32:23 -0800 (PST)
Received: from email.seznam.cz
        by email-smtpc5a.ko.seznam.cz (email-smtpc5a.ko.seznam.cz [10.53.10.135])
        id 106cc2ff4b62969611c50ea1;
        Sun, 06 Dec 2020 18:32:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz; s=beta;
        t=1607275937; bh=ybBRjPqU6rJbV5rjROFU6Aw8Yi20t5tZm3wNoJxhQoU=;
        h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
         Content-Transfer-Encoding;
        b=UWGhzRdJPHGR3/P9RoJDSqU1TyYJqqisjVTgyrWRCtrOAYW0yue/mJik3DwkMmlNz
         H11Y1Dt/6Iql2qXtGnMwVVCei3r+eCCM7AGmZTCYefc5TL5qz4iUuYtvvb/Ru21kqa
         YkR0vFz/AlIP5WN8Xi8tEJ7yfFyIqhvzW1M99uvE=
Received: from localhost.localdomain (ip-228-128.dynamic.ccinternet.cz [212.69.128.228])
        by email-relay23.ko.seznam.cz (Seznam SMTPD 1.3.122) with ESMTP;
        Sun, 06 Dec 2020 18:29:46 +0100 (CET)  
From:   michael.srba@seznam.cz
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Michael Srba <Michael.Srba@seznam.cz>
Subject: [PATCH v2 1/3] media: i2c: imx219: add support for specifying clock-frequencies
Date:   Sun,  6 Dec 2020 18:27:18 +0100
Message-Id: <20201206172720.9406-1-michael.srba@seznam.cz>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Michael Srba <Michael.Srba@seznam.cz>

This patch adds 1% tolerance on input clock, similar to other camera sensor
drivers. It also allows for specifying the actual clock in the device tree,
instead of relying on it being already set to the right frequency (which is
often not the case).

Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>

---

changes since v1: default to exactly 24MHz when `clock-frequency` is not present

---
 drivers/media/i2c/imx219.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index f64c0ef7a897..b6500e2ab19e 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -1443,13 +1443,28 @@ static int imx219_probe(struct i2c_client *client)
 		return PTR_ERR(imx219->xclk);
 	}
 
-	imx219->xclk_freq = clk_get_rate(imx219->xclk);
-	if (imx219->xclk_freq != IMX219_XCLK_FREQ) {
+	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency", &imx219->xclk_freq);
+	if (ret) {
+		dev_warn(dev, "could not get xclk frequency\n");
+
+		/* default to 24MHz */
+		imx219->xclk_freq = 24000000;
+	}
+
+	/* this driver currently expects 24MHz; allow 1% tolerance */
+	if (imx219->xclk_freq < 23760000 || imx219->xclk_freq > 24240000) {
 		dev_err(dev, "xclk frequency not supported: %d Hz\n",
 			imx219->xclk_freq);
 		return -EINVAL;
 	}
 
+	ret = clk_set_rate(imx219->xclk, imx219->xclk_freq);
+	if (ret) {
+		dev_err(dev, "could not set xclk frequency\n");
+		return ret;
+	}
+
+
 	ret = imx219_get_regulators(imx219);
 	if (ret) {
 		dev_err(dev, "failed to get regulators\n");
-- 
2.29.2

