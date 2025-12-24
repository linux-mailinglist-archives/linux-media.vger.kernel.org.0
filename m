Return-Path: <linux-media+bounces-49513-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 22407CDD1B6
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 23:01:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DBFB7303F4E1
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 22:00:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEC4E7FBAC;
	Wed, 24 Dec 2025 22:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Br7C1O5J"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6B42DECBA
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 22:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766613619; cv=none; b=QvmrxV4fTm0Efd+eCRfkXQU9BTMl56iZDgl5Bkqjudye7iBM36R4Kr84ilnO3smc4YqJvb42/tuGe4sD4ruwLR9RWrBgnhyqxM9DlscixBJX6uQxx5UtboXZGXnSAWosw8/1kEQNYT6Trm2+9qBVUT33iNlR3lTR2fXOtuaYoWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766613619; c=relaxed/simple;
	bh=dn4qDZdDpU1VrgzXfez3SR3IkgUWnRNxBpL/LcMJRDg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nmKB2+ts7DdSCC62rYjLEr7fY4k01z5YVMZj+A28mM5TqUQImUuUyuXim1JiASdQ/K6ImPoHcyjND+Wb29Nc+ytdNjPX/Mg84lK0PvUviazBIxIRLjLTV1Aq3Ga/7Dpcm7Xww6Pkq84neghvpgglEBy17zyG+Trhpma0ZxtPgXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Br7C1O5J; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a12ebe4b74so108665505ad.0
        for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 14:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766613616; x=1767218416; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TCUT94w0VeyaMmTXy6p9kTp5D3//iqDd06KvUuU4WS0=;
        b=Br7C1O5JR758yKxC36VsU8PgLD5JdUEZmwjFbcRh0n5DuEbXNvpk4b1mNbuK5eApTG
         srkTfMgnU3A1AOM96FnsH+a3g/LhHUTXZEVQF3HcJ+BsM/golR8OjG1YCay16GuO8VEf
         2b/iyAQGOspWFqjfymtGTShmtgbelQiGwwh0G9GdelRpFd2+4jbzfrYdKOf+LdDYRMc1
         RBJAh8dD/Z/s8hqhNlb5mObDjKPG5Gkc0uu5ij1rZh565+GfAkRnEA4pG6xoP/XYdnEu
         4hQK2yHtzhb+nDIYrTmxJJs7hqb5jSEPKd6cTsW85EmOwncUXY2dfGAqBEnVIrfqC8IE
         9bow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766613616; x=1767218416;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TCUT94w0VeyaMmTXy6p9kTp5D3//iqDd06KvUuU4WS0=;
        b=vOO/jmz4mRDmqnx3KhDyltICgMXJKV1R/+Ht8ZIPIYiz5mT+C28qCI5Jq8kMUhfsRB
         qfq2lKj0uyKdoZ5XH3Ng1a3weZrW8GskRZpik7nEe6EZsT1LeaXQiQFwcoKmWaRifBJj
         ko3DfHz1/Je0uGhRNMeMDxlKEID3QURRry9YYnaxcWK7OadZFb0MpLOUJjVCYMirkmU0
         Xi+NULi8PariRHuEka0GBcsqcfH5x2chkFJfAakxicKqtrwr7WSnX4Irar5GBj+2Ajga
         L1YIAzvYD2M3R7RktFgOtVbfU1No4bQEYgkScGzD7dnvCLGUDU+6I22iYHteenFkjIXz
         3uiA==
X-Forwarded-Encrypted: i=1; AJvYcCUr3+mWPEmekwouSlByy+aJGon32MCU8QMxcfaIWHWSTPOK2r3/RM/nYZCbU5q8e9opNCUm8M0OG9d/Ag==@vger.kernel.org
X-Gm-Message-State: AOJu0Yycg7pNAQMHTYmc5vXkY8hKdHoQS++cMTJLXtBE9Zo4ACHN1Zq3
	h+G20xv/WZVE7t2GaLFFktxQWkZ3QDkW6HKcv1KOrj4NXoqR9a9Pmqk7
X-Gm-Gg: AY/fxX5kFEbYYv8vJUUkAclD34QQpj4FXia9WY6M6p56WihxOFHyg9XGZW+19o2S66k
	j9WAkhm9YWvHzhWqRz1j7f9S/OUM6wJVk/lpXuaDfGUCQf1xf1P7VJkjpQVd9K67eZVpCbVNarl
	0U1kvoMsmCiBjbVFe+DIZjcqVwzshfD+OQVXAx80MZLzgZHlt5wCaVUcbarUJoGKINOFj4TFxTM
	zOiq/7Wo4delmsfk2jV0DmJzoFK27tEMBtfmTZzGKl5h8qPqyHijK6VHMCxf/ZQHVeT+BD2uGyH
	CYre1TXdr7orxBkMTqtk/k3cLuZ6fqdrInkB6+iHEE0YB1qdytJn5I03Z+0/wweeajUR8x/R0PA
	LEgfFi2PxKzvFgtCkR6Z5h3FMWerKoFQRRuOxeLxAVGmEVtJE/rTn2D9i1GeTfWLgrjMXglbQZG
	msqJwOzg9YmCLQL5RkwmzAsg==
X-Google-Smtp-Source: AGHT+IFz9wv6QdTk99v9SU+hpMyVwkzVR7B3nRW/uv6OpuoWPrEAVznS4sDhdt9/RKoddSg8dRjcaw==
X-Received: by 2002:a05:7022:370f:b0:119:e56b:c758 with SMTP id a92af1059eb24-121722e30c6mr13153813c88.29.1766613616226;
        Wed, 24 Dec 2025 14:00:16 -0800 (PST)
Received: from [192.168.5.77] ([172.59.162.202])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b05ff8634csm46610293eec.3.2025.12.24.14.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 14:00:15 -0800 (PST)
From: Alex Tran <alex.t.tran@gmail.com>
Date: Wed, 24 Dec 2025 13:59:59 -0800
Subject: [PATCH v2 2/2] media: dt-bindings: ti,omap3isp: Convert to DT
 schema
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-dt-bindings-et8ek8-omap3isp-v2-2-0728cc1fee27@gmail.com>
References: <20251224-dt-bindings-et8ek8-omap3isp-v2-0-0728cc1fee27@gmail.com>
In-Reply-To: <20251224-dt-bindings-et8ek8-omap3isp-v2-0-0728cc1fee27@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Pavel Machek <pavel@ucw.cz>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alex Tran <alex.t.tran@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8339; i=alex.t.tran@gmail.com;
 h=from:subject:message-id; bh=dn4qDZdDpU1VrgzXfez3SR3IkgUWnRNxBpL/LcMJRDg=;
 b=owEBbQKS/ZANAwAKAXT5fTREJs3IAcsmYgBpTGJrxKo6IhDwyejlSNL1tmQ+1ISOUpHriD7+O
 p4kqnB5frKJAjMEAAEKAB0WIQQAohViG04SVxUVrcd0+X00RCbNyAUCaUxiawAKCRB0+X00RCbN
 yD2eEAC2a04xZq73XFYFPzF8nRl3xtZtKIeZn09gvMKpANTgpu6efibxasgLaBdG8TIVuII3Wej
 klhgwZ4EO0xxvyZvk7zjXuISVSak+6Th/jWbFwG6DsnhXUBd/kPoraJqkY95jdndw+Ya8MZeNSJ
 UFSKy4d7zVtNYzCY1tgboY4fLvUH7r7DWxz3P8YInyueT17XC8OIv4MXWZX7nCSWpa2wr/nPcig
 6yl6VlPuryYg7ja+BQ4uTlfMpDrWrrdHEImFMAmIZLVDKtrQvPhnCqmQtQk4LJ0/UYE6p0vnRWZ
 3B+AMsw9QR7ncQsPguQmVVzsTbT3J63UWUxpMNg4dDS34XmaHNKPcAheNq3PCo57L6EEVYjXU5u
 z3cMEQW1qtdijAWPT6w2Qd0QdI2i8hvEuvtFmCTaywkwj1irvkAlaDstOFqbNcKuMjWNY3/Te6S
 cjHejMvgaei9bY5L26YSA3kV1yguhimuWPK4ZVhazvEbnJHyt2TXN3WurrYleIJlgMZnwz6srM2
 Aeeyw6Xw21G4RcfarqokCiRVbYTDY5t5pNkkH/2w7E6BSOCrzzDLYCadUo6Vgaw9A6lxI6aY87q
 +nvp0aVAVDQB9/9YRTLwFA+0DfzSNuBH3Xq2oIcSyf5AHn7XRM+mEJc7kZfQGvCy6DboxAMX2dT
 m3K6jWYN8tlDpmg==
X-Developer-Key: i=alex.t.tran@gmail.com; a=openpgp;
 fpr=00A215621B4E12571515ADC774F97D344426CDC8

Convert binding for ti,omap3isp from TXT to YAML format.

Signed-off-by: Alex Tran <alex.t.tran@gmail.com>
---
 .../devicetree/bindings/media/ti,omap3isp.txt      |  71 --------
 .../devicetree/bindings/media/ti,omap3isp.yaml     | 189 +++++++++++++++++++++
 2 files changed, 189 insertions(+), 71 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/ti,omap3isp.txt b/Documentation/devicetree/bindings/media/ti,omap3isp.txt
deleted file mode 100644
index ac23de8556412c52710f46c3ea015d2976c96dad..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/media/ti,omap3isp.txt
+++ /dev/null
@@ -1,71 +0,0 @@
-OMAP 3 ISP Device Tree bindings
-===============================
-
-The DT definitions can be found in include/dt-bindings/media/omap3-isp.h.
-
-Required properties
-===================
-
-compatible	: must contain "ti,omap3-isp"
-
-reg		: the two registers sets (physical address and length) for the
-		  ISP. The first set contains the core ISP registers up to
-		  the end of the SBL block. The second set contains the
-		  CSI PHYs and receivers registers.
-interrupts	: the ISP interrupt specifier
-iommus		: phandle and IOMMU specifier for the IOMMU that serves the ISP
-syscon		: the phandle and register offset to the Complex I/O or CSI-PHY
-		  register
-ti,phy-type	: 0 -- OMAP3ISP_PHY_TYPE_COMPLEX_IO (e.g. 3430)
-		  1 -- OMAP3ISP_PHY_TYPE_CSIPHY (e.g. 3630)
-#clock-cells	: Must be 1 --- the ISP provides two external clocks,
-		  cam_xclka and cam_xclkb, at indices 0 and 1,
-		  respectively. Please find more information on common
-		  clock bindings in ../clock/clock-bindings.txt.
-
-Port nodes (optional)
----------------------
-
-More documentation on these bindings is available in
-video-interfaces.txt in the same directory.
-
-reg		: The interface:
-		  0 - parallel (CCDC)
-		  1 - CSIPHY1 -- CSI2C / CCP2B on 3630;
-		      CSI1 -- CSIb on 3430
-		  2 - CSIPHY2 -- CSI2A / CCP2B on 3630;
-		      CSI2 -- CSIa on 3430
-
-Optional properties
-===================
-
-vdd-csiphy1-supply : voltage supply of the CSI-2 PHY 1
-vdd-csiphy2-supply : voltage supply of the CSI-2 PHY 2
-
-Endpoint nodes
---------------
-
-lane-polarities	: lane polarity (required on CSI-2)
-		  0 -- not inverted; 1 -- inverted
-data-lanes	: an array of data lanes from 1 to 3. The length can
-		  be either 1 or 2. (required on CSI-2)
-clock-lanes	: the clock lane (from 1 to 3). (required on CSI-2)
-
-
-Example
-=======
-
-		isp@480bc000 {
-			compatible = "ti,omap3-isp";
-			reg = <0x480bc000 0x12fc
-			       0x480bd800 0x0600>;
-			interrupts = <24>;
-			iommus = <&mmu_isp>;
-			syscon = <&scm_conf 0x2f0>;
-			ti,phy-type = <OMAP3ISP_PHY_TYPE_CSIPHY>;
-			#clock-cells = <1>;
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-			};
-		};
diff --git a/Documentation/devicetree/bindings/media/ti,omap3isp.yaml b/Documentation/devicetree/bindings/media/ti,omap3isp.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..6137ac1e1c4432b9cc3102c5aa569e0c9930df42
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/ti,omap3isp.yaml
@@ -0,0 +1,189 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/ti,omap3isp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments OMAP 3 Image Signal Processor (ISP)
+
+maintainers:
+  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+  - Sakari Ailus <sakari.ailus@iki.fi>
+
+description:
+  The OMAP 3 ISP is an image signal processor present in OMAP 3 SoCs.
+
+properties:
+  compatible:
+    const: ti,omap3-isp
+
+  reg:
+    items:
+      - description: Core ISP registers up to the end of the SBL block
+      - description: CSI PHYs and receivers registers
+
+  interrupts:
+    maxItems: 1
+
+  iommus:
+    maxItems: 1
+
+  syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to System Control Module
+          - description: register offset to Complex I/O or CSI-PHY register
+    description:
+      Phandle and register offset to the Complex I/O or CSI-PHY register
+
+  ti,phy-type:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+    description:
+      0 - OMAP3ISP_PHY_TYPE_COMPLEX_IO (e.g. OMAP 3430)
+      1 - OMAP3ISP_PHY_TYPE_CSIPHY (e.g. OMAP 3630)
+
+  '#clock-cells':
+    const: 1
+    description:
+      The ISP provides two external clocks, cam_xclka and cam_xclkb,
+      at indices 0 and 1 respectively.
+
+  vdd-csiphy1-supply:
+    description: Voltage supply of the CSI-2 PHY 1
+
+  vdd-csiphy2-supply:
+    description: Voltage supply of the CSI-2 PHY 2
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: Parallel (CCDC) interface
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: |
+          CSIPHY1 interface:
+            OMAP 3630: CSI2C / CCP2B
+            OMAP 3430: CSI1 (CSIb)
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              lane-polarities:
+                minItems: 2
+                maxItems: 3
+
+              data-lanes:
+                minItems: 1
+                maxItems: 2
+                items:
+                  minimum: 1
+                  maximum: 3
+
+              clock-lanes:
+                minimum: 1
+                maximum: 3
+
+      port@2:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: |
+          CSIPHY2 interface:
+            OMAP 3630: CSI2A / CCP2B
+            OMAP 3430: CSI2 (CSIa)
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              lane-polarities:
+                minItems: 2
+                maxItems: 3
+
+              data-lanes:
+                minItems: 1
+                maxItems: 2
+                items:
+                  minimum: 1
+                  maximum: 3
+
+              clock-lanes:
+                minimum: 1
+                maximum: 3
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - iommus
+  - syscon
+  - ti,phy-type
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/media/omap3-isp.h>
+
+    isp@480bc000 {
+        compatible = "ti,omap3-isp";
+        reg = <0x480bc000 0x12fc>,
+              <0x480bd800 0x0600>;
+        interrupts = <24>;
+        iommus = <&mmu_isp>;
+        syscon = <&scm_conf 0x2f0>;
+        ti,phy-type = <OMAP3ISP_PHY_TYPE_CSIPHY>;
+        #clock-cells = <1>;
+        vdd-csiphy1-supply = <&vaux2>;
+        vdd-csiphy2-supply = <&vaux2>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+              reg = <0>;
+              parallel_ep: endpoint {
+                remote-endpoint = <&parallel>;
+              };
+            };
+
+            port@1 {
+              reg = <1>;
+              csi1_ep: endpoint {
+                remote-endpoint = <&smia_1>;
+                clock-lanes = <1>;
+                data-lanes = <2>;
+                lane-polarities = <0 0>;
+              };
+            };
+
+            port@2 {
+              reg = <2>;
+              csi2a_ep: endpoint {
+                remote-endpoint = <&smia_2>;
+                clock-lanes = <2>;
+                data-lanes = <1 3>;
+                lane-polarities = <1 1 1>;
+              };
+            };
+        };
+    };

-- 
2.51.0


