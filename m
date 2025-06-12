Return-Path: <linux-media+bounces-34565-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42617AD6509
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 03:16:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E76BE2C0573
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 01:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 530DA1487E9;
	Thu, 12 Jun 2025 01:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LxNpb8/J"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10351624E1
	for <linux-media@vger.kernel.org>; Thu, 12 Jun 2025 01:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749690958; cv=none; b=EgFI6IVQ20mfvxO3X1fqded8GY1BVjR5nSE5sjwSbmn1L72RewYV2Fzekc/zfTyV9UORqi8AslK44ZAxMGcDxTpYXgG2pE7nGCueK6KFmR9dA15yeuqozPahMqrjJJ44biPxozXAzhimms6v0/Cc04YCmR6R9T91+cbkVrMxWDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749690958; c=relaxed/simple;
	bh=0cru2kAWvYKw6WCg3XYK1+ZsVviC7rXpg9HjVd4qbsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qVVOJxlBqLnLHzbm+c2PBHxVDIQK0bk4y/oDhuEl62XMuvsuTpuY+TWZJAB+kA6ssJWqkKHqkdK0S71Yka3UocYbg5okYmTFp9nk7mIEe7aiJT18y+p+tUOL0QT+8Du8ZcofZambetqbgE5P2z+9SUiTF+GoWwAmNhvh5pEIgbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LxNpb8/J; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-32b358f9265so89741fa.0
        for <linux-media@vger.kernel.org>; Wed, 11 Jun 2025 18:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749690955; x=1750295755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=svuLuiMu8pbZT5kif2pf6ZEnxJR7jTM6aK6jARjpg9E=;
        b=LxNpb8/JH1D7aExDOHRtXKmp17FPgPkiIsdqmw1OycAH4ds7yw09y3POLraxHYppSg
         inBYetoN2kjzNkehsLgqKZbyj9fy/zAkVYOCR4trabw9bFYOFAb8zDv8jUblSATUS2rU
         jp52Bl06NOI04AAocCBkAkWY48TBd0x+1DivrILcAWaFr95rCIV5SjJr9WVtfJ+d5iBZ
         dDQQQYw6rxz6i/fXIaf3l5ONf8EUNwues2FbEQTejaSnOHZeNgxpZOzx+qOBCFJkuCs2
         P7gjr24kQrUJjdzTfhtrcTO/HzO830nZm8rMs8NOXbXDs3V2yBXREvJkpriWSGyOFRlY
         XdqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749690955; x=1750295755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=svuLuiMu8pbZT5kif2pf6ZEnxJR7jTM6aK6jARjpg9E=;
        b=wC+9EF3b40P1ycoFHpZYIR4wOyMLG+zxJ6AJD5YiFumbRHox+Lbo7PzN3MnllhSncv
         LxjbKI8w/HZmkAdREjWpN3pS40D7kox0MgS18Mp6Mn+FIJwwt3FWIsB5ctOlIlQS70eb
         L6UEJTF2fTMPFxBf2G5a/FuN4zwBZZpbPGAr4OL9mnoN5NpmFkNip/5WDpNKIOnttUsJ
         UzxYh8q5PcRk4hnmmoTLnE69TQUukIqcM2wGG3ZmFtneTeLTC3xUa9MSLdoIWBcKUM7b
         Y8DSuqVi+buFEG3jwD75B/Yamml5noM3zW19fX8jlMdYMBePTMvJUAnY7iM9ODp2r+Qz
         1eqA==
X-Forwarded-Encrypted: i=1; AJvYcCVcrB96RUKs8LiKNMxw5O5sjYJpeUJJ8dKr7osQniQFWKZH2kneW4DKm9fRaz6v0YNUZXSmM7IgCozdmw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxaJYPfcHBQqKXecvMIxK6dH9NT2vfrp+pjQL5iX6L/scUfwDNf
	OS3OY0DpNXudArNja/PpZJTsq/Wy+41YBN9C+W6Vg/OkzoWo44BSGqMW6XRi46hj5jY=
X-Gm-Gg: ASbGncuRWuQwasU9eZ526+ifAUbZsbzfmTom4rj+ubzSHe9pU66/Mzh7ttffUExj0QV
	k8dwhy+FICl08U996KGWYocx2AvIybyz1u4xM6fuX2JOKUP8xYS4Tzpe8Nv6gV0k2LsxiNhhQ+E
	TzlX5U0a3IdFcJReT/T4qDC3/8RG3gwyCiXP12Es+ftg7ye2e8hNF9x1wjqXvYfhy4m4U3LeOhm
	of+X/HVxC0L3n/gckkEx0Zc3UwYOXB2bsH774JvKScOvQ90orF4MlVl7QxuWhhAbAxsHTuVLh8F
	3wiJnoJ720JhLIvcRv0sqxYUcV+hMDrbi4Jib19o4VvSiH7cTYvH+2UWauj7B0j4PbWSpWoxlcI
	EBV832iyZS3b5mqpI6Iq3iGFxYd++WoDbyqTzy0720nqdBHjxJQg=
X-Google-Smtp-Source: AGHT+IGgDuIhk6kLqUQOtqUcf9o4lF+ryKrfZ0MJcisyaQ6E+RSt6I43VsukyU0JnCaimHg2/zQseg==
X-Received: by 2002:a05:6512:1255:b0:553:241d:4e73 with SMTP id 2adb3069b0e04-5539c118325mr576829e87.11.1749690954994;
        Wed, 11 Jun 2025 18:15:54 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553a7018069sm62808e87.157.2025.06.11.18.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 18:15:53 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 08/10] dt-bindings: media: qcom: Add Qualcomm MIPI C-/D-PHY schema for CSIPHY IPs
Date: Thu, 12 Jun 2025 04:15:29 +0300
Message-ID: <20250612011531.2923701-9-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612011531.2923701-1-vladimir.zapolskiy@linaro.org>
References: <20250612011531.2923701-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add dt-binding schema for Qualcomm CAMSS CSIPHY IP, which provides
MIPI C-PHY/D-PHY interfaces on Qualcomm SoCs.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
RFC verion of the change:
* https://lore.kernel.org/all/20250513143918.2572689-1-vladimir.zapolskiy@linaro.org/

Changes from RFC to v1:
* moved from phy/qcom,csiphy.yaml to media/qcom,csiphy.yaml,
* added 'clock-names' property,
* removed SM8250 CSIPHY specifics, a generic binding is good enough for now,
* the above implies a removal of SM8250 specific supplies.

 .../bindings/media/qcom,csiphy.yaml           | 96 +++++++++++++++++++
 1 file changed, 96 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,csiphy.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,csiphy.yaml b/Documentation/devicetree/bindings/media/qcom,csiphy.yaml
new file mode 100644
index 000000000000..699824e7c44d
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,csiphy.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,csiphy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm CSI PHY
+
+maintainers:
+  - Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
+
+description:
+  Qualcomm SoCs equipped with a number of MIPI CSI PHY IPs, which
+  supports D-PHY or C-PHY interfaces to camera sensors.
+
+properties:
+  compatible:
+    enum:
+      - qcom,csiphy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: csiphy
+      - const: csiphy_timer
+
+  interrupts:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    description: CAMSS CSIPHY input port
+
+    patternProperties:
+      "^endpoint@[0-1]$":
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            minItems: 1
+            maxItems: 4
+
+          bus-type:
+            enum:
+              - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
+              - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
+
+        required:
+          - data-lanes
+
+    oneOf:
+      - required:
+          - endpoint
+      - required:
+          - endpoint@0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+  - "#phy-cells"
+
+additionalProperties: true
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,camcc-sm8250.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    phy@ac6e000 {
+      compatible = "qcom,csiphy";
+      reg = <0x0ac6e000 0x1000>;
+      clocks = <&camcc CAM_CC_CSIPHY2_CLK>,
+               <&camcc CAM_CC_CSI2PHYTIMER_CLK>;
+      clock-names = "csiphy", "csiphy_timer";
+      interrupts = <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>;
+      #phy-cells = <0>;
+
+      port {
+        csiphy_in: endpoint {
+          data-lanes = <1 2 3 4>;
+          remote-endpoint = <&sensor_out>;
+        };
+      };
+    };
-- 
2.49.0


