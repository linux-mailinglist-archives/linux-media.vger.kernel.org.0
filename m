Return-Path: <linux-media+bounces-25140-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 287C1A1932A
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 14:59:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CCE661887D51
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 13:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81177213E85;
	Wed, 22 Jan 2025 13:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="12SgurZl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876CC214201
	for <linux-media@vger.kernel.org>; Wed, 22 Jan 2025 13:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737554359; cv=none; b=M/7c9UwOrcm4CekIWHBZglAihf7yeiWYqVI9RxlMiO+/k9eo5EhbgsDD3V/i79KKj4w6zS6dgcUoxrvebRcTe8VD2Nyz8IstljVmV5HFX3XjbPWQBvfhvpeqV3deHFsBmCv8IV+P2TWLNkIJWc7Fw48l6BfVR6IvLyp9onv2JO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737554359; c=relaxed/simple;
	bh=A3C4gYhppuniiPw7B1IFPcvmmSv+NTGWD6uLyb/Q0YE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YBoH4obD6FuRmVObSWI2wn//zYUXb+HJYBRxHitF0y1hqR6F7FbwTbBIBlK3s+SkcAJ5rzHlCMsGeIPW0TNoCavZyA4mgQ9JjWNr8HJuF8uoq7Q1NVRayj3/Baq3YWnE1Jsd5IdeakIozrHRda1smYFhKG9BkHAu4KDylJF2LyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=12SgurZl; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-38a25d4b9d4so3748339f8f.0
        for <linux-media@vger.kernel.org>; Wed, 22 Jan 2025 05:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1737554355; x=1738159155; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=slHK6g+A3rv9otmptQvZeMFEpwk93d2jnoJ5fvlPAeI=;
        b=12SgurZlOvoy2IaVSCjTA8bLkqh4eMn3B90vDCd9hQIHmdtCdY2/MPDsYUhLDtdvEQ
         Ibjwer1fYJlxSoFciqt7anNDQ7NhCafRUOaczz7UOqVIb1MRuwZnVuAEkya/F82vqaNu
         7sFf+QMHPiYXcGOL+I15gDl+KT0/ftRGaOnO0cFyjinykkUiCh4IUzd2z2kiQq+H6O5R
         5rJ01KrlsytEkHBAp7akClqsirUMcY/GAFAU9M/YjRREQzA9PEU2iXfSeYdUYGT7eqy1
         XuznLQlNYvNk0rvd/np0DpFIC+eaFwDZ6NLha31K0LKq9tlds+kaFgMhJPmEIjfXoHTd
         Ccfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737554355; x=1738159155;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=slHK6g+A3rv9otmptQvZeMFEpwk93d2jnoJ5fvlPAeI=;
        b=uGsIjlmiuIEtZE6rW87JxQrG+DbZMDZ7Iz0y5vwfXVgeql0m75CSgg0kFTGUXMICx4
         dG6AcJ2Cm0KWSSdfiOJzxQxABiVjOCatNZeSZOVcCdhlEjhrf7hXKVrwP6pM9Ih5AE5z
         wyIB/SNzaHOVzaiEbvnSlGHUv9sLYQR5HexmzvRKuw0B+ELpu8nnD7jC/MsDsxeRk9wU
         IQoSdg3MVdFbiuUwvDyPwRP8SexdTt82hXtOGQuiMJPUIfBZd3AJ/WtVoE7qNqBYEmQO
         MkrM1Pyl8FUL8eL66iFWCc93mxOr7QGSm0LRAYYCiGzOiTHGyicMNB2JfMcmzuB5Jlja
         FB1w==
X-Gm-Message-State: AOJu0YyqTNXHigMh6r4Df9en6fIn1iEqmZ0fGMsAEKgxySkOHqZSnZ7r
	llyfr6zs1nE+8MIvJ9K7QOJykK96kyEiuiSRvVp1Gm+nJ2LO3SmQOKk0sskvjCo=
X-Gm-Gg: ASbGnct+L6fGoGyEn79TQfbPIKY2TdGojaH+7xNO0TIQfbs7pmv7syJG7iGqlReDApE
	bAmv+vbbdirDFH4Qj5eJzWerNMkVDWVLr5VhV/D1uyNcYQBOGk2As0dG3Y/6xR4DBEGW8Bx248A
	vj/KkTQPLRleAyayGMzYIu6R9Z60mHSJAzBg+vYE7oclPQRy7Ug5+Qkss3bHXbKhqTnjmv39yQM
	6BWKMBPwR6gxOJkiqct9n2myRHeEZETbdunpZCI5RFE/4f4NX1GuKofE3se/1F/LKT/SqSyrv0u
	N3SKpzJpknnxIpbUzzEk0Rv50DjyyIwiFVKdSO5XeYRRDSaHc3dJ3PRsAVRXAU34
X-Google-Smtp-Source: AGHT+IF0hy1W+aOU+17Gl9ZkkzxB9r26l+V6pkPB5W+gpNC11wIBBPbUVioMHG0KQW/1aZTkvVvKsQ==
X-Received: by 2002:adf:f1cc:0:b0:38b:ed88:f045 with SMTP id ffacd0b85a97d-38bf566fb1bmr17093395f8f.33.1737554354727;
        Wed, 22 Jan 2025 05:59:14 -0800 (PST)
Received: from [192.168.42.0] (2a02-8428-e55b-1101-1e41-304e-170b-482f.rev.sfr.net. [2a02:8428:e55b:1101:1e41:304e:170b:482f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3278f06sm16418985f8f.70.2025.01.22.05.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 05:59:13 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
Date: Wed, 22 Jan 2025 14:59:11 +0100
Subject: [PATCH v8 2/5] dt-bindings: media: add mediatek ISP3.0 camsv
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250122-add-mtk-isp-3-0-support-v8-2-a3d3731eef45@baylibre.com>
References: <20250122-add-mtk-isp-3-0-support-v8-0-a3d3731eef45@baylibre.com>
In-Reply-To: <20250122-add-mtk-isp-3-0-support-v8-0-a3d3731eef45@baylibre.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Andy Hsieh <andy.hsieh@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Julien Stephan <jstephan@baylibre.com>, 
 Phi-bang Nguyen <pnguyen@baylibre.com>
X-Mailer: b4 0.14.2

From: Phi-bang Nguyen <pnguyen@baylibre.com>

This adds the bindings, for the ISP3.0 camsv module embedded in
some Mediatek SoC, such as the mt8365

Signed-off-by: Phi-bang Nguyen <pnguyen@baylibre.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 .../bindings/media/mediatek,mt8365-camsv.yaml      | 109 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 2 files changed, 110 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..723df7c1a900ff6b72be084e09dfcf0190dee62f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml
@@ -0,0 +1,109 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2023 MediaTek, BayLibre
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,mt8365-camsv.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek CAMSV 3.0
+
+maintainers:
+  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+  - Julien Stephan <jstephan@baylibre.com>
+  - Andy Hsieh <andy.hsieh@mediatek.com>
+
+description:
+  The CAMSV is a video capture device that includes a DMA engine connected to
+  the SENINF CSI-2 receivers. The number of CAMSVs depend on the SoC model.
+
+properties:
+  compatible:
+    const: mediatek,mt8365-camsv
+
+  reg:
+    items:
+      - description: camsv base
+      - description: img0 base
+      - description: tg base
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: cam clock
+      - description: camtg clock
+      - description: camsv clock
+
+  clock-names:
+    items:
+      - const: cam
+      - const: camtg
+      - const: camsv
+
+  iommus:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Connection to the SENINF output
+
+    required:
+      - port@0
+
+required:
+  - compatible
+  - interrupts
+  - clocks
+  - clock-names
+  - power-domains
+  - iommus
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mediatek,mt8365-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/memory/mediatek,mt8365-larb-port.h>
+    #include <dt-bindings/power/mediatek,mt8365-power.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        camsv@15050000 {
+            compatible = "mediatek,mt8365-camsv";
+            reg = <0 0x15050000 0 0x0040>,
+                  <0 0x15050208 0 0x0020>,
+                  <0 0x15050400 0 0x0100>;
+            interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_LOW>;
+            clocks = <&camsys CLK_CAM>,
+                     <&camsys CLK_CAMTG>,
+                     <&camsys CLK_CAMSV0>;
+            clock-names = "cam", "camtg", "camsv";
+            iommus = <&iommu M4U_PORT_CAM_IMGO>;
+            power-domains = <&spm MT8365_POWER_DOMAIN_CAM>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                port@0 {
+                    reg = <0>;
+                    camsv1_endpoint: endpoint {
+                        remote-endpoint = <&seninf_camsv1_endpoint>;
+                    };
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index a83db41ae0e9427e983e02f01aecb08193da3cd2..93d59c24befd990abd96ef585607992a6b231b72 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14759,6 +14759,7 @@ M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
 M:	Julien Stephan <jstephan@baylibre.com>
 M:	Andy Hsieh <andy.hsieh@mediatek.com>
 S:	Supported
+F:	Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml
 F:	Documentation/devicetree/bindings/media/mediatek,mt8365-seninf.yaml
 
 MEDIATEK SMI DRIVER

-- 
2.47.1


