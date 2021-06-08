Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1E883A071E
	for <lists+linux-media@lfdr.de>; Wed,  9 Jun 2021 00:38:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235260AbhFHWkn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Jun 2021 18:40:43 -0400
Received: from mail-qv1-f53.google.com ([209.85.219.53]:39445 "EHLO
        mail-qv1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235258AbhFHWkl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Jun 2021 18:40:41 -0400
Received: by mail-qv1-f53.google.com with SMTP id u14so8861694qvq.6
        for <linux-media@vger.kernel.org>; Tue, 08 Jun 2021 15:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6eqeLtF2wYve+NaCkqrhAPj7GJ7t1Uc8cbMldYDNzmc=;
        b=Mv8h0zAZa85cNE9rseThVvwjyYB9knu4rn7uHCkg2DyvdR4N0DgMPfSC2MUZIYsKXq
         cwsYs8ghRN5iRdKbbAZQmYUAiu3UXsL4BY3APai3695aXktzGG5oQfiBGIbf9hgRvrmW
         8bnAlUTjlJXWUuvdx2cptBdIF5bbC1FqYf1xX3iHnONXVoqf8mZZjMtRt8eTQ941Duuu
         mv42q6l9VQHPJqewCJrXtPwf9tzC2UotMDKdaWLxCLiFPRhMVaVfqKx04WucLHRZfDxP
         TClns7nQ0HIREF6HZAqaRSkgPzzZZocB6Novk0/M+jD2A986HTM2cwjBlUax+mNw+4Ib
         kPkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6eqeLtF2wYve+NaCkqrhAPj7GJ7t1Uc8cbMldYDNzmc=;
        b=i0JB8FAzQ0dkD3dWQSHLPwCacP+HlrY9kgaJ+0b2yAboQnArM8ykSfPHG5HKUsFqCI
         VG+0cSFi4cjaSaYMxGnSXaFq30H1IZyuDsQgi2MpLG2KWU2lF6fi7X4jncA1ZrywKstQ
         0rmXwRH/nQt/LZvX/Yj0S8Q8LzzNjA79EuxWW8agJNse/Zo3yqO6AOB2gTGIf4itt9eq
         /6QtLBf2CCQtew/h2tQsr1hukyu4AadwVIqTWulawbS6YrkW+hyW/wU8PEusw0IKfv5f
         sVfrrXACZ+3HfbN5q9JxyIuE2R2iYQid+ePC/Vppb+IW7BjnvCcz1YrkxSBJPt2gDkiO
         Ys9w==
X-Gm-Message-State: AOAM531oBCR+IBqz7IdOS9ovVZ1idyBCur2BTaQ5GJ0dvW5Wz+EYvY+J
        1sBRC90Jr6Yvz2qVBtyRsNxJiQ==
X-Google-Smtp-Source: ABdhPJw1o4lhprHmGw2h3aqoKr10f1XTAfu6jpNt/PApK8tndgV3l+To+BXpyX2phwJl+Iz4K+IdJQ==
X-Received: by 2002:a0c:c3d1:: with SMTP id p17mr2654124qvi.44.1623191867886;
        Tue, 08 Jun 2021 15:37:47 -0700 (PDT)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id m3sm2324266qkh.135.2021.06.08.15.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 15:37:45 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     robert.foss@linaro.org, andrey.konovalov@linaro.org,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org (open list:QUALCOMM CAMERA SUBSYSTEM DRIVER),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 02/17] media: camss: csiphy-3ph: disable interrupts
Date:   Tue,  8 Jun 2021 18:34:51 -0400
Message-Id: <20210608223513.23193-3-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210608223513.23193-1-jonathan@marek.ca>
References: <20210608223513.23193-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The driver does nothing with the interrupts, so set the irq mask registers
to zero to avoid wasting CPU time for nothing.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
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
2.26.1

