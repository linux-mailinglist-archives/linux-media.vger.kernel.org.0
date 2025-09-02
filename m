Return-Path: <linux-media+bounces-41513-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2559EB3F5F9
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 08:54:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9B06485EEC
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 06:54:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E78C52E62DC;
	Tue,  2 Sep 2025 06:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PdDBWoyw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA1C2E543B;
	Tue,  2 Sep 2025 06:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756796013; cv=none; b=eNQQDKmGJyR6ZW07/csS3JTIPOLzu90WPA0a0VT+7IcyI3zEHoOndC991ZnjO3H3qcos8J+BfZ5oi0CHZpUrGDo8B98TCQXXWaYjQEXB7mxLJu0FOkBODWycoi4RqB2GJvP0Oym6/GJM3dRdDz187PO/tvFWggSwQCxsezbmxF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756796013; c=relaxed/simple;
	bh=P5/2XPz98ClkoAoXRMzbxKUyEvZuY8O/vm7ocp5NTgI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mJ0j3G4uSMGoMuBOtqutwyV1JOhmTEwJPEKSs4G+Oiur3iEFAHmL8QXG52L4T8PywrIwgZwEYW86oMvd5ZhPN6F8+3ONiFvhvy3p37PAYAdhrlJKDEIaAb4Vs0JyDelcctWTVszp/cer4nt1yFnkR3DL5aRWRvGC1JwDQX9Vwj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PdDBWoyw; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-248a638dbbeso44398885ad.2;
        Mon, 01 Sep 2025 23:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756796011; x=1757400811; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MU8Gw8tbO6qz4iZSksnsNZa290457GeKEn/IZPBnLlA=;
        b=PdDBWoyw/FfEd7JrNsiw5ecmzgsBSTuVT5QSHu8SusTFm4K+jhdAKfr/hqldWtIe/j
         y+7LayQ93gbYK5Awaq2M5bRRhymtM9VJZPvzAjOJiT6x450i79QYoQ/8MYKAs5jC4EkX
         x44VAnuH4EkOuQcuWtFfQN+ImkFq+hURm9Nrku5wYwzhlmRubWbkoldii28SSm4DLXyU
         7kO4qCLg6GwXSvMQfSfGzitnE5amPMAjKyfxyxJo8SNDGFzXD3feCjKdNfQOjIFgKUOZ
         T7gqMhyZqy6dL/dNfJ3+ThE/Yp7CG1wFkLvNwJLNZ+T7NsdDoeP3B8aTdW+leVKpAKVy
         Nqmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756796011; x=1757400811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MU8Gw8tbO6qz4iZSksnsNZa290457GeKEn/IZPBnLlA=;
        b=vb/KkiWEf7Aq2ebiBDfLGCZU0lHOCpHRVyR5DhdV+YQhdkZKnIrY551Zs+zxmJ4tGO
         qwXa4/WQlKEBevLaQp+NNUyRhAnnW7B08XdGyPt3P/hW/KJIlKhmmKRubrJFVqWH/F2P
         9ffiYJISb7bgwMCI7o2Rlr7jB56NHShpttKQxhO0eqjkYbtG8x9Hg+OvcY/g/00NrTz0
         72RR5sLt/lCOPbF6rli5ajAE3x4m9h8UqBOusS/YBydpbNJs+ubWJTlM0QM39ZQ6YOJf
         flslUNT8KSLVYvxLbsg+Sd087H6t+erC0RQM/GY4jaBrA2fULPMz3jEcaUU1RSKxovk7
         qCgA==
X-Forwarded-Encrypted: i=1; AJvYcCVjT3Pd66aDtPXynMrII4fe0Ds/9aT2n955jwp+yYkQKJtyT2iaD3LJjVdzDbg1ctt62wK0J3R8Z42TYu4=@vger.kernel.org, AJvYcCX5hv46IPo+FoYqpc4fbmgOgODFbcYwZ1LRueSAgbMcxwVg30jjkbj/ZMjQLBlH39HwcOGlbkCyl8WHoZY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzigBqbf4cMs9TzKo4j/oUMzgkP6ALagEkiKCir0DRVL8x5OuO7
	9wkI8d5X/tGihbuAImx1vH32+81difz4HBIPWwvKoaLWojo+3fp5Zykj
X-Gm-Gg: ASbGncvVmlK2pDrRn7NylFNndPoda+mxbBu7wFvsFtWDPd1rEUDr0iec+UmkVQq55aP
	d9pzV7/e+SuK+xUCaAhra+SSdPYzyuGO8CHSLOgFlTfF9Fy5WLqreUxYIOpC5gDwJQvUUioo9Pc
	fa2TDg5qqvPeryQ52DRm9X+dAahpOF8YsasNs17TPjbeh4XzpgTdiCPoPQXoIUfcCWCASWK5ehe
	qSWtopEr0XdVVutcaOwbgOtiieoFoVDzJgCezpH/jAh5jNVrbzWQJItPn/nCeeteIrQQ7QZxIr0
	+gYfIvy6wJovKX6zP9hOK0/1weY0+a8j3WCjfoHFXRQkbOBzXNurINc4qnwZGwReXQMe638G3TH
	onjCkDvE4isxsdp0kw8mpeX7nC4/qbdvJujv932jM7rib50CsrIObAatLx10Hxg==
X-Google-Smtp-Source: AGHT+IEnkNRuHNe3v0P3vAgxV79yVwnmXb+O5yf0kLTK/C1JDsKcYGfpwpXbQCLduu6ncmgTmDcnlw==
X-Received: by 2002:a17:903:230c:b0:248:ea98:3d12 with SMTP id d9443c01a7336-24944acc7d6mr144066625ad.40.1756796011055;
        Mon, 01 Sep 2025 23:53:31 -0700 (PDT)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327e8d3d635sm12312558a91.1.2025.09.01.23.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 23:53:30 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Date: Tue, 02 Sep 2025 14:53:19 +0800
Subject: [PATCH v5 2/3] dt-bindings: display: Add Mayqueen Pixpaper e-ink
 panel
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-drm-v5-2-d77c678c4ae3@gmail.com>
References: <20250902-drm-v5-0-d77c678c4ae3@gmail.com>
In-Reply-To: <20250902-drm-v5-0-d77c678c4ae3@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Wig Cheng <onlywig@gmail.com>, LiangCheng Wang <zaq14760@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756796000; l=2161;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=P5/2XPz98ClkoAoXRMzbxKUyEvZuY8O/vm7ocp5NTgI=;
 b=VPQSB+Y57f6ux3VjzY/8xlTaqaT7XrDQH8Sjh49++FLcQ1X6oCGUP7kMMDlr9AAnzUpEV9qo/
 pS2DhIRJF32AQAjzUTx4Ijun8MgNE7Sg2SY/8E/w4V8MHGKuuhVWOrc
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=5IaLhzvMqasgGPT47dsa8HEpfb0/Dv2BZC0TzSLj6E0=

The binding is for the Mayqueen Pixpaper e-ink display panel,
controlled via an SPI interface.

Signed-off-by: LiangCheng Wang <zaq14760@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/display/mayqueen,pixpaper.yaml        | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mayqueen,pixpaper.yaml b/Documentation/devicetree/bindings/display/mayqueen,pixpaper.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..cd27f8ba5ae1d94660818525b5fa71db98c8acb7
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mayqueen,pixpaper.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mayqueen,pixpaper.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mayqueen Pixpaper e-ink display panel
+
+maintainers:
+  - LiangCheng Wang <zaq14760@gmail.com>
+
+description:
+  The Pixpaper is an e-ink display panel controlled via an SPI interface.
+  The panel has a resolution of 122x250 pixels and requires GPIO pins for
+  reset, busy, and data/command control.
+
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    const: mayqueen,pixpaper
+
+  reg:
+    maxItems: 1
+
+  spi-max-frequency:
+    maximum: 1000000
+    default: 1000000
+
+  reset-gpios:
+    maxItems: 1
+
+  busy-gpios:
+    maxItems: 1
+
+  dc-gpios:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - busy-gpios
+  - dc-gpios
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        display@0 {
+            compatible = "mayqueen,pixpaper";
+            reg = <0>;
+            spi-max-frequency = <1000000>;
+            reset-gpios = <&gpio1 17 GPIO_ACTIVE_HIGH>;
+            busy-gpios = <&gpio1 18 GPIO_ACTIVE_HIGH>;
+            dc-gpios = <&gpio1 19 GPIO_ACTIVE_HIGH>;
+        };
+    };

-- 
2.34.1


