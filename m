Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3C2851E741
	for <lists+linux-media@lfdr.de>; Sat,  7 May 2022 14:59:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1443023AbiEGNDa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 7 May 2022 09:03:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238574AbiEGND3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 7 May 2022 09:03:29 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A6DEB5E
        for <linux-media@vger.kernel.org>; Sat,  7 May 2022 05:59:43 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id u23so10996344lfc.1
        for <linux-media@vger.kernel.org>; Sat, 07 May 2022 05:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uFZrCUeOQ7TXgNtTIezL0BI98jI85NCjT8rXmU3+kzw=;
        b=SG3lbCB5lRX6nhWtyLbnH7iqvgWRau8UhX9MYzxbqheqb2sQ3OqnJ87FZ02EhP7+Et
         fbeIhvbDBM9153iwyeJxFKi3qwBVytgI8QomPvfF0ISTzsnPsQbBuCns42FEEfMHlBA7
         W0qJA15KssbbXw4JeXS5EYifT06xkv1qyItxT0qAkj8hP/XiJHO625SdM1ED8Z+BJN7a
         mB5gmeTYW7Yt7NAfFcdtlRAyb3NTdumMGcVHrH7E6/bBHFwDPDwANC5pfa5cQQ0bS2aX
         qyog10VKVzY4lzxN6Zz33LoAvNBunt7WQBJdB/zJMF3vZnJL8G3Hbxfbzkat9SniB4Jq
         MSnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uFZrCUeOQ7TXgNtTIezL0BI98jI85NCjT8rXmU3+kzw=;
        b=X9zjOSfo44QxnwlXl7JOAWvIgwvy4Lj146K98g1SU6DoOes5vJl72KDKSJcKE5cuG9
         lxrjoV5UPEufh6pM5G31XibXnc8arctM14CjXxOi7Dib6tlBeJfMPxiYCnfhRrmTvFAx
         oCXIkpBlG3GbTjhgUTvqRnXDA0v/SZdp6irllIoZQ9UD3xPD5A/NeSeQJyqYVjTPDsc7
         //8GFoqnKqPEegTYAeXdXOloLFJrZa/VbiK0SAZ5ffXFPYGpzENFaWsRK+fTxOhMVUIb
         REyElzSQxIlCqiQ9hhx5GmeRWqN1EOVdWw6hdxoLzc669mIlLqOSRnnZJJig4XfXhJzt
         AkTg==
X-Gm-Message-State: AOAM530CXV6VmQeazPNFbKbT8pTmtdC9luvrUJbuJNJ2UUbBoS13l7We
        3mG4EJAHAoQkMGU8hMcJU49KzIt9WOKRCg==
X-Google-Smtp-Source: ABdhPJx5JztyrQx1y2qMsru+9OI6bjVoRnbJ4sVRjPjo+N8yWnVfHa42arolmeDnFdtqNV14vX3q3A==
X-Received: by 2002:a05:6512:39c1:b0:471:b37e:fe5a with SMTP id k1-20020a05651239c100b00471b37efe5amr6100612lfu.527.1651928381411;
        Sat, 07 May 2022 05:59:41 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id i13-20020a2e540d000000b0024f3d1daeedsm998737ljb.117.2022.05.07.05.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 May 2022 05:59:41 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Akinobu Mita <akinobu.mita@gmail.com>
Subject: [PATCH] media: ov2640: Drop legacy includes
Date:   Sat,  7 May 2022 14:57:38 +0200
Message-Id: <20220507125738.173382-1-linus.walleij@linaro.org>
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

The driver was including legacy headers despite using just
<linux/gpio/consumer.h>. Drop the surplus includes.

Cc: Akinobu Mita <akinobu.mita@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
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
2.35.1

