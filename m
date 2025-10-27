Return-Path: <linux-media+bounces-45621-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DB1C0BD82
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 06:44:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7FC914EF4AE
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 05:42:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B372D2D73AB;
	Mon, 27 Oct 2025 05:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uHb5Anzj"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22252D592C;
	Mon, 27 Oct 2025 05:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761543766; cv=none; b=Bs52C319xuIFU0XCHgTqYKVk2tc4qGqCk68q6bUqffBtLG5vK2cMredv6EidX8ZBqmyXYurmaQgFD739Ze9U8HUPVhr4mSipPGXNua9T81OPeVPi6q37+jYnoaWyO1vtaPnqg/dwrNorDhIgIctu9Lgz3DRF6P9kyET+37twkJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761543766; c=relaxed/simple;
	bh=PweeUy2NwsMgn2LJikm5tsV5Zmo3ywbi7PkWHAGYkG0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m3WZsnLDNiXFd5WdGCAlA0v6HsRIOX+FyZv114mCI0wgYuRPZ9Vdq3CLVT4nSdn6/Y66dsUWRd+DfYghpWKV9UKSa3Cuu5i+DqRj8AQRU/Uzzofs1jcHB/gHyAFETWWHAn8CY1DX7RmHUa+tvcoAGXYb8JOiWP07q8WtGkOvfic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uHb5Anzj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9BC93C4CEFD;
	Mon, 27 Oct 2025 05:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761543765;
	bh=PweeUy2NwsMgn2LJikm5tsV5Zmo3ywbi7PkWHAGYkG0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=uHb5Anzj6g1Ux/t6AR41vUDS1pFWdtOsOoh8S6tQHwwegkfbos5zfgJhXKID4jd8S
	 5ry8cMs+9Ln7S5x76tZgrPY7bGE4Id1ZNX7DnZgbhpGZRh/7o/WzuMR5N4nZ+9b9NU
	 oi8j5uKFngtE4b2t25cqUhsd8p36dKnqOgGFmX/lrcQ8Q0mKXhn45mt8pnTtNGUURX
	 FsN7388OhWgEmezsiIlSO7FRhrXqB1Nc7tfPWpNy/ssmhRKJ3SiUr+su/k6nwv0a0c
	 2kHcrVpm7UDK40Rm1U9QjLrq2iDRO0rmLiHEwZnf61LOpFkTFw+BDkJOUfI1OsD4ek
	 hc+RQTJw3/tLQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CF0DCCF9E5;
	Mon, 27 Oct 2025 05:42:45 +0000 (UTC)
From: Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org>
Date: Mon, 27 Oct 2025 13:42:37 +0800
Subject: [PATCH 1/3] dt-bindings: vdec: Add binding document of Amlogic
 decoder accelerator
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-b4-s4-vdec-upstream-v1-1-620401813b5d@amlogic.com>
References: <20251027-b4-s4-vdec-upstream-v1-0-620401813b5d@amlogic.com>
In-Reply-To: <20251027-b4-s4-vdec-upstream-v1-0-620401813b5d@amlogic.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, Zhentao Guo <zhentao.guo@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761543762; l=3064;
 i=zhentao.guo@amlogic.com; s=20251024; h=from:subject:message-id;
 bh=4I4kjGKNVgbgvRiaRIZgfaJAfJMRTwfk0MazCrYq8Ig=;
 b=lldwklcEj40VdSRbhVTiU6cZm4icdJhZPzH/h8OBrm25UcDwWt3vL0HJcXdfyTRg4TABogTuh
 PLXZ9KQDr0kBu4icjoQ41fbZ/zi7287N+2pTMC5vwdnLlL9VuEZR6j7
X-Developer-Key: i=zhentao.guo@amlogic.com; a=ed25519;
 pk=5yfDKrjreXwcAoEUsdtWafy6YN500upXp/CgtnXjLVU=
X-Endpoint-Received: by B4 Relay for zhentao.guo@amlogic.com/20251024 with
 auth_id=555
X-Original-From: Zhentao Guo <zhentao.guo@amlogic.com>
Reply-To: zhentao.guo@amlogic.com

From: Zhentao Guo <zhentao.guo@amlogic.com>

Add dt-binding of the Amlogic hardware decoder accelerator.

Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
---
 .../bindings/media/amlogic,vcodec-dec.yaml         | 96 ++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/amlogic,vcodec-dec.yaml b/Documentation/devicetree/bindings/media/amlogic,vcodec-dec.yaml
new file mode 100644
index 000000000000..6cea8af72639
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/amlogic,vcodec-dec.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2025 Amlogic, Inc. All rights reserved
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/amlogic,vcodec-dec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Video Decode Accelerator
+
+maintainers:
+  - Zhentao Guo <zhentao.guo@amlogic.com>
+
+description: |
+  The Video Decoder Accelerator present on Amlogic SOCs.
+  It supports stateless h264 decoding.
+
+properties:
+  compatible:
+    const: amlogic,s4-vcodec-dec
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: dosbus
+      - const: dmcbus
+
+  interrupts:
+    maxItems: 3
+
+  interrupt-names:
+    items:
+      - const: mailbox_0
+      - const: mailbox_1
+      - const: mailbox_2
+
+  clocks:
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: vdec
+      - const: clk_vdec_mux
+      - const: clk_hevcf_mux
+
+  power-domains:
+    maxItems: 2
+
+  power-domain-names:
+    items:
+      - const: pwrc-vdec
+      - const: pwrc-hevc
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+  - power-domains
+  - power-domain-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/amlogic,s4-pll-clkc.h>
+    #include <dt-bindings/clock/amlogic,s4-peripherals-clkc.h>
+    #include <dt-bindings/power/meson-s4-power.h>
+    video-codec@fe320000 {
+      compatible = "amlogic,s4-vcodec-dec";
+      reg = <0xfe320000 0x10000>,
+            <0xfe036000 0x2000>;
+      reg-names = "dosbus",
+                  "dmcbus";
+      interrupts = <GIC_SPI 91 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 92 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 93 IRQ_TYPE_EDGE_RISING>;
+      interrupt-names = "mailbox_0",
+                        "mailbox_1",
+                        "mailbox_2";
+      clocks = <&clkc_periphs CLKID_DOS>,
+               <&clkc_periphs CLKID_VDEC_SEL>,
+               <&clkc_periphs CLKID_HEVCF_SEL>;
+      clock-names = "vdec",
+                    "clk_vdec_mux",
+                    "clk_hevcf_mux";
+      power-domains = <&pwrc PWRC_S4_DOS_VDEC_ID>,
+                      <&pwrc PWRC_S4_DOS_HEVC_ID>;
+      power-domain-names = "pwrc-vdec",
+                           "pwrc-hevc";
+    };

-- 
2.42.0



