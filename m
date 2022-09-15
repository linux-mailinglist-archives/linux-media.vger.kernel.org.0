Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B243F5B9DDA
	for <lists+linux-media@lfdr.de>; Thu, 15 Sep 2022 16:56:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230211AbiIOO4W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Sep 2022 10:56:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229667AbiIOO4R (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Sep 2022 10:56:17 -0400
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E56D484EC8
        for <linux-media@vger.kernel.org>; Thu, 15 Sep 2022 07:56:15 -0700 (PDT)
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.55])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4MT0b53CRBzBsJc;
        Thu, 15 Sep 2022 22:54:09 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 15 Sep 2022 22:56:12 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 15 Sep
 2022 22:56:12 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-media@vger.kernel.org>
CC:     <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>, <pavel@ucw.cz>,
        <sakari.ailus@linux.intel.com>, <sean@mess.org>,
        <laurent.pinchart@ideasonboard.com>
Subject: [PATCH -next 03/13] media: i2c: imx274: Switch to use dev_err_probe() helper
Date:   Thu, 15 Sep 2022 23:03:14 +0800
Message-ID: <20220915150324.688062-4-yangyingliang@huawei.com>
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
 drivers/media/i2c/imx274.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
index a00761b1e18c..0df515ab2cbf 100644
--- a/drivers/media/i2c/imx274.c
+++ b/drivers/media/i2c/imx274.c
@@ -2060,9 +2060,8 @@ static int imx274_probe(struct i2c_client *client)
 	imx274->reset_gpio = devm_gpiod_get_optional(dev, "reset",
 						     GPIOD_OUT_HIGH);
 	if (IS_ERR(imx274->reset_gpio)) {
-		if (PTR_ERR(imx274->reset_gpio) != -EPROBE_DEFER)
-			dev_err(dev, "Reset GPIO not setup in DT");
-		ret = PTR_ERR(imx274->reset_gpio);
+		ret = dev_err_probe(dev, PTR_ERR(imx274->reset_gpio),
+				    "Reset GPIO not setup in DT");
 		goto err_me;
 	}
 
-- 
2.25.1

