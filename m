Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 487E96C95AF
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:34:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232601AbjCZOeh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:34:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232526AbjCZOdK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:33:10 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79A0A65A4
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:58 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQT-0000a4-Hi; Sun, 26 Mar 2023 16:32:53 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQR-006rhy-LG; Sun, 26 Mar 2023 16:32:51 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQQ-0088bM-Vk; Sun, 26 Mar 2023 16:32:50 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Antti Palosaari <crope@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 117/117] media: it913x: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:32:24 +0200
Message-Id: <20230326143224.572654-120-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1748; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=IWiP7BQxrMEqnTiyDeYG5YBvZSoqaHuYCH09+5LsHok=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFdhXGR3ki75ycz9AMtkzRW/wAugepMmlAUPK tJ0GM84wsuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBXYQAKCRCPgPtYfRL+ TmRPB/9op5i/IUADzoGpd6X0DUHo2iFmwj+l7eubuh2vpVuPnqXv1ApfTBGyQ9qPLEqsAZLlFEG XDQd9UG88wUNhgoegkBYpme+bhlDf2eduPpTn8maZSxTdOm0/Kvzdp0p97UKZm3exMvqFSbkdiE PUO41dbMYeN1drfIzqC7Ch0OgqeBXV0PfRawbaK/asERFoILB7uxuB8kw6LBHVAgTnp4057XJzR /w88sn8x+gZsMPta1oTmXob2TUVNuQgsHoCUSbrE0999uyq1Y1Gsy07Y7D4zDqgLfXtL9qooWYs Z0912kgPPERbZ1NRDpEfNCE5ZQh9lGdqwgjbKrzdjOFzYLIJ
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
 drivers/media/tuners/it913x.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/tuners/it913x.c b/drivers/media/tuners/it913x.c
index 7696a28fe407..4d5b1c878028 100644
--- a/drivers/media/tuners/it913x.c
+++ b/drivers/media/tuners/it913x.c
@@ -419,7 +419,7 @@ static int it913x_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int it913x_remove(struct platform_device *pdev)
+static void it913x_remove(struct platform_device *pdev)
 {
 	struct it913x_dev *dev = platform_get_drvdata(pdev);
 	struct dvb_frontend *fe = dev->fe;
@@ -429,8 +429,6 @@ static int it913x_remove(struct platform_device *pdev)
 	memset(&fe->ops.tuner_ops, 0, sizeof(struct dvb_tuner_ops));
 	fe->tuner_priv = NULL;
 	kfree(dev);
-
-	return 0;
 }
 
 static const struct platform_device_id it913x_id_table[] = {
@@ -446,7 +444,7 @@ static struct platform_driver it913x_driver = {
 		.suppress_bind_attrs	= true,
 	},
 	.probe		= it913x_probe,
-	.remove		= it913x_remove,
+	.remove_new	= it913x_remove,
 	.id_table	= it913x_id_table,
 };
 
-- 
2.39.2

