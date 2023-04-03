Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EF676D4C2C
	for <lists+linux-media@lfdr.de>; Mon,  3 Apr 2023 17:40:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232619AbjDCPki (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Apr 2023 11:40:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232494AbjDCPke (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Apr 2023 11:40:34 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E5432703
        for <linux-media@vger.kernel.org>; Mon,  3 Apr 2023 08:40:33 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pjMIA-0004gM-PC; Mon, 03 Apr 2023 17:40:22 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pjMI8-008ibY-Re; Mon, 03 Apr 2023 17:40:20 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pjMI7-00AHxU-UW; Mon, 03 Apr 2023 17:40:19 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        kernel@pengutronix.de
Subject: [PATCH 16/24] staging: media: sun6i-isp: Convert to platform remove callback returning void
Date:   Mon,  3 Apr 2023 17:40:06 +0200
Message-Id: <20230403154014.2564054-17-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230403154014.2564054-1-u.kleine-koenig@pengutronix.de>
References: <20230403154014.2564054-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1917; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=At1mdpo78r3qN9rDJ8RZgj+BLaFnIaR/L2rgQkSSSDo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKvNHZoIWpo2JJ6E9tawZMnCv2y0P/Cw4dLLxh npuaLRuEzCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCrzRwAKCRCPgPtYfRL+ TjQIB/9cc1/waoZmGnVeCyEGIPw4CIhnllwgel/LUA5RNBEOkcr8vJoL/jjmU11VUHo8pK306vR AdSjMrgCWWwhiBBjg+/IQEPOqA4UXtbmAezsF2TsnfdoF3NVeiDRwy6hNe1HINKxr2k0M3LYA1B sWEFxbaCrxoP2SpuK0RQMqWExCW2m8DqImxcK20qTUw1Zbr57gTDOtoeg+dpGBlfShWhOr/Ardh temJFRgMl1BJG6Ns6vjA2w+dtsOiPmRxJF468lDxl5omtSBWB+UIdSa1qcRa8T623UXsP+B5LoE 5DXGWQbN6kdoHsDs/ajNvlZZUrp9C189ty/93WPDjcS+gvQM
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
 drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c
index 7b7947509b69..0dc75adbd9d8 100644
--- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c
+++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c
@@ -493,7 +493,7 @@ static int sun6i_isp_probe(struct platform_device *platform_dev)
 	return ret;
 }
 
-static int sun6i_isp_remove(struct platform_device *platform_dev)
+static void sun6i_isp_remove(struct platform_device *platform_dev)
 {
 	struct sun6i_isp_device *isp_dev = platform_get_drvdata(platform_dev);
 
@@ -503,8 +503,6 @@ static int sun6i_isp_remove(struct platform_device *platform_dev)
 	sun6i_isp_v4l2_cleanup(isp_dev);
 	sun6i_isp_tables_cleanup(isp_dev);
 	sun6i_isp_resources_cleanup(isp_dev);
-
-	return 0;
 }
 
 /*
@@ -540,7 +538,7 @@ MODULE_DEVICE_TABLE(of, sun6i_isp_of_match);
 
 static struct platform_driver sun6i_isp_platform_driver = {
 	.probe	= sun6i_isp_probe,
-	.remove	= sun6i_isp_remove,
+	.remove_new = sun6i_isp_remove,
 	.driver	= {
 		.name		= SUN6I_ISP_NAME,
 		.of_match_table	= of_match_ptr(sun6i_isp_of_match),
-- 
2.39.2

