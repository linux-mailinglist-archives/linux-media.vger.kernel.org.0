Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90BBC631E59
	for <lists+linux-media@lfdr.de>; Mon, 21 Nov 2022 11:28:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229790AbiKUK2u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Nov 2022 05:28:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229695AbiKUK2s (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Nov 2022 05:28:48 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F6F9B0438
        for <linux-media@vger.kernel.org>; Mon, 21 Nov 2022 02:28:46 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1ox42b-0000cQ-Hc; Mon, 21 Nov 2022 11:28:41 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1ox42Z-005dPQ-VZ; Mon, 21 Nov 2022 11:28:40 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1ox42a-000YHW-5B; Mon, 21 Nov 2022 11:28:40 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Shunqian Zheng <zhengsq@rock-chips.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] media: i2c: ov2685: convert to i2c's .probe_new()
Date:   Mon, 21 Nov 2022 11:28:38 +0100
Message-Id: <20221121102838.16448-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1045; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=RbrDD24odAzjhNJOG+mygIFaTsnu+nZsUQejvTxyfgY=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBje1LSn9nYMytyBcf/zreZcIGwsP6joP1UqBaZR3vl djnERUCJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY3tS0gAKCRDB/BR4rcrsCcfsB/ 4mYIiAIxL9qDXAZUjpjEtADuz8K1h/rqsnwugKCRC6+T/XHFA0LUvAMd5z7Hl66sa4/MXex0mYkCTH H0qt043gYUc7b+/kyFTXnBFYi1TfMdoo2BsRaYTH3bL8IYZthMSYdSZwmdr8SNpjkzfxyLpAlhT7ip s0Dl9KppF1t729unZg14UXEo4q4LdeW10NjHu/azcCMy/s/BKn8Y0S8FcGdTVVGnRhTbFqd2eS/A4r gHMvtGcY4ghcZBMJ8HthvYTJ8EezBW9X9YG80iNeAXzJu+kYfq2WF28xtiSxXBx3+H50/bDasi8JGF en7v+nmOxYj5Wga2+SBc4D3oDzSScF
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
 drivers/media/i2c/ov2685.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov2685.c b/drivers/media/i2c/ov2685.c
index a3b524f15d89..1c80b121e7d6 100644
--- a/drivers/media/i2c/ov2685.c
+++ b/drivers/media/i2c/ov2685.c
@@ -707,8 +707,7 @@ static int ov2685_configure_regulators(struct ov2685 *ov2685)
 				       ov2685->supplies);
 }
 
-static int ov2685_probe(struct i2c_client *client,
-			const struct i2c_device_id *id)
+static int ov2685_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct ov2685 *ov2685;
@@ -830,7 +829,7 @@ static struct i2c_driver ov2685_i2c_driver = {
 		.pm = &ov2685_pm_ops,
 		.of_match_table = of_match_ptr(ov2685_of_match),
 	},
-	.probe		= &ov2685_probe,
+	.probe_new	= &ov2685_probe,
 	.remove		= &ov2685_remove,
 };
 
-- 
2.38.1

