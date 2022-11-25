Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D09AF638D76
	for <lists+linux-media@lfdr.de>; Fri, 25 Nov 2022 16:31:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbiKYPbc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Nov 2022 10:31:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbiKYPbb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Nov 2022 10:31:31 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9487025E8A
        for <linux-media@vger.kernel.org>; Fri, 25 Nov 2022 07:31:30 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id i10so11094395ejg.6
        for <linux-media@vger.kernel.org>; Fri, 25 Nov 2022 07:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/3xizgLpKf9eakyGEdImT/fgj0br4xdsRLx7qxrVAJk=;
        b=lUD2Fv7+u3BaFuP7zMy1MvD5Q7ePWKHm4fxwoy9PRTLhn/VDNB5Skeg3bWOlT6m/5s
         F2fIulQ4bAQNqqEEe7eU4Ywo7r34xp76GuQ2NkoCve2b0YgdVS2iuHQzs1UPsXprE6gD
         YBujOZj4ky5CeKX1v9kBfRd/dgIXUThmq9YDc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/3xizgLpKf9eakyGEdImT/fgj0br4xdsRLx7qxrVAJk=;
        b=MUqJUYPmHWqS/Kxbh0NhHflwH/DYNFwHsNzM6nen6J78BPmD5FqsLGQmAe3pk1n6dY
         BgJyw0jhUwwrx1ZDZLRnOHgK8cdl5aq/lEWAETryOXDNCT1fw6iL1bkGsWY7rZGT1WGu
         oj/5xNr7M8QxBmjpkM4gzJF8wBnlD5joPkEJGXSKghGN69y09isJbeGBBUqPXlgqhnBf
         MrH9WynFck+z7XyAlczPGefZk7Fsc2t+2JpOUNfmN+uonGHqsBhENuH+CggtvfEogxrN
         ezK6ohiHH+LRRe8vvjpxICp040wXGV18Zd7qdNE4uhzHcIiw2aXc4eC8MA8OlS7k/sOw
         plyw==
X-Gm-Message-State: ANoB5pmtfF8un4ZuGbiaS12XiLu/MVqs2xJ73o4ShcA9GNrowkiduKuY
        cHE8biXBK2mG/ypJVTZ3lTSDAaPGTOoghg==
X-Google-Smtp-Source: AA0mqf43dwfoXiANWdgy1aNIYfL6xmTo3iEe+IpTC6yTfmDab0WZYwO9i6/1Y3ROrpOzXChJ8HOJgw==
X-Received: by 2002:a17:906:8e0a:b0:7b9:bef6:3eea with SMTP id rx10-20020a1709068e0a00b007b9bef63eeamr11691882ejc.487.1669390288733;
        Fri, 25 Nov 2022 07:31:28 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id p10-20020aa7cc8a000000b0045b4b67156fsm1878435edt.45.2022.11.25.07.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 07:31:28 -0800 (PST)
From:   Petko Manolov <petko.manolov@konsulko.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v1 1/5] DT bindings for imx492
Date:   Fri, 25 Nov 2022 17:31:16 +0200
Message-Id: <20221125153120.541298-2-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221125153120.541298-1-petko.manolov@konsulko.com>
References: <20221125153120.541298-1-petko.manolov@konsulko.com>
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

Here goes the DT bindings file.

Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
---
 .../bindings/media/i2c/sony,imx492.yaml       | 101 ++++++++++++++++++
 1 file changed, 101 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx492.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx492.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx492.yaml
new file mode 100644
index 000000000000..f4feef17c677
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx492.yaml
@@ -0,0 +1,101 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/sony,imx492.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sony imx492 Sensor
+
+maintainers:
+  - Petko Manolov <petko.manolov@konsulko.com>
+
+description:
+
+  imx492 is a diagonal 23.1 mm (Type 1.4) CMOS image sensor with color or
+  monochrome square pixel array and approximately 47.08 M effective pixels.
+  12-bit digital output makes it possible to output the signals with high
+  definition for moving pictures. It is programmable through I2C interface. The
+  I2C client address can be either 0x10 or 0x1a depending on SLASEL pin. Image
+  data is sent through MIPI CSI-2.
+
+properties:
+  compatible:
+    const: sony,imx492
+  reg:
+    description: I2C address
+    maxItems: 1
+
+  assigned-clocks: true
+  assigned-clock-parents: true
+  assigned-clock-rates: true
+
+  clocks:
+    description: Clock frequency 6MHz, 12MHz, 18MHz and 24MHz
+    maxItems: 1
+
+  dovdd-supply:
+    description: Interface power supply.
+
+  avdd-supply:
+    description: Analog power supply.
+
+  dvdd-supply:
+    description: Digital power supply.
+
+  reset-gpios:
+    description: Reference to the GPIO connected to the XCLR pin, if any.
+    maxItems: 1
+
+  port:
+    additionalProperties: false
+    $ref: /schemas/graph.yaml#/$defs/port-base
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes: true
+          link-frequencies: true
+
+        required:
+          - data-lanes
+          - link-frequencies
+
+    required:
+      - endpoint
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera@10 {
+            compatible = "sony,imx492";
+            reg = <0x10>;
+            clocks = <&imx492_clk>;
+
+            assigned-clocks = <&imx492_clk>;
+            assigned-clock-parents = <&imx492_clk_parent>;
+            assigned-clock-rates = <24000000>;
+
+            port {
+                imx492: endpoint {
+                    remote-endpoint = <&cam>;
+                    data-lanes = <1 2 3 4>;
+                    link-frequencies = /bits/ 64 <600000000>;
+                };
+            };
+        };
+    };
+...
-- 
2.30.2

