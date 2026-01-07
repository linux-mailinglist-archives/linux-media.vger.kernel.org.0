Return-Path: <linux-media+bounces-50089-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C36A6CFBF58
	for <lists+linux-media@lfdr.de>; Wed, 07 Jan 2026 05:30:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6D7BA30060D0
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 04:30:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C93C24BBF0;
	Wed,  7 Jan 2026 04:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oe6x5Cyp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D24247280
	for <linux-media@vger.kernel.org>; Wed,  7 Jan 2026 04:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767760230; cv=none; b=aai01DHtMI/3dKsVkuqrcsNlQNFUnIaV4/zQmsnTdv29ettv9JmUPnXUklqUPetbHsnQTfDdk+1WPYghFAGRzURUxzx7A9hcEpIazR61Cpp2ZlK2g1qoMewj6nhxT3N9QyazY7zEX7bUGaLqMBh/0aT7znNWBbKXZajkubV5rDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767760230; c=relaxed/simple;
	bh=2mAOAFc/agjI54Nr7+sfnOZzAwJp3gIykYm59KR+z7k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tDwKWP5rs7oq9ilwUWVoL+j064WOxBi7vhLilvZnin7oAYxyzL7AywHrFN2WyrHUkweshKqvsd45OfWnq2IJT/EMVEYPOlGwyB4O2FReYlBVI+QRxefPZnk3NaXFCYkqA4fgL24hD4hYbWaAsl9CjT+yz8Kb+FRYBSTFVIMsOO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oe6x5Cyp; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8b2148ca40eso231163885a.1
        for <linux-media@vger.kernel.org>; Tue, 06 Jan 2026 20:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767760227; x=1768365027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fiyoDmK3zuMseKoGDWF5UAGrYB5nGzeQ8RVPJ0LAKdg=;
        b=Oe6x5CypS5rislHeRkKnLmPD0UiVL6J7idHaI+WDs31xWKh/lr0y1sl0gju/gxoRVi
         3K+x5nVXBs7CP6LndF0POB51Nh4Zlt6EW6+2VGtvJlZuS2eLI1mtIkoStMs3FBVIu4IB
         kyNVaXIQDSSwm9tg0R6a7XZSy+iemSqd2qNvPHxskGAfpc2HcHn1Wv/5AmDhBgoniPtR
         pipdaGIWebQ+kn4jSFr7mMkLe+5rRiFny/swPernsRvTjfPb2yvHJe36Ii83fdOiLAr1
         TIKi3SQ3DAJjbX1Voxu73wFXFUvlj3PK4ykXZg71ee0gQ8c6B6eq9R3pBCe+Cl93vOaI
         7Glg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767760227; x=1768365027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fiyoDmK3zuMseKoGDWF5UAGrYB5nGzeQ8RVPJ0LAKdg=;
        b=ohzFaKTFU84tKKbK4cKWjTHL3UFGXTi7jO0uUxBIkYrQa3zpKQag+dmCmSx1DeYgLv
         AP1FEymrEamGC3dureX68Lof7CFAS62X1qBRMez2w+4ihODH66KoVObhwTY3Om2mIylU
         i+onqYCtLJB+D0bz/vIYPQSvOYteu358C2P6/CBDCVBigqfcE0TX/W+FxZuXtmEqg9fc
         0jcTtxVGocvEI7RPENzmNJa9DqRoerfu6XlMyRkEQPqSnlwADFqu24kbScWjTchKVHVG
         kPAqqgeBy7UpVe4hanGdtoyBekff0VN40udlUxZ08ExZBb8YTrUiPatYT+psTBlltNHl
         DfUg==
X-Forwarded-Encrypted: i=1; AJvYcCU/PcKTWuFVOROPgBEiSrjdQdDPQsOY7b/6XpjekwAXqDJRRe8RM2Qz1rFleIXpnjrbBbspWuCPz/AWTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxLahNPzzxdzh28zAvbtOnEshBERgpU97diRXCknVEdNWbPmuz
	7cQbz5bmwH7HTxgAjtK9DbR5/u2tOzTN8K/6SNmApDxo/7wsnzQ6UAheu7A/Hw==
X-Gm-Gg: AY/fxX49aeMAhlSocWCU1NCyElYyFvZ4AVmibtNgunS1CDpBaC9KEwbjX2XvxZxDPp4
	8TAT8UiC6mHhqPx+SaaU1Qb3bay4uBnL3HTbkLSasrF2ad3RYhKjyG9V7fsAHkjm/Bl2w1Urrwf
	H/pGmjnaS8AmYl1QJT5fLZk8qmDuVGC+okLc0UU36TdLktRXJXxU8i+/miByl4uRucNsYMr/LeR
	mUra+ZYzvHAgfT7J9nPv6RKT/WnnnSh5J+VbR6MGpO7BCtvAOy9FwAB6lYSBpSdayZ9UZX3oog3
	VCE88OKualGsDfg/OaKvmMJloDdHRjVk0tWTAJSzg2unt43OiEoHej6bVJhLG+xkBHgRVTsyFSc
	86BDEy0a6BkE29Ug784vwACBXCyNbga52YKeMG6TCjBqsHYfuhzxxHuIX97Iqh9Dx+4Y4Z/vj++
	b0RFzFBEPYsCoJvVHiUhFoNpkXUAqcnbqlkXBSr+QXlnM9JAOWfITcTvIjnPWJ9IV4jVjr38B7Q
	zc=
X-Google-Smtp-Source: AGHT+IHWMHIfFGCqFRydG39OHjSg67TX+mHLBysALb8NVfLYBS1bljpRTSn7qx48KsV/yjCdVs+q2w==
X-Received: by 2002:a05:620a:298c:b0:8b2:e986:2704 with SMTP id af79cd13be357-8c389369d72mr167201785a.6.1767760226868;
        Tue, 06 Jan 2026 20:30:26 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4a794bsm308762285a.9.2026.01.06.20.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 20:30:26 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Robert Mader <robert.mader@collabora.com>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v6 1/5] dt-bindings: media: i2c: Add Sony IMX355
Date: Tue,  6 Jan 2026 23:30:40 -0500
Message-ID: <20260107043044.92485-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260107043044.92485-1-mailingradian@gmail.com>
References: <20260107043044.92485-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IMX355 camera sensor is a camera sensor that can be found as the
front camera in some smartphones, such as the Pixel 3, Pixel 3 XL, Pixel
3a, and Pixel 3a XL. It already has a driver, but needs support for
device tree. Document the IMX355 to support defining it in device tree.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../bindings/media/i2c/sony,imx355.yaml       | 115 ++++++++++++++++++
 1 file changed, 115 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
new file mode 100644
index 000000000000..33d253ca0e4f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
@@ -0,0 +1,115 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/sony,imx355.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sony IMX355 Sensor
+
+maintainers:
+  - Richard Acayan <mailingradian@gmail.com>
+
+description:
+  The IMX355 sensor is a 3280x2464 image sensor, commonly found as the front
+  camera in smartphones.
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: sony,imx355
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  avdd-supply:
+    description: Analog power supply.
+
+  dvdd-supply:
+    description: Digital power supply.
+
+  dovdd-supply:
+    description: Interface power supply.
+
+  reset-gpios:
+    description: Reset GPIO (active low).
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            items:
+              - const: 1
+              - const: 2
+              - const: 3
+              - const: 4
+
+        required:
+          - link-frequencies
+
+    required:
+      - endpoint
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - avdd-supply
+  - dvdd-supply
+  - dovdd-supply
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,camcc-sdm845.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera@1a {
+            compatible = "sony,imx355";
+            reg = <0x1a>;
+
+            clocks = <&camcc CAM_CC_MCLK2_CLK>;
+
+            assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
+            assigned-clock-rates = <24000000>;
+
+            reset-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
+
+            avdd-supply = <&cam_front_ldo>;
+            dvdd-supply = <&cam_front_ldo>;
+            dovdd-supply = <&cam_vio_ldo>;
+
+            pinctrl-names = "default";
+            pinctrl-0 = <&cam_front_default>;
+
+            rotation = <270>;
+            orientation = <0>;
+
+            port {
+                cam_front_endpoint: endpoint {
+                    data-lanes = <1 2 3 4>;
+                    link-frequencies = /bits/ 64 <360000000>;
+                    remote-endpoint = <&camss_endpoint1>;
+                };
+            };
+        };
+    };
-- 
2.52.0


