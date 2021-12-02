Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B6ED4666B9
	for <lists+linux-media@lfdr.de>; Thu,  2 Dec 2021 16:36:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359081AbhLBPjU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Dec 2021 10:39:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359074AbhLBPjT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Dec 2021 10:39:19 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E3B1C061757
        for <linux-media@vger.kernel.org>; Thu,  2 Dec 2021 07:35:56 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id j140-20020a1c2392000000b003399ae48f58so2625762wmj.5
        for <linux-media@vger.kernel.org>; Thu, 02 Dec 2021 07:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tTRniNEPYmBqX+RzY8diZyg3SNhaKQj2teILOgUmFAs=;
        b=CivMWtr7KwaCmc+8k4tGJ3UJmtXhp2zR8gG/MM3FYYtuxaLNt9zbe26OCIlyLepU29
         eqOsAoDHDQM9piaxbYM4rFC56rFqnVmMxGYbpy6YyRX+/oA+0S6jAVbElEaK5NxhMXXJ
         U9LtQhCUZI7UgterA5GshvSmR43mN4vB+NtjLsQXVnaGvzW403fFjS7BUUFlfivPMFVf
         VR4jBYH0dOYHapH2pgMpPtSvrGBSuMVRzNtatMv3INbS4ZqRCxaXywz6PUyeIAI2d0zO
         dtsvz44ASUiP2Lt2Vrw8fKj3gRIWXVquN2FW4q1uomcV0/oT26WrfqEOcvtXW/TEEriQ
         Igzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tTRniNEPYmBqX+RzY8diZyg3SNhaKQj2teILOgUmFAs=;
        b=xYE9Uz4VQZm2CG29xtomD9RdY+PmaJxiU3sRlO/2Y/QfiIqZ6gJqEATl395o7g+ZaG
         ieBC52WmHfWs03eh8zckW2wDg9GGkYstVt9jBFxmCKwYVIgCBvty99PCvsiXbMczYMa/
         YFnXKoEu2PLO4bj50RjeMcAnbckpebh62/sThOjCUd9z5ct5Alinh0rT2eroIU9JeTYf
         JEmB0HixI3HUjvKklZI7VFXY31iBUG/to1JVQK07wCqDEKCv0Lwjv4kvGR0B9NnqHHEJ
         uNIBP9cH67bDO9qb8d287Ce/gT0psbd4ejz94EYy6Yo2h7DZWdb5ksfeNWqysvi4qvvd
         bSjA==
X-Gm-Message-State: AOAM530PSRe6lpEUg51FJp1G3yT8Yz3x52V+8yD7ESN28YTY+k8yJvET
        +HhOf7BCxBQ97cPYNrSSKV5K/JnisjRkW9Uu
X-Google-Smtp-Source: ABdhPJxJFQlMOWafCwpeGdQjm8B78cvLopyfQMh2Tz+3/9qh3FvBd2wIdHyb4P9TEepVCVrRsbqe7Q==
X-Received: by 2002:a7b:c256:: with SMTP id b22mr7184832wmj.176.1638459355100;
        Thu, 02 Dec 2021 07:35:55 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id bd18sm3662wmb.43.2021.12.02.07.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 07:35:54 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        robert.foss@linaro.org, jonathan@marek.ca
Cc:     andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        jgrahsl@snap.com, hfink@snap.com, bryan.odonoghue@linaro.org
Subject: [RESEND PATCH v2 13/19] media: camss: vfe-170: fix "VFE halt timeout" error
Date:   Thu,  2 Dec 2021 15:37:23 +0000
Message-Id: <20211202153729.3362372-14-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211202153729.3362372-1-bryan.odonoghue@linaro.org>
References: <20211202153729.3362372-1-bryan.odonoghue@linaro.org>
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

