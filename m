Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DBB2352980
	for <lists+linux-media@lfdr.de>; Fri,  2 Apr 2021 12:06:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229722AbhDBKGs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Apr 2021 06:06:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234825AbhDBKFd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Apr 2021 06:05:33 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 805D1C0613E6
        for <linux-media@vger.kernel.org>; Fri,  2 Apr 2021 03:05:31 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id o16so4331451wrn.0
        for <linux-media@vger.kernel.org>; Fri, 02 Apr 2021 03:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mV/5q5dy00tyl9BNhd6qNt4hSQy0I6ZdBP8DoR1J2gQ=;
        b=Mx3k/+wQitv/m6EFuNNzHrIwdSm4WRQ+zjO9mg9hQoM6VqEsYApZbC9TXA9Ie9U806
         KYsEHRZblqZaQ5nKG/qjAdrN7AC3/YLp9GrpaRT8NSZj82j3IFqXpb/Thrvmpk15ekkw
         B78dBwFnu/0bQFT0v2uCqKu80iChldEp0407V97Dlcg1sKDPJBEdy3osIIFpup5P3gig
         VYcJDKCnQF+qV1jK3FFdBbxzEmYuxrmWvNuMaqU39pCT7GS8RhLULtIfysmpNPw7Qawt
         gCUv2XCgjh2uYTrjpq3cNJg9qvnJVj2b4PbOONo4BI7KUzlPbTHm38g1CAYAfqzNBpqq
         Uw+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mV/5q5dy00tyl9BNhd6qNt4hSQy0I6ZdBP8DoR1J2gQ=;
        b=pkm6yq0/Er9d39vN5FiB2M09UHXdUuBBtoBpMJsyApGmQb8rZz72wbOLm520VuzihB
         XhkO5zl8ZXOFiFNG+FD2BeKrVH0qKhlNS26pzL3TFiPeeJeoB3CRcKsscEb5q4SzJvJG
         4O2FDujNZ1zSWrQJ2VnzHoii+8bYY8wZl82mkH9tQZiHbYfzIz4qhcSBYxzKvMBBI26T
         5XFAZV4GrGG/s1kZyuQOniVYOwPewvuIdaDru8yQtn+cBZbvDAkvpeCaQ6alAQRexIxA
         hc7bdHLJ+ns+qb//V35CTzXa2z1ZC8VigSj3qNW7bcKPCE+ScwMHq7LfQT2hY2JJBhgN
         Uhmw==
X-Gm-Message-State: AOAM532l7SYVsb7OI56WoXs/lThImlSCvd+yv54QWWOgsjizwdxMt+K9
        Fzth9Y1VgIhLlt5BU94JgBdzmg==
X-Google-Smtp-Source: ABdhPJxvmVRnmWUpbkXwFMylONw2zBYjaZC1g2ZAs6xwkD/UPrQ2dzEjMlS80/vM6vCUj6wYBFs8wA==
X-Received: by 2002:adf:fa4e:: with SMTP id y14mr14704141wrr.170.1617357930257;
        Fri, 02 Apr 2021 03:05:30 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id v18sm15466618wrf.41.2021.04.02.03.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 03:05:29 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH v3 13/25] media: venus: hfi: Add 6xx interrupt support
Date:   Fri,  2 Apr 2021 11:06:36 +0100
Message-Id: <20210402100648.1815854-14-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210402100648.1815854-1-bryan.odonoghue@linaro.org>
References: <20210402100648.1815854-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dikshita Agarwal <dikshita@codeaurora.org>

This commit adds 6xx specific interrupt support, some register offsets and
bitmasks differ from 4xx, which we account for in this commit.

[bod: Added commit log. Moved register definition into commit]

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
Co-developed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/hfi_venus.c | 32 +++++++++++++------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index 5f9c8aa84cd0..09fc81da0645 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -359,8 +359,14 @@ static void venus_set_registers(struct venus_hfi_device *hdev)
 static void venus_soft_int(struct venus_hfi_device *hdev)
 {
 	void __iomem *cpu_ic_base = hdev->core->cpu_ic_base;
+	u32 clear_bit;
 
-	writel(BIT(CPU_IC_SOFTINT_H2A_SHIFT), cpu_ic_base + CPU_IC_SOFTINT);
+	if (IS_V6(hdev->core))
+		clear_bit = BIT(CPU_IC_SOFTINT_H2A_SHIFT_V6);
+	else
+		clear_bit = BIT(CPU_IC_SOFTINT_H2A_SHIFT);
+
+	writel(clear_bit, cpu_ic_base + CPU_IC_SOFTINT);
 }
 
 static int venus_iface_cmdq_write_nolock(struct venus_hfi_device *hdev,
@@ -474,8 +480,10 @@ static int venus_boot_core(struct venus_hfi_device *hdev)
 	if (count >= max_tries)
 		ret = -ETIMEDOUT;
 
-	if (IS_V6(hdev->core))
+	if (IS_V6(hdev->core)) {
+		writel(0x1, cpu_cs_base + CPU_CS_H2XSOFTINTEN_V6);
 		writel(0x0, cpu_cs_base + CPU_CS_X2RPMH_V6);
+	}
 
 	return ret;
 }
@@ -1061,14 +1069,20 @@ static irqreturn_t venus_isr(struct venus_core *core)
 		return IRQ_NONE;
 
 	status = readl(wrapper_base + WRAPPER_INTR_STATUS);
-
-	if (status & WRAPPER_INTR_STATUS_A2H_MASK ||
-	    status & WRAPPER_INTR_STATUS_A2HWD_MASK ||
-	    status & CPU_CS_SCIACMDARG0_INIT_IDLE_MSG_MASK)
-		hdev->irq_status = status;
-
+	if (IS_V6(core)) {
+		if (status & WRAPPER_INTR_STATUS_A2H_MASK ||
+		    status & WRAPPER_INTR_STATUS_A2HWD_MASK_V6 ||
+		    status & CPU_CS_SCIACMDARG0_INIT_IDLE_MSG_MASK)
+			hdev->irq_status = status;
+	} else {
+		if (status & WRAPPER_INTR_STATUS_A2H_MASK ||
+		    status & WRAPPER_INTR_STATUS_A2HWD_MASK ||
+		    status & CPU_CS_SCIACMDARG0_INIT_IDLE_MSG_MASK)
+			hdev->irq_status = status;
+	}
 	writel(1, cpu_cs_base + CPU_CS_A2HSOFTINTCLR);
-	writel(status, wrapper_base + WRAPPER_INTR_CLEAR);
+	if (!IS_V6(core))
+		writel(status, wrapper_base + WRAPPER_INTR_CLEAR);
 
 	return IRQ_WAKE_THREAD;
 }
-- 
2.30.1

