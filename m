Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 606ED2E53C
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 21:25:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726275AbfE2TZ0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 15:25:26 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:43340 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725917AbfE2TZ0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 15:25:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=/7EZhwLHY+DGeGNxH6v0BD8tLSICmemvF5hFKXnR8nQ=; b=hs+41Hhhl8/QfsMJJPekvGt63
        yPjMrAEIyQ3lzNhof2BRAf92ZzxfMhEWr1aaAoEVagnLBxJsJ+LE2tX2jxiU1b9yeupJ6+1IbFYDZ
        a4VahP5yWbKrBK29egJi5uX0RDcbadCJtCwugmMayRACOU1/oKhHOofH/CBOM49VYJUspN10Y+w0I
        oR5aarSbshrWL+M9pJXr7UCa0UAnunf3spyxIjc8op25nnQqz7qJS4Imgu2SjN3TkBKY+nFh0NFBK
        V0/ZlIPjPexk0VtWtSLDexTDEiBwJOWTgmQUjqdNvWPNofkhMPAbH1HhbduTjOR5zPILUdphd/bwj
        OSISqe08Q==;
Received: from 177.132.232.81.dynamic.adsl.gvt.net.br ([177.132.232.81] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hW4CR-0001V7-Hn; Wed, 29 May 2019 19:25:23 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hW4CO-0006H5-0r; Wed, 29 May 2019 15:25:20 -0400
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Akinobu Mita <akinobu.mita@gmail.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Michael Grzeschik <m.grzeschik@pengutronix.de>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH v2] media: mt9m111: add regulator support
Date:   Wed, 29 May 2019 15:25:18 -0400
Message-Id: <67b53f91ede9e9ffdda913c818065095a726b92e.1559157595.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Robert Jarzmik <robert.jarzmik@free.fr>

In the soc_camera removal, the board specific power callback was
dropped. This at least will remove the power optimization from ezx and
em-x270 pxa based boards.

As to recreate the same level of functionality, make the mt9m111 have a
regulator providing it its power, so that board designers can plug in a
gpio based or ldo regulator, mimicking their former soc_camera power
hook.

Fixes: 5c10113cc668 ("media: mt9m111: make a standalone v4l2 subdevice")

[mchehab+samsung@kernel.org: check return values for regulator_enable and
 fix a build warning]
Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---

This is a respin of this patch:

    http://patchwork.linuxtv.org/patch/37950/

rebased (and fixed) to apply on the top of upstream.

While checking old patches at the ML, I noticed that this patch
was never applied:

    https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1238720.html

 The first patch of this series got applied, though:

  c771f42fed7f ("[media] media: platform: pxa_camera: add missing sensor power on")

So, I'm closing the original patch as obsoleted and I'm sending this
one to the ML for tests.

Can anyone test this patch and send a tested-by?

 drivers/media/i2c/mt9m111.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/media/i2c/mt9m111.c b/drivers/media/i2c/mt9m111.c
index 5168bb5880c4..746d1345b505 100644
--- a/drivers/media/i2c/mt9m111.c
+++ b/drivers/media/i2c/mt9m111.c
@@ -13,6 +13,7 @@
 #include <linux/log2.h>
 #include <linux/gpio.h>
 #include <linux/delay.h>
+#include <linux/regulator/consumer.h>
 #include <linux/v4l2-mediabus.h>
 #include <linux/module.h>
 #include <linux/property.h>
@@ -243,6 +244,7 @@ struct mt9m111 {
 	int power_count;
 	const struct mt9m111_datafmt *fmt;
 	int lastpage;	/* PageMap cache value */
+	struct regulator *regulator;
 	bool is_streaming;
 	/* user point of view - 0: falling 1: rising edge */
 	unsigned int pclk_sample:1;
@@ -982,6 +984,12 @@ static int mt9m111_power_on(struct mt9m111 *mt9m111)
 	if (ret < 0)
 		return ret;
 
+	if (mt9m111->regulator) {
+		ret = regulator_enable(mt9m111->regulator);
+		if (ret < 0)
+			return ret;
+	}
+
 	ret = mt9m111_resume(mt9m111);
 	if (ret < 0) {
 		dev_err(&client->dev, "Failed to resume the sensor: %d\n", ret);
@@ -994,6 +1002,8 @@ static int mt9m111_power_on(struct mt9m111 *mt9m111)
 static void mt9m111_power_off(struct mt9m111 *mt9m111)
 {
 	mt9m111_suspend(mt9m111);
+	if (mt9m111->regulator)
+		regulator_disable(mt9m111->regulator);
 	v4l2_clk_disable(mt9m111->clk);
 }
 
@@ -1256,6 +1266,13 @@ static int mt9m111_probe(struct i2c_client *client,
 	if (IS_ERR(mt9m111->clk))
 		return PTR_ERR(mt9m111->clk);
 
+	mt9m111->regulator = devm_regulator_get(&client->dev, "vdd");
+	if (IS_ERR(mt9m111->regulator)) {
+		dev_err(&client->dev, "regulator not found: %ld\n",
+			PTR_ERR(mt9m111->regulator));
+		return PTR_ERR(mt9m111->regulator);
+	}
+
 	/* Default HIGHPOWER context */
 	mt9m111->ctx = &context_b;
 
-- 
2.21.0


