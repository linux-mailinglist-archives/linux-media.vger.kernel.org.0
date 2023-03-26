Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE7646C957D
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:33:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232584AbjCZOdo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:33:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232477AbjCZOcx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:32:53 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9ECDC7AB6
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:51 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQE-0008Dj-MD; Sun, 26 Mar 2023 16:32:38 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQC-006rcF-HN; Sun, 26 Mar 2023 16:32:36 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQB-0088We-96; Sun, 26 Mar 2023 16:32:35 +0200
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
Subject: [PATCH 045/117] media: vdec: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:31:12 +0200
Message-Id: <20230326143224.572654-48-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1804; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=pJNzgnJ30EHiUzc/rqyhfA+TC1iTYhBrR+DTa0bHg48=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFa9C9koq5OLF/ESdALEl/zRMwoCX5ePT1HQs P4j36rGXJCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBWvQAKCRCPgPtYfRL+ TtpNCACp/23FthUg0CFYOG+R1MILQ0ULtf3l8oU9zVXkA9P90j5pnQpgW8JNDRLKtUcgRgqbPw4 F+2onLhRvmVC41rnMZ0Wdf+XpT83zSEzYVNYstQ4HWa3KHBd9BY3X5/+vRtfw4JTBjjKr9XdbiX 1sabflqFczhSdtl//kozaICMzcyYa4Xg67+rllu3JZ+7qGwGzvpu662d52BYgaUbOdfc/Ee0ezg kbhPlVs8LbQHbC8y3lc/Me8NmcVZfiATRcUF8mVr8QrOr9eHBr+5q6QPzbT3QdhCWeo1nYsTVvL y4UcykqByy8zp8C/ESAjxK5b0FWvpvcVkMcSyYKZFD/T4MBX
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
 drivers/media/platform/qcom/venus/vdec.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 4ceaba37e2e5..d47c22015770 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -1774,7 +1774,7 @@ static int vdec_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int vdec_remove(struct platform_device *pdev)
+static void vdec_remove(struct platform_device *pdev)
 {
 	struct venus_core *core = dev_get_drvdata(pdev->dev.parent);
 
@@ -1783,8 +1783,6 @@ static int vdec_remove(struct platform_device *pdev)
 
 	if (core->pm_ops->vdec_put)
 		core->pm_ops->vdec_put(core->dev_dec);
-
-	return 0;
 }
 
 static __maybe_unused int vdec_runtime_suspend(struct device *dev)
@@ -1825,7 +1823,7 @@ MODULE_DEVICE_TABLE(of, vdec_dt_match);
 
 static struct platform_driver qcom_venus_dec_driver = {
 	.probe = vdec_probe,
-	.remove = vdec_remove,
+	.remove_new = vdec_remove,
 	.driver = {
 		.name = "qcom-venus-decoder",
 		.of_match_table = vdec_dt_match,
-- 
2.39.2

