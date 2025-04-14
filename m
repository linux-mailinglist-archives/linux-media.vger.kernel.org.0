Return-Path: <linux-media+bounces-30188-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D79A887F1
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 18:04:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A4937177741
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 16:04:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAAEB27B4EB;
	Mon, 14 Apr 2025 16:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IbeetVoX"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F6A19992D;
	Mon, 14 Apr 2025 16:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744646643; cv=none; b=DSf7piAuIm+SGNmKaOw7QNo7ZYMcpsKkm1E8cgdIhtGw/ABzjSEY40+W4A69AGOrMqTlt+xD2H4ddVTzS1+yRYtoXo960EiwTI8dpuSFTABdLMmitaQQ9wDiyOH/3iDDvf5XoyPqdAPMIEnSIAi6p5i50+WiCRJtOkZvR5ROQU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744646643; c=relaxed/simple;
	bh=orKoB/QPGzojKkdDpkIIMZGWYRyu+xOxcNOpDM0H3h8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rV4lvEsxSW2SAZ0db+mFDYMkvQoY1dRrfb5PkIBou06Bgq1XuXwY4a2S7eFQJE6iPmAkMFy7rZNO/fxyd7tEdD0hLpk6VXdNHxy69zOsorB9DhRsXLiF/T84A5lv+1O+PDCbJE9KcQ3D/cbwA35jFvOTLE3C07fvH5cpqRyDO8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IbeetVoX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 71DD8C4CEE2;
	Mon, 14 Apr 2025 16:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744646642;
	bh=orKoB/QPGzojKkdDpkIIMZGWYRyu+xOxcNOpDM0H3h8=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=IbeetVoXhK+Evf3YH60lar86ju2F24pZvmYIjNwYfcHC+0wve22C8ecw6K1cTBI+/
	 Dimmm7jyzzXsbGo9ZtW28x6ipAxPCNS9x5eeqshMVG2nKBz7Q+/y25Wk02GYfVD1gc
	 GP9DaQFwbsHSrO8a23TmC9zfN4l2flu5DyfjyGbt6nZGNm+PyWNaAumi55BHHoKeDo
	 +1mpQbL44M5ifGbbl93HXev9fZjdEbO6gky73/IKYpqVQXN0s8LkOlI5LPkhlbSczW
	 W4Nm+Cyd8+PBmIEH3CMLnyAXUChc9DSdWHn4aBTADYsii7ObAwwSmai92x4WRc3NFM
	 liTW7ciR+pXBA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59576C369A2;
	Mon, 14 Apr 2025 16:04:02 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Mon, 14 Apr 2025 18:04:01 +0200
Subject: [PATCH v3] media: dt-bindings: Convert Analog Devices ad5820 to DT
 schema
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250414-b4-ad5820-dt-yaml-v3-1-39bbb5db7b2b@ixit.cz>
X-B4-Tracking: v=1; b=H4sIAPAx/WcC/22NwQ6CMBAFf4X0bMl2S0Pryf8wHqAtsomiaUkDE
 v7dggcuHuclM29h0QfykZ2LhQWfKNJryCBPBbN9M9w9J5eZIaACKSreVrxxSiNwN/K5eT64RIS
 2w074Clj23sF3NO3N6y1zT3F8hXm/SGJbfzUEgyBNBaVQBrTmgrsmkbvQRGNpP2yTEx7C//uEW
 URdG6WttFDbw1/X9QsF0Pli4QAAAA==
X-Change-ID: 20250314-b4-ad5820-dt-yaml-3220bf2f1e40
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Pavel Machek <pavel@ucw.cz>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4449; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=GVJ7MQh4loOY2204mfe4sVnmHlFZoSugyiPkIxthxvE=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBn/THxEeQ9VrqZrRI0BVA+GI6KqZURU8oVJ+k3Z
 wlPBP6HjQGJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCZ/0x8QAKCRBgAj/E00kg
 ci6VD/47lyr0VIkS4o4S8nUdOgKCTRLt9a4HlhUST6TncfzeBFeOBHCu7Mo44VLxiQtsyiMjczO
 Mdj6LmnJd6fSVUKDg1k9ux/HYwmterhssFF3fHsjcSxNFnyNYNzpccrOHxTcaCxIvSwtFlkBJcA
 aj6f6fnyJnpG/QQ7lIPPXYBWqiChWId4oO2yAFwoqAEgD7el6IBDgoobOalXbVFt67KK4ksoRq0
 kBE3IjWColhgK+UEt0Lb6USD9A8d5x7jGgC1hn/pLmBJ13et47M7/ep3GVVCL+beuEJUfyxkcal
 nrgFOuHI5p50cZOqy/41hlNxOafIRIf453JsyYy/e34MBMeqIWNlccjbtDpwhjf/s19sNwXYtcg
 jRLfrM0N4g92kKXvGAz/OxdeAnFq+IFXSWtIeZMVH2TuVhuZjjhw03So9pglVzF/b+b++7J0AyE
 Hbie236TBIPHIo4c9U2zWx9kR1ssZA7yGmWOTGICgJ8nJBOEkspMZdPZIpkAlVSnz66UxFUHY6/
 QEKo7PwS1g5hH3jodD2nLV4YBnSCc71FvPRS44DrCiEU+Ep61yMCLQkPEU966by+kkYQfQOmqG0
 SSdlLnEebwOpbznoCDCKQLNjQREkwP5WzexsvF2F0m18+cWm7eVtXBNVYdzuuxsv773hdNZdlkd
 nN/A59tcViSeETg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Convert the Analog Devices ad5820 to DT schema format.

Added the io-channel-cells property, because it's already used by the
Nokia N900 device-tree and defines ad5820 as having only single output.

Acked-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
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
 .../devicetree/bindings/media/i2c/ad5820.txt       | 28 ----------
 .../devicetree/bindings/media/i2c/adi,ad5820.yaml  | 59 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 3 files changed, 60 insertions(+), 28 deletions(-)

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
index 0000000000000000000000000000000000000000..93349e7daf262fc8939f984fbe93cf064a0cbaf8
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/adi,ad5820.yaml
@@ -0,0 +1,59 @@
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
+allOf:
+  - $ref: /schemas/iio/iio.yaml#
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
+unevaluatedProperties: false
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
index af3537005de35dfd0ded11bdc2b9c63e10c70e93..366ed4905fc9b32862a4fd665cf5f4e09fafc989 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17274,6 +17274,7 @@ M:	Pavel Machek <pavel@kernel.org>
 M:	Sakari Ailus <sakari.ailus@iki.fi>
 L:	linux-media@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/adi,ad5820.yaml
 F:	drivers/media/i2c/ad5820.c
 F:	drivers/media/i2c/et8ek8
 

---
base-commit: b425262c07a6a643ebeed91046e161e20b944164
change-id: 20250314-b4-ad5820-dt-yaml-3220bf2f1e40

Best regards,
-- 
David Heidelberg <david@ixit.cz>



