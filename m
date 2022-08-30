Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0A095A6EFB
	for <lists+linux-media@lfdr.de>; Tue, 30 Aug 2022 23:15:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231276AbiH3VP3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Aug 2022 17:15:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231443AbiH3VPZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Aug 2022 17:15:25 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C242F4DF11
        for <linux-media@vger.kernel.org>; Tue, 30 Aug 2022 14:15:23 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id m7so8339032lfq.8
        for <linux-media@vger.kernel.org>; Tue, 30 Aug 2022 14:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=IppmrCrBFneQb9VaVzHygkMOkXrFGk8Y10ZECTXEULA=;
        b=d+k8ZUDNOVzd+0iX9xz6IscdeGF5uMpVZ2weV39Vbch5d8B2Rk0xRmVtRyEFbaZJHy
         uULjZ1RJUYErQBuJ9BMBx6cKEn0h+nguMm1HALaFOcitBNNDkk/bc6qswnDYQWcdO9AO
         vMdcVZNeuxxyP/OxUNC/8W36/t01cPR+2AAojwsbcfUiiR6Ode6LQnNRuc6lctdh2dps
         uJmAeBY0aF7l3DGXl3l2vFHTuDxu9hZL4LcN6hisbw1nDUBsRdFkwZfHSd2Nyf8hbiOR
         u0HDNwWxby0VMsor0PtCn78ynCNZeKqqFmoQgdEYZn5HDt0u48AaIoFuuq+SCLulq5oH
         TQjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=IppmrCrBFneQb9VaVzHygkMOkXrFGk8Y10ZECTXEULA=;
        b=FniaTR8pyOz9IvjMfvsCqJVCCM5dYXGQPKSKNfOLwIqv47+9CCcLZwfa2VERGbRxpn
         BvPqSIZFnGAGw1p2vboGg4ZOO6yjQBPPUdW0rIcINUVO5iVE/cQUdtgyDc56fNNFRTVg
         k9x8E/04YtgIPaXXgzOOSeEXiwVWy2HJyRgICThMbxtnG33N5huFMW199y0896uYK94U
         II+rYfd0tyjqLSx/0VJCswABw1Yuicf1/kTDeymDgUrHUqbGIkVB6r9sNKgW2qX1KnRb
         PGkyu5LBlNDOff8iy10mAXzpPEyPZAnwqmqGlmyneUwT0q3m4SLpGuc0xHGWDo7yLCpB
         ZxhQ==
X-Gm-Message-State: ACgBeo3odqZ0xIIF61CeHbXYVWlXIvzCjZB6XRYMO9F6c/3L+9rXKRLm
        BRz2Y9qBMsQj2ydqqnoe+YV8ig==
X-Google-Smtp-Source: AA6agR5f3ULXH3xpds4TyR9xMnoe3ZVRzZTF/F7FFzIIo0FmovZ+/UZN0rZcFNAC+XDUe4PQ4b03Dg==
X-Received: by 2002:ac2:4f03:0:b0:48a:6061:bd8e with SMTP id k3-20020ac24f03000000b0048a6061bd8emr9138561lfr.647.1661894122096;
        Tue, 30 Aug 2022 14:15:22 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id x19-20020a056512079300b004946d780871sm764281lfr.214.2022.08.30.14.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 14:15:21 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Akinobu Mita <akinobu.mita@gmail.com>
Subject: [PATCH v2] media: ov2640: Drop legacy includes
Date:   Tue, 30 Aug 2022 23:13:18 +0200
Message-Id: <20220830211318.397407-1-linus.walleij@linaro.org>
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

The driver was including legacy headers despite using just
<linux/gpio/consumer.h>. Drop the surplus includes.

Cc: Akinobu Mita <akinobu.mita@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Rebase on v6.0-rc1
---
 drivers/media/i2c/ov2640.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/i2c/ov2640.c b/drivers/media/i2c/ov2640.c
index 4b75da55b260..a2dc4f030031 100644
--- a/drivers/media/i2c/ov2640.c
+++ b/drivers/media/i2c/ov2640.c
@@ -16,9 +16,7 @@
 #include <linux/clk.h>
 #include <linux/slab.h>
 #include <linux/delay.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
-#include <linux/of_gpio.h>
 #include <linux/v4l2-mediabus.h>
 #include <linux/videodev2.h>
 
-- 
2.37.2

