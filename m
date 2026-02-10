Return-Path: <linux-media+bounces-52481-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEqlGryRimkQMAAAu9opvQ
	(envelope-from <linux-media+bounces-52481-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 03:02:36 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C18A3116224
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 03:02:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E7F0303CE87
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 02:01:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 457152AEE4;
	Tue, 10 Feb 2026 02:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QZUvqjpe"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD3C29BDAA
	for <linux-media@vger.kernel.org>; Tue, 10 Feb 2026 02:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770688907; cv=none; b=TaHUSK4OZWe7hV/QW1z29tYd0r7q0zbd2JRZbBJClA3ikhMxqto/hwBIt1ePAgA0rMvSo5m3KYN5TZp+cE8qXyV/4RvRf5A3f1h3kFGISSXsB+alElMLk1YSu+RMixUrNq8Z5/3u5RFwTStQEWzjAC2xqetztCscZrEecViky2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770688907; c=relaxed/simple;
	bh=EcTRKDBc1veGtECuqy6AI3PYeK9xENvrGwMb1X7Kpbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=su7sr0gtq41l+pn3A851LG5ytwYe1dPiM+vNw8fTTb2KVquymevDZDSoycHhwu4B81i3FwrYzyrm/CZ8c08yZaqrF3z0mGP8OFNLGYlPgKT7GwtJMjU9civxEFITgwlKdZPOsb9YK8zARz3a5zer3eNfRucRc+wt4Hof71NSnDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QZUvqjpe; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8c6a7638f42so500737085a.2
        for <linux-media@vger.kernel.org>; Mon, 09 Feb 2026 18:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770688905; x=1771293705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JLRIaf1mXyXFgjmYj7clQ+v1OirQdgTMmdH6PpF9IHw=;
        b=QZUvqjpeehV4ddCj/pxgpgRBRhZC3c3I3dI63WHRjD8a7YcM+d9Mqemun3Wugl9QoS
         Qalaau7/9qLxfkbXGLD4VdLEwryBWvM29DWcvong9U+fphJPltZrMo64KxR/dhImcIRE
         IGbjZ8Ul05SvlV3IVohmbZaeFBQxFEtmjkSK4yGQTr6uhApQ3DAiod3xRWroYaD9C4Ub
         UZ5BeNtpA+CaT6xmF0WWcRT3K6GBzmGQrGBRhlKh+COcnKn61sn9+Trng+Qdho0+0mrc
         j6bVM+zvIy0QtcIW4Q7KdnTdozsZe0I4d/Huq/WOl8iK/zom4AtatvUqMpV9x9TbVLy0
         SIZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770688905; x=1771293705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JLRIaf1mXyXFgjmYj7clQ+v1OirQdgTMmdH6PpF9IHw=;
        b=CR2kuKA9Ge65Nk/Sb06MvGKVzSiNgSKvUZiKqBBeGWqwhGy13FTtFs2JTWuDlJ1rV5
         DQnfU0fXXL6QNCmlH/uviNldM9ls5Fpk0OtWPpPajvgTGNVgjLSa73QCvGUTthzFp4CL
         m2DqeSYOOGrsbNh9f5MR5BfjasopPutpPkC6F7x0IkQFHk0YQg7KdJqlsh0W6tY931UE
         lPs/T7Twe0xjlt/GOfz70vu7MlnD31sUnnIX4BAPmbzQKQmNNvSW0tHp6J16vuuhO7aA
         yO7cLt64RE4y9fDJbKMo6W/f36LiYaBg0SUSbjgYTi4Cl8IG2TInL0Ri9jepCrQwaUGI
         6I5A==
X-Forwarded-Encrypted: i=1; AJvYcCWZyB7z6INGCTQGhhpmT5DImbE0S29nuOhfPHTl5wxxHdmffNtigkqixMCesPNTMJClUZCo+8tgOtiELw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/HZ/jfJ5VnAMnbcMyRx0WBuWSxIWQms9IoxnV1kyNhAcZ26FL
	fNlzYh+huRyjpa6mIYRmniBqVECxhPkim+1xY+agIYRonO1RE47+Xycs
X-Gm-Gg: AZuq6aI+Vxs+SOIK7ooePy4qcw4tFBud6g8OiYch0rI2rqlAqcDbe7UP+InTGbZthIq
	tDWx1BOx1g23HLOshFSK8JQDQ4dqGOe0Tyw1AJLsOb9KeV0S1asIW7VgOuTOPg/PjB7PjlUJx0y
	5CWNxR86Ro8ExzNna3M641uInzNFS2tKBvScQZCAf5/4bYOnxgLyG9KILCAGg+s2kFyWisB7E4M
	MYrRyRjoZrCN2eiIuCgfcCfYtQaODBkwMCjE4hmoqHMEyOJKlylTjMYqET0VsRzvsdPiOAjxSjU
	IufxtEb1arfF3xKgvDheeMrJCeP06bS8NvViG43cDS762kqnwi15tKozMZTakEJk1WpgaDkzfjv
	jS2hiIdOk4OJIO5DWKbuMQE4/cxcPOm7mSR0Re6FHlH4dcxmiERpKq+YUiJuMA95U4SHnGJBm8J
	Ch8WH9WVT8ULcN7JO4a+IEv1iUFcG+FxZkMBanU8TNbY/ftNx3bMbRzyJTA0sjRDL9LWmKy7Yee
	Z8isvQq3fmFgcE=
X-Received: by 2002:a05:620a:4093:b0:8c5:32b7:210e with SMTP id af79cd13be357-8caf1bc6675mr1878858085a.82.1770688905495;
        Mon, 09 Feb 2026 18:01:45 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf9fdf745sm922591585a.40.2026.02.09.18.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 18:01:45 -0800 (PST)
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
Subject: [PATCH v8 7/7] arm64: dts: qcom: sdm670-google-sargo: add imx355 front camera
Date: Mon,  9 Feb 2026 21:02:06 -0500
Message-ID: <20260210020207.10246-8-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210020207.10246-1-mailingradian@gmail.com>
References: <20260210020207.10246-1-mailingradian@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-52481-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,1a:email]
X-Rspamd-Queue-Id: C18A3116224
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


