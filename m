Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE2DB631E4A
	for <lists+linux-media@lfdr.de>; Mon, 21 Nov 2022 11:27:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229501AbiKUK1W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Nov 2022 05:27:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230218AbiKUK1V (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Nov 2022 05:27:21 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07E0AB040E
        for <linux-media@vger.kernel.org>; Mon, 21 Nov 2022 02:27:18 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1ox41A-0000SW-8w; Mon, 21 Nov 2022 11:27:12 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1ox416-005dPG-Uw; Mon, 21 Nov 2022 11:27:09 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1ox416-000YGJ-R0; Mon, 21 Nov 2022 11:27:08 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Shunqian Zheng <zhengsq@rock-chips.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] media: i2c: ov5695: convert to i2c's .probe_new()
Date:   Mon, 21 Nov 2022 11:27:05 +0100
Message-Id: <20221121102705.16092-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1049; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=p6mnRAmvD+J8op2qtKBgwsa7v8aBXrmz3RkATu0uDhw=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBje1J1dISWk+X00pmGgQsPn2Jxi2I4wheB2OF6dkMu QDqg2dGJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY3tSdQAKCRDB/BR4rcrsCSJPB/ 9/3pX5oIdxOJ91QAbhM/JFcc7W21nElf4ZF8GceH7naEU5YaAVuvR7fFlF3SRAzNCjb9qvzn8q9Ptt QQqX4to6VrD7bdHlJTb4fjNY/wdMRQmJvAU+iK6WxTSN4qqf7y/aV/uzkbxJLXgFLTQwUsnuQHsN/d S78Gagg1LX8jCYBYuDpsLzuMvC7U6p4Uxaz5A+AMxH5Kv3o16gBNkOyg+UKRpeHsCZM1Oo6XDgdYDQ OEHyba+amK0lSw8uBDa7yPjkmyJhQCPG9y4ADIJLHhZdtZZRKGZXtzKty+655cfiv4ev0s4gHq837o rzdI5pNGhZBne248Nqhq3jmDw9e8eA
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The probe function doesn't make use of the i2c_device_id * parameter so
it can be trivially converted.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/media/i2c/ov5695.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov5695.c b/drivers/media/i2c/ov5695.c
index 61906fc54e37..b287c28920a6 100644
--- a/drivers/media/i2c/ov5695.c
+++ b/drivers/media/i2c/ov5695.c
@@ -1267,8 +1267,7 @@ static int ov5695_configure_regulators(struct ov5695 *ov5695)
 				       ov5695->supplies);
 }
 
-static int ov5695_probe(struct i2c_client *client,
-			const struct i2c_device_id *id)
+static int ov5695_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct ov5695 *ov5695;
@@ -1393,7 +1392,7 @@ static struct i2c_driver ov5695_i2c_driver = {
 		.pm = &ov5695_pm_ops,
 		.of_match_table = of_match_ptr(ov5695_of_match),
 	},
-	.probe		= &ov5695_probe,
+	.probe_new	= &ov5695_probe,
 	.remove		= &ov5695_remove,
 };
 
-- 
2.38.1

