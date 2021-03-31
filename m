Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42596350598
	for <lists+linux-media@lfdr.de>; Wed, 31 Mar 2021 19:36:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234557AbhCaRfy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Mar 2021 13:35:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234466AbhCaRfh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Mar 2021 13:35:37 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED960C061574;
        Wed, 31 Mar 2021 10:35:36 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id t5-20020a1c77050000b029010e62cea9deso1580036wmi.0;
        Wed, 31 Mar 2021 10:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=c4cZd+M5f+AeDALoemgsfPAehWaYVnvxwh4uGy+wkOo=;
        b=JIWKVXAkmAJBnseSZM1anFOSAccWbD3fSw/O9Ev/2uz4uizLMQA/T9QkRU2EpG+9VX
         VXCRPZ5IPV+veUsbuCFKFCu1Uqblcr3OazXphTbg+DsI3iMQHBHefjsAEVKMXMQnI6+2
         2XI50ZSXqajmM66UU4xIScEzJE4zuszwko7Or+vzHcawTSEP6S9wt8vi6Q2lskD9hiHL
         +Xo+aaZpO9BFXJIkdHUj8zp3w23NpLBBDfpMLCCnfKfBPMG6LWKxgxtmRZ8VG8exC1oV
         7om1yCf15jeCBBY3l7htmS+dnEY3haan6BQkybkeCKNwdN6GyeK2qHooS60X84/G6kF3
         IsEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c4cZd+M5f+AeDALoemgsfPAehWaYVnvxwh4uGy+wkOo=;
        b=USInlLpj5h6fcgDOhxT+Ejo+L0rPO0a+d2RzDvq0+s79zK2+nIZF1euenFcxxSlYXC
         PUVdvmy1NcedKcN6TMjtx8At40zf7PNbQUSujya6wYlgmkpB52s3D0nNZsDW3wyXTP1W
         xXlcGlw7G0lL1XqQ38D61k0wsHz9vtHEjuBQR9oAUdSHW8r7w+A88hbQwrqITNNoTqHR
         MkcjKRuTg/l1kmCBBq1d0haZ1QNHEcxqjK55dnxysDsYdpaqZn77bnASOf2TXU00mZlN
         v2tT11CWbU08PtJy/YPlGuw/5FFQLxB+q786/1bfVL9YKXXqR9f94KdepvYz7UhP5rqu
         fQfg==
X-Gm-Message-State: AOAM532WUXh69XKQZGGxM7SvC3pMHBJc1WXx/uZ63ztg4O51qb26isGC
        e6+EDgRvQcWZbOy8U7Yhmcy29peb7wu6aA==
X-Google-Smtp-Source: ABdhPJxYoWD58r/igYEN0Jrd0MhzMiw4wIwiTk3CAQbIobPAkZQlgG/9klpTSWowgkhdlnIrgaIjJg==
X-Received: by 2002:a05:600c:2945:: with SMTP id n5mr4179454wmd.78.1617212135727;
        Wed, 31 Mar 2021 10:35:35 -0700 (PDT)
Received: from arch-x1c3.. ([2a00:5f00:102:0:6e1d:cfb9:fb12:552d])
        by smtp.gmail.com with ESMTPSA id 12sm4714200wmw.43.2021.03.31.10.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 10:35:35 -0700 (PDT)
From:   Emil Velikov <emil.l.velikov@gmail.com>
To:     kernel@collabora.com, Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Cc:     emil.l.velikov@gmail.com, Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH v3 7/9] media: dt-bindings: Document SAMA5D4 VDEC bindings
Date:   Wed, 31 Mar 2021 18:35:18 +0100
Message-Id: <20210331173520.184191-8-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210331173520.184191-1-emil.l.velikov@gmail.com>
References: <20210331173520.184191-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Emil Velikov <emil.velikov@collabora.com>

Add devicetree binding documentation for the Hantro G1/G2 VDEC on
the Microchip SAMAS5D4 SoC.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org>
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
v2
 - Newly introduced
 - s/Atmel/Microchip/ (Nicolas)
 - Drop leading 0 in node name/address
---
 .../media/microchip,sama5d4-vdec.yaml         | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/microchip,sama5d4-vdec.yaml

diff --git a/Documentation/devicetree/bindings/media/microchip,sama5d4-vdec.yaml b/Documentation/devicetree/bindings/media/microchip,sama5d4-vdec.yaml
new file mode 100644
index 000000000000..9cb2c0295d54
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/microchip,sama5d4-vdec.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/media/microchip,sama5d4-vdec.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Hantro G1 VPU codec implemented on Microchip SAMA5D4 SoCs
+
+maintainers:
+  - Emil Velikov <emil.velikov@collabora.com>
+
+description:
+  Hantro G1 video decode accelerator present on Microchip SAMA5D4 SoCs.
+
+properties:
+  compatible:
+    const: microchip,sama5d4-vdec
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    items:
+      - const: vdec
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: vdec_clk
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+        #include <dt-bindings/clock/at91.h>
+        #include <dt-bindings/interrupt-controller/irq.h>
+
+        vdec0: vdec@300000 {
+                compatible = "microchip,sama5d4-vdec";
+                reg = <0x00300000 0x100000>;
+                interrupts = <19 IRQ_TYPE_LEVEL_HIGH 4>;
+                interrupt-names = "vdec";
+                clocks = <&pmc PMC_TYPE_PERIPHERAL 19>;
+                clock-names = "vdec_clk";
+        };
-- 
2.31.1

