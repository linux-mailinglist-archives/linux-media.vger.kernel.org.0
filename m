Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A42EE44D9E4
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 17:08:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234128AbhKKQLk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 11:11:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234127AbhKKQLh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 11:11:37 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90CF6C0613F5
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 08:08:48 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id d27so10638031wrb.6
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 08:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JF8mIvoDAsxSnmP+NdQda6sFEDZocL02qsRCIqAV6U4=;
        b=TmARl4p367rOXlq9v9oAOOOjlGwIrfRUClHsNTlPxpxN0hGYvnEsspsjevVCimdS8F
         gmDsLcK3L1+aHrBuN0Q3yjYHwVbAh8/HOmP0k2yRom4uYxBvM/AAKLlV4VQy9bykDcd/
         gdAp6E1+GFw04BenvoV6aRZRvpFM43524XS02Myb7ab/q5mCaTio/OKW29ikPAm59Gyi
         Cr9Hme0KiqsQyReakK1v8gNTxzmnpLrttuVEzkiygClAtKuhfAFZFQqDOmZ4StQrMEoP
         FuSwUfd3C6aBNDqHOjdpkpCiHBbqzTzP4PzArPlLgZS3E3Aoud5NDAujDs2AB2aOV0o0
         AcMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JF8mIvoDAsxSnmP+NdQda6sFEDZocL02qsRCIqAV6U4=;
        b=QBfspXI0mNyXHLt5BIFkzCcodFsiJ5T6cCZDFgd8PkBJPYIiF6H6By3/KRBGdlnkys
         VXtZXrEg+lELg8ibZMfiYAnd/wGfA76A9RJe5TPTA1AW72kOr0+LtYx+nasEWo9wMIEa
         /kytI7tVg9IY+2tEKiD25T6wDmtPs8rhtH7eY9KoJJKBvThDj/MviLXVm/EEj+rwjg+0
         p+WkorE5fKUeRzBo5ZC448S47+kALnuR1e3GeapyUbf1an+5UHt3Am3dhu14ExAmWXVC
         nbcfpxiwM6BQAap/Zn1co54GSUn4ssBf6NIdUdngPl9cZ3m8hIxOT+b6bobr8ntbb7F1
         BwWQ==
X-Gm-Message-State: AOAM533S2wZkdFitnWAqC2o4cnoiT6Fy0uNohMzYz6gaej0Dcxe9CAVt
        hPYLWNKqIx6cr99V353BNt8tsA==
X-Google-Smtp-Source: ABdhPJwc0RNgan054X4pRiJ2u92d9CKxJElW5UuPYbjBp0iSABy+sKb/rDMxVCGtYR4tvsgXJNRSaA==
X-Received: by 2002:adf:e810:: with SMTP id o16mr10040641wrm.359.1636646927113;
        Thu, 11 Nov 2021 08:08:47 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id x8sm3245558wrw.6.2021.11.11.08.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 08:08:46 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     inux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        robert.foss@linaro.org, jonathan@marek.ca
Cc:     andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        jgrahsl@snap.com, hfink@snap.com, bryan.odonoghue@linaro.org
Subject: [PATCH 06/18] media: camss: csid-170: don't enable unused irqs
Date:   Thu, 11 Nov 2021 16:10:26 +0000
Message-Id: <20211111161038.3936217-7-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211111161038.3936217-1-bryan.odonoghue@linaro.org>
References: <20211111161038.3936217-1-bryan.odonoghue@linaro.org>
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

