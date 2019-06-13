Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF75443F14
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2019 17:55:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387951AbfFMPyw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jun 2019 11:54:52 -0400
Received: from sauhun.de ([88.99.104.3]:41922 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390076AbfFMPy0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jun 2019 11:54:26 -0400
Received: from localhost (p5486CF99.dip0.t-ipconnect.de [84.134.207.153])
        by pokefinder.org (Postfix) with ESMTPSA id 4BA5D4A1290;
        Thu, 13 Jun 2019 17:54:24 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Antti Palosaari <crope@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] media: cxd2820r: don't check retval after our own assignemt
Date:   Thu, 13 Jun 2019 17:54:17 +0200
Message-Id: <20190613155421.16408-2-wsa+renesas@sang-engineering.com>
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
 drivers/media/dvb-frontends/cxd2820r_core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/dvb-frontends/cxd2820r_core.c b/drivers/media/dvb-frontends/cxd2820r_core.c
index 1f006f8e8cc2..99a186ddddb2 100644
--- a/drivers/media/dvb-frontends/cxd2820r_core.c
+++ b/drivers/media/dvb-frontends/cxd2820r_core.c
@@ -636,8 +636,7 @@ static int cxd2820r_probe(struct i2c_client *client,
 	if (!priv->client[1]) {
 		ret = -ENODEV;
 		dev_err(&client->dev, "I2C registration failed\n");
-		if (ret)
-			goto err_regmap_0_regmap_exit;
+		goto err_regmap_0_regmap_exit;
 	}
 
 	priv->regmap[1] = regmap_init_i2c(priv->client[1], &regmap_config1);
-- 
2.20.1

