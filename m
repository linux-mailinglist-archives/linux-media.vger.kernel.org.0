Return-Path: <linux-media+bounces-40004-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B14B28ADD
	for <lists+linux-media@lfdr.de>; Sat, 16 Aug 2025 07:57:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34B221C20AFC
	for <lists+linux-media@lfdr.de>; Sat, 16 Aug 2025 05:56:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ED6D1FBCB5;
	Sat, 16 Aug 2025 05:55:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351BD1F4615;
	Sat, 16 Aug 2025 05:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755323717; cv=none; b=kAx0+dgcNkvqek2RFcBVatiiqlcq6kXOIr9MpxFggibb4XPzF+2oBISyGFMbKlB3k1JtWhvDoP4InA7z2rKlULludPOjcmsyDaNpHBWweRL1T+TVrMkRITtv3I517ME5QwufEtIxYi54ASOC30Er2t6bQz28swPQ68iAPJoH47I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755323717; c=relaxed/simple;
	bh=1V+8kS6GZTnk9SvLNX5osVSVF7aOGssqIZgBwqR08io=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XPFdol7bCGUcfnQRx3miKnYTmo35nYNZDxbkFGVJuA01drx/eODcnoiauiERCLFR3jHfAxxmvEITF7kwZGd97wDCMczLVvtpItwFQVCx61iJ7bBkiAQCc56bCEZ3v0B0ScK5DFzMv1OPc6z554ZtNNFCzAcbHJGYJ+CncS6H53M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=willwhang.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=willwhang.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-76e2e60433eso2019198b3a.0;
        Fri, 15 Aug 2025 22:55:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755323715; x=1755928515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1DxrGkBUPFLX3W6oqWKXYIoIc1TSctUbLJzEW+JwYuM=;
        b=sRoRm1acZAtIUkZHlCqDgQOChycw/YvFmm80xcZfWCTclJhqsss9DS5NTM/57UEFSS
         4H+xTR4/xisDY4bgQ/fMD1fx6o8StS3f8nUl/0jzirATWpG9DYuNp+fKK2WsvpOUoO4U
         CxTuNaeBTAjVtOqOYn7zUMWL/5Wc8h6RXCxpVhBidYysX/i9j8uYEkdQk6TfCfmlcQrf
         /RNCmak9zIXlXRPX7glg31gbAaib6Uf2dYrKBF/8idJyKOFIOI3If4ZGfE7fq0Gz9u6r
         RHpscsHklES+EqwIl0AdQWKLlbi4J69oaIPB2E74yohUNy81yCWaTEYYvKfOtx+qG56a
         vHAA==
X-Forwarded-Encrypted: i=1; AJvYcCUmF7lTZJ3JnHcpKg3yh2eVsARLCBhV7xvPhVrjTayo0EAVnOnW//3vby961wBqqmDVLBxeuGpDY5KM@vger.kernel.org, AJvYcCWUxTh8AuOf9mqsDCreH9n9HfGRF1nSyQ0C0+MbI506S1UfVAlConUolCQb/PlrgqH1pbxzXdErLX7uGbdH@vger.kernel.org
X-Gm-Message-State: AOJu0YyhOXEhdO2MZeLSd7AzFJ4eXCrQC4B1WVzYxzF4/qz/0LHyNHo3
	9srUHwLx15OkhgNyQggqRLY9K4e7zryaBSJ1/f+ml6gB+US5cZSBl1Tx
X-Gm-Gg: ASbGnctOCQJ9CHySAeG9sWMTnwNaRoP2XllH1/6UPvwBgq4wmFMAKSkBzig10fyBeAR
	RHsZnX03phgbc8nr/DajTk9+xe/Dm0d/NbflgoIFuuYBn8VhFo4ZXUINdG8pFBo7DWnuE14QeKC
	8y+A1glmDmauyoxRUy+ksALAXGR9UzYY6OFqyqt1kHpkNGv5PQFxxDSbPDP4KdDQKKBFurmm1mo
	wzJLzh5jVY6tTJMqSHAuwhqFyfz4opvvCHRhjM4Q3TIqH+8emX8HIBB4pr17bj42j9UYN47cE7I
	fBcOF44p1+/GcjyGAFPriggpa5NYVIdsKcEx7Ppn4rnGw7D7U8iIqxRbAIQwsu2BhnxO9dKbE95
	4gv47OA5slPo6h9ENf9rgvGIoGtpNIiXaJWmVGqWcMd/ahSKZ4JJc+6xmKVz+bj0hAnlF09QVmX
	UpfQ==
X-Google-Smtp-Source: AGHT+IFyHiS49/D/iPWxilJTBcbUDkiSVDAHtOu1z/F4AU+9dvHfFydYg4BN9Zvvq7VBtTgF8Ak0aQ==
X-Received: by 2002:a05:6a00:1893:b0:76b:e805:30e4 with SMTP id d2e1a72fcca58-76e44838e26mr7106437b3a.24.1755323715430;
        Fri, 15 Aug 2025 22:55:15 -0700 (PDT)
Received: from localhost.localdomain (c-24-4-34-163.hsd1.ca.comcast.net. [24.4.34.163])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e452663f0sm2402730b3a.21.2025.08.15.22.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 22:55:15 -0700 (PDT)
From: Will Whang <will@willwhang.com>
To: Will Whang <will@willwhang.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: media: Add Sony IMX585 CMOS image sensor
Date: Sat, 16 Aug 2025 06:54:31 +0100
Message-Id: <20250816055432.131912-2-will@willwhang.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250816055432.131912-1-will@willwhang.com>
References: <20250816055432.131912-1-will@willwhang.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the devicetree binding for the Sony IMX585.
The schema covers the CSI-2 data-lanes,
and the synchronization mode properties used by the driver.

Compatible strings are now using the full parts number given
the review comments from patch v2.

Signed-off-by: Will Whang <will@willwhang.com>
---
 .../bindings/media/i2c/sony,imx585.yaml       | 114 ++++++++++++++++++
 MAINTAINERS                                   |   6 +
 2 files changed, 120 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx585.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx585.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx585.yaml
new file mode 100644
index 000000000..b1a4f447f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx585.yaml
@@ -0,0 +1,114 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/sony,imx585.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sony IMX585 CMOS image sensor
+
+maintainers:
+  - Will Whang <will@willwhang.com>
+
+description:
+  IMX585 sensor is a Sony CMOS sensor with 4K and FHD outputs.
+  The driver supports both imx585-aaqj1 and imx585-aamj1.
+
+properties:
+  compatible:
+    enum:
+      - sony,imx585-aamj1
+      - sony,imx585-aaqj1
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description: Clock frequency 74.25MHz, 37.125MHz, 72MHz, 27MHz, 24MHz
+    maxItems: 1
+
+  vana-supply:
+    description: Analog power supply (3.3V)
+
+  vddl-supply:
+    description: Interface power supply (1.8V)
+
+  vdig-supply:
+    description: Digital power supply (1.1V)
+
+  reset-gpios:
+    description: Sensor reset (XCLR) GPIO
+    maxItems: 1
+
+  sony,sync-mode:
+    description: |
+      Select the sensor synchronisation mode.
+        - internal-leader  (sensor drives XVS/XHS) [default]
+        - internal-follower (internal clock, external XVS input)
+        - external         (sensor follows external XVS/XHS)
+    enum:
+      - internal-leader
+      - internal-follower
+      - external
+    default: internal-leader
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            oneOf:
+              - items:
+                  - const: 1
+                  - const: 2
+              - items:
+                  - const: 1
+                  - const: 2
+                  - const: 3
+                  - const: 4
+
+        required:
+          - data-lanes
+          - link-frequencies
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        imx585@1a {
+            compatible = "sony,imx585-aaqj1";
+            reg = <0x1a>;
+            clocks = <&imx585_clk>;
+
+            assigned-clocks = <&imx585_clk>;
+            assigned-clock-rates = <24000000>;
+
+            vana-supply = <&camera_vadd_3v3>;
+            vdig-supply = <&camera_vdd1_1v8>;
+            vddl-supply = <&camera_vdd2_1v1>;
+
+            port {
+                imx585: endpoint {
+                    remote-endpoint = <&cam>;
+                    data-lanes = <1 2 3 4>;
+                    link-frequencies = /bits/ 64 <720000000>;
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index fe168477c..ec7a6e29a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23535,6 +23535,12 @@ T:	git git://linuxtv.org/media.git
 F:	Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
 F:	drivers/media/i2c/imx415.c
 
+SONY IMX585 SENSOR DRIVER
+M:	Will Whang <will@willwhang.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/sony,imx585.yaml
+
 SONY MEMORYSTICK SUBSYSTEM
 M:	Maxim Levitsky <maximlevitsky@gmail.com>
 M:	Alex Dubov <oakad@yahoo.com>
-- 
2.39.5


