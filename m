Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0E9D6C95B4
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:34:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232556AbjCZOem (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:34:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232142AbjCZOdM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:33:12 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD0E26594
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:33:01 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQS-0000Uf-44; Sun, 26 Mar 2023 16:32:52 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQQ-006rhR-7B; Sun, 26 Mar 2023 16:32:50 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQP-0088aq-7x; Sun, 26 Mar 2023 16:32:49 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Patrice Chotard <patrice.chotard@foss.st.com>,
        Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 109/117] media: st_rc: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:32:16 +0200
Message-Id: <20230326143224.572654-112-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1688; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=dilEHo9govXasHtT6jWDl0EFBpcoZnlFPvF1NoaXW08=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFdDqXno4N3eqHrFThAzYL2IsNFr1wOEudN0m 0xs9SPDsUWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBXQwAKCRCPgPtYfRL+ TpNeB/0UFMgu71GFrUTtlRgTTOuMjbuLF+RRHNKO76bdSr9qPImRQ0CcLhjSrAmUBGkhRwhPWHC bpQ7RjazFWwPrbO0lUuFyX/bX9Jvl+Yo7vhGfadRsn21uN5gb/+au+OAFIdsqHx9RwxntqT65+j MN50OvFz9FcnG7HRvgNqEu7HRgw9MdUq8vazOzLszUsdzrVlveka3agPPuJ1sgbIigHYHu3QkIi n5g5LwzaRz4tSVfAik4FLjOXH1DWwqhCvPKOocrdIe57d1bUeD3liOLIRJziEEHcq6kdI4F4OUx SeNve2/BRB9NDkNYY8OsuIeXE+hF2EsYSoim6ifcy7RqctDa
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
 drivers/media/rc/st_rc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/rc/st_rc.c b/drivers/media/rc/st_rc.c
index 19e987a048cc..28477aa95563 100644
--- a/drivers/media/rc/st_rc.c
+++ b/drivers/media/rc/st_rc.c
@@ -194,7 +194,7 @@ static int st_rc_hardware_init(struct st_rc_device *dev)
 	return 0;
 }
 
-static int st_rc_remove(struct platform_device *pdev)
+static void st_rc_remove(struct platform_device *pdev)
 {
 	struct st_rc_device *rc_dev = platform_get_drvdata(pdev);
 
@@ -202,7 +202,6 @@ static int st_rc_remove(struct platform_device *pdev)
 	device_init_wakeup(&pdev->dev, false);
 	clk_disable_unprepare(rc_dev->sys_clock);
 	rc_unregister_device(rc_dev->rdev);
-	return 0;
 }
 
 static int st_rc_open(struct rc_dev *rdev)
@@ -408,7 +407,7 @@ static struct platform_driver st_rc_driver = {
 		.pm     = &st_rc_pm_ops,
 	},
 	.probe = st_rc_probe,
-	.remove = st_rc_remove,
+	.remove_new = st_rc_remove,
 };
 
 module_platform_driver(st_rc_driver);
-- 
2.39.2

