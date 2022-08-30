Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E46DB5A6F25
	for <lists+linux-media@lfdr.de>; Tue, 30 Aug 2022 23:30:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231515AbiH3VaX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Aug 2022 17:30:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231559AbiH3VaO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Aug 2022 17:30:14 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA0A62181B
        for <linux-media@vger.kernel.org>; Tue, 30 Aug 2022 14:30:11 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id b26so5805481ljk.12
        for <linux-media@vger.kernel.org>; Tue, 30 Aug 2022 14:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=EBdnVk64ST5b76dlxeVfP2bE+BakBNehMnOnQXYKduQ=;
        b=LrIxExQpIyPMKsNAFAlfid7LHyWFUpd+EoD5/c/LPT9yG9N4N+Zd+0pU3WOQDsUnEF
         DKnksmkFhhFgLW94MG2cXsvetNluoI7srBYaC/Jju6zVBqK3Agr1AkffXUyfCNg9/CWa
         uqYFcnK7tTzriOzsv6pRH9cld/h29htON/+Hjm07XOovH4T5p0h9UTreqthtjTA+gaLW
         yOfL7dYAstAYGIZ85NURqCCb39MFB0Bg53wO6en5oRgrjKLLpx7k4m07ea4P2uWqiS4w
         ltnlgHWCUNJBa4feOr47+RPLwYh6OONAiTsAUil2DzQsAAhU/SYivRGqz99mftqAEEwj
         MwNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=EBdnVk64ST5b76dlxeVfP2bE+BakBNehMnOnQXYKduQ=;
        b=jl7a8y6+ARfxrr2aKKADgwp13TxEtyU64Eu4OnC0DjMQWvKQWvwvvePQifidJsV8vG
         Fq/SdSsjQJjroR14HTSxw7a2V6SDpcpdcIU9i0yz7fAgCok6c9OZpEWP8QtFdebOdD6o
         z5j9xnavlOBJkA1NhTYW+hGR7xedXjIp7QCRJRWg4Ic+fyJ90lYB4RERAaIGYEvHzHBS
         D1i2rZw0xXCixb/usKj2kIfQzdZ5JKyu8K5xSYbkTT0hL1HNbsfxk0IN9aroI8te7OZV
         6Fzhbi7rUoDe2dc5QwpAKT5cwCjRDE7sCnnBH87l6zR6HOcWIoo9jhIHVD1bqaVZ95G+
         xeMQ==
X-Gm-Message-State: ACgBeo072S3HV55q6KYcWWp7ku3T5qYSEXmbKkBhNpsrQjgU6NKyISOZ
        5OL7fuJMcKbel32j7V/M+uDTRLTc97/JUTX0
X-Google-Smtp-Source: AA6agR4WzX6vCWOmqAPkZDVLKHfQyYTfgGJSCcJNV6ASL/0pqVaf8qNIuosKQF69fHAXN+Ejp64SRA==
X-Received: by 2002:a2e:3916:0:b0:268:87e1:3555 with SMTP id g22-20020a2e3916000000b0026887e13555mr144418lja.299.1661895009681;
        Tue, 30 Aug 2022 14:30:09 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id w11-20020a05651234cb00b00489d1896c06sm756622lfr.125.2022.08.30.14.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 14:30:09 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Dinesh Ram <Dinesh.Ram@cern.ch>,
        Eduardo Valentin <edubezval@gmail.com>
Subject: [PATCH] media: si4713: Use the right include
Date:   Tue, 30 Aug 2022 23:28:06 +0200
Message-Id: <20220830212806.398896-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.37.2
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

The driver includes the legacy <linux/gpio.h> header but uses
<linux/gpio/consumer.h>.

Cc: Dinesh Ram <Dinesh.Ram@cern.ch>
Cc: Eduardo Valentin <edubezval@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/media/radio/si4713/si4713.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/radio/si4713/si4713.c b/drivers/media/radio/si4713/si4713.c
index adbf43ff6a21..60e72c8c643b 100644
--- a/drivers/media/radio/si4713/si4713.c
+++ b/drivers/media/radio/si4713/si4713.c
@@ -14,7 +14,7 @@
 #include <linux/interrupt.h>
 #include <linux/i2c.h>
 #include <linux/slab.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-ioctl.h>
-- 
2.37.2

