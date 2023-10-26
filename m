Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51E077D8082
	for <lists+linux-media@lfdr.de>; Thu, 26 Oct 2023 12:18:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230365AbjJZKSk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Oct 2023 06:18:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229785AbjJZKSg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Oct 2023 06:18:36 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A75F41A5
        for <linux-media@vger.kernel.org>; Thu, 26 Oct 2023 03:18:33 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qvxRc-0002oI-MQ; Thu, 26 Oct 2023 12:18:28 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qvxRc-004O20-8x; Thu, 26 Oct 2023 12:18:28 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qvxRb-006XU6-Vn; Thu, 26 Oct 2023 12:18:27 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, kernel@pengutronix.de
Subject: [PATCH 3/3] media: meson-ir-tx: Drop usage of platform_driver_probe()
Date:   Thu, 26 Oct 2023 12:18:20 +0200
Message-ID: <20231026101816.2460464-8-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231026101816.2460464-5-u.kleine-koenig@pengutronix.de>
References: <20231026101816.2460464-5-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1933; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=vc0rJ8a46VVSlA0HFx7Dn4WOCC0eWWSYg5tIiKkiq4M=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlOjzsCB78wx1ZkNeeTKhvksKu4eVjXNuc4O1qP eCAsxs+oACJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZTo87AAKCRCPgPtYfRL+ Tp58CACHg1uU+5cM/jq9rx7aO0xIbGNXGC/vIpXdtfz8Wx22dfmnQex6v/mAR3r+IGhX5qbP60E G1yZwI8RlMSg2UjLJydp7ct02Gmf6063fpykCZehxH+aMRrJXQ7KiqqA1A2Y4BiX25SCyTfMabA IyFaw8nXz5X7UNF/YXfxPNCIcyeVTtk2oxU+doQ7CPa0FT+/PMec5ZL7jMI2IduUlFqFNPfMAXt zWQVV5cAcrg0IIa4WZPKWedxr6zGp/9oA+VzwOj8FHRIA18VLx+GCY5GK/oKt8C84XRDT3akcHC YB7ZSWebXRVJ5X1o8dlZOvXygWBMNHLR3wd4Z72dfiVgk3+R
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The benefit of platform_driver_probe() here is only that the probe
function can be discarded after the driver is loaded. For an ARCH=arm
allmodconfig that's 952 bytes, for an allnoconfig + IR_MESON_TX=y it's
only 452 bytes. The downside is that the driver isn't dynamically
bindable and unbindable.

There are considerations to drop platform_driver_probe() as a concept
that isn't relevant any more today. It comes with an added complexity
that makes many users hold it wrong. (E.g. this driver didn't benefit
as much as it could as of v6.6-rc1 as meson_irtx_remove() could have
been marked with __exit.)

The advantages are not that relevant any more today, so convert this
driver to an ordinary platform driver.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/media/rc/meson-ir-tx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/rc/meson-ir-tx.c b/drivers/media/rc/meson-ir-tx.c
index bd85361d561f..fded2c256f2a 100644
--- a/drivers/media/rc/meson-ir-tx.c
+++ b/drivers/media/rc/meson-ir-tx.c
@@ -305,7 +305,7 @@ static int meson_irtx_mod_clock_probe(struct meson_irtx *ir,
 	return 0;
 }
 
-static int __init meson_irtx_probe(struct platform_device *pdev)
+static int meson_irtx_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct meson_irtx *ir;
@@ -375,13 +375,13 @@ static const struct of_device_id meson_irtx_dt_match[] = {
 MODULE_DEVICE_TABLE(of, meson_irtx_dt_match);
 
 static struct platform_driver meson_irtx_pd = {
+	.probe = meson_irtx_probe,
 	.driver = {
 		.name = DRIVER_NAME,
 		.of_match_table = meson_irtx_dt_match,
 	},
 };
-
-module_platform_driver_probe(meson_irtx_pd, meson_irtx_probe);
+module_platform_driver(meson_irtx_pd);
 
 MODULE_DESCRIPTION("Meson IR TX driver");
 MODULE_AUTHOR("Viktor Prutyanov <viktor.prutyanov@phystech.edu>");
-- 
2.42.0

