Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B268E6D4C1C
	for <lists+linux-media@lfdr.de>; Mon,  3 Apr 2023 17:40:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232942AbjDCPk0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Apr 2023 11:40:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229866AbjDCPkZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Apr 2023 11:40:25 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A576726A5
        for <linux-media@vger.kernel.org>; Mon,  3 Apr 2023 08:40:24 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pjMI9-0004dE-EM; Mon, 03 Apr 2023 17:40:21 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pjMI8-008ibF-9k; Mon, 03 Apr 2023 17:40:20 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pjMI7-00AHxH-C1; Mon, 03 Apr 2023 17:40:19 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        kernel@pengutronix.de
Subject: [PATCH 13/24] staging: media: omap4iss: Convert to platform remove callback returning void
Date:   Mon,  3 Apr 2023 17:40:03 +0200
Message-Id: <20230403154014.2564054-14-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230403154014.2564054-1-u.kleine-koenig@pengutronix.de>
References: <20230403154014.2564054-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1710; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=LmttZmjRipsYfunmAVzJW77JKrXaCtcrPUXwbO+3O+o=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKvNEs/ISVMXu+uvDduq6KvwDWXFnAeckCQiAJ K6+3i+469aJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCrzRAAKCRCPgPtYfRL+ Tvw8B/4yHEFO6+EDpP4SnSGogp/Z2+nk8ljGPuz0Huq4ih/Atu70vz35GiRFCSBNOCLvHk4oqVA X2Xln/pEg8nHoBfT4JqHx4xv9zeMZF7enIQLUk0yIGjRiW0bGLadKBmtGn6GYmp0QVIyy/aPD4z uYagMWp7KNB9t44WH2F9emFxhNbBGi8QU7wOxSUgKOvdpRsFqO6yrnirz2FoBBkbuB26srB8vA5 8oVOfijSGh7HxUD2ghdR5wnlfifaPCg/WRVD5MLy6pSOgn9bm01xChiA4HVbTXvAFSIraqXC82m kY7KDY1cNT5gHMziSJyAkWVhwcNMVNds1PO8rj6qDlnMTKAk
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
 drivers/staging/media/omap4iss/iss.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/omap4iss/iss.c b/drivers/staging/media/omap4iss/iss.c
index fa2a36d829d3..0c4283bb48ad 100644
--- a/drivers/staging/media/omap4iss/iss.c
+++ b/drivers/staging/media/omap4iss/iss.c
@@ -1323,15 +1323,13 @@ static int iss_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int iss_remove(struct platform_device *pdev)
+static void iss_remove(struct platform_device *pdev)
 {
 	struct iss_device *iss = platform_get_drvdata(pdev);
 
 	iss_unregister_entities(iss);
 	media_entity_enum_cleanup(&iss->crashed);
 	iss_cleanup_modules(iss);
-
-	return 0;
 }
 
 static const struct platform_device_id omap4iss_id_table[] = {
@@ -1342,7 +1340,7 @@ MODULE_DEVICE_TABLE(platform, omap4iss_id_table);
 
 static struct platform_driver iss_driver = {
 	.probe		= iss_probe,
-	.remove		= iss_remove,
+	.remove_new	= iss_remove,
 	.id_table	= omap4iss_id_table,
 	.driver = {
 		.name	= "omap4iss",
-- 
2.39.2

