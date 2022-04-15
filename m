Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73A98502946
	for <lists+linux-media@lfdr.de>; Fri, 15 Apr 2022 14:01:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242045AbiDOMDW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Apr 2022 08:03:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353072AbiDOMDO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Apr 2022 08:03:14 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60EEF60076
        for <linux-media@vger.kernel.org>; Fri, 15 Apr 2022 05:00:02 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id r13so10404932wrr.9
        for <linux-media@vger.kernel.org>; Fri, 15 Apr 2022 05:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k3gcIDeCZ4FNN7UJi4DooXXT3wAgGZnORf6hg3bDQ7g=;
        b=Lp2ckp7jsSJgJIE1mesO4GV9GwVxlgCvy9tC/qMN00qmoHDUayeE6iXjaFd4PL1H4o
         kCpAG0Zyiq/eEGQwq9NqhMgKFkkZi33EZjqsc0ZHrhkNcVHbYQ1XbfKJl9kKukuoP6PR
         KLCNWyxwwUocGZzhfVTn0+eWLfmLI8d7I2vQGwJpWVUk/DoeYst+tkvknbZdUFMXf7e8
         DY5HdqhUwq8QucJ/23DQh02talPeXSNAKnEcZ3RbpSebLXKY/s8Xf+HFpegTaYQLNiiu
         6d3aoogsP3rc922yZE/vDYowN7cS1S0rgevYxbk7vK4DqGEKHyx2Blyn0ZlZfOdV8ouO
         JXlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k3gcIDeCZ4FNN7UJi4DooXXT3wAgGZnORf6hg3bDQ7g=;
        b=scPvQKp9lNOjYutGMTjz20rluHvqz4rh1GbwVfcVVXoVmp92a2EV0b+Ye3IRwQulKv
         xg7nNX/0oREbarvh2KOxml5jhy73koFstk3Y1uZZNQoaVsS8O8YwdWywjdnG34nG96n5
         z6sLH6zlgoZoTNn4He1hSLPzY3DkGH38UdI35i4nMlVIWyhfv1oCKpJ+48djSUihj6m+
         IldOHAiaxpFVAlF0lIV8Ym4Tov/Lj2ROAyAVSKrmG79Ul44RjNNaFiHwwXwGiIwFEADA
         oRPocevOeac/2UXgVfQCE9DtERGQcXWfYWaQZt6ELCwqD8HdHPEBMUlpEXVzBpepKVQP
         qbLQ==
X-Gm-Message-State: AOAM5328y0YlIWMWaTHT381kOlAAMVqRtAeW9Yh8Mpn7V+drNZrkrvBD
        SDUN9v7jAGIGi/aOin96CRBt0EBn1Rt/5A==
X-Google-Smtp-Source: ABdhPJxY9aZUe5GtuIDCyEMp5X7G9YR6Qb5XWS264VnZgqy7LkUR00Z1Aju4y/jjt17zDp27fY9Jng==
X-Received: by 2002:a5d:5846:0:b0:204:1a79:f1ab with SMTP id i6-20020a5d5846000000b002041a79f1abmr5285022wrf.520.1650024000953;
        Fri, 15 Apr 2022 05:00:00 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id bg8-20020a05600c3c8800b0038e4c5967besm5328568wmb.3.2022.04.15.04.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Apr 2022 05:00:00 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     sakari.ailus@iki.fi, jacopo@jmondi.org, paul.j.murphy@intel.com,
        daniele.alessandrelli@intel.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     robert.foss@linaro.org, hfink@snap.com, jgrahsl@snap.com,
        dmitry.baryshkov@linaro.org, vladimir.zapolskiy@linaro.org,
        bryan.odonoghue@linaro.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 3/4] media: dt-bindings: imx412: Add regulator descriptions
Date:   Fri, 15 Apr 2022 12:59:53 +0100
Message-Id: <20220415115954.1649217-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220415115954.1649217-1-bryan.odonoghue@linaro.org>
References: <20220415115954.1649217-1-bryan.odonoghue@linaro.org>
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

The imx412 like many I2C camera sensors has three voltage rails which
depending on platform may be necessary to switch power onto directly.

Add in as optional rails so as not to break anything for existing users.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/media/i2c/sony,imx412.yaml       | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
index afcf70947f7e..26d1807d0bb6 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
@@ -32,6 +32,15 @@ properties:
     description: Clock frequency 6MHz, 12MHz, 18MHz, 24MHz or 27MHz
     maxItems: 1
 
+  dovdd-supply:
+    description: Interface power supply.
+
+  avdd-supply:
+    description: Analog power supply.
+
+  dvdd-supply:
+    description: Digital power supply.
+
   reset-gpios:
     description: Reference to the GPIO connected to the XCLR pin, if any.
     maxItems: 1
-- 
2.35.1

