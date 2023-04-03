Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79DC26D4C2B
	for <lists+linux-media@lfdr.de>; Mon,  3 Apr 2023 17:40:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231927AbjDCPkh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Apr 2023 11:40:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232966AbjDCPkd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Apr 2023 11:40:33 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFAFA26BB
        for <linux-media@vger.kernel.org>; Mon,  3 Apr 2023 08:40:32 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pjMIA-0004fs-PB; Mon, 03 Apr 2023 17:40:22 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pjMI8-008ibO-Iq; Mon, 03 Apr 2023 17:40:20 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pjMI7-00AHxO-PK; Mon, 03 Apr 2023 17:40:19 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        kernel@pengutronix.de
Subject: [PATCH 15/24] staging: media: sunxi: cedrus: Convert to platform remove callback returning void
Date:   Mon,  3 Apr 2023 17:40:05 +0200
Message-Id: <20230403154014.2564054-16-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230403154014.2564054-1-u.kleine-koenig@pengutronix.de>
References: <20230403154014.2564054-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1827; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=4rphF2uHdZojhekW3CCbPpn9xzSOrNxB1a5CNnkqM/Y=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKvNGCAxk1Yw6v6inzB0LxE1nLpf9y0i0UlnlJ uMkbhjSmkeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCrzRgAKCRCPgPtYfRL+ TmzoB/kBkgPlrDjtaABO5jHJwmcsB0ibjdBZPI9YQ8M2/tgDnWxIVgjlP1mzf4NVX4bo9b4tseR cOXSnMqLda1tnct8CzrSV+c6v2RINzXW/t8iLStrhwZeSf3j0O9K/Y7lv5TNZMaXE9NV3zfKvfY BU9DnI5tRlHzBZD4t8Bp6Hs4n1RlRS2nfh47kpMiJv8lSL0buMxS1EurMtA6jUM7nKhn1OcbrNM 540mJ1J+BD8pvsqzbppYZ95z043X6XKy4RRyj8FPxfJKK927u/eSLPqidLzE+bfx6KH/HstEZu8 mDrD+uOFrdo5A4enCB4VQ3trxt//70b2IQmN3MXAXiLvp7yy
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
 drivers/staging/media/sunxi/cedrus/cedrus.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index a43d5ff66716..3c62376c3e94 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -543,7 +543,7 @@ static int cedrus_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int cedrus_remove(struct platform_device *pdev)
+static void cedrus_remove(struct platform_device *pdev)
 {
 	struct cedrus_dev *dev = platform_get_drvdata(pdev);
 
@@ -558,8 +558,6 @@ static int cedrus_remove(struct platform_device *pdev)
 	v4l2_device_unregister(&dev->v4l2_dev);
 
 	cedrus_hw_remove(dev);
-
-	return 0;
 }
 
 static const struct cedrus_variant sun4i_a10_cedrus_variant = {
@@ -706,7 +704,7 @@ static const struct dev_pm_ops cedrus_dev_pm_ops = {
 
 static struct platform_driver cedrus_driver = {
 	.probe		= cedrus_probe,
-	.remove		= cedrus_remove,
+	.remove_new	= cedrus_remove,
 	.driver		= {
 		.name		= CEDRUS_NAME,
 		.of_match_table	= of_match_ptr(cedrus_dt_match),
-- 
2.39.2

