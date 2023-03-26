Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE5A26C95AD
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:34:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232546AbjCZOef (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:34:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232536AbjCZOdH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:33:07 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79FB365B7
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:58 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQR-0000RA-8t; Sun, 26 Mar 2023 16:32:51 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQP-006rh7-CS; Sun, 26 Mar 2023 16:32:49 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQO-0088ae-JD; Sun, 26 Mar 2023 16:32:48 +0200
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
Subject: [PATCH 106/117] media: meson-ir-tx: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:32:13 +0200
Message-Id: <20230326143224.572654-109-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1674; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=kHPP5cAhCKQcnI3fcuUH21X+adxb7h92mrf8biP7X1I=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFc2doI8Irf3L+APeL6fQdlbpWqvKqvbIdtL/ 9AfRTr1y3OJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBXNgAKCRCPgPtYfRL+ TiQPB/43rKAeYEk5tngWQ1afUwcGeaTDq/Ex5Lt4HVQ67loUPt2JA9ipfAI7uBnjBX/qYBEDItC 6TV00fMu6QEnNHjgyvSfDyiFqfQ6ccXaPLZEl6Z7E6dddPgGZevqg4rZ7iNmX4soGou0pfDaYy6 8A+ipF0AiIthobt2ZuQv3FmYh7Oo5e8f1AzZXUd5wdCfTCgk3VRarWs4LcTx4csFSMxPGOxWYkO wrcMO1sXIe/Z1+udrBVRtvdQqBHYccSxi+RdXAp0HDWuU+FesUaUGHNoXEFWKcbbmIS4Bez7Ll0 cYhPJ/8L6A61O91JsfUuakFBXJwy8/Tl/zJzDgff0M1N2IiZ
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
 drivers/media/rc/meson-ir-tx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/rc/meson-ir-tx.c b/drivers/media/rc/meson-ir-tx.c
index abdb62b16e98..6355b79893fb 100644
--- a/drivers/media/rc/meson-ir-tx.c
+++ b/drivers/media/rc/meson-ir-tx.c
@@ -372,13 +372,11 @@ static int __init meson_irtx_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int meson_irtx_remove(struct platform_device *pdev)
+static void meson_irtx_remove(struct platform_device *pdev)
 {
 	struct rc_dev *rc = platform_get_drvdata(pdev);
 
 	rc_unregister_device(rc);
-
-	return 0;
 }
 
 static const struct of_device_id meson_irtx_dt_match[] = {
@@ -390,7 +388,7 @@ static const struct of_device_id meson_irtx_dt_match[] = {
 MODULE_DEVICE_TABLE(of, meson_irtx_dt_match);
 
 static struct platform_driver meson_irtx_pd = {
-	.remove = meson_irtx_remove,
+	.remove_new = meson_irtx_remove,
 	.driver = {
 		.name = DRIVER_NAME,
 		.of_match_table = meson_irtx_dt_match,
-- 
2.39.2

