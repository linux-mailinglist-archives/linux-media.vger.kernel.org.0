Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D98E4666B2
	for <lists+linux-media@lfdr.de>; Thu,  2 Dec 2021 16:36:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359070AbhLBPjR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Dec 2021 10:39:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359068AbhLBPjP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Dec 2021 10:39:15 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25B96C06174A
        for <linux-media@vger.kernel.org>; Thu,  2 Dec 2021 07:35:53 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id d24so60590344wra.0
        for <linux-media@vger.kernel.org>; Thu, 02 Dec 2021 07:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nltQSFm14iSoAMbvdkFyYA24qQ389OopP2NKU0dRRk4=;
        b=zwl5Ep3jlqggtOD2HbIQx5FL9JDlZXvVZfMQtiUsvzw+jQHf4jUhqfRGof5MBzqy1b
         GTyA8IU9zUaVOt6oz1D8PB350U+QAsQos6yNS/eZU6tRWQ+WcL6l/2utn1YKccQLcz5N
         c1Iop26GQCT7FsWFY0IGjP9yDEQUJV6oHBMfprl+TE3eZYfImR8Od1xHlcA6+ReUvW4B
         1a3Yr6CNMC3TD5JiEjEKFyAy+lVdTFGJ2x0uGkWyoUYWlvh10PCBjxF8ssLJ+yIfsTYd
         FyOmti1/NlmWNdYOOwAX/FGls0Jv1LI7zvUf8dSFUENPTwLj3JqQbG0ZuLMNQ/a0hTUw
         XcTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nltQSFm14iSoAMbvdkFyYA24qQ389OopP2NKU0dRRk4=;
        b=NZkzNcVcx/UXNwwEHuNbzkGGKw36bmJLtb+czQEo/HPnR3SXI7nBtU6pJjkAHEXuEa
         nbiO2LEaCXs6Rl/bwqNAU9YzpjAxgnElV+tr9Q81wqPNMtQdHVW/qTZ7ei1Uvej/zUFI
         2ReRNlyCg9agoAWHg8X/apORM3I7gihA48TMOchbFwGR/sbJDTlDgKqVMG4KPzjjKxB5
         87PFIAfhHt18yZvPPBEtWCqCXpPIP2sakSMEr/dIzWRkSc6uOaBg4o+9rNPLvVE4OmPF
         9dP8XEpYS6emplg6/MMG4A8P/H/ZEqqaviY2xTWQpJFlo6UDq8aIVCjia6tbLuMsV6Na
         MkmA==
X-Gm-Message-State: AOAM533F19UmyYbH89pfX7B5y5w0bpX9U0ek8bYy+ScOU3B9Tu29hrw/
        SdVI1NLGwvIeda6bZS0YlAKX7g==
X-Google-Smtp-Source: ABdhPJyylTxFMNTBGC+X2JZhW8gOkej7tFVAn4lrLaHytTcldSH40AOSBiTkYLrs5VK7NAG8ZF1gKg==
X-Received: by 2002:a5d:468f:: with SMTP id u15mr15066154wrq.171.1638459351741;
        Thu, 02 Dec 2021 07:35:51 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id bd18sm3662wmb.43.2021.12.02.07.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 07:35:51 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        robert.foss@linaro.org, jonathan@marek.ca
Cc:     andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        jgrahsl@snap.com, hfink@snap.com, bryan.odonoghue@linaro.org
Subject: [RESEND PATCH v2 10/19] media: camss: csid: allow csid to work without a regulator
Date:   Thu,  2 Dec 2021 15:37:20 +0000
Message-Id: <20211202153729.3362372-11-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211202153729.3362372-1-bryan.odonoghue@linaro.org>
References: <20211202153729.3362372-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jonathan Marek <jonathan@marek.ca>

At least for titan HW, CSID don't have an associated regulator. This change
is necessary to be able to model this in the CSID resources.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Tested-by: Julian Grahsl <jgrahsl@snap.com>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csid.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index a1637b78568b..1226913c623b 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -160,7 +160,7 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
 		if (ret < 0)
 			return ret;
 
-		ret = regulator_enable(csid->vdda);
+		ret = csid->vdda ? regulator_enable(csid->vdda) : 0;
 		if (ret < 0) {
 			pm_runtime_put_sync(dev);
 			return ret;
@@ -168,14 +168,16 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
 
 		ret = csid_set_clock_rates(csid);
 		if (ret < 0) {
-			regulator_disable(csid->vdda);
+			if (csid->vdda)
+				regulator_disable(csid->vdda);
 			pm_runtime_put_sync(dev);
 			return ret;
 		}
 
 		ret = camss_enable_clocks(csid->nclocks, csid->clock, dev);
 		if (ret < 0) {
-			regulator_disable(csid->vdda);
+			if (csid->vdda)
+				regulator_disable(csid->vdda);
 			pm_runtime_put_sync(dev);
 			return ret;
 		}
@@ -186,7 +188,8 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
 		if (ret < 0) {
 			disable_irq(csid->irq);
 			camss_disable_clocks(csid->nclocks, csid->clock);
-			regulator_disable(csid->vdda);
+			if (csid->vdda)
+				regulator_disable(csid->vdda);
 			pm_runtime_put_sync(dev);
 			return ret;
 		}
@@ -195,7 +198,7 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
 	} else {
 		disable_irq(csid->irq);
 		camss_disable_clocks(csid->nclocks, csid->clock);
-		ret = regulator_disable(csid->vdda);
+		ret = csid->vdda ? regulator_disable(csid->vdda) : 0;
 		pm_runtime_put_sync(dev);
 	}
 
@@ -631,7 +634,9 @@ int msm_csid_subdev_init(struct camss *camss, struct csid_device *csid,
 
 	/* Regulator */
 
-	csid->vdda = devm_regulator_get(dev, res->regulator[0]);
+	csid->vdda = NULL;
+	if (res->regulator[0])
+		csid->vdda = devm_regulator_get(dev, res->regulator[0]);
 	if (IS_ERR(csid->vdda)) {
 		dev_err(dev, "could not get regulator\n");
 		return PTR_ERR(csid->vdda);
-- 
2.33.0

