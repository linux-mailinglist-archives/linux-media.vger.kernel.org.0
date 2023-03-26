Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9F5E6C95A6
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:34:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232541AbjCZOe2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:34:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231258AbjCZOdD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:33:03 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D47813D
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:55 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQQ-0000NA-8i; Sun, 26 Mar 2023 16:32:50 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQO-006rgk-FR; Sun, 26 Mar 2023 16:32:48 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQN-0088aK-Fa; Sun, 26 Mar 2023 16:32:47 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 101/117] media: radio-wl1273: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:32:08 +0200
Message-Id: <20230326143224.572654-104-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1951; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=m+98ILAxhB1JrJH6KUHUClHXYNnJG1ulOPSZ9Z9Phrk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFcWYDIdXbl18q4mKEsMWqof/c2OlbGDW6GbU tcpJpBlauCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBXFgAKCRCPgPtYfRL+ TstXB/sFt1Z1WbSQqQMATnaiD0LF8TFazz+aH/YX/1QvNCbHvgzMB2TzgD6Cq8KV7skTX5J7Bq1 27kZ4121pMpOLwATvDFe8axey6OgN0BsqyzBrhKQ5ox4is843J/l4m1durkzNrPX6/BIzMe1N9k smlHcWsPfu4/NXLOcK2iqVLxQ9uqbIaygmlg+KDMR5OgDtzpKq2154IVwzFr2L3gMJv1CSb/cCS /oxvRINLdVsekxEBarvzCxsZYi7ZoGD0EmbioLrwX2UmOud85Ns/0Rrra6mhv5tGZ3UakdiIhNt lIz5yu/aP2ecC9eWGjivWsH6RDbv+gdQ58vr721KroN3vgOY
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
 drivers/media/radio/radio-wl1273.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/radio/radio-wl1273.c b/drivers/media/radio/radio-wl1273.c
index 484046471c03..e8166eac9efe 100644
--- a/drivers/media/radio/radio-wl1273.c
+++ b/drivers/media/radio/radio-wl1273.c
@@ -1977,7 +1977,7 @@ static const struct video_device wl1273_viddev_template = {
 				  V4L2_CAP_RDS_OUTPUT,
 };
 
-static int wl1273_fm_radio_remove(struct platform_device *pdev)
+static void wl1273_fm_radio_remove(struct platform_device *pdev)
 {
 	struct wl1273_device *radio = platform_get_drvdata(pdev);
 	struct wl1273_core *core = radio->core;
@@ -1990,8 +1990,6 @@ static int wl1273_fm_radio_remove(struct platform_device *pdev)
 	v4l2_ctrl_handler_free(&radio->ctrl_handler);
 	video_unregister_device(&radio->videodev);
 	v4l2_device_unregister(&radio->v4l2dev);
-
-	return 0;
 }
 
 static int wl1273_fm_radio_probe(struct platform_device *pdev)
@@ -2147,7 +2145,7 @@ static int wl1273_fm_radio_probe(struct platform_device *pdev)
 
 static struct platform_driver wl1273_fm_radio_driver = {
 	.probe		= wl1273_fm_radio_probe,
-	.remove		= wl1273_fm_radio_remove,
+	.remove_new	= wl1273_fm_radio_remove,
 	.driver		= {
 		.name	= "wl1273_fm_radio",
 	},
-- 
2.39.2

