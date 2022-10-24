Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 733C9609FE8
	for <lists+linux-media@lfdr.de>; Mon, 24 Oct 2022 13:12:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229925AbiJXLMs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Oct 2022 07:12:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229934AbiJXLMq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Oct 2022 07:12:46 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1869555082
        for <linux-media@vger.kernel.org>; Mon, 24 Oct 2022 04:12:30 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id be13so16120171lfb.4
        for <linux-media@vger.kernel.org>; Mon, 24 Oct 2022 04:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fYOlNCUKLgVxmaDYjeCCoItxD2KXkExW1cGm20+HKlA=;
        b=Pg4s0nZLcILe2QaBr2Wjf82gccWT/ojUz+mz6l6Giky+uTeSeuZk45krpmg0rGGx9k
         p070bDXLvkrCQM4nAwjR6gzM7A4nzdxsL17tAklg+nKc/rvWCJJ7KIkGJHerf0D1xLLB
         m0W21vDjm2+aaVqfhV5naGWlWR2/jhB2xwOgarng1YLY+z35T81u8DVESgl2qAgiYDhE
         BZ/yh/LjVeCdfvrEBld5GywaVmyvMgxbq13B5mzVSs2eDg+32TzG3I22uWcALmA047cH
         EXXE2p7m0Txg75QlXpb+OXoaKA6Yui1n26V0ZYRnMBvU4EllS+uMtDHWhXllI32u8Z2G
         FJbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fYOlNCUKLgVxmaDYjeCCoItxD2KXkExW1cGm20+HKlA=;
        b=7gcOpTD9SKy5EmjGL6uidLG2MxnWun1NW4Wt619hYhuhG7Ixyb/1YIP4M16/9XUyCz
         vsgdccBRhS21Unch/KHHrB8r30Mvsqvagr992Gd+4qL3Gtcg0shtXvLhPbfhI/m/fRjk
         E/WIn1qqQYTyBbdJ119YQpV5K5IaKjUQ4a7b9LE0dNEoJ8rGBJOSde1ikeN9aCY32Ixe
         mZ55RIH1xN3ZIxCFQz3pbFtTSxFJQ4S4bQmAXcgvN3F7XNpujH1h0RBdjGYJCE2Zr2cS
         VFB8N4zP5NK2I3CVz7Ia8d+0uMS0hpKU6f6Nxuulfs/JYLk/lUhkeOTdopiwCoLDZ0aL
         FC9w==
X-Gm-Message-State: ACrzQf0bG+jwBUWtFqt8rkJXWLrZuzylB9M+qLsAV63MuE+F2gptLKen
        EDEGMLekkIi22XG8SiFcKkfrlA==
X-Google-Smtp-Source: AMsMyM4NgqHNKtDV70DB1KFzuvl+0vpIsCAZUEzTVRJIZh7NwCXQJvet4SJZcrhTq2kgRZATZZMhOw==
X-Received: by 2002:a05:6512:1694:b0:48a:9d45:763f with SMTP id bu20-20020a056512169400b0048a9d45763fmr11087362lfb.662.1666609948667;
        Mon, 24 Oct 2022 04:12:28 -0700 (PDT)
Received: from fedora.. ([85.235.10.72])
        by smtp.gmail.com with ESMTPSA id g22-20020a2eb5d6000000b0026de1bf528esm4821692ljn.119.2022.10.24.04.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 04:12:28 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Akinobu Mita <akinobu.mita@gmail.com>
Subject: [PATCH 2/3 v3] media: ov7670: Drop unused include
Date:   Mon, 24 Oct 2022 13:12:22 +0200
Message-Id: <20221024111223.7142-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221024111223.7142-1-linus.walleij@linaro.org>
References: <20221024111223.7142-1-linus.walleij@linaro.org>
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

The driver includes the legacy <linux/gpio.h> header but does
not use any symbols from it. Drop the include.

Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Akinobu Mita <akinobu.mita@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v2->v3:
- Rebase on v6.1-rc1
ChangeLog v1->v2:
- Rebase on v6.0-rc1
---
 drivers/media/i2c/ov7670.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/i2c/ov7670.c b/drivers/media/i2c/ov7670.c
index 4b9b156b53c7..11d3bef65d43 100644
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
2.34.1

