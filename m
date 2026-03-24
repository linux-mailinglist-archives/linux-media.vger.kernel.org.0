Return-Path: <linux-media+bounces-56791-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NKGJknywWkgYAQAu9opvQ
	(envelope-from <linux-media+bounces-56791-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 03:09:13 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA93300F72
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 03:09:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2BBC831091D4
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 02:02:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED80F37CD4F;
	Tue, 24 Mar 2026 02:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sgHLGHwP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383A734DB6B
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 02:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774317735; cv=none; b=TYV2aL2drJCEQ6ejAd7lDXUSLCruwkWzQ9GJp9h03mL6LnM5PFL/5eaiSoLkXXSRNpPp2QSB9nJDlgn15lkzMXxoz68gwdDiWYt/RxiWgl8a8TLV7VkMLPu73C/IchrK0urF09Ifkq09yPygpcZ4STNlEsbO6yVOkUlJXP1sjdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774317735; c=relaxed/simple;
	bh=HFdRTqvrye5U8yos/wdW5qeoGTAkRp5Eezn/1E7LhWE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cC2GHmxFFT+z309mLT89kCW0LJH/Jq5E0GZNjXdQ5mqo2dY5UoR24wJ+EVZ28lgK2Y1PxVG94d8IGy3+RMWPVUPwHiL4YfT+Fl9yhZGop1hgr4L5dBtLNUIwiedGYgU2yP0wESP1FMIM1czimxWyHcWbqIf5X0d/xO+7Z2cbIIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sgHLGHwP; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8ca01dc7d40so75890685a.1
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 19:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774317733; x=1774922533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VtPTZPYooQW6GNCdrN+Ye4L+nIxiTmejXf1QJjJdEjQ=;
        b=sgHLGHwPCu1dAt1McFEBYvZB2iHj+Mi0SxVA+C6T4otBh13OeUgozlNedtRYfdI1HG
         ZVspuFHZo8WL0epAE1HtjMDpJ1Tef5OvAYvC5FLnOrIpx3r3iiXvWHJg1hLltY+iv8/y
         4WVvLCnEn8Pypsq4IbXi83i1nKt7T5s6s8gYm6QfBALAP65UcBhL5vHh7znmqKZycwM0
         UMor702wY2RUb/VE4IXhpobhre6+OOlcOBY/ovnTO7bHx43cYteQTL0WsX49pLEuN7H3
         sfHSTY99Vef7x+i+UCrYrHXEoUh2JwpMuxDBDNuP2wHzf4Sw2SNJFF3+Aq48rhcQHCvw
         tbaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774317733; x=1774922533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VtPTZPYooQW6GNCdrN+Ye4L+nIxiTmejXf1QJjJdEjQ=;
        b=GYKGl14hBiuFxIV5MsCXyVbqmSKfZqTnOX4klnTPxuVN5YN/ahBZ7wU1IKkqrP7TAh
         +1nCWYrMlODIvhLD8AD5NS/AlaIh7HUkIGVTICqlUFWaatj3GWpZwd+DJ0rzcyKxKj7L
         JzR5hh6M8EJK0NbwVOGkZnZo5dU2oxH6wuTVuzF0eVDLZ0kw5QAWHgOTMInUhIZ5Oen2
         RMu/zfK0DP+UntaCkYd5ccySAO+jFszHyZQyecwti74GLch17OtP8KrtIKElFHnAAd0Q
         XQIVNMO3GZbdLNz/wbUxSzmkxbdC7Je7MlWyahu87tQaAAVzzdNIwXl+gT93PIJoF4Px
         Y3YQ==
X-Forwarded-Encrypted: i=1; AJvYcCX53tGAb/I5hghKStP3JS/6MSfu5gNgAUCtNCAubpOpwUekvpS1iGId/+IjbumHOboznBI2sIuUsL1Ziw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9Zoyfj7Qx7iC++bL1n16Ujb9cWdYfW7kLA0Y25+iH+FshrEOf
	Zkk+Q80RFb9QtgQyrOFFrJ2/JyxLndPeP2A+cOBtFn7FgbldSn0AiZEh
X-Gm-Gg: ATEYQzzjdK9+zwYjTQ9PWk8DYLoFqWo/+wsvDrsHwTjofPjJSyG0UQ3Ek+d7Hp89GQM
	SAQ6UgDTpg7GGZuHIwKdOmvH1ao2nlZLtnhZONoHXEPMDRE/zoANVwwt/Cru5Q56I/+gChiY8DW
	frCiHg+q7duDfxyFR4SkW7ZTj68zBeIEcS1udalK+4LS8tjibfTQOkmIICMuQx94BsnNWMvWD7v
	5nmMrKb1pRIOnL0Gvx71YL4pB2+HhDaoZS7OtWC0Ae2GBFogGNx7hQwqs6iM4tXWGq7HoYG0917
	Yixj54kNSTAse8gOOwbeVc1MgIEZWTt2Mijm1OCYuzT8qUyIdgcbjl8JcmH2NucM8GfPq5d1Wka
	kMiTFYxMCRRz6fmsRc3/exKHoUI2KUQQAYItGbzi8+V1LDcuL9dkHLJ9vnOq8c5fjztv3G+Aupb
	nx24KuxXQh0Fu5rY6576srtC6L+g==
X-Received: by 2002:a05:620a:1723:b0:8cf:da2d:d6d0 with SMTP id af79cd13be357-8cfda2dde34mr1302317385a.47.1774317733093;
        Mon, 23 Mar 2026 19:02:13 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c85256c47sm102598506d6.19.2026.03.23.19.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 19:02:12 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Bryan O'Donoghue" <bod@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
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
Subject: [PATCH v11 7/7] arm64: dts: qcom: sdm670-google-sargo: add imx355 front camera
Date: Mon, 23 Mar 2026 22:01:32 -0400
Message-ID: <20260324020132.8683-8-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324020132.8683-1-mailingradian@gmail.com>
References: <20260324020132.8683-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56791-lists,linux-media=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,intel.com,linux.intel.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[collabora.com,ixit.cz,vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[1a:email,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:email,linaro.org:email]
X-Rspamd-Queue-Id: EFA93300F72
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
 .../boot/dts/qcom/sdm670-google-sargo.dts     | 97 +++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
index ed55646ca419..8a2ad7f66b41 100644
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
@@ -392,6 +420,61 @@ vreg_bob: bob {
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
+		/* Set 19.2 MHz for compatibility with Linux driver */
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
+				data-lanes = <1 2 3 4>;
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
@@ -490,6 +573,14 @@ &pm660_charger {
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
@@ -508,6 +599,12 @@ led-0 {
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


