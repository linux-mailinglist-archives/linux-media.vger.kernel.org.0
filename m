Return-Path: <linux-media+bounces-30584-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AF2A94DF8
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 10:20:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AA9697A5D35
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 08:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6184A20E32B;
	Mon, 21 Apr 2025 08:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XfC71U7D"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8162110;
	Mon, 21 Apr 2025 08:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745223616; cv=none; b=VGlbeA0yhji68Atu+YDXvJkLPNz/bzbkYNn6UEHy4Kgmtc7e54639C/B437ng8B5cGMoEAUXPADoTzr5MJf1woCQRRnNcn6KSQ/Ep5kO0ssH/ufbz1oplXSfaqHJP5C/FXWDZJ2JvuyFm0OfvoYqKRRkb6xWn9yCRZ9qzh5UXo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745223616; c=relaxed/simple;
	bh=Z9CzQaeGzkqPRPlWBkWUdRbBrMnMrSvzj+/0z84P8Uo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=up/Ik21+F2g31r3FM6uPQ+B2J9GD8S0eAiF37SetL2aFy0ewdLRLENDDtWGB3o5RpC+f9Q+hFRvb7bMOsuiU4NtivGWZP6phIxDdmYDKqNxlj4pEQ6OrtLXF+uq3LkMW1m4uF8kwa680uIPWEuozeh0afWgaxtKf33xJPOS0XGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XfC71U7D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 84FF5C4CEEB;
	Mon, 21 Apr 2025 08:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745223616;
	bh=Z9CzQaeGzkqPRPlWBkWUdRbBrMnMrSvzj+/0z84P8Uo=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=XfC71U7Dp2TszuL4yb/fVCS+9qannc1LpaMUQwUmpVWZxGkqWwudQ+gV+mKZzmpKb
	 IPx3zBIFMb1iswS18hMYJRJ3vaefIeJwl1Uv9ru6cBZgUkRr6PhIXb0YKxQY7OviGb
	 rxpVrBxgjyRVKS4ipkN430UEhzNjh9Y29RevQSlh/7U6MWggqhQRMZ6AjK69XW2TYB
	 athomUw/O9/rGPD95rsi0M0p/eoqwFDPmPFwmK4a7+1lHUsGPglBj0acrkF7n9exCj
	 oH/4JGiIqih5Dj7AtwinICyX1auhcQCCzvvhP5SFrDUOpJuIWrZrGZt2CcWGGWCAX2
	 EtE7UthUVW2ww==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A4C7C369AB;
	Mon, 21 Apr 2025 08:20:16 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Mon, 21 Apr 2025 10:20:15 +0200
Subject: [PATCH v4] media: dt-bindings: Convert Analog Devices ad5820 to DT
 schema
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250421-b4-ad5820-dt-yaml-v4-1-cc026ce316c6@ixit.cz>
X-B4-Tracking: v=1; b=H4sIAL//BWgC/23NywrCMBQE0F+RrI3c3CQ0ceV/iIu8ai/4oilBL
 f13U10UocsZODMjy6mnlNl+M7I+Fcp0v9WgthsWOnc7J06xZoaAGqRQ3CvuojYIPA785a4XLhH
 Bt9iKpIBV9+hTS8/v5vFUc0d5uPev70URc/tbQ7AI0irYCW3BGC54dIXigZ407MKbzbjgAtbvC
 1aIprHaBBmgCf9eLl6te1m9tN57HX3j0S9+mqYPmA+rwCEBAAA=
X-Change-ID: 20250314-b4-ad5820-dt-yaml-3220bf2f1e40
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Pavel Machek <pavel@ucw.cz>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4451; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=CF3DZGYBahplVU8yiF0C7k1jZnNIBq7jSEDJSUBVBls=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBoBf+/kvKKdKmDnTex9fGSTvWvmVBjGMz/0Ulji
 A1Oj4fvTg+JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaAX/vwAKCRBgAj/E00kg
 csb/EAC3831AqeWjuqifFw45sS3zES2VZGICEIOIU5VUg3VSj7+wirBHe45I/jGLCS//0lEuZUT
 R5A8JbY8tnc26uT1qgnk90Ntm2BwS5S2+hAu3AgjqPaTNEMGe35d/wcl+e7O4jI+F+hzNKDUF1/
 G0wWRtv9DEU6yA4jSnmTxjMVfnp+LW5zD7L2f9PEJ2+w0t+DHSjWBbcH1hpLLYnX9cJ7oisIY0e
 pAUwK61wmZtR9pRASLdlmvyax8SUiVpAaGsRIqpxlbuZyXh/M5dWZif7pTUMRzeGKoiHPwCOhU2
 pYjI3Yb3XhgBsBOWJZYyR/VC+6UjbbrIWgEP4SH82VUUcKVAESFCgKegBxBodKooOg2LHt5esZJ
 mXVGg2qsfMx2qhTP8op3Jj9NFxpOFScMjp+3j4ZZYf4SCG2rXfyLIEYLnAovhiQ3qKETxIDEzvQ
 YLkR8kCx3OiDlARndylgaZ/9d+F1AJKC3rUPkvHgPnBe3mVhpHpgz4Lp6UWlj2K1VaOqEMFqfD7
 gI4b4dzdP/DQA0sCExey7nfkXnn1a9o3Oc016t3RU+dCU1UWOc27uKa38nS6mbqtx3QI0crrhX2
 fnhYXpexIglQiGUiM21vv+nVGTRYsbwIzEF4qHXi7dPD6vGJt7rTX49HhamDhP4DBb4lpHB/6/j
 67OWoshfU4g9yRg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Convert the Analog Devices ad5820 to DT schema format.

Acked-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
Changes in v4:
- Drop remaining pieces of iio-channel-cells introduced in previous
  revisions.
- Link to v3: https://lore.kernel.org/r/20250414-b4-ad5820-dt-yaml-v3-1-39bbb5db7b2b@ixit.cz

Changes in v3:
- Removed documentation of io-channel-cells property. Now it's 1:1 to
  the original binding. The reference to it from the Nokia N900 dts
  was removed in the -next.
- Link to v2: https://lore.kernel.org/r/20250314-b4-ad5820-dt-yaml-v2-1-287958c3c07c@ixit.cz

Changes in v2:
- added MAINTAINERS entry for the binding
- documented why io-channel-cells got added into the binding.
- dropped io-channel-cells in required properties.
- adjusted example indentation to 4 spaces.
- Link to v1: https://lore.kernel.org/r/20250209203940.159088-1-david@ixit.cz
---
 .../devicetree/bindings/media/i2c/ad5820.txt       | 28 -----------
 .../devicetree/bindings/media/i2c/adi,ad5820.yaml  | 56 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 3 files changed, 57 insertions(+), 28 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/ad5820.txt b/Documentation/devicetree/bindings/media/i2c/ad5820.txt
deleted file mode 100644
index 5764cbedf9b73387ad1bfa9acf99c643f959b84a..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/media/i2c/ad5820.txt
+++ /dev/null
@@ -1,28 +0,0 @@
-* Analog Devices AD5820 autofocus coil
-
-Required Properties:
-
-  - compatible: Must contain one of:
-		- "adi,ad5820"
-		- "adi,ad5821"
-		- "adi,ad5823"
-
-  - reg: I2C slave address
-
-  - VANA-supply: supply of voltage for VANA pin
-
-Optional properties:
-
-   - enable-gpios : GPIO spec for the XSHUTDOWN pin. The XSHUTDOWN signal is
-active low, a high level on the pin enables the device.
-
-Example:
-
-       ad5820: coil@c {
-               compatible = "adi,ad5820";
-               reg = <0x0c>;
-
-               VANA-supply = <&vaux4>;
-               enable-gpios = <&msmgpio 26 GPIO_ACTIVE_HIGH>;
-       };
-
diff --git a/Documentation/devicetree/bindings/media/i2c/adi,ad5820.yaml b/Documentation/devicetree/bindings/media/i2c/adi,ad5820.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..0c8f24f692cac37fc565f3ec770acfc63eecbda4
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/adi,ad5820.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/adi,ad5820.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices AD5820 autofocus coil
+
+maintainers:
+  - Pavel Machek <pavel@ucw.cz>
+
+description:
+  The AD5820 is a current sink driver designed for precise control of
+  voice coil motors (VCMs) in camera autofocus systems.
+
+properties:
+  compatible:
+    enum:
+      - adi,ad5820
+      - adi,ad5821
+      - adi,ad5823
+
+  reg:
+    maxItems: 1
+
+  enable-gpios:
+    maxItems: 1
+    description:
+      GPIO spec for the XSHUTDOWN pin. The XSHUTDOWN signal is active low,
+      a high level on the pin enables the device.
+
+  VANA-supply:
+    description: supply of voltage for VANA pin
+
+required:
+  - compatible
+  - reg
+  - VANA-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        coil@c {
+            compatible = "adi,ad5820";
+            reg = <0x0c>;
+
+            enable-gpios = <&msmgpio 26 GPIO_ACTIVE_HIGH>;
+            VANA-supply = <&vaux4>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 17ed0b5ffdd203db658f9bedb990bd58a3ffcb91..c060a7ca103d2a9252fcb4b2bcd6e1a35d94f2d7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17295,6 +17295,7 @@ M:	Pavel Machek <pavel@kernel.org>
 M:	Sakari Ailus <sakari.ailus@iki.fi>
 L:	linux-media@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/adi,ad5820.yaml
 F:	drivers/media/i2c/ad5820.c
 F:	drivers/media/i2c/et8ek8
 

---
base-commit: bc8aa6cdadcc00862f2b5720e5de2e17f696a081
change-id: 20250314-b4-ad5820-dt-yaml-3220bf2f1e40

Best regards,
-- 
David Heidelberg <david@ixit.cz>



