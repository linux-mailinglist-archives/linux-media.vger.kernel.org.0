Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB18543314E
	for <lists+linux-media@lfdr.de>; Tue, 19 Oct 2021 10:43:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234793AbhJSIpy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Oct 2021 04:45:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234784AbhJSIpw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Oct 2021 04:45:52 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4858C06161C;
        Tue, 19 Oct 2021 01:43:39 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id e7so18732153pgk.2;
        Tue, 19 Oct 2021 01:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=XLCQB8Q/RXke9TU/xtNqqD1JtcGEgdBRulA1SQmD/6I=;
        b=DRSVF51W1Tri9tnncgCzpa+Z49xwTTfZLnhUOIj+bacnVoE7kW1MMmaCcqpJCBSraQ
         Y2pSDvmg1jq1/WSJ6KnaXnZmBw0O2+WPozZbIpFK4bH35guQjlZkBIsijMWexemR/yZy
         +U7b0nponUuuCqV8+G3uu2C+6gBw672j0ggUzCvR879aTFby82dmNNiXSvjmeCXga4AH
         Ht3rA5RbyTPmwMt21ggMVeCmfr2/0rzsdXL51TqElp8+Gl4oliDCijymVEV/5UFtzIwV
         eR1O4gEG7ovAZeDJmXZGZ5HPIq92MGo27wkbLOUW39hkpYwVLccUi6PwMvTj1V7xm5ag
         /5AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=XLCQB8Q/RXke9TU/xtNqqD1JtcGEgdBRulA1SQmD/6I=;
        b=w7p3Whiq1/qSea6XfXL35McRhqcyBGp1GMc4xkgbOJKwS3GoDTfv/zV6xpkmmBqrw3
         IIoON2K8mZ6MbNKQ5VdVVcEvueoQ+mEVHiLKUknZ1p2Guu7HrkmbOcuMRuXM/i1IVqmC
         NwifhWz7eyHOT0NzRw3fVQdGYF/qciZ89Y7XDo+fbxlxTqLL6jP7mGtmVpx/6MaYuPbM
         gOq/KgRxnW5gKkIutwk/Bw8UtuIDmubtiisUWLNhY+lMbNOxT6GfMkGeCiD1WVSPfpY5
         0rMv7s4Jec4s9QqpLsICEZ80d79aAxIes9e0Pj7hxMF/BWrJNab2mcEDmo8SLeaG3IJo
         Te2w==
X-Gm-Message-State: AOAM530mmH2IcG7ir2jf0P1IuKhUM+Y4/5HpyBqH6jevWB6Z8506STO6
        nGUR+4y+AKR9zftLYy1KfJM=
X-Google-Smtp-Source: ABdhPJyFWNuUVNFhzSwrdqQ9+DTsjZ/k8QBQ0HEWx0eWfAAqUJI4yEO8p9SsGhCuvM/3QBeQ6N+Twg==
X-Received: by 2002:a63:340c:: with SMTP id b12mr27876611pga.241.1634633019488;
        Tue, 19 Oct 2021 01:43:39 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id c11sm1824716pji.38.2021.10.19.01.43.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Oct 2021 01:43:39 -0700 (PDT)
From:   Dillon Min <dillon.minfei@gmail.com>
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
        devicetree@vger.kernel.org
Subject: [PATCH v6 02/10] media: dt-bindings: media: add document for STM32 DMA2d bindings
Date:   Tue, 19 Oct 2021 16:43:15 +0800
Message-Id: <1634633003-18132-3-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634633003-18132-1-git-send-email-dillon.minfei@gmail.com>
References: <1634633003-18132-1-git-send-email-dillon.minfei@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This adds documentation of device tree bindings for the STM32 DMA2D

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v6: no change.

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

