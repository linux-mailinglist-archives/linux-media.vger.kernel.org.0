Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 979D13C9B69
	for <lists+linux-media@lfdr.de>; Thu, 15 Jul 2021 11:24:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240689AbhGOJ1i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Jul 2021 05:27:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240399AbhGOJ1h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Jul 2021 05:27:37 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B053C06175F;
        Thu, 15 Jul 2021 02:24:44 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id bt15so3428142pjb.2;
        Thu, 15 Jul 2021 02:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=NVfxW8ZqI2b6FGynZRDCjC85/X3SP72iBuprA7dn0yk=;
        b=cqxVqEYX43B/7T7WXlihHK5+RZuvneMPNC0iOr+sZatfSF4DaK5o3DKsDs5lHaHD/+
         aMIjr6abbCLCScIq5qeud3OPkeXbyB1DJTG+L61T7isF+UsXZBAxyQIwuzeV02wGhFTE
         AG4G0FvneBYvp//gT/lQPfyR1ZVEoAafKhzCD2iZFH1ngzjtu/snNxIAjmtAyL+NorKy
         e9P+xzj3Ayo7D4ReAUPmWQcZ3mvbkzOWkRXSzXZIsFzn3cnb+MJz0jeUpuftn7i+Kc/9
         Czpwx/rGSkeRAJ8RKZk17gAMiLmfOW/xu0zY9yHSSUkd/rCAUDTgvwvbvS38ujFTlUAd
         bY0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=NVfxW8ZqI2b6FGynZRDCjC85/X3SP72iBuprA7dn0yk=;
        b=d5Y0W8Fr/U4H7dOmU/fks93O0w+kHnQ6I4YiPBmqbbFvUyj5BEB9wiCLMARAod+1nb
         mMnPrTEh5twLKLekFXDVZKbCb5UxS270KJLpP3XBSmGklFMKoJde/w+3gNhu7yUY9K4v
         bzy4Y0fiufw825KUoIE0RV7Y739F0cmz10ywLFui+cuavvaAXVMgtMTSp2sFYV7MZHqL
         gJQgK/WEg9HeaB4VunjM0VXsA0wvOao8ZuWioaYMgj0JejfFlQpzeT/NVvGcqa0ur4+t
         /CyDKiWX15qAuwEAphXK8MNox/DukRVuRq/Tgy+67LgYVstq9k0FeflgwxN5VcZ7DEJw
         RuEw==
X-Gm-Message-State: AOAM531wszDij2D9FgmdrTUS7lLJFTdTh4BIFgL8C1ralnZhMcor8xm8
        JHL6KDaVSMkf3OwpOxs1EQc=
X-Google-Smtp-Source: ABdhPJxfs/BlYLDiSH1Jn2j7YToE9+PRsqW4+qCtdXdA4zgAUUgY+mVfkljr1SwT48mSN1FvSLetgQ==
X-Received: by 2002:a17:90a:e513:: with SMTP id t19mr3499004pjy.104.1626341084147;
        Thu, 15 Jul 2021 02:24:44 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id 11sm6662503pge.7.2021.07.15.02.24.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Jul 2021 02:24:43 -0700 (PDT)
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
Date:   Thu, 15 Jul 2021 17:24:11 +0800
Message-Id: <1626341068-20253-3-git-send-email-dillon.minfei@gmail.com>
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

