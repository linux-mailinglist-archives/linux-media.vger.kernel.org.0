Return-Path: <linux-media+bounces-43874-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 192D5BC2913
	for <lists+linux-media@lfdr.de>; Tue, 07 Oct 2025 21:58:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EFEF04E8AE1
	for <lists+linux-media@lfdr.de>; Tue,  7 Oct 2025 19:57:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8DC123AE62;
	Tue,  7 Oct 2025 19:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pinefeat.co.uk header.i=@pinefeat.co.uk header.b="kxrzJFK2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9112422A1E1
	for <linux-media@vger.kernel.org>; Tue,  7 Oct 2025 19:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759867063; cv=none; b=PEJEmg4aSjU3GaK3a/GFARNDDQMnlSQTDlN0Zzvp90Z6BJVK6ZPmBwPZ+bQuz8IYYcECUvJo9blu+TPWNtKfkqwjdGRft4OCiU/mZ33Fti4SNznyHOoyRUif6fkGZwXjqO5wxYiWezTfPfz6PxpeMzSCXCsxPWbl6uxeNpNxUgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759867063; c=relaxed/simple;
	bh=f6vqOFM1ClMIQTvzAyqnN3otmVngL9gxp0vwpvcnK+Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=emmhvhsSHDLoRRbpDpm/5wZESDmD9kKYTs0BOVTlHUwFKbUsapFmKwSZnc5MA29dLiH4qXKlYoZ5ZUvpXTPnIGdIOcyQ1Srh+2G7y6u82LLgb5l64gnaQaREmz4uQB6P+HgaDMkMD3ZRCIgiRgvAvF8hFx+joXEr52NL4fANNvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pinefeat.co.uk; spf=pass smtp.mailfrom=pinefeat.co.uk; dkim=pass (2048-bit key) header.d=pinefeat.co.uk header.i=@pinefeat.co.uk header.b=kxrzJFK2; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pinefeat.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pinefeat.co.uk
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3f2cf786abeso4615826f8f.3
        for <linux-media@vger.kernel.org>; Tue, 07 Oct 2025 12:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pinefeat.co.uk; s=google; t=1759867060; x=1760471860; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2j+Q9MMzpQKCegI0LqVFwaTuZf6jfnXFIw0HL+3JIHQ=;
        b=kxrzJFK2iIv5rfTU+WGNlkG4qFK4p+ksVZi1b5eNpzbMhqeGzVt0ZDBMlNbC0knqk9
         Gy4fGBW7zZLVSalrrDq6HOslEu4zFFYGs6Is8U7nLTPZz/hfdRManbfGFkBQXb3Wck7V
         +XTdIrR9XgB0NaL2xYEt5wxjfbNKpIWYbQirDYGfY0ngKebNScYDT0wtjGxBCbV/wEP2
         eyXLCKakc8ealQ70CHtP54vYOb0GTgO8AIfH337Rr4hC18MUGpnUS3HBxhvBdQNxcpmM
         vOjTvk22HXdmcq6j4tkK65hUZE5sMIlzhH7VHu0d0YM3sKw1lfUPQre2hhypOpP+JLEl
         kPVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759867060; x=1760471860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2j+Q9MMzpQKCegI0LqVFwaTuZf6jfnXFIw0HL+3JIHQ=;
        b=D+pVnbIsN14w1h35VdTsOm9MAfBTalCKNi+4vxG/4Yc9/JOlLgynNc6Or3NN5XwrOT
         s1Y64nJZ7rceNB+6HxeXfRRcuo0Ya0Oh1+54XNNaQZVWFDiq5gtXq7S88WY/xFaBrbM2
         uRAUj6v7az0v5XE3iEe/Ifw3ZVIYX5jc7MaPOw1dYGhi/huy4wrSW8aJ8eN6Hv8RvnQ/
         LgJFvRr9bWfVulw3a9NyBd+7uSKdFCZFquc7xqtddOT3BQ0mbJaFNqTLSotqetk/ENGR
         Q7hf98dHn1QXFKgeFWO2cfSf0VJMG4PqdYzoe9iVo/6rLDZ1BujvmUuHkXtJOrMgNdsV
         STnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEyn9a84HvJXTBKPWp1HBah1Rl2B3GB+WlbHS5z7ivmb3yhoHSLaIDrK/2LBhlHIzVSUjdjmEN9ZVIYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsRpLCWTrOs9hbiSAfCCz9gYrbZ686yg7UnRH2Go7qcnNDgIN5
	ejR44OQFiDg9mZyijKu4kL2SJ0szQbFJZOcUBnBaK7ySZucf1bsI/9TtifJWdHpS0co=
X-Gm-Gg: ASbGncv3MCfUynRwwdy8njwzFhad/6OiCGXiWlCK877V4AZKo2YjO1jmbPYQGjN6pZe
	DXqnW6SSc9rQRQ7nFMPw7nuJrxzgeacMps0//pWvVY2++VzxeJdamjPi24sCymR0r0mEG96Thle
	inKL/3fhSQngsV5/clqZKjLc87iHuzhg1AHmrNe8+WlEC2DZnKimDrQby73IW7k6enV10BNhrA0
	cYoFGvu5z1s/CC3j7hV5PQJZ+ei1p+jPGUvKT4U1Ju/gGAXu+8pnVifZFLxXFOMZbukckKhOeHN
	tiW639xN0xjBELtHygZtDUVWgYhAJFXRKphh8VUMpd4YMSfZDADhGNUXJdgd8pBQPli1FQj49cc
	EFXqwi2CM+6uyNtdHavpcztKRUHcwVTcnOp9x7zzKaN44TvyL9R8aGd/gaiJvFGxt
X-Google-Smtp-Source: AGHT+IG9cbogcwOF6WmVSeyEhHXG7ZHMIzZWC4Mn8mt/VZI5xaGBB2qXeSTvBwUq847PUK7YWE1qgQ==
X-Received: by 2002:a05:6000:26c2:b0:3ce:bf23:3c32 with SMTP id ffacd0b85a97d-4266e7beb06mr328269f8f.22.1759867059593;
        Tue, 07 Oct 2025 12:57:39 -0700 (PDT)
Received: from asmirnov-G751JM.Home ([2a02:c7c:b28c:1f00:bdb:8f55:60a1:c8ff])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8b0068sm26830896f8f.26.2025.10.07.12.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 12:57:39 -0700 (PDT)
From: Aliaksandr Smirnou <asmirnou@pinefeat.co.uk>
To: jacopo.mondi@ideasonboard.com,
	hverkuil@xs4all.nl,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aliaksandr Smirnou <asmirnou@pinefeat.co.uk>
Subject: [PATCH v6 1/2] dt-bindings: Pinefeat cef168 lens control board
Date: Tue,  7 Oct 2025 20:57:31 +0100
Message-Id: <20251007195732.16436-2-asmirnou@pinefeat.co.uk>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251007195732.16436-1-asmirnou@pinefeat.co.uk>
References: <20251007195732.16436-1-asmirnou@pinefeat.co.uk>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the Device Tree schema and examples for the Pinefeat cef168 lens
control board. This board interfaces Canon EF & EF-S lenses with
non-Canon camera bodies, enabling electronic control of focus and
aperture via V4L2.

Power supply is derived from fixed supplies via connector or GPIO
header. Therefore, the driver does not manage any regulator, so
representing any supply in the binding is redundant.

Signed-off-by: Aliaksandr Smirnou <asmirnou@pinefeat.co.uk>
---
 .../bindings/media/i2c/pinefeat,cef168.yaml   | 47 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 MAINTAINERS                                   |  6 +++
 3 files changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/pinefeat,cef168.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/pinefeat,cef168.yaml b/Documentation/devicetree/bindings/media/i2c/pinefeat,cef168.yaml
new file mode 100644
index 000000000000..1295b1f4edeb
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/pinefeat,cef168.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2025 Pinefeat LLP
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/pinefeat,cef168.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Pinefeat cef168 lens driver
+
+maintainers:
+  - Aliaksandr Smirnou <support@pinefeat.co.uk>
+
+description: |
+  Pinefeat produces an adapter designed to interface between
+  Canon EF & EF-S lenses and non-Canon camera bodies, incorporating
+  features for electronic focus and aperture adjustment. The cef168
+  circuit board, included with the adapter, provides a software
+  programming interface that allows control of lens focus and
+  aperture positions.
+
+properties:
+  compatible:
+    enum:
+      - pinefeat,cef168
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera-lens@d {
+            compatible = "pinefeat,cef168";
+            reg = <0x0d>;
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index f1d1882009ba..4f50c35ed670 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1241,6 +1241,8 @@ patternProperties:
     description: Picochip Ltd
   "^pine64,.*":
     description: Pine64
+  "^pinefeat,.*":
+    description: Pinefeat LLP
   "^pineriver,.*":
     description: Shenzhen PineRiver Designs Co., Ltd.
   "^pixcir,.*":
diff --git a/MAINTAINERS b/MAINTAINERS
index 5a2cde903910..a59cd27caf11 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20332,6 +20332,12 @@ S:	Supported
 F:	Documentation/devicetree/bindings/input/pine64,pinephone-keyboard.yaml
 F:	drivers/input/keyboard/pinephone-keyboard.c
 
+PINEFEAT CEF168 LENS DRIVER
+M:	Aliaksandr Smirnou <support@pinefeat.co.uk>
+L:	linux-media@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/media/i2c/pinefeat,cef168.yaml
+
 PLANTOWER PMS7003 AIR POLLUTION SENSOR DRIVER
 M:	Tomasz Duszynski <tduszyns@gmail.com>
 S:	Maintained
-- 
2.34.1


