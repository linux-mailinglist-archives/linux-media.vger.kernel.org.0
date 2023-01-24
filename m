Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70B8A679CF9
	for <lists+linux-media@lfdr.de>; Tue, 24 Jan 2023 16:09:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230048AbjAXPJA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Jan 2023 10:09:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233770AbjAXPI6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Jan 2023 10:08:58 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7FD64708B
        for <linux-media@vger.kernel.org>; Tue, 24 Jan 2023 07:08:53 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id r9so14182264wrw.4
        for <linux-media@vger.kernel.org>; Tue, 24 Jan 2023 07:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZWSkBcEvUUJYQkZL5RaKa66bmqwU95+71Vniuwzz4y4=;
        b=bbRni7LS+qbzaxcnKqCpzqQ73zyeUMYPRkqLZeP5Eoz5rkCWPQNzvSMz+jIb2ruIVn
         61IzWFzeuKCUkqTIsdFsiQfXBqhtyMBycOiTeazw5VFuUNu5/aLreXw/69icZQEmUft+
         1oGZczanqjsazheuY7mDfZMtVWq7ji1zOkB+muD/J6P2ar0sRBzSgF0EUPkhzd8dkx7M
         1OYK4oAxtwbKo42iR41ZRfoyHTn209HcOyV/3O66eeDPtiV0FHKwSAjLdVYG1gAN6g2+
         F/yZ7rSQFzJFF0yaGiFeNNGxRX/etOVu7VnGeB4djHWMfM6Hp+9EhkkWmlIE1LbF6PxY
         esSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZWSkBcEvUUJYQkZL5RaKa66bmqwU95+71Vniuwzz4y4=;
        b=3a9YTx2UrB/+68GxOr2xJTbXsh7dUWReiv80Y68PfuPhjekCz51G4ZqJ6t3YoWE4Es
         nlHMhFZ8sgg0oU5lUn3NfNgGN2hDH3dF7Dwvdg38CNYQNBD+ZuOsXeYutH38SvpGy36K
         FPH9LJ8fgMFfvMuHAiJr5qOj3WCzBdYeo0e6iXMgiflBxGdJP+zACOVelRKLB9nYOZzt
         77DsomkWdvgU6Pd9Akgjl+Jv//cmqOtdg3vmV3mcAUPuAeGghU4PG5TLtGZsCBuCDQfZ
         WBrr4XGotG9RicZCMxQY4JWN0mXA5u+NKZoX9MFg2ef5uio+MBUEDuF5nxmg8c83et1a
         1E5g==
X-Gm-Message-State: AO0yUKXFd2r3Vqo3Ppk12T+ieIplj5W1jR8IFtH/4/P0N/SctVGWWco8
        9aE3BwVDuoyT7kSzOnffiO9ag5qZG6VBzmZ/xmU=
X-Google-Smtp-Source: AK7set/fcMxC8cDiL6yasQT0tMnrlvJa7ZhDJShkvS7p9CtXDJVPLR8u9yLD5kS24PXM4LkZXiH+sA==
X-Received: by 2002:a5d:6a03:0:b0:2bf:b4ab:e82e with SMTP id m3-20020a5d6a03000000b002bfb4abe82emr851606wru.66.1674572930066;
        Tue, 24 Jan 2023 07:08:50 -0800 (PST)
Received: from localhost.localdomain ([93.93.133.154])
        by smtp.gmail.com with ESMTPSA id a3-20020adff7c3000000b002bdc3f5945dsm2053769wrq.89.2023.01.24.07.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 07:08:49 -0800 (PST)
From:   Naushir Patuck <naush@raspberrypi.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Naushir Patuck <naush@raspberrypi.com>
Subject: [PATCH v1 1/2] dtbindings: media: i2c: Add IMX708 CMOS sensor binding
Date:   Tue, 24 Jan 2023 15:05:46 +0000
Message-Id: <20230124150546.12876-2-naush@raspberrypi.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230124150546.12876-1-naush@raspberrypi.com>
References: <20230124150546.12876-1-naush@raspberrypi.com>
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

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

Add YAML devicetree binding for IMX708 CMOS image sensor.
Let's also add a MAINTAINERS entry for the binding and driver.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
---
 .../devicetree/bindings/media/i2c/imx708.yaml | 119 ++++++++++++++++++
 MAINTAINERS                                   |   7 ++
 2 files changed, 126 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/imx708.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/imx708.yaml b/Documentation/devicetree/bindings/media/i2c/imx708.yaml
new file mode 100644
index 000000000000..db1331951fce
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/imx708.yaml
@@ -0,0 +1,119 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/imx708.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sony 1/2.3-Inch 12Mpixel CMOS Digital Image Sensor
+
+maintainers:
+  - Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
+
+description: |-
+  The Sony IMX708 is a 1/2.3-inch CMOS active pixel digital image sensor
+  with an active array size of 4608H x 2592V. It is programmable through
+  I2C interface. The I2C address is fixed to 0x1A as per sensor data sheet.
+  Image data is sent through MIPI CSI-2, which is configured as either 2 or
+  4 data lanes.
+
+properties:
+  compatible:
+    const: sony,imx708
+
+  reg:
+    description: I2C device address
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  VDIG-supply:
+    description:
+      Digital I/O voltage supply, 1.1 volts
+
+  VANA1-supply:
+    description:
+      Analog1 voltage supply, 2.8 volts
+
+  VANA2-supply:
+    description:
+      Analog2 voltage supply, 1.8 volts
+
+  VDDL-supply:
+    description:
+      Digital core voltage supply, 1.8 volts
+
+  reset-gpios:
+    description: |-
+      Reference to the GPIO connected to the xclr pin, if any.
+      Must be released (set high) after all supplies and INCK are applied.
+
+  # See ../video-interfaces.txt for more details
+  port:
+    type: object
+    properties:
+      endpoint:
+        type: object
+        properties:
+          data-lanes:
+            description: |-
+              The sensor supports either two-lane, or four-lane operation.
+              For two-lane operation the property must be set to <1 2>.
+            items:
+              - const: 1
+              - const: 2
+
+          clock-noncontinuous:
+            type: boolean
+            description: |-
+              MIPI CSI-2 clock is non-continuous if this property is present,
+              otherwise it's continuous.
+
+          link-frequencies:
+            allOf:
+              - $ref: /schemas/types.yaml#/definitions/uint64-array
+            description:
+              Allowed data bus frequencies.
+
+        required:
+          - link-frequencies
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - VANA1-supply
+  - VANA2-supply
+  - VDIG-supply
+  - VDDL-supply
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
+        imx708: sensor@1a {
+            compatible = "sony,imx708";
+            reg = <0x1a>;
+            clocks = <&imx708_clk>;
+            VANA1-supply = <&imx708_vana1>; /* 1.8v */
+            VANA2-supply = <&imx708_vana2>; /* 2.8v */
+            VDIG-supply = <&imx708_vdig>;   /* 1.1v */
+            VDDL-supply = <&imx708_vddl>;   /* 1.8v */
+
+            port {
+                imx708_0: endpoint {
+                    remote-endpoint = <&csi1_ep>;
+                    data-lanes = <1 2>;
+                    clock-noncontinuous;
+                    link-frequencies = /bits/ 64 <450000000>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index f1c9aa89f6a4..7edeed53de4e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19503,6 +19503,13 @@ T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
 F:	drivers/media/i2c/imx412.c
 
+M:	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/devicetree/bindings/media/i2c/imx708.yaml
+F:	drivers/media/i2c/imx708.c
+
 SONY MEMORYSTICK SUBSYSTEM
 M:	Maxim Levitsky <maximlevitsky@gmail.com>
 M:	Alex Dubov <oakad@yahoo.com>
-- 
2.25.1

