Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7C1B5E601B
	for <lists+linux-media@lfdr.de>; Thu, 22 Sep 2022 12:43:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231228AbiIVKnG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Sep 2022 06:43:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231210AbiIVKnE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Sep 2022 06:43:04 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 947D8B440D
        for <linux-media@vger.kernel.org>; Thu, 22 Sep 2022 03:43:01 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id n35-20020a05600c502300b003b4924c6868so3618350wmr.1
        for <linux-media@vger.kernel.org>; Thu, 22 Sep 2022 03:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=6CvF1XXx94MfM8P5Aw9kd8Rda9CjzbWOT+YyUiF/JnY=;
        b=eFdWFp09jFFMGrtSUOWH84ERgKDuQ/cmgREPiMqnW7m6F9fmPUipTASEAKUnhNGEG1
         tACr7x6fY6CGL91YhSjrnNAHQo9y2WE1LtM7qp88fgFL+FLnSzNTvSPh8WFV//gZNzkO
         YUUXilvkJoLG080NJxjtFn4HLqB18qVjkZbLt2C+RsdPiGmBAQwrUVY40ZACS8XREZk9
         vT12maefVJWh3TjC0GlGI6UXFirtIWAHcrLvs4b75krmeWQRAP2hfxvQsJF4xiZSLwPR
         c6SrX+sE1KXElEkm0qm9KjQUBSFGEG2zyFncOr8qlsbZb18C9+WqfEnCmxnduzly+bH9
         juIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=6CvF1XXx94MfM8P5Aw9kd8Rda9CjzbWOT+YyUiF/JnY=;
        b=6Xf5kaUPhs9En3X6bWg+5KSdrpUQSnXfQyvpxKU+OgcSZQIHvkttym8MF0siWiZQRz
         szn56qLtviBbisQHPR95EiiHcwxFekdSrLc5mKpEVlFTswzhHXCoYWRpb8wJDfooxLfc
         bbjGmHluWrWxfd2HBq9QBiOtFSnCGeR2CAO2+Ccmpd6XbQgEfkvKLpEK/aDsHfkaMNEO
         Mh1kTK1JNCQXcygj9kftFSMkIS2wjZfTNWPgv4ZPEykIoGrmQ7Wef9c6Zg2y3tPu8N7H
         Vqlq2Zh9oQnqLbe36drniwXVPflqXVbqlFhcJvzxicTO5QMeuqbqOsPjJxq1NUfca5mX
         s8pw==
X-Gm-Message-State: ACrzQf2rFmllN33DkGae/Pkr8r1ER8RgNu4qqHihbBuVmFWFHEAQDnJ/
        VD+KV8x1QVVNDYeV4q2oNiD2Rvr717OdvQ==
X-Google-Smtp-Source: AMsMyM7rCAVK05zlF7BWj/pxs791vMBIv3APdYJy/CzPsPR+hgD2MgJ5sabiC2849wl+lvsSRObF3A==
X-Received: by 2002:a7b:c450:0:b0:3b4:fb1a:325d with SMTP id l16-20020a7bc450000000b003b4fb1a325dmr1920964wmi.138.1663843380110;
        Thu, 22 Sep 2022 03:43:00 -0700 (PDT)
Received: from planet9.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id x12-20020adfffcc000000b0022ac672654dsm4647150wrs.58.2022.09.22.03.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 03:42:59 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     sakari.ailus@iki.fi, dave.stevenson@raspberrypi.com,
        jacopo@jmondi.org, paul.j.murphy@intel.com,
        daniele.alessandrelli@intel.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org
Cc:     bryan.odonoghue@linaro.org
Subject: [PATCH v4 RESEND 3/3] media: i2c: imx412: Add new compatible strings
Date:   Thu, 22 Sep 2022 11:42:25 +0100
Message-Id: <20220922104225.1375331-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220922104225.1375331-1-bryan.odonoghue@linaro.org>
References: <20220922104225.1375331-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Sony imx477 and imx577 use the same silicon enabling reference code
from Sony in the available examples provided as the imx412.

Add in compatible strings to differentiate the parts.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/i2c/imx412.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
index 9f854a1a4c2f..93f362e3b132 100644
--- a/drivers/media/i2c/imx412.c
+++ b/drivers/media/i2c/imx412.c
@@ -1288,6 +1288,8 @@ static const struct dev_pm_ops imx412_pm_ops = {
 
 static const struct of_device_id imx412_of_match[] = {
 	{ .compatible = "sony,imx412", .data = "imx412" },
+	{ .compatible = "sony,imx477", .data = "imx477" },
+	{ .compatible = "sony,imx577", .data = "imx577" },
 	{ }
 };
 
-- 
2.34.1

