Return-Path: <linux-media+bounces-43756-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BC2BB9794
	for <lists+linux-media@lfdr.de>; Sun, 05 Oct 2025 15:33:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E9803B1C99
	for <lists+linux-media@lfdr.de>; Sun,  5 Oct 2025 13:33:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94A68288C2D;
	Sun,  5 Oct 2025 13:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pinefeat.co.uk header.i=@pinefeat.co.uk header.b="CQUBJilP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A642877E8
	for <linux-media@vger.kernel.org>; Sun,  5 Oct 2025 13:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759671186; cv=none; b=UWjDByW7+TzVMohwF7f+PKh66wzRAZvzMONl/c2H0/+EQYw2CBNd5wsmnkj+NTf2qlZB3He1GNDbhjaAKe4Cylsjo0RIxcuJ1ex7eEYxF+HNbh241MvwoFpJwsK2mQxatONGxwgUW0rKaZC9IVBWzosfNtRhOh4cj3TVUabwZZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759671186; c=relaxed/simple;
	bh=f6vqOFM1ClMIQTvzAyqnN3otmVngL9gxp0vwpvcnK+Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jOxfEQ77OoU26NlGgmetXl63UqRTia4PMGwT//bRmlQKpCqzEuxclY0ZdSJJTt1bypEqAoPirnl3dcJ8xSGv9inFZUjVztg/CtPZupIKH8e5ubma9NjR2ZEkmZKR74x0S52QFCah8C40yPUCndpk4Is8C2U2snzuKs4+UMz2yXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pinefeat.co.uk; spf=pass smtp.mailfrom=pinefeat.co.uk; dkim=pass (2048-bit key) header.d=pinefeat.co.uk header.i=@pinefeat.co.uk header.b=CQUBJilP; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pinefeat.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pinefeat.co.uk
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3ecdf2b1751so2686301f8f.0
        for <linux-media@vger.kernel.org>; Sun, 05 Oct 2025 06:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pinefeat.co.uk; s=google; t=1759671183; x=1760275983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2j+Q9MMzpQKCegI0LqVFwaTuZf6jfnXFIw0HL+3JIHQ=;
        b=CQUBJilPLqZRpUN7azm7hbXs+iU4AbuhZOanCBG13Pa+gxRdu3bQdlpSSrdb6B97cE
         o4Q3IAXVQt3DonrHwNjkqEwwlrKIW5IEv9uuINERJupV44A0H51Q5ZIXPQgkAGiARW19
         9o4G4/Qjh+XcplxeFQ/zD2Ah5FxkW/CSva0JmJSLbYiWN45HsTWaV0YbIbJ6F3k0hsYB
         lKqdBUu9sZNnUyNUrLZRNsg4+rxsl/GqXcSUc3aMlqCmIoJL9gIMgwI8qookyKZoFKgN
         FberwDQqfu/kQDzo8S3R338MMVjsulFC7lhdeXEm/PcmebkaRq9BAwyWNRBCgL+nwJl6
         eV7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759671183; x=1760275983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2j+Q9MMzpQKCegI0LqVFwaTuZf6jfnXFIw0HL+3JIHQ=;
        b=XBoXYR5ZhugmasuyMPuMmEYsxJJsBBn9UsNpfHHCPsqeOCtF5RMid7+yYmOYLAhqV+
         cMWMgdYExxzPlc3vlNJOSuB3fLCqR7Q1guIDOR34mC2kwvkZeuXNYI96m/niYUdtXizH
         WKFgulIS6v3i+0NNCi9rA41FZRITRRceQZc0g5khb47iNzfa+RC91ShVL6M7a4zGqRsa
         s6NrQt1u/pDh6v5MJNlrHrAZba+k+8FDM8+fuZWqIz263QyHemjcKc2HMz+FYaOlLCqt
         3nNb6HqphmfCv2pfY2dj0lW+WOAHyE2xGcc7fzKt/YOSLv+JoUlO7zLMgu/rl6IybNUh
         MMow==
X-Forwarded-Encrypted: i=1; AJvYcCVT3UjdAPedH2RgWYt8Q6/Pv6Cq7EbzqD8G1/v8cZslW/SI2e6Y7LaFq8x4nQmAAQ80QW7kXCruk6acAw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/hZWohB5tcfe+vxKotwqPeF80n0aR0Z8z2d5RKzwiHV47bqr2
	vaimnPRP2oifo9ibFXeDcY0pMQfinT3YPK0841vOKoJhcB1fP7kwizNUxFc7C/eWLmw=
X-Gm-Gg: ASbGncuD2r3X1pysAR9Ry20LYereWRdpKsnIldqZlJl0Fk063RWs+ZLbbURM97RZ78I
	FmDtdnTC6WYI5USRjdDe5ZMvCcmFiaGW+9fBFAssLVyYugQbnVKup5QxQ9pzyNOfCVEb1BZShjE
	fM8kAe4yuSQBbH20zkgdW9B8nKKbzqeL7mTq8c/RialH3ZA32A/up65DctP6Ks4JQb17EPvCgol
	yITOX/qRZgX6Cqfuwb2VG53dvyk0WsOSLRFuA7Oe/4nqaDEqHmeFHwgwq5EaqVIJdGlKLzw2jjA
	9GpynfZ6/FlxvrXv3HcbBgrq1TSSVI1PqydeMb3obe6HWQqpnaES8JVNWXMgSO7XJ1aVWC6msPY
	0gGWs1cPMGjP4SSqits8UjqjaOcktPkhFOWD63e4CsQeA7kJSGHHUOXXRkzckjBIL6jbj6kcA73
	g=
X-Google-Smtp-Source: AGHT+IE4EINjbOD0Nv4TfZcchd929tbPxzPg0iqO1k5gau9eTOYrCdwVAmX2EdM3NGwqRr9r0K6bNA==
X-Received: by 2002:a05:6000:402b:b0:3ea:6680:8fce with SMTP id ffacd0b85a97d-4256719383emr6163478f8f.48.1759671182253;
        Sun, 05 Oct 2025 06:33:02 -0700 (PDT)
Received: from asmirnov-G751JM.Home ([2a02:c7c:b28c:1f00:33bb:4d0:68e8:89b8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8f4cc3sm16459730f8f.55.2025.10.05.06.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 06:33:02 -0700 (PDT)
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
Subject: [PATCH v5 1/2] dt-bindings: Pinefeat cef168 lens control board
Date: Sun,  5 Oct 2025 14:32:27 +0100
Message-Id: <20251005133228.62704-2-asmirnou@pinefeat.co.uk>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251005133228.62704-1-asmirnou@pinefeat.co.uk>
References: <20251005133228.62704-1-asmirnou@pinefeat.co.uk>
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


