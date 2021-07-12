Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9C583C64D7
	for <lists+linux-media@lfdr.de>; Mon, 12 Jul 2021 22:17:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234644AbhGLUUl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jul 2021 16:20:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235032AbhGLUUl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jul 2021 16:20:41 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FD7BC0613E9
        for <linux-media@vger.kernel.org>; Mon, 12 Jul 2021 13:17:52 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 141so9722456ljj.2
        for <linux-media@vger.kernel.org>; Mon, 12 Jul 2021 13:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=phystech-edu.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=U0CDq6D7N0uIduUXgU1KLby9trLATxgF6NLRtkqcfuM=;
        b=b9j6bpm8dkpT6PGRro5JvQ75E2UnXlmJEjv9qHRrG0cnFhVWHt17uXVLDX79WHns2M
         vFNbFDvRxHSrWYn8s5Zo1pc3UAhcUzRK6N/14DK2Smt4wjN2IALRaX38mC/cq6DQKAZo
         4MErvB7VMDixK4j3iWqCLt/dLEGJfCEoDa4XR2btOvR/IVFHwCICVF2M63aRZVzKu3Vg
         +ArAtZp2tlwkuXI15PRlSMvgALoQHuuELoD2YfVyWi1LNK9qD05JNSmLFKFhAmdEj8aV
         BHZrpPHB/u/xzafqH1EmQ7LGJjqM6+vfsu298Q360OgsPGX+JBOjKSYahRnzjEfh9cuX
         J9QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U0CDq6D7N0uIduUXgU1KLby9trLATxgF6NLRtkqcfuM=;
        b=Pc8IY/sAAMlX4CcbeDVp0X85xXSzLRNIfANOlWEaHtP0JGL1FnLmuqrFXOZGoMQpJ+
         uJLBFjWpq/nhd/keZFsPq115eOXu7yD4NzQTwOo0E0UDKjGFCJx+1BjbXyYu2roKd1mD
         sNCJJPxjGPV7LnCTqRMO26XGV7zooVjx5GFtSiBs3z+e5vuLFjYuQ3GNaOA8G6BbUrkf
         ztsFdsVE6QQynrLILhdp6i3tsqtN58X5waGqY/QML1mAJvzXWGIW1Ujf3CZLiVPTmYu1
         yzFLrD2uZTJ9Y5mdj94/cGkW877n1XVCPb3X2dNuc+1G/IMUiGKjGwjLk4iUhJxwTEpW
         i/dg==
X-Gm-Message-State: AOAM5334EI0Pygi02j6+25DSjUeCI5C+rGThS4oX5V3Hr6H0DtyRy27X
        /QjBT2dZYRP/qY2q2yjVPIG3ew==
X-Google-Smtp-Source: ABdhPJzTZJoLVgrTDU8np4pWKdsN7tUpSv2u6WjiSIrEaKKmtPzWt9oa3Fxx3P8mEUtgmbxVBl3dWg==
X-Received: by 2002:a2e:86c5:: with SMTP id n5mr769638ljj.433.1626121070334;
        Mon, 12 Jul 2021 13:17:50 -0700 (PDT)
Received: from 192.168.1.3 ([2a00:1370:810e:abfe:9c62:44e3:b0ab:76fd])
        by smtp.gmail.com with ESMTPSA id p16sm631455lfr.122.2021.07.12.13.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 13:17:49 -0700 (PDT)
From:   Viktor Prutyanov <viktor.prutyanov@phystech.edu>
To:     sean@mess.org, mchehab@kernel.org, robh+dt@kernel.org,
        khilman@baylibre.com, narmstrong@baylibre.com
Cc:     jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, rockosov@gmail.com,
        Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Subject: [PATCH v4 1/2] media: rc: meson-ir-tx: document device tree bindings
Date:   Mon, 12 Jul 2021 23:17:31 +0300
Message-Id: <20210712201732.31808-2-viktor.prutyanov@phystech.edu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210712201732.31808-1-viktor.prutyanov@phystech.edu>
References: <20210712201732.31808-1-viktor.prutyanov@phystech.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds binding documentation for the IR transmitter
available in Amlogic Meson SoCs.

Signed-off-by: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
---
 changes in v2:
   - compatible = "amlogic,meson-g12a-irblaster" added
   - clocks, clock-names and mod-clock updated
 changes in v3:
   - mod-clock removed
   - max-fifo-level added
 changes in v4:
   - irblaster -> ir-tx renaming

 .../bindings/media/amlogic,meson-ir-tx.yaml   | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/amlogic,meson-ir-tx.yaml

diff --git a/Documentation/devicetree/bindings/media/amlogic,meson-ir-tx.yaml b/Documentation/devicetree/bindings/media/amlogic,meson-ir-tx.yaml
new file mode 100644
index 000000000000..f9f20e30be2f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/amlogic,meson-ir-tx.yaml
@@ -0,0 +1,65 @@
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
+  max-fifo-level:
+    maxItems: 1
+    description:
+      Maximum IR TX FIFO fill level
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

