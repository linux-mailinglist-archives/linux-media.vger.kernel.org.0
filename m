Return-Path: <linux-media+bounces-25860-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 00767A2E078
	for <lists+linux-media@lfdr.de>; Sun,  9 Feb 2025 21:39:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0629B1885C2C
	for <lists+linux-media@lfdr.de>; Sun,  9 Feb 2025 20:40:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 950971E32BF;
	Sun,  9 Feb 2025 20:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="khVHM7kV"
X-Original-To: linux-media@vger.kernel.org
Received: from ixit.cz (ip-89-177-23-149.bb.vodafone.cz [89.177.23.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B431324337A;
	Sun,  9 Feb 2025 20:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.177.23.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739133588; cv=none; b=NYpMvJAD9lAq+/+6bi28WKbaGbge8dvKYOEciQcCTlqkzyRlf4RYzCV31G8ULay/rJHbjshEReVzP9Ke8vTuP9qXrN5V7a3avDRCTSoLXuJdzzHkPD7kCX9CjiP2GDyZ04uxPvWMHu0eOo1XsEuXiKLgfWEEOHF9lAJoItFN/P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739133588; c=relaxed/simple;
	bh=tq1e8PopaNEjjgXy0Qh15OLxlcBfu2RTELXL/38ygrQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oF8Uo3lEq3aqD3BLuWxIeEI0qBWOFqby520UAv8JgpCTO/35FwVgF+cjPXlCBoZ4R/vMmGQCQslONfuriIvlGEQi8j1WUlV34EQdSEGU5rjdvkmz+1x9pXJgR8JycUQ29S3n5bnJwZ6W2Pn22gtU+bT5QyHKHLeVjC294MzBJTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=khVHM7kV; arc=none smtp.client-ip=89.177.23.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Received: from newone.lan (unknown [10.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id A1C7D160ADE;
	Sun,  9 Feb 2025 21:39:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1739133582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DR0bRoLbBuWtCS0pGfeShO32SsYDtmwyxrzyYbVJIK0=;
	b=khVHM7kV/c60bMBDuMCzflpt54W/n6H9/JgGmjg5hJnbVMgI4elPO5G/TzyAFk7rqy9kUE
	7ZLrsKBWWOewcbsk05M6RReNJYOXue/CZL5VKSVdlXLcqTdCQFxV+ak4eet4aysqE94WDi
	VSwv4pE8XTAVK+7TjO9j0vB+P1j/Za4=
From: David Heidelberg <david@ixit.cz>
To: Pavel Machek <pavel@ucw.cz>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Heidelberg <david@ixit.cz>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: dt-bindings: Convert Analog Devices ad5820 to DT schema
Date: Sun,  9 Feb 2025 21:39:25 +0100
Message-ID: <20250209203940.159088-1-david@ixit.cz>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Analog Devices ad5820 to DT schema format.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
Needs: media: dt-bindings: media: i2c: align filenames format with standard

 .../bindings/media/i2c/adi,ad5820.txt         | 28 ---------
 .../bindings/media/i2c/adi,ad5820.yaml        | 62 +++++++++++++++++++
 2 files changed, 62 insertions(+), 28 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/adi,ad5820.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/adi,ad5820.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/adi,ad5820.txt b/Documentation/devicetree/bindings/media/i2c/adi,ad5820.txt
deleted file mode 100644
index 5764cbedf9b73..0000000000000
--- a/Documentation/devicetree/bindings/media/i2c/adi,ad5820.txt
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
index 0000000000000..5a403cbc07317
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/adi,ad5820.yaml
@@ -0,0 +1,62 @@
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
+  "#io-channel-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - VANA-supply
+  - '#io-channel-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            coil@c {
+                    compatible = "adi,ad5820";
+                    reg = <0x0c>;
+
+                    enable-gpios = <&msmgpio 26 GPIO_ACTIVE_HIGH>;
+                    VANA-supply = <&vaux4>;
+
+                    #io-channel-cells = <0>;
+           };
+    };
-- 
2.47.2


