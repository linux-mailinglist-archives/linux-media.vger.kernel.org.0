Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 994B744D9DF
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 17:08:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234107AbhKKQLe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 11:11:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234070AbhKKQLd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 11:11:33 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86D15C061766
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 08:08:43 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id r8so10601000wra.7
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 08:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1PWkyNb/J7PSvmzSJf3q7YbRaxnCHfwxjvvPonD7/JE=;
        b=tH09p8G53jCVjhfNl2czCPmF1Hhh+iurxBjPnuECtYVa79aGahnd9ZCDj6+y+Srhvx
         FJkoEtPz9NDx2ET/wgXKv07uW+OKhHk4HxceYXzr/P2LO3pUa4VudGnzsXQ/fl7mEi2A
         G4QY77PXAA5qX4rGXKVSvUjSNxiwMUbhveb3qTAhhgINzKhbrplhv8b/zW6ctq4hpc78
         /fKE8K1MfowXBx155/h2DNcqn2k/0yYiDT97pIiwlbRKf1nnbeDbEYeHyCfO4qQkXxmx
         DdGuEyTqQBWxblfxOGYyLMTWClVqFNZnOZqvqnh+IveUorORlUjOBxJXwDig67O8NPKt
         lm3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1PWkyNb/J7PSvmzSJf3q7YbRaxnCHfwxjvvPonD7/JE=;
        b=NnBC757665QEwYwBaS+8cvhpDfmAk9R5PNLpOvI+kJXDpsRP6/dr2kKj3k2J79zISq
         VjmPPJYo0Iw2yooS8RU+LmsBnOaWEAUe1G54yLVOWJ1V7WI+05+T/hQgOSwP0i2j0s2S
         ev9HlAh0kLlHk7O+yfWB+Q30OL0XjVGWOuO+5giY/E6kHyG94wWjEolPDzN1VXvs8cWI
         lr4vFjmSnR0f7SV5fwAyZt4YOxTplbbLbLVOXPw6Tgjyb0AkqETCCzfseb3HwcvAc98f
         hw+4DOiwZklvbK7sScds9JBCby1+SbxTXSXxiVoLBlOw8OyRhzfRaQX3UN8sGTYlkv5e
         BgSw==
X-Gm-Message-State: AOAM532mhBNs0G8PS0ZVEa/USLotzSCaDsEFOUWz6PjHN6R0KOmZkmuM
        JW5osLHNEcEeDo+MahboSmkYSw==
X-Google-Smtp-Source: ABdhPJzNc0UGFxu3fproO8ibRvmvlIBw9fSaomrJeLSF2oNSuFo2vYRt4mbgzGK2qNXVKtsmbGIHBQ==
X-Received: by 2002:a5d:4b45:: with SMTP id w5mr9839402wrs.272.1636646921992;
        Thu, 11 Nov 2021 08:08:41 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id x8sm3245558wrw.6.2021.11.11.08.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 08:08:41 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     inux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        robert.foss@linaro.org, jonathan@marek.ca
Cc:     andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        jgrahsl@snap.com, hfink@snap.com, bryan.odonoghue@linaro.org
Subject: [PATCH 02/18] media: camss: csiphy-3ph: don't print HW version as an error
Date:   Thu, 11 Nov 2021 16:10:22 +0000
Message-Id: <20211111161038.3936217-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211111161038.3936217-1-bryan.odonoghue@linaro.org>
References: <20211111161038.3936217-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jonathan Marek <jonathan@marek.ca>

Avoid unnecessary noise in normal usage (it prints every time CSIPHY is
powered on).

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index e318c822ab04..5948abdcd220 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -163,7 +163,7 @@ static void csiphy_hw_version_read(struct csiphy_device *csiphy,
 	hw_version |= readl_relaxed(csiphy->base +
 				   CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(15)) << 24;
 
-	dev_err(dev, "CSIPHY 3PH HW Version = 0x%08x\n", hw_version);
+	dev_dbg(dev, "CSIPHY 3PH HW Version = 0x%08x\n", hw_version);
 }
 
 /*
-- 
2.33.0

