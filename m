Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2FC23C27DE
	for <lists+linux-media@lfdr.de>; Fri,  9 Jul 2021 18:58:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229841AbhGIRA6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Jul 2021 13:00:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229750AbhGIRA5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Jul 2021 13:00:57 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E558C0613E8
        for <linux-media@vger.kernel.org>; Fri,  9 Jul 2021 09:58:10 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id f30so24549803lfj.1
        for <linux-media@vger.kernel.org>; Fri, 09 Jul 2021 09:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=phystech-edu.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n3cz26qHSCwc2rLWJL4aQ/NbqMK/zt0UOTvUQChL7jo=;
        b=bTgfzISd1HbuqsxfiAosM+S7moL2fCkghg+dY8eRFy1+C0QEl1nosujiaZ+XJJl84S
         ZqhuOlPycRTM6lCl9ehmX+W1QFnbMK/27MI0HI6W6CfoyJeekhGb7we+YzUFeBdlUiQ6
         nrY2jnQTrwkMgok1djyrLfyD7OZlpV5XjqWMBMqoMBspD1WrEm717VkBMzr35HusPghi
         CcFojq1Jqw0a5eQv03V6VoEVUDHRciOuuc+RLA4Y7vBtP5oLOwf11U0aTSaPGLZ6zU14
         uCFTdhe6oLB3YR/6EEaBq1ONocXA7zFRFp94ZaBvaBzwhrP0MdB9hSO1q/OB71eDQ8g8
         FqWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n3cz26qHSCwc2rLWJL4aQ/NbqMK/zt0UOTvUQChL7jo=;
        b=r8R/ntGR0I93uurMu8TtOGIrn/s9T14l0636zWPpmbiL4hfGo2m3CMLcC99FtT4yJQ
         UtpHlh+cJpWN76+76rzWpED9a/3pP1KN02ivRCZw8DTHJnwR66lnCMK/yW7PySLyQFai
         IhqwQyBBSxjp/rZHZDLHCG7icpO05fnJGgrmQ+L20fOHqK/HZzeflYbzi+x/SZNwY9Ac
         5Ncn1FuqtBYvw/c9RWPbYOv+ta0TthV546hqOa/6n6ACYodGfLlTEAA5mkrusPUbsHUN
         czlWuKTGFfN5+pgVGuMpyt2ALz5sbfFFH5NYioaBqwn2MsBjFEJf5iTQr+UqRGCeuh/4
         /flw==
X-Gm-Message-State: AOAM532hV1TW35VMgIZk6nDN90AT8IfEhift7S2HYDW0XH4XpmtDsUuu
        uzelx65VqiXqp+G0OsLmhtrGYw==
X-Google-Smtp-Source: ABdhPJz9VvpTDQBL+U/op1YR9gFF1JBbz7jbMDfOvRt9pYy+Xe2MbIx9mWD2BV+gau/jH/Xk4gBAlg==
X-Received: by 2002:ac2:4d42:: with SMTP id 2mr7893418lfp.465.1625849888699;
        Fri, 09 Jul 2021 09:58:08 -0700 (PDT)
Received: from 192.168.1.3 ([2a00:1370:810e:abfe:9c62:44e3:b0ab:76fd])
        by smtp.gmail.com with ESMTPSA id i130sm504107lfd.304.2021.07.09.09.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 09:58:08 -0700 (PDT)
From:   Viktor Prutyanov <viktor.prutyanov@phystech.edu>
To:     sean@mess.org, mchehab@kernel.org, robh+dt@kernel.org,
        khilman@baylibre.com, narmstrong@baylibre.com
Cc:     jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, rockosov@gmail.com,
        Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Subject: [PATCH v3 1/2] media: rc: meson-irblaster: document device tree bindings
Date:   Fri,  9 Jul 2021 19:57:52 +0300
Message-Id: <20210709165753.29353-2-viktor.prutyanov@phystech.edu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210709165753.29353-1-viktor.prutyanov@phystech.edu>
References: <20210709165753.29353-1-viktor.prutyanov@phystech.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds binding documentation for the IR transmitter
available in Amlogic Meson SoCs.

Signed-off-by: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
---
 changes in v2:
   - compatible = "amlogic,meson-g12a-irblaster" added
   - clocks, clock-names and mod-clock updated
 changes in v3:
   - mod-clock removed
   - max-fifo-level added

 .../media/amlogic,meson-irblaster.yaml        | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/amlogic,meson-irblaster.yaml

diff --git a/Documentation/devicetree/bindings/media/amlogic,meson-irblaster.yaml b/Documentation/devicetree/bindings/media/amlogic,meson-irblaster.yaml
new file mode 100644
index 000000000000..1e10aa0d3a94
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/amlogic,meson-irblaster.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/media/amlogic,meson-irblaster.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Amlogic Meson IR blaster
+
+maintainers:
+  - Viktor Prutyanov <viktor.prutyanov@phystech.edu>
+
+description: |
+  Some Amlogic SoCs such as A311D and T950D4 have IR transmitter
+  (blaster) controller onboard. It is capable of sending IR signals
+  with arbitrary carrier frequency and duty cycle.
+
+properties:
+  compatible:
+    oneOf:
+      - const: amlogic,meson-irblaster
+      - items:
+          - const: amlogic,meson-g12a-irblaster
+          - const: amlogic,meson-irblaster
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: sysclk
+      - const: xtal
+
+  max-fifo-level:
+    maxItems: 1
+    description:
+      Maximum IR blaster FIFO fill level
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/g12a-clkc.h>
+
+    irblaster@ff80014c {
+      compatible = "amlogic,meson-g12a-irblaster", "amlogic,meson-irblaster";
+      reg = <0xff80014c 0x10>;
+      interrupts = <0 198 IRQ_TYPE_EDGE_RISING>;
+      clocks = <&clkc CLKID_CLK81>, <&xtal>;
+      clock-names = "sysclk", "xtal";
+    };
-- 
2.21.0

