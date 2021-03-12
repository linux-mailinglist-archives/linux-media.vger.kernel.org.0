Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5075F3394CE
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 18:30:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232516AbhCLR32 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 12:29:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232828AbhCLR3W (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 12:29:22 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A44CC061574
        for <linux-media@vger.kernel.org>; Fri, 12 Mar 2021 09:29:22 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id u5-20020a7bcb050000b029010e9316b9d5so12670800wmj.2
        for <linux-media@vger.kernel.org>; Fri, 12 Mar 2021 09:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nQCW8ZwYzo22rvcQzFUBZHnTB+UpuvDUuYoHvF9lN9M=;
        b=UKfKk7uXleTe7zuOxsmJ8L5O7+o7WvS/kHu/FM0suoWy1OVfE27YHS1RID7Ivowkbj
         rrBapW89saHxk/O2lhOInwGmWgOe74ZvDbIiesYPrFHaqnJFRpr4F3QJ38vYgLgU27Am
         fukz93QEz7JldNSHAOVojbUJN1l4GSbDi6pHHoOcDjhCxi6zl/Tc2lQcZZgnT+j0BB+z
         zDnzXZBz+bTCg0HZ0VBZ3qtlBI/QGvG7V6Yk6eNgpp8TFdB0iKGx721PnatsZlCJIgNS
         /Iu94Dbi5kC8ypKYi6NqtxUTS2f8mkKkAQRS/miLPXvDyO3H6Ik+SYtEYQ0cWgOCDiu8
         E69g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nQCW8ZwYzo22rvcQzFUBZHnTB+UpuvDUuYoHvF9lN9M=;
        b=JH4itiWTeuBE9Bfl9oB5mmG4ced/JnkYsMYcn13/n2RJK8zvhfLmhpi/oCMD+A7Zvp
         7xYVfsYbkYLLQN+bG5dO1xY5P7fbCwhQ5DjWMd7KTnrztLkQc+S/1KzUmBQtO367NDnx
         JaJU58AYa3nbXqUtkSvsmXs+F7iSej+DICJ30x/at5fhVbU6241H8rLGB+rYHzwkxV5R
         rDcSDuMVlycKnhs+7QZ6zAYXhDUenxjVGr5T+TbA+3LI2wYcVPVqZ+KOGtZhn221GiwK
         Sfn1OI4QgKRSknB3rvoIwenk7Mq3AXOmjV9Mp8HOTDu1Bm4py3eRNYbocb5fOjI9ORg4
         nYdQ==
X-Gm-Message-State: AOAM532QKqVGGp4SZ/lSr9jSNeErbLvnyUS2CY6LV45m/IDYMXUFMNs4
        LB4zKx6Wp6x/pRlUEgUVi6Dqpw==
X-Google-Smtp-Source: ABdhPJwUPqYkrv58Bt+1w9rYFOaLopPYITFQJljwyiU3iDGF/gcd6ny45hGRNTsHvwjjzS/6ZYn1fg==
X-Received: by 2002:a7b:cc84:: with SMTP id p4mr14257163wma.10.1615570161013;
        Fri, 12 Mar 2021 09:29:21 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id 18sm2876375wmj.21.2021.03.12.09.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 09:29:20 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH v2 09/25] media: venus: core: Add an io base for TZ wrapper regs
Date:   Fri, 12 Mar 2021 17:30:23 +0000
Message-Id: <20210312173039.1387617-10-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210312173039.1387617-1-bryan.odonoghue@linaro.org>
References: <20210312173039.1387617-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

6xx silicon needs to access registers from a wrapper trust-zone base
address range.
This commit defines the necessary variable for later use.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c | 1 +
 drivers/media/platform/qcom/venus/core.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 7124d9111001..cf2aa83c4378 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -215,6 +215,7 @@ static void venus_assign_register_offsets(struct venus_core *core)
 	core->cpu_cs_base = core->base + CPU_CS_BASE;
 	core->cpu_ic_base = core->base + CPU_IC_BASE;
 	core->wrapper_base = core->base + WRAPPER_BASE;
+	core->wrapper_tz_base = 0;
 }
 
 static int venus_probe(struct platform_device *pdev)
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 85047806142f..0c519211fac3 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -95,6 +95,7 @@ struct venus_format {
  * @cpu_cs_base	IO memory cpu_cs base address
  * @cpu_ic_base	IO memory cpu_ic base address
  * @wrapper_base	IO memory wrapper base address
+ * @wrapper_base	IO memory wrapper TZ base address
  * @irq:		Venus irq
  * @clks:	an array of struct clk pointers
  * @vcodec0_clks: an array of vcodec0 struct clk pointers
@@ -132,6 +133,7 @@ struct venus_core {
 	void __iomem *cpu_cs_base;
 	void __iomem *cpu_ic_base;
 	void __iomem *wrapper_base;
+	void __iomem *wrapper_tz_base;
 	int irq;
 	struct clk *clks[VIDC_CLKS_NUM_MAX];
 	struct clk *vcodec0_clks[VIDC_VCODEC_CLKS_NUM_MAX];
-- 
2.30.1

