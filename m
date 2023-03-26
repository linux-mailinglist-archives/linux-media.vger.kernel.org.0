Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADFF06C9581
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:33:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232177AbjCZOdt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:33:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232323AbjCZOcy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:32:54 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4B4A7DA4
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:51 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQF-0008DU-0f; Sun, 26 Mar 2023 16:32:39 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQC-006rcB-FA; Sun, 26 Mar 2023 16:32:36 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQA-0088WY-RK; Sun, 26 Mar 2023 16:32:34 +0200
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
Subject: [PATCH 043/117] media: venus: Warn only once about problems in .remove()
Date:   Sun, 26 Mar 2023 16:31:10 +0200
Message-Id: <20230326143224.572654-46-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=933; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=IHYTjjRoO1Dj9jBho/XeAemeh3UuJlqKxsJQQ74d7gg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFa60NwlkPOoWfthIuMks/fTpIeXdYABrvbzv 0ohELhRjkGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBWugAKCRCPgPtYfRL+ TiuJB/425F906SreRIHRCM/qH2XlnDEOKiPIoNFmdWBORbu2QLMvd3WZPem2kI1brt+ufUGfInd Tit+xK3PZ6oblLDvYo+jIalJHmyfOliin+6YQ6jAXvd0vcxnEEdA8V53tUAa6eqt7wa3W42kRs5 K2p2NHxV/1Fy3ev7X94EQELQGUm4iDjn9gIneo2fcXuYVFAa/wQSTIDX41PE8UqjB8nna8l0sYM oBGBRXI+0OxtdyRHtj1iKez+YnsdluUM0vMQ72xV8kxvzPLct5SiQNx8Ccb3bTdtrJ7TKNaw3XO IKfh+SVHt3RQhtu1PGeScp65LcTF1uE0I1AmSJChdC20UK15
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

The only effect of returning an error code in a remove callback is that
the driver core emits a warning. The device is unbound anyhow.

As the remove callback already emits a (quite verbose) warning when ret
is non-zero, return zero to suppress the additional warning.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/media/platform/qcom/venus/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 990a1519f968..403ffb92af60 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -448,7 +448,7 @@ static int venus_remove(struct platform_device *pdev)
 	mutex_destroy(&core->lock);
 	venus_dbgfs_deinit(core);
 
-	return ret;
+	return 0;
 }
 
 static void venus_core_shutdown(struct platform_device *pdev)
-- 
2.39.2

