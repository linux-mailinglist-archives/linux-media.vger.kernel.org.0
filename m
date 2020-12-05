Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94E822CFD9D
	for <lists+linux-media@lfdr.de>; Sat,  5 Dec 2020 19:53:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726134AbgLESkM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 5 Dec 2020 13:40:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726485AbgLESkE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 5 Dec 2020 13:40:04 -0500
Received: from mxf2.seznam.cz (mxf2.seznam.cz [IPv6:2a02:598:2::123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F25D5C0613D1;
        Sat,  5 Dec 2020 10:39:18 -0800 (PST)
Received: from email.seznam.cz
        by email-smtpc17b.ng.seznam.cz (email-smtpc17b.ng.seznam.cz [10.23.18.19])
        id 506e15c20b6041ab51c7d99c;
        Sat, 05 Dec 2020 19:39:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz; s=beta;
        t=1607193555; bh=kRxnW5M8mG/e0b0s9X4Em61KuMk0/r6ktKJxpd0JWZQ=;
        h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
         Content-Transfer-Encoding;
        b=LA0q95CeBdFL7MnrFKJxWauD6+Vc+4jghVP5uRC00FAslPT9rkpORmrA3qq3mEeO3
         Ipz7deGlXZ4Ugwoo2I4igEOT0qlzDnfAgibxWCN9bSvetSbu6suDbzL/SNUsB2x5P5
         ko1o6fSFzWQOVJ3EajfD3tHbHmFPAHLU5NEthKyk=
Received: from localhost.localdomain (ip-228-128.dynamic.ccinternet.cz [212.69.128.228])
        by email-relay3.ng.seznam.cz (Seznam SMTPD 1.3.122) with ESMTP;
        Sat, 05 Dec 2020 19:36:21 +0100 (CET)  
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
Subject: [PATCH 1/3] media: i2c: imx219: add support for specifying clock-frequencies
Date:   Sat,  5 Dec 2020 19:33:53 +0100
Message-Id: <20201205183355.6488-1-michael.srba@seznam.cz>
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
 drivers/media/i2c/imx219.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index f64c0ef7a897..a8f05562d0af 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -1443,13 +1443,26 @@ static int imx219_probe(struct i2c_client *client)
 		return PTR_ERR(imx219->xclk);
 	}
 
-	imx219->xclk_freq = clk_get_rate(imx219->xclk);
-	if (imx219->xclk_freq != IMX219_XCLK_FREQ) {
+	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency", &imx219->xclk_freq);
+	if (ret) {
+		dev_err(dev, "could not get xclk frequency\n");
+		return ret;
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

