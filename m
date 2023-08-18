Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 611557809D9
	for <lists+linux-media@lfdr.de>; Fri, 18 Aug 2023 12:17:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358597AbjHRKRE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Aug 2023 06:17:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359550AbjHRKQu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Aug 2023 06:16:50 -0400
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C03A30F5
        for <linux-media@vger.kernel.org>; Fri, 18 Aug 2023 03:16:48 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.53])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RRyQ319bjzFqlB;
        Fri, 18 Aug 2023 18:13:47 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Fri, 18 Aug
 2023 18:16:46 +0800
From:   Ruan Jinjie <ruanjinjie@huawei.com>
To:     <linux-media@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC:     <ruanjinjie@huawei.com>
Subject: [PATCH -next] media: ov2640: Use the devm_clk_get_enabled() helper function
Date:   Fri, 18 Aug 2023 18:16:24 +0800
Message-ID: <20230818101624.1129242-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

With devm_clk_get_enabled() the call to clk_disable_unprepare() can be
dropped from the error path and the remove callback.

Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
---
 drivers/media/i2c/ov2640.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/ov2640.c b/drivers/media/i2c/ov2640.c
index bb6c9863a546..2d08d30175c0 100644
--- a/drivers/media/i2c/ov2640.c
+++ b/drivers/media/i2c/ov2640.c
@@ -1205,17 +1205,14 @@ static int ov2640_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	if (client->dev.of_node) {
-		priv->clk = devm_clk_get(&client->dev, "xvclk");
+		priv->clk = devm_clk_get_enabled(&client->dev, "xvclk");
 		if (IS_ERR(priv->clk))
 			return PTR_ERR(priv->clk);
-		ret = clk_prepare_enable(priv->clk);
-		if (ret)
-			return ret;
 	}
 
 	ret = ov2640_probe_dt(client, priv);
 	if (ret)
-		goto err_clk;
+		return ret;
 
 	priv->win = ov2640_select_win(SVGA_WIDTH, SVGA_HEIGHT);
 	priv->cfmt_code = MEDIA_BUS_FMT_UYVY8_2X8;
@@ -1264,8 +1261,6 @@ static int ov2640_probe(struct i2c_client *client)
 err_hdl:
 	v4l2_ctrl_handler_free(&priv->hdl);
 	mutex_destroy(&priv->lock);
-err_clk:
-	clk_disable_unprepare(priv->clk);
 	return ret;
 }
 
@@ -1278,7 +1273,6 @@ static void ov2640_remove(struct i2c_client *client)
 	mutex_destroy(&priv->lock);
 	media_entity_cleanup(&priv->subdev.entity);
 	v4l2_device_unregister_subdev(&priv->subdev);
-	clk_disable_unprepare(priv->clk);
 }
 
 static const struct i2c_device_id ov2640_id[] = {
-- 
2.34.1

