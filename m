Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7791143F11
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2019 17:55:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726838AbfFMPyk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jun 2019 11:54:40 -0400
Received: from sauhun.de ([88.99.104.3]:41930 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390084AbfFMPy0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jun 2019 11:54:26 -0400
Received: from localhost (p5486CF99.dip0.t-ipconnect.de [84.134.207.153])
        by pokefinder.org (Postfix) with ESMTPSA id DDE0F4A129C;
        Thu, 13 Jun 2019 17:54:24 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Antti Palosaari <crope@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] media: mn88472: don't check retval after our own assignemt
Date:   Thu, 13 Jun 2019 17:54:18 +0200
Message-Id: <20190613155421.16408-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190613155421.16408-1-wsa+renesas@sang-engineering.com>
References: <20190613155421.16408-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

No need to check a retval after we assigned a constant to it.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/media/dvb-frontends/mn88472.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/dvb-frontends/mn88472.c b/drivers/media/dvb-frontends/mn88472.c
index 731b44b9b74c..0a4d0d5fb4b6 100644
--- a/drivers/media/dvb-frontends/mn88472.c
+++ b/drivers/media/dvb-frontends/mn88472.c
@@ -616,8 +616,7 @@ static int mn88472_probe(struct i2c_client *client,
 	if (!dev->client[1]) {
 		ret = -ENODEV;
 		dev_err(&client->dev, "I2C registration failed\n");
-		if (ret)
-			goto err_regmap_0_regmap_exit;
+		goto err_regmap_0_regmap_exit;
 	}
 	dev->regmap[1] = regmap_init_i2c(dev->client[1], &regmap_config);
 	if (IS_ERR(dev->regmap[1])) {
@@ -630,8 +629,7 @@ static int mn88472_probe(struct i2c_client *client,
 	if (!dev->client[2]) {
 		ret = -ENODEV;
 		dev_err(&client->dev, "2nd I2C registration failed\n");
-		if (ret)
-			goto err_regmap_1_regmap_exit;
+		goto err_regmap_1_regmap_exit;
 	}
 	dev->regmap[2] = regmap_init_i2c(dev->client[2], &regmap_config);
 	if (IS_ERR(dev->regmap[2])) {
-- 
2.20.1

