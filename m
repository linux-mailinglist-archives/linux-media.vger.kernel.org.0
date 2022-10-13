Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B58B5FD994
	for <lists+linux-media@lfdr.de>; Thu, 13 Oct 2022 14:51:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbiJMMvu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Oct 2022 08:51:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229694AbiJMMvs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Oct 2022 08:51:48 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87DAC123442
        for <linux-media@vger.kernel.org>; Thu, 13 Oct 2022 05:51:47 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id a10so2636907wrm.12
        for <linux-media@vger.kernel.org>; Thu, 13 Oct 2022 05:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ittzY8XWr2vUt5TfYx0WNV6vQKXOsg3628wSWyxu3Tk=;
        b=pa1RYehGsYKwFEIktbYb1R08LUR1mPd75p+s0SKUggOKlo1ZWz0+T4pM2e6gfBmJ6w
         KwM9e43ogoKf7P1VpYU3pOrk0xZffE1fOY6dDlh0QtU2ea6Xy19F/DxMoQq0ssqwrzxX
         pYPc3XEVzlfcaYsz6KxGAdSRXE165TdCIoOMf0AG6oSoMTFHdAE31SO03Cx6F3ObOywm
         UV6ESAjqutYOYt57ll5sSw1KKU8WmeyBWJkIFkRbUKatLB5WsFczs2Kuo8qJzHN2XuEv
         ED8Ylwpulj0qX7Nux4ylvfBorKZCxQUAhNspdA2oFXo/+QQyF/Rxum/ZUWTOu2Lp/OK+
         Wm0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ittzY8XWr2vUt5TfYx0WNV6vQKXOsg3628wSWyxu3Tk=;
        b=aeew7jEskBfNucMwkdam50BxvJ1xklHQiDI2BvVY5aX22LqNLzemLGPB3vsm0v5x17
         MHn3RtdEvsRFHzYvqBUc4IKECyQa60gIInqnmzN11jTDfpNk3TWiajHeYEQWFXC9zuly
         6rVGQsj9PLS/jiq101yPua1XBHdcKEnRiW313iafjkvrjELZxraQwitCV2JGZkHSoKpI
         GmXX4Yjj+vmZPtXYWw0N8wA9U0J7yQ5+ss5jRwg0oa1W/2YadlwDZOx1XQdJha51YOxy
         2YRVya+P3rmUwF+h2mYyt/6GvvqbpxQa/jWYU5sN3ncFb+N4GUuT8//YL3/n84M8YJyZ
         uVLw==
X-Gm-Message-State: ACrzQf15saq3BmHASE5cw5ee0dYBM1iOltkPA6fILyJX+27QW4/IlfoU
        WvYxpcEBo+TpvKoFBwjwTBokwg==
X-Google-Smtp-Source: AMsMyM74Krj7KCSTqZ7hHv/RtujY0liYmFYrR/d8rk1YaYATiiLm3StVA2f3uX+CjwwOKQs0qm2gvA==
X-Received: by 2002:a5d:6e08:0:b0:22e:4116:b8e8 with SMTP id h8-20020a5d6e08000000b0022e4116b8e8mr20872929wrz.60.1665665506142;
        Thu, 13 Oct 2022 05:51:46 -0700 (PDT)
Received: from planet9.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id m3-20020a056000024300b0022e3e7813f0sm1332292wrz.107.2022.10.13.05.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 05:51:45 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     sakari.ailus@iki.fi, dave.stevenson@raspberrypi.com,
        jacopo@jmondi.org, paul.j.murphy@intel.com,
        daniele.alessandrelli@intel.com, mchehab@kernel.org,
        linux-media@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/3] media: dt-bindings: imx412: Extend compatible strings
Date:   Thu, 13 Oct 2022 13:51:40 +0100
Message-Id: <20221013125142.3321405-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221013125142.3321405-1-bryan.odonoghue@linaro.org>
References: <20221013125142.3321405-1-bryan.odonoghue@linaro.org>
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

Add compatible bindings for imx577 which uses the same silicon enabling
reference code from Sony in the available examples provided.

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
 Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
index 26d1807d0bb6..d1561841ccbc 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
@@ -19,7 +19,10 @@ description:
 
 properties:
   compatible:
-    const: sony,imx412
+    items:
+      - enum:
+          - sony,imx412
+          - sony,imx577
   reg:
     description: I2C address
     maxItems: 1
-- 
2.34.1

