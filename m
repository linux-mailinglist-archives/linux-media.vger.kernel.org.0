Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7CD83394C6
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 18:29:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232562AbhCLR3Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 12:29:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232714AbhCLR3R (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 12:29:17 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEAECC061574
        for <linux-media@vger.kernel.org>; Fri, 12 Mar 2021 09:29:16 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id v15so5245552wrx.4
        for <linux-media@vger.kernel.org>; Fri, 12 Mar 2021 09:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A0Hq1qWM/ZGzT0LfPQuVO+plwGRyfpUWLhKq3EzQLwo=;
        b=LjLRJE3DXbEvEaad1BScgs8pZNKT0YRanrzcpLFHzg3MBgcbKNYIkciXTeXVE4X6gY
         DmaUrkk8XouL103i2B1JXi4LYCz7JHBiC+6u4MhRcFd6kVsmaW2fE6HqDwWPbwOTCiJU
         sc7pzm0/KtU+sfTe+sMUemGaSDtMjuANWu/8z3LK4f/lMM2opb8lOk8gr5QYrIFh6916
         Tcb1/q3vnjvv/xCL9KSWP3sHsg4wMxaK7TKqcNjXVfxEEDK4fe4shoQa+qciC++TQIia
         avoetQP13Y+mxOy7JumbV1iRAxAtPczoPftsNxKjNOnGiKm7WT30i3AyiovHGum2FEP3
         nJXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A0Hq1qWM/ZGzT0LfPQuVO+plwGRyfpUWLhKq3EzQLwo=;
        b=hb55wkCde+lZNody9dJpATHcCj15FKXqwTjtwOfiOzASV8gvV38Mk57QcoBX9XiNu5
         cwtXiVwvHk92ZETtx+Ud7Gbe9cL8QRBeJDx57SOYe6ywnBEa7FAiZNWfdnAANlkaQtvO
         rJMBsFDyFU3JnqFPcYWpC/XYkRdkNN4/FqBGlRoasSKjHxvZXSOttkWODMjFjNwAGSP1
         sC+XWkNb3DncgEpCL+ia4+K+uJD7ME5Z4qlweoFOaTz+aRbitpzAhNOZJy2i5NtLhnch
         sSsRn88NI1SAU2GiJWDKDHqqJ6XGq/sYXGQeLNIgI6AhVq1ObSzBEFl2WwgDH3oB/O6n
         eWcA==
X-Gm-Message-State: AOAM533oC5ugRCkm/5FdsnfS96pgppP+yPtOW/B74iLnoNyHbU8DS0XL
        o7lv+xK/cCdbCk2AEgdFrcYzjg==
X-Google-Smtp-Source: ABdhPJz87PQbHDYVO7qnQP3H7y6C2IxtigQz+3hKual5fcqiWJ2OWYA3ISTmgmfX1GxquWp3zG4l6w==
X-Received: by 2002:a5d:5051:: with SMTP id h17mr14860862wrt.80.1615570155561;
        Fri, 12 Mar 2021 09:29:15 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id 18sm2876375wmj.21.2021.03.12.09.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 09:29:15 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH v2 04/25] media: venus: core: Add io base variables for each block
Date:   Fri, 12 Mar 2021 17:30:18 +0000
Message-Id: <20210312173039.1387617-5-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210312173039.1387617-1-bryan.odonoghue@linaro.org>
References: <20210312173039.1387617-1-bryan.odonoghue@linaro.org>
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

