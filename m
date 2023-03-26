Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5212A6C9585
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:33:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232453AbjCZOdx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:33:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232493AbjCZOcy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:32:54 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6C037EC9
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:52 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQM-00009Z-E1; Sun, 26 Mar 2023 16:32:46 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQJ-006reu-PA; Sun, 26 Mar 2023 16:32:43 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQI-0088Ym-6c; Sun, 26 Mar 2023 16:32:42 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc:     linux-media@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Subject: [PATCH 077/117] media: stm32-dcmi: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:31:44 +0200
Message-Id: <20230326143224.572654-80-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1835; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=B2SRle1FWU+fvxidEF4AfCr7grTjB5IhYpAYWME58PA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFbiFY6P9Bvm19sbb/DGuYDfSjfu1+Ed9eyPQ WPUc31/iY6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBW4gAKCRCPgPtYfRL+ TjkxCACrV8VIV049iFgO6pMn+hRVUFDMXLM3LetM9Pj/dkFcpbkVxQEAQL9OoaOmsPGvmn10CDC wGZZQztBifG9viCCYtWK1XTxW/QyJtQjpLRvgDKp01FavBHb/UDr87lg0B6Zv3A3zPaL11u6qM3 9/bT/c24KsFnReeA1pjZoM0T5qKgz4bj7OpcdwGSh9ufyJMFAfSdI2EENirkPmBFygkkKArLosK L//ssYDIOZ8/VwseyOOHDWqz/06vxq1b4g36psxoPws0NVYGq3YEsZV0hT3pS6NtlL+5rv7Ue3c Nha+Ayh7kEVquPYhJvwVz5wRGSz+2b1AdNti45x2nQMoL+vh
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
 drivers/media/platform/st/stm32/stm32-dcmi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
index ad8e9742e1ae..dc3ce08259d5 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
@@ -2134,7 +2134,7 @@ static int dcmi_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int dcmi_remove(struct platform_device *pdev)
+static void dcmi_remove(struct platform_device *pdev)
 {
 	struct stm32_dcmi *dcmi = platform_get_drvdata(pdev);
 
@@ -2147,8 +2147,6 @@ static int dcmi_remove(struct platform_device *pdev)
 	media_device_cleanup(&dcmi->mdev);
 
 	dma_release_channel(dcmi->dma_chan);
-
-	return 0;
 }
 
 static __maybe_unused int dcmi_runtime_suspend(struct device *dev)
@@ -2202,7 +2200,7 @@ static const struct dev_pm_ops dcmi_pm_ops = {
 
 static struct platform_driver stm32_dcmi_driver = {
 	.probe		= dcmi_probe,
-	.remove		= dcmi_remove,
+	.remove_new	= dcmi_remove,
 	.driver		= {
 		.name = DRV_NAME,
 		.of_match_table = of_match_ptr(stm32_dcmi_of_match),
-- 
2.39.2

