Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6E994C19EB
	for <lists+linux-media@lfdr.de>; Wed, 23 Feb 2022 18:33:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242174AbiBWRdx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Feb 2022 12:33:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231144AbiBWRdx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Feb 2022 12:33:53 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B260051E41
        for <linux-media@vger.kernel.org>; Wed, 23 Feb 2022 09:33:21 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id f11so17966952ljq.11
        for <linux-media@vger.kernel.org>; Wed, 23 Feb 2022 09:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Drckd8mfmiQpvNYoDrqYF9UTaDjukJRDIPG446rcuP0=;
        b=JbdBuyfLA/SJ3Gwmq6wWyVQ18lLH2SJQX22yxCOOjjlXWrDW6pVKwIhZzP6PA6+MGn
         UI1ZHiNoO+IsejuIYq6XP/yeihRVzMxHU6B+FV1i6H7wjT3tEL8LUi7LZvUC0pr4CeOt
         vY0fvTwt6hZ9yPk9Sa47RZuT8q7i4Gbbcz3F1L4fOxC6GPg7v03I/OYlOeYFDPMPXLxp
         k3HHycPvuGY4bae/UxcpTZtyeSVW757ZoaDCgxoidz/eSm449pFdroZ8mHKyxGUU6kSx
         Nzk3EAVcZJvx+ml/w0sHlX6skBXmG/AVaBx/lccoMbPp0Ceor/Qma61vv4/kBn+hYDMR
         Fu9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Drckd8mfmiQpvNYoDrqYF9UTaDjukJRDIPG446rcuP0=;
        b=gTKMsxv21ssqPcVEn7kTU9O2E3P3UiUKDTvsb3dMFYUCTsVtLcxWGLXYWuctkptBWq
         ZIagjp70lu38n0sM3efChpe6V5tL3qgg//rYPqO2S7p+OASITK/vaZq9CehX6tG7anRw
         IDLlFa+2TfQpgEOFwQo+gVxUviZnCDJFZZiGdkeLHgQD5N4h/ZA6Cf66NX00WXuFBDkL
         CyVAvN+XIphORFOzKE/TAsCnJWGLhqf44wElMNFKFCEZg8wDbrT9YCRfImPQxJMS1SVF
         N6BwmiD40/jSEJXYfXdvvogcFnMPsqNfakFIOtCYxUsTZvuGj1rq+jVY7v9iezjtL7NC
         V2vw==
X-Gm-Message-State: AOAM5338a1aa4bKL9VzyjfriRFtmOT3d5srlOgLW/70oTE8V8FeTgbaQ
        i3jsQAnO+CF+nXs8hGahOcxVkw==
X-Google-Smtp-Source: ABdhPJwWAKLcc+f5lNPQNFpzNcFXdxwu6QDlr4TNU1YKxtWtVVkO4/rePJ2hY4lFnaxHtgtbM2CE9Q==
X-Received: by 2002:a2e:b16e:0:b0:246:902:e470 with SMTP id a14-20020a2eb16e000000b002460902e470mr334952ljm.21.1645637600111;
        Wed, 23 Feb 2022 09:33:20 -0800 (PST)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id j10sm32593ljh.61.2022.02.23.09.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 09:33:19 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH] media: i2c: ccs: Drop unused include
Date:   Wed, 23 Feb 2022 18:31:17 +0100
Message-Id: <20220223173117.117302-1-linus.walleij@linaro.org>
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
it uses, drop the legacy <linux/gpio.h> include.

Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/media/i2c/ccs/ccs-core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 9158d3ce45c0..03e841b8443f 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -17,7 +17,6 @@
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/firmware.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
-- 
2.34.1

