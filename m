Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D14347CA4E
	for <lists+linux-media@lfdr.de>; Wed, 22 Dec 2021 01:35:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239626AbhLVAfv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Dec 2021 19:35:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239557AbhLVAfu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Dec 2021 19:35:50 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36128C061574
        for <linux-media@vger.kernel.org>; Tue, 21 Dec 2021 16:35:50 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id n14-20020a7bcbce000000b00332f4abf43fso1733979wmi.0
        for <linux-media@vger.kernel.org>; Tue, 21 Dec 2021 16:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aCn2AUBf+s4jY/6QkYpdOWBiS0aWpq/nnEFl+kmOZ6w=;
        b=KtYVbbf6yElUHr9DwyQmSWVnWcRdQPhYlopqPNqShRjkTrlIq6XqsPZCWdEvLUxo/C
         x5W8t7WhiUGtAVNesl7hnO9oLiCiZ7yABZIR7jIhGl3cSg0e6qH95mj1JFhQfYO2GwfB
         V1o2RLytaQ8dp/KII0m+BXMHGwoPWuQG11UkneSy7sCUzrh//hnQNIoA0i8Vtt1Rg1uD
         JqtHZnD4SsYqlEmJlCTAPHcicBfRgOOFf3DgowPO0BzDZmwDNpMdIAfkIYzUTvwbdhnv
         lbKAtyGRek6CSb2jhF03VMlEppV5GccWx85mBkrUwTJPSlyG5HV/SOmsLCnYa2uA7fsP
         8IqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aCn2AUBf+s4jY/6QkYpdOWBiS0aWpq/nnEFl+kmOZ6w=;
        b=LgjgyHTr82dEZGtyiKkHVUDRiS1sObdn+BFTsKZA0B2unfdgghAD10Lyb7vigGEMiA
         9sQiMsmm0eYcjzhZDbAJwjZcoU02b8kFr8RnUcQy1/SIN/d1JWtIHXOUQACgte+KddpS
         Xms0Z/BFWS8vOF4Gw6djqFQ8KZ8PqdDKxv2vuk2NYngGWS9kcj80p3Il2iUFO1coIGBF
         OwzeYP1TGhcVZE8pYlBq8ste8N1BdKjru51T8oHP5T0vMcadDFIn3zb1Vf8coDEJ3UWS
         dmWnaDZ9gXRtzNEU325VydWKwZ1E8heDaVpWSqjtl+jgiUyMWqXZelJGjn7JAbodIv7y
         +6GA==
X-Gm-Message-State: AOAM533M8AI0m+wC4sNKCURAbEwnpKnzlpCPAKeYeVZV3dumpXRsSr6y
        sSBv4+PZ7i3AFnnTPf3/ci6B1g==
X-Google-Smtp-Source: ABdhPJxZhxI+jcdPrQ2s8dolyyTSY1KfK1+qE2zjnz63UM6BC8Wx0DyqGh62jCT/08VHfwdi5KafnA==
X-Received: by 2002:a1c:1bd8:: with SMTP id b207mr632991wmb.114.1640133348857;
        Tue, 21 Dec 2021 16:35:48 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id n7sm282825wms.45.2021.12.21.16.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 16:35:48 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, hverkuil@xs4all.nl, robert.foss@linaro.org
Cc:     jonathan@marek.ca, andrey.konovalov@linaro.org,
        todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        jgrahsl@snap.com, hfink@snap.com, vladimir.zapolskiy@linaro.org,
        dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org
Subject: [PATCH v3 03/19] media: camss: csiphy-3ph: disable interrupts
Date:   Wed, 22 Dec 2021 00:37:35 +0000
Message-Id: <20211222003751.2461466-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211222003751.2461466-1-bryan.odonoghue@linaro.org>
References: <20211222003751.2461466-1-bryan.odonoghue@linaro.org>
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
index 5948abdcd2206..783b65295d20b 100644
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

