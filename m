Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 649B44666A8
	for <lists+linux-media@lfdr.de>; Thu,  2 Dec 2021 16:35:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359049AbhLBPjM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Dec 2021 10:39:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359052AbhLBPjL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Dec 2021 10:39:11 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA225C06174A
        for <linux-media@vger.kernel.org>; Thu,  2 Dec 2021 07:35:48 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id i5so60479028wrb.2
        for <linux-media@vger.kernel.org>; Thu, 02 Dec 2021 07:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g6xr95bY7KJM6r6ZUUp3Xp8tqiGSbIaSx1KljDmxxqw=;
        b=jpg1IFQNoGuLiwNilu1teXwIqs46pSv7okEiWpdb3d6dlVv74DcbMXq7iUzjWI5N/8
         v6TgoKkHqUQiTRXCuAMhjpYv4AA9pdthJjtOq6oPEU+ln1llpQXG3qvPNRbqEyWtARSM
         BtAqii29xJZQ0i6pe5ZT844wzJqu/bL71trNXgrzKhlDg2jC5/YTObp+EUbx0EnRlSJf
         x2lsin5SkNelEht8/2dyOs7AFAQlASKWRkcxS8dMSLzxaHpAMUEMEhUi+h5L6NW+p3JZ
         7der8u4jmyYiri1uDp00P/Nh+tc323QtZI78Vhm4OvPELjoeIu/fZYCTURFodk1EJ2+A
         NUPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g6xr95bY7KJM6r6ZUUp3Xp8tqiGSbIaSx1KljDmxxqw=;
        b=AHr2gQqGt3OiNNfMFyAR99aX0YoD2j75fhdn7LEow1z2mhcPii802OrNEZHh+cdBEY
         CqGboIV9JQpEl/F/sdF6DGCiQNnS+CnNzmFX2BrRVGWWlRR+7SwxEzfKcMxLbe4telZ/
         +icrQ1hpH+NU0R55UF7evc6bJc4uvHPhD6k6WWGO9ccTvtfOVjAGQXmla11No89Oll69
         9r2M/7LeQVg69lJSBg14bmUgNmugk0oCjnhZEi/s9A4mVeJ9HbGKAyc6TBOQvDfptSDn
         J8koO0Ak7JCoLH3OwFMr08gsr+XbybBmDHRUij1CiPPaUbljkp9MYZReNqJrd6CDUM8t
         +Eng==
X-Gm-Message-State: AOAM5334yKpWlBUPKYuqy1t9VLEa7GAHSUbBM5WLPjxHsq2zRCWyGNyl
        f/sLjWVEGjMw3tmaf1C9VdlQQtxw03Fa7nmp
X-Google-Smtp-Source: ABdhPJxHLDYXtr6gDEfcoYXSX1xnzvEqHNaFqR9bv3fUU9dtYUON0HWwLgG1IHoiI6gI2KSxp3xlqA==
X-Received: by 2002:adf:fb4f:: with SMTP id c15mr15436011wrs.507.1638459347389;
        Thu, 02 Dec 2021 07:35:47 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id bd18sm3662wmb.43.2021.12.02.07.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 07:35:47 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        robert.foss@linaro.org, jonathan@marek.ca
Cc:     andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        jgrahsl@snap.com, hfink@snap.com, bryan.odonoghue@linaro.org
Subject: [RESEND PATCH v2 06/19] media: camss: csid-170: don't enable unused irqs
Date:   Thu,  2 Dec 2021 15:37:16 +0000
Message-Id: <20211202153729.3362372-7-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211202153729.3362372-1-bryan.odonoghue@linaro.org>
References: <20211202153729.3362372-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jonathan Marek <jonathan@marek.ca>

csid_isr() only checks for the reset irq, so enabling any other irqs
doesn't make sense. The "RDI irq" comment is also wrong, the register
should be CSID_CSI2_RDIN_IRQ_MASK. Without this fix there may be an
excessive amount of irqs.

Fixes: eebe6d00e9bf ("media: camss: Add support for CSID hardware version Titan 170")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Tested-by: Julian Grahsl <jgrahsl@snap.com>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csid-170.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-170.c b/drivers/media/platform/qcom/camss/camss-csid-170.c
index aa65043c3303..a006c8dbceb1 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-170.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-170.c
@@ -444,12 +444,6 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 	val |= 1 << CSI2_RX_CFG1_MISR_EN;
 	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG1); // csi2_vc_mode_shift_val ?
 
-	/* error irqs start at BIT(11) */
-	writel_relaxed(~0u, csid->base + CSID_CSI2_RX_IRQ_MASK);
-
-	/* RDI irq */
-	writel_relaxed(~0u, csid->base + CSID_TOP_IRQ_MASK);
-
 	val = 1 << RDI_CTRL_HALT_CMD;
 	writel_relaxed(val, csid->base + CSID_RDI_CTRL(0));
 }
-- 
2.33.0

