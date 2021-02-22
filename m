Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14007321C3B
	for <lists+linux-media@lfdr.de>; Mon, 22 Feb 2021 17:07:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231285AbhBVQEt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Feb 2021 11:04:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231318AbhBVQDj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Feb 2021 11:03:39 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87BB6C061A31
        for <linux-media@vger.kernel.org>; Mon, 22 Feb 2021 08:01:56 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id a132so14073361wmc.0
        for <linux-media@vger.kernel.org>; Mon, 22 Feb 2021 08:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=enj8xcGxi5Ilg6e5Y2toHN1/uzGSCB2GzovsHLJELfo=;
        b=BNqcpR7UH7IooZSMfPQPKzXh8VupQJkQqPzbC3V5vull8v8+HugN/UfS5G3at5GKeV
         y2Thn50sV5S3wom8gnQcYnx4nEGbsFNmk5vzhrMpBfs3YBetc+9YsdhUHvrNPX/BekDf
         qxP8lGG1mkvh69eOfmUoBzz9X382eSShSts4UY2k7qzXbzIzagRsblB6+JGFAXOR8Frn
         eWuJbqaUtJbswGRM5d3ygh0cRzpUNFQ74UC2DfJv6s9BVQyk031hn/q1vWZDJBcF6U7a
         m+kjLCzMb12PZrp4SwagYy9mLvQCxI1P0nnczSXDGA1wNQZeVZ8p+t7hJqmwnEbohwJ7
         CxYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=enj8xcGxi5Ilg6e5Y2toHN1/uzGSCB2GzovsHLJELfo=;
        b=Ntq/+lLhxuJPrlBiqYSPVvMYGGQ2Qrfc/8/L46Or6qKeEHf104asaL4YHBzJG5nWxs
         L+LRLcTm6ysEdXP7W8Q/McW1SnqxDiZWw7DtqkpBNDohhodThAIb5KHn/q6SC01HDWHo
         TKKxpqQ2UOv/1uYN/RLe4duTMZFamz+HLLoKy1ijXYupHUaAUlHGKyEvqB5kpr4dwTBA
         Hdo44w/TAKcwmrHqNGHOiPF6zV6daWfYanUextKjitEn/8NJ/Wo34p4yyI4IFgu8EGqR
         2cfcSi/QLaA0DehMxVVbXoXLrJIb8/fkOuwvHREXwUN1nrMILrkz8u46RRAeaw8r9q3b
         lzwA==
X-Gm-Message-State: AOAM533pIiCoJ59WQCcAH62GUKyPbTLXtYLTBBVbjy4n0VkApfmAyGi8
        ex62gXc+L6e93ZiN+F/56eduMQ==
X-Google-Smtp-Source: ABdhPJwP2MH2BlCn6tufX2leF664LJdc0pNUhLjGMFJYxiqukh7AO/D3SzXTPcbzdBkfeEvgIjXIiQ==
X-Received: by 2002:a05:600c:35c2:: with SMTP id r2mr19396665wmq.54.1614009715270;
        Mon, 22 Feb 2021 08:01:55 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id c3sm7373697wrw.80.2021.02.22.08.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 08:01:54 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH 18/25] media: venus: hfi: Add 6xx AXI halt logic
Date:   Mon, 22 Feb 2021 16:02:53 +0000
Message-Id: <20210222160300.1811121-19-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
References: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dikshita Agarwal <dikshita@codeaurora.org>

This patch takes the downstream AXI halt routine and applies it when
IS_V6() is true.

bod: Converted to readl_poll_timeout()
     Converted LPI update timeout to dev_dbg. In practice this register
     never appears to update with the value 0x07. Discussing with contacts
     in qcom video team, this toggle only pertains to low-power mode.
     Keeping the write for the sake of fidelity with downstream.

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
Co-developed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/venus/hfi_venus.c | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index 24cf20f76e7f..01c100db07d3 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -541,10 +541,55 @@ static int venus_halt_axi(struct venus_hfi_device *hdev)
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
+		if (ret) {
+			dev_err(dev, "NOC not in qaccept status %x\n", val);
+			return -ETIMEDOUT;
+		}
+
+		/* HPG 6.1.2 Step 3, debug bridge to low power */
+		mask_val = (BIT(2) | BIT(1) | BIT(0));
+		writel(mask_val, wrapper_base + WRAPPER_DEBUG_BRIDGE_LPI_CONTROL_V6);
+
+		ret = readl_poll_timeout(wrapper_base + WRAPPER_DEBUG_BRIDGE_LPI_STATUS_V6,
+					 val,
+					 (val & mask_val) == mask_val,
+					 POLL_INTERVAL_US,
+					 VBIF_AXI_HALT_ACK_TIMEOUT_US);
+
+		if (ret)
+			dev_dbg(dev, "DBLP Set: status %x\n", val);
+
+		/* HPG 6.1.2 Step 4, debug bridge to lpi release */
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
2.29.2

