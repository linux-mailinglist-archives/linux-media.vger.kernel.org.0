Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C93323394D8
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 18:30:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232233AbhCLR35 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 12:29:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232702AbhCLR31 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 12:29:27 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C1B2C061761
        for <linux-media@vger.kernel.org>; Fri, 12 Mar 2021 09:29:27 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id a18so5212076wrc.13
        for <linux-media@vger.kernel.org>; Fri, 12 Mar 2021 09:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PZHJdY8fakNaK6P7dFBhgcz/Bbfh/JsCZheBpgT33jI=;
        b=RoEk2PkcxJb2qKkIaTXJ4Z54Ghie9qdl9peDZj2azFnqAO4R3XWmHTukWoTTHg5Kme
         +2d/QP3LPrq9NynIQflNdRwFkyxOUyVkVYo1pxXRxU1NYGRCjhGjFSTWuft50DjRrFoQ
         hfsS4/tBe99SVdz2vCwimyh3AK90eAcqPyAcMkXCpCOaqUfw3pJJLee4SUIRr3rb+YEs
         5yAhYa/WenkU6OfffeSC0/rP0b68KNJykXZP3reL8Nb6PKEvZC3gRgPoXPyEmmu5zd82
         TqpyNzrNTf8nKkKDRXhol4TWW5N1vlSt33B8jYpOfXc7+lnyZYF77yR7t+DAy2H7BFKb
         RWUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PZHJdY8fakNaK6P7dFBhgcz/Bbfh/JsCZheBpgT33jI=;
        b=M3RBvLHgnIf5+QRMQp2GAH5a7/NzN1sCg/GFMTy43S1a0LhfddgbQwh3tALpRbaS01
         YXIOibsQw3aEJgNCyfwS+UPB6WsXg62FTSi6+hA7AdH0AmhzZz2Vp8i/1ERjpwG1aLld
         tr1htJS6sCPrjEf2I/EqzR2DdfFRw0+AL7ClbJe1Iyv0VS0zrk3q2AzKcb3L8xtEzxkM
         R7Kf42+jHN5fMxMNRm0aR8moVCjS5Xf0MRtFz/QdDFKKGPoYGTiPG5CDrO9L3MiE2D27
         1l63s4rFh5I3/gZbUGs4rAke8RJyLVXoTH1g19mmCNWItoDBQmtzLRKSvmrc6X7IFtZW
         3eVg==
X-Gm-Message-State: AOAM532uN/J1KzL9SGhc0wFe4kS+0qVoBknBxdlfL0HyKigCdZ7fwF+3
        Tfyt7q6kI5C8p6f2zRHLPfa7dA==
X-Google-Smtp-Source: ABdhPJy1QPyjZvvwjTUYPdK3eSIvAxLPXI+sxqn1GOx3QMNJkH3YSTOfncj/myrWEQpIBijNYl+eBg==
X-Received: by 2002:adf:9261:: with SMTP id 88mr14795224wrj.270.1615570165868;
        Fri, 12 Mar 2021 09:29:25 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id 18sm2876375wmj.21.2021.03.12.09.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 09:29:25 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH v2 14/25] media: venus: hfi: Read WRAPPER_TZ_CPU_STATUS_V6 on 6xx
Date:   Fri, 12 Mar 2021 17:30:28 +0000
Message-Id: <20210312173039.1387617-15-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210312173039.1387617-1-bryan.odonoghue@linaro.org>
References: <20210312173039.1387617-1-bryan.odonoghue@linaro.org>
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
2.30.1

