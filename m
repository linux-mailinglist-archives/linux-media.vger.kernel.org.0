Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E23D544D9E0
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 17:08:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234112AbhKKQLg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 11:11:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234080AbhKKQLe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 11:11:34 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA5A3C061766
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 08:08:44 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id n33-20020a05600c502100b0032fb900951eso2378660wmr.4
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 08:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JU6ZC1rc0HJA9g5C/1InrSe8aULa3IWvDzzDWlsrmmw=;
        b=H6kk1zCjQwso/KHGaq5AdF6ob613NoiUNNN2OC+6me6EQDUOelivXZgW5cd0kQG3Hy
         udNpkuGe1EDmLVwRmhuRrukkKO6CyTUuXXUPh4+i4LfWbE1HGJTjtnHMmB7H1sXPEhPE
         tqNrxvl1y2p3jUfH8mzJdFzcEOOYgirSV2r5r+bcet0JlwjLp0cK4oM0AMUz8trF0vkS
         IjwRohAxYddp68iyQgroo5km+FSk7pJK4mcjfyijsgZa1EN8fOBlDTTJlMj0LSwI5xsI
         iPaJ9hOqP0Pb+5x/3sr4eBbbROeqBiwghuxDwFaXSxXta1MxkqJ8l2sd/rlKyDjwxf3k
         BmIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JU6ZC1rc0HJA9g5C/1InrSe8aULa3IWvDzzDWlsrmmw=;
        b=NE/NlwnljVOZHfCl7FDpL3Q7o4wicKrLoPEQKI9lNzFHKOyzxzLF1MlrpAtc7Azeub
         bbnBXnankLimQ2ykRjUDGHGsaTgXgofkI/m7viIY2l1gpoHfm38cKd0uh4RqONRjNk3r
         cJTDJkNuzmyQxY+bFUICUpB55kCpp0rk7K1+Y2S7hW9hgO19kjGn6KM9CmyV3rutEA2Y
         ME2dEVuPWl54N1XkTEgfjTiAHFXdUcns45GsxkmvAycXAyryx5n9RBcftENmCZEyn+gP
         hzqxew1SzdHyx2MeJ/KMpoww2U674isYgmVUKHKF8WG/E84h+hvb1snSq7YT2NuRbJVp
         fXRQ==
X-Gm-Message-State: AOAM531lLb5o4NUXTBcAjJqpawYVm3+JCXzYvaaBIYT61K56IS/i/Ske
        W0+FmSp6wPeOKnHJRParc73XEg==
X-Google-Smtp-Source: ABdhPJxsZxEWEheOJNdrlDV+0hfgovG6E8+VEue+B7hUkqp1rGoFhiDxCjvE/exyS8oe4ppk7H/O/A==
X-Received: by 2002:a1c:1f94:: with SMTP id f142mr27450135wmf.192.1636646923344;
        Thu, 11 Nov 2021 08:08:43 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id x8sm3245558wrw.6.2021.11.11.08.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 08:08:42 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     inux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        robert.foss@linaro.org, jonathan@marek.ca
Cc:     andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        jgrahsl@snap.com, hfink@snap.com, bryan.odonoghue@linaro.org
Subject: [PATCH 03/18] media: camss: csiphy-3ph: disable interrupts
Date:   Thu, 11 Nov 2021 16:10:23 +0000
Message-Id: <20211111161038.3936217-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211111161038.3936217-1-bryan.odonoghue@linaro.org>
References: <20211111161038.3936217-1-bryan.odonoghue@linaro.org>
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

