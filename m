Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C916F5A7A9E
	for <lists+linux-media@lfdr.de>; Wed, 31 Aug 2022 11:52:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230204AbiHaJwy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Aug 2022 05:52:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbiHaJwx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Aug 2022 05:52:53 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1CEB9FA8A
        for <linux-media@vger.kernel.org>; Wed, 31 Aug 2022 02:52:51 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id bq23so19189680lfb.7
        for <linux-media@vger.kernel.org>; Wed, 31 Aug 2022 02:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=Uyk5oGC1fzPDhWnjscWkczot63x0+zUlXapFW5zcja8=;
        b=csgYcxIvJ+qr28PXMvoZCwdCVpwnzCPd4XBF4kjsYuwJ49TEt19uoexiIF1NUl7il3
         CwZqVrCabuy66hsmIRTZ30UdVhFednwAiUPSmEF8dbvXI+lS5zXjeaSZsMcEaPhE3b3Q
         nX7NeOFVZymVAFugXvF/I0aBUMOUn+DF5sVh+8rA4gAZ/pSVbjfma4Gtzx9499Qd2JIL
         mlgcjiz+A+GhmlxWSok7AEJZN+WhuLIyExX9R5SEVVjFpY5bOdrXdNQliQMUGnq2XD9Y
         j2fNcu3tQ7jEgjv+q/C/2fD8IHtxvH91NrRmYWRfpmVAh+pluw8pbFgHEee0tSMNSkeM
         ehrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=Uyk5oGC1fzPDhWnjscWkczot63x0+zUlXapFW5zcja8=;
        b=IL6Se4DjtbLZnU06BCSgk2xkxFA/7ZEHnXBTerXLBUcnapcuvNeyBOY7LSE5RFbp6M
         rpeUV0npbM8x+VVaMSnPa4fw1magr1qey5OHTAbsfTClvxnonZ1uWGVU07USD4pHr2ho
         wdgcy0p9Q9WO2WfFDgddLpfAf3N5hmPw+AlD1Bw1GvckUsB+gAmz68bwqyGHeYGXDJnp
         lbKNImvV6cANn27HN9ZZxL8pOk6wO0KxQHYzXJOoHRPAgEQotNwdZOBU8qgoG6botClW
         3mMDy4RA/yGYHKVmJK+Z86evFYESByMIh8R+G+JBEe/sleax9GVLEocCDCA0zAkIK0TJ
         VbgA==
X-Gm-Message-State: ACgBeo3YUzIKnfEUCRUevK6QDEhQwwWquFvCNEM1kaLuWUsmTQyxq7Kz
        vDpqMtfkdCty8XmBsLQKhNW6Zg==
X-Google-Smtp-Source: AA6agR5gWoEHcabqGDQbMH2C5BomNnBn//+phAmXVAAS32g7LKCBzy1zq9/HWP7WbpVJADKBdkCvEg==
X-Received: by 2002:a19:d611:0:b0:492:8e15:ba18 with SMTP id n17-20020a19d611000000b004928e15ba18mr8735305lfg.524.1661939570041;
        Wed, 31 Aug 2022 02:52:50 -0700 (PDT)
Received: from krzk-bin.. (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id n2-20020a05651203e200b0048a757d1303sm1247596lfq.217.2022.08.31.02.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 02:52:49 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] media: dt-bindings: dongwoon,dw9714: convert to dtschema
Date:   Wed, 31 Aug 2022 12:51:56 +0300
Message-Id: <20220831095156.347715-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Convert Dongwoon Anatech DW9714 camera voice coil lens driver to DT
schema and extend the bindings with vcc-supply (already used by driver)
and powerdown-gpios (based on datasheet, not used by the driver).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/media/i2c/dongwoon,dw9714.txt    |  9 ----
 .../bindings/media/i2c/dongwoon,dw9714.yaml   | 47 +++++++++++++++++++
 2 files changed, 47 insertions(+), 9 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/dongwoon,dw9714.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/dongwoon,dw9714.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9714.txt b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9714.txt
deleted file mode 100644
index b88dcdd41def..000000000000
--- a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9714.txt
+++ /dev/null
@@ -1,9 +0,0 @@
-Dongwoon Anatech DW9714 camera voice coil lens driver
-
-DW9174 is a 10-bit DAC with current sink capability. It is intended
-for driving voice coil lenses in camera modules.
-
-Mandatory properties:
-
-- compatible: "dongwoon,dw9714"
-- reg: I²C slave address
diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9714.yaml b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9714.yaml
new file mode 100644
index 000000000000..66229a3dc05d
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9714.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/dongwoon,dw9714.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Dongwoon Anatech DW9714 camera voice coil lens driver
+
+maintainers:
+  - Krzysztof Kozlowski <krzk@kernel.org>
+
+description:
+  DW9174 is a 10-bit DAC with current sink capability. It is intended for
+  driving voice coil lenses in camera modules.
+
+properties:
+  compatible:
+    const: dongwoon,dw9714
+
+  reg:
+    maxItems: 1
+
+  powerdown-gpios:
+    description:
+      XSD pin for shutdown (active low)
+
+  vcc-supply:
+    description: VDD power supply
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera-lens@c {
+            compatible = "dongwoon,dw9714";
+            reg = <0x0c>;
+            vcc-supply = <&reg_csi_1v8>;
+        };
+    };
-- 
2.34.1

