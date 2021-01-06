Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55F632EBE86
	for <lists+linux-media@lfdr.de>; Wed,  6 Jan 2021 14:23:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727235AbhAFNT4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Jan 2021 08:19:56 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:10398 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727234AbhAFNT4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Jan 2021 08:19:56 -0500
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4D9qgG1wJPz7R1H;
        Wed,  6 Jan 2021 21:18:18 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.498.0; Wed, 6 Jan 2021 21:19:05 +0800
From:   Zheng Yongjun <zhengyongjun3@huawei.com>
To:     <crope@iki.fi>, <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: [PATCH -next] [media] m88ds3103: use resource_size
Date:   Wed, 6 Jan 2021 21:19:48 +0800
Message-ID: <20210106131948.903-1-zhengyongjun3@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.138.68]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use resource_size rather than a verbose computation on
the end and start fields.

Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
---
 drivers/media/dvb-frontends/m88ds3103.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb-frontends/m88ds3103.c b/drivers/media/dvb-frontends/m88ds3103.c
index bde0ea64a89b..cfa4cdde99d8 100644
--- a/drivers/media/dvb-frontends/m88ds3103.c
+++ b/drivers/media/dvb-frontends/m88ds3103.c
@@ -1793,8 +1793,8 @@ static int m88ds3103_probe(struct i2c_client *client,
 	dev->config.lnb_en_pol = pdata->lnb_en_pol;
 	dev->cfg = &dev->config;
 	/* create regmap */
-	dev->regmap_config.reg_bits = 8,
-	dev->regmap_config.val_bits = 8,
+	dev->regmap_config.reg_bits = 8;
+	dev->regmap_config.val_bits = 8;
 	dev->regmap_config.lock_arg = dev;
 	dev->regmap = devm_regmap_init_i2c(client, &dev->regmap_config);
 	if (IS_ERR(dev->regmap)) {
-- 
2.22.0

