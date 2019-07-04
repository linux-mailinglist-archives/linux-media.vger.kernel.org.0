Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CDDA5F5BC
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2019 11:36:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727397AbfGDJgK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jul 2019 05:36:10 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:8141 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727365AbfGDJgK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Jul 2019 05:36:10 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 496BCF8FADA4AA0FA4AB;
        Thu,  4 Jul 2019 17:36:07 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Thu, 4 Jul 2019
 17:36:01 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <broonie@kernel.org>, <gregkh@linuxfoundation.org>,
        <rafael@kernel.org>, <akinobu.mita@gmail.com>,
        <wsa+renesas@sang-engineering.com>, <sakari.ailus@linux.intel.com>,
        <mchehab+samsung@kernel.org>, <jacopo@jmondi.org>,
        <khoroshilov@ispras.ru>
CC:     <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH] regmap: select CONFIG_REGMAP while REGMAP_SCCB is set
Date:   Thu, 4 Jul 2019 17:35:53 +0800
Message-ID: <20190704093553.49904-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

REGMAP_SCCB is selected by ov772x and ov9650 drivers,
but CONFIG_REGMAP may not, so building will fails:

rivers/media/i2c/ov772x.c: In function ov772x_probe:
drivers/media/i2c/ov772x.c:1360:22: error: variable ov772x_regmap_config has initializer but incomplete type
  static const struct regmap_config ov772x_regmap_config = {
                      ^~~~~~~~~~~~~
drivers/media/i2c/ov772x.c:1361:4: error: const struct regmap_config has no member named reg_bits

Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: 5bbf32217bf9 ("media: ov772x: use SCCB regmap")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/base/regmap/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/regmap/Kconfig b/drivers/base/regmap/Kconfig
index c8bbf53..a498413 100644
--- a/drivers/base/regmap/Kconfig
+++ b/drivers/base/regmap/Kconfig
@@ -4,7 +4,7 @@
 # subsystems should select the appropriate symbols.
 
 config REGMAP
-	default y if (REGMAP_I2C || REGMAP_SPI || REGMAP_SPMI || REGMAP_W1 || REGMAP_AC97 || REGMAP_MMIO || REGMAP_IRQ || REGMAP_I3C)
+	default y if (REGMAP_I2C || REGMAP_SPI || REGMAP_SPMI || REGMAP_W1 || REGMAP_AC97 || REGMAP_MMIO || REGMAP_IRQ || REGMAP_SCCB || REGMAP_I3C)
 	select IRQ_DOMAIN if REGMAP_IRQ
 	bool
 
-- 
2.7.4


