Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4973A321C4C
	for <lists+linux-media@lfdr.de>; Mon, 22 Feb 2021 17:07:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230403AbhBVQFW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Feb 2021 11:05:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231411AbhBVQD6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Feb 2021 11:03:58 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88775C061D73
        for <linux-media@vger.kernel.org>; Mon, 22 Feb 2021 08:01:59 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id v21so944328wml.4
        for <linux-media@vger.kernel.org>; Mon, 22 Feb 2021 08:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Y+z8uHHoiH3kXvzE+PJvQbC49Izfw6C+uliH5PAx0t4=;
        b=e36cmTvF56S8W0dhPPReu1tCvblqDMvLnZpUkZDREmD99hp7Pq/pOCipPoBk41nj2Q
         vZ6n//T53+kJcZ9qBZaMi9b8sXTXJSygMuzGz5dMxfJ84H0zPIeeJm9jlYYi/RfvRB7s
         n4Bg+3Vth2rRFGUJlDf54LGbSVKFA+hLteOvLWYfNmlO5azZz4TN5rE47XNfRgTgF6er
         ieHYH9LYIFOq/p+Ez1FvvUuV02p9GsoT4G9V/WZWnE+/fNOCtvsXcwHQOKoVY5pdHFkm
         tdloHqsxa5DTH+k1P61yPUHBcN1/m6p0aQXPMGSIn/26y3APe/875gzYGg1P+kb9YO+y
         C5zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y+z8uHHoiH3kXvzE+PJvQbC49Izfw6C+uliH5PAx0t4=;
        b=F0dM8J08LeWySwDaVLrRGm7245wLL9bsjAFgXqV5O21/dWQxlsX1qlfRsLZJ7oN5Q5
         twjhxh5nYyI83yqWs4o3LNLNvcf2d6Uap0sJdqKQKvGGNzeetWXWhQqbLbqJo9I2Yh4O
         eJMazBzSUOB58jZsAXDnT//gBQPS/Y2YLxAQS3xQ+M6wd80Rfq8B08xTwRy+p4Y7HtLv
         n+lSPvHkWwOAv3DSbd4bUkrYUHhhc8C+7KvNTeaDUOU5FDPTYtrvDwU8zVNrGEIqQrKq
         xeNSFMpU5+4nRdPfM2Zk0Hho5hGorum5TOAyiaUncTv/TTppNyYUH42rWO1ky5w7m1Qp
         ffeQ==
X-Gm-Message-State: AOAM532W3saiB64sKZMdgdr5l3f1xR3OfduOxDIwBzJhvsps8RfOxiQn
        vnjkSJT+jyR0kWchbsP4iA8SpA==
X-Google-Smtp-Source: ABdhPJwO9rIgx72dkbP3UyZihampSLt2feFcpIJTKy31IxBRbJ1ysvEOlykSwPdakoE7ukb5xA7VRQ==
X-Received: by 2002:a1c:771a:: with SMTP id t26mr20729521wmi.37.1614009718372;
        Mon, 22 Feb 2021 08:01:58 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id c3sm7373697wrw.80.2021.02.22.08.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 08:01:57 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH 21/25] media: venus: helpers: Add internal buffer list for v6
Date:   Mon, 22 Feb 2021 16:02:56 +0000
Message-Id: <20210222160300.1811121-22-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
References: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dikshita Agarwal <dikshita@codeaurora.org>

- Internal buffers required by v6 are different than v4,
  add new list of internal buffers for v6.
- Differentiate encoder/decoder buffers for 6xx

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/venus/helpers.c   | 23 ++++++++++++++++++-
 .../media/platform/qcom/venus/hfi_helper.h    |  9 +++++---
 2 files changed, 28 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index 2515a2225614..f0413236a56f 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -279,13 +279,34 @@ static const unsigned int intbuf_types_4xx[] = {
 	HFI_BUFFER_INTERNAL_PERSIST_1,
 };
 
+static const unsigned int intbuf_types_6xx_enc[] = {
+	HFI_BUFFER_INTERNAL_SCRATCH(HFI_VERSION_6XX),
+	HFI_BUFFER_INTERNAL_SCRATCH_1(HFI_VERSION_6XX),
+	HFI_BUFFER_INTERNAL_SCRATCH_2(HFI_VERSION_6XX),
+	HFI_BUFFER_INTERNAL_PERSIST,
+};
+
+static const unsigned int intbuf_types_6xx_dec[] = {
+	HFI_BUFFER_INTERNAL_SCRATCH(HFI_VERSION_6XX),
+	HFI_BUFFER_INTERNAL_SCRATCH_1(HFI_VERSION_6XX),
+	HFI_BUFFER_INTERNAL_PERSIST_1,
+};
+
 int venus_helper_intbufs_alloc(struct venus_inst *inst)
 {
 	const unsigned int *intbuf;
 	size_t arr_sz, i;
 	int ret;
 
-	if (IS_V4(inst->core)) {
+	if (IS_V6(inst->core)) {
+		if (inst->session_type == VIDC_SESSION_TYPE_DEC) {
+			arr_sz = ARRAY_SIZE(intbuf_types_6xx_dec);
+			intbuf = intbuf_types_6xx_dec;
+		} else {
+			arr_sz = ARRAY_SIZE(intbuf_types_6xx_enc);
+			intbuf = intbuf_types_6xx_enc;
+		}
+	} else if (IS_V4(inst->core)) {
 		arr_sz = ARRAY_SIZE(intbuf_types_4xx);
 		intbuf = intbuf_types_4xx;
 	} else {
diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
index 6b524c7cde5f..f367f43c9fb7 100644
--- a/drivers/media/platform/qcom/venus/hfi_helper.h
+++ b/drivers/media/platform/qcom/venus/hfi_helper.h
@@ -395,11 +395,14 @@
 #define HFI_BUFFER_INTERNAL_PERSIST		0x4
 #define HFI_BUFFER_INTERNAL_PERSIST_1		0x5
 #define HFI_BUFFER_INTERNAL_SCRATCH(ver)	\
-	(((ver) == HFI_VERSION_4XX) ? 0x6 : 0x1000001)
+	(((ver) == HFI_VERSION_4XX ||		\
+	(ver) == HFI_VERSION_6XX) ? 0x6 : 0x1000001)
 #define HFI_BUFFER_INTERNAL_SCRATCH_1(ver)	\
-	(((ver) == HFI_VERSION_4XX) ? 0x7 : 0x1000005)
+	(((ver) == HFI_VERSION_4XX ||		\
+	(ver) == HFI_VERSION_6XX) ? 0x7 : 0x1000005)
 #define HFI_BUFFER_INTERNAL_SCRATCH_2(ver)	\
-	(((ver) == HFI_VERSION_4XX) ? 0x8 : 0x1000006)
+	(((ver) == HFI_VERSION_4XX ||		\
+	(ver) == HFI_VERSION_6XX) ? 0x8 : 0x1000006)
 #define HFI_BUFFER_EXTRADATA_INPUT(ver)		\
 	(((ver) == HFI_VERSION_4XX) ? 0xc : 0x1000002)
 #define HFI_BUFFER_EXTRADATA_OUTPUT(ver)	\
-- 
2.29.2

