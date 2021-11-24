Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A63145CB96
	for <lists+linux-media@lfdr.de>; Wed, 24 Nov 2021 18:57:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350032AbhKXSAn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Nov 2021 13:00:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350038AbhKXSAk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Nov 2021 13:00:40 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5E99C06173E
        for <linux-media@vger.kernel.org>; Wed, 24 Nov 2021 09:57:30 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id p18so3231202wmq.5
        for <linux-media@vger.kernel.org>; Wed, 24 Nov 2021 09:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nltQSFm14iSoAMbvdkFyYA24qQ389OopP2NKU0dRRk4=;
        b=ucQAskBNINqWolheoGQV/dkaoCNYN8VyOSIZz/fw1SZuFCy4DfXcW+LoyTUmzxO2HF
         qX3nYomJ2mb/wwPIK5k6zQlZVvYygslUzMzr5/oAD5lLxoO1t/J8JDEI08lUChWTpFfP
         2eWR2j/qzlOiOKAtPpTHj7zk2lvqNtn+E3/uFUdSm8nBV0jWSfCdCJlqkjNAH+2nfYOy
         XJa53IdZBUaMNMUK2v6+Xo82RD8Wj24rIAQHQ/ZbQ8n8qkZZ8J7zri9ClIaAZDYyhNMj
         R1lgFNBEHWxR882fzbck/UFAK0wTnNVR1+N2YntKIVWEAbUXaPlRsNFz7q6TExWROyQd
         vkxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nltQSFm14iSoAMbvdkFyYA24qQ389OopP2NKU0dRRk4=;
        b=YHbWSoha/HGwS5qjm09Ipin8vZTmsdEllZbhjnBfbVqkiQYaiow0GkuMadjorSrrt3
         3hKJwbosEDhbqlOt/d4JR5ckPkG06vfGl5tuyiBPLxCvNL6KkiNsA/sMrOgForovXP0Y
         Lvjf+VAvzrxg59UHAudhh2KhA/YlsUxDucRc6ulX4PRrQTOuo1Xk6zsUKxQ5IK48AATk
         n8+0V9EyC0qRvZVltczWusedrARLfw/LQBV82KvaG7KtAfyeTwvy8oHlybIKTzc/CK4t
         FBVS5AnpBOAMC9xilDAp0cSoo07q4mQiz9BaVY35hwexk9p2Dt4lyxWgQSyTtiZ679gX
         OxVw==
X-Gm-Message-State: AOAM533QODUtJ9mXHCyB8YPU7+bIUbETVfA+SzeW7jqCWfKYLfV6Wg4E
        qQav/1s+Qv+7H/BA+52cL54haQ==
X-Google-Smtp-Source: ABdhPJyxZTEDDRbp4sL9ptuBotxQMrRnxSSsSodD99etrgo83eZSk3d9r+1w0IAuwV6Ij0i8tR1spQ==
X-Received: by 2002:a7b:c197:: with SMTP id y23mr18273806wmi.44.1637776649492;
        Wed, 24 Nov 2021 09:57:29 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id s24sm380576wmj.26.2021.11.24.09.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 09:57:29 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        robert.foss@linaro.org, jonathan@marek.ca
Cc:     andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        jgrahsl@snap.com, hfink@snap.com, bryan.odonoghue@linaro.org
Subject: [PATCH v2 10/19] media: camss: csid: allow csid to work without a regulator
Date:   Wed, 24 Nov 2021 17:59:12 +0000
Message-Id: <20211124175921.1048375-11-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211124175921.1048375-1-bryan.odonoghue@linaro.org>
References: <20211124175921.1048375-1-bryan.odonoghue@linaro.org>
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

