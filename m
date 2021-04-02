Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 153FF352959
	for <lists+linux-media@lfdr.de>; Fri,  2 Apr 2021 12:05:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234692AbhDBKFb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Apr 2021 06:05:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234389AbhDBKF2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Apr 2021 06:05:28 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81C45C0613A9
        for <linux-media@vger.kernel.org>; Fri,  2 Apr 2021 03:05:25 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id o16so4331206wrn.0
        for <linux-media@vger.kernel.org>; Fri, 02 Apr 2021 03:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PUYbzJMVwAU0QfJQ7XJdH18CiuxDYm9UB052eyj741s=;
        b=N4Z1DE3LLlNk8ORpjaoacXq2gP9MH8vQO1SGrE5OpQhqI4rg1zdCYK80nV09pC7R3F
         Ot5nRz7YwUjBPOnZbItQlKTwNeaUh3Yzccf1CYVl3CInT+S8oHyXfSEx6wrrQkdoY2d7
         VRqb1WMGmA5rJ0pikI4jQTd+1/VC+w/5YoRjdBCasRFS/nbTR/36p952wdz+bWgoIvY2
         UO85XTrlsDX6AdZyOigjhy0dBkan2AsRJ1XWdgy8a2Q9rPT0OLP0nwWvZUp4oNEEWCQy
         8rgfbfGBdpfWSz+wN+I9SqWcx1pUWIekqdDjRZdVW11nXpEMv4/WekmfrE2HfwcWeYRl
         19sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PUYbzJMVwAU0QfJQ7XJdH18CiuxDYm9UB052eyj741s=;
        b=Vc4zW0Qbdx2EmVVfhQU9Xz70GfrqQqWQ1VtCEO1BGxw2OXccpw42hibGPM9sfd6XqA
         8hqWwfbKQ2RdSQoHXJoInRVMBB78X74cMVbk/lBxSASVYG0z1NL1DKQv/eVTb1BghAl1
         t/f00+zAwYjfqsVCOpcTYVwUl/tuU8IjsWXgSEpSZBfUD7/s3AzmIO6ahTtwBH0+fgR/
         7MmP3VFtcISIQdqhFoGxFV9TzhbGsuo29hByKDfpZf8XVLV2c/hGLmz8bIkOpqUAqgWm
         8iTOKVb2IVIe8a0Wx9x/jVd9lqg8vmFlH9+KSECmq0y7yd5Dyv/m74Gv07EOdo3aKR/2
         /I2g==
X-Gm-Message-State: AOAM531QJWACRs/w2FW8a3YBuzrgtdGsAAFzOaagsGiiE3PmhYEhJ8eN
        AVHZx27AS4Q4tApux0xonce3lg==
X-Google-Smtp-Source: ABdhPJzJE9Y60th1lfFI7v1tTRQ/RhhW+laxjBv1HsgH7/JXk7IchSdIQGy1f3h3WXI2MbL6m7XN2g==
X-Received: by 2002:a5d:4d09:: with SMTP id z9mr14105797wrt.426.1617357924194;
        Fri, 02 Apr 2021 03:05:24 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id v18sm15466618wrf.41.2021.04.02.03.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 03:05:23 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH v3 07/25] media: venus: hfi: Define additional 6xx registers
Date:   Fri,  2 Apr 2021 11:06:30 +0100
Message-Id: <20210402100648.1815854-8-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210402100648.1815854-1-bryan.odonoghue@linaro.org>
References: <20210402100648.1815854-1-bryan.odonoghue@linaro.org>
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
Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
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
2.30.1

