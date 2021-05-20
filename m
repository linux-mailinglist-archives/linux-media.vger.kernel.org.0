Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9343D38ADD9
	for <lists+linux-media@lfdr.de>; Thu, 20 May 2021 14:17:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235553AbhETMS5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 May 2021 08:18:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235450AbhETMSt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 May 2021 08:18:49 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2D4BC07A828;
        Thu, 20 May 2021 04:05:42 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id t21so8830582plo.2;
        Thu, 20 May 2021 04:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=XBy9vet7ecbTieMl5w7ONcl3S+12Ffks8ZHajUtvih4=;
        b=X0HdMz5ZwR9zT2Q8z3IGYnpAH3nk/I9nRl2oFclAbogcoCLk1CobJMr5cU/P/NOLa5
         K2ZDAgiCheDTEHXLpP3Ijky9EFzhg2GOHvjDSFWjzBTjZw1hE+ZPBe9GKe+KUE1bhA5A
         1rQx5lquADoJXygBiqLId5iqY2DOe554IE4Q0vhEeRKzz46Rwb8eow89ytrRXs23vhXq
         PFODefq1UVbzZkkWFeJWA0PM8uWIs8zUF4IS2JS/5U1JzS09E1FVYRrfpFhnnAGxtYs/
         z8qRxM6vTl0faDTzbRNmbEahovudKPlBcJLyFrSQwbINqwDF2gJcZnXIR38quKxH2+vD
         N6/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=XBy9vet7ecbTieMl5w7ONcl3S+12Ffks8ZHajUtvih4=;
        b=VRuyXLQID2QemLXzqX3KEsQU5aDUVGu6JoD2R6hQT3uIQTi1H7c+0eEN2giHWBv8Nt
         tShdNIZzkkHHWv6c711UhyAiFLiF0v0ibzEvPzWs+1WuiFYmwkEwrZBgIi1OHCxJFgHW
         /wV7JzRtFNOzXv2/rDvcysB/bP8lgLIHEkaMWfAz3s44N1fFPy7fC5EjEZJMtPlhmCTZ
         +02IJJg53odMsEkGeE3VsavFFrxtQC0FGsDFxZIX46QA8o9yTTrZa1CoxIv/94lMYp/L
         YEn9io03IDQkeGXydDdqSNkIAKZjz7QrHVoCI30ztfM4t9uHGx3OLkEBBHFvmA5IdhGR
         NJmA==
X-Gm-Message-State: AOAM532/tL4ypDjstQ/WFZhyOtwNeEtfGXBmiXOnGQ/FejGacyAwlM/A
        3bt/ZoivLBADO1PXoqPrjjk=
X-Google-Smtp-Source: ABdhPJx4bbnNZMo/QBlVObti6Fy8xgBBS897VBNNSetxObrcuWvv34rqucpZqtf5HBvS8mfyWi9FQg==
X-Received: by 2002:a17:90a:ab0c:: with SMTP id m12mr4249958pjq.179.1621508742496;
        Thu, 20 May 2021 04:05:42 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id hk15sm5839121pjb.53.2021.05.20.04.05.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 May 2021 04:05:42 -0700 (PDT)
From:   dillon.minfei@gmail.com
To:     mchehab@kernel.org, mchehab+huawei@kernel.org,
        hverkuil-cisco@xs4all.nl, ezequiel@collabora.com, gnurou@gmail.com,
        pihsun@chromium.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org
Cc:     patrice.chotard@foss.st.com, hugues.fruchet@foss.st.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Dillon Min <dillon.minfei@gmail.com>
Subject: [PATCH 2/7] media: dt-bindings: media: add document for STM32 DMA2D bindings
Date:   Thu, 20 May 2021 19:05:22 +0800
Message-Id: <1621508727-24486-3-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1621508727-24486-1-git-send-email-dillon.minfei@gmail.com>
References: <1621508727-24486-1-git-send-email-dillon.minfei@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dillon Min <dillon.minfei@gmail.com>

This adds documentation of device tree bindings for the STM32 DMA2D

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
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

