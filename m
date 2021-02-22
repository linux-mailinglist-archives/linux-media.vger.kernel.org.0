Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B951321C2B
	for <lists+linux-media@lfdr.de>; Mon, 22 Feb 2021 17:04:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231354AbhBVQDm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Feb 2021 11:03:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231232AbhBVQDV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Feb 2021 11:03:21 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68623C0611BD
        for <linux-media@vger.kernel.org>; Mon, 22 Feb 2021 08:01:51 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id d11so268769wrj.7
        for <linux-media@vger.kernel.org>; Mon, 22 Feb 2021 08:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jfi93nFRMIEbqzHdYrViv9hk2pcCCjRBia6kkKbplN8=;
        b=k4mt+/CkI0yvDUHJI5esU/1596Y7r5+y5rSLw0s0YDXm9RrCOxLtykT3PXpXm1/AA+
         TZ6gDjjtpDlsMzgN0JgNvt/gRjqdVBovSPLXWwPzOOFm4ntmBF8wuihira7J/SaS6hpi
         hGbYSQ6BBX0+g6bVUBVOVBfPV5GnMZinC+vPN4sejkMFVwKjVCAJ9AJb+9/rxhnDXeSB
         lCVDQppjHt5kdWZdTpj1aYuw5l3u3soxXpD7Jk1m0yt/OYbmA8KOS/BJSbMxCpclZZQq
         DWVVu3rmLNiudW7kmK3tKI4TmlRxSVzhWLahApabKGQmWB1ObvAA8bHHC3YfPTntXGUu
         mJfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jfi93nFRMIEbqzHdYrViv9hk2pcCCjRBia6kkKbplN8=;
        b=BIonclIAlixoym7l7UI+kSjkKhDZJHjTsegysjQPVxoVA+wH19ubQRksuWoWfb39/V
         ZOZ5cwCHPARcF7ZjzI8WJ7oB1ievjORBTL6cyBgU7IEgsL8+0dwlvDukFqXSBAxbtskT
         UEKmj1wQu9IoNy4d6zyZUSD6131FQENfFFb6KMS7mr3ClmbIrY7mWnGDy51yxGk/7yvJ
         zECbYnTS7W64HvP8Jb91zTZtXxcq5pADzxtT/x7GORPhzXMITCOvRpnTPRUJdqUoLS8Y
         0BZKXTTj2FCdjtRXvlz09iF+bOYeu8yiqFCxCeXtDd5Tmkb5Z3l3hvIlDBs1isQBtAVP
         x7Cg==
X-Gm-Message-State: AOAM530F/mxNZDbmJz/wsFT5oGPsKOCtQBSJqm4IGdR0iEIIYaydngzK
        ACapwHpJB3QL/ZsD1RV5X6YCSRmGw4E+7Q==
X-Google-Smtp-Source: ABdhPJzDOPMpBsXXzRoujYsFyJdzVsTgdSmP7tS6Sex6+tmAxztCbuVpsPLOHpTBB1nAp3ffiPd4ng==
X-Received: by 2002:adf:dcd2:: with SMTP id x18mr22031726wrm.355.1614009710240;
        Mon, 22 Feb 2021 08:01:50 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id c3sm7373697wrw.80.2021.02.22.08.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 08:01:49 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH 13/25] media: venus: hfi: Add a 6xx boot logic
Date:   Mon, 22 Feb 2021 16:02:48 +0000
Message-Id: <20210222160300.1811121-14-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
References: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dikshita Agarwal <dikshita@codeaurora.org>

This patch adds a 6xx specific boot logic. The goal is to share as much
code as possible between 3xx, 4xx and 6xx silicon.

We need to do a different write to WRAPPER_INTR_MASK with an additional
write to CPU_CS_H2XSOFTINTEN_V6 and CPU_CS_X2RPMh_V6.

The other writes are the same for 6xx and non-6xx silicon albeit at
different absolute relative locations to the base of the venus address
space.

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/venus/hfi_venus.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index f95cdd3d530c..5f9c8aa84cd0 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -442,14 +442,21 @@ static int venus_boot_core(struct venus_hfi_device *hdev)
 {
 	struct device *dev = hdev->core->dev;
 	static const unsigned int max_tries = 100;
-	u32 ctrl_status = 0;
+	u32 ctrl_status = 0, mask_val;
 	unsigned int count = 0;
 	void __iomem *cpu_cs_base = hdev->core->cpu_cs_base;
 	void __iomem *wrapper_base = hdev->core->wrapper_base;
 	int ret = 0;
 
 	writel(BIT(VIDC_CTRL_INIT_CTRL_SHIFT), cpu_cs_base + VIDC_CTRL_INIT);
-	writel(WRAPPER_INTR_MASK_A2HVCODEC_MASK, wrapper_base + WRAPPER_INTR_MASK);
+	if (IS_V6(hdev->core)) {
+		mask_val = readl(wrapper_base + WRAPPER_INTR_MASK);
+		mask_val &= ~(WRAPPER_INTR_MASK_A2HWD_BASK_V6 |
+			      WRAPPER_INTR_MASK_A2HCPU_MASK);
+	} else {
+		mask_val = WRAPPER_INTR_MASK_A2HVCODEC_MASK;
+	}
+	writel(mask_val, wrapper_base + WRAPPER_INTR_MASK);
 	writel(1, cpu_cs_base + CPU_CS_SCIACMDARG3);
 
 	while (!ctrl_status && count < max_tries) {
@@ -467,6 +474,9 @@ static int venus_boot_core(struct venus_hfi_device *hdev)
 	if (count >= max_tries)
 		ret = -ETIMEDOUT;
 
+	if (IS_V6(hdev->core))
+		writel(0x0, cpu_cs_base + CPU_CS_X2RPMH_V6);
+
 	return ret;
 }
 
-- 
2.29.2

