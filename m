Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6BF45FD99B
	for <lists+linux-media@lfdr.de>; Thu, 13 Oct 2022 14:52:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229851AbiJMMwD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Oct 2022 08:52:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229814AbiJMMv6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Oct 2022 08:51:58 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4498D127915
        for <linux-media@vger.kernel.org>; Thu, 13 Oct 2022 05:51:56 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id v130-20020a1cac88000000b003bcde03bd44so3165593wme.5
        for <linux-media@vger.kernel.org>; Thu, 13 Oct 2022 05:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QF0PqOehg1Uzod+E+BZuMuy8LI8b3uRczxR//Iq0qL0=;
        b=R5rNXsqlYEe7NcGlvbpqFH9PS0839eRD/ziELLqTPLpyUdNd6KnGWM/S/twY8QO0ZC
         Ny56/TND0tvJKeczUL/vGgVlehC5JI1BK7GAddzbuM3oSIRTSR5OLOQP+IRRvlWGCFk6
         gmGuN2gq5QeqnmspvYXaaloWLlbq/ReYnPZJf5CGhEP2WnLURThOMnyUS6ydB3dPMWvG
         MbyuTEbjVgZ74aBlTeW+zlaffwYJVnCBSW7Hhf/ljbhnX2OvJULXLxk7+ur1fj9cyx6T
         ondP8DKnYgIsPwx9VKmeZGAFYLOquHCrgQKYTmNPEWpcxua7HiV9My4U13Js+mjzDyHU
         8yPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QF0PqOehg1Uzod+E+BZuMuy8LI8b3uRczxR//Iq0qL0=;
        b=X8f4rSQgrSbg6fecX266EozSWuyrYUdNtty7n0v4g3lYJ3GAH4JhtyJ1Zmdzr5UQLc
         mpz3A6D24bPGaDxZJqP5XsNMapFtuKEmflOq9BUeUyolNjx6vOq2X86ZT0uR7iAdJVHo
         mVEAJFkIWkiUYEIdj9snJu1om/bh5CgBlJhGoqmFesXfXJB0ozv/YefrgN/RPrGo2bSw
         M+apRb4MooYBz+aV2fvRp135QmfPFTFDhk3cBubeqRIa31Uq8kYC1KuqWdTK2hz9j6x+
         9t0ydAXpZ9dWdk/XhLA35V51oX++jeGilCB6/s749kXa5HKim4TWd/zTgWG8lsVuLjGW
         XLMw==
X-Gm-Message-State: ACrzQf3RVnFJRnFdP5i5m6ZtRJDRqH+0oqKWkPf7nsKNN9MIoeC7iycd
        aYvwFh3pNRybWkSwr8sC6BXVVg==
X-Google-Smtp-Source: AMsMyM752iGLYstxsWPWYYibiBDkVJj6eCQDYekYZjxIQvbDDqubYBQSDZ2MweIVgMVb564mnXa/4w==
X-Received: by 2002:a05:600c:4e91:b0:3b4:bcbd:b641 with SMTP id f17-20020a05600c4e9100b003b4bcbdb641mr6575982wmq.59.1665665514687;
        Thu, 13 Oct 2022 05:51:54 -0700 (PDT)
Received: from planet9.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id m3-20020a056000024300b0022e3e7813f0sm1332292wrz.107.2022.10.13.05.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 05:51:54 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     sakari.ailus@iki.fi, dave.stevenson@raspberrypi.com,
        jacopo@jmondi.org, paul.j.murphy@intel.com,
        daniele.alessandrelli@intel.com, mchehab@kernel.org,
        linux-media@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/3] media: i2c: imx412: Add new compatible strings
Date:   Thu, 13 Oct 2022 13:51:42 +0100
Message-Id: <20221013125142.3321405-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221013125142.3321405-1-bryan.odonoghue@linaro.org>
References: <20221013125142.3321405-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Sony imx577 uses the same silicon enabling reference code in the
available examples provided as the imx412.

Add in compatible strings to enable and differentiate the parts.

Cc: sakari.ailus@iki.fi
Cc: dave.stevenson@raspberrypi.com
Cc: jacopo@jmondi.org
Cc: "Paul J. Murphy" <paul.j.murphy@intel.com>
Cc: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-media@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/i2c/imx412.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
index 9f854a1a4c2f..88e6fc78106b 100644
--- a/drivers/media/i2c/imx412.c
+++ b/drivers/media/i2c/imx412.c
@@ -1288,6 +1288,7 @@ static const struct dev_pm_ops imx412_pm_ops = {
 
 static const struct of_device_id imx412_of_match[] = {
 	{ .compatible = "sony,imx412", .data = "imx412" },
+	{ .compatible = "sony,imx577", .data = "imx577" },
 	{ }
 };
 
-- 
2.34.1

