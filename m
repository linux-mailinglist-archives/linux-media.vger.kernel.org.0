Return-Path: <linux-media+bounces-58585-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIFYCPRI2mnWzggAu9opvQ
	(envelope-from <linux-media+bounces-58585-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 15:13:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 998713E012A
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 15:13:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 23BF83026B22
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 13:13:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88320271468;
	Sat, 11 Apr 2026 13:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mafzj2Xf"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E1B1DD0EF;
	Sat, 11 Apr 2026 13:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775913193; cv=none; b=CAOrNU3FniZ3L+hEcesU7qPv51zMvl9zXX4fJ+xtFI+eHaZ2r41X8Jy9vTYj6I11s+fosMxKJBGSlleFBkxVVprsQUvEWA8NJCYJ4XfRXKULfVoDgn69V7lWZcBAfBEguR/pmL/xtJmJ65mZtA9IuLybKCzA3bgGlCLhnee1084=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775913193; c=relaxed/simple;
	bh=2ENfBnHpWpi0r3ZLXmWmDjqJ8aRPN1NeTlp9MkMlkUg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d3SJW3d5S3Lf7F/oizpJmRVZAjtx9I9l6V7hp8hWjdhzsbILs6k9RUEd7zD/IOB1+LwUWYOzDYJnJwfFDGAE9YbSgNeUMurazMJJOOKSHryLLbrEJzQUOoGu1zutrRwTDFPtaDyAQCDOwQ+V1HC1wDZkztd6s05kyVYM4TFA5sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mafzj2Xf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9717EC2BC9E;
	Sat, 11 Apr 2026 13:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775913193;
	bh=2ENfBnHpWpi0r3ZLXmWmDjqJ8aRPN1NeTlp9MkMlkUg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Mafzj2Xfxs1JswfQVghhSTG7/vfIawzdxdpuzCz4ntD0WJ8prFosYBci+9yLHI2WD
	 SqTO/amraJOW0852zWyDReSZ4XW44Ktup8R+lsiG0b24ob0tzpkvV8rsBv0PtTvtOW
	 +AhpkkkoWCTE9LLiWfkfaq20u7E8c049R4pc0dAIe/XqPfhvQfeD5QC8NB9oXDUwxc
	 iP41/kerJi2TkIBtmMbSLf5ZNrV8b9pU31SuUv+/qOogrDZOGpwL7sVfB9Z+TOSWgP
	 VfO8w8F1bctthbNuj5du7C368mVNOsRX1oat6gclGI+EvN44dvlNbHwZmsM9BXt4Za
	 jmRGsCCBWBtLw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88E84F3ED4F;
	Sat, 11 Apr 2026 13:13:13 +0000 (UTC)
From: Vasiliy Doylov via B4 Relay <devnull+nekocwd.mainlining.org@kernel.org>
Date: Sat, 11 Apr 2026 16:13:08 +0300
Subject: [PATCH v5 1/3] media: dt-bindings: Add LC898217XC documentation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-media-i2c-lc898217xc-initial-driver-v5-1-c71ddcf40bad@mainlining.org>
References: <20260411-media-i2c-lc898217xc-initial-driver-v5-0-c71ddcf40bad@mainlining.org>
In-Reply-To: <20260411-media-i2c-lc898217xc-initial-driver-v5-0-c71ddcf40bad@mainlining.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, david@ixit.cz
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Vitalii Skorkin <nikroks@mainlining.org>, 
 Antonio Rische <nt8r@protonmail.com>, 
 Vasiliy Doylov <nekocwd@mainlining.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2204;
 i=nekocwd@mainlining.org; h=from:subject:message-id;
 bh=s4FrTZ3Fx26kAj8zMlKs4iZ3umFcszpWLs1SXRZOPZs=;
 b=owGbwMvMwCVmXFbadLHr1XTG02pJDJm3PF5wrD+dsuxJwrHOXN5pVp3vJ/WGifmICd7dc91/m
 kTSzKagjlIWBjEuBlkxRZbu94fvPZjHy1qq/okXZg4rE8gQBi5OAZjIRztGhicvMiVOs00WmPd+
 z/t+o6xTIhE2r569D5ObckAqdOkrYV6G/6mm2ydWs4jGWk08o7JiZ/vKU9KtP12fxAucdJ/Ju6m
 3nA0A
X-Developer-Key: i=nekocwd@mainlining.org; a=openpgp;
 fpr=8BEFC3DEE09E0D057527F20D33767582D18AEA97
X-Endpoint-Received: by B4 Relay for nekocwd@mainlining.org/default with
 auth_id=692
X-Original-From: Vasiliy Doylov <nekocwd@mainlining.org>
Reply-To: nekocwd@mainlining.org
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58585-lists,linux-media=lfdr.de,nekocwd.mainlining.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,mainlining.org,protonmail.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[nekocwd@mainlining.org];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	DBL_PROHIBIT(0.00)[0.0.0.74:email];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,devicetree.org:url,linaro.org:email]
X-Rspamd-Queue-Id: 998713E012A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Vasiliy Doylov <nekocwd@mainlining.org>

Add device tree bindings documentation for ON Semiconductor
LC898217XC voice coil motor.

Signed-off-by: Vasiliy Doylov <nekocwd@mainlining.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/media/i2c/onnn,lc898217xc.yaml        | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,lc898217xc.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,lc898217xc.yaml
new file mode 100644
index 000000000000..3dd137d4c67c
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/onnn,lc898217xc.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright 2025 Vasiliy Doylov <nekocwd@mainlining.org>
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/onnn,lc898217xc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ON Semiconductor LC898217XC Voice Coil Motor (VCM) Lens
+
+maintainers:
+  - Vasiliy Doylov <nekocwd@mainlining.org>
+
+description:
+  The LC898217XC is a 11-bit digital-to-analog (DAC) converter.
+  VCM current is controlled with a linear mode driver.The DAC is controlled
+  via a 2-wire (I2C-compatible) serial interface that operates at clock
+  rates up to 1MHz. This chip integrates Advanced Actuator Control (AAC)
+  technology and is intended for driving voice coil lenses in camera modules.
+
+properties:
+  compatible:
+    enum:
+      - onnn,lc898217xc
+
+  reg:
+    maxItems: 1
+
+  vana-supply:
+    description:
+      Definition of the regulator used as motor voltage supply.
+
+  vdd-supply:
+    description:
+      Definition of the regulator used as digital core voltage supply.
+
+required:
+  - compatible
+  - reg
+  - vana-supply
+  - vdd-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera-lens@74 {
+            compatible = "onnn,lc898217xc";
+            reg = <0x74>;
+
+            vana-supply = <&mt6358_vaf_reg>;
+            vdd-supply = <&mt6358_vcamio_reg>;
+        };
+    };
+
+...

-- 
2.50.1



