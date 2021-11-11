Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA2ED44DA0B
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 17:13:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234154AbhKKQQn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 11:16:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234046AbhKKQQl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 11:16:41 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C44EC061766
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 08:13:52 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id n29so10639092wra.11
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 08:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JF8mIvoDAsxSnmP+NdQda6sFEDZocL02qsRCIqAV6U4=;
        b=j3z92wZLapDo7GFjriG+kgY6B6ZzBHu81byvGDDaejKJpTcZvsvpP+ENuU9eUZXyIy
         EZ9G0ao+sy+cM6gfnmWQF2vea5f0P66Y6v8grqmzFx8kTNWyeCy9qughtkX99cS8ah0k
         SsGTc4JnS4P+5GCV70TJn5fi+Vntw8p4bcto0dBqfpJBdALUsi9zRhlP2GuW/nKIvppV
         7bq/Ye7F0Y6GKaUfnctGd/t3SJPtmkV0qt854wT1o+3EzskVCzx3bHz7XXQ45FOBpBUh
         vVG8lkmyq2J2SHF96wkTYi0OOeOGU+n21eUrUB2gnw2GHmG7FHBllJHWwR6c47rChTWY
         R9Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JF8mIvoDAsxSnmP+NdQda6sFEDZocL02qsRCIqAV6U4=;
        b=FVR1/vUDOet99UbhPb7++xqSDK/xxajHuXK0EuUcNjUy4Y0v/Ngc+uVefs3tCn+FaC
         +Wne6oq9RpI6pcKvoPFCWLnpC3PdS3CCsM4WnmIQoJGQ/swOHsBZW4nHvFDn/YoaussQ
         PtzcQU2TTK6gNC2SmLshvbaIIhJw97d4c5P1s51xYioMXQEBlYpK/tOj43Y0F/KeF5Aq
         qr0yRkXcsBGzk26cUepP9gAz9XvpgxidvUDdbx1imgwvGGIBE8AF3LpgWUsiU04qhWVm
         IMGQ4fV5Ksd9VBnNrlbhnOVBPjkB6xSg2pK2M2VMWjDBJ2HOYe74PKxOVZmKFQftuazQ
         9srA==
X-Gm-Message-State: AOAM5337H+5WyovR86K6E3wIxjM8StyGbLq5mUTjYWaEKf6vDBdUcJCr
        fspdsF3OfmZjp4A88lxIgaOfLA==
X-Google-Smtp-Source: ABdhPJya+XFNAvXnXrCy4n+MI0pG6qStoSAahpin+UbrlFO0N1mBQZtMAEgM0H9D8USkzL+GqgJRrg==
X-Received: by 2002:a5d:64eb:: with SMTP id g11mr10256059wri.438.1636647230794;
        Thu, 11 Nov 2021 08:13:50 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o1sm3441451wrn.63.2021.11.11.08.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 08:13:50 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        robert.foss@linaro.org, jonathan@marek.ca
Cc:     andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        jgrahsl@snap.com, hfink@snap.com, bryan.odonoghue@linaro.org
Subject: [RESEND PATCH 06/18] media: camss: csid-170: don't enable unused irqs
Date:   Thu, 11 Nov 2021 16:15:30 +0000
Message-Id: <20211111161542.3936425-7-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211111161542.3936425-1-bryan.odonoghue@linaro.org>
References: <20211111161542.3936425-1-bryan.odonoghue@linaro.org>
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

