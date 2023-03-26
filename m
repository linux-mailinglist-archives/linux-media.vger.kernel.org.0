Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BEF56C9586
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:33:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231877AbjCZOdz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:33:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232433AbjCZOcy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:32:54 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA84A7ED2
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:52 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQO-0000Fg-Sl; Sun, 26 Mar 2023 16:32:48 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQM-006rfw-Hz; Sun, 26 Mar 2023 16:32:46 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQL-0088Zh-Dn; Sun, 26 Mar 2023 16:32:45 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        kernel@pengutronix.de
Subject: [PATCH 092/117] media: hantro_drv: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:31:59 +0200
Message-Id: <20230326143224.572654-95-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1845; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=TN8gitWclwX0bEZHPliWL+MpMfLhdwSxRa3vI9fej70=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFbz+QQp+nHH7O8XtcFcJSBkWVdls+Q9/cJxR 6ZND9lYh66JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBW8wAKCRCPgPtYfRL+ TkVtCACK0akQVv6Lp3WSIDoAtHERnPMPO49yB0zmpuOZE5kKHqReCRF2EDGls/IByydhEcpNnKq TWvZmrp26l21NstAP98GPS/R5pu2lOgcA4w5QU0JinvMx8CVQfV/et3GGhN5eUEys164wI0t1xz b1rx6FXjsnFkcRkrkmNYzyF879IMj4kip4X4n0GOKbN0fs011q1cicnQKnIwuBmKSxM234b7bDE DYX7rgDmsFeQXsbAQKuhTQ/1Ywiy0SkPmc1+0ko07QoYiQ7uQpDeueR70MNf1naeHzD6J9lmiad Zc9kHofDAaX7T5CX6EnqXrD7H5T0DQdnyrRFFxqpVxS5FwkS
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
 drivers/media/platform/verisilicon/hantro_drv.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index b0aeedae7b65..ddec42d0bd49 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -1093,7 +1093,7 @@ static int hantro_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int hantro_remove(struct platform_device *pdev)
+static void hantro_remove(struct platform_device *pdev)
 {
 	struct hantro_dev *vpu = platform_get_drvdata(pdev);
 
@@ -1109,7 +1109,6 @@ static int hantro_remove(struct platform_device *pdev)
 	reset_control_assert(vpu->resets);
 	pm_runtime_dont_use_autosuspend(vpu->dev);
 	pm_runtime_disable(vpu->dev);
-	return 0;
 }
 
 #ifdef CONFIG_PM
@@ -1132,7 +1131,7 @@ static const struct dev_pm_ops hantro_pm_ops = {
 
 static struct platform_driver hantro_driver = {
 	.probe = hantro_probe,
-	.remove = hantro_remove,
+	.remove_new = hantro_remove,
 	.driver = {
 		   .name = DRIVER_NAME,
 		   .of_match_table = of_match_ptr(of_hantro_match),
-- 
2.39.2

