Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BE8D3C346D
	for <lists+linux-media@lfdr.de>; Sat, 10 Jul 2021 14:04:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232672AbhGJMHX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 10 Jul 2021 08:07:23 -0400
Received: from mail.ispras.ru ([83.149.199.84]:50054 "EHLO mail.ispras.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230377AbhGJMHV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 10 Jul 2021 08:07:21 -0400
Received: from hellwig.intra.ispras.ru (unknown [83.149.199.249])
        by mail.ispras.ru (Postfix) with ESMTPS id BC33040D4004;
        Sat, 10 Jul 2021 12:04:33 +0000 (UTC)
From:   Evgeny Novikov <novikov@ispras.ru>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Evgeny Novikov <novikov@ispras.ru>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-media@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        ldv-project@linuxtesting.org
Subject: [PATCH] media: platform: stm32: unprepare clocks at handling errors in probe
Date:   Sat, 10 Jul 2021 15:04:32 +0300
Message-Id: <20210710120432.6624-1-novikov@ispras.ru>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

stm32_cec_probe() did not unprepare clocks on error handling paths. The
patch fixes that.

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Evgeny Novikov <novikov@ispras.ru>
---
 drivers/media/cec/platform/stm32/stm32-cec.c | 26 ++++++++++++++------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/media/cec/platform/stm32/stm32-cec.c b/drivers/media/cec/platform/stm32/stm32-cec.c
index ea4b1ebfca99..0ffd89712536 100644
--- a/drivers/media/cec/platform/stm32/stm32-cec.c
+++ b/drivers/media/cec/platform/stm32/stm32-cec.c
@@ -305,14 +305,16 @@ static int stm32_cec_probe(struct platform_device *pdev)
 
 	cec->clk_hdmi_cec = devm_clk_get(&pdev->dev, "hdmi-cec");
 	if (IS_ERR(cec->clk_hdmi_cec) &&
-	    PTR_ERR(cec->clk_hdmi_cec) == -EPROBE_DEFER)
-		return -EPROBE_DEFER;
+	    PTR_ERR(cec->clk_hdmi_cec) == -EPROBE_DEFER) {
+		ret = -EPROBE_DEFER;
+		goto err_unprepare_cec_clk;
+	}
 
 	if (!IS_ERR(cec->clk_hdmi_cec)) {
 		ret = clk_prepare(cec->clk_hdmi_cec);
 		if (ret) {
 			dev_err(&pdev->dev, "Can't prepare hdmi-cec clock\n");
-			return ret;
+			goto err_unprepare_cec_clk;
 		}
 	}
 
@@ -324,19 +326,27 @@ static int stm32_cec_probe(struct platform_device *pdev)
 			CEC_NAME, caps,	CEC_MAX_LOG_ADDRS);
 	ret = PTR_ERR_OR_ZERO(cec->adap);
 	if (ret)
-		return ret;
+		goto err_unprepare_hdmi_cec_clk;
 
 	ret = cec_register_adapter(cec->adap, &pdev->dev);
-	if (ret) {
-		cec_delete_adapter(cec->adap);
-		return ret;
-	}
+	if (ret)
+		goto err_delete_adapter;
 
 	cec_hw_init(cec);
 
 	platform_set_drvdata(pdev, cec);
 
 	return 0;
+
+err_delete_adapter:
+	cec_delete_adapter(cec->adap);
+
+err_unprepare_hdmi_cec_clk:
+	clk_unprepare(cec->clk_hdmi_cec);
+
+err_unprepare_cec_clk:
+	clk_unprepare(cec->clk_cec);
+	return ret;
 }
 
 static int stm32_cec_remove(struct platform_device *pdev)
-- 
2.26.2

