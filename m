Return-Path: <linux-media+bounces-37080-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F18AFC7ED
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 12:09:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A886483B10
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 10:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18CA826B2BE;
	Tue,  8 Jul 2025 10:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gdycy6mG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E1026B09F;
	Tue,  8 Jul 2025 10:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751969222; cv=none; b=dQPNKd+xy48Jb6ppcGuTL8EiAzQSDVjxr+OkOfcGFDdtKghqoRz8aTN6n0fWylUFBEcsJhHGDvoXvXBRg/BBGZBs9gnVMvuJK5NztXmRWZQajBIYiOfOkzZh9p3q+feTt3EDMiHSjFmKucv1Ifcki1Jq8+SZjtSymAgJWbcnnMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751969222; c=relaxed/simple;
	bh=e/Pd6vA+VmaF2zukYk9DBDpw0E2bjx0yWVQX/BqXoL4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IWgV/eVYznY18lxoORXzNAD5XuePuFfdHo7/BUNPPm7WA9YXLWBWkpDFOe3sI5Sub2e5TpSL7dH6Q56CH/GBI3+lZa2JYwXFJBdbt76wMRfVV+nS1wtmGc4N6c/gU2oJVrgNWzPuGcEDKPi2/jH5/G/7dqXb2tSretB2EybEs8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gdycy6mG; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-74b56b1d301so2333005b3a.1;
        Tue, 08 Jul 2025 03:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751969220; x=1752574020; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fVDZwMbI3MaZsqcDOMuRideVCsmXg1PFZTHplOr/W9w=;
        b=gdycy6mG907z/8iG1smz0YY96oEVlfgMlOcUvOW1Gttln/tdWtszNhsEvSAd2uYexQ
         fpD3w7G466tlrc37PvvR6AWtauXtnUhvDzWdflKyVMBfeLBfJeiMhwqnMug84ZHOIa39
         +OQPT8QhghKjJlEycG9rZsLsJf4Z6HiimWiU4pHQdO/M1fSGWQPjl5Kw3E361UI1xW0w
         ArN9keQ9z7Fh0migbwyu2WVt/fD0mhIxatgvbfsi2Bgs5M9W8YZpNUdFQ/Uhj0U1Yc/7
         VdvXVy1DcvfdiKqh8+KmfsBjsOoiLWdz+OFRbGpAmrDFqr/ITgRxw7uHidES0OIRoxI7
         sR6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751969220; x=1752574020;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fVDZwMbI3MaZsqcDOMuRideVCsmXg1PFZTHplOr/W9w=;
        b=r+brutq1sD/yAXk++vGw2gj3/9WDgoMvtQ1uXAcnpVAKWOzzbr67MZthwMgP3VCFqf
         kut9w3+ALlQO6ID56wZPWV/hyxLVQCNTpHmKwqf5yhq1T+Huy6VpI/C5J66zPYi6AZmb
         UvS+RfDazwHHuXfhYwtMLbZLpRJMTDThUc6HOZsdEHEX2dQGceq4m6pNRz0QIyNrcR4K
         3ySVJOx1oJEPTyTq2AAyumDr+ZSu08WZNctcmz4+KBh8Ns8/SFsVYwyaw+NSV3Qwbl8n
         Qk925CfUrpT5UHrnNZLyPKddZ+1repbC70QDTik7aGAZGeadfUENrLbnaKysdm/Q4TVi
         8iLg==
X-Forwarded-Encrypted: i=1; AJvYcCU+WXKrQUUpR372fYavwQPBBcEHabDaVL9MeycotESOvLokU8klNyc+BvqR1gu6Elgo9SG1+tDCDwQDMSY=@vger.kernel.org, AJvYcCVHkyqI5j6Kos3iIkdq5dw+iA8QOVJYhZU8FzKFrTs1Ce79g1m4fvl5eKm+yiBDU2+7fOOa5deo19VhQ5U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/rv4R2TidC/sUV+sQlGZ7oBy4sBrSjhRhzYp7N3O8fIryrr3x
	n9BCMO5jqfahBKUsYcTaExOQxWS4CCG1ISDg5JapWzh/4rWYAVphUgEbQo1rZ7KT
X-Gm-Gg: ASbGncvAzzL+Gjm0m9T6O/9pEgs2MF1nsqJXxorrZfBEjxcYz9Im1oA9dt2Et2WYdGf
	tu4yQudLXZRa72VQSjQ7bh8SBOJVc2mnaKi0PeRK6IZDhYjodl680VpbdpvjO74tLLlbwrE2Nn4
	0siNVFhyxX6g1LpBrehodjHRDkqnTNm5hLnXGgDZZEpWlHz1KkTbp/ALy+Mkrj2h8Su9yxKi9gU
	0nYsGScm1Mi5/XIOiSEm7OAQmEy7aoTagOnKhFQh9yXzu5JScm6jpMuZNXqlr0u7S6Us3Cf7lHU
	989n8UcZXVJpBHKP93fw7JvyDq9n0zretro+a9RqEyEmrjvUcPDOX2utoeBM1mLkW4Yic4GolM2
	PvCOll3enHseBJD4=
X-Google-Smtp-Source: AGHT+IF5IEEWA6P5DDZbTNTa4RdtlbgzI1iI+TTgS3Fon36qdFB1AdrHk/f2Cb401XdKTWTaFrqLUw==
X-Received: by 2002:a05:6a21:7a44:b0:220:10e5:825d with SMTP id adf61e73a8af0-22608fbba67mr24621523637.8.1751969220107;
        Tue, 08 Jul 2025 03:07:00 -0700 (PDT)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce359ecd6sm11971174b3a.24.2025.07.08.03.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 03:06:59 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Date: Tue, 08 Jul 2025 18:06:46 +0800
Subject: [PATCH 3/3] dt-bindings: display: Add Mayqueen Pixpaper e-ink
 panel
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250708-drm-v1-3-45055fdadc8a@gmail.com>
References: <20250708-drm-v1-0-45055fdadc8a@gmail.com>
In-Reply-To: <20250708-drm-v1-0-45055fdadc8a@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Wig Cheng <onlywig@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, LiangCheng Wang <zaq14760@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751969205; l=2111;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=e/Pd6vA+VmaF2zukYk9DBDpw0E2bjx0yWVQX/BqXoL4=;
 b=P5GfjvHLmmcmbgI2dFTUjdqZ0y/W6BouIch2ERcYaoYs/FheTOD13/2l73i/QtsOg1LUKzrJ6
 4rpICTvKNnLDDbZRfZoin3nmzabD5/ZtFPs7wf6Zde1OAS6Yr6Xq8cR
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=5IaLhzvMqasgGPT47dsa8HEpfb0/Dv2BZC0TzSLj6E0=

The binding is for the Mayqueen Pixpaper e-ink display panel,
controlled via an SPI interface.

Signed-off-by: LiangCheng Wang <zaq14760@gmail.com>
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


