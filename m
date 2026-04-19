Return-Path: <linux-media+bounces-59094-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YC8tFiyj5GmUXgEAu9opvQ
	(envelope-from <linux-media+bounces-59094-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 19 Apr 2026 11:41:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA43E4238DE
	for <lists+linux-media@lfdr.de>; Sun, 19 Apr 2026 11:40:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EE1B130066BC
	for <lists+linux-media@lfdr.de>; Sun, 19 Apr 2026 09:34:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6560B3290DB;
	Sun, 19 Apr 2026 09:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dfxa+x+T"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563E737883D
	for <linux-media@vger.kernel.org>; Sun, 19 Apr 2026 09:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776591278; cv=none; b=CynMBUA176Ik5QG2bDYzehjcCy2imzhKymUFjYvWvo0k7TIS2otPqbKTPYsDXr6MzPZNOoktVxlymM5Bt5fggfpd6Ym6cC/I9SBJk0loKACLEpSUcLS3kXWB6g2pxKpYp1PwBPChs1HS5BvEcmYgyJo2QKsDo8uM654WfXUBG50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776591278; c=relaxed/simple;
	bh=BK0hEglzpcSXJd/OKj+ViYaIq6REZlgwXiNFnkXSX+E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OZbMD3X5sra6rXxXyjvNYDYZTeRfHL6ayU3mDQjGSgoT87+zR81WaVEmi7iw3a9odfHe0Ycn13Jb7uxdKidGgt5iFnIP+pqF0lr+bm2ppLWYkBFxr++7wNmk3XoplnWrqCsJdbIunjCN+d/xN39NM1V6UHQUi2yKYzbBg2rD4Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dfxa+x+T; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-38e7b0903cdso19300251fa.3
        for <linux-media@vger.kernel.org>; Sun, 19 Apr 2026 02:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776591275; x=1777196075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6tC+sS2x5WFciQYjGn4heKGQVAU6/El17ETWgsL8Nkk=;
        b=Dfxa+x+TFYxbRiPLvAOSDD5gQyWf3Neo7Fhoy7DC0EKqY8Ls5R+P/M73cNpDV6Indo
         nEvpzVuqnaE+PsJckN3iDmttByc1zcAR7brI+Gsl9X6LEF2lv46rtbV78ajhBW/o8V4g
         qNOywOdrgjhtZjhRAEF7RGlOXAxeVlmfsRnf41uhivjLFSAtIrNsA82MDN2BKhwsFYJC
         d/PQ7hF0DN3wvkaN25HFgecAbSN5BZSMHD6SCVE//Rg3x3Mope9cccngwrYlGx9oiSuN
         J4QQEPTtBo1jpxbkxfeQmoD4g5R9P7pxwHfEKmfpqzg0/qx5NAPSTsD0A4VBOyYDnvt9
         6dMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776591275; x=1777196075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6tC+sS2x5WFciQYjGn4heKGQVAU6/El17ETWgsL8Nkk=;
        b=Gg87Jm7l5/F6xY3VB3w1KgRLN0hb3IDl93OpSzqIUlvRYPUcJU4U8bUhzK5wAxWuix
         8NJrLJdeRYTteY72K0eKP2Es1KWpOwTENmvlM/fwf2Wc9q5mRufJT+sTsWYP+XXfYOxm
         282wWg2KSTFoQ/nsvW9zYSDfmheGAFAF59XSBmHVN7f94Y+8gSSQBbXdE6N5sHquorc4
         97aZUFMQ9YLz36bqCxxN9VgA7GJ2twfwTmupbj49zRcnbM7YEqa+YuBk+GhjfQuxteou
         ELVFtXkyRdHbiI+VUqIW2RCMMjcWKUKqqF3SnRX/tcMCOipCG1lhROKZ+ZKLiU4xNjzr
         Zoxw==
X-Forwarded-Encrypted: i=1; AFNElJ8zfsovGUj12maLuB4N2gjXEGlLU8AN7pVM5x+LBqWSrlB6MoQspAD5oMY7hCcjdt6j/T6kzvPqDco/GQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3/jzYTgEsY8ml+fp63JS+PS6M7sTaFURYcLereh3VYyfJ5iFX
	cZ8wt8L+33n5BLCMK8D8ZPqtE3c10izgxErvrnlG6Wy4VvM1u7n90LNK
X-Gm-Gg: AeBDiesBlpvJOFfxl2s+1IXVJ5cUKFl4DViVCKJRRjbVAOt73LxXaI+r7H2NjvHfHwi
	RPSKuMRzC8NXe8aO0FEi2CwR6GtMNAesYm9udnyOy5gfJirOJMxzpN5z14GPXHk4zNX5fbt5+6r
	a/PFmp4ytzGQ6h6KVx31IimR2sJ+dSVtg4g5jI6ZM191CGkbQrJTbWhh8EBlUkLWpDfStPjCtDm
	2W3xAlrImRqCsfgD579tgR1ZfXMN6Vzd/zVpf9LALgoRoriOdZAuZoGpKmeRebHr6cQvsaGFRNc
	Hjb95qcqRUzNHDFSUnHVpNjRCrc+NtAauSmxuNyjnfXpBRzUxnDfG0ZIuc4R6KDsWe6E/sxKA6S
	SGMqMc37eCZXcQa+/IeWut/VGUxycWynENSBil3kHxT9+eTuBvIkMhMe2kHlreDB44QSCqveycX
	XjPZPBzRiG1R/XgFeBxhmLpcU=
X-Received: by 2002:a2e:a549:0:b0:38e:1ebe:95f6 with SMTP id 38308e7fff4ca-38ec7b2a3camr30908711fa.28.1776591275270;
        Sun, 19 Apr 2026 02:34:35 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb7613a9sm18221671fa.41.2026.04.19.02.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 02:34:34 -0700 (PDT)
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
Subject: [PATCH v2 1/5] dt-bindings: leds: Document TI LM3560 Synchronous Boost Flash Driver
Date: Sun, 19 Apr 2026 12:34:08 +0300
Message-ID: <20260419093412.40796-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260419093412.40796-1-clamor95@gmail.com>
References: <20260419093412.40796-1-clamor95@gmail.com>
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
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-59094-lists,linux-media=lfdr.de];
	R_DKIM_ALLOW(0.00)[gmail.com:s=20251104];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	GREYLIST(0.00)[pass,body];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-media@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c09:e001:a7::/64:c];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: DA43E4238DE
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

Document TI LM3560 Synchronous Boost Flash Driver used for camera flash
LEDs.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/leds/ti,lm3560.yaml   | 131 ++++++++++++++++++
 1 file changed, 131 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3560.yaml

diff --git a/Documentation/devicetree/bindings/leds/ti,lm3560.yaml b/Documentation/devicetree/bindings/leds/ti,lm3560.yaml
new file mode 100644
index 000000000000..c6c553ad23f9
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/ti,lm3560.yaml
@@ -0,0 +1,131 @@
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
+allOf:
+  - $ref: /schemas/leds/common.yaml
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
+      The LM3560 features 4 selectable current limits 1.6A, 2.3A, 3A, and 3.6A.
+      When the current limit is reached, the LM3560 stops switching for the
+      remainder of the switching cycle.
+    enum: [16000000, 23000000, 30000000, 36000000]
+    default: 16000000
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
+      flash-max-microamp:
+        minimum: 62500
+        maximum: 1000000
+
+      led-max-microamp:
+        minimum: 31250
+        maximum: 250000
+
+    required:
+      - reg
+      - flash-max-microamp
+      - led-max-microamp
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
+            flash-max-timeout-us = <1024000>;
+            ti,peak-current-microamp = <16000000>;
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
+                flash-max-microamp = <562500>;
+                led-max-microamp = <156250>;
+            };
+
+            led@1 {
+                reg = <1>;
+
+                label = "yellow::flash";
+                linux,default-trigger = "flash";
+
+                flash-max-microamp = <562500>;
+                led-max-microamp = <156250>;
+            };
+        };
+    };
-- 
2.51.0


