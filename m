Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECFB03394C9
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 18:30:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232659AbhCLR3Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 12:29:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232176AbhCLR3T (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 12:29:19 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CB68C061761
        for <linux-media@vger.kernel.org>; Fri, 12 Mar 2021 09:29:19 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id j7so2205128wrd.1
        for <linux-media@vger.kernel.org>; Fri, 12 Mar 2021 09:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=//Lf2E+FwfUxhoM1H7CSX+v4f8W4Os22eBseL5ilxQ4=;
        b=tEjisLsOKcUreRdPy2nqewRCnH+dXcnokK94YS9w3cNsWtXaDlU9EDeIYWzZutQR4Y
         inOtu4FCE7y6VALgXCgYoRCoAj06Re9tLMzs6OCJCxOJ7BcjrENmHUfoBQ5wDKBtHmUB
         Z932ZbI78UdiVhExYMyvhNFoJfBHpzUaLa4Q87oZY9kL/cf6EfOjjyfwFnw0VKQZ0PYL
         6ParJ/2GOfpDKFICNifPd2kVTLVvcoPG1W3bGiHi8Ch0qdM36ZwzW+hurxE/TllLmoTn
         MloZxF0sunwxM5HWM7sE4XoIUfJhEjjkpHp5AQ1dDtHRU3Wlb4C5N1tMFcZTPqEhnW3n
         Oh8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=//Lf2E+FwfUxhoM1H7CSX+v4f8W4Os22eBseL5ilxQ4=;
        b=iEOWKz4hgNtPRr+Z4EGTrPirchU5U8Brbc+OJg2/fiQWLOzWYwrjCeWM1ifHl4Q4PR
         /L42ogI08tFQ1hVCEoNjIck6PDgyh/o0Oql0GdfR0rveiK4wGRvm0mu7tHv7Nxa3w5To
         Bd0RRnW2FpwHAnc45raF/aHL3VEtoXVJnRYg4zTNwfo360cQh56MmGanJfzbsAe3TgdY
         hg2GnlPT5TLjoblnKndX9hQsvmapOWDa9FYU+LPn39B/uPYSBa9KvamVOSc59AjBDeD6
         tMdlAoNwFLyUJwQ4wfLw/3JiM7gFcmwqOYKLYPOjpigf1EynddyrKYPc8SlJ3Lw7uvA9
         bMgA==
X-Gm-Message-State: AOAM532/LpxJLfl8vqOO2o9qS4ObCzi47qeTmnBgrrP8GcOMKoVKG7T8
        klJNSTDjIEtXBmr65R+hSJRiag==
X-Google-Smtp-Source: ABdhPJzwL9M4cvWyMnjfJMI6giXJ1Rk2URlH+FC0YBSBXT/QEJd/rzmJqBSp8FCYzlQoRTWz28eZhA==
X-Received: by 2002:adf:bc01:: with SMTP id s1mr15269477wrg.240.1615570157988;
        Fri, 12 Mar 2021 09:29:17 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id 18sm2876375wmj.21.2021.03.12.09.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 09:29:17 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH v2 06/25] media: venus: hfi: Define block offsets for V6 hardware
Date:   Fri, 12 Mar 2021 17:30:20 +0000
Message-Id: <20210312173039.1387617-7-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210312173039.1387617-1-bryan.odonoghue@linaro.org>
References: <20210312173039.1387617-1-bryan.odonoghue@linaro.org>
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

