Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F7746C957A
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:33:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232577AbjCZOdl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:33:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232475AbjCZOcw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:32:52 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E8A47EC1
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:50 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQF-0008Ds-2t; Sun, 26 Mar 2023 16:32:39 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQC-006rcG-I2; Sun, 26 Mar 2023 16:32:36 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQB-0088Wk-F3; Sun, 26 Mar 2023 16:32:35 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 046/117] media: venc: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:31:13 +0200
Message-Id: <20230326143224.572654-49-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1804; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=hwSaE/8xK5uDZSiLTTtZlCVtdlhltZuM7HPsqGQ9Uf4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFa+uxorUIQpjqZN3S9rqhNDmr3xDFDC5H+f4 J9shvHrsPWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBWvgAKCRCPgPtYfRL+ Tn+yCACq2oQqKASPlvz22ANabMKMAXSr7B65CS1U9LTwKXjTBq79XIZEXvC8VR4Djdon1bBVxax 4WCWGLplC9aLPujPNVeqMa1UdqBbmbNUzL9DzbmQE43Ij0SiFFlc5YH2ZnSH6QXyUFWfQlnvH7Z oQeUbi4r4MppzYy2XOjcpsHVIT9u3hgFQqAnzjpyWmR/pluqblYPu8DUw2yCpSFiasn5WWg310K i7R0naRJwQ6+n6Dtk39ah1nmc9NDyjrI75RskO9MQoy7aRPkSSYlxP/BSRFf+gsfG7j/VCBtGu8 9KN3yQscinsL3cAXqYeFk7MX2puW2VpCE7wg+kya1yP36dHP
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
 drivers/media/platform/qcom/venus/venc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index cdb12546c4fa..6d61614656a5 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -1492,7 +1492,7 @@ static int venc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int venc_remove(struct platform_device *pdev)
+static void venc_remove(struct platform_device *pdev)
 {
 	struct venus_core *core = dev_get_drvdata(pdev->dev.parent);
 
@@ -1501,8 +1501,6 @@ static int venc_remove(struct platform_device *pdev)
 
 	if (core->pm_ops->venc_put)
 		core->pm_ops->venc_put(core->dev_enc);
-
-	return 0;
 }
 
 static __maybe_unused int venc_runtime_suspend(struct device *dev)
@@ -1543,7 +1541,7 @@ MODULE_DEVICE_TABLE(of, venc_dt_match);
 
 static struct platform_driver qcom_venus_enc_driver = {
 	.probe = venc_probe,
-	.remove = venc_remove,
+	.remove_new = venc_remove,
 	.driver = {
 		.name = "qcom-venus-encoder",
 		.of_match_table = venc_dt_match,
-- 
2.39.2

