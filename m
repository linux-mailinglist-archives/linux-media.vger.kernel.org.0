Return-Path: <linux-media+bounces-52945-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIuQJlG2k2l17wEAu9opvQ
	(envelope-from <linux-media+bounces-52945-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 01:29:05 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 001C21484DF
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 01:29:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 94EA5303526D
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 00:28:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12C9E264612;
	Tue, 17 Feb 2026 00:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UtA+1sQ5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268AA2673A5
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 00:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771288106; cv=none; b=BJ4Gn5Yd0wQGPQyDkW1NUdW5JVqfvRkYDGFZPBn0z3uTeSRe20GEkpZsJon3OBx2U8EPOTmqV9aNkAnh+o4yxq7c2XSuBPNJLMIE00D4NVDFdAkbvcuzKYY8LekITF1SH4dsu1X3UTCAAlyDahvSfjlR/PbDM7rt/CKKySmjcl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771288106; c=relaxed/simple;
	bh=EcTRKDBc1veGtECuqy6AI3PYeK9xENvrGwMb1X7Kpbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TIGQ+vBLHGyvoHzBMtAkrDDAIlX1SO25LEVjKzqAT3PhCnCnhdxJXa6sdJlPgHifBWYbk+ixCW+g82oSVQZllvUeePysEggtRVQFL6PrBfee2ylov/r0jVpSI12ECr6+OzLNj0H+8GbOMTKFg1UBhhqWMfoJWATHH7ljDdFxLbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UtA+1sQ5; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8cb39f64348so314054085a.0
        for <linux-media@vger.kernel.org>; Mon, 16 Feb 2026 16:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771288104; x=1771892904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JLRIaf1mXyXFgjmYj7clQ+v1OirQdgTMmdH6PpF9IHw=;
        b=UtA+1sQ5l4f4RNGmavrlB6y0MohCS8lTN2Wn/IKmV1htTSe/8B1J22dBmyYs1wRH4c
         l3mYHpndvy5Wbo2xx7rRLFvwkikGKoJfZQhCPCtfck6tCYICZ6tn/PgFA06fFBhswRdm
         qdoYet1iRR85Jp+nPJekj3T9MZOzM240oaOpkIhPa2O+fngTmGAPEZ7zoPAeGFKA/BZb
         F7mEuEQq21qsB3GLRjv9NrouMvfA+Axkg1lXUtxbbnoqmTyaqCoqaptexc6PaBtksq/a
         5df7wHzNba0dyg9vM93RHJx5rpxNfOFJi5CIaoGlZqyQYjz8PNACX+4y3IxO9tXAj+pL
         1agQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771288104; x=1771892904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JLRIaf1mXyXFgjmYj7clQ+v1OirQdgTMmdH6PpF9IHw=;
        b=avz1o/Jm7oFpgsQIGrUx22cd4KVIZOmbBIwTaz38Xrjtp7b9Q49Nt6QdhPO54hWUSY
         qcbbrCHw61LQgLJHqgAvo9H8ulRuT8KYIcyGPXXrNXWdkVC9+wQTKxcKhppcLvE4uvvQ
         86PjJHjBBPalCTFrNQNqukyoMaJRBJPv64Iwznl4Bdtdlh8YbeJaYO/Lok7/7cTlVhPu
         tGVI0dJBojxQI9FAeDhoc033HtLGojAw1PLlkceJR7li8hd+eR4/uW8QOz0/jB5uih0X
         3EtQzUYHFF9Jz+5lBJYqjSyttX0UbIpUiF3oixGdqG0VjRl8ITF7uWkSx6xQvay07xEX
         WOGg==
X-Forwarded-Encrypted: i=1; AJvYcCV9iZkTsWeTob4Z77xA1sI9wz+OSXR+4Jp/P70vI0CkYrgm0a66evPn0BLKD7k9xN7VTYwii1I2Z92fzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSCoOkrA6XBKXI1ngfASPWaClCBCubIPaClcVUuyZ6TCsK08fV
	PDU0lUadG1BgstU6UYYUL/EhiSLYPqXvHxGEfBRQmHrtajUifOgzi9pg
X-Gm-Gg: AZuq6aJLZxVXQZD42697MfG4lDy17L5cXjI2qc8+bq7bn3oUo+0lm0pOY2IebZGdV97
	TCItvE2C64WxjfNAeFuPShSI31phtwB+B+5fUDyr1ygvrXH3GtBSOksSyShpxxSVXB9U7Ojzf4X
	mk1oKM7l/3rfqcZusNAYbt/TX4CPJeZU8Iwb/y8AS/6bXesGJLFV36Wb56dRy9tUe5O/qDwBizM
	Lmk9UvP5MTHtVGI51MM/EBrlg4VXEDi5Q9eqkeDHIpTAgnGDtVoXspdTE8hSTnXMppCUdXGEkYf
	/vS9fwTjIGmrM0I4K6VNszPuuD7hDFZ8UhiRALxr32Z/NNLdyl1t90DdlKPIda9RkC4hnOdVct9
	0XWk11pDaK3I63URNHd5U30eWLHMvyf6/4Wia/80ztHi71/s6IIaSVSbJ+yvIzbXvwoe6p0im/o
	pNtblLcBQJtKVZCfLuD2acuFws7Wg5sXNM0AzacNZDOi12ZQ8U/q8gch2Xfp/nCM5hQaiEJnutW
	oG1j51+yFMHcrpPInU=
X-Received: by 2002:a05:620a:3711:b0:8cb:668f:b7a0 with SMTP id af79cd13be357-8cb668fb89bmr268485885a.82.1771288104126;
        Mon, 16 Feb 2026 16:28:24 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb2b1c7ef7sm1509044485a.28.2026.02.16.16.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 16:28:23 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v9 7/7] arm64: dts: qcom: sdm670-google-sargo: add imx355 front camera
Date: Mon, 16 Feb 2026 19:27:38 -0500
Message-ID: <20260217002738.133534-8-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260217002738.133534-1-mailingradian@gmail.com>
References: <20260217002738.133534-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52945-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,intel.com,linux.intel.com,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[collabora.com,ixit.cz,vger.kernel.org,gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,1a:email,linaro.org:email]
X-Rspamd-Queue-Id: 001C21484DF
X-Rspamd-Action: no action

The Sony IMX355 is the front camera on the Pixel 3a, mounted in portrait
mode. It is connected to CSIPHY1 and CCI I2C1, and uses MCLK2. Add
support for it.

Co-developed-by: Robert Mader <robert.mader@collabora.com>
Signed-off-by: Robert Mader <robert.mader@collabora.com>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 .../boot/dts/qcom/sdm670-google-sargo.dts     | 95 +++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
index ed55646ca419..e925cba0381f 100644
--- a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
+++ b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
@@ -172,6 +172,34 @@ vreg_s2b_1p05: vreg-s2b-regulator {
 		regulator-min-microvolt = <1050000>;
 		regulator-max-microvolt = <1050000>;
 	};
+
+	cam_front_ldo: cam-front-ldo-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "cam_front_ldo";
+		regulator-min-microvolt = <1352000>;
+		regulator-max-microvolt = <1352000>;
+		regulator-enable-ramp-delay = <135>;
+
+		gpios = <&pm660l_gpios 4 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&cam_front_ldo_pin>;
+		pinctrl-names = "default";
+	};
+
+	cam_vio_ldo: cam-vio-ldo-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "cam_vio_ldo";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-enable-ramp-delay = <233>;
+
+		gpios = <&pm660_gpios 13 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&cam_vio_pin>;
+		pinctrl-names = "default";
+	};
 };
 
 &apps_rsc {
@@ -392,6 +420,59 @@ vreg_bob: bob {
 	};
 };
 
+&camss {
+	vdda-phy-supply = <&vreg_l1a_1p225>;
+	vdda-pll-supply = <&vreg_s6a_0p87>;
+
+	status = "okay";
+};
+
+&camss_port1 {
+	camss_endpoint1: endpoint {
+		data-lanes = <0 1 2 3>;
+		remote-endpoint = <&cam_front_endpoint>;
+	};
+};
+
+&cci {
+	pinctrl-0 = <&cci1_default>;
+	pinctrl-1 = <&cci1_sleep>;
+	pinctrl-names = "default", "sleep";
+
+	status = "okay";
+};
+
+&cci_i2c1 {
+	camera@1a {
+		compatible = "sony,imx355";
+		reg = <0x1a>;
+
+		clocks = <&camcc CAM_CC_MCLK2_CLK>;
+
+		assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
+		assigned-clock-rates = <19200000>;
+
+		reset-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
+
+		avdd-supply = <&cam_front_ldo>;
+		dvdd-supply = <&cam_front_ldo>;
+		dovdd-supply = <&cam_vio_ldo>;
+
+		pinctrl-0 = <&cam_mclk2_default>;
+		pinctrl-names = "default";
+
+		rotation = <270>;
+		orientation = <0>;
+
+		port {
+			cam_front_endpoint: endpoint {
+				link-frequencies = /bits/ 64 <360000000>;
+				remote-endpoint = <&camss_endpoint1>;
+			};
+		};
+	};
+};
+
 &gcc {
 	protected-clocks = <GCC_QSPI_CORE_CLK>,
 			   <GCC_QSPI_CORE_CLK_SRC>,
@@ -490,6 +571,14 @@ &pm660_charger {
 	status = "okay";
 };
 
+&pm660_gpios {
+	cam_vio_pin: cam-vio-state {
+		pins = "gpio13";
+		function = "normal";
+		power-source = <0>;
+	};
+};
+
 &pm660_rradc {
 	status = "okay";
 };
@@ -508,6 +597,12 @@ led-0 {
 };
 
 &pm660l_gpios {
+	cam_front_ldo_pin: cam-front-state {
+		pins = "gpio4";
+		function = "normal";
+		power-source = <0>;
+	};
+
 	vol_up_pin: vol-up-state {
 		pins = "gpio7";
 		function = "normal";
-- 
2.53.0


