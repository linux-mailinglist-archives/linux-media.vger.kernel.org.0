Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B88B051E730
	for <lists+linux-media@lfdr.de>; Sat,  7 May 2022 14:58:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1443023AbiEGNBR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 7 May 2022 09:01:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1446507AbiEGNAf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 7 May 2022 09:00:35 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51C2352B1B
        for <linux-media@vger.kernel.org>; Sat,  7 May 2022 05:56:22 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id y32so16679597lfa.6
        for <linux-media@vger.kernel.org>; Sat, 07 May 2022 05:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nh4UXdfseLTvf47MmPlW401g3TG4nefDHH0y35hBxhM=;
        b=GKeZdVPzbNtZ4q+ZQFpJQ79Sqt+tdKWvewbc5Enyp9++4DZDIw4b1RsJT5SBDkDqH4
         UPTOJjAnYyC2iu4f3Opp8Etz8nYmciJFEtVeY4DAzbonio0Nwti10sdvXJphRVc3fp+U
         Vkzsb8fcYv3+vNbhWtaYvYTIp23bYwcvZOJTatAStBWslDzMfWrAp+oPnUp7ekhTqb+c
         bNdGFsMuf8OhgPC5qFh2NOYqmN/5bwIpLdYaIojU2BbRQHgnVKPnqrK9LaGl5ntV15ni
         QUONMjCWwJlyhgaPfhYczWZnXEoqPhHxIAurzTUwPG4TTc4gyBY+jU/aIh576+vUjq5a
         gsiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nh4UXdfseLTvf47MmPlW401g3TG4nefDHH0y35hBxhM=;
        b=Dv901UcTlBxXijijitAAt3QrS/UKpRXcMXzrzSX6kFm93Ox6iadhFqyrkSk4+kdDhk
         FnsMWslnqi5nU83jMkDW04lHIBQO1g+mHZDbS9905S7JUVsOYCBybjubOZlqb1BTkArf
         D+NwgKztcG3Xe9THoAb+o16jeVDCgZiJwn2P7Hz+xqoYHulX5CEMZQ0bAevs+xa3pjyv
         gOh/niGclNllhFhJcmMk/aFd+XHQEUEkVGMd3RxhayO5B1fcT5lXxJo7TTJ+FxcN/zXO
         pk1SZ4cHyQH9xwb5VpNOJpdWdpVpOxRia6fMVrlbxbFnt61D4e0omjIcUMNd5BOI3kJ+
         RkYQ==
X-Gm-Message-State: AOAM533SvVEmt026odEPQRV4unDIDsGTFXAfpsmm5A7mT98Fw2lmTyQB
        P9UVsoF27k53TARyIYnVtHuufFFpdc/D8g==
X-Google-Smtp-Source: ABdhPJyWf+x11tjjYstVsMO5bRcuqNBNSYS73ygmIXRTo85Qdwsux+goTLm+qX56HvvE003uU4lsrQ==
X-Received: by 2002:ac2:518b:0:b0:471:f81b:bb9f with SMTP id u11-20020ac2518b000000b00471f81bbb9fmr5977769lfi.638.1651928180728;
        Sat, 07 May 2022 05:56:20 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id v26-20020ac2593a000000b0047255d211e8sm1100005lfi.279.2022.05.07.05.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 May 2022 05:56:20 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Marek Vasut <marex@denx.de>
Subject: [PATCH] media: i2c: isl7998x: Use right include
Date:   Sat,  7 May 2022 14:54:15 +0200
Message-Id: <20220507125415.172973-1-linus.walleij@linaro.org>
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

This driver is using GPIO descriptors but uses the legacy
include header <linux/gpio.h>. Fix it by including the
intended <linux/gpio/consumer.h>.

Cc: Marek Vasut <marex@denx.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/media/i2c/isl7998x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/isl7998x.c b/drivers/media/i2c/isl7998x.c
index dc3068549dfa..27feefe1dfcd 100644
--- a/drivers/media/i2c/isl7998x.c
+++ b/drivers/media/i2c/isl7998x.c
@@ -8,7 +8,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/delay.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/of_graph.h>
-- 
2.35.1

