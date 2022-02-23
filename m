Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A863B4C19E8
	for <lists+linux-media@lfdr.de>; Wed, 23 Feb 2022 18:30:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242174AbiBWRay (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Feb 2022 12:30:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234688AbiBWRax (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Feb 2022 12:30:53 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8FB747388
        for <linux-media@vger.kernel.org>; Wed, 23 Feb 2022 09:30:24 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id e5so32393163lfr.9
        for <linux-media@vger.kernel.org>; Wed, 23 Feb 2022 09:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kVXi8vBcQdBJMOmMK3do6F7G+qwUtv6k3eCrqcJcwmc=;
        b=JlM8eGBax3i2m7liqg6ykPJX5PaazpxnRlmgimf+Oiig+EMvwotF3bXJrcZGPm7v+Z
         DSl9nR3YmOxAw8xjrrYultRw9SN4XFVuZVGAoluy34GuGGvuQO9zUsS7eJiCpv7dB2HR
         Ih/s9XHsGi1DsqkfOJSR83F5sWlAxBfqYlaeWS5QngKOaMLdvikwf+Uh8UIvl7DIexoq
         2gxfFt9FCWnhy96cZm+0816xJlVciuLW4cEmGi/T47r31AVZx0f93SWLjPxWL55RB9Dv
         k20RYT2aCzCjgMqElU6K/nRUSnKy/Mu07cTQtRpu1UVwrubcuBrVcDxjrvuxcIE0Fs4y
         G3SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kVXi8vBcQdBJMOmMK3do6F7G+qwUtv6k3eCrqcJcwmc=;
        b=TrinJ4b82JWCWsLa1smGbMbXv4qpHoCr8RVDPbmyg80NSkZh7a7YQWY3L7xJzdaaJV
         9rgkF8DIxZyqNzzZcOQ3eQVrLjihWvpy+OpMeByfS+3CudgGvk1IV9Zgo9D0A9hz0Dol
         m4vfN2ZRBSnsnKaA6xRZwDZvTyjuLmso1n1SJ33SwewcS7JiI5rTVsIxfWvzu3/+z2VU
         Udyh37qLhQNOcxQSYm+opy2RGjSEujAb8fi6zFWrV0CLT+tmr5o8wMo1qBOQnUh6t5wa
         AzrQiuHpkFq30ACGsYCBDlpXh6LU3wcsObGcsB6a16mtDPt1+4YFvywZJf0LTxuSygxc
         IKhA==
X-Gm-Message-State: AOAM533rkc9a7px8QIwDgWFBvBZdRc2H6KzItd9/PKndJxzwQwCZAt1a
        Ko0fp7lrI4b/YvS8M+L3P7nEl9cES5Ah6q2X
X-Google-Smtp-Source: ABdhPJxcGTaP11YwXG4H1r4cschkIAnRWti3ShKTAGsiN5jXuQZzoEYdZsOx3+mLoZSgvTiztejCRg==
X-Received: by 2002:a05:6512:31c:b0:441:a0f6:e091 with SMTP id t28-20020a056512031c00b00441a0f6e091mr491853lfp.238.1645637422490;
        Wed, 23 Feb 2022 09:30:22 -0800 (PST)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id w6sm11344lfr.14.2022.02.23.09.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 09:30:22 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] media: adv7511: Drop unused include
Date:   Wed, 23 Feb 2022 18:28:16 +0100
Message-Id: <20220223172816.117039-1-linus.walleij@linaro.org>
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

The adv7511 driver includes the legacy GPIO header <linux/gpio.h>
yet fails to use any symbols from it.

Drop the include.

Cc: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/media/i2c/adv7511-v4l2.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/i2c/adv7511-v4l2.c b/drivers/media/i2c/adv7511-v4l2.c
index 8e13cae40ec5..74e53b5b5dcc 100644
--- a/drivers/media/i2c/adv7511-v4l2.c
+++ b/drivers/media/i2c/adv7511-v4l2.c
@@ -17,7 +17,6 @@
 #include <linux/i2c.h>
 #include <linux/delay.h>
 #include <linux/videodev2.h>
-#include <linux/gpio.h>
 #include <linux/workqueue.h>
 #include <linux/hdmi.h>
 #include <linux/v4l2-dv-timings.h>
-- 
2.34.1

