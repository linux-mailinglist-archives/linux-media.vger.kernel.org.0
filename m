Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A4B745CB82
	for <lists+linux-media@lfdr.de>; Wed, 24 Nov 2021 18:57:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349930AbhKXSAe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Nov 2021 13:00:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349935AbhKXSAd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Nov 2021 13:00:33 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84131C061746
        for <linux-media@vger.kernel.org>; Wed, 24 Nov 2021 09:57:23 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id l16so5682961wrp.11
        for <linux-media@vger.kernel.org>; Wed, 24 Nov 2021 09:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LYQGqJMfgc7jR1a1+ImqZ0zlW3EDtsH9L040HbPLdGk=;
        b=FU6/vtEklw6VpiZ35aDYtBt884Ty+qZQSC6tO7bo+QvCAbZkWR/Nj8XYGA+G6wHr6o
         K61tpSnnPRp5jgzF6f8pkjN+vC/Fiu5+qsfEs0yqSqseZq7fCrAgZAPZTWVsG7JMWb33
         ifKr7M1HdADigrUK/HcFi1nl/LcdEbuJjAf4eJCkoJD15uMbnk11MIgCcGOBXDeF9/Xv
         SkEFtcF4MIijR9yzGPH9Ip6W4cuSek6Tsr8PwTFYuMGMLA7YAj78SlsVav6wqNxwOGl1
         nIE807qJzn4RSf4B5B+DAeHcAwhN3kJGyj7oc6Tz59kTx+baigDlEfVk9JxKMrxS/Gxg
         LO6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LYQGqJMfgc7jR1a1+ImqZ0zlW3EDtsH9L040HbPLdGk=;
        b=aAlaID/8lOY1CFV/8nJD3vkVBrU0p9ypFGoODwB57+dkC8+8aTY0GsJo8x5TRYiQuV
         fxNCS4DxLXGinR2x/3R6t8XzmwvViA+/Wf3DZ+ECvZ3XQFGwhG3i57NAeBmdvCskvVU6
         d9OAhBZ2mS+aJvIbIsIBTmfWIY/ActGAt8NLqqKySsifkewoJd52Nz0x3MD9utnVKPRg
         GSNn7cG7X9FlwxCWQ6JYYtTQ32xIdGVSPbagB2u/qLldD+Mr46IlVGtfDvic4oHcdy5x
         6oJBH8LsnF92vuXDMeRarncs9L7XzMzTjhMz4M+ABWqVXiF8Y5gka5qKgczqEPlQauxT
         6Ofw==
X-Gm-Message-State: AOAM533AcT/C2bVgsbGVa+rzOahjn0WCQCBQbhQHnXx/AgE/+9Nlm37i
        Okbii6Mjyn/zQ9sReINQzFcTlQ==
X-Google-Smtp-Source: ABdhPJyAc5/rtSwoDlYp/R2ZVovERcx7qz82eepxipouZia2XWKhSMOfpwnVSL+xri6qpIFgfdEDDA==
X-Received: by 2002:a5d:64af:: with SMTP id m15mr21925615wrp.267.1637776642160;
        Wed, 24 Nov 2021 09:57:22 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id s24sm380576wmj.26.2021.11.24.09.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 09:57:21 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        robert.foss@linaro.org, jonathan@marek.ca
Cc:     andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        jgrahsl@snap.com, hfink@snap.com, bryan.odonoghue@linaro.org
Subject: [PATCH v2 03/19] media: camss: csiphy-3ph: disable interrupts
Date:   Wed, 24 Nov 2021 17:59:05 +0000
Message-Id: <20211124175921.1048375-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211124175921.1048375-1-bryan.odonoghue@linaro.org>
References: <20211124175921.1048375-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jonathan Marek <jonathan@marek.ca>

The driver does nothing with the interrupts, so set the irq mask registers
to zero to avoid wasting CPU time for nothing.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Tested-by: Julian Grahsl <jgrahsl@snap.com>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../qcom/camss/camss-csiphy-3ph-1-0.c         | 35 ++-----------------
 1 file changed, 3 insertions(+), 32 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index 5948abdcd220..783b65295d20 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -352,38 +352,9 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
 	else if (csiphy->camss->version == CAMSS_845)
 		csiphy_gen2_config_lanes(csiphy, settle_cnt);
 
-	val = 0xff;
-	writel_relaxed(val, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(11));
-
-	val = 0xff;
-	writel_relaxed(val, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(12));
-
-	val = 0xfb;
-	writel_relaxed(val, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(13));
-
-	val = 0xff;
-	writel_relaxed(val, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(14));
-
-	val = 0x7f;
-	writel_relaxed(val, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(15));
-
-	val = 0xff;
-	writel_relaxed(val, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(16));
-
-	val = 0xff;
-	writel_relaxed(val, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(17));
-
-	val = 0xef;
-	writel_relaxed(val, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(18));
-
-	val = 0xff;
-	writel_relaxed(val, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(19));
-
-	val = 0xff;
-	writel_relaxed(val, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(20));
-
-	val = 0xff;
-	writel_relaxed(val, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(21));
+	/* IRQ_MASK registers - disable all interrupts */
+	for (i = 11; i < 22; i++)
+		writel_relaxed(0, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(i));
 }
 
 static void csiphy_lanes_disable(struct csiphy_device *csiphy,
-- 
2.33.0

