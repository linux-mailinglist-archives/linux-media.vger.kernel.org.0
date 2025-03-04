Return-Path: <linux-media+bounces-27526-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9737A4ED62
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 20:32:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2274F16E06A
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 19:32:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B59D264619;
	Tue,  4 Mar 2025 19:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="O8ntAkpt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDED259C8A;
	Tue,  4 Mar 2025 19:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741116747; cv=none; b=Q30DwibVx8FHfa/IxaYF4uI3cZ9Fh6GzFnMpAU8/TSyab05kDJy5RBXP44S8aGAYWCmC++zRhxFkWLw3rYiyq/23zAEdOAPEQqXtMaDv9mmb0sUsQ6fv1PT1XjgQc4IWbOpP3t55Ibk/C917clguJRNzsjMyOfQbE586fiKw14E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741116747; c=relaxed/simple;
	bh=NF9dNQDfgKlChd5hDdrsF8MLDBUcsJDSKInl5TObMjM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mqFrQdg53GYnI6jG/ZDojRlDbFWZXyxWfwmVNuEdTcpzvx9nFvV4rakAOsP5xk3zKEamRIlqv3nI9Z/jtXNdq4dqqBhCNrngXODzn9VItfoJPbJdN6kMzJvaqbf5u8DDu1LaQJ6lsmdHnG13t688qRDsb7DI5Y8hpKE5XiLdyGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=O8ntAkpt; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.1.78] (unknown [45.136.247.92])
	by mail.mainlining.org (Postfix) with ESMTPSA id 54851BBEE7;
	Tue,  4 Mar 2025 19:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1741116744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=on4zvY3vsLi5Yr4Qba9ODMlNSagHJy2+aaazI8BrlSE=;
	b=O8ntAkptUGKTjH3XemAKNJHs40fI0h29nEhFmEBro84Eb7pCWWhYDUvcRPTLQrdpBKaYZj
	S3NEWytj0OJbkZnR82vglvXxkOgIcnvUe3MXlspiZyE5I59qK0KZA6RScpDYMwppdlqKMZ
	/qCgEoEIb8YI2IEz996JjLVrxKlxBN35nz63TH7TIa3Lici8lLvpchDdrJ1S1J/08WPT07
	SHuOFF5MLlHla34kOZlr1nB6PYtOmre+lDc8wDDi743ss6n7+V0BTEZhkPnSn+zt0UZIlL
	LHMz6EHjbl0fhXZjZBla5v9CuP3ddJi+DL+2F2ANrldS5MW9Iv4WDlpp7h/8YQ==
From: Vasiliy Doylov <nekocwd@mainlining.org>
Date: Tue, 04 Mar 2025 22:32:19 +0300
Subject: [PATCH v2 2/3] media: dt-bindings: Add LC898217XC documentation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250304-media-i2c-lc898217xc-initial-driver-v2-2-6a463cef3ea8@mainlining.org>
References: <20250304-media-i2c-lc898217xc-initial-driver-v2-0-6a463cef3ea8@mainlining.org>
In-Reply-To: <20250304-media-i2c-lc898217xc-initial-driver-v2-0-6a463cef3ea8@mainlining.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux@mainlining.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Vitalii Skorkin <nikroks@mainlining.org>, 
 Antonio Rische <nt8r@protonmail.com>, 
 Vasiliy Doylov <nekocwd@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2009;
 i=nekocwd@mainlining.org; h=from:subject:message-id;
 bh=NF9dNQDfgKlChd5hDdrsF8MLDBUcsJDSKInl5TObMjM=;
 b=owGbwMvMwCW2fZ/SFZeSpU2Mp9WSGNKPh7r09EmWHZ+wdr5YYQjbhisi+g1Hct3z1lae0ddny
 8/VZLDtKGVhEONikBVTZLHZ6DFbLD9cctK0pwowc1iZQIYwcHEKwEQKJzP8U/t/NvzI6/n52lff
 Riy/987v+irjXK4k6yUbN1iekmL3msvwT297aYzN+ZWfZ0/MY5zl56PanfXRvcj5jirLjbXzb7Z
 oMAIA
X-Developer-Key: i=nekocwd@mainlining.org; a=openpgp;
 fpr=3CB1489B166F57199296E520B7BE22D44474A582

Add device tree bindings documentation for ON Semiconductor
LC898217XC voice coil motor.

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


