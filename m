Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C8FC5BB6DE
	for <lists+linux-media@lfdr.de>; Sat, 17 Sep 2022 09:07:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229558AbiIQHHa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 17 Sep 2022 03:07:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbiIQHH3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 17 Sep 2022 03:07:29 -0400
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BC5A4F692
        for <linux-media@vger.kernel.org>; Sat, 17 Sep 2022 00:07:27 -0700 (PDT)
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.54])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4MV25D0761zBsLg;
        Sat, 17 Sep 2022 15:05:20 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sat, 17 Sep 2022 15:07:25 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Sat, 17 Sep
 2022 15:07:24 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-media@vger.kernel.org>
CC:     <khalasa@piap.pl>, <mchehab@kernel.org>,
        <sakari.ailus@linux.intel.com>
Subject: [PATCH -next resend] media: ar0521: fix error return code in ar0521_power_on()
Date:   Sat, 17 Sep 2022 15:14:32 +0800
Message-ID: <20220917071432.1544323-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Return error code if ar0521_write_regs() fails in ar0521_power_on().

Fixes: 852b50aeed15 ("media: On Semi AR0521 sensor driver")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
Acked-by: Krzysztof Hałasa <khalasa@piap.pl>
---
  +cc: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ar0521.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
index c7bdfc69b9be..e850c92d847e 100644
--- a/drivers/media/i2c/ar0521.c
+++ b/drivers/media/i2c/ar0521.c
@@ -757,8 +757,9 @@ static int ar0521_power_on(struct device *dev)
 	usleep_range(4500, 5000); /* min 45000 clocks */
 
 	for (cnt = 0; cnt < ARRAY_SIZE(initial_regs); cnt++)
-		if (ar0521_write_regs(sensor, initial_regs[cnt].data,
-				      initial_regs[cnt].count))
+		ret = ar0521_write_regs(sensor, initial_regs[cnt].data,
+					initial_regs[cnt].count);
+		if (ret)
 			goto off;
 
 	ret = ar0521_write_reg(sensor, AR0521_REG_SERIAL_FORMAT,
-- 
2.25.1

