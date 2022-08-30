Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F96B5A6EF2
	for <lists+linux-media@lfdr.de>; Tue, 30 Aug 2022 23:13:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229737AbiH3VNW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Aug 2022 17:13:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbiH3VNU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Aug 2022 17:13:20 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAA6286C09
        for <linux-media@vger.kernel.org>; Tue, 30 Aug 2022 14:13:19 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id m7so8332776lfq.8
        for <linux-media@vger.kernel.org>; Tue, 30 Aug 2022 14:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=bjcb66wHNfD1dtHng/sUUFDjVpP69UWvUT3pTyrmwxU=;
        b=uLk6Z3sBo9Kl2ZaXePHGguh0ogS66utGUod9PPpv+i6kJwbd3qey/miA/9QTaPiMYM
         n5NREN2xrtcEVksZJo9oIyShwTeStVr6HlgJ+98M5sroQcg6+90NPhaE2LfVXpCKnXea
         KJdlaylVw2v4KWgTWAOK81ktBG2ERAg/+ddLvpTJoKAQLHv8KfYdJx3RoELNzu1HH+yp
         v38caPSMU/3kvLLLRxK7tvvNdwVYPx89ZMABurg7NSIHQIGSV95dIbe5OfTtdjmhKXFF
         e6xktt/dPlIgshk/bNclybiVIt9R9rdHUCQB1YaZ2XcdoriaM+qPLB+cmjUPsY3pGMy4
         Y1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=bjcb66wHNfD1dtHng/sUUFDjVpP69UWvUT3pTyrmwxU=;
        b=IyBG/W6oHkIBnXCr/RtVSIcnGsFAdIUm6XxkMU3uFCm35rvqjmD6HoWcfcPQARvzDp
         qZsJaxP4VpdG15mfhdHJ6IlFdyuGdZY7ju7eEPr0wBvqdt0tCflHq4txZDYDHk8fwClc
         k9pD8X0GvLX4GTtHfIokRWDKoW/Pbn/4gWL4HQ/Z6sYs8vmmnYf1qGm+DzpuzWfgGGAl
         C2ekV7mix2jrW3ztVkFLr8ErG8mt4cPbWFIQtnyxN6NCRiBGxxOscdaoobwY5uHwI1V1
         rosdqdGMwPyTnOav/zM5C7KHwsuLX1at/MfsLJ0Br0x3DVwjnf1bkW/fQa7Zkq6BHKd4
         l2Lw==
X-Gm-Message-State: ACgBeo3kHmgBn6ywinqdaDljchssNYFQcLi5U86fB/y2Owzso4GvOC1X
        IF3K2q2Qbf1yX8pC572KIZs5xmKr7C9s5XWE
X-Google-Smtp-Source: AA6agR66XsLPeX/OajnT7YNlMkh4+ZykHpslZiwW743gbIZ2QCJ5/PceKAePrrww+VahaYIQKUqM2w==
X-Received: by 2002:ac2:4144:0:b0:492:eb38:d8e9 with SMTP id c4-20020ac24144000000b00492eb38d8e9mr9118242lfi.215.1661893998204;
        Tue, 30 Aug 2022 14:13:18 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id t2-20020a056512068200b00492e3a8366esm1736783lfe.9.2022.08.30.14.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 14:13:17 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Marek Vasut <marex@denx.de>
Subject: [PATCH v2] media: i2c: isl7998x: Use right include
Date:   Tue, 30 Aug 2022 23:11:10 +0200
Message-Id: <20220830211110.397114-1-linus.walleij@linaro.org>
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

This driver is using GPIO descriptors but uses the legacy
include header <linux/gpio.h>. Fix it by including the
intended <linux/gpio/consumer.h>.

Cc: Marek Vasut <marex@denx.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Rebased on v6.0-rc1
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
2.37.2

