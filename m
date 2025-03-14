Return-Path: <linux-media+bounces-28264-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B83A61B2D
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 20:58:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CFD8881C2D
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 19:58:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 033A8204F7D;
	Fri, 14 Mar 2025 19:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BbdoiJe+"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D8C1FDA6B;
	Fri, 14 Mar 2025 19:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741982312; cv=none; b=BIW2NjWBkvh6SyOC6L6jGtGLfiyS8A2guPbQV7i/puL9Wc6eA6gqbZG3oDa8qB/YqawDYll1k+aH6ZQgniY62Z7inKU0Q4jQ1HqbECqxiFb/GBMWgPxj+Nd2cDwYsJCMBbshkVB53OkqCRxFMxhUSqmg1ICxH6a1nYBvujwn1Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741982312; c=relaxed/simple;
	bh=AZQGdOvkc2ZGeOv2g07NuPSfm/3YThClhsvkw5X+ih4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=uKBCwhY/Km1iwA/ZC+ch271ijjj1HbfVM6AesxmT2CM0XMWIWqgKk7l1CtR69sOjsx+duCwu1/Cn9SYEzDVfWaIYuGsCKi0zH61t9Is4MN5tA6owiSrgYFv9tiU+9ghysxkpD2glW2ZzVTS4kOwm33Q23wo1OSGA5p8/NFSb/s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BbdoiJe+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id AAAC4C4CEE3;
	Fri, 14 Mar 2025 19:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741982311;
	bh=AZQGdOvkc2ZGeOv2g07NuPSfm/3YThClhsvkw5X+ih4=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=BbdoiJe+c3fydEjOCFPygz0B2xnQ+NwRa2jWjZScDzArH9Fh0qBa2uAzZueUdFqqo
	 xDFtgfJlVdO5WNjd3i5lj8yTLG6115TU6lfsBTLYdCN9gssVUn6AMyUiyJZnBnOwYC
	 tZiRmAOF2vz3OLMKE+Lriox2WzLXdNbbZeFwTTduZR6xh42nNoPxApfbwq4RiKgn8O
	 Zi9HJLsSkDdwIO1uEM+J3FjpY8I2hjYJ0jrtoJyeIgnHTQHfoZaYOxhvIGjPk1iTQM
	 nbRUVo7sMRbPqKkVGkWOKcR3akTLh0yuhhgDEctQI43POTBI+Auar+rllb/dnQAntG
	 nylCDRC0BXBHg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EF14C28B2F;
	Fri, 14 Mar 2025 19:58:31 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Fri, 14 Mar 2025 20:58:27 +0100
Subject: [PATCH v2] media: dt-bindings: Convert Analog Devices ad5820 to DT
 schema
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-b4-ad5820-dt-yaml-v2-1-287958c3c07c@ixit.cz>
X-B4-Tracking: v=1; b=H4sIAGKK1GcC/yWNQQqDMBBFryKz7shkjKBd9R7FRTRJHWi1JCJay
 d2b2uV78N8/ILogLsK1OCC4VaLMUwa+FDCMZno4FJsZmLimSmnsNRpbN0xoF9zN64kVM/WevXK
 aIO/ewXnZzua9yzxKXOawnxer+tl/jallqlpNpapbahpUaM0q9iabLOXwgS6l9AX/gf3DoQAAA
 A==
X-Change-ID: 20250314-b4-ad5820-dt-yaml-3220bf2f1e40
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Pavel Machek <pavel@ucw.cz>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4138; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=z81Yqbut3SZDaJXDHotF1NCKDbHx0Fdm/k4FGFc127s=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBn1Ipm2nYSDpgV9ujf/RnKXz3/hUx5ecREWpynY
 I6pg8cGtIuJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCZ9SKZgAKCRBgAj/E00kg
 cspeD/97vOwKteluX4cjW3PO5WfeMenU4W3nCdvvBfjJYetpVEXUBfqy+pb13vHSDZezopxd39O
 lT5CeFtteh1dzlf7j6IXSlEOtJUuSSjL3p/2/C3JAYTbk+UNss1mDR/YPbZyLC6LEo2U18235BF
 wRv2FIz4G1E9i1nZ3yDKT1iB7im8nwkfK678qxZAK0VgSw/+D8dhh6SQcniok376fhYEceHG9fM
 K7tlXovESZbxepoKFnprKWi8K8XlfSV75ZTESFMg6wW1L+IP6mlwducL/dIFLy316qj2qeukjfs
 fW1TUQXPy/VZlPhOH291QTec+xsjqnchC9ytJU/nfJs+Je1bFMJUs5xk0J88kwMsXFX9PmD9BDJ
 5U686vtu3Q8/j1Ov8xXSUzW0EgSjRs//Hzlv4bRZQ/SD6nT8ryRFVVOrH81IG6kYwGL56HAIrBH
 pRKQjlhjiED7/+t3ugzLzE3NWR5PHddngCXyiEIb6wuoYLWvslVinPmhTxs9l/7GKH9EjCoW3qF
 CxrDRcn5BptiwvxG7XwpdT8/J2FHXjUxyWoW4yXzC0BJR/2k2czk6VSk+i7U7SHM75+7M2V9u9v
 bh+ZMa/24sKynJHxElKEU5PYyXAAYiOe9+wzvFnKJ3kUAsrOXNW/VR6/FpeAZ0VH9Y1ka/7NLor
 p9YDZoD7nz2eudw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Convert the Analog Devices ad5820 to DT schema format.

Add the previously undocumented io-channel-cells property,
which can be omitted. If present, it must be set to 0,
as the device provides only one channel.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
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
index 0000000000000000000000000000000000000000..7967b8dcd77a2171074829625d71dbb53a80fbc6
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
+  '#io-channel-cells':
+    const: 0
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
index e4b6545aab3ec75f92c0daaabe2fc1bb1d483969..238c00d3abe2f53ea7b7e6ba265d560ad5c3fe86 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17073,6 +17073,7 @@ M:	Pavel Machek <pavel@kernel.org>
 M:	Sakari Ailus <sakari.ailus@iki.fi>
 L:	linux-media@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/adi,ad5820.yaml
 F:	drivers/media/i2c/ad5820.c
 F:	drivers/media/i2c/et8ek8
 

---
base-commit: da920b7df701770e006928053672147075587fb2
change-id: 20250314-b4-ad5820-dt-yaml-3220bf2f1e40

Best regards,
-- 
David Heidelberg <david@ixit.cz>



