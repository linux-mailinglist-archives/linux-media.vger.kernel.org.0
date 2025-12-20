Return-Path: <linux-media+bounces-49251-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD83CD36C3
	for <lists+linux-media@lfdr.de>; Sat, 20 Dec 2025 21:42:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A763F3009865
	for <lists+linux-media@lfdr.de>; Sat, 20 Dec 2025 20:42:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CB9D312814;
	Sat, 20 Dec 2025 20:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EmQ2l1w4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC040312806
	for <linux-media@vger.kernel.org>; Sat, 20 Dec 2025 20:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766263369; cv=none; b=JgGThih9EqrrH2tK3H/LoX1duMPhU4rvqzpPpRwXgcjx1aKFETDWA9u2fOyqyECoXXdGO6XlOQ7BVsjN//hg6cc7BMp/37NPtSZxz7JwdFns9gvOHvKXTzb9Rn4wmDxrB/1mqtsaA+6cBxSORTtXPOOy8QyKskDqhmCWIohgP/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766263369; c=relaxed/simple;
	bh=GSKFnpxSXVsqbfKAdV5IWaf20H7hq0L5b5alyeT5tf0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gQoT19vDASIVf2cyfKlkis8bkWTMhqpbEozoRj84AS5sv7S3vw3cZxSbgcMogzlJ1TX9eMWR2vTQhv5tJGLfyo80puCRGYjL7K1y5SHg6dkLxrf6Q9csqwDjGL7CMqpO/QWhBXAbiFNbsImOk62C+syDriplVsLX0qIHBpdmB0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EmQ2l1w4; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-bc17d39ccd2so1735345a12.3
        for <linux-media@vger.kernel.org>; Sat, 20 Dec 2025 12:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766263366; x=1766868166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o1gn5oD3hXl18WHBxvxdIuEL4NyVJgXGPq7DVV2iXzI=;
        b=EmQ2l1w47sGP3bDXlKwab+XXUV30OxdAukrTpREUoZwpUAdM7HJBy3oONWa7MclDOj
         CMBTgKdJA7EqIjoyabCekMmtJsSBtaclwGSzUOPq8PELThESC+LV8+Urqnr5dYlYSvXI
         imqPpDpNT485istt942z1gAWLlg4Uq0mXmVpOc5wms7UIKEkMbrDySeSS5M2l/tMu80q
         Fy/8JMnSo4SP+4VMvKnNYwGttkczMlq1yTVcqV/kofA+IrWlIoYNgnBsALaKrdJ9Sp13
         pZR45/6AES5xWBAqoqMEqKRIy7na38qHQRA4xZo6JeBsEJ2SbqQCoof9znXvMSVKns/w
         Jjcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766263366; x=1766868166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o1gn5oD3hXl18WHBxvxdIuEL4NyVJgXGPq7DVV2iXzI=;
        b=vegNY5FuLLoTV6xL9b2Z78/jKMEUecRWMgOUnBdTyHb8m2xkm/6f+/gspBV49Ym9TQ
         PCXl5dqZ8AyMFSv3IXf15tC9diYEc0IsUNO+/ewU0pZ0Kt2Yn5aGq3+P6BAe7pERPXMI
         qpOwJjnQuulVNxGT/xkzMbplkW0H+0MIz/Fy9aLvLz+ZuSlx04X8krclN+3rqcvgRZPg
         0B/R458Pmj3PrN6yJvKBS0HxzWPgfXt8pLOYzjZLPGtrvjEtwazIdwrFc7lZ+o0kv9D1
         47tmMpK0BqgvHSN6+j/0vY6FNkMd+24rlfIPriawGfhuXCR6Gm16W4Jphccrurna/JgN
         980w==
X-Forwarded-Encrypted: i=1; AJvYcCX7JM+NbxA19ZUNkv/+ep0pgG71I1IctQTITVaBcACAh87U3/Dm5o+KSifpmT12usCqfKyiIgObyNuYGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoB0nQ2pbu3qrehRi1mx/7ZqZMKP7W0Drmz0ShbW5urAbftsjl
	RAOvou1FikxLiK8yCjnxoZ36DE3PbTML4r8J+J4m3JRKz7cWnxQWWb2D
X-Gm-Gg: AY/fxX62t1/WW7t9t+3zr7iZPCqFPBtE4DPlZCFStkfnxLTdojpKsHAKStil873Ysyr
	xhhQ6rk3EM6xVZrVmg3HkZJi6JRr8j445qnm8fwFYqFHPUjRgpGd4fugOF29pN/wNv/lZQIIHO5
	vFJj0rk3NTwyy7M6aQi2W05if3htHAi4ra1hHO961eWg0HONuJjXf7QxtlljCnAm0o7tHqiBzQQ
	f4GiyYR94tkLV83F8msHb1CS8mXiAu89ynVG9Kv5VF79hSejUYzQjUjy4HWU5iS3OWcnob0640K
	8bYcIZry+jqmem1DC96hEW+h3MK2uCC1snlCd9BSoSfccsaqc7tgrKdFXn45g3zi+Yx8z2Hn0++
	BBuxjHZoKpsxVklEampJ3YKotvIBmH4UTCLjx/OiLzqsf6Q8EVeoScFmvisdMiISAD/A0sKVrGG
	dvlgBFLYvMBfQ=
X-Google-Smtp-Source: AGHT+IGhJqh7Oi8dv34ozEIBRyGIX4JFqgrpTU898LzoIIXRQ/VtEoiXkbYlp7hFwRiU+4j/HmjRCQ==
X-Received: by 2002:a05:7022:6ab:b0:11b:c0db:a5ea with SMTP id a92af1059eb24-121722d3a98mr7607029c88.26.1766263365868;
        Sat, 20 Dec 2025 12:42:45 -0800 (PST)
Received: from fedora ([172.59.162.202])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217253c0c6sm25462571c88.12.2025.12.20.12.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 12:42:45 -0800 (PST)
From: Alex Tran <alex.t.tran@gmail.com>
To: mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: pavel@kernel.org,
	sakari.ailus@linux.intel.com,
	mehdi.djait@linux.intel.com,
	alex.t.tran@gmail.com,
	laurent.pinchart@ideasonboard.com,
	hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v1 2/2] media: dt-bindings: ti,omap3isp: Convert to DT schema
Date: Sat, 20 Dec 2025 12:42:23 -0800
Message-ID: <3c5a55cc5873e8d16bd25c5968a0d8b36e180325.1766123192.git.alex.t.tran@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1766123192.git.alex.t.tran@gmail.com>
References: <cover.1766123192.git.alex.t.tran@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert binding for ti,omap3isp from TXT to YAML format.

Signed-off-by: Alex Tran <alex.t.tran@gmail.com>
---
 .../devicetree/bindings/media/ti,omap3isp.txt |  71 -------
 .../bindings/media/ti,omap3isp.yaml           | 182 ++++++++++++++++++
 2 files changed, 182 insertions(+), 71 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/ti,omap3isp.txt
 create mode 100644 Documentation/devicetree/bindings/media/ti,omap3isp.yaml

diff --git a/Documentation/devicetree/bindings/media/ti,omap3isp.txt b/Documentation/devicetree/bindings/media/ti,omap3isp.txt
deleted file mode 100644
index ac23de855641..000000000000
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
index 000000000000..3f3b0c0f46e5
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/ti,omap3isp.yaml
@@ -0,0 +1,182 @@
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
+    description: the ISP interrupt specifier
+
+  iommus:
+    maxItems: 1
+    description: phandle and IOMMU specifier for the IOMMU that serves the ISP
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
+                description: |
+                  The lane polarity (required on CSI-2):
+                    0 - not inverted
+                    1 - inverted
+                minItems: 2
+                maxItems: 3
+                items:
+                  enum: [0, 1]
+
+              data-lanes:
+                description: Data lanes (required on CSI-2)
+                minItems: 1
+                maxItems: 2
+                items:
+                  minimum: 1
+                  maximum: 3
+
+              clock-lanes:
+                description: The clock lane (required on CSI-2)
+                maxItems: 1
+                items:
+                  minimum: 1
+                  maximum: 3
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
+                description: |
+                  The lane polarity (required on CSI-2):
+                    0 - not inverted
+                    1 - inverted
+                minItems: 2
+                maxItems: 3
+                items:
+                  enum: [0, 1]
+
+              data-lanes:
+                description: Data lanes (required on CSI-2)
+                minItems: 1
+                maxItems: 2
+                items:
+                  minimum: 1
+                  maximum: 3
+
+              clock-lanes:
+                description: The clock lane (required on CSI-2)
+                maxItems: 1
+                items:
+                  minimum: 1
+                  maximum: 3
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
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+        };
+    };
-- 
2.51.0


