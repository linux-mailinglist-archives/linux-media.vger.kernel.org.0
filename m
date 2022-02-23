Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB1784C19EF
	for <lists+linux-media@lfdr.de>; Wed, 23 Feb 2022 18:35:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243021AbiBWRgS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Feb 2022 12:36:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233083AbiBWRgR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Feb 2022 12:36:17 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0482554A2
        for <linux-media@vger.kernel.org>; Wed, 23 Feb 2022 09:35:48 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id r20so25768680ljj.1
        for <linux-media@vger.kernel.org>; Wed, 23 Feb 2022 09:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y8cI7hfvRGxJXObcwT7QxSCL0mA/7iuu7uT4WF9056U=;
        b=nORcg/SGc1XVNgPpV+ukQZRrgT4Xvbyr36SkJ2XVi/PAX1r15MlPaT4gFm1TxP3iMw
         MGBDFe4xgVtYk/6c9KqsILifzK9QDvjlSkaTfAEkkHRzAXZH2magcWJrYe0MizNzEo8i
         Noi0GWnJYPmUgEbRarvkIpntsJUr0rntA5iODdkY6fkUNHXOjiv6NBbwVjlQIy7FKiqS
         dJJs1ta0FWZJzO5ebm4086tIzFYSp2qnIgCYmUhNhXuD9STjdvHNh/VmyB+ChT2UgmkP
         BVrexjiubyc/aH1fW1umYyBG5xRkxRq7DTJjF3qiuNm9QpKk7C6MSfUyIkF4cTKJCPFO
         ZAkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y8cI7hfvRGxJXObcwT7QxSCL0mA/7iuu7uT4WF9056U=;
        b=6IrI7TZ65OyYECi7uQe7/mSxSVG4guc1Tvv9iPxAeR/HUpvwteRUh1amQ+Ti8lk3QN
         vO7rFPiV5BwZYN/7xS79L8BUx/vqPu07xx3LdojygF0eD51XxQgY23sDaVdYDbPkRTMH
         ZKiE8h2EzZS5yLQBJfpuZRkep/6LBHkHzgmK01tj+56DS9fJOKjSC7xHC/al5Wwnf1hd
         mufe/wsAriDHHlx/qPXfyBO8Iv1J5KowWBORKjFrUcgeRQ1hbs4A3Zfj8LHZYB3nzNNp
         TKC/fGcZthDjCQbDi2CJNXi0Iop/22hxKlhirHbW/FMkXiuJFtwnL7oKGhHjXRtgRxgE
         NcWQ==
X-Gm-Message-State: AOAM533Nz8XRj7hYel+v/PVv8VTBPItKNBNwFoDiaE2n5SRzW2jE0Dri
        b2Swb00F9/4M1JWUyFXjJL6lgQ==
X-Google-Smtp-Source: ABdhPJyKQZbL/gaQiMnBcYeqTN13RAvmbbmL1t1dcsYF8hDkwrj/Xbx7QvlDf6gLaQADEuKcHBpnXw==
X-Received: by 2002:a2e:87d7:0:b0:246:1466:c43b with SMTP id v23-20020a2e87d7000000b002461466c43bmr320182ljj.279.1645637747310;
        Wed, 23 Feb 2022 09:35:47 -0800 (PST)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id u17sm33588ljd.137.2022.02.23.09.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 09:35:46 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH] media: i2c: imx274: Drop surplus includes
Date:   Wed, 23 Feb 2022 18:33:43 +0100
Message-Id: <20220223173343.117563-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.34.1
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

The driver already includes <linux/gpio/consumer.h> which is what
it uses, drop the legacy <linux/gpio.h> and <linux/of_gpio.h>
includes.

Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/media/i2c/imx274.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
index 2aa15b9c23cc..7de1f2948e53 100644
--- a/drivers/media/i2c/imx274.c
+++ b/drivers/media/i2c/imx274.c
@@ -11,13 +11,11 @@
 
 #include <linux/clk.h>
 #include <linux/delay.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/of_gpio.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
-- 
2.34.1

