Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F1446C951D
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:32:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232328AbjCZOce (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:32:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229887AbjCZOcd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:32:33 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 621786593
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:31 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ4-0007kk-15; Sun, 26 Mar 2023 16:32:28 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ3-006rYt-AI; Sun, 26 Mar 2023 16:32:27 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ1-0088Tr-PT; Sun, 26 Mar 2023 16:32:25 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 002/117] media: cec-gpio: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:30:28 +0200
Message-Id: <20230326143224.572654-4-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1762; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=CWo4O15bZJborxNexNwz9+q/5sIhuzdg9zysz4LyIFY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFZ3TrjSxRt0uTHZxZVpndQyyHNG9EFU5z8jR rcEfnAQArWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBWdwAKCRCPgPtYfRL+ TgycB/42fhG74gGQo3G4/e1cfXQqHl5tBsdNRGHU7PpdrH3edCIcQbG+RnHsgo0KTt2Tb/cc9Tc qzN6dIw+Q49AtkCUP2kyn7WsMoij+s8nJFp4KFtVzt/rIWHZy+fpyFT7zmO925lCtsPB5S2FjxS SwhYQz1q+Ohnvo4h2pRpPNfNBSmmToawfoUo72ZpHk+iziZyy1Hd+Ifbol+CeZd5gtYDZhtlVHB 6vj3Ba8IMSHdK2RF8JwBJXtW3JwxG/vfSdHO0jRc832HnK5XrpWC/k/sifuxT7CnmYswI61mtOr 8QcGcu8HrnZCtekbnMPVs98mT0iLL+7MhjZKRxNYAuHqWeyS
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
 drivers/media/cec/platform/cec-gpio/cec-gpio.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/cec/platform/cec-gpio/cec-gpio.c b/drivers/media/cec/platform/cec-gpio/cec-gpio.c
index c8c4efc83f5f..ff34490fd869 100644
--- a/drivers/media/cec/platform/cec-gpio/cec-gpio.c
+++ b/drivers/media/cec/platform/cec-gpio/cec-gpio.c
@@ -269,13 +269,12 @@ static int cec_gpio_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int cec_gpio_remove(struct platform_device *pdev)
+static void cec_gpio_remove(struct platform_device *pdev)
 {
 	struct cec_gpio *cec = platform_get_drvdata(pdev);
 
 	cec_notifier_cec_adap_unregister(cec->notifier, cec->adap);
 	cec_unregister_adapter(cec->adap);
-	return 0;
 }
 
 static const struct of_device_id cec_gpio_match[] = {
@@ -288,7 +287,7 @@ MODULE_DEVICE_TABLE(of, cec_gpio_match);
 
 static struct platform_driver cec_gpio_pdrv = {
 	.probe	= cec_gpio_probe,
-	.remove = cec_gpio_remove,
+	.remove_new = cec_gpio_remove,
 	.driver = {
 		.name		= "cec-gpio",
 		.of_match_table	= cec_gpio_match,
-- 
2.39.2

