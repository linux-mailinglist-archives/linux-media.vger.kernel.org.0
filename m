Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD0E4321C36
	for <lists+linux-media@lfdr.de>; Mon, 22 Feb 2021 17:07:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231207AbhBVQE2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Feb 2021 11:04:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231239AbhBVQDX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Feb 2021 11:03:23 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70E15C061A29
        for <linux-media@vger.kernel.org>; Mon, 22 Feb 2021 08:01:53 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id u14so19654837wri.3
        for <linux-media@vger.kernel.org>; Mon, 22 Feb 2021 08:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ydCvjig/fTWBU2tmvlvgsTt4/ro9Rgs2cIyaPwTVr/s=;
        b=CiRR9RbJUpHH96GLLLoUIbzkEU/d0ZFrzs8DNSbLxkwwRybnMK7myUud6Y2BgaxX77
         jzxDYpcq/7wRgDwldMvwZLz7NoBfaRNQASLrAuzq2l8hLIG3kBY7nLRP5qqLv8yfbBCz
         SowyFsaZM0Rk1Xo42NE2tahW14Y6p7g21dJ32C0Sz+bmh3NHRftgeHfNPbTOE60UGE0o
         kZdcQp+hDuTt/xgFBBIQHGo0niBsclrBFHps55DwL23kicmXNesQX7pHHqUOs3DzZs4A
         yUs72TXmsnLHqkibuut08GlbcJiafYEAgryofUQNPzB8Y9nr5BJvNLZCFBbsPOGemzuF
         Wv7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ydCvjig/fTWBU2tmvlvgsTt4/ro9Rgs2cIyaPwTVr/s=;
        b=kmt0bUrnzlqS8XwNIrSsBVQdOxU7NHUOZfuBLYG+K+lEh/SnEHh5/OJG0gYGdKpyeT
         KGgj5MObmGR3hmH/pr/uObVyMt9gigDeg3JQRUL+Ngqwqa2p+t2AHz46lnsa0FA19sSx
         FpMAU8hNGe/F/DR2vQlI1H+D9PCtPwtxdOel7Yeiwyljv4/cVpxS9O+8iSM9zSMUWZbx
         7saA7NPP1vY1tWgVllQU0BqwxQiWugkEsxv3G7yvDxL/c11GS2lO+Wlm24Wm3/9OCIFW
         1eKHy6Jxcvw1RRMbviA0MaNYVGJ3SKoGutGb5p8l7gDLfjwtQuU73IjfKdkOmi3zkP1d
         AiGg==
X-Gm-Message-State: AOAM5316hl/QpY25BSH5B0lHG5qV9nJpTRXmiYgVKhX4MC8AFwPN3F+G
        Zci7JyrFUl8h82q+LN3C3rJn9gWVUpTSjQ==
X-Google-Smtp-Source: ABdhPJwgv6iySa/ul9H1trlpcXpTjzwqnh1xMSnzKr8lXLrP6x1B91PYFzLuXQEtQQ73q5nljpBAHA==
X-Received: by 2002:a5d:44cf:: with SMTP id z15mr22058617wrr.191.1614009712197;
        Mon, 22 Feb 2021 08:01:52 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id c3sm7373697wrw.80.2021.02.22.08.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 08:01:51 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH 15/25] media: venus: hfi: Read WRAPPER_TZ_CPU_STATUS_V6 on 6xx
Date:   Mon, 22 Feb 2021 16:02:50 +0000
Message-Id: <20210222160300.1811121-16-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
References: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6xx we should read wrapper cpu status from the wrapper TZ register set.

Co-developed-by: Jonathan Marek <jonathan@marek.ca>
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Co-developed-by: Dikshita Agarwal <dikshita@codeaurora.org>
Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/venus/hfi_venus.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index 09fc81da0645..dabff8654f97 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -1472,10 +1472,14 @@ static int venus_suspend_1xx(struct venus_core *core)
 static bool venus_cpu_and_video_core_idle(struct venus_hfi_device *hdev)
 {
 	void __iomem *wrapper_base = hdev->core->wrapper_base;
+	void __iomem *wrapper_tz_base = hdev->core->wrapper_tz_base;
 	void __iomem *cpu_cs_base = hdev->core->cpu_cs_base;
 	u32 ctrl_status, cpu_status;
 
-	cpu_status = readl(wrapper_base + WRAPPER_CPU_STATUS);
+	if (IS_V6(hdev->core))
+		cpu_status = readl(wrapper_tz_base + WRAPPER_TZ_CPU_STATUS_V6);
+	else
+		cpu_status = readl(wrapper_base + WRAPPER_CPU_STATUS);
 	ctrl_status = readl(cpu_cs_base + CPU_CS_SCIACMDARG0);
 
 	if (cpu_status & WRAPPER_CPU_STATUS_WFI &&
@@ -1488,10 +1492,14 @@ static bool venus_cpu_and_video_core_idle(struct venus_hfi_device *hdev)
 static bool venus_cpu_idle_and_pc_ready(struct venus_hfi_device *hdev)
 {
 	void __iomem *wrapper_base = hdev->core->wrapper_base;
+	void __iomem *wrapper_tz_base = hdev->core->wrapper_tz_base;
 	void __iomem *cpu_cs_base = hdev->core->cpu_cs_base;
 	u32 ctrl_status, cpu_status;
 
-	cpu_status = readl(wrapper_base + WRAPPER_CPU_STATUS);
+	if (IS_V6(hdev->core))
+		cpu_status = readl(wrapper_tz_base + WRAPPER_TZ_CPU_STATUS_V6);
+	else
+		cpu_status = readl(wrapper_base + WRAPPER_CPU_STATUS);
 	ctrl_status = readl(cpu_cs_base + CPU_CS_SCIACMDARG0);
 
 	if (cpu_status & WRAPPER_CPU_STATUS_WFI &&
-- 
2.29.2

