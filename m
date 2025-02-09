Return-Path: <linux-media+bounces-25864-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D9DA2E0FF
	for <lists+linux-media@lfdr.de>; Sun,  9 Feb 2025 22:52:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E95737A2BA4
	for <lists+linux-media@lfdr.de>; Sun,  9 Feb 2025 21:51:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A781241C87;
	Sun,  9 Feb 2025 21:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vG9AyR5d"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD158248C;
	Sun,  9 Feb 2025 21:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739137938; cv=none; b=Vue4KI1zIiGXb2E3+CQJ+ZJZniFX/n0BUjWct0j8oM11UIPPJQSVvt+wlSW8uMgczpvzBF4D+RAxU6kVNsx2Qu7+suTGf6KI4Yr2SSBKYSaNJHMBfU4hNp2Cu4u5t5tmB8VuwazIfJ0UymuRxnQfaNQbyLnsCW02DACp0mPmpFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739137938; c=relaxed/simple;
	bh=0si0Xis62iZA84qjLJyvATPABObzdkShZCMEtd/PLkc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DCojjy3PnhD0Ft/p6kadRchk/erhDP3r7doRAB74LX18zjpo+i+SSWz8xH0FCEAnoRwz9FyDJvr4FST/TL/my3kfvlZeuNUudcQFYj80ZhzmgfI3Fuu8oDPZI2ucYOBo9VIK56G2BxynWdfFOG1YKEL4tern7pIctsdUaEO0nHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vG9AyR5d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EF51CC4CEE5;
	Sun,  9 Feb 2025 21:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739137938;
	bh=0si0Xis62iZA84qjLJyvATPABObzdkShZCMEtd/PLkc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=vG9AyR5dglSEMheQFu9Ye1G2CKwERsIGnDNCKNLoDEvzLCDvoP8x6RgykpcpVVCnH
	 GhJwYV0scOUai3iiBDBcZUVxIFPbEZlUBIURw8cwIngOCHM/M798cDwR7fMD6DW2VE
	 iEF6FTPQ9v9SINoG4ux68ZNZmZ1HotAFekFnmyZAEbCtuhmkku+rhzhbRsfhtFOcoJ
	 0DR0qe8JIhBNfcELEz/Na7oZjdQA1kSGqrWUA8qFsyxsUffkw0doFuC8swinNvffmk
	 58p3lZSI6C4lOt19lKbj8XUFsHAN5aw/37x67M935Dya7tYEuvZ8SQNpnzBIwuFRYy
	 EiMu5RI9geW4Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB84EC0219D;
	Sun,  9 Feb 2025 21:52:17 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Sun, 09 Feb 2025 22:51:57 +0100
Subject: [PATCH v3 1/2] dt-bindings: media: i2c: Add DW9719 and DW9761 VCM
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250209-dw9761dts-v3-1-14d3f00f0585@apitzsch.eu>
References: <20250209-dw9761dts-v3-0-14d3f00f0585@apitzsch.eu>
In-Reply-To: <20250209-dw9761dts-v3-0-14d3f00f0585@apitzsch.eu>
To: Daniel Scally <djrscally@gmail.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739137936; l=1650;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=VMCqVc24c9S5LJtNjPFsXe/GrcCNw3hzuYoj92Rfr3Y=;
 b=0ThCYlAuDhrGQ10YOxPYdp0nNASxxTKs4qP4uq+GUh8ksDVdew/NEv8VR7yZ8JVep7D5+nFdJ
 DNxu9OmClHdDQiVgp2oIazWRuJz7qo6gx8lmz0RiosuwVgCsT2vzvqi
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: André Apitzsch <git@apitzsch.eu>

Document Dongwoon DW9719 and DW9761 VCM devicetree bindings.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 .../bindings/media/i2c/dongwoon,dw9719.yaml        | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..b38d22bf09713a7999e1f9ce6553de7587dbe5d2
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/dongwoon,dw9719.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Dongwoon Anatech DW9719 Voice Coil Motor (VCM) Controller
+
+maintainers:
+  - devicetree@vger.kernel.org
+
+description:
+  The Dongwoon DW9719 is a 10-bit digital-to-analog (DAC) converter. The DAC
+  is controlled via a 2-wire (I2C-compatible) serial interface.
+
+properties:
+  compatible:
+    enum:
+      - dongwoon,dw9719
+      - dongwoon,dw9761
+
+  reg:
+    maxItems: 1
+
+  vdd-supply:
+    description: Regulator providing power to the "VDD" pin.
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
+        camera-lens@c {
+            compatible = "dongwoon,dw9761";
+            reg = <0x0c>;
+            vdd-supply = <&pm8916_l10>;
+        };
+    };

-- 
2.48.1



