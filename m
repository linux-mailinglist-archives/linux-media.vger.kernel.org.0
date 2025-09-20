Return-Path: <linux-media+bounces-42819-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A3DB8C76D
	for <lists+linux-media@lfdr.de>; Sat, 20 Sep 2025 14:04:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CFD6A1BC59F8
	for <lists+linux-media@lfdr.de>; Sat, 20 Sep 2025 12:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48798301705;
	Sat, 20 Sep 2025 12:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OsIZD36d"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866E5239E80;
	Sat, 20 Sep 2025 12:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758369835; cv=none; b=tSjAcnaurHHm6eX4qJ4SiaekVghVjXaWFf5R9U1P42v1DYESVtIYb3TFZEbYG4PIdZWE4nZi7bDX2+0/DwWfCnI5iriFcR2AqE1nwr67lY+6CigMMcLudzZevM4zaNF9cR+Das5ZCz4Cqqxe7kfjq0f+Tt2N9Iff3IPR93BAlRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758369835; c=relaxed/simple;
	bh=aSnqEfZR7zBlehk/04RiUI1LXQvjT7Jncpo1B2RAIeM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r6vzT+DRu9L+Lyz92b+RQx2awNIP9yVCAq8PSYQiw4Ti4p2B5y6yx9Urck4R5frzY1tEU+MC3mDLtwCdEoej39aUtwaksXKmWpTTLoxtDlCyxHlDT4axsWI8mKECZ/j7XfPMU5VXNXHOwD6PMmTDNHjfeFRPkaelp2JX8gEz/n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OsIZD36d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1107EC4CEF9;
	Sat, 20 Sep 2025 12:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758369835;
	bh=aSnqEfZR7zBlehk/04RiUI1LXQvjT7Jncpo1B2RAIeM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OsIZD36dtVQ7BnrDfkD7e8cRxuTgFdM0YH8FWAtxXkmiiZ+6lHevEsZxwCVlrlT7A
	 XC31ceZSdhj07iURTbT7GwAfobBKpacGwRH2ADlVWRaXeD54XILGODhV7nubTjmlI2
	 vCpI+iJ1pjVjcu9AoPfbtmJRCxjhdMqth4gapY4tiZlNipYd1STW7sgm7c3TFHy+ol
	 vYFqDDPCLBNyFpAFKh6iTA4pZKtK1GEe67U+CvKXgm/rEx1Jk4dMvQAmZtph6ppXER
	 MwBuF0n1dyV0U1ymdKdd/4JXxQnZWSpddGw2WlAcQvOzjDMWIEwxp0IKCqYNe59lgo
	 mfBtmfIl5ZMGQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00237CAC5A0;
	Sat, 20 Sep 2025 12:03:54 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Sat, 20 Sep 2025 14:03:40 +0200
Subject: [PATCH v2 1/8] dt-bindings: media: i2c: Add DW9718S, DW9719 and
 DW9761 VCM
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250920-dw9719-v2-1-028cdaa156e5@apitzsch.eu>
References: <20250920-dw9719-v2-0-028cdaa156e5@apitzsch.eu>
In-Reply-To: <20250920-dw9719-v2-0-028cdaa156e5@apitzsch.eu>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Daniel Scally <djrscally@gmail.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Val Packett <val@packett.cool>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758369833; l=3222;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=U1dQCoASOlcgvW2QOaQwioEIZZHAWC+INcxZcas3GAs=;
 b=PMdG/HXDxadTs0WMLWrqDMINslN9CihIzDtrxXagO+jY5yZ3UxNW3OQuj3h8cQLEIz1Mz7B04
 e9TDMKEBI5jAMzvgvC3qwiLJ+34E+MzdjZLFEoWFqnVpPdB04XKVAW1
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: André Apitzsch <git@apitzsch.eu>

Document Dongwoon DW9718S, DW9719 and DW9761 VCM devicetree bindings.

Signed-off-by: André Apitzsch <git@apitzsch.eu>

--

The possible values for sac-mode and vcm-prescale of DW9719 and DW9761
are missing because there is no documentation available.
---
 .../bindings/media/i2c/dongwoon,dw9719.yaml        | 88 ++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..38db0764c0f70ad49295dcddc182b7e100a68b29
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/dongwoon,dw9719.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Dongwoon Anatech DW9719 Voice Coil Motor (VCM) Controller
+
+maintainers:
+  - André Apitzsch <git@apitzsch.eu>
+
+description:
+  The Dongwoon DW9718S/9719/9761 is a single 10-bit digital-to-analog converter
+  with 100 mA output current sink capability, designed for linear control of
+  voice coil motors (VCM) in camera lenses. This chip provides a Smart Actuator
+  Control (SAC) mode intended for driving voice coil lenses in camera modules.
+
+properties:
+  compatible:
+    enum:
+      - dongwoon,dw9718s
+      - dongwoon,dw9719
+      - dongwoon,dw9761
+
+  reg:
+    maxItems: 1
+
+  vdd-supply:
+    description: VDD power supply
+
+  dongwoon,sac-mode:
+    description: |
+      Slew Rate Control mode to use: direct, LSC (Linear Slope Control) or
+      SAC1-SAC6 (Smart Actuator Control).
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum:
+      - 0   # Direct mode
+      - 1   # LSC mode
+      - 2   # SAC1 mode (operation time# 0.32 x Tvib)
+      - 3   # SAC2 mode (operation time# 0.48 x Tvib)
+      - 4   # SAC3 mode (operation time# 0.72 x Tvib)
+      - 5   # SAC4 mode (operation time# 1.20 x Tvib)
+      - 6   # SAC5 mode (operation time# 1.64 x Tvib)
+      - 7   # SAC6 mode (operation time# 1.88 x Tvib)
+    default: 4
+
+  dongwoon,vcm-prescale:
+    description:
+      Indication of VCM switching frequency dividing rate select.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+required:
+  - compatible
+  - reg
+  - vdd-supply
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: dongwoon,dw9718s
+    then:
+      properties:
+        dongwoon,vcm-prescale:
+          description:
+            The final frequency is 10 MHz divided by (value + 2).
+          maximum: 15
+          default: 0
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        actuator@c {
+            compatible = "dongwoon,dw9718s";
+            reg = <0x0c>;
+
+            vdd-supply = <&pm8937_l17>;
+
+            dongwoon,sac-mode = <4>;
+            dongwoon,vcm-prescale = <0>;
+        };
+    };

-- 
2.51.0



