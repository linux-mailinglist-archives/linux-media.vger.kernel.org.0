Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D963C4267D2
	for <lists+linux-media@lfdr.de>; Fri,  8 Oct 2021 12:30:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239851AbhJHKc3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Oct 2021 06:32:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239830AbhJHKc0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Oct 2021 06:32:26 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00F9BC061766;
        Fri,  8 Oct 2021 03:30:30 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id oa12-20020a17090b1bcc00b0019f715462a8so7446017pjb.3;
        Fri, 08 Oct 2021 03:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=GhxWSzDygkgduGqmCbgslgGLjHcbkJEg/Lae/V6IHY0=;
        b=I9p+K6g+mlNqanzGfNB6REjSggHuAEVzLCWQ+CgbD9Sr0X/iV1cHMNOMvMSMWKrUhj
         V6GumUIeD08eSJQ9a83xkWRUPvoony04PzAn7DwVpU1Rl27hbglstsH+hAZZxlKZBScE
         ISNyHA6m2C6zDDQ535m7Jx74kxHKdU0x/Wg56svK4zFF8ds7VImndqlSaEt2IaQJUDVn
         oAxL3uGBUDmjscLE0Kh1+RSgoF2TEhh6SrqsRStw5eSJbguSP+kHcWUtdGjDo0PlJPlw
         +BL06J5l2QbBHzo1aHD4VIJhRwqyZQYDE3GLx8FebD/Tuz1yM4UVl6k5SsrKhqyVLv2K
         7Rhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=GhxWSzDygkgduGqmCbgslgGLjHcbkJEg/Lae/V6IHY0=;
        b=u/dqB0Kv1ZMHYeSg2SNwoEU6h2K0LBReImHVoSkTbT3a9+emcvKE+LDAc9Nrd8VsP1
         We6oJXv4tAlHioRpf8dtHKY5IFVoBuK/9cmGUMGDKI2x/hab5k9+P6farFoinzEpHnkE
         DCBV41kVbbHFa07ODS6Yq2Lgp3w8BEvCs2DOqrv7MfJPzUpryCSt4A5Up42qur02I2c1
         IWT0eyxSAFYVuUrUoIHIlHwcpbyfYXj3h6vk7bv3Bu1v9m45IiLWklavHAUd40MTGA/W
         7m1OdGNJLNVdHDPXrEwgjeiNxiQy8kj21JfSBXVG8V2DL/b7CWQFlYF5xUJi31/4MaKo
         934g==
X-Gm-Message-State: AOAM530mPcawlyJ4OAWBFFj7DZbAq3XW08aEdXXzubZYx3/n9H8IhdLz
        0iAzPvyxenekahxKJqTvTY8=
X-Google-Smtp-Source: ABdhPJy5EUkBZ49hhDMXp55zoJPA1/G/fqsaqt+M6SYCeEQghuoEV95w3mBPQsc3l0QVsTcvrW5AYA==
X-Received: by 2002:a17:90a:ab94:: with SMTP id n20mr11887618pjq.146.1633689029565;
        Fri, 08 Oct 2021 03:30:29 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id y15sm2620151pfa.64.2021.10.08.03.30.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 08 Oct 2021 03:30:29 -0700 (PDT)
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
Subject: [PATCH v3 2/8] media: dt-bindings: media: add document for STM32 DMA2d bindings
Date:   Fri,  8 Oct 2021 18:30:06 +0800
Message-Id: <1633689012-14492-3-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1633689012-14492-1-git-send-email-dillon.minfei@gmail.com>
References: <1633689012-14492-1-git-send-email-dillon.minfei@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dillon Min <dillon.minfei@gmail.com>

This adds documentation of device tree bindings for the STM32 DMA2D

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v3: no change

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

