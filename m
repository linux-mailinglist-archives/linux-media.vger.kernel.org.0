Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD3DD6C9556
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:33:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230129AbjCZOdJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:33:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232410AbjCZOco (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:32:44 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 624417DA7
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:42 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ7-0007lc-KK; Sun, 26 Mar 2023 16:32:31 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ4-006rZG-7s; Sun, 26 Mar 2023 16:32:28 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ3-0088UK-G3; Sun, 26 Mar 2023 16:32:27 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Sean Young <sean@mess.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-media@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Subject: [PATCH 009/117] media: stm32-cec: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:30:36 +0200
Message-Id: <20230326143224.572654-12-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1831; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=D/UAC+t+fl8c6EjlWf6JDxvuYAMHu5bYFNCcxsw+JGM=; b=owGbwMvMwMXY3/A7olbonx/jabUkhhSFsAbrwF6Dzy1NElLhi5qCVORf8/NW/5rkxW5prSeRa Ppenr2T0ZiFgZGLQVZMkcW+cU2mVZVcZOfaf5dhBrEygUxh4OIUgIloHuRgmPi/2ny+i9XGX9Hv cj8K8asKTHh7eOVSu2VnF1Xrap96r//j2r8PXm1LZ6xN8T5y9nTDdL5ZNQEmzcbVCluNXV/Z2P2 4d0Yz3ldfqP2a+K3Sf3wTdoT9bj0uZ7imZNLdiAU9x49XX9os3W8lemcCVxrrveKYloCYXdW/rH NncoQvWm+w9eq5dTlt3r+dV+09eFp8456QY14NBdtvPt/9RtT4XiKPEUPz3uj8AoX4lhLbZo9NE Rf7PNj3bym/KJ6z4ofQ1rtlH1Tz2F5t0An+d5XbjKnvL9dEnzUiXLUvnRl6ixTMfnVJ5Vw4O+3k i2hB/bkutcdYEi2rN9Z4Kz374r53G5N/sU+X2vp325QTAQ==
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
 drivers/media/cec/platform/stm32/stm32-cec.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/cec/platform/stm32/stm32-cec.c b/drivers/media/cec/platform/stm32/stm32-cec.c
index 7b2db46a5722..ada3d153362a 100644
--- a/drivers/media/cec/platform/stm32/stm32-cec.c
+++ b/drivers/media/cec/platform/stm32/stm32-cec.c
@@ -344,7 +344,7 @@ static int stm32_cec_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int stm32_cec_remove(struct platform_device *pdev)
+static void stm32_cec_remove(struct platform_device *pdev)
 {
 	struct stm32_cec *cec = platform_get_drvdata(pdev);
 
@@ -352,8 +352,6 @@ static int stm32_cec_remove(struct platform_device *pdev)
 	clk_unprepare(cec->clk_hdmi_cec);
 
 	cec_unregister_adapter(cec->adap);
-
-	return 0;
 }
 
 static const struct of_device_id stm32_cec_of_match[] = {
@@ -364,7 +362,7 @@ MODULE_DEVICE_TABLE(of, stm32_cec_of_match);
 
 static struct platform_driver stm32_cec_driver = {
 	.probe  = stm32_cec_probe,
-	.remove = stm32_cec_remove,
+	.remove_new = stm32_cec_remove,
 	.driver = {
 		.name		= CEC_NAME,
 		.of_match_table = stm32_cec_of_match,
-- 
2.39.2

