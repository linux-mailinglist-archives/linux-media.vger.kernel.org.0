Return-Path: <linux-media+bounces-41907-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B8880B46FC9
	for <lists+linux-media@lfdr.de>; Sat,  6 Sep 2025 16:03:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1043C1BC0BAC
	for <lists+linux-media@lfdr.de>; Sat,  6 Sep 2025 14:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C732305957;
	Sat,  6 Sep 2025 13:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d8vS0JK5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819EB16F265;
	Sat,  6 Sep 2025 13:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757166879; cv=none; b=f4+VM5MaOCJtD+sbvjg0JF4kV1WhNE7UtmnP1JgTBfOCWmQM4lc2hJh6pm+REA5dtmmS7li0d5q34xJldZzbv/iH8Tl3UQ4B/E0txkUeyw/CzX4VPvSKFzPvAp+KAIZPGrzx5AUWI5CRA/Y6h45XJsBaNx2ocmWxP6Zenv44fXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757166879; c=relaxed/simple;
	bh=ydOU85KNv36EF+TC1gm/KkRvpDsWvu6EFttlQUKlBvc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LHAioK5bCNziJJUOAUQVUcvi/QzrD3OmVwc/b7grrCad5Jitvne/1bbUo5Mupzj/PNtB9aPcCOH9IBfI9/re2S4K2Gt38ue2UHwf1eLZ5COzTLFbmornQGMOvgul1unDmVLJ48Uu9HnHodG5ysMgkvI6sRhk1HUwuHgBiB4afLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d8vS0JK5; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-55f6507bd53so3063396e87.3;
        Sat, 06 Sep 2025 06:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757166876; x=1757771676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qL0JUmWTkyFBMGydq+NFB1T+OALFnyaDwilHrorgTbk=;
        b=d8vS0JK5FbiFLIMIvZ98k1VQQAb1g8DJH/IOxBfe1Ik1yXRvvqVT9hbZSTcdhqfqdC
         HYlkgeNB9lkhRMOLTT4b0VJHvQB7b1VxFp4856jIGJp3zjTv8OxhkIWBfKBdhDUZqubM
         Sr2ks9wifBX65nqqXqusCbipLu7wEafZREvE3sqWQzaAb/ngD2Xz62GNUg8rksQUMmFL
         O9iaRjXF6A3MgTdIcjIVkWJADE1bNrox8e7k0GnJSZOW71mRTvcKEGsBGBy759BGCTcp
         PLsKIEXUsBB7QNpYS9akvvt3SNwAIXLWpz/RZXor26vhtLgpAj6MyOXkup2+frNetIe1
         VFyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757166876; x=1757771676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qL0JUmWTkyFBMGydq+NFB1T+OALFnyaDwilHrorgTbk=;
        b=oRKkKetzPkUReEaamrpDSu9skYpDMHq6RjjZIUMgELsAaE7i6gJ38R7K1FzlUjpUQu
         qhevdzOIEEFaQOeaajsy5K/vNms/hr/i3NhTf0hBdXCLt6cFlFB5DwR42ioycFFlF4yK
         43NIpNQqI+L4asdDWpJcSQglwzw5Jv8SJ6RiZEtRdAeVoEjHGoPt8PiZ85WtE2hXACn3
         zHjUXj+B4blRb9Ux0pCStoHiDKi/QaDz3/pqgbWBZy0pllr/nRv4XTBRRDjv+NymCku2
         vw90rDJKa3+ueVMeX0YCUm5xg+9DoA8FaIZha2IBwAtGjLJ7AkPVljeD8LP+imnPepE9
         1wWQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0HY0ULGWMJhM33HzOmv9T01wHgH52aE3fe2K85M/mBIeCrb1VgaxgNpIp/gtq4pOyMKevkg1xCXqX@vger.kernel.org, AJvYcCUBxGD0OxQHg+djqmsboVuTPGZ+U1GB4h+k+3rNRfjBtj80paFJVmuZh6dDpmZPm5uHeF86PSST7qRfLQk=@vger.kernel.org, AJvYcCUXKe2+tQRqy4t9uHql/y/XFDE8LXaNwNwCuzr/r1FAIfrgdEg9NekxGLlU8NdbrwZeUJTfna+cNZyPhrg3@vger.kernel.org, AJvYcCVtrX2o8im1zs7MQ24sA7l8xrCf/MgkUZLuxyGmTPmqIqu+rq18cTFaYO8QtwSTLmGFURsQFCDZcmaV@vger.kernel.org, AJvYcCWb+ksaNXcgL1KYoeuvMEoIqdZkiqLV+8/s0GCP73J1YK6voK0XxgJ+yc6VTbt9dJ5iVMInEULo9i071AI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwElPwFjrT052vygLfOWcW867W7LGi+xLIWMHJ/+j+1pcKWWJCe
	RVYRWZA6uxLh0l91ODI2PX+/okrbrIX767/dES+c5mDki3OmfHxcGsfe
X-Gm-Gg: ASbGnctwYw8d7/IQ9TK0w5JfsbQtf3VGP5PVEEG8tna0eCCkfqqc5bbYs6OnLeFAuaa
	pafpedWys+LssPWZzEyCCZVuBuEM8/i5OPYGlHQfWHM38VVqoOUiY01ac0sqnlIWUOE4QzA77wi
	d4GUN7Bjx14iOQH34m3OS3iEmb3KF6u3shImxF324cPDhqe5pzhIGQ1updgZjn6ey7ttJx1C17T
	Ql3rGER4irx0RzaKoULdINCYSVvy31RCa/gEhIqYbwHVi6G2ipZtV59i7jy8XCRgIZrSkqtCaeb
	iQkx5HOIm/Zf2QMWH5Nadl0zbBASn4pfz2OtME2qCQT6dzR3JGrlbTwCJz/1jZPPEewQhYdNz+b
	PHWRRV4LMvNxNZ73MKZX+OSUd
X-Google-Smtp-Source: AGHT+IEsBVYNgu9fx/P23umpxwqcCjAFXjv8bzOpOxv6Igr/LBYo56Zn4CLcBlm7uEi8JgMOACJ+Ig==
X-Received: by 2002:a05:6512:6404:b0:55f:6902:c9f0 with SMTP id 2adb3069b0e04-5626310bdccmr579165e87.43.1757166875448;
        Sat, 06 Sep 2025 06:54:35 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ace9c65sm2357467e87.85.2025.09.06.06.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 06:54:35 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 21/23] dt-bindings: display: tegra: document Tegra20 and Tegra30 CSI
Date: Sat,  6 Sep 2025 16:53:42 +0300
Message-ID: <20250906135345.241229-22-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250906135345.241229-1-clamor95@gmail.com>
References: <20250906135345.241229-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document CSI HW block found in Tegra20 and Tegra30 SoC.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../display/tegra/nvidia,tegra20-csi.yaml     | 104 ++++++++++++++++
 .../display/tegra/nvidia,tegra30-csi.yaml     | 115 ++++++++++++++++++
 2 files changed, 219 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra30-csi.yaml

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
new file mode 100644
index 000000000000..1a2858a5893c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
@@ -0,0 +1,104 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-csi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra20 CSI controller
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - nvidia,tegra20-csi
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  avdd-dsi-csi-supply:
+    description: DSI/CSI power supply. Must supply 1.2 V.
+
+  power-domains:
+    maxItems: 1
+
+  "#nvidia,mipi-calibrate-cells":
+    description: The number of cells in a MIPI calibration specifier.
+      Should be 1. The single cell specifies an id of the pads that
+      need to be calibrated for a given device.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^channel@[0-1]$":
+    type: object
+    description: channel 0 represents CSI-A and 1 represents CSI-B
+    additionalProperties: false
+
+    properties:
+      reg:
+        maxItems: 1
+
+      nvidia,mipi-calibrate:
+        description: Should contain a phandle and a specifier specifying
+          which pads are used by this DSI output and need to be
+          calibrated. 0 is for CSI-A, 1 is for CSI-B, 2 is for DSI.
+        $ref: /schemas/types.yaml#/definitions/phandle-array
+
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: port receiving the video stream from the sensor
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes: true
+
+            required:
+              - data-lanes
+
+        required:
+          - endpoint
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: port sending the video stream to the VI
+
+    required:
+      - reg
+      - "#address-cells"
+      - "#size-cells"
+      - port@0
+      - port@1
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - power-domains
+  - "#address-cells"
+  - "#size-cells"
+
+# see nvidia,tegra20-vi.yaml for an example
diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra30-csi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra30-csi.yaml
new file mode 100644
index 000000000000..ea5ebd2f3c65
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra30-csi.yaml
@@ -0,0 +1,115 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra30-csi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra30 CSI controller
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - nvidia,tegra30-csi
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: module clock
+      - description: PAD A clock
+      - description: PAD B clock
+
+  clock-names:
+    items:
+      - const: csi
+      - const: csia-pad
+      - const: csib-pad
+
+  avdd-dsi-csi-supply:
+    description: DSI/CSI power supply. Must supply 1.2 V.
+
+  power-domains:
+    maxItems: 1
+
+  "#nvidia,mipi-calibrate-cells":
+    description: The number of cells in a MIPI calibration specifier.
+      Should be 1. The single cell specifies an id of the pads that
+      need to be calibrated for a given device.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^channel@[0-1]$":
+    type: object
+    description: channel 0 represents CSI-A and 1 represents CSI-B
+    additionalProperties: false
+
+    properties:
+      reg:
+        maxItems: 1
+
+      nvidia,mipi-calibrate:
+        description: Should contain a phandle and a specifier specifying
+          which pads are used by this DSI output and need to be
+          calibrated. 0 is for CSI-A, 1 is for CSI-B, 2 is for DSI-A and
+          3 is for DSI-B
+        $ref: /schemas/types.yaml#/definitions/phandle-array
+
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: port receiving the video stream from the sensor
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes: true
+
+            required:
+              - data-lanes
+
+        required:
+          - endpoint
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: port sending the video stream to the VI
+
+    required:
+      - reg
+      - "#address-cells"
+      - "#size-cells"
+      - port@0
+      - port@1
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - power-domains
+  - "#address-cells"
+  - "#size-cells"
+
+# see nvidia,tegra20-vi.yaml for an example
-- 
2.48.1


