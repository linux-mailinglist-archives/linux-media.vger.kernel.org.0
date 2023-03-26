Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE5826C9536
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:32:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232447AbjCZOcv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:32:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232371AbjCZOcg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:32:36 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A5087A8D
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:34 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ6-0007pl-GU; Sun, 26 Mar 2023 16:32:30 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ5-006rZp-KM; Sun, 26 Mar 2023 16:32:29 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ4-0088Ug-I6; Sun, 26 Mar 2023 16:32:28 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Subject: [PATCH 014/117] media: ge2d: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:30:41 +0200
Message-Id: <20230326143224.572654-17-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1851; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=1Y2LMBpcPDvt234Wp0dDVBnpVYLd4OVe9vUMJb/0CJo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFaPHpPZLurdzamlVy431QhD+mjXxTj3yEi11 b3JX4DQ1+eJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBWjwAKCRCPgPtYfRL+ TokHB/oCVX586LRzYvkBN8oWwTVDT73e7QvszRskadSAbTyrdfG0dcliNNP2ISe6ZClTGMsX//c ojHnF2SfwNbxw1J/KhNver2BUCsy1bQ0sMHPsVpJ1HHhQ7ZxOAT3MYwydcrytIyk+UHZ0K5wcWU jLAfkcBDkCvQfzI5fcZPFEsnUpHmslqTLrKCpVtu0wJ/kgwOSL4yHDt95bFIICKuWj5W6hjEYjn 1ibxLueJ8kwI6/hCJH71RofwjUL+JS/dqvhAYgPWid6NjljemM4La2jMWgNLxSKW3q7JsmT/e6i YUNsIz2i0t8LnFBj9d/gdt31vCQwmE37Kew1ZVkpPGb7cbPq
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
 drivers/media/platform/amlogic/meson-ge2d/ge2d.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/amlogic/meson-ge2d/ge2d.c b/drivers/media/platform/amlogic/meson-ge2d/ge2d.c
index 142d421a8d76..09409908ba5d 100644
--- a/drivers/media/platform/amlogic/meson-ge2d/ge2d.c
+++ b/drivers/media/platform/amlogic/meson-ge2d/ge2d.c
@@ -1024,7 +1024,7 @@ static int ge2d_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int ge2d_remove(struct platform_device *pdev)
+static void ge2d_remove(struct platform_device *pdev)
 {
 	struct meson_ge2d *ge2d = platform_get_drvdata(pdev);
 
@@ -1032,8 +1032,6 @@ static int ge2d_remove(struct platform_device *pdev)
 	v4l2_m2m_release(ge2d->m2m_dev);
 	v4l2_device_unregister(&ge2d->v4l2_dev);
 	clk_disable_unprepare(ge2d->clk);
-
-	return 0;
 }
 
 static const struct of_device_id meson_ge2d_match[] = {
@@ -1047,7 +1045,7 @@ MODULE_DEVICE_TABLE(of, meson_ge2d_match);
 
 static struct platform_driver ge2d_drv = {
 	.probe = ge2d_probe,
-	.remove = ge2d_remove,
+	.remove_new = ge2d_remove,
 	.driver = {
 		.name = "meson-ge2d",
 		.of_match_table = meson_ge2d_match,
-- 
2.39.2

