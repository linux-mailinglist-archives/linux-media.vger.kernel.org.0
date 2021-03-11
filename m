Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58F9733781A
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 16:41:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234322AbhCKPl0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 10:41:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234241AbhCKPlK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 10:41:10 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F906C061574;
        Thu, 11 Mar 2021 07:41:10 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id c76-20020a1c9a4f0000b029010c94499aedso13484830wme.0;
        Thu, 11 Mar 2021 07:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JAdbjBxh26QNVrsqvgxFW6fvmPfYqMNJOexCayrJvA0=;
        b=uuybCdyj+rOshkXU3o4qNqYMwBcqtV3lj/6PDOQyuRHZ48YZTr9k5oCCOqjBU/c6Z1
         5xgWkzqgYAfI0mJmUDkpKlv/8V4Kc9VsJ1woX20xOOT7hjIs1booPCi8Ub1ksYQm7QB3
         kZft9+79hFe7g0xMDEUKgek+9VHc4l8x26FL0di3BcAbsWrHFL/KdwCj1LgtFrtr5O4e
         0uf7pLSUfedXmF/eifRJB4qEp2aibPOLJ/RMf/KVP2vicuUcny04om5qBWOqitXPbLJ+
         VoIK8gg1NdeLdN7QlvXAiczLFqkNbx75NNwDszOJdOfBXYm3IOW6EfdDJm/n4tDVjMOG
         tu2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JAdbjBxh26QNVrsqvgxFW6fvmPfYqMNJOexCayrJvA0=;
        b=a3TuqWjWhIr9eWNK5nG7bpSBmV3Jt4BAGnV80UgIb/XNWG/IP7D+tP5o6YWbdguCxT
         T9L9YewhKei1V0Os4eD6efXYfPsWKOR0LXXVXrWER0ovdRpkiGFhkINkS8AK2VShRSbe
         ngRd5hs3pI1wOQFBwgKuAyldl9pcU8rWJxGr0n94D9JjCg5BxZzUv7AQCruifPx8vx5F
         sXkzOLuuYZnp3l60vDUgWY67rD4mhVwS3wwLibqZeWcs9wgbCP1qwdeF7N+FKfGC2ew2
         Xue3geP3sPNDDgkQcScjtXT0IR69tS2NTh2bbRwSDnJWe52msn+EAtUrCdCsahabc+Wj
         F+JQ==
X-Gm-Message-State: AOAM530l8OfEckXBGvbzNRmypkDzHhndezTYuK8lZEAkdJlictjL8EP3
        Nh1lAluktdz9+Pl7c7f+rzM=
X-Google-Smtp-Source: ABdhPJx5nbz+p6EpPXuNactxgx8F8NdBvmhgFLIsXilxrXXL05ZdvxkShyrzRVGKm1nAUScJBhLF2Q==
X-Received: by 2002:a1c:6605:: with SMTP id a5mr9029615wmc.85.1615477269074;
        Thu, 11 Mar 2021 07:41:09 -0800 (PST)
Received: from arch-x1c3.. ([2a00:5f00:102:0:b16d:9752:8f38:7d6b])
        by smtp.gmail.com with ESMTPSA id a17sm4008547wmj.9.2021.03.11.07.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 07:41:08 -0800 (PST)
From:   Emil Velikov <emil.l.velikov@gmail.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Nicolas Ferre <nicolas.ferre@microchip.com>
Cc:     emil.l.velikov@gmail.com, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org
Subject: [PATCH v2 06/10] media: dt-bindings: Document SAMA5D4 VDEC bindings
Date:   Thu, 11 Mar 2021 15:40:51 +0000
Message-Id: <20210311154055.3496076-7-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210311154055.3496076-1-emil.l.velikov@gmail.com>
References: <20210311154055.3496076-1-emil.l.velikov@gmail.com>
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
2.30.1

