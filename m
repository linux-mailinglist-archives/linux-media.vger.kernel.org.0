Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD9C76D4C2A
	for <lists+linux-media@lfdr.de>; Mon,  3 Apr 2023 17:40:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232921AbjDCPkg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Apr 2023 11:40:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232959AbjDCPkd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Apr 2023 11:40:33 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 488AD26B9
        for <linux-media@vger.kernel.org>; Mon,  3 Apr 2023 08:40:32 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pjMIA-0004bc-RK; Mon, 03 Apr 2023 17:40:22 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pjMI7-008iar-4k; Mon, 03 Apr 2023 17:40:19 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pjMI6-00AHwh-53; Mon, 03 Apr 2023 17:40:18 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Eugen Hristev <eugen.hristev@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Subject: [PATCH 06/24] staging: media: atmel-sama5d2-isc: Convert to platform remove callback returning void
Date:   Mon,  3 Apr 2023 17:39:56 +0200
Message-Id: <20230403154014.2564054-7-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230403154014.2564054-1-u.kleine-koenig@pengutronix.de>
References: <20230403154014.2564054-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1907; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=3eWA9wqLohjTkdU86NEwfGho6Mb4eBfhtOu2ZNBEJRM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKvM7k50m5cP0X2ccwpM4B8PZF/oH0lUbfXssN 8SepfYAIL2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCrzOwAKCRCPgPtYfRL+ TtzHB/9I6LdPHbPBc3TvWgIX077VkCy8Pchxdxs3b5gBVFsvuYNu6eppwxpzNTfYlDUzKyDuThh dDcXIurj1WoAS+baufacQxpgeFI6zL6xgQTLIMAZWi9mDdxgHcMyDRb26GdywuHRJb4ND312yVu 3QJdN9lr/5mkY88sXbvFJkIDLlhEAD3hhpu19H4cWsYhbV0H+ROmk42Bk5HF2lw84iXSCeFdxHc cYl2F9O5TR1EOXpXoABlMRiP2k2hsWZkeL9r+EU2P27LQKlEDEAQ4y8VbQ22ZqHP55phnTKngBO oE+2I1UyF+7c14QPUylwxyGAbUWJ7cDNcYwsGF4PlvzF2DMd
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
 drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c b/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c
index ba0614f981a2..cc744cea1d0e 100644
--- a/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c
+++ b/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c
@@ -580,7 +580,7 @@ static int atmel_isc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int atmel_isc_remove(struct platform_device *pdev)
+static void atmel_isc_remove(struct platform_device *pdev)
 {
 	struct isc_device *isc = platform_get_drvdata(pdev);
 
@@ -594,8 +594,6 @@ static int atmel_isc_remove(struct platform_device *pdev)
 	clk_disable_unprepare(isc->hclock);
 
 	atmel_isc_clk_cleanup(isc);
-
-	return 0;
 }
 
 static int __maybe_unused isc_runtime_suspend(struct device *dev)
@@ -638,7 +636,7 @@ MODULE_DEVICE_TABLE(of, atmel_isc_of_match);
 
 static struct platform_driver atmel_isc_driver = {
 	.probe	= atmel_isc_probe,
-	.remove	= atmel_isc_remove,
+	.remove_new = atmel_isc_remove,
 	.driver	= {
 		.name		= "atmel-sama5d2-isc",
 		.pm		= &atmel_isc_dev_pm_ops,
-- 
2.39.2

