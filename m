Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8853A7D8ADB
	for <lists+linux-media@lfdr.de>; Thu, 26 Oct 2023 23:47:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231977AbjJZVr5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Oct 2023 17:47:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229633AbjJZVr4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Oct 2023 17:47:56 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10540128
        for <linux-media@vger.kernel.org>; Thu, 26 Oct 2023 14:47:54 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qw8Ci-0008Ej-2b; Thu, 26 Oct 2023 23:47:48 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qw8Ch-004Uru-35; Thu, 26 Oct 2023 23:47:47 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qw8Cg-006rUl-Pt; Thu, 26 Oct 2023 23:47:46 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-staging@lists.linux.dev, kernel@pengutronix.de
Subject: [PATCH] staging: media: tegra-video: Convert to platform remove callback returning void
Date:   Thu, 26 Oct 2023 23:47:40 +0200
Message-ID: <20231026214739.2509271-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.482.g2e8e77cbac8a.dirty
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3764; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=iBWQN6tc6+dQj6E3HP/luLO0rOWhalDDwsT2ZGTAUxI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlOt57AkMwARJu7sPBBSAb9BFaMZxaXeb9t4OL4 4FFRgoQ/zeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZTreewAKCRCPgPtYfRL+ Thi8B/4unyhduYQ2gWu6CS/UsbMMzqGUriLjsC5YAURyJSkRLWApCJ1K2GKWVyQZdoIj2hYiySu VgRyRI9xbEPFiUTXV2rXdDa7Ed5v0hEsbRGbze6T2DUxMSRhuyNdWPLB7FnjcYw6bB+6xmt/WCN bUjs/oiYwUDx8eh5LS6HW7S7n/EwuS6QH19PJ2tOlcguEseNuywNkWd1KNVQBNpv0aFp0CF5P7/ W6XLtrygIxA55F5jLZQRNjRH0A2l8+xn9+mgk1vFKDDW3D9YhP3DzM4V3KdTOEZmeHMKiQ4LEKJ wQmFnxDfQfNgMsLo8OKKJQczS8wRh0WMBywktB7+0wETM1G7
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.

To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new(), which already returns void. Eventually after all drivers
are converted, .remove_new() will be renamed to .remove().

Trivially convert the three tegra-video drivers from always returning
zero in the remove callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/staging/media/tegra-video/csi.c | 6 ++----
 drivers/staging/media/tegra-video/vi.c  | 6 ++----
 drivers/staging/media/tegra-video/vip.c | 6 ++----
 3 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index 9aa72863c213..0d94115b9bbb 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -818,15 +818,13 @@ static int tegra_csi_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int tegra_csi_remove(struct platform_device *pdev)
+static void tegra_csi_remove(struct platform_device *pdev)
 {
 	struct tegra_csi *csi = platform_get_drvdata(pdev);
 
 	host1x_client_unregister(&csi->client);
 
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 #if defined(CONFIG_ARCH_TEGRA_210_SOC)
@@ -852,5 +850,5 @@ struct platform_driver tegra_csi_driver = {
 		.pm		= &tegra_csi_pm_ops,
 	},
 	.probe			= tegra_csi_probe,
-	.remove			= tegra_csi_remove,
+	.remove_new		= tegra_csi_remove,
 };
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 94171e62dee9..61169ff13ec5 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -1944,7 +1944,7 @@ static int tegra_vi_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int tegra_vi_remove(struct platform_device *pdev)
+static void tegra_vi_remove(struct platform_device *pdev)
 {
 	struct tegra_vi *vi = platform_get_drvdata(pdev);
 
@@ -1953,8 +1953,6 @@ static int tegra_vi_remove(struct platform_device *pdev)
 	if (vi->ops->vi_enable)
 		vi->ops->vi_enable(vi, false);
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 static const struct of_device_id tegra_vi_of_id_table[] = {
@@ -1979,5 +1977,5 @@ struct platform_driver tegra_vi_driver = {
 		.pm = &tegra_vi_pm_ops,
 	},
 	.probe = tegra_vi_probe,
-	.remove = tegra_vi_remove,
+	.remove_new = tegra_vi_remove,
 };
diff --git a/drivers/staging/media/tegra-video/vip.c b/drivers/staging/media/tegra-video/vip.c
index e95cc7bb190e..8504b9ea9cea 100644
--- a/drivers/staging/media/tegra-video/vip.c
+++ b/drivers/staging/media/tegra-video/vip.c
@@ -254,15 +254,13 @@ static int tegra_vip_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int tegra_vip_remove(struct platform_device *pdev)
+static void tegra_vip_remove(struct platform_device *pdev)
 {
 	struct tegra_vip *vip = platform_get_drvdata(pdev);
 
 	host1x_client_unregister(&vip->client);
 
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 #if defined(CONFIG_ARCH_TEGRA_2x_SOC)
@@ -283,5 +281,5 @@ struct platform_driver tegra_vip_driver = {
 		.of_match_table	= tegra_vip_of_id_table,
 	},
 	.probe			= tegra_vip_probe,
-	.remove			= tegra_vip_remove,
+	.remove_new		= tegra_vip_remove,
 };

base-commit: 2ef7141596eed0b4b45ef18b3626f428a6b0a822
-- 
2.42.0

