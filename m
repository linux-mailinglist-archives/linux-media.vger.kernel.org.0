Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C5F3351741
	for <lists+linux-media@lfdr.de>; Thu,  1 Apr 2021 19:41:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234256AbhDARll (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Apr 2021 13:41:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234405AbhDARhJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Apr 2021 13:37:09 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EED32C0045ED;
        Thu,  1 Apr 2021 07:43:53 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id bf3so2251077edb.6;
        Thu, 01 Apr 2021 07:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zwsGjPkGaotb7ZsEBdVviG/LoubldrQow2Hx2iAHbwE=;
        b=YK9lS4PpBN7LGEGrmVF8+znEyHLBPKMqx2R/SKS/iwLgZ5fXdYKxWw6+C5sTRtIcDn
         3zXqJdCda3Lu9rx5y9nvU9/uV3eNxIayG5kPoh6NnMCf/BR/ayCBbvZ/y3Apm0Mbi+nL
         cN9/DhcY6TjrCgSutBEjpzMGFYDXOUAdgJOJ2IefDsRlpFFkp4HjIMBljIa5NJ3L+zpY
         Y342/+xjQ0Rn/LsQqvL5jkEOC4bUGlAZFaDBv5VmUkCEdVfy6OqlfhPnJLVh4//WGfxT
         NF9WGSLJ+UNUjB1UTx4sCD1AEx6z3SO/Zw7FP6SxcB4iaI6uExqR8Lcb1yFGLjC3v3MU
         3iJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zwsGjPkGaotb7ZsEBdVviG/LoubldrQow2Hx2iAHbwE=;
        b=Rs5dhIIbduqG7C70ripkvzyhHcuObH5eRO32UQtfrrR4qzk0lfj+n5n/v5QIwFIuFr
         oHyeVtODH2DcHytuI9OtOCzS3YHD/mgBPdigDVk7L5v1xW5/IC3zJOnXdsNhtkdDBnXF
         +EOd7nz+BEJM3zYCYlOChFww+vV66hYg4aLHa6sDEecWWRjCUnz344W4y5gWYmEQV8YC
         yOLqi8iF8RQZGU59jatsU8vs0joA+ZiiTNaTSfW4EkVWaulL/j0SLezCvwPRD5RGlOvP
         EZbJPoyIm5LwQdvv9GUpxKN0OD7kfOfO1VkZCQ8vXPyAizrIlrHNRdVXDYMTjxybnolF
         gMlg==
X-Gm-Message-State: AOAM530v7rAidV9vDHlwnLMbAmqYaIpVtRABPa4RGBWOtLPSuWWL5zjI
        zmoGPz6m6KUGe0UqGF8IU7xDhhRvS16gXA==
X-Google-Smtp-Source: ABdhPJwBbLjtIbBVsJtEeHpWiTusAcMdb8YSew0NSa1mi5jvshz5skGyCYGE4G/achcpGOpDVB6+HQ==
X-Received: by 2002:a05:6402:31e9:: with SMTP id dy9mr10423951edb.186.1617288232742;
        Thu, 01 Apr 2021 07:43:52 -0700 (PDT)
Received: from arch-x1c3.. (cpc92308-cmbg19-2-0-cust99.5-4.cable.virginm.net. [82.24.248.100])
        by smtp.gmail.com with ESMTPSA id nd36sm2854950ejc.21.2021.04.01.07.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 07:43:52 -0700 (PDT)
From:   Emil Velikov <emil.l.velikov@gmail.com>
To:     kernel@collabora.com, Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Cc:     emil.l.velikov@gmail.com, Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH v4 7/9] media: dt-bindings: Document SAMA5D4 VDEC bindings
Date:   Thu,  1 Apr 2021 15:43:34 +0100
Message-Id: <20210401144336.2495479-8-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210401144336.2495479-1-emil.l.velikov@gmail.com>
References: <20210401144336.2495479-1-emil.l.velikov@gmail.com>
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

