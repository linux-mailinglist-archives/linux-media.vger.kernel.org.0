Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24868761816
	for <lists+linux-media@lfdr.de>; Tue, 25 Jul 2023 14:17:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233038AbjGYMRo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jul 2023 08:17:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231715AbjGYMRl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jul 2023 08:17:41 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47261A3
        for <linux-media@vger.kernel.org>; Tue, 25 Jul 2023 05:17:40 -0700 (PDT)
Received: from dggpemm100019.china.huawei.com (unknown [172.30.72.55])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4R9GGy3Mgwz1GDK1;
        Tue, 25 Jul 2023 20:16:42 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm100019.china.huawei.com (7.185.36.251) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 20:17:33 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 25 Jul
 2023 20:17:33 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-media@vger.kernel.org>
CC:     <tomi.valkeinen@ideasonboard.com>, <mchehab@kernel.org>,
        <sakari.ailus@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>, <yangyingliang@huawei.com>
Subject: [PATCH -next] media: i2c: ds90ub960: fix return value check in ub960_rxport_add_serializer()
Date:   Tue, 25 Jul 2023 20:15:07 +0800
Message-ID: <20230725121507.515435-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

i2c_new_client_device() never returns NULL pointer, it will return
ERR_PTR() when it fails, so replace the check with IS_ERR() and
use PTR_ERR() as return code.

Fixes: afe267f2d368 ("media: i2c: add DS90UB960 driver")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/media/i2c/ds90ub960.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index e101bcf2356a..92aa004a3674 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -1662,10 +1662,10 @@ static int ub960_rxport_add_serializer(struct ub960_data *priv, u8 nport)
 	ser_info.addr = rxport->ser.alias;
 	rxport->ser.client =
 		i2c_new_client_device(priv->client->adapter, &ser_info);
-	if (!rxport->ser.client) {
+	if (IS_ERR(rxport->ser.client)) {
 		dev_err(dev, "rx%u: cannot add %s i2c device", nport,
 			ser_info.type);
-		return -EIO;
+		return PTR_ERR(rxport->ser.client);
 	}
 
 	dev_dbg(dev, "rx%u: remote serializer at alias 0x%02x (%u-%04x)\n",
-- 
2.25.1

