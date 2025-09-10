Return-Path: <linux-media+bounces-42192-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 762CBB514F3
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 13:09:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C69675E0D50
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 11:09:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 313B031C571;
	Wed, 10 Sep 2025 11:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="UQ/maKJE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-43171.protonmail.ch (mail-43171.protonmail.ch [185.70.43.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880AC31984E;
	Wed, 10 Sep 2025 11:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757502485; cv=none; b=AUnumUoT0yk1skqRgIHoGp62Z+ipSps8pNj1lE0kZ6Wq7z8tCqNkjqjz8Utvm/70jKdoK/Q7mIazLkAbw43n6EUug5HiLr7FDdMl7cFGG/wd0AROeHn3vtneRv1S/eu8oli4VQjQ2/eEdrGxl9DN2fqATm1VyU7QWoYnzmGeqIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757502485; c=relaxed/simple;
	bh=SPKWv/JQEXR16HtlqFeEjmqa98wFumTsk9d2ortAgHA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R1/NVMucQuWXmZ828VXPiSjg6U3RMnmKUn6X30tIITAs7bG3X4010wfzChkTsK8VF4kdaPylaLugW9OGUmra3ZWzGFpHK82aAVgtDqPPX+AdUtpqNmYO2Rz6VtCmwCRTyTHeVvwpbF/WybusfN6F7n7sDdVQlmKflPkN/75xcNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=UQ/maKJE; arc=none smtp.client-ip=185.70.43.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail; t=1757502475; x=1757761675;
	bh=RmR4FNIXxGeq68sxf1XR7z8lLSrYJxEP+cVucv58fCI=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=UQ/maKJEQ0HT6tKljQoS8drkmlfLruLP0vaC+Lpb6B6D5xpq2dQ+5VtCERFESuO5r
	 h1T1aGwhXW9LDVKsDL+bHfW+gRWbE3CpB6RU0kHsTOfn3GSg7cxyifE4IoeIApd7fZ
	 EtHjxVKUWPtK2JQxILtVxBUtdC7NSdNPl1XozaD7tbW4lvJQeMg9jTU+k57IzkLGsQ
	 QhBdSg1FgSKqb2gVY4jlu60z7U2z3qiOMN1xZuizBd9SE7cmqpGGLiN6hGbH2LkQrw
	 Osb2CPp/o+TkkeIjA9RLpQJnOVYtQZpCc5EYZgqq/qagVY9zF41+kZnClS+rAJexLu
	 3aqfdcytoFdyA==
X-Pm-Submission-Id: 4cMHwS4cvdz2ScCs
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Date: Wed, 10 Sep 2025 13:07:37 +0200
Subject: [PATCH v4 1/4] dt-bindings: leds: add generic LED consumer
 documentation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-leds-v4-1-1fc320488233@vinarskis.com>
References: <20250910-leds-v4-0-1fc320488233@vinarskis.com>
In-Reply-To: <20250910-leds-v4-0-1fc320488233@vinarskis.com>
To: Hans de Goede <hansg@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Jean-Jacques Hiblot <jjhiblot@traphandler.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Daniel Thompson <danielt@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 threeway@gmail.com, Andy Shevchenko <andy.shevchenko@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2715; i=alex@vinarskis.com;
 h=from:subject:message-id; bh=SPKWv/JQEXR16HtlqFeEjmqa98wFumTsk9d2ortAgHA=;
 b=owGbwMvMwCX2dl3hIv4AZgHG02pJDBkHY1jm7mVcFXhrc6I0ww1N9YXChXNv1WXttdnQYfqlJ
 PbAkd+XOkpZGMS4GGTFFFm6/3xN61o0dy3DdY1vMHNYmUCGMHBxCsBE+F4y/C9f/mhXz9HreSsO
 vjH5fDyzOG5x75OS4oDVXhOOH7zz5LckI0PrweNz8v5UOwVGsHRoH/5vf9ricNXONN/be+0rHvz
 J+MIDAA==
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
 .../devicetree/bindings/leds/leds-consumer.yaml    | 67 ++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-consumer.yaml b/Documentation/devicetree/bindings/leds/leds-consumer.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..045b7a4fcd3bdcfb19a02fe4435b40445c168115
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-consumer.yaml
@@ -0,0 +1,67 @@
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
+      v4l2_node: camera@36 {
+        reg = <0x36>;
+
+        leds = <&privacy_led>;
+        led-names = "privacy-led";
+      };
+    };
+
+...

-- 
2.48.1


