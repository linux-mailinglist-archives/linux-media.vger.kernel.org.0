Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A219D3EE6EB
	for <lists+linux-media@lfdr.de>; Tue, 17 Aug 2021 08:57:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234491AbhHQG5z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Aug 2021 02:57:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230094AbhHQG5z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Aug 2021 02:57:55 -0400
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.eu [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5BFDC061764
        for <linux-media@vger.kernel.org>; Mon, 16 Aug 2021 23:57:22 -0700 (PDT)
Received: from lanttu.localdomain (unknown [192.168.2.193])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id F196F634C87
        for <linux-media@vger.kernel.org>; Tue, 17 Aug 2021 09:55:09 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 1/1] imx258: Fix getting clock frequency
Date:   Tue, 17 Aug 2021 09:57:18 +0300
Message-Id: <20210817065718.25458-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Obtain the clock frequency by reading the clock-frequency property if
there's no clock.

Fixes: 9fda25332c4b ("media: i2c: imx258: get clock from device properties and enable it via runtime PM")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/imx258.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index 81cdf37216ca..c249507aa2db 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -1260,18 +1260,18 @@ static int imx258_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	imx258->clk = devm_clk_get_optional(&client->dev, NULL);
+	if (IS_ERR(imx258->clk))
+		return dev_err_probe(&client->dev, PTR_ERR(imx258->clk),
+				     "error getting clock\n");
 	if (!imx258->clk) {
 		dev_dbg(&client->dev,
 			"no clock provided, using clock-frequency property\n");
 
 		device_property_read_u32(&client->dev, "clock-frequency", &val);
-		if (val != IMX258_INPUT_CLOCK_FREQ)
-			return -EINVAL;
-	} else if (IS_ERR(imx258->clk)) {
-		return dev_err_probe(&client->dev, PTR_ERR(imx258->clk),
-				     "error getting clock\n");
+	} else {
+		val = clk_get_rate(imx258->clk);
 	}
-	if (clk_get_rate(imx258->clk) != IMX258_INPUT_CLOCK_FREQ) {
+	if (val != IMX258_INPUT_CLOCK_FREQ) {
 		dev_err(&client->dev, "input clock frequency not supported\n");
 		return -EINVAL;
 	}
-- 
2.30.2

