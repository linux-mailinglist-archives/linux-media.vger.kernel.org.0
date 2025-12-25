Return-Path: <linux-media+bounces-49561-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5FFCDE1CB
	for <lists+linux-media@lfdr.de>; Thu, 25 Dec 2025 22:04:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 76EE73017EC5
	for <lists+linux-media@lfdr.de>; Thu, 25 Dec 2025 21:03:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE7112BD030;
	Thu, 25 Dec 2025 21:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LgA10jL6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C00C28851F
	for <linux-media@vger.kernel.org>; Thu, 25 Dec 2025 21:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766696609; cv=none; b=mdIjlW+VaEWNTdUe9lThp/ZnfKBZmAqxCxzlhsaEOA50HpYwkjdkNPgwjbs9i7uXEEAZtC1sOv8qNvYFZxOY+GnBi7+g7CdPQU6ByajOwCY8zoOhzB8aZmu90ivDN2r/5YIaTyWYU7VEdSzvIYakuLcS7hpiTeODd+tjz9q0xPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766696609; c=relaxed/simple;
	bh=QTYAYLX9cyK63LJsZQA3buVLpKA8Ar82kX/gmIYypc0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eblgaWNGM716Wp17vPEt+wB7feGGOdJOTGAvf8fUEsZa03NWPIMOSMNynX8BWD1JS0+MDjDNRh+AYqShc+bKZtdU718QcM+dLWpugge79AbBVjp4tCu0q8/9aAKMGslzMJ0o+JjjlGk+gDLvVy8u0FaS95w4CgqXXGPSMONk19M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LgA10jL6; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a0bae9aca3so98313495ad.3
        for <linux-media@vger.kernel.org>; Thu, 25 Dec 2025 13:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766696607; x=1767301407; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ugG/KfmO5D9jHJGU1k7FApOGJz/nVp13tryVY99MucE=;
        b=LgA10jL6ziq/Nc2/dN5MSwguVhpVVGNSEu1DvAOaTLxceLR0oggaO/W+ckM7oFZ7C9
         fLpY/ET4+hRV/GuJgTIX3Dzf1klWrPvPVIgvB8XfCUl2+szdCFo2L8Wm/A3U5mVQNx1g
         nZO+EZZd+yVdSSUcuYFEjClHezTpOeuJ28onvnEJjr5hbsV116smw1huvXE9e4oZWrft
         0nmNA3l6fTRTc9KlLfWzq0vEqScjJrbGnk2q6XpaWbQdqDzpQQH+Ou6kF0fheaZmmuzT
         YJ4Ims2g9fNWHwbOMxmdyIXH5ktZ03s+PyICLT77CkcKQRiRZFZiW673iya5m8a612M1
         CkyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766696607; x=1767301407;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ugG/KfmO5D9jHJGU1k7FApOGJz/nVp13tryVY99MucE=;
        b=C1PLZ8u4CJ4HrVMOID7IOI2363eEKsCkUHFr9shRBy2Krn6jmikovEmhA58VWIlezA
         WzZtd68QH2cwkDLs9o7MJ6Y4sDQlaj+kBwE5J7fITLDqMTjamSXsvHFISXAoiL8WRyxW
         i+PeEedRv40nKUogQvwmhUqMPrX/szWKI43K9ayJBzfbX09BYydNhYUQNnmM9YOt8Ud2
         GN/PEBTP6gkz7W/jyhEn2zx2+QmG7CINODjWLUBDUPTD1BdNmaS6aLtbGWcXiuG8DGyC
         KY3SPO8hNfIFsBESUQuj1uUhJ+r++iKliQnQ7EqXYYox8Aj67JEaRbtI5lIw9gH8twxc
         gMVg==
X-Forwarded-Encrypted: i=1; AJvYcCVISwagGaF0+0I0YWBuNHoBfNkR+wFFeAjEsevREXhP9NKTME/hgvTdBsB530YkDpA3TT+sCb6eXfY3jw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvVS7+jrtfvvfazB+p1DII2WIeci+6o3mN93CW9w6qqLu3yxGF
	kHJhP+OXBUotWNVN3QNmJlUjo+kS1Y/pmOPfg52PMx0BFvfO9kQOfzwY
X-Gm-Gg: AY/fxX5WZa0mjwnucfHdQjM0XzEmfJipNW7Z9KZofNMmIXExqG/8xHzeWkEGXlEwUOC
	4944HQq1nBMGxP/LYWLUUVzmAqchaSheCmwGd56o2ChCzbuFOq3oxJMAokQiQQw8tzHDXH4T9K9
	a5hwEZCb5LithuOcPULQ3XW3c7mP1mYDoVQpTXaO8u8hFwbimy+bjpYTUda/fA4YY7WlVQ48yC2
	2ckXKpassXpI98jN0uRAc20wO+DlDw9a8tyKBs0Ose3D/hTequOewkjX3cdeFkhxPNh7PvTL6Gw
	gtKyLQdvbgUygwAmOPd8TP+fKbGxosEsYREYv8Y9LQUprhBG3VtkoSbN2qPjD3Us/FjLcao6wVz
	YiZHDFl+RaUXibBQSFi+P2ONtl+O291Xuf/tpKvs5yLYHBf7I1/2mPJXIBAV356FQhTsY3iWIxo
	TujWUmXHqXi/qhuocfXoo6Ig==
X-Google-Smtp-Source: AGHT+IGLZ4IAtoP+SyRlMq23IbYeLRzGMd+E9XIT0gLtPeFiZLdvI+lGz8pEv1yiNCKDtsVdl2ZiHw==
X-Received: by 2002:a05:701b:2710:b0:119:e569:fb9a with SMTP id a92af1059eb24-121722ac2a4mr17546538c88.9.1766696606423;
        Thu, 25 Dec 2025 13:03:26 -0800 (PST)
Received: from [192.168.5.77] ([172.59.162.202])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217254c734sm83006203c88.13.2025.12.25.13.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 13:03:26 -0800 (PST)
From: Alex Tran <alex.t.tran@gmail.com>
Date: Thu, 25 Dec 2025 13:03:08 -0800
Subject: [PATCH v3 2/2] media: dt-bindings: ti,omap3isp: Convert to DT
 schema
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251225-dt-bindings-et8ek8-omap3isp-v3-2-b027e0db69a5@gmail.com>
References: <20251225-dt-bindings-et8ek8-omap3isp-v3-0-b027e0db69a5@gmail.com>
In-Reply-To: <20251225-dt-bindings-et8ek8-omap3isp-v3-0-b027e0db69a5@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Pavel Machek <pavel@ucw.cz>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alex Tran <alex.t.tran@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8393; i=alex.t.tran@gmail.com;
 h=from:subject:message-id; bh=QTYAYLX9cyK63LJsZQA3buVLpKA8Ar82kX/gmIYypc0=;
 b=owEBbQKS/ZANAwAKAXT5fTREJs3IAcsmYgBpTaaa8PSmG7RBzDHXs+N700GMb0MDuOFGF970g
 6WVB1TwcoyJAjMEAAEKAB0WIQQAohViG04SVxUVrcd0+X00RCbNyAUCaU2mmgAKCRB0+X00RCbN
 yMshEACQ//FJbbkjvlHaEBuDt6+MWP0iCPsS5MsdrgA7V4T1a3brX43Tg5T56hAOnyPm4K8LyNl
 Ak6hQu1U0ZB3imHXlOBIDOQqZxk/TqCP3VY1uJNeui9WUXXc08T9sYyHh9Z2F53cQxC8qugslFs
 70cvVnkdZCnIkiy1P9E6qBndkeIayQIq14MwMni1ijg6CmIdN5w5C2iHTlZileRGISQSFjXXvXe
 D6vqV5ge8/zK3+8PJHJsmI8Kj0a+pl9A6oSspupnfST0KkuQs/kSUUhK9mYGJKHFoIQonem3Hjz
 xPYQzzcH1Puc0PcbQnY8VoteG2g0vHrF3E7yOFGA9A8hPv2Scf+UhugNBPT07iJK/ieesGFrtbo
 gdfgEZFH55jlCK7ZseFtbh7ObrkIJaWNqadaAm1KHxr3candVkneEgxi1kiMl90emKb5jkFYNo0
 VU3cuXgTe9+d5ctXumHnlm5nt0ehR8Nw5d/pT2RLQbqWrHFhWU2/xNg0pjY5KMk57cxyKrGwewo
 AQPiss6khuQCzJH19wteEP+hPMCBEBtwQ6CCkLbaiiBalVwPAHtNGk9NcTggNgQYC26kbnKCKpD
 koIShEsvOAL/DKSZIndmh3lismqkxMlycxaiO2aR3dUwVAgoczvHKiPUoUbj8fuC9BAQXE8OzCa
 36nBicogvSQ0Aaw==
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
index 0000000000000000000000000000000000000000..7155fd3db505ec577b03df537f4dfa92ce784094
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
+                reg = <0>;
+                parallel_ep: endpoint {
+                    remote-endpoint = <&parallel>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                csi1_ep: endpoint {
+                    remote-endpoint = <&smia_1>;
+                    clock-lanes = <1>;
+                    data-lanes = <2>;
+                    lane-polarities = <0 0>;
+                };
+            };
+
+            port@2 {
+                reg = <2>;
+                csi2a_ep: endpoint {
+                    remote-endpoint = <&smia_2>;
+                    clock-lanes = <2>;
+                    data-lanes = <1 3>;
+                    lane-polarities = <1 1 1>;
+                };
+            };
+        };
+    };

-- 
2.51.0


