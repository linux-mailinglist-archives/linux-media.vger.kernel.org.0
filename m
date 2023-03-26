Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 581906C9571
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:33:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232060AbjCZOdd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:33:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232450AbjCZOcs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:32:48 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24E147ABB
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:47 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQI-0008QU-68; Sun, 26 Mar 2023 16:32:42 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQF-006rd8-97; Sun, 26 Mar 2023 16:32:39 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQD-0088XD-5M; Sun, 26 Mar 2023 16:32:37 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 054/117] media: renesas-ceu: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:31:21 +0200
Message-Id: <20230326143224.572654-57-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1768; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=u7QKai25ZD7du91fx2gh05IHciAlfyNOryov1W77jCE=; b=owGbwMvMwMXY3/A7olbonx/jabUkhhSFsOMVd/3zfu9OZj9q2cr1MlY4aKG99wNB9iM9N3gY1 1z4/lS7k9GYhYGRi0FWTJHFvnFNplWVXGTn2n+XYQaxMoFMYeDiFICJrFBm/8NZp1tyMaC9S1Jm 9sP1vHyNa3fW5F/n9OA1dndecSHK8kmOXNIUu+NO/js1LCpLXSfllx7tPmZ20v3fEjHT4If6Dqk Nti+ZLp9mcVWMURHY2X+pouIJ+w7F+DXla6Wu2lyu/nz9gGpYxydP1/gjnC+T/siF81YfZwx3cp fv2tpvueJwcqbQxhJN3XrjOWLNNm9XJ/dO/r20eKa37/xtjrkxs5jv/P65+1urVnvgJSXxW0V8c T2LXsQK3r2wdWJfXeuPsp6Np4XSJRLVJblPVncJbS8Izg0UVbAVStki77b+7kaNk6mTcxZwCS1+ fu3+lpS1Di/2SLbHsO2Ymmeolv2zbdm3aT7qpUF5u+wA
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
 drivers/media/platform/renesas/renesas-ceu.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/renesas/renesas-ceu.c b/drivers/media/platform/renesas/renesas-ceu.c
index f70f91b006b7..02d1ab23d76d 100644
--- a/drivers/media/platform/renesas/renesas-ceu.c
+++ b/drivers/media/platform/renesas/renesas-ceu.c
@@ -1709,7 +1709,7 @@ static int ceu_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int ceu_remove(struct platform_device *pdev)
+static void ceu_remove(struct platform_device *pdev)
 {
 	struct ceu_device *ceudev = platform_get_drvdata(pdev);
 
@@ -1722,8 +1722,6 @@ static int ceu_remove(struct platform_device *pdev)
 	v4l2_device_unregister(&ceudev->v4l2_dev);
 
 	video_unregister_device(&ceudev->vdev);
-
-	return 0;
 }
 
 static const struct dev_pm_ops ceu_pm_ops = {
@@ -1739,7 +1737,7 @@ static struct platform_driver ceu_driver = {
 		.of_match_table = of_match_ptr(ceu_of_match),
 	},
 	.probe		= ceu_probe,
-	.remove		= ceu_remove,
+	.remove_new	= ceu_remove,
 };
 
 module_platform_driver(ceu_driver);
-- 
2.39.2

