Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 072992DC11B
	for <lists+linux-media@lfdr.de>; Wed, 16 Dec 2020 14:21:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726294AbgLPNVJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Dec 2020 08:21:09 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:9895 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbgLPNVI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Dec 2020 08:21:08 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Cwwhg0fgHz7DyD;
        Wed, 16 Dec 2020 21:19:47 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Wed, 16 Dec 2020 21:20:17 +0800
From:   Zheng Yongjun <zhengyongjun3@huawei.com>
To:     <crope@iki.fi>, <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: [PATCH -next] media: dvb-frontends: convert comma to semicolon
Date:   Wed, 16 Dec 2020 21:20:47 +0800
Message-ID: <20201216132047.15044-1-zhengyongjun3@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.138.68]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Replace a comma between expression statements by a semicolon.

Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
---
 drivers/media/dvb-frontends/m88ds3103.c |  2 +-
 drivers/media/dvb-frontends/rtl2832.c   | 14 +++++++-------
 drivers/media/dvb-frontends/ts2020.c    | 10 +++++-----
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/media/dvb-frontends/m88ds3103.c b/drivers/media/dvb-frontends/m88ds3103.c
index ad6d9d564a87..bde0ea64a89b 100644
--- a/drivers/media/dvb-frontends/m88ds3103.c
+++ b/drivers/media/dvb-frontends/m88ds3103.c
@@ -1795,7 +1795,7 @@ static int m88ds3103_probe(struct i2c_client *client,
 	/* create regmap */
 	dev->regmap_config.reg_bits = 8,
 	dev->regmap_config.val_bits = 8,
-	dev->regmap_config.lock_arg = dev,
+	dev->regmap_config.lock_arg = dev;
 	dev->regmap = devm_regmap_init_i2c(client, &dev->regmap_config);
 	if (IS_ERR(dev->regmap)) {
 		ret = PTR_ERR(dev->regmap);
diff --git a/drivers/media/dvb-frontends/rtl2832.c b/drivers/media/dvb-frontends/rtl2832.c
index e5bffaaeed38..01dcc7f1b9b2 100644
--- a/drivers/media/dvb-frontends/rtl2832.c
+++ b/drivers/media/dvb-frontends/rtl2832.c
@@ -1056,13 +1056,13 @@ static int rtl2832_probe(struct i2c_client *client,
 	dev->sleeping = true;
 	INIT_DELAYED_WORK(&dev->i2c_gate_work, rtl2832_i2c_gate_work);
 	/* create regmap */
-	dev->regmap_config.reg_bits =  8,
-	dev->regmap_config.val_bits =  8,
-	dev->regmap_config.volatile_reg = rtl2832_volatile_reg,
-	dev->regmap_config.max_register = 5 * 0x100,
-	dev->regmap_config.ranges = regmap_range_cfg,
-	dev->regmap_config.num_ranges = ARRAY_SIZE(regmap_range_cfg),
-	dev->regmap_config.cache_type = REGCACHE_NONE,
+	dev->regmap_config.reg_bits =  8;
+	dev->regmap_config.val_bits =  8;
+	dev->regmap_config.volatile_reg = rtl2832_volatile_reg;
+	dev->regmap_config.max_register = 5 * 0x100;
+	dev->regmap_config.ranges = regmap_range_cfg;
+	dev->regmap_config.num_ranges = ARRAY_SIZE(regmap_range_cfg);
+	dev->regmap_config.cache_type = REGCACHE_NONE;
 	dev->regmap = regmap_init_i2c(client, &dev->regmap_config);
 	if (IS_ERR(dev->regmap)) {
 		ret = PTR_ERR(dev->regmap);
diff --git a/drivers/media/dvb-frontends/ts2020.c b/drivers/media/dvb-frontends/ts2020.c
index 234607b02edb..3e383912bcfd 100644
--- a/drivers/media/dvb-frontends/ts2020.c
+++ b/drivers/media/dvb-frontends/ts2020.c
@@ -569,11 +569,11 @@ static int ts2020_probe(struct i2c_client *client,
 
 	/* create regmap */
 	mutex_init(&dev->regmap_mutex);
-	dev->regmap_config.reg_bits = 8,
-	dev->regmap_config.val_bits = 8,
-	dev->regmap_config.lock = ts2020_regmap_lock,
-	dev->regmap_config.unlock = ts2020_regmap_unlock,
-	dev->regmap_config.lock_arg = dev,
+	dev->regmap_config.reg_bits = 8;
+	dev->regmap_config.val_bits = 8;
+	dev->regmap_config.lock = ts2020_regmap_lock;
+	dev->regmap_config.unlock = ts2020_regmap_unlock;
+	dev->regmap_config.lock_arg = dev;
 	dev->regmap = regmap_init_i2c(client, &dev->regmap_config);
 	if (IS_ERR(dev->regmap)) {
 		ret = PTR_ERR(dev->regmap);
-- 
2.22.0

