Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67EC235295F
	for <lists+linux-media@lfdr.de>; Fri,  2 Apr 2021 12:05:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234981AbhDBKFi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Apr 2021 06:05:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234512AbhDBKF3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Apr 2021 06:05:29 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B91BC0613A7
        for <linux-media@vger.kernel.org>; Fri,  2 Apr 2021 03:05:24 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id j9so4293366wrx.12
        for <linux-media@vger.kernel.org>; Fri, 02 Apr 2021 03:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=//Lf2E+FwfUxhoM1H7CSX+v4f8W4Os22eBseL5ilxQ4=;
        b=gVmyQltdWtiiQ8QKRK/VXxt5OfwoWohw6MvVGeWREIjl7ozccaZRPta0vsiNJGBrYc
         AjUSA5jQubOL5sAwAefpkx1CLI0mH5nJ7K/WWWJpb4bZyx0JoYA6GX4rGyGzF3CXwO7Q
         xiRdaT0QCSMfmo/ZB+b0eH5sSUC2U+sF37K1WS1vELTYV88lwZzxIchRNs7cpyywi7yQ
         Bo7tAMh7opVBynOSNB9jY45CkdEV1q9cRGym7T5+LH9h0wG7ZyqdT6wJD7NruQuzLATl
         IoQTiqRSyamppXDs8J/2dELRVIJ3uFmH0VkmiZwEO5m6s0AGhnPn1YSZS+BJMbEPBYH6
         AJwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=//Lf2E+FwfUxhoM1H7CSX+v4f8W4Os22eBseL5ilxQ4=;
        b=GuiAQ3CalGxLriL6CE2IhbmXEopbcZauy1rmGGopb37XMSmUd42OFV1ZrR2+BBrozf
         W+FXURF8YOyHUqJVW5Ixs19HYL5NObD2g/W6sUYU3coQB8wLlwvExg0SWRBD8bLMyta1
         1ns2ogXTilOCXZqP3FQx6W1Fk2J3ORgns/BUNTWK2uJqyFvP26irxjQBGQ5No46yM0gW
         oHbireLZ5qw4cElSmMhHIz+ndhWrPsQlbgY021fcJsinknVSORh1idyRAszcq9CMBPqt
         S+tWs6bOhoVcwj95rE8jq4VXxDeuvETmJfSGXTzkcYafmgXkSJJJPedd4AeIHZ+JT3DT
         Xc1w==
X-Gm-Message-State: AOAM531lnSC3Q3HktO7ygBtgNNQNJebGcQQzH56HedF5ekKwVRplSM0F
        hu33MyXHylMAOC4PkyY0WULwtQ==
X-Google-Smtp-Source: ABdhPJwYXK314FDxc1GybIu0Rp3ka9UaPu4bWn9hbLoWptvEW1znD1C/nlmAu7QZEHg7lfWGNYD7Uw==
X-Received: by 2002:a5d:58ce:: with SMTP id o14mr14742728wrf.4.1617357923134;
        Fri, 02 Apr 2021 03:05:23 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id v18sm15466618wrf.41.2021.04.02.03.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 03:05:22 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH v3 06/25] media: venus: hfi: Define block offsets for V6 hardware
Date:   Fri,  2 Apr 2021 11:06:29 +0100
Message-Id: <20210402100648.1815854-7-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210402100648.1815854-1-bryan.odonoghue@linaro.org>
References: <20210402100648.1815854-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dikshita Agarwal <dikshita@codeaurora.org>

This commit defines a range of new base addresses for already defined
blocks.

- CPU_BASE_V6
- CPU_CS_BASE_V6
- CPU_IC_BASE_V6
- WRAPPER_BASE_V6

The base addresses of the blocks are slightly different for 6xx but, aside
from that are layout and bit compatible.

New 6xx specific block addresses will be added in separate commits.

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
Co-developed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/hfi_venus_io.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/hfi_venus_io.h b/drivers/media/platform/qcom/venus/hfi_venus_io.h
index 4c392b67252c..8604b213f03f 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus_io.h
+++ b/drivers/media/platform/qcom/venus/hfi_venus_io.h
@@ -19,6 +19,9 @@
 
 #define CPU_CS_BASE				(CPU_BASE + 0x12000)
 #define CPU_IC_BASE				(CPU_BASE + 0x1f000)
+#define CPU_BASE_V6				0xa0000
+#define CPU_CS_BASE_V6				CPU_BASE_V6
+#define CPU_IC_BASE_V6				(CPU_BASE_V6 + 0x138)
 
 #define CPU_CS_A2HSOFTINTCLR			0x1c
 
@@ -59,6 +62,7 @@
 #define CPU_IC_SOFTINT_H2A_SHIFT		0xf
 
 /* Venus wrapper */
+#define WRAPPER_BASE_V6				0x000b0000
 #define WRAPPER_BASE				0x000e0000
 
 #define WRAPPER_HW_VERSION			0x00
-- 
2.30.1

