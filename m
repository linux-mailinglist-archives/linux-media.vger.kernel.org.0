Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A12722590B4
	for <lists+linux-media@lfdr.de>; Tue,  1 Sep 2020 16:37:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728183AbgIAOhE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Sep 2020 10:37:04 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:24429 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728326AbgIAOU5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 1 Sep 2020 10:20:57 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1598970056; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=z8Vt6WPpOThwb5Gdj5E/5uWB1uQDwQQ5bcvjtKq9pZ0=; b=CcvX+dwDFoCtil9b4FFxTe+qoOVTpGA/8IqqX0LMsaGzI7PprGynu0dMpw51wQf5kS6nIkvP
 ayECTqf+8lT+6B2KpO22gkjP47rAjTAm48nj8JPWgAi2knPac2yaYsNDfQGwsoJKuzMB0q0s
 5+4ZOzMfVaahqNf0xiUHU9Rdsy8=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5f4e58c232925f96e1ccbf45 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 01 Sep 2020 14:20:50
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3BCE4C433CA; Tue,  1 Sep 2020 14:20:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C0571C433C9;
        Tue,  1 Sep 2020 14:20:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C0571C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     stanimir.varbanov@linaro.org, robh+dt@kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mka@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v6 2/5] media: venus: core: Fix error handling in probe
Date:   Tue,  1 Sep 2020 19:50:23 +0530
Message-Id: <1598970026-7199-3-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598970026-7199-1-git-send-email-rnayak@codeaurora.org>
References: <1598970026-7199-1-git-send-email-rnayak@codeaurora.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Post a successful pm_ops->core_get, an error in probe
should exit by doing a pm_ops->core_put which seems
to be missing. So fix it.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 203c653..bfcaba3 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -224,13 +224,15 @@ static int venus_probe(struct platform_device *pdev)
 
 	ret = dma_set_mask_and_coherent(dev, core->res->dma_mask);
 	if (ret)
-		return ret;
+		goto err_core_put;
 
 	if (!dev->dma_parms) {
 		dev->dma_parms = devm_kzalloc(dev, sizeof(*dev->dma_parms),
 					      GFP_KERNEL);
-		if (!dev->dma_parms)
-			return -ENOMEM;
+		if (!dev->dma_parms) {
+			ret = -ENOMEM;
+			goto err_core_put;
+		}
 	}
 	dma_set_max_seg_size(dev, DMA_BIT_MASK(32));
 
@@ -242,11 +244,11 @@ static int venus_probe(struct platform_device *pdev)
 					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
 					"venus", core);
 	if (ret)
-		return ret;
+		goto err_core_put;
 
 	ret = hfi_create(core, &venus_core_ops);
 	if (ret)
-		return ret;
+		goto err_core_put;
 
 	pm_runtime_enable(dev);
 
@@ -302,6 +304,9 @@ static int venus_probe(struct platform_device *pdev)
 	pm_runtime_set_suspended(dev);
 	pm_runtime_disable(dev);
 	hfi_destroy(core);
+err_core_put:
+	if (core->pm_ops->core_put)
+		core->pm_ops->core_put(dev);
 	return ret;
 }
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

