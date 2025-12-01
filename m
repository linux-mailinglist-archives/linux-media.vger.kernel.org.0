Return-Path: <linux-media+bounces-47950-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EE9C9753F
	for <lists+linux-media@lfdr.de>; Mon, 01 Dec 2025 13:42:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E5063A2B48
	for <lists+linux-media@lfdr.de>; Mon,  1 Dec 2025 12:42:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B48CA30BBBB;
	Mon,  1 Dec 2025 12:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Gp8OrIvA";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="T+Z3GGVX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2262D949E;
	Mon,  1 Dec 2025 12:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764592894; cv=none; b=ZwkjNxPEMErX9XlLGyCG7EDeBxz+QHHos2DNVurujl/X2KvaslU76tF3kJZgCU70lnTy4Ltjd7CyujqK4ZyPVlrQWEXfHEO8bYr/veErGIY7LBmtAssEutlnhCN5fyIeAyQyfN5vEV0E9jYqnhZKrOIGYRJcNRunL+VFuBlgHvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764592894; c=relaxed/simple;
	bh=jX7R4zqULy2ZtpmBelEfGiXBpgw4Bf6JuN5dlkcVu3I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o7im9UYUy7s/vPXl9yQFM6r5kTx6UMjJnK6XPSyVPJgyXVzxsTngTYWLwSLUWUpPGhNTzfkw5WJ2T1wDNik47YInCBgBPBNdxk8woSZ9Z2WxxkkmWIKYjK0WwPVQ+2XAxP2iU8QBHyq6NMA7GqCyVgztvmKOjpu8RsGITDHOaOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Gp8OrIvA; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=T+Z3GGVX; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1764592856; bh=To6GQbR7FsdWDXvPxvJdkiU
	jxIvPgbRBWHqMm4aMzFo=; b=Gp8OrIvASXXhFYoEBrnOggFU5bNamZNFmvwK7p1aOgzerG5yxI
	UMc7x1f/ChXkYLxN15xYyia/P1AhqXPW4Bsm+hLUY6d2qIoHCHhP0iPrbJ5/3pg8JHEwJPw67Fi
	On6JaqCToWWtsGA8QoWzA6sjX/bu+fFw+sXSHGz33eaziUpjdusZOpx4LJgwSEHJFsghpyZJTVo
	t63UVn3cfEQuXyDXUhOrs44GcLTEnD8K83n3hgbIoprhH9I7CRhAdVcaEwHVPJR+gz9zgqSN+V/
	EaH94bo3Yq47D/WdDtTdK7x3jUN2efj8GmQ3hSjcIpXLsJz5LpsrCyGejf/p+FFftwQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1764592856; bh=To6GQbR7FsdWDXvPxvJdkiU
	jxIvPgbRBWHqMm4aMzFo=; b=T+Z3GGVX8RSWbznnulXKSuAxpprIFF4FTuKnrLExXrhNI3uKW6
	mhMCNI5/2CP6uWFqoAtSicYaVgrOuxN0LTCQ==;
From: Vasiliy Doylov <nekocwd@mainlining.org>
Date: Mon, 01 Dec 2025 15:40:43 +0300
Subject: [PATCH v3 1/3] media: dt-bindings: Add LC898217XC documentation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-media-i2c-lc898217xc-initial-driver-v3-1-46e23897e921@mainlining.org>
References: <20251201-media-i2c-lc898217xc-initial-driver-v3-0-46e23897e921@mainlining.org>
In-Reply-To: <20251201-media-i2c-lc898217xc-initial-driver-v3-0-46e23897e921@mainlining.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, david@ixit.cz
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Vitalii Skorkin <nikroks@mainlining.org>, 
 Antonio Rische <nt8r@protonmail.com>, 
 Vasiliy Doylov <nekocwd@mainlining.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2022;
 i=nekocwd@mainlining.org; h=from:subject:message-id;
 bh=jX7R4zqULy2ZtpmBelEfGiXBpgw4Bf6JuN5dlkcVu3I=;
 b=owGbwMvMwCXGd//xporA/cmMp9WSGDJ1e64zrH9vHOzElLXJYo42496AeN6SLNETmf6vrOZ8t
 388a4NoRykLgxgXg6yYIst/w0VyB24oe9blpj6DmcPKBDaEi1MAJhKygOF/WuoE268Xe5a/Lb7f
 ujh10mGjpGvXku7L7Kg7kp/grqzIw8jQyJ9wbYv9PatgHf1Zx2criH2PD736m7NVYcPT38eVBTb
 yAAA=
X-Developer-Key: i=nekocwd@mainlining.org; a=openpgp;
 fpr=FF31A21EC0D823497E6D65E60EDFE3B27851BF63

Add device tree bindings documentation for ON Semiconductor
LC898217XC voice coil motor.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Vasiliy Doylov <nekocwd@mainlining.org>
---
 .../bindings/media/i2c/onnn,lc898217xc.yaml        | 53 ++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,lc898217xc.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,lc898217xc.yaml
new file mode 100644
index 000000000000..cadd14c4381f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/onnn,lc898217xc.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright 2025 Vasiliy Doylov <nekocwd@mainlining.org>
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/onnn,lc898217xc.yaml##
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
+  vcc-supply:
+    description:
+      Definition of the regulator used as voltage supply.
+
+required:
+  - compatible
+  - reg
+  - vcc-supply
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
+            vcc-supply = <&mt6358_vcamio_reg>;
+        };
+    };
+
+...

-- 
2.52.0


