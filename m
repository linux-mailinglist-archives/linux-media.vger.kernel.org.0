Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D03B44D9E5
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 17:08:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234155AbhKKQLl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 11:11:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234070AbhKKQLj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 11:11:39 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B95F6C061767
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 08:08:49 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id 133so5544233wme.0
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 08:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IyMrNXHfU3PNeHdy/Ty0GQWf3Y3SgjyTb8SHPxxX41A=;
        b=AIGxIWinUoItGXCaKxbu9Vmc787otq6iyaok8KM1j/3hYHEhtFH0Vm7eje4P3SAAXu
         hxTL3LJDovhseDnnms3zdRYRRrsPt3J4k89KNqnP8e0b9HeNTvWbxigRtvQiOuN7hKky
         F9BDz/6bKszlENphyf4B86Pp+eSMmMulUhg79J4tf3Qq/oiIOhZyrs3Xeyes8jO7X+Vd
         /0X0t2XIqyUapkA8R1OdXgdnPRHaixzU0LjpGNS2+XyIYnV3yPjqSbFDUo5y0WuNS+1Q
         0ffYdFuFjHC1H0ZLxE8+i9iDSQpsZ1FEZDUyuNTmTwGEKtdVqC96LTBGdjDS3TEjkAm0
         wnOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IyMrNXHfU3PNeHdy/Ty0GQWf3Y3SgjyTb8SHPxxX41A=;
        b=S2l55Z281UUeZCJAuZ9WUPLZT7zyU6tViErTmiVKoTIauUu3SLA7HVRCN/nRIUVb1v
         o/+4FDvImo3nyhf51uxXmar3wPs7UFXm8eMjOFR3CAGphVGiVrJ4UMkoC7jLqzqqQVAj
         F0aQnxbmybEnhpk9LnzzV/7H+UtdoGEePwk++uW0rcrs1TEZFd8ABmhgH1D64/X3s8T0
         AlEmjOl8x0j4gjAVtCd5gdKnBy/M+PIPDDZse78JRVTfunIK3I9uiPE6UxGXazSnH9l8
         tOaUVsbbEPgzUHHxKVmNW6rHqeum3yQylfKY8bio5xWI148pTyqNrYH97EOgNnnFYzFO
         pgsQ==
X-Gm-Message-State: AOAM533lvNFDd/oEfGfeLuCY9294o6v73hf3ZwzFk7OkFg5Vnd29GU/p
        Dfs863pHdkosivFJW/E9ki8EeQ==
X-Google-Smtp-Source: ABdhPJwEsDRb7zijqJjZJjEo1WFdTlxVHmNa2FbidAZ8oZPRNqdPEKbI4wVF3iTuWIuOhWsNIy/+tg==
X-Received: by 2002:a05:600c:2246:: with SMTP id a6mr26298678wmm.5.1636646928329;
        Thu, 11 Nov 2021 08:08:48 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id x8sm3245558wrw.6.2021.11.11.08.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 08:08:47 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     inux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        robert.foss@linaro.org, jonathan@marek.ca
Cc:     andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        jgrahsl@snap.com, hfink@snap.com, bryan.odonoghue@linaro.org
Subject: [PATCH 07/18] media: camss: csid-170: remove stray comment
Date:   Thu, 11 Nov 2021 16:10:27 +0000
Message-Id: <20211111161038.3936217-8-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211111161038.3936217-1-bryan.odonoghue@linaro.org>
References: <20211111161038.3936217-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jonathan Marek <jonathan@marek.ca>

This is a leftover from my original patches, it doesn't serve any purpose.
(it was a reminder to figure out how downstream sets a particular field in
the register).

Fixes: eebe6d00e9bf ("media: camss: Add support for CSID hardware version Titan 170")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csid-170.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-170.c b/drivers/media/platform/qcom/camss/camss-csid-170.c
index a006c8dbceb1..f0c6a72592f9 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-170.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-170.c
@@ -442,7 +442,7 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 
 	val = 1 << CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN;
 	val |= 1 << CSI2_RX_CFG1_MISR_EN;
-	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG1); // csi2_vc_mode_shift_val ?
+	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG1);
 
 	val = 1 << RDI_CTRL_HALT_CMD;
 	writel_relaxed(val, csid->base + CSID_RDI_CTRL(0));
-- 
2.33.0

