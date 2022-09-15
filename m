Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 194DD5B9DD8
	for <lists+linux-media@lfdr.de>; Thu, 15 Sep 2022 16:56:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229895AbiIOO4Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Sep 2022 10:56:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229885AbiIOO4R (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Sep 2022 10:56:17 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E55D1659E6
        for <linux-media@vger.kernel.org>; Thu, 15 Sep 2022 07:56:15 -0700 (PDT)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.54])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MT0X85DypzNm77;
        Thu, 15 Sep 2022 22:51:36 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 15 Sep 2022 22:56:13 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 15 Sep
 2022 22:56:12 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-media@vger.kernel.org>
CC:     <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>, <pavel@ucw.cz>,
        <sakari.ailus@linux.intel.com>, <sean@mess.org>,
        <laurent.pinchart@ideasonboard.com>
Subject: [PATCH -next 04/13] media: i2c: tc358743: Switch to use dev_err_probe() helper
Date:   Thu, 15 Sep 2022 23:03:15 +0800
Message-ID: <20220915150324.688062-5-yangyingliang@huawei.com>
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
 drivers/media/i2c/tc358743.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
index 200841c1f5cf..9197fa0b1bc2 100644
--- a/drivers/media/i2c/tc358743.c
+++ b/drivers/media/i2c/tc358743.c
@@ -1891,12 +1891,9 @@ static int tc358743_probe_of(struct tc358743_state *state)
 	int ret;
 
 	refclk = devm_clk_get(dev, "refclk");
-	if (IS_ERR(refclk)) {
-		if (PTR_ERR(refclk) != -EPROBE_DEFER)
-			dev_err(dev, "failed to get refclk: %ld\n",
-				PTR_ERR(refclk));
-		return PTR_ERR(refclk);
-	}
+	if (IS_ERR(refclk))
+		return dev_err_probe(dev, PTR_ERR(refclk),
+				     "failed to get refclk\n");
 
 	ep = of_graph_get_next_endpoint(dev->of_node, NULL);
 	if (!ep) {
-- 
2.25.1

