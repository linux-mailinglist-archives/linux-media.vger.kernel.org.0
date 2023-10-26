Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F1227D8080
	for <lists+linux-media@lfdr.de>; Thu, 26 Oct 2023 12:18:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbjJZKSh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Oct 2023 06:18:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229639AbjJZKSg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Oct 2023 06:18:36 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A849D1A7
        for <linux-media@vger.kernel.org>; Thu, 26 Oct 2023 03:18:33 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qvxRc-0002nf-A9; Thu, 26 Oct 2023 12:18:28 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qvxRb-004O1u-S9; Thu, 26 Oct 2023 12:18:27 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qvxRb-006XTy-IX; Thu, 26 Oct 2023 12:18:27 +0200
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
Subject: [PATCH 1/3] media: meson-ir-tx: Convert to use devm_rc_register_device()
Date:   Thu, 26 Oct 2023 12:18:18 +0200
Message-ID: <20231026101816.2460464-6-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231026101816.2460464-5-u.kleine-koenig@pengutronix.de>
References: <20231026101816.2460464-5-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1486; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=+gu7PsQ78lu/drAjNNP19vItgRnGPLGh6eKbIvernDA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlOjzq2KqF2O8O/rskyEMRysHku4n4pOk8KXFCf x5HpCgkY2+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZTo86gAKCRCPgPtYfRL+ TvcRB/4rd+V6XNLjuRxwdcLJzw6xCKG9UDWs9T7/yj4zrqlxcGZDbpiAgoR0NshP2YXVzc28tcg nMkrVP+xy+gPgdzIkp6lG/BQOIVXNKyzIFuXbKyPbDZi+TTiii8eTN+sjhpGxDQoEpm4Wc0FvTG QwdiGSEsaqXli4ufKoD7r1kNtgm6qNO8dd7nsrLrMwEWfCsaO7eEzGRxU19H3NxCsszezhpgsjz WRNBDqFt5MJRyr90G/REyOgox+5Vq8df9PPfZGMA9HCJihiBk6d7yR7z8YOZXDwKvQyITPgyg6e n1+KIp6zEp+chcq+jd352FCoYHJ+OkkOX4kFAJxY2K46IXmL
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

With that the remove callback can go away and also setting driver data
becomes superfluous.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/media/rc/meson-ir-tx.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/media/rc/meson-ir-tx.c b/drivers/media/rc/meson-ir-tx.c
index 6355b79893fb..dab548dc6302 100644
--- a/drivers/media/rc/meson-ir-tx.c
+++ b/drivers/media/rc/meson-ir-tx.c
@@ -360,25 +360,16 @@ static int __init meson_irtx_probe(struct platform_device *pdev)
 	rc->s_tx_carrier = meson_irtx_set_carrier;
 	rc->s_tx_duty_cycle = meson_irtx_set_duty_cycle;
 
-	ret = rc_register_device(rc);
+	ret = devm_rc_register_device(dev, rc);
 	if (ret < 0) {
 		dev_err(dev, "rc_dev registration failed\n");
 		rc_free_device(rc);
 		return ret;
 	}
 
-	platform_set_drvdata(pdev, rc);
-
 	return 0;
 }
 
-static void meson_irtx_remove(struct platform_device *pdev)
-{
-	struct rc_dev *rc = platform_get_drvdata(pdev);
-
-	rc_unregister_device(rc);
-}
-
 static const struct of_device_id meson_irtx_dt_match[] = {
 	{
 		.compatible = "amlogic,meson-g12a-ir-tx",
@@ -388,7 +379,6 @@ static const struct of_device_id meson_irtx_dt_match[] = {
 MODULE_DEVICE_TABLE(of, meson_irtx_dt_match);
 
 static struct platform_driver meson_irtx_pd = {
-	.remove_new = meson_irtx_remove,
 	.driver = {
 		.name = DRIVER_NAME,
 		.of_match_table = meson_irtx_dt_match,
-- 
2.42.0

