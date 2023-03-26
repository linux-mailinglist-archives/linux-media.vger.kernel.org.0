Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F9A76C95B5
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:34:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232564AbjCZOen (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:34:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232563AbjCZOdL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:33:11 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04C807D94
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:33:00 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQI-0008RT-HP; Sun, 26 Mar 2023 16:32:42 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQF-006rdF-IL; Sun, 26 Mar 2023 16:32:39 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQD-0088XO-Ig; Sun, 26 Mar 2023 16:32:37 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Yang Li <yang.lee@linux.alibaba.com>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Dan Carpenter <error27@gmail.com>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 056/117] media: rzg2l-csi2: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:31:23 +0200
Message-Id: <20230326143224.572654-59-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1924; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=zzC69ruW9ymPVD8svgpuKUjORivZYVq9oniixuEC948=; b=owGbwMvMwMXY3/A7olbonx/jabUkhhSFsFMnHX6255jxs96vY4vvdYvoLzo2jaXyleftL2W38 p6trlrayWjMwsDIxSArpshi37gm06pKLrJz7b/LMINYmUCmMHBxCsBEPvKz/6+c+un2sxLDT8kT K8ISPLQ2Fx69+qvscnFcYn86x5JN2kVTj4ruCnxZ8vz4E5F7U5l+HM0+Ocdo78nX0T8WW5Y7/bn V2nUnanvmgYBoLmeznAfJZziuTZ8oGCesLvy5Nev2gbs+AudOOi/czXab2/XZ/8royqN3nvAWxe b2/po+c1XO5vMdLc8rhDRNu9T8Tq1wesh+KmpK0/WY0M+WqT9tPYVfOH8r+nJFRlFZK0e7WawvK 5PHPVpPnclxY0bECWWV8rrPTLr15T5+EsJvmz6ptSst4w8TPHZ7SZ+KJlecTUDx+S9JoZd4tcXV DIylYqddWvyVaf6FM17nJscLfNuruuZLa2W3TA77+g1KAA==
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
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index 384fb54e219a..30dad7383654 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -819,7 +819,7 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int rzg2l_csi2_remove(struct platform_device *pdev)
+static void rzg2l_csi2_remove(struct platform_device *pdev)
 {
 	struct rzg2l_csi2 *csi2 = platform_get_drvdata(pdev);
 
@@ -829,8 +829,6 @@ static int rzg2l_csi2_remove(struct platform_device *pdev)
 	v4l2_subdev_cleanup(&csi2->subdev);
 	media_entity_cleanup(&csi2->subdev.entity);
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 static int __maybe_unused rzg2l_csi2_pm_runtime_suspend(struct device *dev)
@@ -859,7 +857,7 @@ static const struct of_device_id rzg2l_csi2_of_table[] = {
 };
 
 static struct platform_driver rzg2l_csi2_pdrv = {
-	.remove	= rzg2l_csi2_remove,
+	.remove_new = rzg2l_csi2_remove,
 	.probe	= rzg2l_csi2_probe,
 	.driver	= {
 		.name = "rzg2l-csi2",
-- 
2.39.2

