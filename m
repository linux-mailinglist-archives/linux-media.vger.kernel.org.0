Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 844ED3394D5
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 18:30:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232554AbhCLR34 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 12:29:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232666AbhCLR3Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 12:29:25 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EC9DC061761
        for <linux-media@vger.kernel.org>; Fri, 12 Mar 2021 09:29:25 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id c76-20020a1c9a4f0000b029010c94499aedso16268621wme.0
        for <linux-media@vger.kernel.org>; Fri, 12 Mar 2021 09:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pMvvR9R2ZY/KspoYguO/+u7gFaAXLGd8hg1+vgHTtsY=;
        b=X5wYU4ge26MdLzXoFs1urHNZ7Lhjs9xCvtZSW1f4Uz49J1inaMy+51pG0wXFA4AMA5
         tE+A5DQ1Pvy3HBXCp7ckBQ9mjPXmORBeHYpp+mJm8xisZlosaMmZzYdqo6IboUQifYXk
         QNJ2vPBsuEbzcEn1YUqvCLH4tK85DHIminc6urDrRiJrt439cIJj5KSjCElw0O6MOYl7
         trvf8AdmCMX6qG5aGy4JrQRcK4Vgw9ewQKb0/z3hb52wG/9w4Jfnm8ucA/u2rRjh2qwE
         wBQxmIwii+2bXppZrZzJj38Ktrm3OcSaDdvqr8CyJCLrTIepbwswwVeN+jpzMhDxMmE2
         AOmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pMvvR9R2ZY/KspoYguO/+u7gFaAXLGd8hg1+vgHTtsY=;
        b=rmu9Nv95D7/eXR2oQG1kZ5fyqO51wQRPNm3kw0VoDOUhXBO5Dtycm7bVlIG3VJeHRr
         NOU27O+UhTIIMus+fXJno6stfMYGlEOftW30irJig9SfA5bAI34dJLGCQJI04bgSO8Us
         Tqj3HpwUdGmUy6NC4MEIei7C3s+bJDGu+q7icilQjHFkfUg9o0sYJUof5dRDWIVa6hMT
         4zbWZLAioNmYnuHeuqV/E8HKb6wotQv7IrescRenqkIgmWLhxWd92f0Tl2rzMrGPS33y
         LzRFn6tBAl8a9uPFbg56+Ca/2Zevz/GU/Bt/HCjgDSN+8/rzssneW003t/fMuKM+aJNm
         gTiA==
X-Gm-Message-State: AOAM531hJeLVL5J7TUugmkgvgjDEJ9ZC/kcu/HEiYbdEz6UnRwTlKh4j
        aCOGGv9iow4fVQY4MimLZR6zpQ==
X-Google-Smtp-Source: ABdhPJyel6pzyM+/0IHk3FsXOfcAkvKJFveqBHEwLt0s9p5roIwo5gMiqU/T/ujj3g3iU1SKcEzQgA==
X-Received: by 2002:a1c:2016:: with SMTP id g22mr14268893wmg.137.1615570163938;
        Fri, 12 Mar 2021 09:29:23 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id 18sm2876375wmj.21.2021.03.12.09.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 09:29:23 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH v2 12/25] media: venus: hfi: Add a 6xx boot logic
Date:   Fri, 12 Mar 2021 17:30:26 +0000
Message-Id: <20210312173039.1387617-13-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210312173039.1387617-1-bryan.odonoghue@linaro.org>
References: <20210312173039.1387617-1-bryan.odonoghue@linaro.org>
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
2.30.1

