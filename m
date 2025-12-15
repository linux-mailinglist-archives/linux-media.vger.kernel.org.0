Return-Path: <linux-media+bounces-48770-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1F2CBCE51
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 09:01:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A579B3010E7D
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 08:01:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D50532C93A;
	Mon, 15 Dec 2025 08:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W2qFYxlI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D0332B9A6
	for <linux-media@vger.kernel.org>; Mon, 15 Dec 2025 08:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765785611; cv=none; b=iNQj0IKU2ND3s6a8dcaqwyPHmNLMrss9udTZt3Nq2dgKO02BDYtQNe3ULsBmtpwstc/mvhlLqZNWNfza5t7fbl/hdvm4B9ha0wxj8SY21oyl+6BuN91I7TKeHun6XZjECHAUh0U5+ogLBMsyTAdXNSAV9G6jpVAhTbpm+o2wrxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765785611; c=relaxed/simple;
	bh=QCz6aFbAKxYNVGwc04303xaq8oUpPnl7l7rMqJKXeEU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g2CpUwQOy4v4b0OmWfjKr26J9076ia3TsWn6TLsA2rBMF/GGiitstWpFT6u3rCw58jg9rre6QyTbB13BNrOcxHin4f53MNC/GMuuA+HKzL/yJ3i++B43cwKQIdbTvkN3HZ2MN0YfJpV6EcCNuOmcpwSNxPAMhqUBdzUcjbeJ/lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W2qFYxlI; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-34c27d14559so1315956a91.2
        for <linux-media@vger.kernel.org>; Mon, 15 Dec 2025 00:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765785608; x=1766390408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7tSlML4uKCCHRjDgUuA5+Z7+nq0n6j206qyzOtMJBNM=;
        b=W2qFYxlIY7Oolf+Uhey01GwQjGsU7XOoLW3+3VF4qCN2Ww36oATuSXc3iYsX81WG4S
         AdlzlLm8IXTsTG4xoHhBdt9Dyiz4mtj73X3bnacuWAu5GjkqKLPB8kWcYWESQtWfr300
         h8VYA5GjU6wsbMNfGi68rLqpFRX7PI3j+C53k+N7hYLGer3C//emU35+UvEX0isiYtTX
         T5SHEyt6A9OhUM1oPcVMhon17LAQ6G8AfMCG2rvyHFSS/tXuglt7VCS6/iYZ/Fapryxq
         F03JiaHx9qSyVKUix4+tZz7QJbSt8tJ1eAuUw08FKOJjahmT2wnlPBK39BvZNN4UEUcn
         23mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765785608; x=1766390408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7tSlML4uKCCHRjDgUuA5+Z7+nq0n6j206qyzOtMJBNM=;
        b=LcnswNT56s5zcdzSE4gvEpJGy7zRBmTh1Ib5Pmwsj+1uf1T1tdKPvfPiX/Vy88R7oA
         io5GgcyFV3FTI8k5TKQxZRKaYRBES+V38Zuajl5ZGFjvZPVQro9P8hCDa0CFMNz2JWJV
         zCmohOoA7nQjPw2vM8YxI4MIWfWGCp/LO4ZzRhj0tz8XX2ELNScLbL78AVFEvEml3lN5
         mZf1z2Wdpc+DbosmT3kUsAP0eqOyk3MvndKg0nKRZuPMh0NWcdSYSe6CkFi0GhxW3Vir
         hjc1pgrbTOH8V4vojYMfk/OL0x+fA9ZY7aKdxQQ3k2G0zitMY5OMpGiXZafnJIoS4fwd
         jZeA==
X-Forwarded-Encrypted: i=1; AJvYcCXeBk6JEDi3SgaGoh2JUu0dXFBZbNWAR6235XXwk56IfDsSG4PVvCxEjqjXa1nhCsauW+nm1pohm+i/OA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJwVSsSKROvd93yEmY1Y/dGqRg/BycOfmuX7J8YvvyN6f1GEBB
	mprbt4vwJUM6gU+z6V7yiFW9rHqtNTndAdUTN6nTocrtBzx330drnpd0
X-Gm-Gg: AY/fxX5pcel3GXQQBJidNGh9Ide5LF9h4zIodK6lAI5IBDvhKoQ3hET4HeRxpAhkILX
	L7ADmVVtuighfEv6EE04LOE4d19ZrN1G5gC0sXF+QEDwHP4NWX2lu67pT1qtUD4YMlkBv2QeykX
	aNAqW4AQE+da5ni98s30XFNHsN/uE34shDNNFK/EaV98OGqT7ibev4PNvjyxJbrt6plYtnQGzum
	hw0KpfvXxyyUDKx/qYm3883TMyFOoSHEpVfjUjJrAwZVpj1W41+yVdWyvMGdPVEHD9h8/A3yI8G
	bCf3heuefkOUlCQ9yHfT7rdOQGc/ZfqfCMFd9U5MpfdL1bQszOylaL969au1dakaardXRvYIPIa
	Sdzu/jv00W02oayaVvALT/UVKUYK6Cg2r8vRWCAskPZ81lwya0lS9/SyuZC0/0foDvySj7A4LcB
	Upr/+o2eSvvAw=
X-Google-Smtp-Source: AGHT+IHvfP5fbQNkStJwNn99uM97HKzJkrR2L4hGBv1RulgL1zBQt7w33jX/ynI+qGQSHpIEgrwTOg==
X-Received: by 2002:a05:7022:7f03:b0:11c:fe15:f66d with SMTP id a92af1059eb24-11f349c5bbdmr5406985c88.17.1765785607633;
        Mon, 15 Dec 2025 00:00:07 -0800 (PST)
Received: from fedora ([172.59.162.202])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e2ff624sm43637473c88.12.2025.12.15.00.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 00:00:07 -0800 (PST)
From: Alex Tran <alex.t.tran@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alex Tran <alex.t.tran@gmail.com>
Subject: [PATCH v2 4/4] dt-bindings: media: omap3isp: document missing crc as optional property
Date: Sun, 14 Dec 2025 23:58:35 -0800
Message-ID: <99fea6935f255661a2c41adc11ba5f85d17e3bf4.1765782992.git.alex.t.tran@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1765782992.git.alex.t.tran@gmail.com>
References: <cover.1765782992.git.alex.t.tran@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the OMAP3 ISP device tree binding from TXT format to YAML.
Add the optional crc property to the endpoint node for the omap3isp
receiver. This property enables CRC checksums for the bus and was added to
match the new driver support for reading it from the device tree.

Signed-off-by: Alex Tran <alex.t.tran@gmail.com>
---
 .../devicetree/bindings/media/ti,omap3isp.txt |  71 -------
 .../bindings/media/ti,omap3isp.yaml           | 196 ++++++++++++++++++
 2 files changed, 196 insertions(+), 71 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/ti,omap3isp.txt
 create mode 100644 Documentation/devicetree/bindings/media/ti,omap3isp.yaml

diff --git a/Documentation/devicetree/bindings/media/ti,omap3isp.txt b/Documentation/devicetree/bindings/media/ti,omap3isp.txt
deleted file mode 100644
index ac23de855..000000000
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
index 000000000..b86c3aa71
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/ti,omap3isp.yaml
@@ -0,0 +1,196 @@
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
+              crc:
+                $ref: /schemas/types.yaml#/definitions/uint32
+                enum: [0, 1]
+                default: 1
+                description:
+                  Enable CRC checksums.
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
+              crc:
+                $ref: /schemas/types.yaml#/definitions/uint32
+                enum: [0, 1]
+                default: 1
+                description:
+                  Enable CRC checksums.
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


