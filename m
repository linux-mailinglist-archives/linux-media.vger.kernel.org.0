Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8268A3394DF
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 18:30:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232849AbhCLR35 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 12:29:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232176AbhCLR30 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 12:29:26 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B28AC061762
        for <linux-media@vger.kernel.org>; Fri, 12 Mar 2021 09:29:26 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id g25so4255929wmh.0
        for <linux-media@vger.kernel.org>; Fri, 12 Mar 2021 09:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DgcgmGAHc3v0xwuMz10HyiD3wAndP0bF+bK9i2XYFOQ=;
        b=kmNkmY+nG/jMRmc6MYanMjNF00hDYbmSb5766h5lw6+xW/HJdxf4Z2K0e6BTLAofLO
         9Age4lJ6lqco+hGUmKLEBG/E+TmnH4pqCYFrXtdz78dfDIHm6wBEi2E/VgVXF6hRcmWM
         FTR9MfkXygbUfqZcgQJHXG8DckpUDYI1bLbMLZECm4N1t76zmhX8IWHLXVn6hjFp8JP8
         kRn4HxP24FDHHexU9PJzP8gNoxcIOmQKYX4HtmFW3hhpey5fpLzQ+LFVBQio0nKEf7pc
         gywyGXiaKlxGcRTmyZyDZ8WkFACCMkX5Sdcm0IoDW7br+8wpL6dMLilL/fpZfZZHePZU
         GXAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DgcgmGAHc3v0xwuMz10HyiD3wAndP0bF+bK9i2XYFOQ=;
        b=I77emmRKbOvGuUf8QGhLeqmuDttk/VV64VijH8rEFkqCgodwaNS6CvTtPaR8kgF1Y4
         ICnmR0QIJeLjbISXyNxeZUrJ+n/VjTzabeKjUj4OvtDt4PXchCnuGCBjD/CjZlJpMrFx
         YuWlJkJ5Msv5Ye3S+7mXS5jUV4lyabKoUChVx4HJRxEV7rFWM4OJYIF42eT0n6oh+NLn
         b/udDZz1AUUPVocklXsEbkbCJKy2tOURF3us1WoWEultungGmSiSPZ4Ak1bVGVl1NuAD
         MMVUqTn3thA2ah8hqjnAlZBeL5J67sDuukERxtLx4JxvYEX8G+aNuQNNMSFNCoYGJ7j4
         0jiQ==
X-Gm-Message-State: AOAM531neOYpGPZqCvwyeCpT70Ge5KG5VgdF7vRO7U9Z54Eoa4TMWOuI
        BqlDUpz+QcuyxCzVP7a5+m67PPHxua/LxHa4
X-Google-Smtp-Source: ABdhPJxMnmby3kVL+uzb87yOnKhTNUlo1T8/SJsI3h2Zk7JU26v92JM0RLfYA0+NGs94h18I3fx0OA==
X-Received: by 2002:a1c:b48a:: with SMTP id d132mr13716088wmf.108.1615570164869;
        Fri, 12 Mar 2021 09:29:24 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id 18sm2876375wmj.21.2021.03.12.09.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 09:29:24 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH v2 13/25] media: venus: hfi: Add 6xx interrupt support
Date:   Fri, 12 Mar 2021 17:30:27 +0000
Message-Id: <20210312173039.1387617-14-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210312173039.1387617-1-bryan.odonoghue@linaro.org>
References: <20210312173039.1387617-1-bryan.odonoghue@linaro.org>
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

