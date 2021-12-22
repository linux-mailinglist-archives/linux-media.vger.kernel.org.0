Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9580A47CA5C
	for <lists+linux-media@lfdr.de>; Wed, 22 Dec 2021 01:36:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239822AbhLVAf7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Dec 2021 19:35:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239720AbhLVAf6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Dec 2021 19:35:58 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 370E0C061574
        for <linux-media@vger.kernel.org>; Tue, 21 Dec 2021 16:35:58 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id t18so1278242wrg.11
        for <linux-media@vger.kernel.org>; Tue, 21 Dec 2021 16:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MdVc6LUMCGsgDZFlY5B3AT71gB/rmLONtDZ+6b8nxH0=;
        b=TPGFcTvva8KJxWvt4NvVkgedcLi5KCYQ0yfnFfk7m9cW7Kze5He4NLUVTe3QiLKC3w
         UKshtPA7MqQ2xFo+ly645vKEgj47PzS+FMuZyy2ZtpVmXd20S+C55vrRICW1NB7rOkOj
         Xp8r5beqKAKmlROP4bOYi8cI9rHqjiD5se6gMXZfWzpkXaXasY7qAdhsM1LmsxPYgFHY
         mkW871+wss/+WBI83v0CIgv5nJU2pnPi3GqbY8RIj4ly4VhyiOagUYWFm43ztJthweno
         Jhzp8XySVKk7y/3zA4VdW3qkTYhRWsnmEZdTde3eMqrdgVjRuGlxjXvHDm9TONcgi0PP
         ZYWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MdVc6LUMCGsgDZFlY5B3AT71gB/rmLONtDZ+6b8nxH0=;
        b=25CeHIanRBQoqISLip8FadWC9DTCA5hb0VVHbSCgripSkfuPZKa1mQJutKIcO7wi05
         QsnXhYLbYgR4mfUolaslYRUEbNoCAohRb/R8zCQOAG+Lsl0Ajf3OkdwewSnSQ4SVItrR
         x96SKE5aGNNJENnPNY6gokeKJ86I47fkivxkF6W/T5lM7k+44ABO+8J4e2NDf0gNa6Or
         +QEOh8OAJd9DXpWAFK7XxoGUNlB7aU0IFFxoEUVS8ZuduhHj3vkxr611QjoTIbzLUUtg
         ckFpv58V35/PHPxzEcNpXjzYerPEQG81ktTjr88fVGCOrJjtC3+4brgSgMnwqjNvmv0r
         haNg==
X-Gm-Message-State: AOAM530pO4S32nQdxwv/O502HY+s/dxKuHsFKgjLGWAOQXBQMuwyxyLw
        iF1yr77Ua5Cq0TV9GP4QpTIeUA==
X-Google-Smtp-Source: ABdhPJxrMriEeuCr5DRL+AVJjIXUGh9Qh3CwzPGYjLlW78cc/VJ06WuNcIu8f0E0dgddenytihWxCw==
X-Received: by 2002:a5d:6482:: with SMTP id o2mr424165wri.16.1640133356875;
        Tue, 21 Dec 2021 16:35:56 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id n7sm282825wms.45.2021.12.21.16.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 16:35:56 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, hverkuil@xs4all.nl, robert.foss@linaro.org
Cc:     jonathan@marek.ca, andrey.konovalov@linaro.org,
        todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        jgrahsl@snap.com, hfink@snap.com, vladimir.zapolskiy@linaro.org,
        dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org
Subject: [PATCH v3 10/19] media: camss: csid: allow csid to work without a regulator
Date:   Wed, 22 Dec 2021 00:37:42 +0000
Message-Id: <20211222003751.2461466-11-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211222003751.2461466-1-bryan.odonoghue@linaro.org>
References: <20211222003751.2461466-1-bryan.odonoghue@linaro.org>
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
index a1637b78568b2..1226913c623b0 100644
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

