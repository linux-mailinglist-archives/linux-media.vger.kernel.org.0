Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F2324C2047
	for <lists+linux-media@lfdr.de>; Thu, 24 Feb 2022 00:52:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245045AbiBWXwp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Feb 2022 18:52:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242402AbiBWXwo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Feb 2022 18:52:44 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BACD738798
        for <linux-media@vger.kernel.org>; Wed, 23 Feb 2022 15:52:15 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id i11so1046246lfu.3
        for <linux-media@vger.kernel.org>; Wed, 23 Feb 2022 15:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Gwgg2DJ+PClPDZ8qzBSNHtzgAEHZzd6W4FwktRuFZUI=;
        b=gQaxrIzCZdMg0XcqjaMU8yNJNyi/ecac4j9gAHTahv9eX82YBrEbCTVXxBKUNkk08s
         Rm+giOOv3512qSiq4UofwReYi1hOVfqUU+0lj7oAf93epCnvFBTZjpLiKQnDxUB77sqs
         ho+WFqMxhw3A6wvgMl1WHHXH8qZf4skv9rWporU7EhFL5M4mvLz3Yc7b0+w7GgOHq+K8
         I8QwhbhULHeUsN/gchbJaNY6GtpJBMx3FJDEvEwe9b2l8LNIC0R5M/iN+Pssiu29FqaB
         YMRdTaHdoZUGcVJoJx4NNgC00w8aKJMUQrNuuMsurx6So8GIBwsaPCKtoj8mduAJr1mQ
         6q7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Gwgg2DJ+PClPDZ8qzBSNHtzgAEHZzd6W4FwktRuFZUI=;
        b=wIxf0SKDbDNkEPlvBl5+fZj5C7ACV6dybjLxo1p0WXkBS1wBGMCyTophxM1UAdvWyj
         iNjKXE2mnkr/+8WE8FrwuuB7khzVWLTfzOGVJEmNYcc8NOj4DfW5mG5kkQfZh6KkcjzB
         UVSqzyAoTvV4500SJ2njxP8YY57MSgn1SmbnM98c0mtAIDvJAieqUgpC439wqygBna4B
         sTrQNJYOPqoxHUyV/Nc9iM/t7KjFV3BaCvhhc2luw3YyVib2GYFrtKCYraDjhQSp/jmN
         pVnKnoPYumqS5NcyveEnnoNH4qTiNc1zjiK2yIeijMksRygQ6obqcz4PiHGS5y+RWdqv
         xLbQ==
X-Gm-Message-State: AOAM531+vJgjpSoJHzgFrVhB1eYcU6k+p0BA8yrRC5NBmuXekIfZYdi+
        cDVX84/CgVxM8pB0MliRnsrREw==
X-Google-Smtp-Source: ABdhPJy1nFP/tLYF2HQDagz4fh9yZ93eHBAcknC363huZ4irsnuMJBg6JndWSMcOPJaQspVMhbhMIg==
X-Received: by 2002:a19:2d11:0:b0:445:65c7:5f1e with SMTP id k17-20020a192d11000000b0044565c75f1emr120508lfj.184.1645660334097;
        Wed, 23 Feb 2022 15:52:14 -0800 (PST)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id o8sm73745lft.135.2022.02.23.15.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 15:52:13 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] media: mt9m111: Drop unused include
Date:   Thu, 24 Feb 2022 00:50:11 +0100
Message-Id: <20220223235011.142243-1-linus.walleij@linaro.org>
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

This driver includes <linux/gpio.h> but does not use any
symbols from this file. Drop the include.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/media/i2c/mt9m111.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/i2c/mt9m111.c b/drivers/media/i2c/mt9m111.c
index 91a44359bcd3..f9a1a76dd626 100644
--- a/drivers/media/i2c/mt9m111.c
+++ b/drivers/media/i2c/mt9m111.c
@@ -9,7 +9,6 @@
 #include <linux/slab.h>
 #include <linux/i2c.h>
 #include <linux/log2.h>
-#include <linux/gpio.h>
 #include <linux/delay.h>
 #include <linux/regulator/consumer.h>
 #include <linux/v4l2-mediabus.h>
-- 
2.34.1

