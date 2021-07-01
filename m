Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57EE83B985B
	for <lists+linux-media@lfdr.de>; Thu,  1 Jul 2021 23:52:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234381AbhGAVyb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Jul 2021 17:54:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234335AbhGAVy0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Jul 2021 17:54:26 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAEB4C061765
        for <linux-media@vger.kernel.org>; Thu,  1 Jul 2021 14:51:55 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id q16so14468492lfr.4
        for <linux-media@vger.kernel.org>; Thu, 01 Jul 2021 14:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=phystech-edu.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n9H2RYUzAxMzTFYa2dyhL6m2ND68O6aW04RdAX2sGhA=;
        b=2E2GLhSab3SSwZCziA849REnaYd7HOMgv/72trOQOqe2WlVPKBwu0Ilzf/1sU6S0n4
         OD5qchiT9lV0bc1nDnwjxhn8srFQRE1Ol+DMWFAKnpgu/J1KQtujpsCn9C2qAiU7hfl/
         QEhUUb1uhY/yf8AAzGZYCa8C+8ujjCaqige5e8sYgvEu1yHrDYF0cgFPyYo9Ue49hgBl
         fiG5uH6KmNytO10UIRgp/XOjrkgLtZk3YN9dFjWrNZ7SXY9Lu1oBNCRYqUhRRodmx3k6
         +UrQlDO+YMgSoPq2zYqTF1FVkbBVJCRHUBKo1Lu1zqxWkQI2U03fSHZQdfA+qiPxhnAc
         DMSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n9H2RYUzAxMzTFYa2dyhL6m2ND68O6aW04RdAX2sGhA=;
        b=oxxHmk7AVnz5BFbbgqNrJQwwX8jbQBLAmvo7VW0JGezNL58BQ4jl3C70kynnVdB7O/
         9trF5McLjshMOUWJ52nIS+jynfO4HU/lwlF/cre90dqLUDjsgPiuUlUZ4/o9ZU5mXEdp
         IXMJhqCu1m3QhGe/1WWg02k9xQiuYB4KDOZCeXp9kxbIqS2UPqFJWGeeqssf0Q/tTyFJ
         QwdxqeqwqJWJpu8MF9dbwpgrtrfT0KTiFqtjJuKHUBLg+fiQl691HD90R45luFZNzhG3
         yHB3IiLaUcVsbxLl1DuJ6Qnl0Kn+N5yPG/UaMp5zJV7lsURuvhWshU8LBigxOPduwqsk
         EV3w==
X-Gm-Message-State: AOAM53238yafTylJaqzqYGzRs8dcznvtIk+c5K37bdJ2jV87Pwmctb2H
        /S38HixJ6RhQwMNl8xQTt4/HBg==
X-Google-Smtp-Source: ABdhPJzLqik42pLlcereFPQvwx8ghkJL/Z//ta6UloEqZjal1FWHgHx7gAzvQ3/CwNp57d/yt3qSaQ==
X-Received: by 2002:a19:c015:: with SMTP id q21mr1284580lff.219.1625176314040;
        Thu, 01 Jul 2021 14:51:54 -0700 (PDT)
Received: from 192.168.1.3 ([2a00:1370:810e:4d3d:fdb7:f150:ee77:eba5])
        by smtp.gmail.com with ESMTPSA id q17sm138623ljp.3.2021.07.01.14.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jul 2021 14:51:53 -0700 (PDT)
From:   Viktor Prutyanov <viktor.prutyanov@phystech.edu>
To:     sean@mess.org, mchehab@kernel.org, robh+dt@kernel.org,
        khilman@baylibre.com, narmstrong@baylibre.com
Cc:     jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, rockosov@gmail.com,
        Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Subject: [PATCH 1/2] media: rc: meson-irblaster: document device tree bindings
Date:   Fri,  2 Jul 2021 00:51:31 +0300
Message-Id: <20210701215132.16317-2-viktor.prutyanov@phystech.edu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210701215132.16317-1-viktor.prutyanov@phystech.edu>
References: <20210701215132.16317-1-viktor.prutyanov@phystech.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds binding documentation for the IR transmitter
available in Amlogic Meson SoCs.

Signed-off-by: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
---
 .../media/amlogic,meson-irblaster.yaml        | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/amlogic,meson-irblaster.yaml

diff --git a/Documentation/devicetree/bindings/media/amlogic,meson-irblaster.yaml b/Documentation/devicetree/bindings/media/amlogic,meson-irblaster.yaml
new file mode 100644
index 000000000000..baecda092a78
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/amlogic,meson-irblaster.yaml
@@ -0,0 +1,63 @@
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
+    const: amlogic,meson-irblaster
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    minItems: 1
+    maxItems: 2
+    items:
+      - const: sysclk
+      - const: xtal
+
+  mod-clock:
+    oneOf:
+      - const: sysclk
+      - const: xtal
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/g12a-clkc.h>
+
+    meson-irblaster@ff80014c {
+      compatible = "amlogic,meson-irblaster";
+      reg = <0xff80014c 0x10>;
+      interrupts = <0 198 IRQ_TYPE_EDGE_RISING>;
+      clocks = <&clkc CLKID_CLK81 &xtal>;
+      clock-names = "sysclk", "xtal";
+      mod-clock = "xtal";
+    };
-- 
2.21.0

