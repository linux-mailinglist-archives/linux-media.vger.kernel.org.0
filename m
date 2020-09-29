Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5D4027D02F
	for <lists+linux-media@lfdr.de>; Tue, 29 Sep 2020 15:58:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731335AbgI2N6j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Sep 2020 09:58:39 -0400
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:47124 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731218AbgI2N60 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Sep 2020 09:58:26 -0400
X-IronPort-AV: E=Sophos;i="5.77,318,1596492000"; 
   d="scan'208";a="470079964"
Received: from palace.lip6.fr ([132.227.105.202])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/AES256-SHA256; 29 Sep 2020 15:57:41 +0200
From:   Julia Lawall <Julia.Lawall@inria.fr>
To:     Antti Palosaari <crope@iki.fi>
Cc:     =?UTF-8?q?Valdis=20Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
        Joe Perches <joe@perches.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        kernel-janitors@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 18/20] media: rtl2832: use semicolons rather than commas to separate statements
Date:   Tue, 29 Sep 2020 15:14:41 +0200
Message-Id: <1601385283-26144-19-git-send-email-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1601385283-26144-1-git-send-email-Julia.Lawall@inria.fr>
References: <1601385283-26144-1-git-send-email-Julia.Lawall@inria.fr>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Replace commas with semicolons.  Commas introduce unnecessary
variability in the code structure and are hard to see.  What is done
is essentially described by the following Coccinelle semantic patch
(http://coccinelle.lip6.fr/):

// <smpl>
@@ expression e1,e2; @@
e1
-,
+;
e2
... when any
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/media/dvb-frontends/rtl2832.c |   14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

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

