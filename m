Return-Path: <linux-media+bounces-25722-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDF4A2AFB2
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2025 19:04:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B43AF7A240D
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2025 18:03:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA45319E98D;
	Thu,  6 Feb 2025 18:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Z0123Wql"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B69E19CC34
	for <linux-media@vger.kernel.org>; Thu,  6 Feb 2025 18:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738865015; cv=none; b=tJys0oXblr4FGY0HikIFVKKnSt/+XhwGJeR3Nfw1oJdE8dUZ4mbY1dFSodXB36e/pE7MPMXhLsf05/+CFkC75GyYa+FG5moRKNaSXLIVfDHgtYiVz4Tz/0MlfnJ7PyajataTyJ7NXc+OwRaodpDXmoi5j/8SLlmGfr5D5SJa3dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738865015; c=relaxed/simple;
	bh=r2UTtoxqsTQAE5NrTtzww1y1OS1gn30nWJe58icJu9M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WS4KjAjKmj15Z8jzDnw8bOs2UiPif5s2seRorRWpOyZq/JcnbAdfit4W1YnDy3LB1Ge3EvEzC6OODsBJXNDOulnQ0p9qJR2QZMG3oCcAEwSuX9WF8sZIHx8niOR+xGQccp0sXxUQUlFt1Rqmrc9/LxdqZhDvaDGYeFmg6rjsQ2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=Z0123Wql; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4361f796586so14563335e9.3
        for <linux-media@vger.kernel.org>; Thu, 06 Feb 2025 10:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1738865011; x=1739469811; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6+Ptm0oRwTnL3Ocb32TjntW1tAXUnQly4a1T7oh0b/g=;
        b=Z0123Wqll5wBV7vI7OHJlsWFhw8Z9L20teDRYSojY+JN0aZCuFg3SlrDuqx525Dqq/
         PgkTsyJoi5dzCeAifYuouSqaKNtOSOjW4fMZqVFU/BqDYwJW8pi7Q08woNsRpyFl5mGa
         9hxzmM/zk+gmx9nqJTqu7Nltgjn44+bK6+ECkM2mGzT+PNY6IdPBOqUMwsZKgBq4iHpA
         75uG5VigAjkTo8QE/VyCyDh7KMNYNGPCfi8fzF6Mg+gJBU1be33r0dRY/8SWUwO7RpuK
         Ib5GPv7CmJ7JN/BMemLTOBwYI2bibs+Sx9CCwl7VpvZk626a+2CbSj/4ncGpJziaqpJx
         xuBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738865011; x=1739469811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6+Ptm0oRwTnL3Ocb32TjntW1tAXUnQly4a1T7oh0b/g=;
        b=SfuZh0Oisq8waUpaWl+bdmERuw9VA40qO6b+YdfZ9mDhTajrVm8/CIOFxlqjnQ+nMH
         iVZYwW31ArZ9pw+B7c+mFKCO7A8vEGoKaTKRVBGF0z55J7rAgjeFwSTpwcWhcFTJFvIi
         UjT35j9cwTr3+Ay/bgHvjso/AdpNeqi5DfzSm9RhMnd2GgyXzyUup6NcuvR1gNQ8cxVY
         6ApiCDeCc2deo6uJ2gw7UzOPWij37fXoQXq/7gUIqGljY07d7B73l3qsvgCmw/9KaVOQ
         q+dxbY209s9+9O3KTETydlCDlGv6Jfc6A7GuuGyO2MeCWvXN/0uHCwLuKOE3TyHdmDEA
         M+Fg==
X-Forwarded-Encrypted: i=1; AJvYcCVEl7TRDwOAKqtDw3rLzmor4kN4Qrt0MlJrOGpRLI2F+NfS4LsKAQ6UTH2LC8bbPWBk+ghHvLVPVcdsXA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp1xuxv/62KOOJdp6W66X1g2YW8ZK5qkPAfKmvvSfoBhPADq/4
	ULNcVZ+4/bDYeuQCJDdCsF/PmHCVf5ZnA53hvWsKfNJfYCDV4JlhD8WFIJmEj7Q=
X-Gm-Gg: ASbGncvX39+CJZ2wF9puiEMNCiKcGtl7NpzmNUPkW/A+N6K5hTF5Iq4a2U1DgrEtA9u
	twGJ38K7l1oQHM2MizDMHmCJA/2k7/zJo7oeSQMmC2wgw5zkOGv6Aiki9V2Ij5ww7EBVNkjZE4W
	PePUi8s1qeqApPhdBHVR/cCStoeSF036vzq8GQeSZO9xTuVWxjPO9RKHjFQV34CHaRsnxnYMFWz
	TXxta36+mSUke9Ggq5lcCSaN9oGXhBWevy++CyzsuvhoB317ffM/buxiXTZ1G7DX4r7d5lQtsPn
	cDNv4zM=
X-Google-Smtp-Source: AGHT+IEc40ueYLTteR1KlQ3fnrgzcK1xfXxwFu0xmwqnVwELnnEw0h737ayS1xCS2yNyZ8/F36GDAA==
X-Received: by 2002:a05:600c:4f91:b0:436:916b:aaf4 with SMTP id 5b1f17b1804b1-4392498a1b5mr4704265e9.10.1738865010000;
        Thu, 06 Feb 2025 10:03:30 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38dbdd3856fsm2278858f8f.28.2025.02.06.10.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 10:03:29 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 06 Feb 2025 18:02:36 +0000
Subject: [PATCH v2 3/5] media: dt-bindings: media: Add binding for the
 Raspberry Pi HEVC decoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-media-rpi-hevc-dec-v2-3-69353c8805b2@raspberrypi.com>
References: <20250206-media-rpi-hevc-dec-v2-0-69353c8805b2@raspberrypi.com>
In-Reply-To: <20250206-media-rpi-hevc-dec-v2-0-69353c8805b2@raspberrypi.com>
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
 .../bindings/media/raspberrypi,hevc-dec.yaml       | 67 ++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/raspberrypi,hevc-dec.yaml b/Documentation/devicetree/bindings/media/raspberrypi,hevc-dec.yaml
new file mode 100644
index 000000000000..06db7004c765
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/raspberrypi,hevc-dec.yaml
@@ -0,0 +1,67 @@
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
+    enum:
+      - raspberrypi,hevc-dec
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
+        compatible = "raspberrypi,hevc-dec";
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


