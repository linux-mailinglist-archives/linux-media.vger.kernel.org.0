Return-Path: <linux-media+bounces-60108-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFP0G/2a82kQ5QEAu9opvQ
	(envelope-from <linux-media+bounces-60108-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 20:10:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E16BC4A6BA4
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 20:10:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 470DA30021EC
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 18:09:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DE1C47A0CD;
	Thu, 30 Apr 2026 18:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rfR0LU44"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7BE47AF60
	for <linux-media@vger.kernel.org>; Thu, 30 Apr 2026 18:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777572571; cv=none; b=NQq0cNxLJjdEcwCtB4q6XDsNaY2DU4iA91Wsh1Yk027k5E7q5Yjq+tu9RuzBtnMamfh6QSNR+Pak0WvXM5Su9nEv0FArHKMtyQjt217T4eFqQNjVwLKlLQ+shEAh30q9dWA8ctt7PE90y5OglQnUjl1rvTB2o3z7Snb81d9Ep+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777572571; c=relaxed/simple;
	bh=FYibyuikWa/vTjlZUt6NgzX7WyCdTHvsUo8Q0qEQy9U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W/5pd7J+b1e6ZNtQkekQ31bTCnYfwJHkUH3BAutYHYcXIYDnI6+plVeDGV+wDZoiALxR2cCymQc28iZFkDlc9SBdBOm5ojKP/fFQxdqgJlTVG3T5HOXt9w0uMLfoCFLzROqory+5AZCkBUEqJ2WJ50vfsBDwNvU+NL65P6JLbWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rfR0LU44; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8d4f78fc9f6so119486585a.3
        for <linux-media@vger.kernel.org>; Thu, 30 Apr 2026 11:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777572569; x=1778177369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0AAYRTsNhA2BPULeWDDXA/e2F5vjfAMpdwjSZENwWFU=;
        b=rfR0LU44KcrZ5nPmyQ72Grg52LufMGrgn664EMFo7/rk6ukHBofLmg47G9tQKk83GX
         2YRIj0VWRwOCWQXGeXeiZccvTKfC0TtppvihDMCKDV+a32L+Uk7n3IDHg45BfvSennKV
         U3uwdeqydUYGWQHPdChEq6PbxWSMtBghbMwe3bNQcmsZS95GV1P+xy/E8iOPk6OFYFbv
         2kaUK5Z74ngLafR+jnwy3T+xT8MVhfYBjSukNiP0Pr9/4M3LbpKW0mdBnuhHwwfLAYtG
         v3i1g5jhfz42ax1rCvIAdTpW+Ssp6DPjUpecyhHd8C+5s2hTBzkRcX9cfNfpNl9D+5MW
         0wag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777572569; x=1778177369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0AAYRTsNhA2BPULeWDDXA/e2F5vjfAMpdwjSZENwWFU=;
        b=VKRu6SIZ0CCtvWZ+F8Cor83g6sFZdbIm0KXsOt/xJ/SeBLhLcpBQ44WXYbHU5VJHyC
         u4sX08V0GdleNbHk4+/tLA6O5q0lvGzl1Qc5CPL3+e2NSadhZqp3UAxfAYvvce/NQlXO
         HhakDAX/NqpCooo8R+Ie3uZ8VlZPw/l0+jZ7gvbI62JhKGLrYd2mRBPC72Pv3NkgdwqM
         I2UGk6ZkLxlSPHVxQPcMkexiCgjpfvHaC58grJhxRrz+tZ7E+duIX2DNa+GAi2TW2iIZ
         mCVrA3ItVjKPPt9oYh5gl5fQx2p8w+kKB/vJihZuqiWyst3CxsM1awFU0w5CFpcUGAGE
         SZjA==
X-Forwarded-Encrypted: i=1; AFNElJ+EyCU5eY6lcEO3C0bIwwasiQZQDgQMnkfLdeMBbm3tF7Xe8Dc+HK1rYOSb669g1+o82WFlEkPItdLFZw==@vger.kernel.org
X-Gm-Message-State: AOJu0YygsEYkcu+nb42DXTb44poJcrpNEvvFtyttkDy4+PUcgElmPHla
	hzDBB8oW5wxwnJkTozpKyjEPL7bHM4pGsNVDP2/Mxzedne90KrMsI4L3
X-Gm-Gg: AeBDiev31uvmHVztISEoxc4eKJHLCAMdATAUHNT2cypcTyY/amGeCDDCef1BiBVVi3O
	lK295znvevmqADiy6E45htQZ4ghfd8X5rXmwl2ebxuW+IJB2L15t0ATlFnS4b94RA7esVBReYfZ
	lVD/cRImetJ1L4WXX0/I0VcZxGlziha9rmo+qF3TmG4uhmgH+pFde8fzKx4WbKl4iUBY/B5pEYC
	ffwanf+u83/iLCIi3QH92WciXr4kleINf1LqTG+3Qx20XIEhiL+AF62zyKPu+cOPUG6ahOYx/Qz
	tBnHuGiveGCxGTxbqyLUNNV3HAz7WF1mbnzGGpSTNFKH7fhzW8NXodIzrJeQwtzbEzlyDi4V6g6
	neVaI04LB5USEGNVHnv6ZFz3B6DGZOJvXEZj4Fwh5z89inO3va7J9vPjeDfF38TPC/vYNXcUypj
	0uKYfruNFe1IhTUdzlSdpPMqJrTR+imMhVvNUBrjr1Qnr03/muh/b7tYDyJEC+cfJdXrT5pAs12
	vMoA79HnjWZ3OaR/u5hl84wGA==
X-Received: by 2002:a05:620a:bc7:b0:8dc:5094:ea79 with SMTP id af79cd13be357-8fa88847307mr627536485a.39.1777572569110;
        Thu, 30 Apr 2026 11:09:29 -0700 (PDT)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fbb3d3445asm31956585a.32.2026.04.30.11.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 11:09:28 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	"Bryan O'Donoghue" <bod@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	Robert Mader <robert.mader@collabora.com>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v13 3/3] arm64: dts: qcom: sdm670-google-sargo: add imx355 front camera
Date: Thu, 30 Apr 2026 14:10:01 -0400
Message-ID: <20260430181001.9256-4-mailingradian@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260430181001.9256-1-mailingradian@gmail.com>
References: <20260430181001.9256-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E16BC4A6BA4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,intel.com,linux.intel.com,vger.kernel.org,collabora.com,ixit.cz];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-60108-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-0.995];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,collabora.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,1a:email,linaro.org:email]

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
 .../boot/dts/qcom/sdm670-google-sargo.dts     | 100 ++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
index ed55646ca419..eba2f3792dd0 100644
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
@@ -392,6 +420,64 @@ vreg_bob: bob {
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
+		/*
+		 * The sensor can accept a 24 MHz clock, but 19.2 MHz has
+		 * better driver compatibility.
+		 */
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
@@ -490,6 +576,14 @@ &pm660_charger {
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
@@ -508,6 +602,12 @@ led-0 {
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
2.54.0


