Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8BD0321C22
	for <lists+linux-media@lfdr.de>; Mon, 22 Feb 2021 17:03:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231244AbhBVQDZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Feb 2021 11:03:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230474AbhBVQDT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Feb 2021 11:03:19 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62696C06121F
        for <linux-media@vger.kernel.org>; Mon, 22 Feb 2021 08:01:46 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id u14so19654265wri.3
        for <linux-media@vger.kernel.org>; Mon, 22 Feb 2021 08:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TZXmenqt0ijvvBP3sQrcFDHSDmrD0KkT9IFar9xeBfk=;
        b=XrfM1K87grNlRlkqyD9EoiT4Yh0K01nFBPIEiyGdsTBGdl94X+a+3JV0quvGkMF/oU
         zPZY/VolNjydaYbAzSypSkUYO5Gsypu1jRNFb+dADrCEseMti6uQ7uMupFcJquTE/2fK
         1noZukbSbPkagOGLa99o1SxZ+nBV+8+AYYcVv45xbfz2iqjjuH/S3IWB27gHotZPk6pd
         Xf2BI8Q+63mr9eNBoFMoxu+eM7mpQ8PPVr5qfPqy5PVibJfpWRTu0d0YYys+s18gyY25
         ghuVzAWhuryprTdcTWW7oOnwKEYoDzUUVSZHGWPQ/qJuUMIyXRvUYPbBo66+mcHCYNlB
         0lYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TZXmenqt0ijvvBP3sQrcFDHSDmrD0KkT9IFar9xeBfk=;
        b=KqvX1sABJWgoZoPN8fn3xC1WFhQwLaaKUwctmNjdM7uFka74On1L5WrbBfQs7guvWH
         lG9LQ1dtejlEi44LzIwBq4Sf4WJndZYpJKDDtPPhTakNW/p2vzcBj0hAkXPr5Uu0ZyZ9
         Un8V3mDwWno+N4mzoRCQbBe37eWLVBTHLD4cvjoapiUSMFJMzK1gd4lIXflIEMzk7w63
         lGKN0Pa1d77ZvWP1U7n3MhoQBsyr9jnmB0LervBKH1MxWd2f59HZ7ju7pYUwIUPVI2lh
         oFkr8E+dfvff8gde9Su5S2/JxbSe2pGZVrs27tLT5Z1MYwTeL18gVw66kT0OZOIgH8ow
         /zCw==
X-Gm-Message-State: AOAM530sEaNbyP2ZMxSWr7PLGn2lMLwv72G5h/v0mizNkuNNLfquKHfN
        1J9c4Wcp398F6sVMBp3u25UQXfmdk1rSdQ==
X-Google-Smtp-Source: ABdhPJzGyzBKAC7laa2I44u8k6zXekxOl0t+Aa3j+hpA9EAaIvvGLBFihU3VpJZh9V0lVNRZ5zyK/w==
X-Received: by 2002:a5d:6d0c:: with SMTP id e12mr21551736wrq.136.1614009705220;
        Mon, 22 Feb 2021 08:01:45 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id c3sm7373697wrw.80.2021.02.22.08.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 08:01:44 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH 08/25] media: venus: hfi: Define additional 6xx registers
Date:   Mon, 22 Feb 2021 16:02:43 +0000
Message-Id: <20210222160300.1811121-9-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
References: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dikshita Agarwal <dikshita@codeaurora.org>

- Add X2 RPMh registers and definitions from the downstream example.
- Add 6xx core power definitions
- Add 6xx AON definitions
- Add 6xx wrapper tz definitions
- Add 6xx wrapper interrupt definitions
- Add 6xx soft interrupt definitions
- Define wrapper LPI register offsets

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
Co-developed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../media/platform/qcom/venus/hfi_venus_io.h  | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/hfi_venus_io.h b/drivers/media/platform/qcom/venus/hfi_venus_io.h
index 8604b213f03f..300c6e47e72f 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus_io.h
+++ b/drivers/media/platform/qcom/venus/hfi_venus_io.h
@@ -56,10 +56,22 @@
 #define UC_REGION_ADDR				0x64
 #define UC_REGION_SIZE				0x68
 
+#define CPU_CS_H2XSOFTINTEN_V6			0x148
+
+#define CPU_CS_X2RPMH_V6			0x168
+#define CPU_CS_X2RPMH_MASK0_BMSK_V6		0x1
+#define CPU_CS_X2RPMH_MASK0_SHFT_V6		0x0
+#define CPU_CS_X2RPMH_MASK1_BMSK_V6		0x2
+#define CPU_CS_X2RPMH_MASK1_SHFT_V6		0x1
+#define CPU_CS_X2RPMH_SWOVERRIDE_BMSK_V6	0x4
+#define CPU_CS_X2RPMH_SWOVERRIDE_SHFT_V6	0x3
+
 /* Relative to CPU_IC_BASE */
 #define CPU_IC_SOFTINT				0x18
+#define CPU_IC_SOFTINT_V6			0x150
 #define CPU_IC_SOFTINT_H2A_MASK			0x8000
 #define CPU_IC_SOFTINT_H2A_SHIFT		0xf
+#define CPU_IC_SOFTINT_H2A_SHIFT_V6		0x0
 
 /* Venus wrapper */
 #define WRAPPER_BASE_V6				0x000b0000
@@ -88,6 +100,9 @@
 #define WRAPPER_INTR_MASK_A2HCPU_MASK		0x4
 #define WRAPPER_INTR_MASK_A2HCPU_SHIFT		0x2
 
+#define WRAPPER_INTR_STATUS_A2HWD_MASK_V6	0x8
+#define WRAPPER_INTR_MASK_A2HWD_BASK_V6		0x8
+
 #define WRAPPER_INTR_CLEAR			0x14
 #define WRAPPER_INTR_CLEAR_A2HWD_MASK		0x10
 #define WRAPPER_INTR_CLEAR_A2HWD_SHIFT		0x4
@@ -97,6 +112,8 @@
 #define WRAPPER_POWER_STATUS			0x44
 #define WRAPPER_VDEC_VCODEC_POWER_CONTROL	0x48
 #define WRAPPER_VENC_VCODEC_POWER_CONTROL	0x4c
+#define WRAPPER_DEBUG_BRIDGE_LPI_CONTROL_V6	0x54
+#define WRAPPER_DEBUG_BRIDGE_LPI_STATUS_V6	0x58
 #define WRAPPER_VDEC_VENC_AHB_BRIDGE_SYNC_RESET	0x64
 
 #define WRAPPER_CPU_CLOCK_CONFIG		0x2000
@@ -125,4 +142,17 @@
 #define WRAPPER_VCODEC1_MMCC_POWER_STATUS	0x110
 #define WRAPPER_VCODEC1_MMCC_POWER_CONTROL	0x114
 
+/* Venus 6xx */
+#define WRAPPER_CORE_POWER_STATUS_V6		0x80
+#define WRAPPER_CORE_POWER_CONTROL_V6		0x84
+
+/* Wrapper TZ 6xx */
+#define WRAPPER_TZ_BASE_V6			0x000c0000
+#define WRAPPER_TZ_CPU_STATUS_V6		0x10
+
+/* Venus AON */
+#define AON_BASE_V6				0x000e0000
+#define AON_WRAPPER_MVP_NOC_LPI_CONTROL		0x00
+#define AON_WRAPPER_MVP_NOC_LPI_STATUS		0x04
+
 #endif
-- 
2.29.2

