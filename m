Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E022B6C9525
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:32:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232375AbjCZOcj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:32:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232349AbjCZOcf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:32:35 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 577AB6A69
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:33 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ7-0007s7-Bc; Sun, 26 Mar 2023 16:32:31 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ6-006raJ-Mg; Sun, 26 Mar 2023 16:32:30 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ6-0088V8-2a; Sun, 26 Mar 2023 16:32:30 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 021/117] media: coda-common: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:30:48 +0200
Message-Id: <20230326143224.572654-24-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1811; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=1IVnZnh/c0JmafKC5kvWTPn+P1RgK/mXq3W9vTxKosc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFaghG8oN6s1LWjjTG7NgOzN+TN9onfjkTAh8 xf+MW2XHRSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBWoAAKCRCPgPtYfRL+ Tgj8B/4vYPfZgrZMMLAUKmleF1wqaPGThMtYwnFPcICrCvwd+UerWR22rDD42BDCsH2tOnNSGGK QRAh8NGkFJrx+9hNeeApyWV94V555GLkC2CUQj6KcfrULww6L4ne32P3bqKzd+vEBd16xrY134A OPFZ4t19pDkCGhrT+MwRZbCHNBTKnD11Q6GJATjsum4ZrsNWDXNhFVsjRjc4mDvkD/IsJ+47Vqm hOaAiTYMcoEsYx3eucgfHWYzNQ8Gmxq5dtXo8Tf6jEAOhMeiHwvsDcHvKehsw9QoyUqMU0yTvnp h3GVimiNkY7Bo6/D9DGLxkXY2J3MgjhFoJ13t94la/WkW+H3
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
 drivers/media/platform/chips-media/coda-common.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/chips-media/coda-common.c b/drivers/media/platform/chips-media/coda-common.c
index af71eea04dbd..d013ea5d9d3d 100644
--- a/drivers/media/platform/chips-media/coda-common.c
+++ b/drivers/media/platform/chips-media/coda-common.c
@@ -3300,7 +3300,7 @@ static int coda_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int coda_remove(struct platform_device *pdev)
+static void coda_remove(struct platform_device *pdev)
 {
 	struct coda_dev *dev = platform_get_drvdata(pdev);
 	int i;
@@ -3322,7 +3322,6 @@ static int coda_remove(struct platform_device *pdev)
 	coda_free_aux_buf(dev, &dev->workbuf);
 	debugfs_remove_recursive(dev->debugfs_root);
 	ida_destroy(&dev->ida);
-	return 0;
 }
 
 #ifdef CONFIG_PM
@@ -3347,7 +3346,7 @@ static const struct dev_pm_ops coda_pm_ops = {
 
 static struct platform_driver coda_driver = {
 	.probe	= coda_probe,
-	.remove	= coda_remove,
+	.remove_new = coda_remove,
 	.driver	= {
 		.name	= CODA_NAME,
 		.of_match_table = coda_dt_ids,
-- 
2.39.2

