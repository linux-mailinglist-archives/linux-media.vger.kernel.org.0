Return-Path: <linux-media+bounces-47639-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1ACC7EE48
	for <lists+linux-media@lfdr.de>; Mon, 24 Nov 2025 04:32:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6384834333A
	for <lists+linux-media@lfdr.de>; Mon, 24 Nov 2025 03:32:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9590D29BDAD;
	Mon, 24 Nov 2025 03:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K2QHG2vg"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA46523BD1B;
	Mon, 24 Nov 2025 03:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763955155; cv=none; b=NW7crtIdZ7QSCVHMekxLQm1VW6svEhesq1xq1B+FAKoTvXg2w6HhVi+XQw924nzJRDVjuZcCozZQ/Q/SQIOruK+rsNNiosJRmIOrkbJSKytcQbBCkSl99hGsM4Qix1KeUwmL1kF1I5Hl21ZHLvaueLJRHw4wOb0GpvdZM2B/WAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763955155; c=relaxed/simple;
	bh=+vUEeQ+oKBW42P4bNYyEWDh9IPPF0c9ajm6FdHUtDgQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B4O5aBMzf12pfP9R/ojN86tEt6iND2y0NUPUcr+736K5SZLf6vAUoZa1ZlxPxYHjE6LKuUnDRkZKndgorLXjY4028zcuwg3SyM5yz1/JZR2qStIbeHk1nEMe2MikHh/ehPGAegzl0sdPaedVcAAGJfumcQ1GCxyGVTPCxDYovwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K2QHG2vg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6B38BC4CEFB;
	Mon, 24 Nov 2025 03:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763955154;
	bh=+vUEeQ+oKBW42P4bNYyEWDh9IPPF0c9ajm6FdHUtDgQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=K2QHG2vgHxz4OUoqZIJnJvp0v3udBmajr5kDfVQaUPleIqOk6iPHRCevoyK/gt2a8
	 HI7TKc0JY7QBIozsVWIqHJQOF/DuzV95nakrdG3s7aurQUXWUFhTH0BUOUhaC25GZ4
	 au6y46lSOnRgFASjFImqu3o6OEsAJOiiJI9nLh49WXR4yHt+KuWt/ZSdPiOWsl6s4f
	 UwtkI14Mopwm4EUmgYM6lxfwza/6uMjz1MzaEuZDOjrx4il2eUsJTpM55NFAlnJGTh
	 /TVYeJBsEdTR46KSui/KfzqFtNlOpvuufI46mAGbzkJhwRgsgSUZXa53sTgjmp1xuH
	 YSwCmI0ELv9ZA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50CD6CFD317;
	Mon, 24 Nov 2025 03:32:34 +0000 (UTC)
From: Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org>
Date: Mon, 24 Nov 2025 11:32:17 +0800
Subject: [PATCH RFC v2 1/3] media: dt-bindings: Add Amlogic V4L2 video
 decoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251124-b4-s4-vdec-upstream-v2-1-bdbbce3f11a6@amlogic.com>
References: <20251124-b4-s4-vdec-upstream-v2-0-bdbbce3f11a6@amlogic.com>
In-Reply-To: <20251124-b4-s4-vdec-upstream-v2-0-bdbbce3f11a6@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763955152; l=2874;
 i=zhentao.guo@amlogic.com; s=20251024; h=from:subject:message-id;
 bh=ojBHIRmTFbfRhSiNqZUE5wWfU7fFlbxeePD+nSCZSVI=;
 b=kGEEn3iGlSSJBNB1XpOPFEICT4DGpDfrFEJEg69bILFh9RhP7d7k5fE+S9k2RsjSPo4YIyogm
 DYyPCIQOM9RA62C8DdE4iCXsXY7/tXicnfpo4P9NNfSKzyGxT68OxzN
X-Developer-Key: i=zhentao.guo@amlogic.com; a=ed25519;
 pk=5yfDKrjreXwcAoEUsdtWafy6YN500upXp/CgtnXjLVU=
X-Endpoint-Received: by B4 Relay for zhentao.guo@amlogic.com/20251024 with
 auth_id=555
X-Original-From: Zhentao Guo <zhentao.guo@amlogic.com>
Reply-To: zhentao.guo@amlogic.com

From: Zhentao Guo <zhentao.guo@amlogic.com>

Describe the initial support for the V4L2 stateless video decoder
driver used with the Amlogic S4 (S805X2) platform.

Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
---
 .../bindings/media/amlogic,s4-vcodec-dec.yaml      | 87 ++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/amlogic,s4-vcodec-dec.yaml b/Documentation/devicetree/bindings/media/amlogic,s4-vcodec-dec.yaml
new file mode 100644
index 000000000000..401a5a32902e
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/amlogic,s4-vcodec-dec.yaml
@@ -0,0 +1,87 @@
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
+description:
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
+      - const: dos
+      - const: dmc
+
+  interrupts:
+    maxItems: 3
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
+      - const: vdec
+      - const: hevc
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
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
+            <0xfe036000 0x20>;
+      amlogic,canvas = <&canvas>;
+      reg-names = "dos",
+                  "dmc";
+      interrupts = <GIC_SPI 91 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 92 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 93 IRQ_TYPE_EDGE_RISING>;
+      clocks = <&clkc_periphs CLKID_DOS>,
+               <&clkc_periphs CLKID_VDEC_SEL>,
+               <&clkc_periphs CLKID_HEVCF_SEL>;
+      clock-names = "vdec",
+                    "clk_vdec_mux",
+                    "clk_hevcf_mux";
+      power-domains = <&pwrc PWRC_S4_DOS_VDEC_ID>,
+                      <&pwrc PWRC_S4_DOS_HEVC_ID>;
+      power-domain-names = "vdec",
+                           "hevc";
+    };

-- 
2.42.0



