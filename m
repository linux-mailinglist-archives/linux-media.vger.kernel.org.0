Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 384A03C9BA3
	for <lists+linux-media@lfdr.de>; Thu, 15 Jul 2021 11:26:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241003AbhGOJ2Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Jul 2021 05:28:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241025AbhGOJ2W (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Jul 2021 05:28:22 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62EDFC061760;
        Thu, 15 Jul 2021 02:25:29 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id 70so2086169pgh.2;
        Thu, 15 Jul 2021 02:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=NVfxW8ZqI2b6FGynZRDCjC85/X3SP72iBuprA7dn0yk=;
        b=nCArg6Y5GBwVT9ZDvPkGqZ5CvxqUGieS3zWy2crpHOYEO4/93Ng9bywAQCA4L86GTA
         /fvvFiz0qUlfo+ksmI5E7GjYrttFEq7MkBx3vKb06d693ZCgX9b+JZvSvhQwm5cMrpsa
         PoiHMY7xI4YLTLw40E9tsXfTKpzfWeU+1imTdN6/0ViQUnzQPh/zHKFlHpJQzEVzdKiF
         W8ecuXIeIQlMajyInIx+ksmB95EHkU0AKH1GsnodRCXazLn2NVEWIMowLx8gassonTBG
         yH1nfTVGt2Uj+r5z9hEWtXj0/a/oKYHC9l3H+L8wz3uZ2q8otM5VTKGU0CMDFHe5XmyB
         p//g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=NVfxW8ZqI2b6FGynZRDCjC85/X3SP72iBuprA7dn0yk=;
        b=jwoBROdwx5bsL3ZcEq1Bfir41bbNqJonwEURakyowaIWYSV5YCdAOb2O1IL1u7vVKN
         v3KQWaq0CVCwv6qU281j7Gy/Eq5RXcl+SZsQg/WC6izIH+D0s5LSaT54Iw0Yecpvzaff
         snTnxsmWQ9xTMDjue1mSzEtmuUbROpUU4On1Fkv6Xz6rXMO+hhYY8cOKHNRqdXdsiK/i
         jSK56lC+uCWsj3HdfPAXj/MO78Wj8UYM0y8d7GXrn/sfTuNd20p3b5trt2OyVHTkqYEa
         l6gJXgok/MEzgiTfMKu56SSr+E9VFOQwLmXPZ6NHllUKStHAWSgrmtL7fJJAZ2tLoBcr
         ooKQ==
X-Gm-Message-State: AOAM533PZVXWuq6pZsjCq94f/I37YvF75kRHtFlyFgXc6hukOfdiDoy2
        9h8DknaDGe2UnFUj5cB0bHw=
X-Google-Smtp-Source: ABdhPJwXVfwrx8oDtx85UlTmcZz4HtOMK69vnHiDZNezLJ/XQeeyYFBLM0spQKKfxXe4oxDgFKelkw==
X-Received: by 2002:a62:87c6:0:b029:327:8be4:978e with SMTP id i189-20020a6287c60000b02903278be4978emr3582884pfe.50.1626341128951;
        Thu, 15 Jul 2021 02:25:28 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id 11sm6662503pge.7.2021.07.15.02.25.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Jul 2021 02:25:28 -0700 (PDT)
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
Subject: [PATCH v2 2/9] media: dt-bindings: media: add document for STM32 DMA2d bindings
Date:   Thu, 15 Jul 2021 17:24:21 +0800
Message-Id: <1626341068-20253-13-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1626341068-20253-1-git-send-email-dillon.minfei@gmail.com>
References: <1626341068-20253-1-git-send-email-dillon.minfei@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dillon Min <dillon.minfei@gmail.com>

This adds documentation of device tree bindings for the STM32 DMA2D

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v2: add Reviewed-by tag.

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

