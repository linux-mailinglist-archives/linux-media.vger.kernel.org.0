Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A732527337
	for <lists+linux-media@lfdr.de>; Sat, 14 May 2022 19:05:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234437AbiENRF2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 14 May 2022 13:05:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbiENRF0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 14 May 2022 13:05:26 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1C0C18E00
        for <linux-media@vger.kernel.org>; Sat, 14 May 2022 10:05:25 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 4so13626139ljw.11
        for <linux-media@vger.kernel.org>; Sat, 14 May 2022 10:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pycLM84T574OmRqrkBYUhI0V7ARvdKiCePSuwBy73z0=;
        b=E/MHFhmby61+VO3/+Zou1U5T1T5hyq0e9pgicwSGm8sKdQrOIhoeKax/228jFebA9z
         o2+MZ/dK3AWWuVB6pw+owhwU6YlwXX/SpXBcHLGrroKBlxAUs4/dh7eYOSusuSQUd2wj
         AmV2I+JoGqM5QsMeuVn0WkSObGCstE0IlnEiZHPOK2mFbnidLegAp5xhP2oA41LQmqgY
         BabS++YswQwHYlzPZ6aJyp84mMpGgEVFwNTe9TWM8FO2+d6EagWCAL+UNzJWDeuaI1wo
         JcHJAXQlrzCRZUq18tqweixdK/kOsErijHi7kQIErJ374nwkPyeRFMnKOoLxhehJdQCA
         8iEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pycLM84T574OmRqrkBYUhI0V7ARvdKiCePSuwBy73z0=;
        b=0EW0XHP5kKeauUjLvjx2ak1eD1io1b0MMRzH1SmL4wwkyWOTp805tAKNbqtl5fWpSQ
         G3aEMANKWsY1guNzU0W3mUG8Cr1Hc53roVygnzgvbVCO3wWt2E65Arqr5Emlx/44WGcE
         EbfatWrzFZPK/VZL3t2ufIkECWHFpMQZOMlOJWCWREKvFfXx6m6ibKqpvxdCuvdJZ5Uh
         5Xx9dPY7cRdT2wwrIGMKP6hXnHCTVg8R6MAxTWL6dflrEUqB6mLXRLDsZYeebyhdRa8h
         2fLC6pc6Zi3oBkWsNwX3zXW8VcbMLlKYWOckUm++mzsSnR/msNNUcqUQF6agIrCOmbI7
         kLng==
X-Gm-Message-State: AOAM532oDRwPHT6WdiNs/BQXCFqsYD12E9UabQJXryulISpTbA7/21O+
        iSgrJrViszSPVzYR8UtRy3U5VA==
X-Google-Smtp-Source: ABdhPJwG7Y14chLfpF3GzESLxhxG7BuYFiP2gdAMwLUlJKeQbhWXbnCcu3EwuZ1hHI5M77oo03Okmg==
X-Received: by 2002:a2e:b5d8:0:b0:250:976b:553f with SMTP id g24-20020a2eb5d8000000b00250976b553fmr6279349ljn.275.1652547923499;
        Sat, 14 May 2022 10:05:23 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id g5-20020a056512118500b0047255d210d7sm768165lfr.6.2022.05.14.10.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 May 2022 10:05:21 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Akinobu Mita <akinobu.mita@gmail.com>
Subject: [PATCH] media: ov7670: Drop unused include
Date:   Sat, 14 May 2022 19:03:19 +0200
Message-Id: <20220514170319.291075-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.35.1
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

The driver includes the legacy <linux/gpio.h> header but does
not use any symbols from it. Drop the include.

Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Akinobu Mita <akinobu.mita@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/media/i2c/ov7670.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/i2c/ov7670.c b/drivers/media/i2c/ov7670.c
index 196746423116..66d624d300fc 100644
--- a/drivers/media/i2c/ov7670.c
+++ b/drivers/media/i2c/ov7670.c
@@ -15,7 +15,6 @@
 #include <linux/i2c.h>
 #include <linux/delay.h>
 #include <linux/videodev2.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-event.h>
-- 
2.35.1

