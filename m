Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15B486C9521
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:32:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232385AbjCZOch (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:32:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232330AbjCZOce (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:32:34 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61FDA658D
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:31 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ4-0007lb-Sc; Sun, 26 Mar 2023 16:32:28 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ4-006rZH-7k; Sun, 26 Mar 2023 16:32:28 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ3-0088UC-2X; Sun, 26 Mar 2023 16:32:27 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Ettore Chimenti <ek5.chimenti@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 007/117] media: seco-cec: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:30:34 +0200
Message-Id: <20230326143224.572654-10-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1754; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=opknbcOaz9XAlkEWcpTYnQvvZUcCAnIWXl7+s62C8BA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFZ+x42d2VhJal8h9RkkF/JNldzmr7jV4XXVb 4LynSO1wzCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBWfgAKCRCPgPtYfRL+ To8xCACRXsSYopUCVyDUJuiche2ywDONpOUaIUPNZnfC28fsyt5srKfvJ9SZawoI4S3qMVkptZZ xcoXyRxl1irRGlrwqTQh/oe6D98lqXjRff+qE+SRo9A2fCplrR7XW3Ggwg69mfFSsF7UDywQqsk 4XAcZFWgbVvnhkA4eXB/GqSDmnLqTAkm+VrxT4vm4m1OuvYqXwRUSNij6l0YARLeucL8YPPo383 Cw1dJrrsQoJTahf4XMtTV6KjS7HRIYCHsuvScnhwTB/kQjmL2P8Z3xOA1tH+iRV9A09A0MceXEv QWEuUNnYn5fzvyXsn09ISn6dIrFNYqNFFhUua0z/ZLEsirz0
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/media/cec/platform/seco/seco-cec.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/cec/platform/seco/seco-cec.c b/drivers/media/cec/platform/seco/seco-cec.c
index 580905e3d066..5d4c5a2cae09 100644
--- a/drivers/media/cec/platform/seco/seco-cec.c
+++ b/drivers/media/cec/platform/seco/seco-cec.c
@@ -668,7 +668,7 @@ static int secocec_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int secocec_remove(struct platform_device *pdev)
+static void secocec_remove(struct platform_device *pdev)
 {
 	struct secocec_data *secocec = platform_get_drvdata(pdev);
 	u16 val;
@@ -686,8 +686,6 @@ static int secocec_remove(struct platform_device *pdev)
 	release_region(BRA_SMB_BASE_ADDR, 7);
 
 	dev_dbg(&pdev->dev, "CEC device removed\n");
-
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -780,7 +778,7 @@ static struct platform_driver secocec_driver = {
 		   .pm = SECOCEC_PM_OPS,
 	},
 	.probe = secocec_probe,
-	.remove = secocec_remove,
+	.remove_new = secocec_remove,
 };
 
 module_platform_driver(secocec_driver);
-- 
2.39.2

