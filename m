Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F14E63394CD
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 18:30:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232697AbhCLR31 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 12:29:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232768AbhCLR3U (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 12:29:20 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49BBCC061574
        for <linux-media@vger.kernel.org>; Fri, 12 Mar 2021 09:29:20 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id l12so5247221wry.2
        for <linux-media@vger.kernel.org>; Fri, 12 Mar 2021 09:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TCL7COtEazgKNnpkeM7OqtLt9j3hJXURS4OXneJfOeM=;
        b=i0I7Itab/QwS/dWgEZtR6Mz/+tsW2eTvp/FAYvIsLqqSUd+jGkH+Cf5kE0GH1DRti0
         KXv0bSDRZf5RUir1Lkt9FYGidMc1SzXBIC8OzfKLWxocjY+LwSxSHFDJFxspoyYK+KUx
         1R9LqDNFF/IpbBzItj6zE9i2KOYoHYTLv+gi9ORWCjqg/QQKOntqrDSCKknyALX1dgf2
         1lK/bDIYdrj+uLC+NR74kHrPA1PDeQpvvMunSSdLZexrFK0U8/FnNagGlIHh2/wJ7Yh4
         +DVmWi0LUFQaAMVvS5HHlWiyn5oWF1n+iLyeSdy5XMQnqzxymQSnuo/yeTbYfPcfjXnj
         wufQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TCL7COtEazgKNnpkeM7OqtLt9j3hJXURS4OXneJfOeM=;
        b=GpLo1uy9N5ifXwr9XlXArdjoqbniuaXmcG13ho+VYpjm6eltkFYyyRaxG6jnDAQgQg
         KggjyF/OECCibukv5qz2wU8xW/TpFMSX5hhUcGdIWJOKhgONQanunFtWFCg+01Kg+qiL
         58CPZEM+ElyjCRB1UTxJXUdfJaInsT0/1Mp9vS4Z6ByuI9SFbRLyLWxU5C49+A6/K9xx
         oTd/bKbyn75dkamIXpX6RMzFJx/18hPmxkTTPz5XIEkGwxtMo3uwG7X+RfOs5X6wZtCC
         MhujsTIfX3j5dPQC/Nn4tqUj3qUtpcSftGZG3yl7VZh6bviTJDMa8BaUw4FzsYtmckjL
         ENCw==
X-Gm-Message-State: AOAM533yWrGET1+dSgZF+JLIcoCeNy9eTXc7rVc+dRvrslB7CxluvHAZ
        NwL6mA7plUEXjmwVnEHzzhUpvg==
X-Google-Smtp-Source: ABdhPJwZVlyZEJrTB4rnm7+zr1kvGNmqDIIp+AcdrB71hZAr7eSmwKDFjf4vgOdVSISaYhwPOIUPnA==
X-Received: by 2002:adf:a4d1:: with SMTP id h17mr15234375wrb.57.1615570159005;
        Fri, 12 Mar 2021 09:29:19 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id 18sm2876375wmj.21.2021.03.12.09.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 09:29:18 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH v2 07/25] media: venus: hfi: Define additional 6xx registers
Date:   Fri, 12 Mar 2021 17:30:21 +0000
Message-Id: <20210312173039.1387617-8-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210312173039.1387617-1-bryan.odonoghue@linaro.org>
References: <20210312173039.1387617-1-bryan.odonoghue@linaro.org>
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
2.30.1

