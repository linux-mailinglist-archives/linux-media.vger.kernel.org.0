Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C60216C951F
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:32:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232362AbjCZOcg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:32:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232323AbjCZOce (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:32:34 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B66AF59DB
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:32 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ4-0007lN-Qf; Sun, 26 Mar 2023 16:32:28 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ4-006rZC-4F; Sun, 26 Mar 2023 16:32:28 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ2-0088U6-JU; Sun, 26 Mar 2023 16:32:26 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Subject: [PATCH 005/117] media: ao-cec: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:30:32 +0200
Message-Id: <20230326143224.572654-8-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1917; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=T42yo2zTTmIkn3GXSFDOaa/xozG97/RfNm55diexSxI=; b=owGbwMvMwMXY3/A7olbonx/jabUkhhSFsJovD344vJ19Nu3j9tuvcjkPH01uN1b2VZC26H36b 1vXTO9pnYzGLAyMXAyyYoos9o1rMq2q5CI71/67DDOIlQlkCgMXpwBMZMYCDoZOlmdfKxeylh38 lMt5wERbf8WFaq/GQGH5Sn2xpErPvyfjAy4fv/r83K2bHRJqXoX2J8uDo0OuXG7Sd/xkZeCpdjB gxu/88iklj4OcNuZKrPNMVYu4retkYd528P37NVmc+VYMBhHXM1vSlNmetLL28LxJSuruPJR/W6 v3+NUl+u28m1sbjSzCyrZlXImrzk943WZasXL7f9XbiY93nTxbs7F+tmJW7temi6/f+703u1K8J 7Uq7dbFnEeLjtWba5n8nvby0uvGD40CQd98izLrbk34+s80S9NI+5uoU5SA7++m0N1PtaV+W6om TpK+5CNlbNO25ALr8buOYl/MXnAfmPbnpezztVvazWrMAQ==
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
 drivers/media/cec/platform/meson/ao-cec.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/cec/platform/meson/ao-cec.c b/drivers/media/cec/platform/meson/ao-cec.c
index 6b440f0635d9..f6f51a34f7bd 100644
--- a/drivers/media/cec/platform/meson/ao-cec.c
+++ b/drivers/media/cec/platform/meson/ao-cec.c
@@ -696,7 +696,7 @@ static int meson_ao_cec_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int meson_ao_cec_remove(struct platform_device *pdev)
+static void meson_ao_cec_remove(struct platform_device *pdev)
 {
 	struct meson_ao_cec_device *ao_cec = platform_get_drvdata(pdev);
 
@@ -704,8 +704,6 @@ static int meson_ao_cec_remove(struct platform_device *pdev)
 
 	cec_notifier_cec_adap_unregister(ao_cec->notify, ao_cec->adap);
 	cec_unregister_adapter(ao_cec->adap);
-
-	return 0;
 }
 
 static const struct of_device_id meson_ao_cec_of_match[] = {
@@ -716,7 +714,7 @@ MODULE_DEVICE_TABLE(of, meson_ao_cec_of_match);
 
 static struct platform_driver meson_ao_cec_driver = {
 	.probe   = meson_ao_cec_probe,
-	.remove  = meson_ao_cec_remove,
+	.remove_new = meson_ao_cec_remove,
 	.driver  = {
 		.name = "meson-ao-cec",
 		.of_match_table = of_match_ptr(meson_ao_cec_of_match),
-- 
2.39.2

