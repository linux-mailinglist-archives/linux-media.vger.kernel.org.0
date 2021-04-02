Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6F8A352967
	for <lists+linux-media@lfdr.de>; Fri,  2 Apr 2021 12:05:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234968AbhDBKFm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Apr 2021 06:05:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234783AbhDBKFc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Apr 2021 06:05:32 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78E81C061793
        for <linux-media@vger.kernel.org>; Fri,  2 Apr 2021 03:05:30 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id v11so4296365wro.7
        for <linux-media@vger.kernel.org>; Fri, 02 Apr 2021 03:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Y/5HfECUb7Yb2RUuUn+bfs1jqYGDNUP7G7Wpew9vFFA=;
        b=gdQmDDPyhFcnp3uUBDYzVn83ViKI8Z4Ye2HgHK56Ur6xT20FSkkhtlL35e5I6+PIWc
         OHxrXLdkNNquMuREXDqwY+3Gmz4VCSB6TyhTK2Vpd49quPeqc9lyrrGXHjRAWCPACJE1
         LahTuOr9hThntFaP1xrv3pFDPgyYwCngCgshnACdLk1gEHNlRx+62z/kCeeTGSK64vYq
         DiCCNyeq5KKe3Lok3AZPK+X1UaiDDWGY8BGSaL3BkV/PsNRO/KMDWaAruQKywAk9N1QZ
         v8kN4wBmqLBQEy5V4d9YVVa3BXcyLk+rFW2FkM6jLiSPH3N2GOVwhSJu5v8Dh9te/OE1
         8d7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y/5HfECUb7Yb2RUuUn+bfs1jqYGDNUP7G7Wpew9vFFA=;
        b=iJNm1DGcDfXZZeYQyk151NxG44gBCkNYcclXFdam6ojDVX94zOpg9+pzHYFWjvEf47
         vTPSJJsipuNUltC8cwkqxGPtgtozUQZehbgIakgrV89S2awB1DIexhsK4F3yQdfGJJgx
         NnrGYFxt0inI76KZyw/Cwfw10CkKrNx/IasCiSXMRIyFPftpCpC3g3zVDECI0h8aJDkl
         ETUUJXvroa87zf9UOD+l54qDuLKx+hEyxpONzYOufe6pSdxY3WLileyLkITOb/eD0pQx
         RDhU2F94n/fRQ1GHWKoNfIXTXYhoEiaDsija9Xi9ZvQFMSXP+704XwCkeGtUvXKI1Df3
         suUQ==
X-Gm-Message-State: AOAM531NU6vULc9dI4hs53R+ktTcTdPqp6tK1SQDHEuAXWlyYK5fKHkp
        KRPmPlk6cCoHbZ+yvE7WL7mBQ19Mo3dn00nS
X-Google-Smtp-Source: ABdhPJz16Ws/wAknBC3nhNBaGz1Qu05P7JAS1QIzc+3jfgiswtzAuzitNgu8qYi8JE12Lq629q6zrg==
X-Received: by 2002:adf:ebcc:: with SMTP id v12mr14121499wrn.389.1617357929260;
        Fri, 02 Apr 2021 03:05:29 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id v18sm15466618wrf.41.2021.04.02.03.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 03:05:28 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH v3 12/25] media: venus: hfi: Add a 6xx boot logic
Date:   Fri,  2 Apr 2021 11:06:35 +0100
Message-Id: <20210402100648.1815854-13-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210402100648.1815854-1-bryan.odonoghue@linaro.org>
References: <20210402100648.1815854-1-bryan.odonoghue@linaro.org>
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
Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
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

