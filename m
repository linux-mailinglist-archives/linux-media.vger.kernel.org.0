Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 021D76C9531
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:32:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232419AbjCZOcq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:32:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232366AbjCZOcg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:32:36 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09F94769A
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:34 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ6-0007mZ-5e; Sun, 26 Mar 2023 16:32:30 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ4-006rZV-PY; Sun, 26 Mar 2023 16:32:28 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ4-0088UW-5M; Sun, 26 Mar 2023 16:32:28 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Antti Palosaari <crope@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 012/117] media: zd1301_demod: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:30:39 +0200
Message-Id: <20230326143224.572654-15-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1807; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=KGyg5wxPpQf62SOk4rkPmy5hBd6lpgaCEsI2pM7AQY0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFaElWQMJ9rP7c/Ry4PzWH9KbAip5Ny5r6dCS 1NDUMyezWiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBWhAAKCRCPgPtYfRL+ TjJ7B/90iwSvwr87FYoccO18by5fj6GcRwkoz6/ZF4CNt2cAfXMU1bN9z+UEeEjB5HlKvp+3Mpl qcX7UIwW7LK/1DWMJ2U/PVqWLvAllbUxr20mnlFpHZReF9OBlhow8ZtMqD0woxZxuRkNy1MBpz6 hejB3DgV8ARjinsOusYc2xriIFEtDUkdu5E4U5dTQcP8Q7xng3Qa6dZPtd5++6clAOTU8p65j3f eMlqCvG5BsL+p04MfDI+Oxmsb/3bwws6yu/9bnE0oE7iI3bF6eWF9qSD6l8Ovsj25+NzyXNhKL1 sgtGhlycutnO220q8klV2EXRvcXiMhbCp9Mbw7+vaqlKzfL7
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
 drivers/media/dvb-frontends/zd1301_demod.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/dvb-frontends/zd1301_demod.c b/drivers/media/dvb-frontends/zd1301_demod.c
index bbabe6a2d4f4..17f6e373c13d 100644
--- a/drivers/media/dvb-frontends/zd1301_demod.c
+++ b/drivers/media/dvb-frontends/zd1301_demod.c
@@ -515,7 +515,7 @@ static int zd1301_demod_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int zd1301_demod_remove(struct platform_device *pdev)
+static void zd1301_demod_remove(struct platform_device *pdev)
 {
 	struct zd1301_demod_dev *dev = platform_get_drvdata(pdev);
 
@@ -523,8 +523,6 @@ static int zd1301_demod_remove(struct platform_device *pdev)
 
 	i2c_del_adapter(&dev->adapter);
 	kfree(dev);
-
-	return 0;
 }
 
 static struct platform_driver zd1301_demod_driver = {
@@ -533,7 +531,7 @@ static struct platform_driver zd1301_demod_driver = {
 		.suppress_bind_attrs = true,
 	},
 	.probe          = zd1301_demod_probe,
-	.remove         = zd1301_demod_remove,
+	.remove_new     = zd1301_demod_remove,
 };
 module_platform_driver(zd1301_demod_driver);
 
-- 
2.39.2

