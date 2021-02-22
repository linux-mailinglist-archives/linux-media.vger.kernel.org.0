Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80307321C19
	for <lists+linux-media@lfdr.de>; Mon, 22 Feb 2021 17:03:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231210AbhBVQDJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Feb 2021 11:03:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231130AbhBVQDD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Feb 2021 11:03:03 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44DAFC0617A7
        for <linux-media@vger.kernel.org>; Mon, 22 Feb 2021 08:01:42 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id b3so19623591wrj.5
        for <linux-media@vger.kernel.org>; Mon, 22 Feb 2021 08:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QRtZe5F4rcWmfwWd9LIizIuwy4ZDGtmk3+MGJLo2n50=;
        b=MCZ4RYMsz3gqpt48eeowhxge1xy4FOdHl4EUF4bxh0417qogrO2YOq9u5Dm8xiSdFL
         Dl7mT4hcfQUslPmP6Dn3d1G6ysI6w0DyCdvogm/iSiDuM8AP5haePj7oxxeKK7PEdPbV
         6Lw8qGYVuPpuA1pYw4iAv2eVXY+MSfEVWJgT1sFu6Fougk4uRKhSOnwJjGc8TQcb6Er4
         uuTCNzpKlc/4E/23RqaYuA1t7S2eVUDpPsZSFGUJC7NoTvUHVqqfbGc3fss41LN+rasa
         PSc5EZVgTcCWIops060q+BfWIxD/4SjXUQ50ME5mjCl0HbyEqAxBmMdb1nIf+EbT3Jy/
         sXZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QRtZe5F4rcWmfwWd9LIizIuwy4ZDGtmk3+MGJLo2n50=;
        b=ceKm8uF+Va/LfMTEj3oyVwQdPgMsI+4l9GW1SJB/VNGW5RXQBr4UgCBKgPVn4h8n2O
         ZNpYJmn80GkKeO/wNKJfXOKyOvk4UcoCKIVbkyF5gHf0ShV+vL85DEcwqDo7HE3H6+Dp
         PYTBSdxkrAbiyIwshy1SgiM6h6yfLlXEweuwYmqZW1lCHZ4jh93noWC6x47PMoVSaZLw
         HtcNCztxqeMTILNR6m9KEGBLEVaUsD5eAVkOYLFxPjFMSgKtizIuTDg7I2st0vbLX3q7
         Is6/YMxylln+N+AjGlpRxYrzQaokvT7bIWXCHy9v9AHGpoLqhLJPWfvoh/8UTfnLYLxm
         wg5w==
X-Gm-Message-State: AOAM530xQRE/WbndtCnonW+1U3OiTuedXl4aj7tB3wSiolT+LnVefRCw
        lhixgrRTZPpmK7CkWRePJgnUOQ==
X-Google-Smtp-Source: ABdhPJyQS2Aqw6U2elSOsSWSpGi/JmacLLIldhk6NqzLXjyg8OmC9EjFneZxSawuYua3QVw5b48xiQ==
X-Received: by 2002:a5d:6808:: with SMTP id w8mr19673741wru.290.1614009701092;
        Mon, 22 Feb 2021 08:01:41 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id c3sm7373697wrw.80.2021.02.22.08.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 08:01:40 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH 04/25] media: venus: core,pm: Vote for min clk freq during venus boot
Date:   Mon, 22 Feb 2021 16:02:39 +0000
Message-Id: <20210222160300.1811121-5-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
References: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dikshita Agarwal <dikshita@codeaurora.org>

Vote for min clk frequency for core clks during prepare and enable clocks
at boot sequence. Without this the controller clock runs at very low value
(9.6MHz) which is not sufficient to boot venus.

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/venus/pm_helpers.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index 4f5d42662963..767cb00d4b46 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -41,10 +41,24 @@ static int core_clks_get(struct venus_core *core)
 static int core_clks_enable(struct venus_core *core)
 {
 	const struct venus_resources *res = core->res;
+	const struct freq_tbl *freq_tbl = NULL;
+	unsigned int freq_tbl_size = 0;
+	unsigned long freq = 0;
 	unsigned int i;
 	int ret;
 
+	freq_tbl = core->res->freq_tbl;
+	freq_tbl_size = core->res->freq_tbl_size;
+	if (!freq_tbl)
+		return -EINVAL;
+
+	freq = freq_tbl[freq_tbl_size - 1].freq;
+
 	for (i = 0; i < res->clks_num; i++) {
+		ret = clk_set_rate(core->clks[i], freq);
+		if (ret)
+			goto err;
+
 		ret = clk_prepare_enable(core->clks[i]);
 		if (ret)
 			goto err;
-- 
2.29.2

