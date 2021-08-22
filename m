Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6841E3F3EE6
	for <lists+linux-media@lfdr.de>; Sun, 22 Aug 2021 11:48:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233109AbhHVJsw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 22 Aug 2021 05:48:52 -0400
Received: from mail.ispras.ru ([83.149.199.84]:51054 "EHLO mail.ispras.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229719AbhHVJsw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 22 Aug 2021 05:48:52 -0400
Received: from hellwig.intra.ispras.ru (unknown [10.10.2.182])
        by mail.ispras.ru (Postfix) with ESMTPS id D672E40A2BA0;
        Sun, 22 Aug 2021 09:48:05 +0000 (UTC)
From:   Evgeny Novikov <novikov@ispras.ru>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Evgeny Novikov <novikov@ispras.ru>,
        Katsuhiro Suzuki <suzuki.katsuhiro@socionext.com>,
        Kirill Shilimanov <kirill.shilimanov@huawei.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        ldv-project@linuxtesting.org
Subject: [PATCH] media: dvb-frontends: mn88443x: Handle errors of clk_prepare_enable()
Date:   Sun, 22 Aug 2021 12:48:03 +0300
Message-Id: <20210822094803.20501-1-novikov@ispras.ru>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

mn88443x_cmn_power_on() did not handle possible errors of
clk_prepare_enable() and always finished successfully so that its caller
mn88443x_probe() did not care about failed preparing/enabling of clocks
as well.

Add missed error handling in both mn88443x_cmn_power_on() and
mn88443x_probe(). This required to change the return value of the former
from "void" to "int".

Found by Linux Driver Verification project (linuxtesting.org).

Fixes: 0f408ce8941f ("media: dvb-frontends: add Socionext MN88443x ISDB-S/T demodulator driver")
Signed-off-by: Evgeny Novikov <novikov@ispras.ru>
Co-developed-by: Kirill Shilimanov <kirill.shilimanov@huawei.com>
Signed-off-by: Kirill Shilimanov <kirill.shilimanov@huawei.com>
---
 drivers/media/dvb-frontends/mn88443x.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/media/dvb-frontends/mn88443x.c b/drivers/media/dvb-frontends/mn88443x.c
index e4528784f847..fff212c0bf3b 100644
--- a/drivers/media/dvb-frontends/mn88443x.c
+++ b/drivers/media/dvb-frontends/mn88443x.c
@@ -204,11 +204,18 @@ struct mn88443x_priv {
 	struct regmap *regmap_t;
 };
 
-static void mn88443x_cmn_power_on(struct mn88443x_priv *chip)
+static int mn88443x_cmn_power_on(struct mn88443x_priv *chip)
 {
+	struct device *dev = &chip->client_s->dev;
 	struct regmap *r_t = chip->regmap_t;
+	int ret;
 
-	clk_prepare_enable(chip->mclk);
+	ret = clk_prepare_enable(chip->mclk);
+	if (ret) {
+		dev_err(dev, "Failed to prepare and enable mclk: %d\n",
+			ret);
+		return ret;
+	}
 
 	gpiod_set_value_cansleep(chip->reset_gpio, 1);
 	usleep_range(100, 1000);
@@ -222,6 +229,8 @@ static void mn88443x_cmn_power_on(struct mn88443x_priv *chip)
 	} else {
 		regmap_write(r_t, HIZSET3, 0x8f);
 	}
+
+	return 0;
 }
 
 static void mn88443x_cmn_power_off(struct mn88443x_priv *chip)
@@ -738,7 +747,10 @@ static int mn88443x_probe(struct i2c_client *client,
 	chip->fe.demodulator_priv = chip;
 	i2c_set_clientdata(client, chip);
 
-	mn88443x_cmn_power_on(chip);
+	ret = mn88443x_cmn_power_on(chip);
+	if (ret)
+		goto err_i2c_t;
+
 	mn88443x_s_sleep(chip);
 	mn88443x_t_sleep(chip);
 
-- 
2.26.2

