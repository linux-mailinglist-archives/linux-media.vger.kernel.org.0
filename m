Return-Path: <linux-media+bounces-60199-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPY4IMV992kpiQIAu9opvQ
	(envelope-from <linux-media+bounces-60199-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 03 May 2026 18:54:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EE52B4B6A99
	for <lists+linux-media@lfdr.de>; Sun, 03 May 2026 18:54:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BD458300B98B
	for <lists+linux-media@lfdr.de>; Sun,  3 May 2026 16:45:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0F98373BF4;
	Sun,  3 May 2026 16:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d+fMtf8x"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C07630B50A
	for <linux-media@vger.kernel.org>; Sun,  3 May 2026 16:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777826701; cv=none; b=SeTvKPM2lB0LBqZDP2Ncicsgw/nxhMwjjI8vUa8PGFCkRAU4Tub4IrwF55TLCGNnYw/a/NOVmqskMjSRwzJd96Rl6jobj1r9CppxApKmEem1DaFvPoHRK82K1gC2ftvpOYBRigMDMOrOD1RaP1tzA8aOtVMxUlUJBEIspkg111o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777826701; c=relaxed/simple;
	bh=We6F5WQggj2X+707QRLSrq42JZKnZW3sTqiE8bDQHj0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=upkYUU1VoxV+MRKDdHl6k+UoPzsrZ4ElhFgfhvtjSIE4sYXEMVXrPdypphWxmB/jpef66rQJHJ38abp78mSSDb3VHQyQsQQCA9uIOxJiQ+bC2B5WoRp0uAca38UY3rSzBYXLXONJqhWTJXEMixWGHkYHznKkNbbb7hGw5sPfw2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d+fMtf8x; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ba5b107eaa2so576838766b.3
        for <linux-media@vger.kernel.org>; Sun, 03 May 2026 09:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777826698; x=1778431498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WQAiHiX6KTDh/ntQ/qXMLOirhMuLN1OliVdEMKPofM0=;
        b=d+fMtf8xuuxOUb7Gfe7t5cDzXcA2E5Ylrv1XdwzVV6vQSK668JapZED7gLWCoLKdNf
         6pqXy2lh+FlyQEWrv5yUlUyQC+n/n/Qoxss0aA7W/pNBGG4pEBTCEKXXTmdhd3j6lVAp
         DfFgDX4+MMq9OOOEsStUFB4Cfx7eWzYJ/vZfn0WrDWOWEiKbpaVV3OPeWaJVbOWnqom9
         5YFRMiUAWYPNdtjSTpR8n6X2xFEJGvzhGIhCvMdP4Q8w9GN7sV/s8bjHV8vzj4sYpD+P
         RluhHLjWdF1NS5YFJUx7abedWPQxqnhAY3VaCEAXWkuF69a19bACZcGJDoFSjWYpt28v
         Y/NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777826698; x=1778431498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WQAiHiX6KTDh/ntQ/qXMLOirhMuLN1OliVdEMKPofM0=;
        b=ZXS1wUYUZWjAQoR9hiTOWlgTblvC7FMOxAucjdflXDuh5USWxOcLXHRsijd4UX67Cc
         X/vP4ctojceW650Oa8q1XNFoz8SCIr18H83xb0ATxOFsLA5gQu2V72Buo25gvycKhuVn
         E6fHxSY5XjkTy1I8fm9wkrqjQnEy/cgQpSsO14hwpy8Htk3g91X7/tvecSyOrnx3LGc7
         JxLfvo72kkSQcbxggoc3PtJLH6FHpGTHFJma3i9W/HptnZn2/jzubhrmFCmW64UjH96/
         tsgavS9dGlL7VBfQyHPKDRsUnku1fsvo+ZMw6difGk4Q1PAE6KYWrPqtp0/SGkRTT2qu
         SONw==
X-Forwarded-Encrypted: i=1; AFNElJ8TVW+za0sGnEgp6ifdebjKtYw8maHUoMDUOyQId9INImHXof3aWS9eBDHKoYPK00Jaf7S4zRzAMHj2QA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPp5XUWaxPMqakacYwQkpl3OJ53IBZHRPfoGCQJWojGbS8Ud2v
	WAQKwzzIytMmTf6Xx22TvQa2VTabi56IEItN8Qf1ChHo727PcwNObSDI
X-Gm-Gg: AeBDies7Mh6sbMhADX6FS3oJW+6X8bMMLqdiZg3L6g2XXuotlFb71mkN7kAk6A/BqoG
	Nf8mCE1LSXr7m7NFunrTmQdeTeKOe4vGv9q5IpfKiCcJl12ISciP1eiiUJmihLqSD9o8DyYcsUe
	CdwyE1wMJ321nRoZwlpR/rcPWxzQmJ0/3UOIH6WBNefRwgUMACSxMKRrtd5sWezthoPVdTSb1BJ
	CxuPM2921yDLIUbOS+8/RIWFJVzyc7z86EHwlLclQT4qGLXfpyBm3t2EZ00qeTym1bLyDMbhXDQ
	zkavm+5fdbtk74OgurCgW7GNOSmUhhS0D20eiped3ogEQxpbOEdE/BCLCbTzjNK1JY+2hgRlB+K
	0tnwchjVLujHzGoyDGH1SDGNfvoaYJB/h1lBTOMn4wqlVDZ1nvXI9pliwOlGXqe+0hwwTHqqz3A
	JbmfUrwwgSYFcom/8gf7wbC9M=
X-Received: by 2002:a17:907:2dab:b0:bc2:1f0e:3fab with SMTP id a640c23a62f3a-bc21f0e404bmr57267266b.24.1777826697714;
        Sun, 03 May 2026 09:44:57 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc237ef8297sm27430566b.57.2026.05.03.09.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 09:44:57 -0700 (PDT)
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
Subject: [PATCH v5 1/6] dt-bindings: leds: Document TI LM3560 Synchronous Boost Flash Driver
Date: Sun,  3 May 2026 19:44:40 +0300
Message-ID: <20260503164445.215540-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260503164445.215540-1-clamor95@gmail.com>
References: <20260503164445.215540-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: EE52B4B6A99
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [6.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60199-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[gmail.com:s=20251104];
	GREYLIST(0.00)[pass,body];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.874];
	R_SPF_ALLOW(0.00)[+ip4:172.105.105.114:c];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,devicetree.org:url,0.0.0.1:email,0.0.0.0:email,0.0.0.53:email]
X-Spam: Yes

Document TI LM3559 and LM3560 Synchronous Boost Flash Driver used for
camera flash LEDs.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/leds/ti,lm3560.yaml   | 163 ++++++++++++++++++
 1 file changed, 163 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3560.yaml

diff --git a/Documentation/devicetree/bindings/leds/ti,lm3560.yaml b/Documentation/devicetree/bindings/leds/ti,lm3560.yaml
new file mode 100644
index 000000000000..e79de4a57f83
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/ti,lm3560.yaml
@@ -0,0 +1,163 @@
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
+  flash-max-timeout-us:
+    minimum: 32000
+    maximum: 1024000
+    default: 32000
+
+  ti,peak-current-microamp:
+    description:
+      The LM3560 features 4 selectable current limits 1.6A, 2.3A, 3A, and 3.6A
+      (in case of LM3559 - 1.4A, 2.1A, 2.7A, and 3.2A). When the current limit
+      is reached, the LM3559/LM3560 stops switching for the remainder of the
+      switching cycle.
+
+patternProperties:
+  '^led@[01]$':
+    type: object
+    $ref: /schemas/leds/common.yaml#
+    description: LED control bank nodes.
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        description: Control bank selection (0 = bank A, 1 = bank B).
+        maximum: 1
+
+    required:
+      - reg
+      - flash-max-microamp
+      - led-max-microamp
+
+allOf:
+  - $ref: /schemas/leds/common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,lm3559
+    then:
+      properties:
+        ti,peak-current-microamp:
+          enum: [1400000, 2100000, 2700000, 3200000]
+          default: 1400000
+      patternProperties:
+        '^led@[01]$':
+          properties:
+            flash-max-microamp:
+              minimum: 62500
+              maximum: 1000000
+            led-max-microamp:
+              minimum: 31250
+              maximum: 250000
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,lm3560
+    then:
+      properties:
+        ti,peak-current-microamp:
+          enum: [1600000, 2300000, 3000000, 3600000]
+          default: 1600000
+      patternProperties:
+        '^led@[01]$':
+          properties:
+            flash-max-microamp:
+              minimum: 56250
+              maximum: 900000
+            led-max-microamp:
+              minimum: 28125
+              maximum: 225000
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
+    #include <dt-bindings/leds/common.h>
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
+            flash-max-timeout-us = <1024000>;
+            ti,peak-current-microamp = <1600000>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            led@0 {
+                reg = <0>;
+
+                function = LED_FUNCTION_FLASH;
+                color = <LED_COLOR_ID_WHITE>;
+
+                flash-max-microamp = <562500>;
+                led-max-microamp = <156250>;
+            };
+
+            led@1 {
+                reg = <1>;
+
+                function = LED_FUNCTION_FLASH;
+                color = <LED_COLOR_ID_YELLOW>;
+
+                flash-max-microamp = <562500>;
+                led-max-microamp = <156250>;
+            };
+        };
+    };
-- 
2.51.0


