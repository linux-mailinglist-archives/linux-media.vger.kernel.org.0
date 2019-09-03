Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72C25A6849
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2019 14:10:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729033AbfICMKD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Sep 2019 08:10:03 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:42472 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728860AbfICMKD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 3 Sep 2019 08:10:03 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 0E8DCBDAB52D7662322A;
        Tue,  3 Sep 2019 20:10:00 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.439.0; Tue, 3 Sep 2019
 20:09:50 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <mchehab@kernel.org>, <sakari.ailus@linux.intel.com>,
        <hverkuil-cisco@xs4all.nl>, <akinobu.mita@gmail.com>,
        <bingbu.cao@intel.com>, <arnd@arndb.de>, <shawnx.tu@intel.com>,
        <mickael.guene@st.com>
CC:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] media: max2175: Fix build error without CONFIG_REGMAP_I2C
Date:   Tue, 3 Sep 2019 20:09:45 +0800
Message-ID: <20190903120945.19580-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If CONFIG_REGMAP_I2C is not set, building fails:

drivers/media/i2c/max2175.o: In function `max2175_probe':
max2175.c:(.text+0x1404): undefined reference to `__devm_regmap_init_i2c'

Select REGMAP_I2C to fix this.

Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: b47b79d8a231 ("[media] media: i2c: max2175: Add MAX2175 support")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/media/i2c/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 7eee181..fcffcc3 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -1113,6 +1113,7 @@ comment "SDR tuner chips"
 config SDR_MAX2175
 	tristate "Maxim 2175 RF to Bits tuner"
 	depends on VIDEO_V4L2 && MEDIA_SDR_SUPPORT && I2C
+	select REGMAP_I2C
 	help
 	  Support for Maxim 2175 tuner. It is an advanced analog/digital
 	  radio receiver with RF-to-Bits front-end designed for SDR solutions.
-- 
2.7.4


