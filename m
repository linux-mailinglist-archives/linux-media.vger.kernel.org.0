Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BF9A324142
	for <lists+linux-media@lfdr.de>; Wed, 24 Feb 2021 17:05:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235344AbhBXPpV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Feb 2021 10:45:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235738AbhBXOqm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Feb 2021 09:46:42 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CDDBC0617AB
        for <linux-media@vger.kernel.org>; Wed, 24 Feb 2021 06:42:45 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id k66so2059053wmf.1
        for <linux-media@vger.kernel.org>; Wed, 24 Feb 2021 06:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=65QKSsy3lkCh0TOg3Qv5eqQsbUSxRJSlb8pGltzsbn8=;
        b=aOA3X1qA/raiSVC1ONzrW+LerPrW/uegK5wztMiPKpR4vtgB/F+yAaSbciq1EvjRSh
         FOdC/O/q7THZDizqc/NnyhjJmS23bM3YuMcLqP5zPyvvUDRKoGrk/dtBqHxHK5mrW23F
         AuZOKuCPrbA+B3eyK+EjBJ6u0PfzHZER8tL/j51qvj3MTwj6kiSMLnDJeb9jKwP4rAaA
         jKCtIZ1dgXiSsII+pIKTSqplrMcvPhG+5hAwFZ+YzJCUG8amw/iU4iNZziUQqj8wfsh3
         B6YyMmZnDwRwpEv7ogeHvRG4Wp9Tbuee6HSBbLQGGB3IyRlp+5wb1Eaw9Vd6JqpT1kTE
         7y7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=65QKSsy3lkCh0TOg3Qv5eqQsbUSxRJSlb8pGltzsbn8=;
        b=PswuGb1BHgdXiNv5RP0LZShrDl6lDYBKY7PgMjgwkb/Cbxh0Hkt8qrJdHGzlFfrYX9
         xPKqOi3PSimcwvTv+/kINVyjL2COfokvcTx1nqVQV2v33JFW5YSM9YoOnt0Wc19psRR7
         o/g4ccTCUWqI5tnKJE9mXn3Wvi+0pi3B21VdGxI0+gOEBc1HVLeP608giJjuKRFzzAEl
         t9fjR1QPh/7hyeqMm/OlDM82e7i+tuJXfcSGI0atKmTRXsiIwl9kat+idQznX115d6Js
         jh4uRPM+JGdEcOATQM7x9WUrBmuh3k8wluV7FF4pTm8sX8j8UISheC5pDriNvgSpO+J+
         ZXIA==
X-Gm-Message-State: AOAM531yLTLFuMefI/+zqJscpg37fAt8KE87P2BEo7X33YxrOdrL3JYm
        KHghTpacdoAC5MOGpJjo2UMnkLqNsJtAeA==
X-Google-Smtp-Source: ABdhPJzN3c+DDio3HKnmVyPDga3bjriwu8sVoanEINW7bsZeHkd6/eck/wyCN4/4JqOwOcO1iyGKUg==
X-Received: by 2002:a1c:20c7:: with SMTP id g190mr4040398wmg.156.1614177763949;
        Wed, 24 Feb 2021 06:42:43 -0800 (PST)
Received: from localhost.localdomain (lns-bzn-59-82-252-157-252.adsl.proxad.net. [82.252.157.252])
        by smtp.gmail.com with ESMTPSA id p3sm4170669wro.55.2021.02.24.06.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Feb 2021 06:42:43 -0800 (PST)
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     rafael@kernel.org, andriy.shevchenko@linux.intel.com
Cc:     linux-kernel@vger.kernel.org,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org (open list:OMNIVISION OV02A10 SENSOR DRIVER)
Subject: [PATCH v2 7/9] i2c/drivers/ov02q10: Use HZ macros
Date:   Wed, 24 Feb 2021 15:42:17 +0100
Message-Id: <20210224144222.23762-7-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210224144222.23762-1-daniel.lezcano@linaro.org>
References: <20210224144222.23762-1-daniel.lezcano@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

HZ unit conversion macros are available in units.h, use them and
remove the duplicate definition.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/media/i2c/ov02a10.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov02a10.c b/drivers/media/i2c/ov02a10.c
index 8683ffd3287a..59a34e59774e 100644
--- a/drivers/media/i2c/ov02a10.c
+++ b/drivers/media/i2c/ov02a10.c
@@ -9,6 +9,7 @@
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
+#include <linux/units.h>
 #include <media/media-entity.h>
 #include <media/v4l2-async.h>
 #include <media/v4l2-ctrls.h>
@@ -64,7 +65,6 @@
 /* Test pattern control */
 #define OV02A10_REG_TEST_PATTERN			0xb6
 
-#define HZ_PER_MHZ					1000000L
 #define OV02A10_LINK_FREQ_390MHZ			(390 * HZ_PER_MHZ)
 #define OV02A10_ECLK_FREQ				(24 * HZ_PER_MHZ)
 
-- 
2.17.1

