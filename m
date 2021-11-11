Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD6DB44DA0C
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 17:13:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234146AbhKKQQn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 11:16:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232366AbhKKQQh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 11:16:37 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D361C0613F5
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 08:13:48 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id u18so10673437wrg.5
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 08:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JU6ZC1rc0HJA9g5C/1InrSe8aULa3IWvDzzDWlsrmmw=;
        b=JnyL8ythrw0cO6uoYK7CcLNjHS7AA+B946ROroRL25q+U24B5+lasvWVYkCUVg7Ky6
         O023gKCAZ3ciuMfVVJxtP/DaT1I7KDE684At4zMSBhOj05KoLaxm8HGy54IHwHDDVQAX
         qgzyxhd5ie9c2vPFnVpysfEgpWfeSdAXbIO52gOti5ITaUF+V7qxiPTz3mf5Q2fIAaav
         Ol6XHGokJBGgYe6YRheTiWpGxp2ln7QbZS/EN7cJIE5sEtDw3uK42h1r390AtIY5AfXV
         h0rPX83Q3bPE7YCSqWwe6B5DH9SxbcCCrsyvwUJJ49wpdgR8HJWG/bWFJY7HTe+BOyYG
         4aMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JU6ZC1rc0HJA9g5C/1InrSe8aULa3IWvDzzDWlsrmmw=;
        b=Edd2smVnjWjN0yKH7oVcp0Xn1BvvUHMT+b8oSolNZhrLqUMvss3VPXoh4S90wwraUM
         XD6HJdkanfAV6kcVbQ0yFmlSw1pA0RuyhfG4kUrT8iKCk4SqZzl5CDE1/Oa+hplHiZ24
         EjLr0526+tgyCpbvyFJcy2e2gvHzTa7mNzn6IpeLAaN9gIw31FsEGTB6BDrli9D9agy+
         Bty+ccjbu4ue3LdauS5bWYQM77+RVxrEabn8BBwUfa15pjQxdjB/QguIr/8m7uxYE6V2
         fwZKf78qRzkMcNODqkUd94hsx0Xu+NSj3/5n33BrcmoEtAZcCOSkBuVd/c3SRe3xxeNy
         AQkg==
X-Gm-Message-State: AOAM531p3z0hRzjAcWHezqL+8aQpIWZLT0a7KQ3DPUR7D1O2Ib2Pv1kn
        9BlsTJ15XjlYz8NUclRFguVnWw==
X-Google-Smtp-Source: ABdhPJxOBt/cTV+skLWg/CNvCsle7TCM17gcTxVwIl0xMS+eexKTj9DUD5JPX/nBc6WeMEzBkBqItw==
X-Received: by 2002:a5d:5504:: with SMTP id b4mr10337387wrv.307.1636647226973;
        Thu, 11 Nov 2021 08:13:46 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o1sm3441451wrn.63.2021.11.11.08.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 08:13:46 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        robert.foss@linaro.org, jonathan@marek.ca
Cc:     andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        jgrahsl@snap.com, hfink@snap.com, bryan.odonoghue@linaro.org
Subject: [RESEND PATCH 03/18] media: camss: csiphy-3ph: disable interrupts
Date:   Thu, 11 Nov 2021 16:15:27 +0000
Message-Id: <20211111161542.3936425-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211111161542.3936425-1-bryan.odonoghue@linaro.org>
References: <20211111161542.3936425-1-bryan.odonoghue@linaro.org>
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

