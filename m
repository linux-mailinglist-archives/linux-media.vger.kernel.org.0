Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A36C464B898
	for <lists+linux-media@lfdr.de>; Tue, 13 Dec 2022 16:36:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235883AbiLMPgU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Dec 2022 10:36:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236240AbiLMPgL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Dec 2022 10:36:11 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCF4B1FFB0
        for <linux-media@vger.kernel.org>; Tue, 13 Dec 2022 07:36:07 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1p57K9-0003Lh-Hu; Tue, 13 Dec 2022 16:36:05 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1p57K8-004HIS-5h; Tue, 13 Dec 2022 16:36:04 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1p57K8-004nw3-6H; Tue, 13 Dec 2022 16:36:04 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 3/4] media: rc/ir-rx51: Drop empty platform remove function
Date:   Tue, 13 Dec 2022 16:35:52 +0100
Message-Id: <20221213153553.648871-4-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221213153553.648871-1-u.kleine-koenig@pengutronix.de>
References: <20221213153553.648871-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1031; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=F2vNtI4sBjlo563V18pvpMYOKOb1t6/d1ijuu0LRauk=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjmJvPPqdal0kjjeWTkC/C0JQkwFzWNawA48gkhQmT 1TNaMFqJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY5ibzwAKCRDB/BR4rcrsCQRPB/ 4hCWr5UeUgoWRIh8K8VpLL2G+YqQo0Izlukkli9HjwW5XV8przqdRNVWgIIAhySjMLO8fQJtKYfm6u 9wlCd/+QO/xmZdkKQ4dVKbWTg7w/hfKp0jhS0bcBZVsxNFaeuMZOy5RQk5bZTcMpwU9TKOO4LFhtRg qT9ybl50yRgFdjJvXGGpy9l+MbDzpZ6F9FsV9shA6cNHlqlQIbjo47t9jmxaBotOWfOQkJLVf20Zu/ isyOK9AduMpxS1SQ7jIj2Cm6ibbCINdwLKRa5jDSej9DJET8E7VVmxSAxCx6wvhiaJZDBp4Hb9YP59 VfWMwrnp5TEUiGwIYDz3pVqthHJPi1
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A remove callback just returning 0 is equivalent to no remove callback
at all. So drop the useless function.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/media/rc/ir-rx51.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/media/rc/ir-rx51.c b/drivers/media/rc/ir-rx51.c
index a3b145183260..da461f2223b6 100644
--- a/drivers/media/rc/ir-rx51.c
+++ b/drivers/media/rc/ir-rx51.c
@@ -266,11 +266,6 @@ static int ir_rx51_probe(struct platform_device *dev)
 	return devm_rc_register_device(&dev->dev, ir_rx51.rcdev);
 }
 
-static int ir_rx51_remove(struct platform_device *dev)
-{
-	return 0;
-}
-
 static const struct of_device_id ir_rx51_match[] = {
 	{
 		.compatible = "nokia,n900-ir",
@@ -281,7 +276,6 @@ MODULE_DEVICE_TABLE(of, ir_rx51_match);
 
 static struct platform_driver ir_rx51_platform_driver = {
 	.probe		= ir_rx51_probe,
-	.remove		= ir_rx51_remove,
 	.suspend	= ir_rx51_suspend,
 	.resume		= ir_rx51_resume,
 	.driver		= {
-- 
2.38.1

