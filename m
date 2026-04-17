Return-Path: <linux-media+bounces-59007-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kISoM4Qf4mlX1wAAu9opvQ
	(envelope-from <linux-media+bounces-59007-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 13:54:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C9B41AF6A
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 13:54:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BB2823046FE4
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 11:43:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 535113BC675;
	Fri, 17 Apr 2026 11:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kIV9QktI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFAD3939DB
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 11:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776426173; cv=none; b=N6yjbzrKUECLps5VFiEYZXL0UU+mRHOm4Efw1PDw/rDf2sS7T1Z26Kr1Ks1CQdp7L9kzqewGY/fDo4ewGChK1Ow3FzSfsNYWTu8GJUYTxRMNtckx4sTABDQowG+dPrjls6SJ25DUBPtRU0Fbo0cXAoapQIRqYFISFGQpkv7dQGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776426173; c=relaxed/simple;
	bh=MCepgpMAhExukEmT5X29jn6zLNNcYRcxCnOQNum1NMc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XIfazunnEolUcXKF6k+engMkacZ/pp0tJ/oPgzuD6M5UMZYt1KJNKoCNVJ+2ZiMe1hWeC9kRbqaM6rpW/2gLw817zZmmZpHEJhaaG8QQ+NZ0XqPxhVYtMnvYOCUlYIjR965jmckj/9qv4c1ZUjbz6MZf9m8PVhQAB7SG7J+a7u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kIV9QktI; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a2c500750dso628058e87.1
        for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 04:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776426170; x=1777030970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qYCK/+hjnviLjF2LQlcAfHWbh1kfWS18YZTqZGyrqQ8=;
        b=kIV9QktIMGOGBpBcLF3XkM4Kdcp7uizraT/9PZ7rRvp8h074lt9dJJOzPTtVfeq8Rs
         coxCJGuhvnhQx3TWM4fTsyI2dRH7wtRroyxI93xk9xH+XxpmXLuceBtgSL8CNiA+Re1Q
         Lhp3IuIIQwk6H7VLQo4IIPG9pWtLSbE2ui998W9PFlYE8byBAE4a1B+xCgsv2xFKRZ67
         /4iKxTz6nnTZ6E47E//H5D6rNY+afYqb3L58E3c3hycMKNLVdDa3lTssVHWlxSb8Nh4e
         TRhDCcKCq7AKEMq1XDz24UsoljmJToGDJPIYalR65zcfh9EYCcimiVYtj11b7DCV1KI7
         9eRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776426170; x=1777030970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qYCK/+hjnviLjF2LQlcAfHWbh1kfWS18YZTqZGyrqQ8=;
        b=ZwCBOFO7nj0WFs10zDmjtpU6VHqWx2AIQyKvAEptFYC0aFA6QhBEOkDes5LiE4rXY6
         myx2jcz5DjB8LB42vimEpYWCZuLA7B2+CgJ5uWnokuIPl8VPOsZ42TdsRYqJUpaFZI4p
         59JShR3O3dQjq2XwFVP5zwx8s1cMLeeIKej4XnV9rU2+2whno9lITZoNn3AszW31+jY8
         PWJvL8GEPBDwBBEby/rHHuveR6AUK9UZq/x9hLCmAStvE4qn6hkZZ/YD793iUAZNl/tz
         WiiES/6b/2HY/lEDXM5UGeCjv3BDA0FiyLuOi+JZguGm0Y5esDWMjQqnK6VwiUZttJOv
         eZBA==
X-Forwarded-Encrypted: i=1; AFNElJ8ukVPKgRW8hptCVNCn65EsOPbcDAV24AXRB65EcR+UBzQ8foyqU2eYYyLRVL3YNHCar+pY3x33SYalXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOAeIrIQYEOT+74lXIKHbpB0HwhjpBE9e/34OJns8JcVXdnU2b
	7zkx3pKD6PkSqIpHBxD+00BPhfnrnng6GacU7Rg+PoGslseWPR5B85J3
X-Gm-Gg: AeBDietY3NMMBnztCQN3yh4WxG5dmx7VGZtfhbQ4zLm2jy3NBHdUjfjBxf2ShDH8G05
	DaRTbB+5ucblTc8bG/8JKf2QPklCZ2yvvy4VcUu0wc0kq/YEX4wFRwIot3HfX/Ztpf4xuRVxYDI
	70ndm3SVSSPJqdeHXuNer92BHSM0kqfdU9kyqkGGgZjXQNXEgcBfpcecZtVdQ5l1lXEJI5I4XLw
	Y+eIebIUTRWAUCiqdvq7600SSZTjg6LHHWtlHVZmcgP17zXxEaOGAibKqIW6dO16vfhzua8lAeO
	5rSGQlumNf8+RAoSqmPKPi24v3M33bqIy3BaPZbNaReEM84+a1RkQo/hwmH0L9uvF6bqMPZHAjA
	owrEH2jGlcy0OWE5HdrmoL7inUue3WHzjqdJq/ac35k8mwKa9Qnh/Z1PSDd6Gbh6aPo+ZihTrTa
	a1YEbDOjLCizedvxJA3RMivxU=
X-Received: by 2002:a05:6512:114c:b0:5a1:3bfd:b87b with SMTP id 2adb3069b0e04-5a4172dd85emr780824e87.30.1776426170136;
        Fri, 17 Apr 2026 04:42:50 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc672sm338636e87.34.2026.04.17.04.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 04:42:49 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v1 5/5] dt-bindings: leds: Document TI LM3560 Synchronous Boost Flash Driver
Date: Fri, 17 Apr 2026 14:42:26 +0300
Message-ID: <20260417114226.100033-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260417114226.100033-1-clamor95@gmail.com>
References: <20260417114226.100033-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [6.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-59007-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_FROM(0.00)[gmail.com];
	GREYLIST(0.00)[pass,body];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[gmail.com:s=20251104];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,gmail.com];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_PROHIBIT(0.00)[0.0.0.1:email,0.0.0.53:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[1.000];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c15:e001:75::/64:c];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,devicetree.org:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D2C9B41AF6A
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

Document TI LM3560 Synchronous Boost Flash Driver used for camera flash
LEDs.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/leds/ti,lm3560.yaml   | 134 ++++++++++++++++++
 1 file changed, 134 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3560.yaml

diff --git a/Documentation/devicetree/bindings/leds/ti,lm3560.yaml b/Documentation/devicetree/bindings/leds/ti,lm3560.yaml
new file mode 100644
index 000000000000..460ea1fbc1e5
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/ti,lm3560.yaml
@@ -0,0 +1,134 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/ti,lm3560.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI LM3560 Synchronous Boost Flash Driver
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+description:
+  The LM3560 is a 2-MHz fixed frequency synchronous boost converter with two
+  1000-mA constant current drivers for high-current white LEDs. The dual high-
+  side current sources allow for grounded cathode LED operation and can be
+  tied together for providing flash currents at up to 2 A through a single LED.
+  An adaptive regulation method ensures the current for each LED remains in
+  regulation and maximizes efficiency.
+
+properties:
+  compatible:
+    enum:
+      - ti,lm3559
+      - ti,lm3560
+
+  reg:
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  enable-gpios:
+    description: GPIO connected to the HWEN pin.
+    maxItems: 1
+
+  vin-supply:
+    description: Supply connected to the IN line.
+
+  ti,peak-current-microamp:
+    description:
+      The LM3560 features 4 selectable current limits 1.6A, 2.3A, 3A, and 3.6A.
+      When the current limit is reached, the LM3560 stops switching for the
+      remainder of the switching cycle.
+    enum: [16000000, 23000000, 30000000, 36000000]
+    default: 36000000
+
+  ti,max-flash-timeout-ms:
+    description:
+      Maximum flash timeout in ms with step 32ms.
+    minimum: 32
+    maximum: 1024
+    default: 1024
+
+patternProperties:
+  '^led@[01]$':
+    description: LED control bank nodes.
+    $ref: /schemas/leds/common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        description: Control bank selection (0 = bank A, 1 = bank B).
+        maximum: 1
+
+      ti,max-flash-current-microamp:
+        description:
+          Maximum flash current in uA with step 62500uA.
+        minimum: 62500
+        maximum: 1000000
+        default: 1000000
+
+      ti,max-torch-current-microamp:
+        description:
+          Maximum flash current in uA with step 31250uA.
+        minimum: 31250
+        maximum: 250000
+        default: 250000
+
+    required:
+      - reg
+
+required:
+  - compatible
+  - reg
+  - '#address-cells'
+  - '#size-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        led-controller@53 {
+            compatible = "ti,lm3560";
+            reg = <0x53>;
+
+            enable-gpios = <&gpio 28 GPIO_ACTIVE_HIGH>;
+            vin-supply = <&vdd_3v3_sys>;
+
+            ti,peak-current-microamp = <16000000>;
+            ti,max-flash-timeout-ms = <1024>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            led@0 {
+                reg = <0>;
+
+                label = "white::flash";
+                linux,default-trigger = "flash";
+
+                ti,max-flash-current-microamp = <562500>;
+                ti,max-torch-current-microamp = <156250>;
+            };
+
+            led@1 {
+                reg = <1>;
+
+                label = "yellow::flash";
+                linux,default-trigger = "flash";
+
+                ti,max-flash-current-microamp = <562500>;
+                ti,max-torch-current-microamp = <156250>;
+            };
+        };
+    };
-- 
2.51.0


