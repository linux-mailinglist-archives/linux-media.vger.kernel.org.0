Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F350352952
	for <lists+linux-media@lfdr.de>; Fri,  2 Apr 2021 12:05:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229722AbhDBKF3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Apr 2021 06:05:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234161AbhDBKF2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Apr 2021 06:05:28 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55B47C0617AA
        for <linux-media@vger.kernel.org>; Fri,  2 Apr 2021 03:05:22 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id o16so4331075wrn.0
        for <linux-media@vger.kernel.org>; Fri, 02 Apr 2021 03:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A0Hq1qWM/ZGzT0LfPQuVO+plwGRyfpUWLhKq3EzQLwo=;
        b=gx0vj+Cb7GJceD7yM+mWTFbnO26QQ0DPpby/H2lEi7XnZ6r5fh68y95oYwYJdSFoTX
         nuUEKL9b4N1JUqoj0kffvhY+jR4Oa/eCMDHL097q6IbALlqA+pB0XG3jdGoWKsoaRyKL
         wVb/hPcAAaFAJc3iK9R7gnqQ3Jf4Yr9MfPvLuwDmFMRNU4E6mmZXGTyWHsm3NJwMqNq0
         ZciiCOH5SOBkDThfFLlwGq+FjrNr64diilzvIhSWrEr4GmDK7GOCjhb4aZKCDUHu7Trw
         AP/QUHsDHJWeFp1/SD+LmRhfjDaxxM5auqnyeW8XPLCL0ssTfd8k08LnSvqaQTBSQSwe
         b1/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A0Hq1qWM/ZGzT0LfPQuVO+plwGRyfpUWLhKq3EzQLwo=;
        b=avsP6xLRsmkvTbNKWbsCkjCBHuH5x8SlC+R4Yw+vkTqCE8ed+9fd+jpNmUUfshNp9P
         x3Q6s1bZjjnG06E2BndZo6SavO38Ac9Ne+EYFM0YmYUAC5o1BzLwnTDcrvzh6DcYd/9E
         l/nwo6oZBL8bdAPQW9HIeNmUvzP9Y1xsHiGgqOl5nmHf1WVieQwANmoB4KVfuRjF87pQ
         TZruVnwhRv2gfnUcP5kWtxJA4aOAL+JnwTjDfUkBrnX8JNgjHMzN1puQYDv43hNmVwOx
         lpiwacIQOQ2i1xQ6kXxwrymrdGD6EYMskQx46TVlBV2QSXGrSqrZoI0koO2XbYluuy+P
         G3rg==
X-Gm-Message-State: AOAM531XfTgV7wZO3Aj23PnY0eylSdmMX90Lyap//XhtpPVwvu8navWH
        2gOPWr8hbOOMrjHRyKiDwNodpA==
X-Google-Smtp-Source: ABdhPJzk1iVzGEbgnYpyyFswQ+cfrpPC731iTgyf1QnteDO/aNBc6pguLd1tvEmnrAwl76Dbs/Rbdg==
X-Received: by 2002:adf:f307:: with SMTP id i7mr14570306wro.142.1617357920991;
        Fri, 02 Apr 2021 03:05:20 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id v18sm15466618wrf.41.2021.04.02.03.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 03:05:20 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH v3 04/25] media: venus: core: Add io base variables for each block
Date:   Fri,  2 Apr 2021 11:06:27 +0100
Message-Id: <20210402100648.1815854-5-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210402100648.1815854-1-bryan.odonoghue@linaro.org>
References: <20210402100648.1815854-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

New silicon means that the pre-determined offsets we have been using
in this driver no longer hold. Existing blocks of registers can exist at
different offsets relative to the IO base address.

This commit adds a routine to assign the IO base hooks a subsequent commit
will convert from absolute to relative addressing.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c | 12 ++++++++++++
 drivers/media/platform/qcom/venus/core.h | 10 ++++++++++
 2 files changed, 22 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 68358a9f3cda..7124d9111001 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -23,6 +23,7 @@
 #include "core.h"
 #include "firmware.h"
 #include "pm_helpers.h"
+#include "hfi_venus_io.h"
 
 static void venus_coredump(struct venus_core *core)
 {
@@ -207,6 +208,15 @@ static int venus_enumerate_codecs(struct venus_core *core, u32 type)
 	return ret;
 }
 
+static void venus_assign_register_offsets(struct venus_core *core)
+{
+	core->vbif_base = core->base + VBIF_BASE;
+	core->cpu_base = core->base + CPU_BASE;
+	core->cpu_cs_base = core->base + CPU_CS_BASE;
+	core->cpu_ic_base = core->base + CPU_IC_BASE;
+	core->wrapper_base = core->base + WRAPPER_BASE;
+}
+
 static int venus_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -273,6 +283,8 @@ static int venus_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_core_put;
 
+	venus_assign_register_offsets(core);
+
 	ret = v4l2_device_register(dev, &core->v4l2_dev);
 	if (ret)
 		goto err_core_deinit;
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 0a90cd79104b..110287279f05 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -90,6 +90,11 @@ struct venus_format {
  * struct venus_core - holds core parameters valid for all instances
  *
  * @base:	IO memory base address
+ * @vbif_base	IO memory vbif base address
+ * @cpu_base	IO memory cpu base address
+ * @cpu_cs_base	IO memory cpu_cs base address
+ * @cpu_ic_base	IO memory cpu_ic base address
+ * @wrapper_base	IO memory wrapper base address
  * @irq:		Venus irq
  * @clks:	an array of struct clk pointers
  * @vcodec0_clks: an array of vcodec0 struct clk pointers
@@ -122,6 +127,11 @@ struct venus_format {
  */
 struct venus_core {
 	void __iomem *base;
+	void __iomem *vbif_base;
+	void __iomem *cpu_base;
+	void __iomem *cpu_cs_base;
+	void __iomem *cpu_ic_base;
+	void __iomem *wrapper_base;
 	int irq;
 	struct clk *clks[VIDC_CLKS_NUM_MAX];
 	struct clk *vcodec0_clks[VIDC_VCODEC_CLKS_NUM_MAX];
-- 
2.30.1

