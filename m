Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5B8D5A6F06
	for <lists+linux-media@lfdr.de>; Tue, 30 Aug 2022 23:17:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230411AbiH3VR0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Aug 2022 17:17:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbiH3VRY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Aug 2022 17:17:24 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6B92883D2
        for <linux-media@vger.kernel.org>; Tue, 30 Aug 2022 14:17:22 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id p18so9364265ljc.9
        for <linux-media@vger.kernel.org>; Tue, 30 Aug 2022 14:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=HNNSzOtqnP3YyzSdpCkmIUbI9wDrExGLXa8xAgakmAA=;
        b=I8DCH29pUBpXbvo2TYBDuos2CVz4eiAqI8X6p2oXXrY93ZDIF+3E89LmhmXu97lDB/
         oFvno7Y11iYuuysTvlscC+EpZPzogbwxLjoLQLkny9gGG+ZmB+DKdNkaIEENkEeJ5meD
         zrcnivmCCaYZ+A69JlxpXDz99WplpxEZQAYRA7C/TdbzeD3jyLhgCL8ijH+VP29INSLQ
         LIFAERwzkrLtorXuyCqBQKtCJYggjdBzs1H1KEHp6ghzsQ8fsukSkr5Q1kOXT7DGhIOg
         Fz6WIcP9ZtPDfvk/go+zRGoqD1h2YQs8bLh6UxKhnxYzI71pjpMuC5uyW+H17OuG6imo
         steA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=HNNSzOtqnP3YyzSdpCkmIUbI9wDrExGLXa8xAgakmAA=;
        b=8BoCrx1MbpTm6OiaLzRFhHnTGPX4OoGryl7aSQTzTW5Sypm5psN4F5wCm6S6lEigeo
         iV/RCljjQ2kfhuG+Ok5ptIA1CDg8uWZSPMUVmxaPQ1mZKhkcJKOfjtFVsF2aL+I9BFua
         w7DH/fI7LyltnrD3sCGUgzRGIs0UEyctAnSDdtHVfxiEfRG4BQOT9S3kg5n1U3a9OQ9Z
         UTms1YkpGlKvo/a/JHRfBkXz/BtVDCTQbbw+9E5qmAj6c6BJevnike1Agz9idLgd06ZQ
         TecJUqdG7olBDTfQ6HGhlThTGx2fcKLd4ZlzDB3DZ7PBRbpN6ZHWXpjpyZ7hbOIJJsfZ
         BEfQ==
X-Gm-Message-State: ACgBeo1WqhhIAhDB3TAnyIiHtGr2VpbLDQMRC42a69z4QR54W+4DlPkx
        m1POBs7qO8ij1Jd1cMFfy9+1dbJOnbIK+SMs
X-Google-Smtp-Source: AA6agR478OzQGLQDpv/H6QZYannEQMjyshTC5C3Z9rRdDC1x/nY0TXDUnRNOFgtv/xilwOkAQ7Bnxw==
X-Received: by 2002:a2e:a7c1:0:b0:25e:7435:51b8 with SMTP id x1-20020a2ea7c1000000b0025e743551b8mr7573073ljp.476.1661894241243;
        Tue, 30 Aug 2022 14:17:21 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id k1-20020ac257c1000000b00492e98c27ebsm890436lfo.91.2022.08.30.14.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 14:17:20 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Akinobu Mita <akinobu.mita@gmail.com>
Subject: [PATCH v2] media: ov7670: Drop unused include
Date:   Tue, 30 Aug 2022 23:15:18 +0200
Message-Id: <20220830211518.397690-1-linus.walleij@linaro.org>
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

The driver includes the legacy <linux/gpio.h> header but does
not use any symbols from it. Drop the include.

Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Akinobu Mita <akinobu.mita@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Rebase on v6.0-rc1
---
 drivers/media/i2c/ov7670.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/i2c/ov7670.c b/drivers/media/i2c/ov7670.c
index 1be2c0e5bdc1..4984ae44f781 100644
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
2.37.2

