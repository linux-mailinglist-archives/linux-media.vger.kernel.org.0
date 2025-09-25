Return-Path: <linux-media+bounces-43195-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE1EBA054A
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 17:30:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 475FA3BBA85
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 15:23:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A25AB315D4B;
	Thu, 25 Sep 2025 15:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CWkd9nPe"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F92A313551
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 15:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758813472; cv=none; b=vAp+ZESJes+G9sJRNi3HxHM97WYl3/Z0mUx9eF/AYawSjpCCaR8Zb5y8G1OwGS2SquGswBrL1yBDb1pNj6bA+Ds/I2fRNR/OOhBu0urpwH6JPOK5P03i8W+CYm97mq9T324R523n6APEtVnMDoyQUyktNsU9z/DOGCKgFcwuG3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758813472; c=relaxed/simple;
	bh=gpoDHkJKaBLo4I5P8qTwM5e7B7PwG7fYx3AIUNIrLrg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mfxxqSLKz79pd5GukZ5mpIdVaLFNg6XT6o4aE18BOy4ttTUBVFwcCYoeMtqE75nEmOvM0UuFOficWIR9YDI+HlesW4otu/M/zuP1L5vMly0lMmD6rZ4qjxxB7skJYOlyyTt9loW0xcQ16ipb9oAtCMI8jpFWL4Zdbe06jOxS6o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CWkd9nPe; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5797c8612b4so1479312e87.2
        for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 08:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758813467; x=1759418267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UluGas5X2LWmQB7iVdb5z5eOB2ccnl2sNvVSp9MKYIw=;
        b=CWkd9nPe5110OeFGZ4GlN/QW+hQJTIFgMBHRnZ7tkXt8UJAsYmbGbQInC8NNAZ3Yy2
         RRdDaIxDq5hhK4WdOUtE3lzD5SIS+Or8uA+pBEDrQBA1TOqMM9Il59UbVmu2KFnN4tLx
         90bmBOKP88F8kzwkAnpIUhcmUFOQvlWn/2o/dq6kCCou9SAddfbEIb6uwewgxbHc6dCb
         vBWgxOTRYMvDozOCyGsv7fOMelH6SlokzhuHtcm1pHTjHDL6wSZqMoFMo+b86TYrugiu
         dPaAlG0N1xjFVvDKXnYHxBhl7IpTk9Zaa7hrVQT8ypUJSCXZPJWkYo+SA2jEOYOPFjoI
         o/VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758813467; x=1759418267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UluGas5X2LWmQB7iVdb5z5eOB2ccnl2sNvVSp9MKYIw=;
        b=UOnIPn75jrJno5DLciLql2hLiccTJcurjwxCVi+b8qsJ+MCyIoq0d1P3BsioLwMtOo
         xq0Cr92XSVF+gitec/tEPXwaPAjhPFMe2nc+uuI7hv0oRtyE9ah9mvVEC4UnUaDP911B
         /8FEaM1cXUS6iSxO7IU0XwUHtNs66kWALMYKfOYTS/zsehZs4tBxcQd+DMz4ASmYdlP2
         wGNjqjRmkNvM9nQu6wB4cRu4H7EJwoLcO2ZX460obobA9AVxVyaX7NEE2yxbwp5RUYfh
         Y+PpBZiSzlQekk0P/bxAcsJ5fEZx5OSxEhqrDZVjqXAeMnZ/3imm1AFX2WKTP7C1JULI
         D9VA==
X-Forwarded-Encrypted: i=1; AJvYcCVkm1ygY2DUAFJs+m9cNrHqlueS1kR3nkCoAFRy0i82TXj5LN9kpEM9zxWeI+E7DPPMOwa0N6duVLQ+EA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9HcUWxmETlQwI1tXoVSovrwofxGaqdZ0zkRG87oVHJm/XhVlr
	pHC1aX3eGEPy7B2ROG1U3N125irhTqw0w375fdJnZVbq5w6Roil22f2N
X-Gm-Gg: ASbGncvPMFRU1reDgX/MSb0QjB2dT2gceU864dnW15TujFt/nZ0N6m071CB1AmMl/Vy
	6M9hfzxLfmK5a6fCU1cCKcw1376bVTGeZgQlu6B42r3O9GVNJGBG3zOCwDNXLwf2kFyjRzoW9FD
	vMkpdAE7b1G3F02jomqZy8difJZZRF9mdyZRmJQdxtE4d5d82VgSMOv+McshqjB/4ka9/S/Xz0l
	FA/EoIUjIBMyHktSdJ5ngAC5Kw/deyIushTBbdQWfUPDifeYcQ6FGUrqWeOs6/6R54zGuidmvKC
	gk4s6VYkRKFs115+XYUSlcBeavnWNOcTMa4O1vJ+H9oK8unH9jsghogH8pz1U6kP+XHJxTYY+Mg
	aNjOhe2+gPilHYg==
X-Google-Smtp-Source: AGHT+IGed0vIRa+md+egWvWqgYYl4XwnX/bKqIftOs7kK/BC39V/DrV+l1FBmmZSDKHaohVTfkYJWQ==
X-Received: by 2002:ac2:51c8:0:b0:576:fbdc:e3d9 with SMTP id 2adb3069b0e04-582d0c2a3e0mr1199445e87.14.1758813466370;
        Thu, 25 Sep 2025 08:17:46 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58313430496sm870084e87.27.2025.09.25.08.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 08:17:46 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Aaron Kling <webgeek1234@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v3 20/22] dt-bindings: display: tegra: document Tegra20 and Tegra30 CSI
Date: Thu, 25 Sep 2025 18:16:46 +0300
Message-ID: <20250925151648.79510-21-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250925151648.79510-1-clamor95@gmail.com>
References: <20250925151648.79510-1-clamor95@gmail.com>
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
 .../display/tegra/nvidia,tegra20-csi.yaml     | 135 ++++++++++++++++++
 1 file changed, 135 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
new file mode 100644
index 000000000000..817b3097846b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
@@ -0,0 +1,135 @@
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
+      - nvidia,tegra30-csi
+
+  reg:
+    maxItems: 1
+
+  clocks: true
+  clock-names: true
+
+  avdd-dsi-csi-supply:
+    description: DSI/CSI power supply. Must supply 1.2 V.
+
+  power-domains:
+    maxItems: 1
+
+  "#nvidia,mipi-calibrate-cells":
+    description:
+      The number of cells in a MIPI calibration specifier. Should be 1.
+      The single cell specifies an id of the pad that need to be
+      calibrated for a given device. Valid pad ids for receiver would be
+      0 for CSI-A; 1 for CSI-B; 2 for DSI-A and 3 for DSI-B.
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
+        maximum: 1
+
+      nvidia,mipi-calibrate:
+        description: Should contain a phandle and a specifier specifying
+          which pad is used by this CSI channel and needs to be calibrated.
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
+            required:
+              - data-lanes
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
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra20-csi
+    then:
+      properties:
+        clocks:
+          items:
+            - description: module clock
+
+        clock-names: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra30-csi
+    then:
+      properties:
+        clocks:
+          items:
+            - description: module clock
+            - description: PAD A clock
+            - description: PAD B clock
+
+        clock-names:
+          items:
+            - const: csi
+            - const: csia-pad
+            - const: csib-pad
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
-- 
2.48.1


