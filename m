Return-Path: <linux-media+bounces-41808-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A00F6B450A3
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 10:00:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDFEBA01AA7
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 08:00:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13F6D2F83CD;
	Fri,  5 Sep 2025 08:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="mNreFVT3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-244107.protonmail.ch (mail-244107.protonmail.ch [109.224.244.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803472F90D5;
	Fri,  5 Sep 2025 08:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757059214; cv=none; b=RAVCbNdX0zncJ13ynKOmz+MF3IJx4SMyWCtKtHnUuKnvkc2TU9VVHO3k3MnX+vdYSpaIC2q1NZZgW7vjA3S8nus4sK5veW4xPvYUSm1I/13yVb4CT3fc0L8w+cfawoEKS+sc3Du2gw+0sp7d5YghdKpcKQJMNGe/O9VaWOG/54s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757059214; c=relaxed/simple;
	bh=nP9rg1wKAkVRusTZ2c0jnkA80hYnpRvR6G4GNRKcI0g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L/osCdCnRaJMyZClfAwQJHY+jTyGrD9MMB0VtHw8RmlLoMS7o1J1oLwTvifDicyEtGk+oCnrqdoB4zBG/3l1MXwxN9sJdHM3ZkSeIJOO+1NsXVzDdkTIH3TKoL5aWYxARMwQZxd/8K4eIy+rvsutFBGQ6swmWWRqcv5/CI//U3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=mNreFVT3; arc=none smtp.client-ip=109.224.244.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail; t=1757059204; x=1757318404;
	bh=uoIYEwoUOKQ8hDvtn9QS/tZ30qGWL076tFQXBcdtxzc=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=mNreFVT3EScWZcD9cyfAIMtnR7+shAr0lJ8IwB95orMmu8m9E6YhFFuTf2HazPK99
	 qtwk/eBlE6SbfTuRtscgCemE35czLfSJDQcynNjZlRX0TeJeKI928xWJUQczIh6oW6
	 rTRAL+2/A3RlOOnUpHBUKzTKOg/+iZ8EFZYen0x6ihgdIkYNBAF95R1j+cuHPjanrc
	 zxED2UK3yfgislgy4DveqTi5uxA/fd/F+noBmeXnzGfOx+YV0RGDbgWBwytotr2/To
	 O3Uz399ui3an/ZwKrkZzjFby6FvzZ0vypeYrmLwTJv4SWM8J0xbNKJLiHoYqjRjzJb
	 waS7+tusvqdow==
X-Pm-Submission-Id: 4cJ8025rK4z2ScWS
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Date: Fri, 05 Sep 2025 09:59:29 +0200
Subject: [PATCH v2 1/4] dt-bindings: leds: add generic LED consumer
 documentation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250905-leds-v2-1-ed8f66f56da8@vinarskis.com>
References: <20250905-leds-v2-0-ed8f66f56da8@vinarskis.com>
In-Reply-To: <20250905-leds-v2-0-ed8f66f56da8@vinarskis.com>
To: Hans de Goede <hansg@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Jean-Jacques Hiblot <jjhiblot@traphandler.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>, 
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Aleksandrs Vinarskis <alex@vinarskis.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3281; i=alex@vinarskis.com;
 h=from:subject:message-id; bh=nP9rg1wKAkVRusTZ2c0jnkA80hYnpRvR6G4GNRKcI0g=;
 b=owGbwMvMwCX2dl3hIv4AZgHG02pJDBm7ZtStcyipULxqtCrez/OU8Vdx2zfGf+xe2qwsv+YTk
 VXGsZC5o5SFQYyLQVZMkaX7z9e0rkVz1zJc1/gGM4eVCWQIAxenAExEsIrhr+C75PnBonH3lHbZ
 cdz86a8XKv5Mf+IsPk/LW0c2+frkGzAyLIza4s339JpWyIMnnXuW7jWSCtz1RFT6xRQfw3lskiV
 +DAA=
X-Developer-Key: i=alex@vinarskis.com; a=openpgp;
 fpr=8E21FAE2D2967BB123303E8C684FD4BA28133815

Introduce common generic led consumer binding, where consumer defines
led(s) by phandle, as opposed to trigger-source binding where the
trigger source is defined in led itself.

Add already used in some schemas 'leds' parameter which expects
phandle-array. Additionally, introduce 'led-names' which could be used
by consumers to map LED devices to their respective functions.

Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
---
 .../devicetree/bindings/leds/leds-consumer.yaml    | 85 ++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-consumer.yaml b/Documentation/devicetree/bindings/leds/leds-consumer.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..077dbe3ad9ff3fa15236b8dd1f448c00271e4810
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-consumer.yaml
@@ -0,0 +1,85 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/leds-consumer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Common leds consumer
+
+maintainers:
+  - Aleksandrs Vinarskis <alex@vinarskis.com>
+
+description:
+  Some LED defined in DT are required by other DT consumers, for example
+  v4l2 subnode may require privacy or flash LED. Unlike trigger-source
+  approach which is typically used as 'soft' binding, referencing LED
+  devices by phandle makes things simpler when 'hard' binding is desired.
+
+  Document LED properties that its consumers may define.
+
+properties:
+  leds:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      A list of LED device(s) required by a particular consumer.
+    items:
+      maxItems: 1
+
+  led-names:
+    description:
+      A list of device name(s). Used to map LED devices to their respective
+      functions, when consumer requires more than one LED.
+
+additionalProperties: true
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/leds/common.h>
+
+    leds {
+        compatible = "gpio-leds";
+
+        privacy_led: privacy-led {
+            color = <LED_COLOR_ID_RED>;
+            default-state = "off";
+            function = LED_FUNCTION_INDICATOR;
+            gpios = <&tlmm 110 GPIO_ACTIVE_HIGH>;
+        };
+    };
+
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      camera@36 {
+        compatible = "ovti,ov02c10";
+        reg = <0x36>;
+
+        reset-gpios = <&tlmm 237 GPIO_ACTIVE_LOW>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&cam_rgb_default>;
+
+        led-names = "privacy-led";
+        leds = <&privacy_led>;
+
+        clocks = <&ov02e10_clk>;
+
+        assigned-clocks = <&ov02e10_clk>;
+        assigned-clock-rates = <19200000>;
+
+        avdd-supply = <&vreg_l7b_2p8>;
+        dvdd-supply = <&vreg_l7b_2p8>;
+        dovdd-supply = <&vreg_cam_1p8>;
+
+        port {
+          ov02e10_ep: endpoint {
+            data-lanes = <1 2>;
+            link-frequencies = /bits/ 64 <400000000>;
+            remote-endpoint = <&csiphy4_ep>;
+          };
+        };
+      };
+    };
+
+...

-- 
2.48.1


