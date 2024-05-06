Return-Path: <linux-media+bounces-10852-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FAD8BCBAC
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 12:09:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 301381F234F8
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 10:09:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAE18142E83;
	Mon,  6 May 2024 10:09:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07131428F9
	for <linux-media@vger.kernel.org>; Mon,  6 May 2024 10:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714990183; cv=none; b=JFYG+gZOYMrTy37u5keVtxk3oo95zfm7hYyjEeWzOJkoAMVh9WCBpctUbNYEHeWbiiVNGhXDDh6T+5oiR2KIyfJguL/iQn5Ja3qUXLqQB1sGnZTqndCylROQ1kRSPaylravAlKoE9xdRcKWJ056ZyIBbgVuZPlDlp8XSBcB5eJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714990183; c=relaxed/simple;
	bh=sc4dQtEAfnQj5rxyw3IQe51eRThK+58/lD6QUvIRLzE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KvfhnBdGKvEYa+R1+J1njUbOJ9Gw/sp4SfMB//UjHW4vCBrSpmt946Ia0BSTOgek5WXswoMXJN4AQByTqa90/W9+ig8/rUh/vIxA1wzGHMq5XX0FKShR/K363brxlZ2YB6nuWDPVhIINTx2mWPx7FovDTxAof9BIwMbjWcsmNrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1s3vHn-0000s6-40; Mon, 06 May 2024 12:09:31 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1s3vHk-00GFK1-QH; Mon, 06 May 2024 12:09:28 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1s3vHk-00GfuB-2I;
	Mon, 06 May 2024 12:09:28 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Naushir Patuck <naush@raspberrypi.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] media: bcm2835-unicam: Convert to platform remove callback returning void
Date: Mon,  6 May 2024 12:09:16 +0200
Message-ID: <20240506100917.1544174-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2186; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=sc4dQtEAfnQj5rxyw3IQe51eRThK+58/lD6QUvIRLzE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmOKxO0YAGQ2PPEMcmnI9lTYMat8pqiVhBxzJSZ wNZycMxzYuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZjisTgAKCRCPgPtYfRL+ Tq98B/45y2SIU04i21BEoe6CrHYvdlYRmhLYKbaJ86xPn+/YgN4HAaRiINfPu4M+KgwHoyxx+Zv mG5q8eYxc2Tc3EDJlX2UnvwM2EnPRku9DrdxC15w6boMSJ1NP2c6M7Kr9goQHB/MJWUt5YfyH2P u4RCyotF6x7B2x0mdRTiESHTlthELVdpbNPB+Ezafj+83Xu85cB2F3t9wtlyWerUpkle/GIMl0r X3FItSckyZr/FBviShYQeRfG0FJe61r3bwvgVel93iCCAojhKbG4PfrtOw6JqcPrQ8ZlZfMDmS5 Y7i68IlyslqL4WDCwn3oUdruZwmCU+h5RcSpOz0e8SbJbzNm
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.

To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new(), which already returns void. Eventually after all drivers
are converted, .remove_new() will be renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

this driver appeared in next-20240506. Given that I want to change struct
platform_driver::remove after the merge-window for v6.10 closes, it would be
great if this patch went in together with commit creating the drivers.

Thanks
Uwe

 drivers/media/platform/broadcom/bcm2835-unicam.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
index 3c7878d8d79b..b11bcec5b225 100644
--- a/drivers/media/platform/broadcom/bcm2835-unicam.c
+++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
@@ -2704,7 +2704,7 @@ static int unicam_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int unicam_remove(struct platform_device *pdev)
+static void unicam_remove(struct platform_device *pdev)
 {
 	struct unicam_device *unicam = platform_get_drvdata(pdev);
 
@@ -2718,8 +2718,6 @@ static int unicam_remove(struct platform_device *pdev)
 	unicam_put(unicam);
 
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 static const struct of_device_id unicam_of_match[] = {
@@ -2730,7 +2728,7 @@ MODULE_DEVICE_TABLE(of, unicam_of_match);
 
 static struct platform_driver unicam_driver = {
 	.probe		= unicam_probe,
-	.remove		= unicam_remove,
+	.remove_new	= unicam_remove,
 	.driver = {
 		.name	= UNICAM_MODULE_NAME,
 		.pm	= pm_ptr(&unicam_pm_ops),
-- 
2.43.0


