Return-Path: <linux-media+bounces-27495-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D43A4E41F
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 16:48:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 429B21887E26
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 15:40:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46EA5290BBE;
	Tue,  4 Mar 2025 15:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="smRLv6HK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE52A280CEA;
	Tue,  4 Mar 2025 15:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741101994; cv=none; b=XEmc2vniGpbXh7okfSJKRKBltrMfj1Fov+jBvz/bdisY/orLpqF5hGpxSoEkHso7r6dKhYoU9o0fGhoGsdpmAsby+VX1k/pj4VIvdhMuL/hbpma/3DWsfcOIe/UVQcplE8o4AY4BlVsGnrWG4ENQQz4QFgh+01KmKYJYPLcpYyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741101994; c=relaxed/simple;
	bh=WABG1DKmLchI0BBzGaf0qtGwYpFld1Izg8smCcuKDHQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AYhzVHA4XIxO6V+zL9kwE2iSw4vBwczm+wA3IhjL0LAHY8PrfTQckzzgz9Yvr207RaBTj1mxbYfYfBgdxSMaQf//SAT5+Y2iCkkzinwoHtY4kTLhXINx78KI5FIPTsIVChf917kvtx03yK5kYXARkMBqeuD4Un3TiNhHVrtLRR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=smRLv6HK; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.1.78] (unknown [45.136.247.92])
	by mail.mainlining.org (Postfix) with ESMTPSA id 85844BBEE8;
	Tue,  4 Mar 2025 15:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1741101675;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y19NoGSgI7fek1PDbkc7PM0cpGgo7Tr3QqNQdR92ado=;
	b=smRLv6HK7GG1R4jWbAy3ro8AQ106dYL4kzoD6X+curgnGuFRVfahXeTfISKsY2bCRXavMJ
	m2hAQb/z9XhI5qpKPH4Gkf06T6SBJYNTVFFk+knwnzbOqrJle+Yh590NNw72mI05GhWs8U
	i1y5IqPXNBE4LKvLuMM0x0iQqLVZ2yvVk/lPkUz9fhF/nv3Sh1wOV7QkRu+nz35CjPq2oY
	FW6ykjc8jiroxgE6y/sFQYE4fDfLROdSUL5tUbIGEyw4sv8qPXyQQP3FV2Tah1yxDM/D81
	CSFXiSqdJFm4aY7fV8yDX4HXhilG3G21dg3ykJLIdDZTdxMsiBFx3iMmHwPQdw==
From: Vasiliy Doylov <nekocwd@mainlining.org>
Date: Tue, 04 Mar 2025 18:21:03 +0300
Subject: [PATCH 2/3] media: dt-bindings: media: i2c: Document LC898217XC
 bindings
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250304-media-i2c-lc898217xc-initial-driver-v1-2-e2ffd2b2fd5e@mainlining.org>
References: <20250304-media-i2c-lc898217xc-initial-driver-v1-0-e2ffd2b2fd5e@mainlining.org>
In-Reply-To: <20250304-media-i2c-lc898217xc-initial-driver-v1-0-e2ffd2b2fd5e@mainlining.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, Vitalii Skorkin <nikroks@mainlining.org>, 
 Antonio Rische <nt8r@protonmail.com>, 
 Vasiliy Doylov <nekocwd@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2000;
 i=nekocwd@mainlining.org; h=from:subject:message-id;
 bh=WABG1DKmLchI0BBzGaf0qtGwYpFld1Izg8smCcuKDHQ=;
 b=owGbwMvMwCW2fZ/SFZeSpU2Mp9WSGNKPS6Wfy1a5JTXF/WH4p7b0O3f2uLsyfrBJCJlux/Xsl
 6nJpU27OkpZGMS4GGTFFFlsNnrMFssPl5w07akCzBxWJpAhDFycAjCRNTcYGa5Oqa5JPvD1i8iF
 t5eZliXOm99eJtobEa33a0ttb6RdzkFGhsPx+tycGQpp+caPZl7b5lX20MROuj9q8c/Z+9dcU7w
 eywQA
X-Developer-Key: i=nekocwd@mainlining.org; a=openpgp;
 fpr=3CB1489B166F57199296E520B7BE22D44474A582

Add DeviceTree Binding Documentation for Onsemi LC898217XC
voice coil actuator.

Signed-off-by: Vasiliy Doylov <nekocwd@mainlining.org>
---
 .../bindings/media/i2c/onnn,lc898217xc.yaml        | 54 ++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,lc898217xc.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,lc898217xc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..848e83c38638f702af3f50f34f1ee7256cdcdc04
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/onnn,lc898217xc.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
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
+
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
2.48.1


