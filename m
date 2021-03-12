Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 373CE3394D2
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 18:30:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232752AbhCLR3y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 12:29:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232313AbhCLR3X (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 12:29:23 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E037C061761
        for <linux-media@vger.kernel.org>; Fri, 12 Mar 2021 09:29:23 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id g25so4255870wmh.0
        for <linux-media@vger.kernel.org>; Fri, 12 Mar 2021 09:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NnuD5L3voGamYqFhLAMgkNjZdxUrSLilyf/GOp959aY=;
        b=Smu9T8dhMTXx1x6LnVAEUlH+qCRjTJu0kRVy4+lHlz5l/k7MRxOSuynFaaw0vGsTbi
         oltJwAziGdpR3Xb8hPio97TQ1uKpWlyUBoEe0O/drkpsLT6gkDUMY9H4UnTgGEsdZN0S
         T8JjXnitlw8a/uZu02GqX6oCsE8aT085I2w/MjXkIPDqWHXugTL5FEeZ2ENapWuLqrpP
         ExpFo7DhmxsYfzdDWMRf54oNH2G+tzWD4UOBvHmbKosMTAIN9ABKIcrIoPBAyX1T8uEt
         iHQ7a5EaAzVbanYnj/cwmtgH03Azyt3gqj6GRtjzbYnMd4oiMAJ5EQIgK/oSr4mimVtZ
         yfKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NnuD5L3voGamYqFhLAMgkNjZdxUrSLilyf/GOp959aY=;
        b=LA9U9LukLIGbNHc/hz4NAE2gTxk14CPqyMG41DHomc0xNgnHy7Avcx0NaTooFgsHLY
         6ZPCLWDA1H3zr2cGf/z8X6g6mGgDgskLqQ2q9Y/4g1PAp1bTBms8+IydcdjDhfP2czKL
         XVKLUUjcpwLx/2LficQK+pBtk7D/MKEJkMOnsx3hJS3eB4ktoHIq+QBmpfvp+ceRJpzR
         VA4uAwysOIM0Oxk4mgGRT1NM3TC4IaNQDADEFwmSr57VGTmqQ+57s697L+/jkc+8b/mr
         Kvx9elai7oIxHwH64rpkRZoeQjUdlmgEkwHTUszNiZQAsGNmF3SjpVYUHqX/VBg0NboD
         LjpQ==
X-Gm-Message-State: AOAM530sxhgy7tsoduOdKw1OwZrSJmrmH4MwPiZSkrncqPYs2bMxQ3Wz
        e4hAphzBy2VNZvdDLlKlGID6Ew==
X-Google-Smtp-Source: ABdhPJylSWDo2kA16g3MpvcofU0Anqe73d6l9FjOZuZ19WRfAfQSPxQ9kbbM9ar2OtsT40V1eY02JA==
X-Received: by 2002:a05:600c:203:: with SMTP id 3mr14039899wmi.88.1615570162017;
        Fri, 12 Mar 2021 09:29:22 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id 18sm2876375wmj.21.2021.03.12.09.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 09:29:21 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH v2 10/25] media: venus: core: Add an io base for AON regs
Date:   Fri, 12 Mar 2021 17:30:24 +0000
Message-Id: <20210312173039.1387617-11-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210312173039.1387617-1-bryan.odonoghue@linaro.org>
References: <20210312173039.1387617-1-bryan.odonoghue@linaro.org>
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
index cf2aa83c4378..b6f9ef6b6dcd 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -216,6 +216,7 @@ static void venus_assign_register_offsets(struct venus_core *core)
 	core->cpu_ic_base = core->base + CPU_IC_BASE;
 	core->wrapper_base = core->base + WRAPPER_BASE;
 	core->wrapper_tz_base = 0;
+	core->aon_base = 0;
 }
 
 static int venus_probe(struct platform_device *pdev)
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 0c519211fac3..6de596b5a9d1 100644
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
2.30.1

