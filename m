Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C0765B9DE0
	for <lists+linux-media@lfdr.de>; Thu, 15 Sep 2022 16:56:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229864AbiIOO4Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Sep 2022 10:56:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbiIOO4R (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Sep 2022 10:56:17 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF55785F80
        for <linux-media@vger.kernel.org>; Thu, 15 Sep 2022 07:56:15 -0700 (PDT)
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.55])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MT0Y5242TzmVFn;
        Thu, 15 Sep 2022 22:52:25 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 15 Sep 2022 22:56:12 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 15 Sep
 2022 22:56:11 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-media@vger.kernel.org>
CC:     <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>, <pavel@ucw.cz>,
        <sakari.ailus@linux.intel.com>, <sean@mess.org>,
        <laurent.pinchart@ideasonboard.com>
Subject: [PATCH -next 02/13] media: i2c: ad5820: Switch to use dev_err_probe() helper
Date:   Thu, 15 Sep 2022 23:03:13 +0800
Message-ID: <20220915150324.688062-3-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220915150324.688062-1-yangyingliang@huawei.com>
References: <20220915150324.688062-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In the probe path, dev_err() can be replace with dev_err_probe()
which will check if error code is -EPROBE_DEFER.

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/media/i2c/ad5820.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/ad5820.c b/drivers/media/i2c/ad5820.c
index 516de278cc49..6a7f8ef9db05 100644
--- a/drivers/media/i2c/ad5820.c
+++ b/drivers/media/i2c/ad5820.c
@@ -301,21 +301,15 @@ static int ad5820_probe(struct i2c_client *client,
 		return -ENOMEM;
 
 	coil->vana = devm_regulator_get(&client->dev, "VANA");
-	if (IS_ERR(coil->vana)) {
-		ret = PTR_ERR(coil->vana);
-		if (ret != -EPROBE_DEFER)
-			dev_err(&client->dev, "could not get regulator for vana\n");
-		return ret;
-	}
+	if (IS_ERR(coil->vana))
+		return dev_err_probe(&client->dev, PTR_ERR(coil->vana),
+				     "could not get regulator for vana\n");
 
 	coil->enable_gpio = devm_gpiod_get_optional(&client->dev, "enable",
 						    GPIOD_OUT_LOW);
-	if (IS_ERR(coil->enable_gpio)) {
-		ret = PTR_ERR(coil->enable_gpio);
-		if (ret != -EPROBE_DEFER)
-			dev_err(&client->dev, "could not get enable gpio\n");
-		return ret;
-	}
+	if (IS_ERR(coil->enable_gpio))
+		return dev_err_probe(&client->dev, PTR_ERR(coil->enable_gpio),
+				     "could not get enable gpio\n");
 
 	mutex_init(&coil->power_lock);
 
-- 
2.25.1

