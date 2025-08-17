Return-Path: <linux-media+bounces-40045-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEDDB29462
	for <lists+linux-media@lfdr.de>; Sun, 17 Aug 2025 19:10:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5B5327A8D22
	for <lists+linux-media@lfdr.de>; Sun, 17 Aug 2025 17:08:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34CF13019B5;
	Sun, 17 Aug 2025 17:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VKdNdwg0"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABA617BB21;
	Sun, 17 Aug 2025 17:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755450584; cv=none; b=Z+GOq+n87LYBafweH8KFNk3sKw0ZBVypU5JUHTuT10/wZNOWFqNlNAGjCS8mH601NkSYUwhiGcEauMrC6FMYqGA1WWkqsN957r33e5B89pzd1QNPWHDbYqbRuXl8kl0JsMkWYfA2HFS3ZPPsZhkMHoslN120ApuZHdUlHYu8ydY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755450584; c=relaxed/simple;
	bh=COo3AY6pdjE+8kF28sRx10wI/ohSiKeJKJJYJqxHSfY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uaRIwXPX4824W5OAf+E4kvxun9r0Tm4lUk4sLNPag3Pq+VkhyFwEPYgJA3P7buM9wqqzgWjzfcd/Z7eLmNE5MUxEFJVv5Ps1o2zOwxJtHQlPMdoNqiKMx8+2pFSqJRWJ6vvtuwg2L5q+9gmLM85CRDoBVjG40OI38nL79KrAefA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VKdNdwg0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 41FF1C4CEF1;
	Sun, 17 Aug 2025 17:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755450584;
	bh=COo3AY6pdjE+8kF28sRx10wI/ohSiKeJKJJYJqxHSfY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VKdNdwg0kYwJZ4jEc8SctlFKMfZWAXkkEbZ/C5pZPZFxQ2j97EczWXN65735TOUdx
	 BbaCCSGa2Odp98m3n0VKQ9AFMgnfu3kY34lvtB+ULnMJlOEu8Y+kksXa9YDbT1hIhR
	 mE3FSsVVgdCP0aEPwXgrS6zeZ5DRZPxPJxfsnRPo3OVPHMfH8XZhceinvg2AuFFKGt
	 oNs24LfGyG6CSUOPwRh9IN4T6G7fInRVn7onGtIiT0aX5IsIRM9IrvhXcQ68lpwr5T
	 URyvQ97QvMes7rAvYVxf2DljppHYyuEK1lJjuAmfHleENRskU0e9yREXGRVl2u79hi
	 cXADonDDxEwVw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BC5DCA0EDC;
	Sun, 17 Aug 2025 17:09:44 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Sun, 17 Aug 2025 19:09:20 +0200
Subject: [PATCH 1/7] dt-bindings: media: i2c: Add DW9718S, DW9719 and
 DW9761 VCM
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250817-dw9719-v1-1-426f46c69a5a@apitzsch.eu>
References: <20250817-dw9719-v1-0-426f46c69a5a@apitzsch.eu>
In-Reply-To: <20250817-dw9719-v1-0-426f46c69a5a@apitzsch.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755450582; l=3802;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=uotT9zX/NyzbQ5ZP2dvOeAvtz2yUFcyTvMlfBKstnHQ=;
 b=H/CLKgAntzvZCcxKzMvVNrEb2+3T4O+GFwO6Oe/DcDOL1te1R7KMaafFTugwXS5sdH2NjG5mL
 3iBwVze/E3UAYwYb5wqfOz7K4eQSS6u7bUW3uz0ZajR3UV+IfI86xdJ
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
 .../bindings/media/i2c/dongwoon,dw9719.yaml        | 115 +++++++++++++++++++++
 1 file changed, 115 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..80fd3fd42327fcafe3ff209d1cd6bbe17b8a211b
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml
@@ -0,0 +1,115 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/dongwoon,dw9719.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Dongwoon Anatech DW9719 Voice Coil Motor (VCM) Controller
+
+maintainers:
+  - devicetree@vger.kernel.org
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
+        dongwoon,sac-mode:
+          default: 4
+        dongwoon,vcm-prescale:
+          description:
+            The final frequency is 10 MHz divided by (value + 2).
+          minimum: 0
+          maximum: 15
+          default: 0
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: dongwoon,dw9719
+    then:
+      properties:
+        dongwoon,sac-mode:
+          default: 4
+        dongwoon,vcm-prescale:
+          default: 96
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: dongwoon,dw9761
+    then:
+      properties:
+        dongwoon,sac-mode:
+          default: 6
+        dongwoon,vcm-prescale:
+          default: 62
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
2.50.1



