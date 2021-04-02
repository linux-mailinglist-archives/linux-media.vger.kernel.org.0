Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6C9D352972
	for <lists+linux-media@lfdr.de>; Fri,  2 Apr 2021 12:06:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235096AbhDBKFp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Apr 2021 06:05:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234991AbhDBKFk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Apr 2021 06:05:40 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6C8DC061793
        for <linux-media@vger.kernel.org>; Fri,  2 Apr 2021 03:05:37 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id j7so4326042wrd.1
        for <linux-media@vger.kernel.org>; Fri, 02 Apr 2021 03:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sqmzV4pfroiyXv7Okp+NwIqGaoKA31AvZjPcny2idug=;
        b=a1rbYVvsr4kkCLsIMttVKIs27enfxZtgtCHerxFRah3TqGm5M+0p+s7VqS11dTF3jr
         XqX5K9Coy0t+sYRWGOtSWu1pMbjUZoUjxn7y5WlUd8MxhHv8fr/gE8CATt5jv3p3w7KO
         PjB888lM5POJ3/xQeuBi7xAxOPoImaswhfyJF5xKrM4+KbWfDehwJpdJlJx7qDbqwq6E
         txCcODVnCKBorbeDOd52iN0f664mYluYuPbtiHrQVhXVlppmMghSmYpz0nkigQyVY8zQ
         gZl1me+SfueMuIgG0r55jQUJiRRJC4SC8xHp7lb4bj9xhCpNksjUJZxWC0taKtm1SSfV
         5+Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sqmzV4pfroiyXv7Okp+NwIqGaoKA31AvZjPcny2idug=;
        b=UvDhh+h4Og357UdaBU7E5Y0ykFW7RRGWK8QZ7+v2gCT5qroCntkHVGTTE62YrJKfJI
         TaJpx/J5EMc3zFBH1Fpk+Qyow5lixXpkwLvEHTM+c0gb8DwlmZmfS+YhGIFRz5cydUVx
         RTVMdxHgQ6XQi2/aNDRiO9XrKHSVFgJKyJIf3wxWSSuNjkQXL32C6ELemH7Z36NlRqZi
         iBP8u84/Nc6tIVyzHPdke+Mp1naR+BLzYUhn0YDufPFy/4f8os8oFikbHYRxE2aRGdln
         8VS+9mWiH5d4gV6EgjZZgliEvj9s0YuZ7g/9RQYpopTwszfNwEhVG3y+8PxnNS9bkRWn
         8wOg==
X-Gm-Message-State: AOAM533DqydmopbFtha5FbOG5XUT87cBrgHNJpDcEmXlieQ7/mVTlt4Q
        w3LOzukz7HJXR1meNij3CL43Mg==
X-Google-Smtp-Source: ABdhPJyciE2ETBUppny+Wgh6hx4d+6JpS51NodIK6O41Y/rhISaIrSSOf9tVQbf9EQnc37YezH0aPA==
X-Received: by 2002:a05:6000:1281:: with SMTP id f1mr14577666wrx.243.1617357936357;
        Fri, 02 Apr 2021 03:05:36 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id v18sm15466618wrf.41.2021.04.02.03.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 03:05:35 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH v3 19/25] media: venus: pm: Toggle 6xx wrapper power in vcodec_control
Date:   Fri,  2 Apr 2021 11:06:42 +0100
Message-Id: <20210402100648.1815854-20-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210402100648.1815854-1-bryan.odonoghue@linaro.org>
References: <20210402100648.1815854-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dikshita Agarwal <dikshita@codeaurora.org>

When in vcodec_control_v4() on the 4xx path we select between one of two
vcodec cores to toggle power control bits. In 6xx there is only one core
which offsets the relevant control registers to a slightly different
address.

This patch accounts for the address offset for 6xx silicon.

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
Co-developed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/pm_helpers.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index a91dc24de2a4..dfe3ee84eeb6 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -414,7 +414,10 @@ static int vcodec_control_v4(struct venus_core *core, u32 coreid, bool enable)
 	u32 val;
 	int ret;
 
-	if (coreid == VIDC_CORE_ID_1) {
+	if (IS_V6(core)) {
+		ctrl = core->wrapper_base + WRAPPER_CORE_POWER_CONTROL_V6;
+		stat = core->wrapper_base + WRAPPER_CORE_POWER_STATUS_V6;
+	} else if (coreid == VIDC_CORE_ID_1) {
 		ctrl = core->wrapper_base + WRAPPER_VCODEC0_MMCC_POWER_CONTROL;
 		stat = core->wrapper_base + WRAPPER_VCODEC0_MMCC_POWER_STATUS;
 	} else {
-- 
2.30.1

