Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E49F430F85
	for <lists+linux-media@lfdr.de>; Mon, 18 Oct 2021 07:05:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230170AbhJRFHi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Oct 2021 01:07:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229836AbhJRFHQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Oct 2021 01:07:16 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 680E0C061768;
        Sun, 17 Oct 2021 22:05:06 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id pi19-20020a17090b1e5300b0019fdd3557d3so11631531pjb.5;
        Sun, 17 Oct 2021 22:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=BBVkAXU95swMTOymIvN3DKW/SrSeSsWJKcdFqlq9jRE=;
        b=K+okGNW7jsThWhSkObzkdcVtVqexQ/QDoqHQXEHs17A6RtVCN5hUoLm0cbpjPqxCP3
         AW+1N/0hvQhubLX1SaWGrvWzGWaDYciDFNm4COzZqW8W5mDpSS8Cp3Fj9qS5pEYE8LmT
         xj0RaoILDnjgkf8S5J/2xevJk8uvxE3AhEju5OGwkdwH1bvG+gFWFtUhsmUCBCa/Q2ny
         8Mvu93GwWQJMzpeZ1Nwz9CYTM2mZpXtEacz6/uOY6Kc7E01FveiH4y+rBBE1Yz6SyX6Z
         aRHIr1Cv+jLWqW2GuMbKOPChg9or/ITvL2wc74VzN/+8peAU4bSHaI6kg85GolTQ21/T
         /32A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=BBVkAXU95swMTOymIvN3DKW/SrSeSsWJKcdFqlq9jRE=;
        b=eUkHF7sGSoWiYOJbcBYM5lKckXFSjh5LbvNp71DQvVwKLqBbriN/HUq1aMmhvUC4lI
         Zblmi+tpCOr7frhsumxpQiq+jyUw2dwyji/B3Wez/nEU+EkGNWr6GHRcJ1AtCVcx8vYg
         iuixdg5LWMZOJyn7NLBpC7GspA47n75KrXoVbCJL+vi8E+J2VSLl/24Awwl6sOm6wGwn
         yFdvbSnlj252IPB/5x5LmRHFXpdjixEy4aj0N/BmmNYuX0FeiZBh+lAFpZ82mG0xzP9S
         tChbV0tRAluURi+sE9ZB2AjphV5xea5TAptxEc0/ZiUdVlkmSfyccncSJ3X3MT8f9fox
         KxAw==
X-Gm-Message-State: AOAM533V48XkPxygsQZGRS6sh0RfN9zgKQ4LOLRcH6g6NCWAi/vyk4Z+
        /SDbmFynQPtDNKNQ6FjX+vg=
X-Google-Smtp-Source: ABdhPJy9994iRX2z0dXnHPzRg6CmryHBeRKQP5npN8qTVsjOiPx9cA8aFI05oqYAL/qulcsHhPI5Og==
X-Received: by 2002:a17:90a:bd18:: with SMTP id y24mr46555917pjr.83.1634533505967;
        Sun, 17 Oct 2021 22:05:05 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id c205sm11416625pfc.43.2021.10.17.22.05.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 17 Oct 2021 22:05:04 -0700 (PDT)
From:   dillon.minfei@gmail.com
To:     mchehab@kernel.org, mchehab+huawei@kernel.org,
        hverkuil-cisco@xs4all.nl, ezequiel@collabora.com, gnurou@gmail.com,
        pihsun@chromium.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org, gabriel.fernandez@st.com,
        gabriel.fernandez@foss.st.com
Cc:     patrice.chotard@foss.st.com, hugues.fruchet@foss.st.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Dillon Min <dillon.minfei@gmail.com>
Subject: [PATCH v5 02/10] media: dt-bindings: media: add document for STM32 DMA2d bindings
Date:   Mon, 18 Oct 2021 13:04:40 +0800
Message-Id: <1634533488-25334-3-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634533488-25334-1-git-send-email-dillon.minfei@gmail.com>
References: <1634533488-25334-1-git-send-email-dillon.minfei@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dillon Min <dillon.minfei@gmail.com>

This adds documentation of device tree bindings for the STM32 DMA2D

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v5: no change.

 .../devicetree/bindings/media/st,stm32-dma2d.yaml  | 71 ++++++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/st,stm32-dma2d.yaml

diff --git a/Documentation/devicetree/bindings/media/st,stm32-dma2d.yaml b/Documentation/devicetree/bindings/media/st,stm32-dma2d.yaml
new file mode 100644
index 000000000000..f97b4a246605
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/st,stm32-dma2d.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/st,stm32-dma2d.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STM32 Chrom-Art Accelerator DMA2D binding
+
+description:
+  Chrom-ART Accelerator(DMA2D), graphical hardware accelerator
+  enabling enhanced graphical user interface with minimum CPU load
+
+  It can perform the following operations.
+
+  - Filling a part or the whole of a destination image with a specific color.
+  - Copying a part or the whole of a source image into a part or the whole of
+    a destination image.
+  - Copying a part or the whole of a source image into a part or the whole of
+    a destination image with a pixel format conversion.
+  - Blending a part and/or two complete source images with different pixel
+    format and copy the result into a part or the whole of a destination image
+    with a different color format. (TODO)
+
+
+maintainers:
+  - Dillon Min <dillon.minfei@gmail.com>
+
+properties:
+  compatible:
+    const: st,stm32-dma2d
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
+  clock-names:
+    items:
+      - const: dma2d
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/stm32fx-clock.h>
+    #include <dt-bindings/mfd/stm32f4-rcc.h>
+    dma2d: dma2d@4002b000 {
+        compatible = "st,stm32-dma2d";
+        reg = <0x4002b000 0xc00>;
+        interrupts = <90>;
+        resets = <&rcc STM32F4_AHB1_RESET(DMA2D)>;
+        clocks = <&rcc 0 STM32F4_AHB1_CLOCK(DMA2D)>;
+        clock-names = "dma2d";
+    };
+
+...
-- 
2.7.4

