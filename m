Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE432459505
	for <lists+linux-media@lfdr.de>; Mon, 22 Nov 2021 19:47:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240496AbhKVSuk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Nov 2021 13:50:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240440AbhKVSu3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Nov 2021 13:50:29 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B911AC06175B;
        Mon, 22 Nov 2021 10:47:19 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id y13so81051382edd.13;
        Mon, 22 Nov 2021 10:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A4ae5Bs5ryByKDn+40799WBBmSQ5YSDOpHEJ7DwRPhk=;
        b=aQKe1zew8KzTyZPDYHDfRldGju4RXm6N/NULLgQUkFXJmsrVQcqZvRgy/13a3L9JIV
         +7Q7KC3Wa8f3eXxuQrDQUNPOQtNvQjxp9QKilSv/J1dM0yAIsN4gT3ZTAsu2bxTTdi5m
         psPbelagUacq1NI/ChW2igDsMQuEk3iteOO7wIkiFodt3Yi6pO1IOMCG9KpnkCg89PpE
         KPqvtXM0Ub6Kkd94Z3TenRNYGALPQXl3o36mHSCl3s7L2w0CySaePfM1Ut4f0oaIqZbV
         /8D1j/4jsU3CU8YyXvM3p8zrHK8veTHYEfx4AX22xhL+Baf4ZA0DihRiIK7TvInBUUAD
         KoVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A4ae5Bs5ryByKDn+40799WBBmSQ5YSDOpHEJ7DwRPhk=;
        b=KD7A7fCV1FtFwQlvuHigtJqbLhVz4l+JCs6uatVg0JF21N+VYphgbnmWs78qd8NWQh
         iNpnDwcb8/VNhL7crHmA65t6msAB8DhUcpT0zRTinX7yeUe+0b/scdm1usVa8Q8qdryV
         usHADZzMMfgeoVdmvbzznVPsvoH1yWMhYiwKf3AUAJHUSVAG8XxuITyFR8Gn0YtHph7n
         luNaVNgguRIz6SmV+u9Qk1S4Qk2ggNadWGRf+rP7x7e9/LXFx7QG7EWHk8url8/Jrau4
         Pwl+bBdJzF9948ZgTJswSWOWubjsRH3CEFfJdO/qrsy71ccWVa52yauvTeSTuOfiG+li
         r9/w==
X-Gm-Message-State: AOAM530julLzdkPNE/Y42HTRdCxOB8XTiY8F8gIU963vzoXscWeH7k43
        XOqgbq+3XPizVv6UVfT/0NJE/1FqU8XO2w==
X-Google-Smtp-Source: ABdhPJw234qk+H8u1V4KKQN7BY00PJiFvcfrfhoLFVaBXHGpDNuMEOKtFIDgZuJomIdStFViYyWcuQ==
X-Received: by 2002:a05:6402:169a:: with SMTP id a26mr69251064edv.292.1637606838118;
        Mon, 22 Nov 2021 10:47:18 -0800 (PST)
Received: from kista.localdomain (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id h10sm4512312edr.95.2021.11.22.10.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 10:47:17 -0800 (PST)
From:   Jernej Skrabec <jernej.skrabec@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     ezequiel@vanguardiasur.com.ar, nicolas.dufresne@collabora.com,
        mchehab@kernel.org, robh+dt@kernel.org, mripard@kernel.org,
        wens@csie.org, p.zabel@pengutronix.de, andrzej.p@collabora.com,
        gregkh@linuxfoundation.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 5/7] media: dt-bindings: allwinner: document H6 Hantro G2 binding
Date:   Mon, 22 Nov 2021 19:47:00 +0100
Message-Id: <20211122184702.768341-6-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211122184702.768341-1-jernej.skrabec@gmail.com>
References: <20211122184702.768341-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Allwinner H6 contains older Hantro G2 core, primarly used for VP9 video
decoding. It's unclear for now if HEVC is also supported.

Describe it's binding.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../media/allwinner,sun50i-h6-vpu-g2.yaml     | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun50i-h6-vpu-g2.yaml

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun50i-h6-vpu-g2.yaml b/Documentation/devicetree/bindings/media/allwinner,sun50i-h6-vpu-g2.yaml
new file mode 100644
index 000000000000..24d7bf21499e
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/allwinner,sun50i-h6-vpu-g2.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/media/allwinner,sun50i-h6-vpu-g2.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Hantro G2 VPU codec implemented on Allwinner H6 SoC
+
+maintainers:
+  - Jernej Skrabec <jernej.skrabec@gmail.com>
+
+description:
+  Hantro G2 video decode accelerator present on Allwinner H6 SoC.
+
+properties:
+  compatible:
+    const: allwinner,sun50i-h6-vpu-g2
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Bus Clock
+      - description: Module Clock
+
+  clock-names:
+    items:
+      - const: bus
+      - const: mod
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
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/sun50i-h6-ccu.h>
+    #include <dt-bindings/reset/sun50i-h6-ccu.h>
+
+    video-codec-g2@1c00000 {
+        compatible = "allwinner,sun50i-h6-vpu-g2";
+        reg = <0x01c00000 0x1000>;
+        interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&ccu CLK_BUS_VP9>, <&ccu CLK_VP9>;
+        clock-names = "bus", "mod";
+        resets = <&ccu RST_BUS_VP9>;
+    };
+
+...
-- 
2.34.0

