Return-Path: <linux-media+bounces-56924-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4N3YJzwNw2lKnwQAu9opvQ
	(envelope-from <linux-media+bounces-56924-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 23:16:28 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA1831D37C
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 23:16:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1FF093087E9A
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 22:15:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA4443C7E0A;
	Tue, 24 Mar 2026 22:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WoLQvTXe"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3BC3148C2;
	Tue, 24 Mar 2026 22:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774390502; cv=none; b=Z5YJB1RdGafHFpGabfJgAYmEu/EJNEwXy8r9BNkDA14fPalrzlypP9j1hW+LaXft0hkEPLr4U4Y5O3408/jFDFTcp2S2mr/grwlEcvtl0d7al/K39MNLLKNs5iyhgYFANi8Hs/gdYHGEdD6C2hrBXexkCfAfWVHCWFltVRSy0wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774390502; c=relaxed/simple;
	bh=DsqVPdfD8ISkjXspsLL9oaH8DjYIqEMwGDyaNB/CfEU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WimH7V+jRtuum9ScffIfq0peDMFAy7b4HRhdmjcswwNKq4nsHpxfUnzRWmQgxEC5TLRTip5YqwoMi9QeYy3fLoihY2Vz4IVVzB6i+KA7I6fYMbL9laXzVoLznQx+ZRc6UclmqEQ3C6BSYGYgIEtBAJKgSzqxYYHgTcNLnTQh0/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WoLQvTXe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E4E7FC2BCB2;
	Tue, 24 Mar 2026 22:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774390502;
	bh=DsqVPdfD8ISkjXspsLL9oaH8DjYIqEMwGDyaNB/CfEU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WoLQvTXef3IjBaRKa1SpTJrKQ8UTqOykFWzk2lv2lmfj3IZmL3l2xWnTpv48Gprh5
	 J0GuJaV+L6ljkqmC4yA587sY9nVWKTC3eEvIyagbAa3wPHH6p0An4Z2B0YQKjQjcZq
	 s2fDhMzbbDDqgAPBFsBWCeEnInCUUjc2WM3N8ySxqnbRdi/4aDIxA24iOrlcPFrhLn
	 0mLTz0nlSxHxoZVJvloxlZnZtxXQkmhFYZCz0Uf6xK6c6OHup5comk+qahmUshIRNi
	 fj544VcivqyRV14VfzjFm+3iZqBZRC8AEngEf/MKIkFpKqkZBAotlL+DsJhEMv+gkX
	 gpqD4zdvavYmA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2D67FEC11B;
	Tue, 24 Mar 2026 22:15:01 +0000 (UTC)
From: Vasiliy Doylov via B4 Relay <devnull+nekocwd.mainlining.org@kernel.org>
Date: Wed, 25 Mar 2026 01:14:59 +0300
Subject: [PATCH v4 1/3] media: dt-bindings: Add LC898217XC documentation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-media-i2c-lc898217xc-initial-driver-v4-1-6ad6fd74915e@mainlining.org>
References: <20260325-media-i2c-lc898217xc-initial-driver-v4-0-6ad6fd74915e@mainlining.org>
In-Reply-To: <20260325-media-i2c-lc898217xc-initial-driver-v4-0-6ad6fd74915e@mainlining.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, david@ixit.cz
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Vitalii Skorkin <nikroks@mainlining.org>, 
 Antonio Rische <nt8r@protonmail.com>, 
 Vasiliy Doylov <nekocwd@mainlining.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2137;
 i=nekocwd@mainlining.org; h=from:subject:message-id;
 bh=gAIKVNm3sPMRo8XiyTDHAKl5QbG8+l10pLPUeIPuNNk=;
 b=owGbwMvMwCVmXFbadLHr1XTG02pJDJmHeZ4UX2nZvrxjc65CuM/zSzPzTz72r3kaoR64rPxB8
 vcb0txPO0pZGMS4GGTFFFm63x++92AeL2up+idemDmsTCBDGLg4BWAibk8Y/hfUaE9iXiaYVMhs
 V+hokNef/W1LXM587Sxb/50vnO/wRjH8T2gqV7FxO+yhbuTdxmahy7iow+7d63veGpnibtdXhDb
 zAgA=
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56924-lists,linux-media=lfdr.de,nekocwd.mainlining.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,mainlining.org,protonmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,devicetree.org:url,mainlining.org:email,mainlining.org:replyto,mainlining.org:mid]
X-Rspamd-Queue-Id: 1BA1831D37C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Vasiliy Doylov <nekocwd@mainlining.org>

Add device tree bindings documentation for ON Semiconductor
LC898217XC voice coil motor.

Signed-off-by: Vasiliy Doylov <nekocwd@mainlining.org>
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



