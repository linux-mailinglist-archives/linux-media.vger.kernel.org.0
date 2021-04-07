Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFCB7356AA2
	for <lists+linux-media@lfdr.de>; Wed,  7 Apr 2021 12:56:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351729AbhDGK4R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Apr 2021 06:56:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351732AbhDGK4O (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Apr 2021 06:56:14 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39F9FC061761
        for <linux-media@vger.kernel.org>; Wed,  7 Apr 2021 03:56:05 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id qo10so16534839ejb.6
        for <linux-media@vger.kernel.org>; Wed, 07 Apr 2021 03:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QtzWXHJA+5FuG0p3JmasWDLoGcvseqdKJ8JMwmLlN90=;
        b=PtVtBI5/56xbKIWUAYox6l24X0F9X7Tr5o8krgPEl0bgccWxp6Ex6Uo8j68Te4RwNj
         Nsh7+O2mGSjjSB3gFyQpW+uHn2Dpu+mD/n9+aV8zA9ppzElfKQbzUXUXzZN9uzeafEtp
         /bAwdxscF2JVXnpqjVdPIULWTcKrJwfp1RPwWYsK817zbo8uOdfoyFSw0JrKmbMnHUvp
         8fx6LZGm1MgPO0fvPSTsmxyMAtesXQX0/cShSTlNtalWIBzphR2uzg9YZAoVZlWCtqFh
         DJTsctFQCvrneV88lmE3Tuy7xr6mjSmEt+zDoVFpEiaQzCejgu7Mh6EPKooM09U0Rdyi
         H86g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QtzWXHJA+5FuG0p3JmasWDLoGcvseqdKJ8JMwmLlN90=;
        b=ululw17B4PsYCWMUMzSVvN+EjYZ2kZQq+VuwBuCbFva1SiH69kzxiwdKwHRkd4aAZq
         2nVi+UDHqdkS8hxymoxAYZM1UigPfo+plo/VaxD9PJxfmgR67ZdXDQBMGJkyMTYDlrqJ
         9+zKjNfyHTcghizjcbJQkl2RNW3dtHxgpBOpdTSaUSjn49AXSJISzovqevSTNSbrhItj
         6VJxdjGzulwwjce1u+ZG+x7OP7GDQFcqnst7R0KtEr6mhwxuFhJCbpy3RWMp5Y9OamsV
         NnMXPjKfvYMGpUvBCpnrV258XyBeNycWpS1t8njM4RsiG3PML6mHfMIxLZaFB7zdLm5H
         oYZQ==
X-Gm-Message-State: AOAM533YJC/jhhvfJHIkBlADqAhdLktTr+5dcuzOncXyD+Sq1vguWjNb
        WhDfjKqILscI7h2dwqTniZ9gdu768ZDTHaJQ
X-Google-Smtp-Source: ABdhPJx17I9qRckGvBfZh2zuNpzz5BgPM41T6S0xyABoTLW5QKoXvtW81UIx0EQzavyt7VXkKeqM7Q==
X-Received: by 2002:a17:906:e0b:: with SMTP id l11mr3089773eji.111.1617792963805;
        Wed, 07 Apr 2021 03:56:03 -0700 (PDT)
Received: from localhost.localdomain (hst-221-20.medicom.bg. [84.238.221.20])
        by smtp.gmail.com with ESMTPSA id f9sm15400666eds.41.2021.04.07.03.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 03:56:03 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH] venus: hfi_venus: Fix a warning in venus ISR
Date:   Wed,  7 Apr 2021 13:56:00 +0300
Message-Id: <20210407105600.348245-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix the following smatch warning:

hfi_venus.c:1100 venus_isr() warn: variable dereferenced before check 'hdev' (see line 1097)

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/hfi_venus.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index cebb20cf371f..114fcb6ee9a0 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -1093,13 +1093,16 @@ static irqreturn_t venus_isr_thread(struct venus_core *core)
 static irqreturn_t venus_isr(struct venus_core *core)
 {
 	struct venus_hfi_device *hdev = to_hfi_priv(core);
+	void __iomem *cpu_cs_base;
+	void __iomem *wrapper_base;
 	u32 status;
-	void __iomem *cpu_cs_base = hdev->core->cpu_cs_base;
-	void __iomem *wrapper_base = hdev->core->wrapper_base;
 
 	if (!hdev)
 		return IRQ_NONE;
 
+	cpu_cs_base = hdev->core->cpu_cs_base;
+	wrapper_base = hdev->core->wrapper_base;
+
 	status = readl(wrapper_base + WRAPPER_INTR_STATUS);
 	if (IS_V6(core)) {
 		if (status & WRAPPER_INTR_STATUS_A2H_MASK ||
-- 
2.25.1

