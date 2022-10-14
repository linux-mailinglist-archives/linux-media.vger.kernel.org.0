Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7719F5FF359
	for <lists+linux-media@lfdr.de>; Fri, 14 Oct 2022 20:04:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230247AbiJNSEa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Oct 2022 14:04:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230218AbiJNSE3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Oct 2022 14:04:29 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFEE71C1177
        for <linux-media@vger.kernel.org>; Fri, 14 Oct 2022 11:04:27 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id r13so8729079wrj.11
        for <linux-media@vger.kernel.org>; Fri, 14 Oct 2022 11:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sR8XzZbfaSpDw94NzG24BznFgA7mEC/NTOou7h7IByk=;
        b=ArtyIO531okYckIvV4q+kRFXAqUHJjxA4RJwwdRBFP1/lowXm9hBoM31nw6Jt7q27C
         Mlg97WXy53uP+Q8FJVyIbjjFBIXoWwL5XzxffJZRru/4DuX3XxISPtkEGJvNNiS1X3mT
         NAaOmNVPUt63Q1KcWioUaUBNWFrQ5yWq4St0JrPUMZyxYn1p8T+LMwTfioPdCrhFWfMJ
         KD8KxSG/hqyfWhrgl1fsx9uoa6+XdzhCUEOv86XdojKUx7GqSc+a4a9Gz+fmScCohvXn
         F4jf8CWF0ES73nwU0hpezpExlfELkoee/DbZvQfooyKrkwtaaGEdLmgzaYllWJyYSe/p
         j+IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sR8XzZbfaSpDw94NzG24BznFgA7mEC/NTOou7h7IByk=;
        b=x7lH0goajBK7NxnkLh96CqF12oBEl5pffMX3/iruf60Qh1vpTt7Qsrn/darL4CLGTY
         6mKgRWnIVuUEmZwiFUDZtWl4nM+d/cRHzrLMeai8bitKfac/pDa9yLAqAXndkpt8Jo16
         wRgmLCU6GCXMIGWlsaFppyIiA4F+dOoEV/jxyQv56xHSBMVElIte0xbDIlRafQ8aNfJn
         HdYGcpmMeBpABhrglgbXYSK8s9j9vbmZtKvVb9m+A9wSynZXzLgygoA4Yq99GG7d11BK
         wn+8CQS707XotJsfaWznJqnoD11HFuYJfzjinxEjMyjugHZIGj+W0qMeDxPQFUuGKDne
         au2g==
X-Gm-Message-State: ACrzQf1fvOr3PIQz+keWwZJh7B5ejpWOKWm5Fc5PKUhJwL8D5LkkYUc+
        zCLU9B4AbkiU6SrBroo6jXOIPA==
X-Google-Smtp-Source: AMsMyM4olKEnhjs8UODIAEve8fvcsO17aWLITeoZr1AjfGIFW7Akerp1Tq1OkWkRtBo+L/LJa4a0NQ==
X-Received: by 2002:adf:f850:0:b0:22e:7ae8:a38f with SMTP id d16-20020adff850000000b0022e7ae8a38fmr4157415wrq.68.1665770666245;
        Fri, 14 Oct 2022 11:04:26 -0700 (PDT)
Received: from planet9.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id g17-20020a05600c001100b003c6bbe910fdsm8950346wmc.9.2022.10.14.11.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 11:04:25 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     sakari.ailus@iki.fi, dave.stevenson@raspberrypi.com,
        jacopo@jmondi.org, paul.j.murphy@intel.com,
        daniele.alessandrelli@intel.com, mchehab@kernel.org,
        linux-media@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/3] media: dt-bindings: imx412: Extend compatible strings
Date:   Fri, 14 Oct 2022 19:04:15 +0100
Message-Id: <20221014180417.3683285-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221014180417.3683285-1-bryan.odonoghue@linaro.org>
References: <20221014180417.3683285-1-bryan.odonoghue@linaro.org>
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
 Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
index 26d1807d0bb6..60dc25ff2b9e 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
@@ -19,7 +19,9 @@ description:
 
 properties:
   compatible:
-    const: sony,imx412
+    enum:
+      - sony,imx412
+      - sony,imx577
   reg:
     description: I2C address
     maxItems: 1
-- 
2.34.1

