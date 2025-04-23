Return-Path: <linux-media+bounces-30850-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAE2A99667
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 19:21:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED88B3B6EAD
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 17:20:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5926A28CF64;
	Wed, 23 Apr 2025 17:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="n8ugwoI0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5AD28B511
	for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 17:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745428843; cv=none; b=JLWaVPZQq0WvY6rxudU1RkmwB2DwcJXJT2kq+nhMnosjB4bEoD/n+aoVE5PKItpdeBHm/8B4fxPk2WKGTYZX6kBTZ4I3MolHm4qUbIfqfefJlmQfTz2bYaQgqMU326v2DYqWwXnfNdsd7VPhB8s2WqtAxTRF/ZNXi4SndONxrR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745428843; c=relaxed/simple;
	bh=ftFIstl1yhNalSsorIejsk2ReNc21T86IDQ90JSWiFw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NkTNn/ltZ7JYuNcGLT0pOkEtE69Z3Qt1WI+ZrG45q2l67YafZMYaJJ+6e7xdFC5Y6PPhjM7IGbTguprLWF2E5AnuQIKl/V2PwR9qL+Pq9W2RRzVkEdTYm+V6FVNUqK8ll1mKIropqMsEom0s2O5+3204TWZDFP7fBmDGYOEyyKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=n8ugwoI0; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43d0618746bso539515e9.2
        for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 10:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1745428840; x=1746033640; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EAANU+XIZrUPIW6CAFfax2bnLKgdooprA5iPXyYE/lQ=;
        b=n8ugwoI02w5vKryJrkJxom4A1SfUp1SyVRWdYDDHaFsfO/rjST/TXaPwQmEgKoJHq0
         MVUfw348BP5iZ3DPepWAEWYOScLedzSWopEqX7hM+2rsDZdO1DEDJ2RS9DYb9+bT9o+a
         eWRcY7sp6B5qwvNAh0xVLoNDC/doyDPDBJkCp1oEZR3KzBgjDvO9NXyMolcqvLwTe0/p
         +VvBwOqMUfzqVpdDHQvp/xHlhE3RQbOOH+d/Fw3/hvJMHdWMdDOOXO4/TbtdRXMb+rBY
         cG/pUr3jDSE+OQXQfV/QRzLW0uue0nUiAb3Dt2Gbc94jkUZiMLfxfrbTowawNuPqOZhE
         i3kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745428840; x=1746033640;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EAANU+XIZrUPIW6CAFfax2bnLKgdooprA5iPXyYE/lQ=;
        b=Z7+wGX2VDczopLrkCG5Ie916GeHRJJCPBjD9eSMe5u+tXENhpdPd4+NVoFyiNOO63f
         toqXMRTmytXBTx0MwnhXV8skaj/2ZPj/tRBe9L7ppO/6v/PiW1FL8Y9/y7WCEo/tdvIj
         pYnqBWSyBqbS2YxZnfT+TVFQCTxK5KdGG14ayMN87UnfyeFxaESNxMcBtVZf1b1Nz6EU
         PrAp6evEWPKLpgX9mJn01AdtP6Q4Zn94Cc6nXNDFt1TVv+GjHkpRXzlNJlY4owMHqO+G
         aNfkhm1hqkni9k3YAvc4B+CqERBdNAWbohRJCDPYr5HMT/+abJ/mSYAKZ40jPh6OAagM
         LMng==
X-Forwarded-Encrypted: i=1; AJvYcCWJQAjN/DWU6LZ+EfQk8FuaBNpSKamN6DKAT6AR45EOPu3HmNP7yKdBNlp4JBv6AoU+jRMSNCegE1JYqA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7pI5jfxcptgnlBefRXqCbIyUvud5rGAewjFUq/2YABHf+Zhjp
	9VEvGnOzyLOKRoF+BDHCeAaaxK75PNTW/MEgxObCMWNND1UBJh6aFJ0G+dNkxXU=
X-Gm-Gg: ASbGnctHCNPxEAJ0+Z87NLOmicR/YDUd/Gj3Jw5aswcaNxg+XAX/QT8OWnMTCko0KIJ
	I0vvqZfwGXJyKtbNbICY23q7F8Q/5Db/r5SBB3XcEuRJM6X0MJUc+zTv+CQSOI9ABGhxhtDpLiM
	VX7e39G457oDCai08Jj9oj2pqLyFA77ND0WE1b7fhor9Tmo12P5098BaRJBfTjbUGAH8eJN84J4
	GykCa5+ouydOFSZqlL0o2d2+Ogw5XJTbxxT7ALxtTuOdg0EcxkNt6r3DK+MDEws0H3eRFOpFAk4
	+p5ALaFKe9cvxYaKI6al9t0h9o6iDn5T
X-Google-Smtp-Source: AGHT+IE6A6rGDK5+UwA4nNVAweDZRFVgbHEtVUgwIxRZIYBtxVB2yx8gDbY5T8+UpwH9WyHnBKi/mQ==
X-Received: by 2002:a05:600c:a363:b0:43d:2230:303b with SMTP id 5b1f17b1804b1-4406ac0a8b4mr165209425e9.20.1745428839881;
        Wed, 23 Apr 2025 10:20:39 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-44092d18433sm32940945e9.1.2025.04.23.10.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 10:20:39 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Apr 2025 18:20:20 +0100
Subject: [PATCH v3 3/5] media: dt-bindings: media: Add binding for the
 Raspberry Pi HEVC decoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-media-rpi-hevc-dec-v3-3-8fd3fad1d6fb@raspberrypi.com>
References: <20250423-media-rpi-hevc-dec-v3-0-8fd3fad1d6fb@raspberrypi.com>
In-Reply-To: <20250423-media-rpi-hevc-dec-v3-0-8fd3fad1d6fb@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 John Cox <john.cox@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>, 
 review list <kernel-list@raspberrypi.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: John Cox <jc@kynesim.co.uk>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

Adds a binding for the HEVC decoder found on the BCM2711 / Raspberry Pi 4,
and BCM2712 / Raspberry Pi 5.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 .../bindings/media/raspberrypi,hevc-dec.yaml       | 70 ++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/raspberrypi,hevc-dec.yaml b/Documentation/devicetree/bindings/media/raspberrypi,hevc-dec.yaml
new file mode 100644
index 000000000000..b86534f2689f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/raspberrypi,hevc-dec.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/raspberrypi,hevc-dec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Raspberry Pi HEVC Decoder
+
+maintainers:
+  - John Cox <john.cox@raspberrypi.com>
+  - Dom Cobley <dom@raspberrypi.com>
+  - Dave Stevenson <dave.stevenson@raspberrypi.com>
+  - Raspberry Pi internal review list <kernel-list@raspberrypi.com>
+
+description:
+  The Raspberry Pi HEVC decoder is a hardware video decode accelerator block
+  found in the BCM2711 and BCM2712 processors used on Raspberry Pi 4 and 5
+  boards respectively.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - brcm,bcm2711-hevc-dec
+          - brcm,bcm2712-hevc-dec
+      - const: raspberrypi,hevc-dec
+
+  reg:
+    items:
+      - description: The HEVC main register region
+      - description: The Interrupt control register region
+
+  reg-names:
+    items:
+      - const: hevc
+      - const: intc
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: The HEVC block clock
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    video-codec@7eb10000 {
+        compatible = "brcm,bcm2711-hevc-dec", "raspberrypi,hevc-dec";
+        reg = <0x7eb00000 0x10000>, /* HEVC */
+              <0x7eb10000 0x1000>;  /* INTC */
+        reg-names = "hevc",
+                    "intc";
+
+        interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+
+        clocks = <&clk 0>;
+    };
+
+...

-- 
2.34.1


