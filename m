Return-Path: <linux-media+bounces-57427-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOm8HtuUx2kFZgUAu9opvQ
	(envelope-from <linux-media+bounces-57427-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 09:44:11 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0245834DDB3
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 09:44:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 687F73031E98
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 08:43:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CE42377EDD;
	Sat, 28 Mar 2026 08:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZAwSuP4P"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D37372EC0
	for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 08:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774687412; cv=none; b=jAEH7XjdBVDKPXx2BuX6J2EHAspLoFJH/MA+4iaepstYHfrArFB359IwCwS0AvYtuBH3+ezzuGki9rAOkH38x8sE6FKimmQ/Dh1z1vhoGAygXumyB966pfqYDiUZBNG2eRpFgt6D3YBwD7Y3edIzvjQPW+mnjgngIatQz+vKZGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774687412; c=relaxed/simple;
	bh=ZOYMIbcc/EUyf/Nvkdem/j5BDajcNON6kPzgAvE4W3k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KFE4xqnJ2r2quReqxRPt0HfzXnzk7XpMW/9TX+MpOqG6MxpMQXBR6cRb7rJ1+gQwzTP+Rwae8rOPH9XtqwjDCdUb19up0O9UkS5rvlxr/KURiVotor5aBiJ43N7YBd2fZsJs+7r6DSdEyhgYh/b+zfvqZxdY11U4gOyoVxqmfA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZAwSuP4P; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-829a9d08644so1551415b3a.1
        for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 01:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774687411; x=1775292211; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U3nzGNu2xZzw2bp3cLzv9/0z36OymtFn658cP1Xjwg8=;
        b=ZAwSuP4PBN7KPDlUs5Ao2Jk9ml9nmbwcYX1dXpFK0fahwYiY3Jn2GPGchzIS+73DvI
         Mh1yML35DoHs1sDkn1rgxo1jypRrU9u9JeaGRr12I5wi/9GEdh/ObwOboWPKGSggieMo
         tueDH2uvziDxaB3PQD+c9f+2RzUNO06IhperGi2qFNBWhsZV4THHOSMfP1851cH165Xy
         5KXhY31YPcE26CgU4fIUSHWH2mqPC8lxLNq/FTLa1SqO3zliuRfmxhbHx5esoHsE8mZQ
         7Fjw4Quasnj0kPMh//TvYAcpZhYlJTzFRDNcXJNJZWRdIey+rKuC6DvWO+GnUp37GWAb
         nLeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774687411; x=1775292211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U3nzGNu2xZzw2bp3cLzv9/0z36OymtFn658cP1Xjwg8=;
        b=NR/Ep3UCQYWWhi2VbJyHij0GIveGY5WU/oGx31JLoA53vVZxMfyia/ijb5L5O0eJoQ
         H7B4rWwV0Dy844OIBDz+xsRcFNL2NHa3Hvgeb6atu+FYRe9yPIsHuOYRSzIae6crukos
         3xe3haEYqn6E3HnO0tAjUblwmkWNrfYDC6zdabnBDKMkLMRMLXiVxPnwMbd+KvBa57Ha
         q8yAmjeM1fcT/veXcqejbjsxm1cOHaaCi/MQ0W6lDhrM3zFDCEZYJ5WfntpMSZFPCjNk
         J5Kg3RZCSuWyA6DqrdJ2Y79gtC0z5dljk2BmkJH3mhbsMyRMMifv4ea8UJJBE7RIKZIi
         iRHg==
X-Forwarded-Encrypted: i=1; AJvYcCVvSaZcWDfugxB7AEnSx43gd0YUHdWt5pqgAWCjenQWv7W7wpe+7pCkgc548JkBaJRvffgsgt4YZj+BmA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXnSNSbdXOESipJV/40/St5Uf7RRKFfC0I9Z7n2WM2E2PrNdRx
	YCKURje3ToYCmbJCLX6oLaJf8QJqx0B0UkFq4jg3GZXhbRea4uW+buX1jgwNrXHw
X-Gm-Gg: ATEYQzwiZoFUVyW5vTeENQ3yPltAMwKaOkROln+GBveUhCPTqFkVK2T0rr3MkfVCQlw
	Tl+ey7YLV7cLaH0jl9pTzNFcyn7E3ijdUNiShDzLv4nsP6E2wQkeKEiGVhgYEXbj421Fd6PRbv2
	uLj+GMFXfIGHNMdtEhH7snH/+H3APO6MW85z4KbEpVW29K0XUyNg7hT4B4Vwaga+ZL4A2GH2OOr
	BMpQvHeHO/ujFo1O3i4zxHZep+2cQ/JPON2m93/zP0QyFmNRDEmrozPOUA/+I1w+VghLMjeRhJk
	LVjpoKVVRikFTlSjI7ZbdvKAOgDdId/7i5Fi/Vcv4dfJqM9dFccVtYqZ2xT+K4JcjE6i3Sx+fuM
	nQ0EO791SmSR35lYzOvK4smPGpeAttLpRVkq/2+ZIDUFxZeCeVRRKhguQnHlaO5nfWMci25Aq7R
	lIU7fXS1shPVM3ulDsJ+foKyVCQKoJ0hknCwCUz5vMxCpsUSJrb+CaTk9pwYx1+EWDbkd1uH4Nk
	9cQDGhBAgVfhAsoUxYURLMJoxc=
X-Received: by 2002:a05:6a00:a902:b0:81c:717b:9d39 with SMTP id d2e1a72fcca58-82c960b1473mr5412817b3a.56.1774687410773;
        Sat, 28 Mar 2026 01:43:30 -0700 (PDT)
Received: from pranav.. ([2401:4900:c0bc:73e0:ffb5:d097:4f0:3e88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca843b20csm1795725b3a.8.2026.03.28.01.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 01:43:30 -0700 (PDT)
From: Pranav Kharche <pranavkharche7@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	Pranav Kharche <pranavkharche7@gmail.com>
Subject: [PATCH 1/1] dt-bindings: media: convert hix5hd2-ir to DT schema
Date: Sat, 28 Mar 2026 14:12:38 +0530
Message-Id: <20260328084238.201452-2-pranavkharche7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260328084238.201452-1-pranavkharche7@gmail.com>
References: <20260328084238.201452-1-pranavkharche7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-57427-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pranavkharche7@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[f8001000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0245834DDB3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Convert the legacy plaintext binding for HiSilicon hix5hd2 IR remote
controller to JSON Schema (DT schema) format in YAML.

This binding documents the infrared remote receiver found in HiSilicon
SoCs such as hix5hd2 and hi3796cv300. The conversion includes:

- Standardized property definitions with types and constraints
- Reference to rc.yaml base schema for remote controller properties
- Addition of include directives for interrupt-controller bindings
- Proper example with GIC interrupt specifiers
- Schema validation support for device tree sources

The new schema enables:
- Validation improvement

tested with: make dt_binding_check DT_SCHEMA_FILES=...
All schema validation checks pass.

Signed-off-by: Pranav Kharche <pranavkharche7@gmail.com>
---
 .../devicetree/bindings/media/hix5hd2-ir.txt  | 26 ---------
 .../devicetree/bindings/media/hix5hd2-ir.yaml | 53 +++++++++++++++++++
 2 files changed, 53 insertions(+), 26 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/hix5hd2-ir.txt
 create mode 100644 Documentation/devicetree/bindings/media/hix5hd2-ir.yaml

diff --git a/Documentation/devicetree/bindings/media/hix5hd2-ir.txt b/Documentation/devicetree/bindings/media/hix5hd2-ir.txt
deleted file mode 100644
index ca4cf774662e..000000000000
--- a/Documentation/devicetree/bindings/media/hix5hd2-ir.txt
+++ /dev/null
@@ -1,26 +0,0 @@
-Device-Tree bindings for hix5hd2 ir IP
-
-Required properties:
-	- compatible: Should contain "hisilicon,hix5hd2-ir", or:
-		- "hisilicon,hi3796cv300-ir" for Hi3796CV300 IR device.
-	- reg: Base physical address of the controller and length of memory
-	  mapped region.
-	- interrupts: interrupt-specifier for the sole interrupt generated by
-	  the device. The interrupt specifier format depends on the interrupt
-	  controller parent.
-	- clocks: clock phandle and specifier pair.
-
-Optional properties:
-	- linux,rc-map-name: see rc.txt file in the same directory.
-	- hisilicon,power-syscon: DEPRECATED. Don't use this in new dts files.
-		Provide correct clocks instead.
-
-Example node:
-
-	ir: ir@f8001000 {
-		compatible = "hisilicon,hix5hd2-ir";
-		reg = <0xf8001000 0x1000>;
-		interrupts = <0 47 4>;
-		clocks = <&clock HIX5HD2_IR_CLOCK>;
-		linux,rc-map-name = "rc-tivo";
-	};
diff --git a/Documentation/devicetree/bindings/media/hix5hd2-ir.yaml b/Documentation/devicetree/bindings/media/hix5hd2-ir.yaml
new file mode 100644
index 000000000000..91cba6ec88c5
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/hix5hd2-ir.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/hix5hd2-ir.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: HiSilicon Hix5hd2 infrared remote controller
+
+maintainers:
+  - Pranav Kharche <pranavkharche7@gmail.com>
+
+allOf:
+  - $ref: rc.yaml#
+
+description: |
+  This binding describes the infrared remote controller found in
+  HiSilicon SoCs such as hix5hd2 and hi3796cv300.
+
+properties:
+  compatible:
+    enum:
+      - hisilicon,hix5hd2-ir
+      - hisilicon,hi3796cv300-ir
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    ir: ir@f8001000 {
+        compatible = "hisilicon,hix5hd2-ir";
+        reg = <0xf8001000 0x1000>;
+        interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clock 0>;
+        linux,rc-map-name = "rc-tivo";
+    };
-- 
2.34.1


