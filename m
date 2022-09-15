Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8D8F5B91CC
	for <lists+linux-media@lfdr.de>; Thu, 15 Sep 2022 02:36:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229518AbiIOAgS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Sep 2022 20:36:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230135AbiIOAfz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Sep 2022 20:35:55 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 636712AE8
        for <linux-media@vger.kernel.org>; Wed, 14 Sep 2022 17:35:46 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id e18so6601995wmq.3
        for <linux-media@vger.kernel.org>; Wed, 14 Sep 2022 17:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=jXugpAupLZiYipHRjeQT6CVLpAIE0nevhX3M4kGLyQQ=;
        b=Aa0wVqfxAlLIqaaH6CHjaCK0IVCT6/3LH7L2yEJwPJwu1+nM6z/v/ej9eXfl8otaSy
         cy5zJvo+ZGKPxNcae1fuGzIV7I+rwiwZKu4Qr/z4WEaMeUIn8hvmT2zLsR6vhwwq2BSw
         PhCpxY+FBPjzlY7Mbx61OPgyC9Jvd+ChaJ83d8OIagy1oJ5Q4xVPH4ehT1gtaZFrIDs7
         MC8C4Ms13HA2oo+ZdrdhnbSFYPS9h7ooiB36ZJr07J6cHqh+jFLAO+0XWRncbyEFIEBO
         5NYZnKWQk7ZwXF/pS9Aw81H3Zak6NGCgqLFcyWxzpWzsmYmbA1sda5zCJdi8sOjx75MP
         aEBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=jXugpAupLZiYipHRjeQT6CVLpAIE0nevhX3M4kGLyQQ=;
        b=KRZ2NcPx1mVFq3kiqoFDMGmAW9hR+ZEMHq4kmwBvpGXilYbs/jQfRL6MkovAlHnvjd
         5LvQv07YRC35nBaaHR8eoo7VfbOkJL24eVG6JzAgV96SvWV4dyjmPWb3MNwXq3ZHIXZY
         Ojd3vbJkW8Xgr5MN5B1+4fNZN9QMSJXttCkDm2RL9nMu6rCC/kuvlrGx6t6WrKSp/C39
         3G5ZSfXemH2Ro5Xjt4cra8N0q+T8dtU+PROKjprXHg/50Ir9QYcgb5kSZDbd1YQfuiHN
         m2VBCUt1RA1V1UXG6zhOiwagzwubyH9i/OQ+sb0xNpm13kHLkgcJxY0IYptiOd4QI/O2
         h1ow==
X-Gm-Message-State: ACgBeo2LFof8EAnXnJPleyXw4Xyycnb5q9K+VsZK+x6lw9KA/IGCyDhT
        dkXwWI+XtnDEiC4qyfEzOL6DFA==
X-Google-Smtp-Source: AA6agR4fKuYKoQlPFF2FeDuzqEjPcoKEDyron2k2bQ8MMM/FO1H6E6sJ5IghMMcvgLrkhezsuHjCWw==
X-Received: by 2002:a1c:7415:0:b0:3b4:6198:f71b with SMTP id p21-20020a1c7415000000b003b46198f71bmr4751199wmc.87.1663202144746;
        Wed, 14 Sep 2022 17:35:44 -0700 (PDT)
Received: from planet9.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id d8-20020adff848000000b002253af82fa7sm905235wrq.9.2022.09.14.17.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 17:35:44 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     sakari.ailus@iki.fi, jacopo@jmondi.org, paul.j.murphy@intel.com,
        daniele.alessandrelli@intel.com, mchehab@kernel.org,
        linux-media@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org
Subject: [PATCH v3 5/5] media: i2c: imx412: Add imx577 compatible string
Date:   Thu, 15 Sep 2022 01:35:22 +0100
Message-Id: <20220915003522.1227073-6-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220915003522.1227073-1-bryan.odonoghue@linaro.org>
References: <20220915003522.1227073-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Sony imx577 uses the same silicon enabling reference code from Sony in
the available examples provided.

Add an imx577 compatible string and re-use the existing imx412 code.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/i2c/imx412.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
index 1013a5afc85f..776cc058edf2 100644
--- a/drivers/media/i2c/imx412.c
+++ b/drivers/media/i2c/imx412.c
@@ -1290,6 +1290,7 @@ static const struct dev_pm_ops imx412_pm_ops = {
 static const struct of_device_id imx412_of_match[] = {
 	{ .compatible = "sony,imx412", .data = "imx412" },
 	{ .compatible = "sony,imx477", .data = "imx477" },
+	{ .compatible = "sony,imx577", .data = "imx577" },
 	{ }
 };
 
-- 
2.34.1

