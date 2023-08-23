Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C66E7853B7
	for <lists+linux-media@lfdr.de>; Wed, 23 Aug 2023 11:20:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234966AbjHWJUX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Aug 2023 05:20:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235484AbjHWJSV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Aug 2023 05:18:21 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C57351FF3
        for <linux-media@vger.kernel.org>; Wed, 23 Aug 2023 01:56:14 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-986d8332f50so715314566b.0
        for <linux-media@vger.kernel.org>; Wed, 23 Aug 2023 01:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692780973; x=1693385773;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vs7TYRhEZae23BHcIvi2Ln4wVlirirYZRQLMvBSgBWU=;
        b=qan7IvYVFvpkudj1oCiCGUjwxzOASjonXBBDFM8N4bBUqjb2EjGk3gkublwDEuHFYM
         93f1UR1UGYryn5tHmLwJuKpyHblWld0eglXTmc8jaaGS+59lpKV6X2mMRN0w+Hi7w7n3
         B4AgxIpo2jacUJSDl9r9s0byvqoP8q8O4jXDq7NHFJR3fysMXBGuqxADvI2UmZgrYgWL
         Cx+iIItLq6/+R7BcykLQEa3m8MjMSOUvi5/L/mMXH79apUk/QrmH877zMl3M/q5/5btd
         OrIUNiEy0s9YJlciBJeBe8FRdbPDo6u/AFBln797VUpKRTGPWt+N7pM3gvqlnUaAxHwq
         xu0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692780973; x=1693385773;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vs7TYRhEZae23BHcIvi2Ln4wVlirirYZRQLMvBSgBWU=;
        b=GXV2Z4FKsUFTD7FGVZW0srvBah0Q76CjS+FkAlDOiENJ0bte01vPWTfTyyBq+BIhbj
         DlDMGr5C1fuyYnN69k1lb8MUsCzJCGISDH1NiEkSIwaWWoAvrlITlOfT9iSL2G611yTs
         JihA/weFU0vV7Jiv8rtxxP0/ZhbnW2mlq94FUJgO5iPWi6NsovDMK7qASZGYxf9RY5cK
         WX39LhZrMPCYXVUSFwwDzV3tivlagQBkDsDz3qwDlNMRcBrRYyVByem+psKW/N53juTL
         FC5lg+dv+P4BgV7hAs1cCDHQOhMWxlP8lxzlKkHs7gKcTx2sc7hrzqPEyLYeBAQEu28Z
         rDrg==
X-Gm-Message-State: AOJu0YyJz3eI3shpAKk53RcgxCOwNitenPod+hP7nsKYrf17kGDSPRPv
        yXE/0XcACtBz52iMlbFF39wtig==
X-Google-Smtp-Source: AGHT+IFl4ErBydRgH3o+szBhieEObFyJk2W1qgdlEGWyQ2DuJPK2W+Wat1TPa0oQjMvvp+JQX7n08Q==
X-Received: by 2002:a17:907:2bf7:b0:9a1:ad87:1354 with SMTP id gv55-20020a1709072bf700b009a1ad871354mr4511261ejc.34.1692780973398;
        Wed, 23 Aug 2023 01:56:13 -0700 (PDT)
Received: from krzk-bin.. ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id lc21-20020a170906dff500b0099cc15f09a0sm9525260ejc.55.2023.08.23.01.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 01:56:12 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] media: platform: use capital "OR" for multiple licenses in SPDX
Date:   Wed, 23 Aug 2023 10:56:10 +0200
Message-Id: <20230823085610.116607-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Documentation/process/license-rules.rst and checkpatch expect the SPDX
identifier syntax for multiple licenses to use capital "OR".  Correct it
to keep consistent format and avoid copy-paste issues.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/platform/verisilicon/rockchip_av1_filmgrain.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/verisilicon/rockchip_av1_filmgrain.c b/drivers/media/platform/verisilicon/rockchip_av1_filmgrain.c
index f2ae84f0b436..f64dea797eff 100644
--- a/drivers/media/platform/verisilicon/rockchip_av1_filmgrain.c
+++ b/drivers/media/platform/verisilicon/rockchip_av1_filmgrain.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0-only or Apache-2.0
+// SPDX-License-Identifier: GPL-2.0-only OR Apache-2.0
 
 #include "rockchip_av1_filmgrain.h"
 
-- 
2.34.1

