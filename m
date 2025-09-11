Return-Path: <linux-media+bounces-42378-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47530B5397B
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 18:41:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC580A0727B
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 16:41:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA73535CEC4;
	Thu, 11 Sep 2025 16:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hK23W9QZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D47A35AAB8
	for <linux-media@vger.kernel.org>; Thu, 11 Sep 2025 16:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757608854; cv=none; b=g7H+60tsBJ7n7FzEqk8mGWI+fUUxcqrhvflWo4iRTy1n9pU+b0Wd+ZwVSNxt6vH1f20AdlA0ey4/HOhbRQWj/KtkVteV+WbBPvO7XI24TQ+wUHuyJwfYDq/R+ajX3qPhH84VCdYNAORwjz2pedaZ6nEEGNDjKe5E9RT5zzF+6Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757608854; c=relaxed/simple;
	bh=a4DgACCHBYE7klse7BZobqD/NjzeLWKDISI/21WHr8g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K3cFeXowuMnlhxaxEQNkULZY6THhbb8RhErv3IIl34OJ+s2KyO95oJYbjgO3J9ULZ+CTkoGSPYUomHJ2HbIVUIQiBb8Y0FOvNSIL2VYJFqkHUYliiWUrkBcjO+CaQva7AVOXJhA/FQRDwE0g0rhPrsrfuj/WFE99C1Rv1xJb1lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hK23W9QZ; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45b9a856dc2so6155515e9.0
        for <linux-media@vger.kernel.org>; Thu, 11 Sep 2025 09:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757608850; x=1758213650; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gO/UfK1aYEVqxe5Kt8p5mu5GTkTJwSNJjdbcvgmikd4=;
        b=hK23W9QZWgWCCYIgUX0whAqsO3y99h+/cAajOwtLzT/DDAxD/mtK3Ux1IWV3SOdimO
         iy3MO0xkLF7cZEDXI3qM255VlkI46quH0AFpu0YmY0Fp6jlfXvG9UtNMrNsYfoPYWw9b
         ShJnhKwWdDeAw61cUhMpq5unjWAE3v2cfd9hL+wJKOx2q/BGw5kff3vSXyunQQ1kJkeW
         2ubtsajLO2qxQhe0/SlxPuUIozLek9si1LN6NlGKetIlD/63WRdW3sdmmfo2ty42YRcn
         r/6/EI1OxrEt9RqY8utOu3MqWgobhiiKaHKaRPZ1//20fB0dCSThFvR09km1nTAfAi+S
         Jexg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757608850; x=1758213650;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gO/UfK1aYEVqxe5Kt8p5mu5GTkTJwSNJjdbcvgmikd4=;
        b=a28MZByI6hahGkte2aw0MSC+XRP6SG8QEbf7IpQCMXYYQLwfHE4ZBYKyGaBTJdX6JZ
         OtoHnegCFog3V9ZpClvSuMMoGuj4ZVWcM2QDM16Pi9hAze8G/Bx4op4Wxl9ETB4LCNst
         MwdlpByQqPasx02t8BxHOqfqHuBoMkfvaXJTtCkOIqZTK8P/vNiybRY12SRZtib1G54v
         iLzGOvhDOGrxcUnWEBakcad1umx6GBkaMlZHYh5Lcg3dL/sSzIb8/Ch1byTu6NGM60wR
         U9FsLjnW/VvvA8sBVrevpGRIrPGxz18V8z2UgrYuHUhJVLhrT8aNL6bjbPWf/sTm9Zqy
         VFcg==
X-Forwarded-Encrypted: i=1; AJvYcCUTJy+zksnpJT9p4D5Mn2c98C4M8TCsWAlP3hcLl0Vozx7aWVuPngw/R4w2/7xo24oMFcm/kMZ/GxJpwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAcB4sJhmbpOQ/qqbvz5zkHUzyy2ATDdN8KSph4dcXzu5CRh51
	UR2FMdsoieyU7Ij2upNGWUj3LIUWU9A/TTqTsfwPsS5tsyIf++LBEIPV
X-Gm-Gg: ASbGncsKtxTBd1uzQICCCNqB9apSTeI7a51rVPyCtnf7ho47inORCbeiFmTXzxP/5i1
	7UPFaIj1j/nE3nu0PMr00WgHd0cGQuSk814sGnv5Css8sLriq58/yHjFrO9IKLDsKFvBjaEufYt
	1a47l1SyfaGUgua2hXlwoAVO8tVm8g8IW1q4oblWAbzglSgsRBG/LlEviTAdZNl0aliV76lhKin
	QuvozVJ1FffxWt4QUmNanpmCaXmrDmZi4L5Zn3j76DR0fOXZxGP8lF4FBcCij5DeSXXNMNMf6ze
	QMIJ3TOidzuf/njgL/9CnTY9OEMlpIeUySZwK30kx3QnQgmuFsPTTHKXcQnsPYYpX9vejjg6eCq
	XNve4CMnAap+HJmk+cUGHwSQ=
X-Google-Smtp-Source: AGHT+IFNINYP07L5vnE6dG0TQi6RkPduUefTVgGS8sPFZixor0lyaNc1rPgv7TghYgLkzMGhKmEl2Q==
X-Received: by 2002:a05:600c:6549:b0:45d:5c71:769a with SMTP id 5b1f17b1804b1-45f211efde9mr749025e9.26.1757608849705;
        Thu, 11 Sep 2025 09:40:49 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45e037c9d91sm28641195e9.20.2025.09.11.09.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 09:40:49 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Thu, 11 Sep 2025 18:39:58 +0200
Subject: [PATCH 2/4] dt-bindings: media: remove support of
 stih407-c8sectpfe
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-master-v1-2-5d5d5ea9af22@gmail.com>
References: <20250911-master-v1-0-5d5d5ea9af22@gmail.com>
In-Reply-To: <20250911-master-v1-0-5d5d5ea9af22@gmail.com>
To: Patrice Chotard <partice.chotard@foss.st.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4064; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=a4DgACCHBYE7klse7BZobqD/NjzeLWKDISI/21WHr8g=;
 b=owEBbQKS/ZANAwAKAechimjUEsK1AcsmYgBowvuL9Vjok3vHYY6V+qRwOsG+KAigufBL7elki
 FcVB90OdG2JAjMEAAEKAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCaML7iwAKCRDnIYpo1BLC
 tVHyEACZI3TtS23Qapj61fuiC+QFCObIViOThyK/uTv+4H/VrfgAg/TDIAKlh3+qHMlPNGNjGud
 RQU/CHEbQ4qYPAGovDR8oq4PonutJaj3NWPROGF5GZ3trRhuSftIDPOWMUpLnLiyBaa/cCkTXX0
 v+os5L+PiMixN/YESNipdC5oU8M0NPOCyJvbXJed6tFoXeur52DmcYoz5dXrOpJpEdxgVtMGHHm
 l+vOL+kiUnW7tCoZaWxrbXFdTD6DgWfRnMWw3fcGm1TKn7ai7FkvQ8fkfk8HE5+i7yd6vCwK7JY
 yivdW/+iXh6/dc4VTfGV1EZQNIGBk0iAtLlakSCo4+yIvHmXJABCExLrlPujIB6gPHAmW2ZBbdd
 JBh1gdr7teeV1YlmP5K12p2JRkYWF5knsAm7o7aHKl0OBrdXtM8p204unMblkdNmQCgL15pF4BD
 E3kYgjQnruHtXRecG2lUKcOfTg/eF4JKBDOF+G3+Jk5DBmGZXH8wg/ntyOe//9UacE9D5fbJqdw
 rNcqvaM/AqN9WLEpGCX8fM5ziBoXoTbSooJOoCl5SIUbanngNlScVP0V/1IOuO0ZFMR0/fBx0Gj
 mZW6adXkB1SY2tVQD9WjYVHBMss5DSHojps+ZY9VWzE6QXr6KqF4foIRDuKB8U8xqdo0QNqa0dU
 zO+hTPC2q6KTqzw==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5

Remove file documentation from stih407-c8sectpfe driver.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 .../bindings/media/stih407-c8sectpfe.txt           | 88 ----------------------
 1 file changed, 88 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/stih407-c8sectpfe.txt b/Documentation/devicetree/bindings/media/stih407-c8sectpfe.txt
deleted file mode 100644
index 880d4d70c9fd741ac13101721ced18f04336c373..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/media/stih407-c8sectpfe.txt
+++ /dev/null
@@ -1,88 +0,0 @@
-STMicroelectronics STi c8sectpfe binding
-============================================
-
-This document describes the c8sectpfe device bindings that is used to get transport
-stream data into the SoC on the TS pins, and into DDR for further processing.
-
-It is typically used in conjunction with one or more demodulator and tuner devices
-which converts from the RF to digital domain. Demodulators and tuners are usually
-located on an external DVB frontend card connected to SoC TS input pins.
-
-Currently 7 TS input (tsin) channels are supported on the stih407 family SoC.
-
-Required properties (controller (parent) node):
-- compatible	: Should be "stih407-c8sectpfe"
-
-- reg		: Address and length of register sets for each device in
-		  "reg-names"
-
-- reg-names	: The names of the register addresses corresponding to the
-		  registers filled in "reg":
-			- c8sectpfe: c8sectpfe registers
-			- c8sectpfe-ram: c8sectpfe internal sram
-
-- clocks	: phandle list of c8sectpfe clocks
-- clock-names	: should be "c8sectpfe"
-See: Documentation/devicetree/bindings/clock/clock-bindings.txt
-
-- pinctrl-names	: a pinctrl state named tsin%d-serial or tsin%d-parallel (where %d is tsin-num)
-		   must be defined for each tsin child node.
-- pinctrl-0	: phandle referencing pin configuration for this tsin configuration
-See: Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
-
-
-Required properties (tsin (child) node):
-
-- tsin-num	: tsin id of the InputBlock (must be between 0 to 6)
-- i2c-bus	: phandle to the I2C bus DT node which the demodulators & tuners on this tsin channel are connected.
-- reset-gpios	: reset gpio for this tsin channel.
-
-Optional properties (tsin (child) node):
-
-- invert-ts-clk		: Bool property to control sense of ts input clock (data stored on falling edge of clk).
-- serial-not-parallel	: Bool property to configure input bus width (serial on ts_data<7>).
-- async-not-sync	: Bool property to control if data is received in asynchronous mode
-			   (all bits/bytes with ts_valid or ts_packet asserted are valid).
-
-- dvb-card		: Describes the NIM card connected to this tsin channel.
-
-Example:
-
-/* stih410 SoC b2120 + b2004a + stv0367-pll(NIMB) + stv0367-tda18212 (NIMA) DT example) */
-
-	c8sectpfe@8a20000 {
-		compatible = "st,stih407-c8sectpfe";
-		reg = <0x08a20000 0x10000>, <0x08a00000 0x4000>;
-		reg-names = "stfe", "stfe-ram";
-		interrupts = <GIC_SPI 34 IRQ_TYPE_NONE>, <GIC_SPI 35 IRQ_TYPE_NONE>;
-		interrupt-names = "stfe-error-irq", "stfe-idle-irq";
-		pinctrl-0	= <&pinctrl_tsin0_serial>;
-		pinctrl-1	= <&pinctrl_tsin0_parallel>;
-		pinctrl-2	= <&pinctrl_tsin3_serial>;
-		pinctrl-3	= <&pinctrl_tsin4_serial_alt3>;
-		pinctrl-4	= <&pinctrl_tsin5_serial_alt1>;
-		pinctrl-names	= "tsin0-serial",
-				  "tsin0-parallel",
-				  "tsin3-serial",
-				  "tsin4-serial",
-				  "tsin5-serial";
-		clocks = <&clk_s_c0_flexgen CLK_PROC_STFE>;
-		clock-names = "c8sectpfe";
-
-		/* tsin0 is TSA on NIMA */
-		tsin0: port@0 {
-			tsin-num		= <0>;
-			serial-not-parallel;
-			i2c-bus			= <&ssc2>;
-			reset-gpios		= <&pio15 4 GPIO_ACTIVE_HIGH>;
-			dvb-card		= <STV0367_TDA18212_NIMA_1>;
-		};
-
-		tsin3: port@3 {
-			tsin-num		= <3>;
-			serial-not-parallel;
-			i2c-bus			= <&ssc3>;
-			reset-gpios		= <&pio15 7 GPIO_ACTIVE_HIGH>;
-			dvb-card		= <STV0367_TDA18212_NIMB_1>;
-		};
-	};

-- 
2.51.0


