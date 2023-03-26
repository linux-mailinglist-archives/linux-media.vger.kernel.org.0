Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDCB36C9572
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:33:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232443AbjCZOde (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:33:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232455AbjCZOcs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:32:48 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DC2D7DA7
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:48 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQJ-0008UF-Iv; Sun, 26 Mar 2023 16:32:43 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQH-006re1-0O; Sun, 26 Mar 2023 16:32:41 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQG-0088Y8-6n; Sun, 26 Mar 2023 16:32:40 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 068/117] media: camif-core: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:31:35 +0200
Message-Id: <20230326143224.572654-71-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1950; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=Cv5AoPt1iE8Vv29bdDGa7hcCGTrahdWceom2lSpe14o=; b=owGbwMvMwMXY3/A7olbonx/jabUkhhSFsOvetjV81Q58Fbt+rNTmzeWvryg6HCmmy155oZhvp kXXvB+djMYsDIxcDLJiiiz2jWsyrarkIjvX/rsMM4iVCWQKAxenAEzkwhkOhllX1jeY7Huz/WXT LZ3bbfcvOiV9Yn8uvDfXmGemWEbLc77vrQms3P+d9NnM11SHaGV7zldsOtVyiPXvjMfWBive+K4 rij4X4uWa8LChStZhYmiCaYp8ScmEwrxnTfGrNe9tv73i24UV9k32hzhLDQ33R+s328YI/Wh43m xWuLvm+0oJ476jVeU/ndYmsmeK+k4QNBHUu+oSHtiyY36Ml8LeE2JbNRI9FRuiym+YZ3EFX0h+y jm3rEPhtMJaxV5b40k1+gcm7PkQ+3rG7duGn52yXy4qei607aD84zcPJ8xyWtButscyP8yx3/HV q9MvJpzf4DOxSjBpXubX193Gr/5qbW3cLrbmgPEtpThPAA==
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
 drivers/media/platform/samsung/s3c-camif/camif-core.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/samsung/s3c-camif/camif-core.c b/drivers/media/platform/samsung/s3c-camif/camif-core.c
index 6e8ef86566b7..0b50183d9230 100644
--- a/drivers/media/platform/samsung/s3c-camif/camif-core.c
+++ b/drivers/media/platform/samsung/s3c-camif/camif-core.c
@@ -507,7 +507,7 @@ static int s3c_camif_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int s3c_camif_remove(struct platform_device *pdev)
+static void s3c_camif_remove(struct platform_device *pdev)
 {
 	struct camif_dev *camif = platform_get_drvdata(pdev);
 	struct s3c_camif_plat_data *pdata = &camif->pdata;
@@ -521,8 +521,6 @@ static int s3c_camif_remove(struct platform_device *pdev)
 	camif_clk_put(camif);
 	s3c_camif_unregister_subdev(camif);
 	pdata->gpio_put();
-
-	return 0;
 }
 
 static int s3c_camif_runtime_resume(struct device *dev)
@@ -623,7 +621,7 @@ static const struct dev_pm_ops s3c_camif_pm_ops = {
 
 static struct platform_driver s3c_camif_driver = {
 	.probe		= s3c_camif_probe,
-	.remove		= s3c_camif_remove,
+	.remove_new	= s3c_camif_remove,
 	.id_table	= s3c_camif_driver_ids,
 	.driver = {
 		.name	= S3C_CAMIF_DRIVER_NAME,
-- 
2.39.2

