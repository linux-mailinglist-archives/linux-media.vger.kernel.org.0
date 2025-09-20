Return-Path: <linux-media+bounces-42834-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 42679B8CFE2
	for <lists+linux-media@lfdr.de>; Sat, 20 Sep 2025 21:48:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5360B7E3803
	for <lists+linux-media@lfdr.de>; Sat, 20 Sep 2025 19:48:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E63C6264A86;
	Sat, 20 Sep 2025 19:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K0Q7pibl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920A025FA2C
	for <linux-media@vger.kernel.org>; Sat, 20 Sep 2025 19:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758397692; cv=none; b=ltzAQQ37SpCKhqFwQJi9VbFadUSwjp68aOicODMua9JbN+sb7a2g5c3j1cPYfgcY4RDO1TM6Non78b425y//ANFhH82d1EcJRAsKMcGFLa6kYrKI2Ey/8PsGAAOSYs9TKB3U+v66pmccfQ/f+okflpZKzTQ53wqdr61VW9YoeKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758397692; c=relaxed/simple;
	bh=/KPv4MgQEpLvAih7BS5s/P1Mq+1CJqxQzq3jnJhp2m0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UJRQXNbrVxspn2bqnnDE6cpkU4twLxMwKalB4kD9CIo+yIRKE9gFiRwtPpvK4pZdSFxmr6AK+NN3O97p24xZn0N6zFEAi9OyZct0PxZm6JWVMwL9PBcx3bGcrTqAEvtHUsGaYurjDk1OksOAInCyK1Ik5WI6OJE1DXn/kPvr9rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K0Q7pibl; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b07e3a77b72so610301166b.0
        for <linux-media@vger.kernel.org>; Sat, 20 Sep 2025 12:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758397689; x=1759002489; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7alitCORyqMT4E5keq2CkjbuTZjskpd+AbemV9BwsME=;
        b=K0Q7piblCiombfA2X2rsjChK+/Xo1cE2QhjnHnbz0/duaIgBiKOgsSkdOXYdD26hNl
         nMMGhp4qh8IIuO6/1UquIFk81auPz0mHT0vrScpafVslthLiD7XfMtA6unczHteR253M
         PUH1pWA1FM+DM0SHrN+u9e4eGA0QqiaugCXPNoP43ZaNKMnm081D45gYhDYLLqDEppMI
         A+ZD0s1wgSGRp5fjzc25y9Xky3y+o/32RZjdDP+FUncXv162i40Uo8Oc8DdgCiEdgYks
         ac5b9EQVkXGrj/App//BgWJPAnknH4JxFsw5G2pUTOsa64DlQWzcwgfgKXZ182OOTHRQ
         gtxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758397689; x=1759002489;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7alitCORyqMT4E5keq2CkjbuTZjskpd+AbemV9BwsME=;
        b=J5nCwwwa85vRK4GDFoxkAJTKQyjWRs04QFc2OoeXi2uBYzq2FyikJZ7WSeSEsVTnke
         oSiFxKathgnLsG8HZ6kGEiGPDHWMToKkeXfKhuLtZHYS8aLqjynlC15qBZQBvlekm6lc
         XZGNxxOvs7o0t6LqIRfB1DjaawtzJcALRUGE+eW5BjjvAr5srCbR9HLQimw4E+mslNFD
         j8mOhx1vTPzF1kfskMp+GrXjUDyP8wzhaxq1ENnHURws2YFpMF7UBRm0ATxtY+Aeqq2M
         lUNBNcKlBUiyWilqwYaanHADXwOvOdM+WkMKMclrRCG+5CRZ/6Um0jM5e1fRYsI7gmc0
         6XaQ==
X-Gm-Message-State: AOJu0YynIK3XGjEwwsCRk4o7h5xvhocsUcXdj62z5mg0hwNLtacJRrKK
	W2Hp6BU1O4D1qDKtQ/EX2tI0DtmM7hvXfChbvV+iYvIjjGUAxQXGEooJ2C4YycyM
X-Gm-Gg: ASbGncso4AQpC1YHHqi5Wp9YPSyRnPUbLB8Nfbz+ztT91U4hMTDHTqYCXLvUWqB4/sy
	CPy3rDENIw5S0gWFFFO3glfkjCVC/iqJkiV2UIkLIdELwlCcm5yObSkPVf0w10tHqhNu/rwuHEX
	aKV/5YZrRd+T+woigJ7hbrTvzbAzpXGnACarX5MxrYlOmFdBrpWPWN5bazQYq71qjTF/k5gtHz8
	qWWYkp1e+I8IbPR09UKQalL70Cm9KZ8MvQwnpl7crd5J4sDOsNYrQZdkWiOah+j8LPOk6zIpT4G
	HFE+lw1RY233UgbAbmZciz6gzDfV9xa2+lusVIBT+4sSUhHAMTOms4FrkZaBE0jTsg7yQmxetdI
	C0hGftR4UJm2o67bzWnzVTbTkYQ+EPROWdgt+S+/yY+A30oJ8p74cPua+QvRRxCihz5ynO0YUXr
	5k
X-Google-Smtp-Source: AGHT+IGLOWRuH2E+3f3td8UchAn2tLIf7pZmiMOEpVcsBurOiW19xCg49X0acY5sLWb9Ce96nwpbGQ==
X-Received: by 2002:a17:906:f585:b0:b04:4579:486e with SMTP id a640c23a62f3a-b249041666cmr901375366b.28.1758397688715;
        Sat, 20 Sep 2025 12:48:08 -0700 (PDT)
Received: from UC-PF4PV1FX. (246.79-78-194.adsl-static.isp.belgacom.be. [194.78.79.246])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b1fd15cb2fesm729271466b.89.2025.09.20.12.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 12:48:08 -0700 (PDT)
From: Philippe Baetens <philippebaetens@gmail.com>
Date: Sat, 20 Sep 2025 21:47:58 +0200
Subject: [PATCH v4 1/2] dt-bindings: media: i2c: ams,mira220: Add mira220
 image sensor
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250920-mira220-v4-1-921b2e83a352@gmail.com>
References: <20250920-mira220-v4-0-921b2e83a352@gmail.com>
In-Reply-To: <20250920-mira220-v4-0-921b2e83a352@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Philippe Baetens <philippebaetens@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758397685; l=3936;
 i=philippebaetens@gmail.com; s=20250821; h=from:subject:message-id;
 bh=/KPv4MgQEpLvAih7BS5s/P1Mq+1CJqxQzq3jnJhp2m0=;
 b=MOkZtJ0ocFODv3VxqlrptCWN3tKqISraA/g4f9pODo949In/t1B+cuz8O2xH6P2lEv6IIl0hS
 XjKqtBMNItiBccnPtrTeJU4h8eg1BjYu8Xn6R9d9pqkHoTu+MdzbnKc
X-Developer-Key: i=philippebaetens@gmail.com; a=ed25519;
 pk=ncW5oAP1p6X8AZAmXP1ADcmlj6QUxXkN7oPfZV/DqYg=

Mira220 is a global shutter NIR-enhanced image sensor made by AMS.
Driver is submitted in the next patch of this series and verified on
a raspberry pi.

Signed-off-by: Philippe Baetens <philippebaetens@gmail.com>
---
 .../devicetree/bindings/media/i2c/ams,mira220.yaml | 108 +++++++++++++++++++++
 MAINTAINERS                                        |   6 ++
 2 files changed, 114 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/ams,mira220.yaml b/Documentation/devicetree/bindings/media/i2c/ams,mira220.yaml
new file mode 100644
index 000000000..ae4613d0d
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ams,mira220.yaml
@@ -0,0 +1,108 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ams,mira220.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ams 2.2 MP NIR enhanced global shutter image sensor
+
+maintainers:
+  - Philippe Baetens <philippebaetens@gmail.com>
+
+description: |-
+  2.2 MP NIR enhanced global shutter image sensor designed for 2D and 3D
+  consumer and industrial machine vision applications.
+  Due to its small size, configurability and high sensitivity both
+  in visual as well as NIR, the Mira220 is well suited for 2D and
+  3D applications, which include Active Stereo Vision,
+  Structured Light Vision for Robotics and AR/VR.
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: ams,mira220
+
+  reg:
+    description: I2C device address
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  vdig-supply:
+    description:
+      Digital I/O voltage supply, 1.35 volts
+
+  vana-supply:
+    description:
+      Analog1 voltage supply, 2.8 volts
+
+  vddl-supply:
+    description:
+      Digital core voltage supply, 1.8 volts
+
+  reset-gpios:
+    description: Sensor reset (XCLR) GPIO
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+    description:
+      Video output port
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            anyOf:
+              - items:
+                  - const: 1
+                  - const: 2
+
+          clock-noncontinuous: true
+
+        required:
+          - data-lanes
+          - link-frequencies
+
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - vdig-supply
+  - vana-supply
+  - vddl-supply
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        mira220: camera-sensor@54 {
+            compatible = "ams,mira220";
+            reg = <0x54>;
+            clocks = <&cam1_clk>;
+            vana-supply = <&cam1_reg>;	/* 2.5v */
+            vdig-supply = <&cam_dummy_reg>;	/* 1.8v */
+            vddl-supply = <&cam_dummy_reg>;	/* 1.35v */
+            port {
+                mira220_ep: endpoint {
+                    clock-lanes = <0>;
+                    data-lanes = <1 2>;
+                    link-frequencies = /bits/ 64 <750000000>;
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index fe168477c..c179b931b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1350,6 +1350,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/iio/light/ams,as73211.yaml
 F:	drivers/iio/light/as73211.c
 
+AMS MIRA220 DRIVER
+M:	Philippe Baetens <philippebaetens@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/ams,mira220.yaml
+F:	drivers/media/i2c/mira220.c
+
 AMT (Automatic Multicast Tunneling)
 M:	Taehee Yoo <ap420073@gmail.com>
 L:	netdev@vger.kernel.org

-- 
2.43.0


