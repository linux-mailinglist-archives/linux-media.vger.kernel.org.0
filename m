Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE4273CE883
	for <lists+linux-media@lfdr.de>; Mon, 19 Jul 2021 19:28:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353114AbhGSQmY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Jul 2021 12:42:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355321AbhGSQgO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Jul 2021 12:36:14 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 370D8C0258C3
        for <linux-media@vger.kernel.org>; Mon, 19 Jul 2021 09:44:41 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id d17so7212908ljq.12
        for <linux-media@vger.kernel.org>; Mon, 19 Jul 2021 10:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=phystech-edu.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SwQ5WIYCU+Iw0FKCHUpemUOKm2/bld2/msmvptg5xQo=;
        b=LS9NBl4p0lof0NUwVXBpRejKAMayY3KAb9qd5S6zm+yblqlquYhOrdUY4SZfQmo4ya
         ay85BuSGLOjWveXYjTDrLRf0vsC2J+ec+hlh6Ol1AWXu0hSEILtRytK+TtdHDLW6IH3q
         a+bRO0I0/XYHqnUstI8Ych1ueWVauJpQvI0/jLJpW7D1xNqTlOSmmIqa6dU0FB1TKf3h
         92kj3574+H97vvNvMNiDoxC43hqhQN34rRwbtbTg2ZMEwoG71fDYgIZY8XtTJr5rDg0W
         S+e1n9sEF8/UY2KFLvHmRGWhbdkxL+B+6A6VFFxzBN+Y64FXtSCkbWJPrzfxsVZ9Q1no
         V4NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SwQ5WIYCU+Iw0FKCHUpemUOKm2/bld2/msmvptg5xQo=;
        b=IDcIjasjuC/ud0jS6ISZ0vq+lEx8FFsJpQ/gCSM4gt10ngvSy7SNf3X7qwyA0CdNcs
         Y3zlojb/5smZJlEUpQYGBzlj0d5HNGoFShaRUqAYDhE7WFm4cREXovU9LskD9sUDh+hK
         lOhTBBr/egUy2Z4JwlnEbYW5uIIYgNvyYcmf//BtImSIzGwC0TO0RgzpsnCVi0WtA+FS
         YeafVkHThTShSW7LKd3lKJSEonUNl0PQXE5kCcRGIR6D+SHzBOq7/XR5pcBkRo17yyLc
         zrdi53O31ft3Pp5PO52Gq1smowygxIQPTY1yFFT4wKwey0KxLko1IH0iraggA/yquSxS
         WMwg==
X-Gm-Message-State: AOAM531xO8Gvob9DkfMWcl3vH0zdjwphmXXj3UjTMMcEvMfTFHOeC8Um
        +/3tnWpUfPBWdP6PThracLO3MtTLo1v0ybxH
X-Google-Smtp-Source: ABdhPJz4RWfEM6/7kxVUqcXSf3tITVQ2PFomqMF6vQ1qfwkGAMyCQoKxRLRNgeJs96WSISiMczhVDQ==
X-Received: by 2002:a2e:9c19:: with SMTP id s25mr23852580lji.478.1626714317299;
        Mon, 19 Jul 2021 10:05:17 -0700 (PDT)
Received: from 192.168.1.3 ([2a00:1370:810e:b7ea:7e3d:4f4b:921e:b1ff])
        by smtp.gmail.com with ESMTPSA id z8sm1330749lfh.119.2021.07.19.10.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 10:05:16 -0700 (PDT)
From:   Viktor Prutyanov <viktor.prutyanov@phystech.edu>
To:     sean@mess.org, mchehab@kernel.org, robh+dt@kernel.org,
        khilman@baylibre.com, narmstrong@baylibre.com
Cc:     jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, rockosov@gmail.com,
        Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Subject: [PATCH v7 1/2] media: rc: meson-ir-tx: document device tree bindings
Date:   Mon, 19 Jul 2021 20:05:05 +0300
Message-Id: <20210719170506.13539-2-viktor.prutyanov@phystech.edu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210719170506.13539-1-viktor.prutyanov@phystech.edu>
References: <20210719170506.13539-1-viktor.prutyanov@phystech.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds binding documentation for the IR transmitter
available in Amlogic Meson SoCs.

Signed-off-by: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
---
 changes in v7:
  - fifo-threshold property removed

 .../bindings/media/amlogic,meson-ir-tx.yaml   | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/amlogic,meson-ir-tx.yaml

diff --git a/Documentation/devicetree/bindings/media/amlogic,meson-ir-tx.yaml b/Documentation/devicetree/bindings/media/amlogic,meson-ir-tx.yaml
new file mode 100644
index 000000000000..4432fea32650
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/amlogic,meson-ir-tx.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/media/amlogic,meson-ir-tx.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Amlogic Meson IR transmitter
+
+maintainers:
+  - Viktor Prutyanov <viktor.prutyanov@phystech.edu>
+
+description: |
+  Some Amlogic SoCs such as A311D and T950D4 have IR transmitter
+  (also called blaster) controller onboard. It is capable of
+  sending IR signals with arbitrary carrier frequency and duty cycle.
+
+properties:
+  compatible:
+    oneOf:
+      - const: amlogic,meson-ir-tx
+      - items:
+          - const: amlogic,meson-g12a-ir-tx
+          - const: amlogic,meson-ir-tx
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: sysclk
+      - const: xtal
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/g12a-clkc.h>
+
+    ir@ff80014c {
+      compatible = "amlogic,meson-g12a-ir-tx", "amlogic,meson-ir-tx";
+      reg = <0xff80014c 0x10>;
+      interrupts = <0 198 IRQ_TYPE_EDGE_RISING>;
+      clocks = <&clkc CLKID_CLK81>, <&xtal>;
+      clock-names = "sysclk", "xtal";
+    };
-- 
2.21.0

