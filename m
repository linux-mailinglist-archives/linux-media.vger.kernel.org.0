Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 302694C048A
	for <lists+linux-media@lfdr.de>; Tue, 22 Feb 2022 23:25:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232527AbiBVW0D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Feb 2022 17:26:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230318AbiBVW0C (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Feb 2022 17:26:02 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BFF0B10B5
        for <linux-media@vger.kernel.org>; Tue, 22 Feb 2022 14:25:36 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id b11so27606835lfb.12
        for <linux-media@vger.kernel.org>; Tue, 22 Feb 2022 14:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6h177daC0FDm1IZ5TekVeCGwmMWiCoGt1CzY923IPUc=;
        b=f3zGO/ndbIchBke9ZaJDVAtnFJwKUMNU2enShC2QcO+ddAcxtuN/lHiGdXLvlKYmF9
         rf9RYls8uXreG5MPXFxYFKlZdJ6FasIvw4gEyGLpfwG69MKK+wAxIMclKQsjgWtselYS
         eIpssCDK2/fVGRb/CPoMMEUXUTz2l+zoyF/NGlw4/+n0T2timh6nPIk4yJE8nHfJ64Mp
         c7hkTggc1UIJCyqgaWgQq9SrjZX+RrlNUu1si9ADKzsx9qPjRS+eMa90iyvlG92oyuuO
         n39UM184Ifl+EMEKpRCJQHlsh7luWEpDNc9ZDHiWDd4dhpgNe2N3t7uix1EsIBqdBimb
         79Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6h177daC0FDm1IZ5TekVeCGwmMWiCoGt1CzY923IPUc=;
        b=IuCR9Uvndb7TtyU2ZIQym0Tu7dWMzoKCK1Rdg7JYEX04hEIxV6kMBqS862l4WtuWFL
         AT1Zssj3Z6K/MNuLqTv/cbk7FLKl2TwbhCMYaotMVMkZX93L9kZfK3eu2SrqLm3arBSg
         9o+Zd0JYym9/r0yQ4JRYIvQLNH/H5Gn0wMHFAsjAItqvSdBwUcMSay6oxWolKcDAIkt2
         9Ak+Ofv9GkBV8T2pOskQ6O75BC/kOeORzFDtLLdwcBYJBVJ7J5DBUrD3xq4VFpjI4Mnc
         TNTyBcvUekfgOtY4Rq/Uuvwyh70nlPiLXJU4lJpwYe4xjDBIUxu/laeBkJsOK5UXw5oo
         9y/w==
X-Gm-Message-State: AOAM533RaPAEgi36uFTJdbjK4LRfaiymaLqUWOBkUPmAJvN6SyDmey9X
        VHKoR9QfMaDa3YgCZECtECXJDg==
X-Google-Smtp-Source: ABdhPJwZJbUlYze6s+6h0oEhPNkBuAcg7tAV5U7WlY6Km3Ouj5hNPDIaKVISWCMEnqUwWN3zkL546A==
X-Received: by 2002:a05:6512:2315:b0:439:731f:a11e with SMTP id o21-20020a056512231500b00439731fa11emr18667970lfu.545.1645568734486;
        Tue, 22 Feb 2022 14:25:34 -0800 (PST)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id m18sm1723568ljg.48.2022.02.22.14.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 14:25:34 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Ettore Chimenti <ek5.chimenti@gmail.com>
Subject: [PATCH v2] media: cec: seco: Drop pointless include
Date:   Tue, 22 Feb 2022 23:23:31 +0100
Message-Id: <20220222222331.63495-1-linus.walleij@linaro.org>
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

This driver uses GPIO descriptors not the old legacy GPIO
API so stop including <linux/gpio.h>.

Fix a bug using a completely unrelated legacy API flag
GPIOF_IN by switching to the actually desired flag
GPIOD_IN.

Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Ettore Chimenti <ek5.chimenti@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Also fix the bad line flag.
---
 drivers/media/cec/platform/seco/seco-cec.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/cec/platform/seco/seco-cec.c b/drivers/media/cec/platform/seco/seco-cec.c
index ae138cc253fd..4df56096a476 100644
--- a/drivers/media/cec/platform/seco/seco-cec.c
+++ b/drivers/media/cec/platform/seco/seco-cec.c
@@ -12,7 +12,6 @@
 #include <linux/delay.h>
 #include <linux/dmi.h>
 #include <linux/gpio/consumer.h>
-#include <linux/gpio.h>
 #include <linux/interrupt.h>
 #include <linux/pci.h>
 #include <linux/platform_device.h>
@@ -551,7 +550,7 @@ static int secocec_acpi_probe(struct secocec_data *sdev)
 	struct gpio_desc *gpio;
 	int irq = 0;
 
-	gpio = devm_gpiod_get(dev, NULL, GPIOF_IN);
+	gpio = devm_gpiod_get(dev, NULL, GPIOD_IN);
 	if (IS_ERR(gpio)) {
 		dev_err(dev, "Cannot request interrupt gpio");
 		return PTR_ERR(gpio);
-- 
2.34.1

