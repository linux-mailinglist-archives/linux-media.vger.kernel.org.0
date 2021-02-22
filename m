Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C3FA321C27
	for <lists+linux-media@lfdr.de>; Mon, 22 Feb 2021 17:04:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231289AbhBVQDh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Feb 2021 11:03:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231222AbhBVQDV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Feb 2021 11:03:21 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6669DC0611C0
        for <linux-media@vger.kernel.org>; Mon, 22 Feb 2021 08:01:49 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id c7so2883060wru.8
        for <linux-media@vger.kernel.org>; Mon, 22 Feb 2021 08:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=X/puQRm1/H6m4WNnTmXYDqGRONSIKPTs3nt8rX8xbO0=;
        b=JsrPjvI48UCnUWcuP6kDjhPGcfchsyx3j+jgOtVjCPp1dJ45HDghmtj7qRY1nD0M0r
         fmP0dYUnZNY40WqEzedI9HkHlTo8vrDtTZsrA7Epd7oZPPXTKRhm8Q2T2vmYN+gZZ1d9
         WaQspRKS+U3iZr/JV3wCFTbf7792BfDO39Xowbny/SPHjePPZPkuDKRhoKgeuv9WGQj6
         3hskL28NJV1l+uxuMp7Y8sh5mB8012eXBW/AfqFy4VDemlmFsAgil0gF31CONM5jIcAF
         V0hNer9rspphBWafHp9k9ex7C3posdCXaQoUt2g31G2unR6CfN0LNnaK7mHrXhFqe0EV
         RK6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X/puQRm1/H6m4WNnTmXYDqGRONSIKPTs3nt8rX8xbO0=;
        b=prw6lGIfwuc69Cu+xeT4gqtPRbnKfeO41YnYbmNdz3rWpkZObfXRoQ3KS9Ncu9wE4V
         +cTycNnac4OKb7PUd3hc/6eC0I1Tse5BPHJtcLp18ek/A1svhh0ROPUV1NkY+pJDpJ8E
         BUNrZs/EbPaPlG3JZx0dxZ589IxF3SGP3iDznsWMD7W4r8YxEI6DclDLcqft9R2qoIug
         Pno+7jOY/8GXSf6lmAaJpsU0Qa2l5zHAxYdSm4oJ5J30Fyi5+eZ+G44ez3EL89fFtHdM
         4YC55nh2tqSjZZw53vd3/fSTu+rNAewJLaomKD+0WqoFcBrA0HnogvqBxeVpnyaQjZf6
         Y9AA==
X-Gm-Message-State: AOAM5334a6mS/+PjQrbUUEvEFxtT2Vti0cdBkAZz9f3ujB5G7649T/fd
        T5jK/HFFEOnUnA/GApMLigIkB3ddMlbR9w==
X-Google-Smtp-Source: ABdhPJybu35JgJQhoZCTUtY+dXw8VjDCzpt9wbA+AYewBujd4tJjdUalMjbzl+yoEElrEloq6dH0Nw==
X-Received: by 2002:adf:fb8a:: with SMTP id a10mr22035980wrr.365.1614009708206;
        Mon, 22 Feb 2021 08:01:48 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id c3sm7373697wrw.80.2021.02.22.08.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 08:01:47 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH 11/25] media: venus: core: Add an io base for AON regs
Date:   Mon, 22 Feb 2021 16:02:46 +0000
Message-Id: <20210222160300.1811121-12-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
References: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

6xx silicon needs to access registers from a AON base address range.
This commit defines the necessary variable for later use.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c | 1 +
 drivers/media/platform/qcom/venus/core.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 35a8956fe969..dad597617961 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -215,6 +215,7 @@ static void venus_assign_register_offsets(struct venus_core *core)
 	core->cpu_ic_base = core->base + CPU_IC_BASE;
 	core->wrapper_base = core->base + WRAPPER_BASE;
 	core->wrapper_tz_base = 0;
+	core->aon_base = 0;
 }
 
 static int venus_probe(struct platform_device *pdev)
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 54e6cd89b30a..8328f7210d6c 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -96,6 +96,7 @@ struct venus_format {
  * @cpu_ic_base	IO memory cpu_ic base address
  * @wrapper_base	IO memory wrapper base address
  * @wrapper_base	IO memory wrapper TZ base address
+ * @aon_base	AON base address
  * @irq:		Venus irq
  * @clks:	an array of struct clk pointers
  * @vcodec0_clks: an array of vcodec0 struct clk pointers
@@ -134,6 +135,7 @@ struct venus_core {
 	void __iomem *cpu_ic_base;
 	void __iomem *wrapper_base;
 	void __iomem *wrapper_tz_base;
+	void __iomem *aon_base;
 	int irq;
 	struct clk *clks[VIDC_CLKS_NUM_MAX];
 	struct clk *vcodec0_clks[VIDC_VCODEC_CLKS_NUM_MAX];
-- 
2.29.2

