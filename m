Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB118404E90
	for <lists+linux-media@lfdr.de>; Thu,  9 Sep 2021 14:18:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344856AbhIIMMg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Sep 2021 08:12:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:47690 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1344637AbhIIMG3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 9 Sep 2021 08:06:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 085C861929;
        Thu,  9 Sep 2021 11:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631188055;
        bh=cuOdGNw7f1QnFZNVV4eoDeQrIqRmu4KsyB2G/6dTrig=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=m3jtip9ycj6bBtdniIbFnM6GAa51QIRTe9t4B+zrggHShsdSLS818FC7oFaDbfO4x
         IV6XQx+B5j4jvNIrZM+4VnUKJcDsoLJk6crlufTrnGtY5Z4KTRb4CVd1fAFVxkgtNM
         HpVhI4EeZKI/0jLeLUzn6H0x3X8t02Zo0Amtj5fQcp+igp6UNmR+Enn9gdrFvrJpMX
         txoKqN4BjKCXv4iBU1xLQRjXrErSn/CJf5/Fw2isZnBS4BqVMND60uy+BGk7RWzydK
         pkzySZAFt1cxSax2+KUe1/rWtCz2WXQ/BuTi9SL/QRBq7N4RnsMOjAIQ3nBUJsxmZG
         AXnkgFsx2/suw==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Evgeny Novikov <novikov@ispras.ru>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-media@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 5.13 046/219] media: platform: stm32: unprepare clocks at handling errors in probe
Date:   Thu,  9 Sep 2021 07:43:42 -0400
Message-Id: <20210909114635.143983-46-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210909114635.143983-1-sashal@kernel.org>
References: <20210909114635.143983-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Evgeny Novikov <novikov@ispras.ru>

[ Upstream commit 055d2db28ec2fa3ab5c527c5604f1b32b89fa13a ]

stm32_cec_probe() did not unprepare clocks on error handling paths. The
patch fixes that.

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Evgeny Novikov <novikov@ispras.ru>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
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
2.30.2

