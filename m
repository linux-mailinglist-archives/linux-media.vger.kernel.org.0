Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D166735296D
	for <lists+linux-media@lfdr.de>; Fri,  2 Apr 2021 12:05:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234954AbhDBKFo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Apr 2021 06:05:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234908AbhDBKFh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Apr 2021 06:05:37 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A149C0613A6
        for <linux-media@vger.kernel.org>; Fri,  2 Apr 2021 03:05:36 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id x13so4292737wrs.9
        for <linux-media@vger.kernel.org>; Fri, 02 Apr 2021 03:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wwMK9AHuxVFl4rBHOIBcFYLquE5ubyLXDobeIx8iDE4=;
        b=qtjyYNffeMR/onwCNWN0NjOoxsTnpqHlfM3QZ2mMtGM4kVS3KntXkL9vmsMWq9ryrI
         2xEVE7GLSAdSu/4VAcevx7HxxmPbllLSjgF1FXkpAJ3nEJikh6mRWNbic/0+VDZQIhZm
         RSnuYJjWkFUiKutcY/wHT25l6p4X+ess4A7eFUCIE9/BhX2FPxAqGnmToDyxyx6XFVj8
         0T3KXnLmK5zbPbiH4m+iF+0uyXRzTKp1h+yGlqaKU7hlZFzm3gOgPJPJhTFvqN+JJke0
         9efP25hfg9iFGvW08gTPJ62Y0vvhLIzDvDJR5FcKiVPtIeHitGIyDXcxieYDJAsCFzdU
         8Abg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wwMK9AHuxVFl4rBHOIBcFYLquE5ubyLXDobeIx8iDE4=;
        b=oOpL+GMNGFrfOJefg8Vd4zbqaJC4/mZ6u+MhyXZFzKUshKew+Lli5xuYtJ7ZjZCmA2
         +SGpBLb7Ju5KuvAVTD1Y4BZ53wVtlUyMR+s/KREMAbA5YZqYDSiLlASCnghnXkj6fxpH
         IyoiQX3MeXza6XibWS4jiTSZBHPoinqjElWCZw2HBvxiUe0eUpjiDV5B4iDcD/I7doID
         G23YkL0og2qVrm1KybqNEKbq5vfyT/KfWWFziHuNa2dgGV2lJFPQHHOkTAGfC/r9YLJw
         EWNZdRZdOrEj7TiFLUDlaoeLMRxOUYa6126SM4mOdg6LftOq2AGBzdcxdIn6Kd+asfWB
         Eg9g==
X-Gm-Message-State: AOAM530tk9z9hDtDdjAmu8P0ZuFlyf7pcDsvp3ppCy6k2vc5A0sjfmXg
        tKt063YagWnLHFpaSm5CKq8Odg==
X-Google-Smtp-Source: ABdhPJx8jFFqSMRaxe1+PXuSr2OhQbAV+Ahl/ycmCxafZRZED52Qv1wgMJGqsVFAaMIVFJmkJm6jvg==
X-Received: by 2002:adf:e4c7:: with SMTP id v7mr14579458wrm.245.1617357935339;
        Fri, 02 Apr 2021 03:05:35 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id v18sm15466618wrf.41.2021.04.02.03.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 03:05:34 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH v3 18/25] media: venus: hfi: Add 6xx AXI halt logic
Date:   Fri,  2 Apr 2021 11:06:41 +0100
Message-Id: <20210402100648.1815854-19-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210402100648.1815854-1-bryan.odonoghue@linaro.org>
References: <20210402100648.1815854-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dikshita Agarwal <dikshita@codeaurora.org>

This patch takes the downstream AXI halt routine and applies it when
IS_V6() is true.

bod: Converted to readl_poll_timeout()
     Removed poll timeout for LPI register, testing showed the value
     would always timeout and work, so the polling did nothing of value.

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
Co-developed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/hfi_venus.c | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index 24cf20f76e7f..cebb20cf371f 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -541,10 +541,42 @@ static int venus_halt_axi(struct venus_hfi_device *hdev)
 {
 	void __iomem *wrapper_base = hdev->core->wrapper_base;
 	void __iomem *vbif_base = hdev->core->vbif_base;
+	void __iomem *cpu_cs_base = hdev->core->cpu_cs_base;
+	void __iomem *aon_base = hdev->core->aon_base;
 	struct device *dev = hdev->core->dev;
 	u32 val;
+	u32 mask_val;
 	int ret;
 
+	if (IS_V6(hdev->core)) {
+		writel(0x3, cpu_cs_base + CPU_CS_X2RPMH_V6);
+
+		writel(0x1, aon_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
+		ret = readl_poll_timeout(aon_base + AON_WRAPPER_MVP_NOC_LPI_STATUS,
+					 val,
+					 val & BIT(0),
+					 POLL_INTERVAL_US,
+					 VBIF_AXI_HALT_ACK_TIMEOUT_US);
+		if (ret)
+			return -ETIMEDOUT;
+
+		mask_val = (BIT(2) | BIT(1) | BIT(0));
+		writel(mask_val, wrapper_base + WRAPPER_DEBUG_BRIDGE_LPI_CONTROL_V6);
+
+		writel(0x00, wrapper_base + WRAPPER_DEBUG_BRIDGE_LPI_CONTROL_V6);
+		ret = readl_poll_timeout(wrapper_base + WRAPPER_DEBUG_BRIDGE_LPI_STATUS_V6,
+					 val,
+					 val == 0,
+					 POLL_INTERVAL_US,
+					 VBIF_AXI_HALT_ACK_TIMEOUT_US);
+
+		if (ret) {
+			dev_err(dev, "DBLP Release: lpi_status %x\n", val);
+			return -ETIMEDOUT;
+		}
+		return 0;
+	}
+
 	if (IS_V4(hdev->core)) {
 		val = readl(wrapper_base + WRAPPER_CPU_AXI_HALT);
 		val |= WRAPPER_CPU_AXI_HALT_HALT;
-- 
2.30.1

