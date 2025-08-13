Return-Path: <linux-media+bounces-39788-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAFEB2465B
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 12:00:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE4B8170DE8
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 09:58:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F6062F6570;
	Wed, 13 Aug 2025 09:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J7p3ld6X"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338C221256E;
	Wed, 13 Aug 2025 09:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755078916; cv=none; b=MVH54yz+yUkh7k1MBORpnOSFQ0G5ScsSNLTwH6nbQGiXgvfU9aBOd8r9mgiYpu1BbV7K1eNVN7DXoQ3QVTJAdI6w1iyZEDEOd2FKXWIjMhBKoyNcL6fR5Tz9JgUalAITLceHVh3dSrD6c3/RreLCAzcusKzIRBsQsjxDBL5TiHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755078916; c=relaxed/simple;
	bh=uFfyp85Y/ZURlINZYrqTyFUELj745HBHUjXdNQ/xIdM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LBE2PLv5xH7V9YdUclzrtMeG5wGKTMobO34By5pqCD7ZWWl5mqj2h/SaEFRfvVe85YTkCFuR6jdavzYZD5C+w2l0OsWEc+oTnDm46XyieJyhOGOj1kS52naQKiLKjujQOvMA+BUhj+9/9pbLnR1Hnukd9W4ekUiYS8Al/goYPKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J7p3ld6X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0B519C4CEF7;
	Wed, 13 Aug 2025 09:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755078916;
	bh=uFfyp85Y/ZURlINZYrqTyFUELj745HBHUjXdNQ/xIdM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=J7p3ld6XCZw79IcBaOd1W6EQQ4/4t6AzL+TWKrY3EJ8nQkHgGINXJs0vpafruOZhP
	 54adpVVI4NCFTmmGfkK2OZkdOQuejutB+50v7yxFICdt/XpLUqBPit3mWrBO3dAWtf
	 LoWT01hn9dwiZLPfcsLK7ONOCVQ/A3iJy/sdw2YuFI8N5EajfiAELtHILiTog64muM
	 IvSAnhUrSalCUsaZDr9EI4iQyB8sn0W1RXSfg/e85tkW++BKY/LU6gfsGSt3gEtn43
	 F5l/YMGykH8U57oBe6kNVWlOICSnLMZnjxDfIaVhW3k/oRgpQ5aZRSbGF91+ywzeNe
	 Tntln05FHLJow==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03715CA0EE0;
	Wed, 13 Aug 2025 09:55:16 +0000 (UTC)
From: Yassine Ouaissa via B4 Relay <devnull+yassine.ouaissa.allegrodvt.com@kernel.org>
Date: Wed, 13 Aug 2025 09:54:54 +0000
Subject: [PATCH v5 2/4] dt-bindings: media: allegro: Add al300 decoder IPs
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-allegro_dvt_al300_dec_driver-v5-2-a312ddebc4d8@allegrodvt.com>
References: <20250813-allegro_dvt_al300_dec_driver-v5-0-a312ddebc4d8@allegrodvt.com>
In-Reply-To: <20250813-allegro_dvt_al300_dec_driver-v5-0-a312ddebc4d8@allegrodvt.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Yassine OUAISSA <yassine.ouaissa@allegrodvt.com>, 
 Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3356;
 i=yassine.ouaissa@allegrodvt.com; h=from:subject:message-id;
 bh=rsZuEr9sLWRzFDAiFsRQC99+L6VlC2Ev66jDkdZLHSM=;
 b=kA0DAAoWwI2tvSK8AZsByyZiAGicYQGgRyxYWA4X6pzXd+7N5k7DPPIWNpl6sXYk7hKu3aLH2
 Ih1BAAWCgAdFiEE8DCl5vQGfEyYhAafwI2tvSK8AZsFAmicYQEACgkQwI2tvSK8AZu8KAEAqE8o
 LX6AJdykZGuk+HMDH9EgWok61fZiHQtrCo1MvRQBAIbIEl6BPsp08PGRe7QZqduSpZrRwgSRGh0
 jRKWU9ksH
X-Developer-Key: i=yassine.ouaissa@allegrodvt.com; a=openpgp;
 fpr=B0CE218FC8E89064DAED6179042F935CFB3AD0CC
X-Endpoint-Received: by B4 Relay for yassine.ouaissa@allegrodvt.com/default
 with auth_id=423
X-Original-From: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
Reply-To: yassine.ouaissa@allegrodvt.com

From: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>

Add a schema for the allegro gen3 video decoder.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
---
 .../bindings/media/allegro,al300-vdec.yaml         | 76 ++++++++++++++++++++++
 MAINTAINERS                                        |  2 +
 2 files changed, 78 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/allegro,al300-vdec.yaml b/Documentation/devicetree/bindings/media/allegro,al300-vdec.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..12e86c306d5578d298ad03a6d59593dd1ddcff9e
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/allegro,al300-vdec.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/allegro,al300-vdec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allegro DVT Video IP Decoder Gen 3
+
+maintainers:
+  - Yassine OUAISSA <yassine.ouaissa@allegrodvt.com>
+
+description:
+  The al300-vdec represents the gen 3 of Allegro DVT IP video
+  decoding technology, offering significant advancements over its
+  predecessors. This new decoder features enhanced processing capabilities
+  with improved throughput and reduced latency.
+
+  Communication between the host driver software and the MCU is implemented
+  through a specialized mailbox interface mechanism. This mailbox system
+  provides a structured channel for exchanging commands, parameters, and
+  status information between the host CPU and the MCU controlling the codec
+  engines.
+
+properties:
+  compatible:
+    const: allegro,al300-vdec
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: top
+      - const: apb
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    description: MCU core clock
+    maxItems: 1
+
+  memory-region:
+    maxItems: 1
+
+  firmware-name:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - clocks
+
+additionalProperties: False
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    axi {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        video-decoder@a0120000 {
+            compatible = "allegro,al300-vdec";
+            reg = <0x00 0xa0120000 0x00 0x10000>, /*VDEC_TOP*/
+                  <0x01 0x80000000 0x00 0x8000>;  /*MCU_APB*/
+            reg-names = "top", "apb";
+            interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&mcu_core_clk>;
+            memory-region = <&vdec_mem>;
+            firmware-name = "al300_vdec.fw";
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 88a76452956eb3b91e7813cbdc16c361f26216a5..532d8a51df9f500767f468935d960b1634139c65 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -819,7 +819,9 @@ M:	Michael Tretter <m.tretter@pengutronix.de>
 R:	Pengutronix Kernel Team <kernel@pengutronix.de>
 L:	linux-media@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/media/allegro,al300-vdec.yaml
 F:	Documentation/devicetree/bindings/media/allegro,al5e.yaml
+F:	drivers/media/platform/allegro-dvt/al300
 F:	drivers/media/platform/allegro-dvt/zynqmp
 
 ALLIED VISION ALVIUM CAMERA DRIVER

-- 
2.30.2



