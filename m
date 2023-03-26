Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6BA56C954A
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:33:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232519AbjCZOc7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:32:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232384AbjCZOch (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:32:37 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 373686593
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:36 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ3-0007kj-TF; Sun, 26 Mar 2023 16:32:27 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ3-006rYp-3e; Sun, 26 Mar 2023 16:32:27 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ2-0088Ty-6C; Sun, 26 Mar 2023 16:32:26 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Benson Leung <bleung@chromium.org>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Scott Chao <scott_chao@wistron.corp-partner.google.com>,
        Rory Liu <hellojacky0226@hotmail.com>,
        Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Cc:     Guenter Roeck <groeck@chromium.org>, linux-media@vger.kernel.org,
        chrome-platform@lists.linux.dev, kernel@pengutronix.de
Subject: [PATCH 003/117] media: cros-ec-cec: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:30:30 +0200
Message-Id: <20230326143224.572654-6-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1824; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=7R9wKQxWA44fiXMEYARiwDyElWOf/YQkKOdlXBlMzbk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFZ58QDpXlzM0zNEkr6TWGtNeAotmE8ENdA8i +nW33qtuOqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBWeQAKCRCPgPtYfRL+ TppCB/93wZB5ZjDqzIYqffIxt9i6KyyUwipLcXNpswTw47lIhAn5FcKeus4st6tmtZ9gC57A0PS YBGYErj+uD/ZpXkqx+WV8d6Kg8ZdVtdHQT2UJ0oWq7sYZQ5sLUkMiTZpjMTExnDnDQm6UAAdKg2 lsgaq8WvIB1Yx673JBmi/3wfpiOgj6+QafjuBatj9RAIBua1ZEvwp283bA148WxMLjXQKN3n2wA q9iTk9wW6eprs/tlMK9uaLI7sv/IvzqWOueE2Oi2EKEIYzCA8iTG67jNlMMOCOb9WB7ywTIDqO1 x05Bd/N2YZ6DxAgWKoCkhP9CtAHzyI7U270VeZaO15g1WaO1
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
 drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
index 960432230bbf..3d2600af9fc1 100644
--- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
+++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
@@ -326,7 +326,7 @@ static int cros_ec_cec_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int cros_ec_cec_remove(struct platform_device *pdev)
+static void cros_ec_cec_remove(struct platform_device *pdev)
 {
 	struct cros_ec_cec *cros_ec_cec = platform_get_drvdata(pdev);
 	struct device *dev = &pdev->dev;
@@ -346,13 +346,11 @@ static int cros_ec_cec_remove(struct platform_device *pdev)
 	cec_notifier_cec_adap_unregister(cros_ec_cec->notify,
 					 cros_ec_cec->adap);
 	cec_unregister_adapter(cros_ec_cec->adap);
-
-	return 0;
 }
 
 static struct platform_driver cros_ec_cec_driver = {
 	.probe = cros_ec_cec_probe,
-	.remove  = cros_ec_cec_remove,
+	.remove_new = cros_ec_cec_remove,
 	.driver = {
 		.name = DRV_NAME,
 		.pm = &cros_ec_cec_pm_ops,
-- 
2.39.2

