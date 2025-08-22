Return-Path: <linux-media+bounces-40797-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D93EFB32149
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 19:13:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3DC4B20251
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 17:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1589F3218C9;
	Fri, 22 Aug 2025 17:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pinefeat.co.uk header.i=@pinefeat.co.uk header.b="fFZZo2fE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B57F31AF36
	for <linux-media@vger.kernel.org>; Fri, 22 Aug 2025 17:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755882658; cv=none; b=JuBAuXAvMFj68VIC07vQDVxpaFYPsdP5rwmQqoFYceoBT4dSarQkULdXgdN80V9TUjbfwaQYocNtFEihhWoRG5YRvPfR5SD5tIqzLkbCEd0wgPPI91ZggP9JxBp8DUSp2kcpB4CE3F7R8a7zntECZEYK8RwDrzkLic+oH9pQ0+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755882658; c=relaxed/simple;
	bh=GC6F3/Jn5vtalbPADycR9a2Ilql3ZeepeVFqnze4ARw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WvVrfT3+2fS7+okZkvd71abJlHSve857d9YGUaLzHLUvAYgrYG5t2+AFwHJ5p+xy1qGmZ54WpxsHCXNPL/UdyNeuBcvLqOtHvKlA5Fdif9/lfiJJIkd6Igzuog6tRBjX3TzXxAv2Y9GJQlJOLLYwB4Z32OlBR7XcSyUQN/6tpOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pinefeat.co.uk; spf=pass smtp.mailfrom=pinefeat.co.uk; dkim=pass (2048-bit key) header.d=pinefeat.co.uk header.i=@pinefeat.co.uk header.b=fFZZo2fE; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pinefeat.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pinefeat.co.uk
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3b9dc52c430so1531387f8f.0
        for <linux-media@vger.kernel.org>; Fri, 22 Aug 2025 10:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pinefeat.co.uk; s=google; t=1755882654; x=1756487454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8c7uejE+UWAVBp++A3P0eUre76yYfUCzitGMEvBnArM=;
        b=fFZZo2fE8UbZYhXWfP6aqYKG5KMS6E1gySY0//7Ve0fasvPYRIilwZqmjTT/vEuoGK
         bSAKsL76ivH2ngkS0+ZtBZfB6uHjJltLR4CxyCZeyAzH6mr2a2BTJCOdm7jR1D58DteM
         p/pbkq6jsaCfwiCybdDhtHgnSzQjOQvSo0XIq3huvNvrfWP+PWgYhwzJHUoDVI2+Bt28
         LS8lGO9Ewl9oF9F6Zwh33Wc1rYlttSfhn+q6E1cMhtyzYUTg9JchM444xx2V5o520SwE
         NrQLcrE5XfQYyq95JhNHc3gW2u/sYixWH1KdWV7nGnOlQsETvmuNHdixRwEVqxi7bThr
         +fQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755882654; x=1756487454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8c7uejE+UWAVBp++A3P0eUre76yYfUCzitGMEvBnArM=;
        b=rTGkFYAHqBV3LBbxA5RTQWSOFNHEJaBWfweaKMR/Z/iol2XEvfShkFxMIYlA/SEKIP
         kBKweODejXPXe7PgzXjyOkNZyHaYJHLbmdnEkXlRSyyAxvvBboOu3WsGKHiC0FIuInf2
         61AukX93Wx02x5CwUExpsNm07fjv1wn5YEYzFw7oZq9DS/CoJsngwQWrHANPfj5YOx6F
         2ff8dj0GPOsGyUOsL3HfRuChKa6i69uszg1RUtb1AG0hMFkVbl2F80uiazrPwEkGSnMk
         b8Z4o3EE4kDtwbV/6rNoyC3S7p8wJMVl4Av/p1egP6zZIbWHRi4QORvFDtsrKq0K6K9E
         Dstw==
X-Forwarded-Encrypted: i=1; AJvYcCWmzY1TXUSY0hLG4cd5HOiITU/d39zsj0o1zHi+jACLrpuu3bBzy4EWo7LNhwmRCQ56n1PhQyNETpaa0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvTv+1Fj4xilftP3QHF6HwfSMplpb9oeeoMDpWCL6J3rAopbe9
	THa3/tKBsbWUCosQMmoJV7KHLNQA6PymWBY5ypMJOEphkKRRptJ2IREh9A6JmaundDE=
X-Gm-Gg: ASbGncsg7psj+sXi/kkwJ+NMK5vG9nK3IWrvwU+tUBmoZSVuBJ/FMGZ/8aRx4FjBZP5
	kB2tZZTs9svuOyXJNld95vSX05RjqOyRmc0o73fwzuvekcBekwuRjCfp7O+mtbL557uDqkfVccK
	d79ARn0fhDQxOvqaa2vHaJYE5Z8bfMdQBJUYvSUzoe1u0SOSYJM9tHDvxu3eWbogwG0Ikl1H8Hs
	8NZ3+okZcMtTPf1PQgRjnx6VRkcaN7AY/QJTq833pFnn6WD8ALEoyhKm1n1hygF8NlIMe1y0LmJ
	V5e+Cm4Q9B35y4F7DkG/Y9nNVa/hRX0G4oYiTPIoWsWkVJwsdu8vO5MYH04c7JDXFvi78frNryS
	aBdSIVCvcSYyplqCYqLmBJ+g2dfayg3yUMrPuY4tG
X-Google-Smtp-Source: AGHT+IF5fbPcLMPGPUXxbyvocoXnUfM5BMARF/EqU2fvSvNEGovDCG+sKKo5gJeocqQhhXEZzLbNiA==
X-Received: by 2002:a05:6000:430c:b0:3be:51c6:16aa with SMTP id ffacd0b85a97d-3c5ddd7ed53mr2426800f8f.45.1755882654054;
        Fri, 22 Aug 2025 10:10:54 -0700 (PDT)
Received: from asmirnov-G751JM.Home ([2a02:c7c:b28c:1f00:c77a:e59e:20e0:4966])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c70f237fefsm233780f8f.30.2025.08.22.10.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 10:10:53 -0700 (PDT)
From: Aliaksandr Smirnou <support@pinefeat.co.uk>
To: jacopo.mondi@ideasonboard.com,
	hverkuil@xs4all.nl,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aliaksandr Smirnou <support@pinefeat.co.uk>,
	Aliaksandr Smirnou <asmirnou@pinefeat.co.uk>
Subject: [PATCH v4 1/2] dt-bindings: Pinefeat cef168 lens control board
Date: Fri, 22 Aug 2025 18:10:40 +0100
Message-Id: <20250822171041.7340-2-support@pinefeat.co.uk>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250822171041.7340-1-support@pinefeat.co.uk>
References: <20250822171041.7340-1-support@pinefeat.co.uk>
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
index 77160cd47f54..dab27f769b0a 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1195,6 +1195,8 @@ patternProperties:
     description: Picochip Ltd
   "^pine64,.*":
     description: Pine64
+  "^pinefeat,.*":
+    description: Pinefeat LLP
   "^pineriver,.*":
     description: Shenzhen PineRiver Designs Co., Ltd.
   "^pixcir,.*":
diff --git a/MAINTAINERS b/MAINTAINERS
index fe168477caa4..811c6a150029 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19985,6 +19985,12 @@ S:	Supported
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


