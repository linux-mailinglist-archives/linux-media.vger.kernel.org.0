Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7551A609FE7
	for <lists+linux-media@lfdr.de>; Mon, 24 Oct 2022 13:12:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229975AbiJXLMp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Oct 2022 07:12:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229925AbiJXLMo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Oct 2022 07:12:44 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76FD650BB5
        for <linux-media@vger.kernel.org>; Mon, 24 Oct 2022 04:12:29 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id g7so16109758lfv.5
        for <linux-media@vger.kernel.org>; Mon, 24 Oct 2022 04:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GIb7O1CuYwaqhwQ5XdF+6gSVXwj5O21a/h2ohadqdbU=;
        b=GRdrZxJUqTwEhZENqlG5P5oi2IqRN9DeLMei8iIfSPPgla8xY28RArsuVdCOiyiL0/
         PW8DZNNo+oI7qb1xRy7edjRpKk8uq2sMAPtPyxceIKBm5t/9Iz2V56eUJn2ZT3lVKCNg
         RAljw62dIynht/AajzwqUh5P0qhHyAvyfH4IgX4CjyL6s6nWMxD0UWq+lGRAK/r0/EKp
         xui4/wIR+Dg3SfJ+m2arBFlBSQHS0WIYX28JSJaJa5vGoRsNLFytp/FDhAYXypyG0K5H
         /FxjyS7JCZQJjbtowknMOTG1UIG5xm+zFL08QQRmjSmUzxFX39ILWtwE6qIfb3AnTEex
         wyvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GIb7O1CuYwaqhwQ5XdF+6gSVXwj5O21a/h2ohadqdbU=;
        b=jwRbhlvMzkiuH13OIjVkP7F6BgaL/k2wseTLjX7GVplcj8pQoYJQ+2dEXtjZxaLIoF
         EqsNUui2CFzl46hT2Pb+aR3vJObssjobhbYHQ3e/jNEFqlpNGF/cPnj0IQCpcAN+LdsG
         +6A5om8to+NScKRvG5nB9ZgpAbYkDnQZn8m1ZtlejpeSW09yXOySpxIcrVxY3Jef2aJm
         UPkoC/DUJUqR3NyAQ+3FAhUw/PM5qdvUDM5ozkzmADn8EvyhQE1HPXbFa6pR7uhON9PQ
         eVXTrqyVbtDwLPpgttdn4t4FEX5vUBRN3j9GBSeiP5AVNrmUDHW2ZL5SmumMrAQt/UcQ
         y/ug==
X-Gm-Message-State: ACrzQf3WKk6L1v7JFRk9G4zmc8DyUHuOObEspOdTQRqi/HElNPY1iOks
        GNBk1Lmkyr0VUn2pQprFCVPF8w==
X-Google-Smtp-Source: AMsMyM6bd8nd8jGMgjukQZt8qZcN1t3Y0pILto5+FozDLJJOFB0udatPnPvFGFF1g2bws8UJ3sny5Q==
X-Received: by 2002:ac2:5ede:0:b0:4a4:a373:db42 with SMTP id d30-20020ac25ede000000b004a4a373db42mr10475075lfq.603.1666609947137;
        Mon, 24 Oct 2022 04:12:27 -0700 (PDT)
Received: from fedora.. ([85.235.10.72])
        by smtp.gmail.com with ESMTPSA id g22-20020a2eb5d6000000b0026de1bf528esm4821692ljn.119.2022.10.24.04.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 04:12:26 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Akinobu Mita <akinobu.mita@gmail.com>
Subject: [PATCH 1/3 v3] media: ov2640: Drop legacy includes
Date:   Mon, 24 Oct 2022 13:12:21 +0200
Message-Id: <20221024111223.7142-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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
ChangeLog v2->v3:
- Rebase on v6.1-rc1
ChangeLog v1->v2:
- Rebase on v6.0-rc1
---
 drivers/media/i2c/ov2640.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/i2c/ov2640.c b/drivers/media/i2c/ov2640.c
index 29ed0ef8c033..39d56838a4ef 100644
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
2.34.1

