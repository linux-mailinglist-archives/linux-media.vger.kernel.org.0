Return-Path: <linux-media+bounces-41942-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BEAB48142
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 01:18:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EFD7B17D53D
	for <lists+linux-media@lfdr.de>; Sun,  7 Sep 2025 23:18:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDEF723183B;
	Sun,  7 Sep 2025 23:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="GIB2EsRh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-106111.protonmail.ch (mail-106111.protonmail.ch [79.135.106.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B3E22D7BF;
	Sun,  7 Sep 2025 23:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757287109; cv=none; b=ghzmV9sGwNrxqE21xK9jUxuZI2UO97EHTBWEt3h8EnvVuYWN7Sq3m8lCv4JhIH4Q8aKMr32+BgtVD69cklG7K93BHl3240+Tb0wge+1oAYzfUbcuBHSBqqickjzTM1q6kqRD0dNkrGdHQXQLikc1P2INt3tpauQ85Eq1muXLDnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757287109; c=relaxed/simple;
	bh=lA2QBNyFzlfroElsH/5o9X8nJsuBowAAhH88dd9l8Ps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bXurf7j4rs52vhi2Xt5yHXb4nirxf7QLCb2FIq4OqgFjXv5vIKiA5lrL+ColbL8jdbWPmPrG45GYxxQWOR9JOsFNogKLnEKrfOvV+xAYptbkYzmX3lfhgfe27OJk8Ta3YIJ9+F1wSHJMSdO0lxjiFfFfhwYbZWV/m6Uyq/TYfck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=GIB2EsRh; arc=none smtp.client-ip=79.135.106.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail; t=1757287098; x=1757546298;
	bh=G5wfHuR5Ni6mkr7vlY10NwZv17+YPvp6/bhVfUx8fmY=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=GIB2EsRhlV8vmBMmFPTgDyzXJbBmWgiPqKkJXpGu6c2W2aqs54JFTXmbFTT4W5b/3
	 tkSCZEKRzYq/EP0dLimaJfO8HD0/KSm4Z1cSO7ljimL9mj/gMG3zWPBHJKpnWMcNsM
	 x9lsW5HZfejdjJrwR4V10n2U5H1fKr8e7JIRSFimCJseh139SivutqbYhmEhBOWstk
	 nNZn6t+TDa2eg3NNQ0DCnHcz2ejeg/5nDQ9iypsunewbJZNtuPvcngpq7VL3hlguhe
	 Pzj/SY5Rgx5p6nl1CrK03+Ci/2A3Pb6Kz9h+2Phi5VGeYV7PIY3O/3PojxLoenG3Rd
	 zApXiK3v5AlMA==
X-Pm-Submission-Id: 4cKmGc3phGz1DF4K
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Date: Mon, 08 Sep 2025 01:18:03 +0200
Subject: [PATCH v3 1/4] dt-bindings: leds: add generic LED consumer
 documentation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-leds-v3-1-5944dc400668@vinarskis.com>
References: <20250908-leds-v3-0-5944dc400668@vinarskis.com>
In-Reply-To: <20250908-leds-v3-0-5944dc400668@vinarskis.com>
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
 linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3355; i=alex@vinarskis.com;
 h=from:subject:message-id; bh=lA2QBNyFzlfroElsH/5o9X8nJsuBowAAhH88dd9l8Ps=;
 b=kA0DAAoW7a5xog9QAxAByyZiAGi+ErWiECneuhqcwXxifTl533t9DXrlE55CDJVNQEWQfuBsg
 4h1BAAWCgAdFiEEi/z1Zoqina0A1yj27a5xog9QAxAFAmi+ErUACgkQ7a5xog9QAxBMvAD9EL04
 Gi4Gqq+jcFyXgmAD3rA80birf0Z3KNzNtbN5gZ0BAN4D1Whrd466mj1N+Gxvs94p42Vh0hPg7ps
 escQgk+IP
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
 .../devicetree/bindings/leds/leds-consumer.yaml    | 89 ++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-consumer.yaml b/Documentation/devicetree/bindings/leds/leds-consumer.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..d50a3850f6336e9e3a52eb1374e36ea50de27f47
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-consumer.yaml
@@ -0,0 +1,89 @@
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
+select: true
+
+properties:
+  leds:
+    oneOf:
+      - type: object
+      - $ref: /schemas/types.yaml#/definitions/phandle-array
+        description:
+          A list of LED device(s) required by a particular consumer.
+        items:
+          maxItems: 1
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
+        leds = <&privacy_led>;
+        led-names = "privacy-led";
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


