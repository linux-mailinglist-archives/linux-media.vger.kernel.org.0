Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8414C3506BA
	for <lists+linux-media@lfdr.de>; Wed, 31 Mar 2021 20:49:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235346AbhCaStR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Mar 2021 14:49:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235433AbhCaSs7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Mar 2021 14:48:59 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 704CEC061574;
        Wed, 31 Mar 2021 11:48:59 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id b16so23492185eds.7;
        Wed, 31 Mar 2021 11:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zwsGjPkGaotb7ZsEBdVviG/LoubldrQow2Hx2iAHbwE=;
        b=nuTbQS44SiZ/ilMyK5E0QEy0/xYjy6Da3aA/jYRJHeXns1MWjmbuP3G3kFwtcS6kk+
         ngPimMGslCPgY4NLRQodpsGLmuNXL4Iu9gEtdgUQex7qUqp1dZfMJQnG+goX/6UK3V/S
         1amUfL7JKD4F399c9A/yylBSo0JcG08QPkP6bFBF6xqsOQZJm7gKmizUuD8jIm4k83C0
         EkSnn5GXFih+SET1BRwEsiD4Qw0RuWoV0raBIA5H91uo6rpLHQ/+IdMTZrSKFRoZ3LDc
         todXtoP+K8s4HhiPJw/vE6RGgocGhfwRZtGuM2sUurjksuW1yM+GTce/pGGFHoxONxIw
         VIxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zwsGjPkGaotb7ZsEBdVviG/LoubldrQow2Hx2iAHbwE=;
        b=ry2lXdNqPHD+KbD/YHTixiRfUEFJblqESitU60EIbo3Vgs4aitZqc01+o+nMrgKnpA
         +TjQQSV9fxfD5PeLs+zGLd3/jMFND5qGuG9/jFpiXKPlSIb8aCeWrEojdmpljnU/Covg
         XfVxTopNA330y+BTIIervy3iKZYJKcUB2TZZ7izvrF4XQ95+RudITgVAVlB/oHaoTOYr
         KI+5lQqBU5aEZ9AuxsI+7t0sYUqJ95G1ivxvPrIEt73wvRDnJOiaxKC6TyuVG28Nr8Hd
         PieKKmZB+7dnxQkegtZSmojGouMzV2d6kBcV2gHvJ47Ak+5UVfXgKBeJu5cc/t/832m7
         RS6g==
X-Gm-Message-State: AOAM531xl11GiNBzsyAEaaf5gjcvVF9KPYqvkperYBOMwLSWD/M8vCPf
        lw2PoXMTepXuLmIOVKjNGNE=
X-Google-Smtp-Source: ABdhPJz5KvDr5IRskZlPAuATXnfkYJmXkZUFqq6t10+M/p+OV7P8pq9GVYOng7HEEYikFFGxE7jOdQ==
X-Received: by 2002:a05:6402:31e9:: with SMTP id dy9mr5625057edb.186.1617216538172;
        Wed, 31 Mar 2021 11:48:58 -0700 (PDT)
Received: from arch-x1c3.. (cpc92308-cmbg19-2-0-cust99.5-4.cable.virginm.net. [82.24.248.100])
        by smtp.gmail.com with ESMTPSA id r19sm1604127ejr.55.2021.03.31.11.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 11:48:57 -0700 (PDT)
From:   Emil Velikov <emil.l.velikov@gmail.com>
To:     kernel@collabora.com, Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Cc:     emil.l.velikov@gmail.com, Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH v3.5 7/9] media: dt-bindings: Document SAMA5D4 VDEC bindings
Date:   Wed, 31 Mar 2021 19:48:49 +0100
Message-Id: <20210331184849.231221-1-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210331173520.184191-8-emil.l.velikov@gmail.com>
References: <20210331173520.184191-8-emil.l.velikov@gmail.com>
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

v3.5
 - Drop interrupt/clock names (RobH)
---
 .../media/microchip,sama5d4-vdec.yaml         | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/microchip,sama5d4-vdec.yaml

diff --git a/Documentation/devicetree/bindings/media/microchip,sama5d4-vdec.yaml b/Documentation/devicetree/bindings/media/microchip,sama5d4-vdec.yaml
new file mode 100644
index 000000000000..4b77103ca913
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/microchip,sama5d4-vdec.yaml
@@ -0,0 +1,47 @@
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
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
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
+                clocks = <&pmc PMC_TYPE_PERIPHERAL 19>;
+        };
-- 
2.31.1

