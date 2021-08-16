Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B9703EE051
	for <lists+linux-media@lfdr.de>; Tue, 17 Aug 2021 01:22:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232726AbhHPXWh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Aug 2021 19:22:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232618AbhHPXWh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Aug 2021 19:22:37 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBE26C061764
        for <linux-media@vger.kernel.org>; Mon, 16 Aug 2021 16:22:04 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id x7so29832408ljn.10
        for <linux-media@vger.kernel.org>; Mon, 16 Aug 2021 16:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=If86FY8sdS4N9bwIDSXGC/RFPeY8+SvwoygVsUxKCHw=;
        b=TPfjutxuUz5jIzJ4i1wZrR32dkH9aZkB6O/NAtQHHbTXYTXmyZJpZgT1nA/kOyRod0
         2akuW+cX8BiYyDNv2Fqm/T2Fm5OcJLem7SXpZPrKDIiBYlQSt4g5nLjE2GOIHKYDTOvl
         F47gr23+vc5ZIsVX2JaEEfVc7b6ui1bT5irIDwudKcXgOhDOvuq5FgdcAV1LdLwgLSNF
         7YUe3l0eBzGzJ3nY/+d55CREXkVsrfa3jKP7WOZaYQEMhTQ6k6DTdLCRdUuDz7D18cBg
         sEAAanJZasvoWmMAk6UsfjEzp3/q35ghKQKt7OId4kcLkiB6UXpH2y2GK5lLnOQi/1UM
         7ZzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=If86FY8sdS4N9bwIDSXGC/RFPeY8+SvwoygVsUxKCHw=;
        b=DQtQn9VBPL0KCttiYkiCaXmJVKm6Nv5NP3kI059aJ/Uea0T+uhP1gx41Nb9tpmta+7
         HvdvrP20FzImQdNqw35bHXQfrwMsLlAhun/r5eEZiMf3FQgMint/w70aByNj6iTlFfu3
         gwu0qvUIFZ+lTj8w1hXSCp6d4nyz6S4UAdq+NyJa5BQ3CG1OBnLV4BByjCQXSFTW/dTi
         gfzRQzmXab5bJJNK5KRf6E4VqkI6NeToT0iqVqW0SCzOO/hTV6wJyBgDZSiQFi6o1WsQ
         54XbsLeO5CBbOeHu3CydzZWuuUujTW6Pqeqtb2UZG6Wejz776g6Dz7dY4J0FKq12E/O8
         C1xQ==
X-Gm-Message-State: AOAM532GU0Jw6uEF7QGjn3AszHZKZGTSggHGjtv8+55C8bnV7HJ7RB7b
        t33znBbhUVVRu/Fkt+g9m2bRtg==
X-Google-Smtp-Source: ABdhPJyRhvLWMMSQoyde0ynfTC3RXCBdJNDW9jUvTFN2p6iMO1yGEmtAal6tbziEhSz41mQJ2T5n2w==
X-Received: by 2002:a2e:bd89:: with SMTP id o9mr530452ljq.345.1629156123295;
        Mon, 16 Aug 2021 16:22:03 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id bu22sm26388lfb.290.2021.08.16.16.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 16:22:02 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Antti Palosaari <crope@iki.fi>
Subject: [PATCH] [media] cxd2820r: Include the right header
Date:   Tue, 17 Aug 2021 01:20:01 +0200
Message-Id: <20210816232001.484553-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This driver is just using <gpio/driver.h> so include that and
not the legacy <linux/gpio.h> header.

Cc: Antti Palosaari <crope@iki.fi>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/media/dvb-frontends/cxd2820r_priv.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/cxd2820r_priv.h b/drivers/media/dvb-frontends/cxd2820r_priv.h
index 7baf0162424f..09c42bcef971 100644
--- a/drivers/media/dvb-frontends/cxd2820r_priv.h
+++ b/drivers/media/dvb-frontends/cxd2820r_priv.h
@@ -13,7 +13,7 @@
 #include <media/dvb_frontend.h>
 #include <media/dvb_math.h>
 #include "cxd2820r.h"
-#include <linux/gpio.h>
+#include <linux/gpio/driver.h> /* For gpio_chip */
 #include <linux/math64.h>
 #include <linux/regmap.h>
 
-- 
2.31.1

