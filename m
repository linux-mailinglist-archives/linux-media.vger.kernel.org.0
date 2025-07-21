Return-Path: <linux-media+bounces-38141-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC7DB0C00E
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 11:21:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E37AB189FB89
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 09:21:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B2F028C02F;
	Mon, 21 Jul 2025 09:18:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA09128C02D;
	Mon, 21 Jul 2025 09:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753089510; cv=none; b=PZ24XKUrEA1Qwk2qDla4avvCJY9JUYpNpM4lArdJBB4+tW0Hi68ZOS+lrg3epHjnjU7dl/dpevSWqf2k8K8Jf2XU9eE8sb/xCMXW+gmT0R/NUgUkUd1HASfFSuf7ZG+MA+Pwec1VFwlQxfWO4on2CT51R3aY1GimaGWpQIb1vqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753089510; c=relaxed/simple;
	bh=GFLEVoDpcqZUGLcskIFxQzytGcE90/7W/RhdRbv84B8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d+N4WghR+0X4jPggwk9vNhCKNVAu8EhtoCyYApWjIiOq5QHqtdEQiUtIDUpd43vMP2AhwPu6aUwglq8l9NXahxOcw0X9nYLfkdRaaGV4hhcO4VpXRrNmtM3CwVqdNxtOpTF2ISL6sKPwL4pnH6AxckX7FrKIi/6PLtH66t43Btk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-60702d77c60so8060423a12.3;
        Mon, 21 Jul 2025 02:18:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753089507; x=1753694307;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gyYROlBQpaQA9CwEtQJyumLb2Se+Dm1/eLYmwuEMq1o=;
        b=Jp20Vtw7zunYNtva0XFoQqSMSfThQ7hDfGZ4l8l8nPRFO2gRDrTX+XBhmy/xZGubyB
         s+sd0BBpFLeqqY4u0C724uyfO+OXyZFB8yV1avbSI7y6M1T1hgs5Cvb+1D1Hbm38+5Ig
         NCOAca8rNqU4sL1+RHv0DOENUzEDSlLrA+vdlS5F3FQ7xIpV7aYFVWhbcd5VF7m/y+y2
         iAkvKjdBjV/Zd+sFRwrqX1+RRcx/Nhftrc/hDQyiVz4QooviqfRN3x8qg7n2JZmXE158
         yN4EuvIJejmRCu2w1pdlFnXaXUE09cM2k7YL/J8KAl5hBj+qMe/Xn8kC0X1XU6URhq+u
         HtsA==
X-Forwarded-Encrypted: i=1; AJvYcCVYmp5uU8tl1O5vfLgPckjZep1e6Bkc/TzsXaZfQKUc6wgnOvvBfQ0pxzQfwI7I6y6GaUIjSH7n1gz3axGL@vger.kernel.org, AJvYcCW3Grieh6350wOhFPZPDZFeUPsDm7Uyf/LDVVXyT0D0Uk0oRb/jioV5PfrEr8jFg60uhxLOYQ1Pnaw=@vger.kernel.org, AJvYcCXzsjAZUQPOwr2JC54jwO8Y2hmcxU+q60Zmgz9iczcDavBh7N8tLBDlEN5Rmqh8l9yyMAykZ+4bE6fokG4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+PW7f1M49SXgDeyOxO/o6/LC7fYxYFJy6tgHmn+hOccfFTYm3
	MdjN9nBJ6dQJhV8JACekGk0TcS3Gb3r34lcPmAp26D+WKfKV2RDQGw0R
X-Gm-Gg: ASbGncv9yb3yLghgO9Q9VIDyxxbi4VCrRHtb7aqr5PgVrNoc82f7edfPOpUeYfpEz3x
	lm5dry+TGYyjPxqRm4N4WPPplMLTiC27pea3D0XTZBpJohA4ePiolGvE6ThF/iR5aXsgJrwh8Zx
	6bkLbiacbcCJT9IK2E/csASNtLuMG/g9S55brio4yUpN49D34zZCZ2mFqksWQvHOTO2MCal/Yoa
	XRgLUvr7HBitKpho+Ydwkz8pq8wmhkkZ1BW0b4UVrId5iZqki2f4IN/ToOSod/Rc0gWTdi5UY/0
	gXxDE97LgUXF2g1SMDDocfA0rYqYsJgEg4jqv/hgAzN0eyd/70Pb2FNkEXsLorw3AOelIVbycwf
	cRbjQ8e91oqk8NB8WlfSSyaJ+LNk59MpkMqSgPWEgytgSMptfUoFerBxT
X-Google-Smtp-Source: AGHT+IGLjyUKAxgg6t7I154f+BsmQXn5G2xI2hCpG0zZ9fD3Tr+3hSJlZ3Fv9sf5iHBEa2ta4Q/EoQ==
X-Received: by 2002:a17:907:1b93:b0:ae3:6d27:5246 with SMTP id a640c23a62f3a-ae9c9b72f65mr1263912966b.48.1753089506882;
        Mon, 21 Jul 2025 02:18:26 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6ca2efc1sm643125266b.83.2025.07.21.02.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 02:18:26 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Mon, 21 Jul 2025 11:17:37 +0200
Subject: [PATCH v9 10/10] arm64: dts: rockchip: enable NPU on ROCK 5B
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-6-10-rocket-v9-10-77ebd484941e@tomeuvizoso.net>
References: <20250721-6-10-rocket-v9-0-77ebd484941e@tomeuvizoso.net>
In-Reply-To: <20250721-6-10-rocket-v9-0-77ebd484941e@tomeuvizoso.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Kever Yang <kever.yang@rock-chips.com>, Robin Murphy <robin.murphy@arm.com>, 
 Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailer: b4 0.14.2

From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

The NPU on the ROCK5B uses the same regulator for both the sram-supply
and the npu's supply. Add this regulator, and enable all the NPU bits.
Also add the regulator as a domain-supply to the pd_npu power domain.

v8:
- Remove notion of top core (Robin Murphy)

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Tested-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi | 57 ++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi
index 6052787d2560978d2bae6cfbeea5fc1d419d583a..a1f3571b177fe00b1c169f62b7dd1d27024a663f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi
@@ -309,6 +309,29 @@ regulator-state-mem {
 	};
 };
 
+&i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c1m2_xfer>;
+	status = "okay";
+
+	vdd_npu_s0: regulator@42 {
+		compatible = "rockchip,rk8602";
+		reg = <0x42>;
+		fcs,suspend-voltage-selector = <1>;
+		regulator-name = "vdd_npu_s0";
+		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
+		regulator-min-microvolt = <550000>;
+		regulator-max-microvolt = <950000>;
+		regulator-ramp-delay = <2300>;
+		vin-supply = <&vcc5v0_sys>;
+
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		 };
+	};
+};
+
 &i2c6 {
 	status = "okay";
 
@@ -433,6 +456,10 @@ &pd_gpu {
 	domain-supply = <&vdd_gpu_s0>;
 };
 
+&pd_npu {
+	domain-supply = <&vdd_npu_s0>;
+};
+
 &pinctrl {
 	hdmirx {
 		hdmirx_hpd: hdmirx-5v-detection {
@@ -487,6 +514,36 @@ &pwm1 {
 	status = "okay";
 };
 
+&rknn_core_0 {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_s0>;
+	status = "okay";
+};
+
+&rknn_core_1 {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_s0>;
+	status = "okay";
+};
+
+&rknn_core_2 {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_s0>;
+	status = "okay";
+};
+
+&rknn_mmu_0 {
+	status = "okay";
+};
+
+&rknn_mmu_1 {
+	status = "okay";
+};
+
+&rknn_mmu_2 {
+	status = "okay";
+};
+
 &saradc {
 	vref-supply = <&avcc_1v8_s0>;
 	status = "okay";

-- 
2.50.0


