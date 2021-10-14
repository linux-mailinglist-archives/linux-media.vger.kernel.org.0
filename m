Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E8DF42D6F5
	for <lists+linux-media@lfdr.de>; Thu, 14 Oct 2021 12:25:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230030AbhJNK12 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Oct 2021 06:27:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230126AbhJNK11 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Oct 2021 06:27:27 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46E7EC061753;
        Thu, 14 Oct 2021 03:25:23 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id q19so5070195pfl.4;
        Thu, 14 Oct 2021 03:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=grsvm6Th1rQVjE40kWETBU+q8u5i0DxmvK5v1/VsNWM=;
        b=TyCNHqqdyleHfUGgIVlfVCc7J+d029aFkvyYgUw85HZGtmhDgnyMNOpf21UvL10i0I
         afFgQ65wnmIfquP1wzGvjRQH+q0IU/0ilZXAyZcXj1fVtP4Ni24JA7ShKARXDOj9ataB
         J4uuJxK7k7bscmloxsiGXy8kCh4WaT6cnoCa4NnY/f/holdPsATD+ZdxKZgLx5hbpIrI
         n/QW9Yyh8tC+Fw2ecmyWQzylGflWU1NUxccUSkf2ZVNrBJe/Kwjf81LUnU+44L9BAj6F
         QEouwzywzwDfpiseQv9rXdRwAcncToG6VMmRzfccK7E65FYXIhCm4BiCZruVVs8rUST+
         tGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=grsvm6Th1rQVjE40kWETBU+q8u5i0DxmvK5v1/VsNWM=;
        b=AS7VKu46i5v7dMp2J8mnXugVvsFJd35IGTxXShOF7K3wW7k4WTWKIVGhl8DX2UgCjr
         B2Q7+01saO60kStOMU1Kz0tjbf35qeANnOf5peTrYyhx5penDKn5ehNS8qTGqFqrhzzR
         wKo8uGUrktbSY1/DPTkjDIuhSJy33P2BxoYFYYcBoNH/AdAe6tIk+4J9IXFs6XKyRh79
         iC3vHtbvdtFirZu8qm7o9jw+nVw38/7bfWyxIMmh0MfUUlihlaw2B7o6hLgCOL8/+gyM
         JwV5XoagypYPmFcGB3WX6TQbvAgJQjyZDDM+axVzn4Ykgulh/E7s1HSGjRzrfVUH3ZUH
         GlrA==
X-Gm-Message-State: AOAM531jFlVW2CHr1IDKVS4pVaIO9TE1qxupsBOqAl3sKSsJoMolFifC
        WfeZ9C6bBB4WP5mAkjrq0kQ=
X-Google-Smtp-Source: ABdhPJxtAs2YmoBI0xJq/1cTzKP/gxglyV1dj/dY0MdjCDy2jazjTpG6WkH4i5TVFLrwm5G/SeqZJQ==
X-Received: by 2002:a63:4766:: with SMTP id w38mr3604681pgk.104.1634207122881;
        Thu, 14 Oct 2021 03:25:22 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id ip10sm2105939pjb.40.2021.10.14.03.25.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 Oct 2021 03:25:22 -0700 (PDT)
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
Subject: [PATCH v4 2/8] media: dt-bindings: media: add document for STM32 DMA2d bindings
Date:   Thu, 14 Oct 2021 18:25:00 +0800
Message-Id: <1634207106-7632-3-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634207106-7632-1-git-send-email-dillon.minfei@gmail.com>
References: <1634207106-7632-1-git-send-email-dillon.minfei@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dillon Min <dillon.minfei@gmail.com>

This adds documentation of device tree bindings for the STM32 DMA2D

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v4: no change.

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

