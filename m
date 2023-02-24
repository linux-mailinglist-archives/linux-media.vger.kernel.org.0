Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A1406A1BD6
	for <lists+linux-media@lfdr.de>; Fri, 24 Feb 2023 13:06:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229928AbjBXMG3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Feb 2023 07:06:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229922AbjBXMGV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Feb 2023 07:06:21 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF52F658C0
        for <linux-media@vger.kernel.org>; Fri, 24 Feb 2023 04:06:19 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pVWq5-0000ck-1X; Fri, 24 Feb 2023 13:06:13 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pVWq2-007Azs-7i; Fri, 24 Feb 2023 13:06:11 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pVWq2-006EYx-Cv; Fri, 24 Feb 2023 13:06:10 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     kernel@pengutronix.de, Shunqian Zheng <zhengsq@rock-chips.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH 5/9] media: i2c: ov5695: convert to i2c's .probe_new()
Date:   Fri, 24 Feb 2023 13:05:56 +0100
Message-Id: <20230224120600.1681685-6-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230224120600.1681685-1-u.kleine-koenig@pengutronix.de>
References: <20230224120600.1681685-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1210; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=siu3f6h9Hr7VMftXLH9Of9pD9INClG+aVvJygDvAciI=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBj+KgUuVzzJQ/lgJA1HJTlVSb9jZ8IDBZxCv8zA ++zMYKFbPqJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY/ioFAAKCRDB/BR4rcrs Cf9iCACPvFiFv6Hkzo4LAMaMJ9rXAJObT4N/xkaVjR529Kc8MZ7T64jw2JGjBvd6CUdLeUEdFoR DVGlDHb4B4cFKt7xlszr4UECnguP7OpZailyI+8pPKajoYgscifIaz3IyJkwW3Icr4164NgUwO+ UN1IG9waEIhl47DW0+xBOkHAhsGHnQtn1mjlBsI9SKqhodYkzLtKeRYiKBcglpcgUVLN0L3n/S2 6IMmfrU9cJKu43DigUV5rq76x5uEzWyh8GdlFkOjJVHN7QfBwlE7C3AyyJ088S9hSif2lfuxgbY dFjL65itVfBwQ+GKc1JxQ7kMk6T/adRzP4fw4VWq4LXXkbAO
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

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Link: https://lore.kernel.org/lkml/20221121102705.16092-1-u.kleine-koenig@pengutronix.de
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
2.39.1

