Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B461845CB9C
	for <lists+linux-media@lfdr.de>; Wed, 24 Nov 2021 18:57:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350098AbhKXSAp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Nov 2021 13:00:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350059AbhKXSAo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Nov 2021 13:00:44 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB1D9C061574
        for <linux-media@vger.kernel.org>; Wed, 24 Nov 2021 09:57:33 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id c6-20020a05600c0ac600b0033c3aedd30aso2766942wmr.5
        for <linux-media@vger.kernel.org>; Wed, 24 Nov 2021 09:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tTRniNEPYmBqX+RzY8diZyg3SNhaKQj2teILOgUmFAs=;
        b=LDHnPvGYoKgaaGUIJ4Vfd81Y9ikJGHVQFDZd9cUjBYb8M58QzYsQ/WHpjD4lE4Wvw+
         L29Ef4ABBAJaiIY6Xz3rm8BvlBaGpa99KD1c9mtbexGQ3FlMXLZByASPukf6ibIwq1MJ
         cwL72UUhDpM3FT/wFrBkSSrl4BZ+CSRb8kVnLSCCQZJ7pAt9flSeFEEYFlxiwAsgTXGs
         1+HGKaceeE2kEsFqMB7hKL0e9UwUIjp6NBAJU5FhVAjlSCuVcMyTGcCuIFh2MU0diBZN
         8YiBS2eP+4RY42xB9RqReLZdR2i9Dq01/Q19EoWxufJ3QLqFu5sFtnjVmgqS6t7NwZ2R
         i8hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tTRniNEPYmBqX+RzY8diZyg3SNhaKQj2teILOgUmFAs=;
        b=NfbDnjFZDdiYjGMFuFy4A04Ncoq2Aa5mLjPuD5Yr8fTSGvNaJoaZ33zlNHuu+uyp1v
         uv7b+uuzbOAuvG8i78VDAGcWEldXGzHGK8oFyf4/Z5LRS8H6oOU55u5caGb0QghWzLaZ
         Lo1Y1MZxJUY8rR7R+/xvS75Mjkg0Wpo9KjmwOzbpxV/9XF7CnVo8PvB4/PMeHUFdAkcz
         VoxkKIXd/eH8yPLKQLrmLqyVif82WUGg4q636SNRzsArZCFCkD8rEvw1DnhGsZViuXMk
         /z6Q9VXSudSfXr8gKHC+4275mdCA9UM158/UXORqxlgB49o0NgxutPmulbB47JoxCtOm
         Qm1A==
X-Gm-Message-State: AOAM530S+BrsRbQiYxBt8dIWoTpUONeEAxbCKNem1VWpExtmbRTs0Qp1
        8Q5IlmV/KYHJBLX7Ant/wiqPlQ==
X-Google-Smtp-Source: ABdhPJynSLq98UfafS4jwCbp9bxeIqmXkapb152eF2j11X0tsl0zUiZIRLGmmR+qfE2AZc7GQHNXhQ==
X-Received: by 2002:a05:600c:1e87:: with SMTP id be7mr17418690wmb.182.1637776652586;
        Wed, 24 Nov 2021 09:57:32 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id s24sm380576wmj.26.2021.11.24.09.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 09:57:32 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        robert.foss@linaro.org, jonathan@marek.ca
Cc:     andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        jgrahsl@snap.com, hfink@snap.com, bryan.odonoghue@linaro.org
Subject: [PATCH v2 13/19] media: camss: vfe-170: fix "VFE halt timeout" error
Date:   Wed, 24 Nov 2021 17:59:15 +0000
Message-Id: <20211124175921.1048375-14-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211124175921.1048375-1-bryan.odonoghue@linaro.org>
References: <20211124175921.1048375-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jonathan Marek <jonathan@marek.ca>

This function waits for halt_complete but doesn't do anything to cause
it to complete, and always hits the "VFE halt timeout" error. Just delete
this code for now.

Fixes: 7319cdf189bb ("media: camss: Add support for VFE hardware version Titan 170")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Tested-by: Julian Grahsl <jgrahsl@snap.com>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe-170.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-170.c b/drivers/media/platform/qcom/camss/camss-vfe-170.c
index 5c083d70d495..af71dc659bb9 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-170.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-170.c
@@ -402,17 +402,7 @@ static irqreturn_t vfe_isr(int irq, void *dev)
  */
 static int vfe_halt(struct vfe_device *vfe)
 {
-	unsigned long time;
-
-	reinit_completion(&vfe->halt_complete);
-
-	time = wait_for_completion_timeout(&vfe->halt_complete,
-					   msecs_to_jiffies(VFE_HALT_TIMEOUT_MS));
-	if (!time) {
-		dev_err(vfe->camss->dev, "VFE halt timeout\n");
-		return -EIO;
-	}
-
+	/* rely on vfe_disable_output() to stop the VFE */
 	return 0;
 }
 
-- 
2.33.0

