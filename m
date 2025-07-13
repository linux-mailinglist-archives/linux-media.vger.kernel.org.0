Return-Path: <linux-media+bounces-37567-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80576B03032
	for <lists+linux-media@lfdr.de>; Sun, 13 Jul 2025 10:42:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75CD33B009F
	for <lists+linux-media@lfdr.de>; Sun, 13 Jul 2025 08:41:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4948F22F389;
	Sun, 13 Jul 2025 08:39:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBA3226D00;
	Sun, 13 Jul 2025 08:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752395966; cv=none; b=ewQsJcd81JOoBKP7W43sIaNp2ctpqdBRT2/Ss5ySG19XtAsE0InAhFsDS+fYvNmqQ5LOJ7B9bbBe2E9s9BbMY3IIWbH4QtWW1A7BCDnp7uBQluhfKrWB78mpsiLuWY+2D78oHK3hpFL7ElwxyZiAOQQsIzPlOoGVRhI09THr3Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752395966; c=relaxed/simple;
	bh=IDU5g2bdtAMUN0f0RXOKiJM3pIAbXry4sN/fjHfr62o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tnLx+ERARd92e3WFa0jtge34dVC+WmkRYORHRt/PEe2uc5ILDCRGXS/lpxk/EFfPAnmZjzYmTdZ5hdeQymk7kScfbegsdN3D2PXT254dJrjBQ8PnAv3MAV4FMaOpTpFlxiDoh/QpduUM2LK5jkkDsZmcK8FX8JONU64PDw74onU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ae360b6249fso582962066b.1;
        Sun, 13 Jul 2025 01:39:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752395963; x=1753000763;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FeyMo4Jt7UfkzhL/r2KfmA979+uFc7fR7QoglkpcpSU=;
        b=csBTriSSSvQmOrCnny/Lph4pxRSSYsWY+Gnh/DxYxwIE+YkFMs5+aGclF/jB22KM9b
         RRLzByGy5pz7n62AgFo+wtxSwktrO75cbTJyw902mtwKQnX/WTx3IpeoxOzwMymnAOHD
         N/rLlmXUjzD4uK8IgTl5idcMoJkuVB0XMJoye1duDbDdN0aMgVlPXPMAKQqOpouOs1MB
         KKA45WCuSPsUedAF7Ciht+Hp5uMLNb871jnpWxbSW05Ovi/LxNNU0ahDagYGXkS0ttB5
         YuaNSv7+kD+MvQLx7qfHpEQ1PmCJp+8TeTjulxd+URWT4HEZ1XySx/Dvyyamxixw/U8T
         n4UA==
X-Forwarded-Encrypted: i=1; AJvYcCVaBSs95ck7Jl00cT50eB+NfIjJS29n+v8ZyRZDbq1kPMhUUIQgn248nBEQqQfBILocOITwbzJemTrR5RI=@vger.kernel.org, AJvYcCWeQxn+pNcu+MBqHlq4qVBxkhAjckBh9nHFmQ+JJP+a8M4nosDjWYcbSuglYc1/CvuM3qeDQRGqhxBruIKv@vger.kernel.org, AJvYcCXrw8EARcn6g/BaiiIfnS2UoJFlHSJ8oeLc96W0bEvz8C4glEmrAxWOLyzpZzUH2Nmfpw44Dp2eL8o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9jtuw4U+8/yXwV7IG3q1Cn0k1bufQFEffntv+0F4AvaxrZTAE
	7OgXOaPiyQMpz+IuyTHYN5hMvtLNFzvD54uBn/fNma16Frqr8Ivq4YNXgXNy3g4o
X-Gm-Gg: ASbGnct/CJQ7NJlvQpUyGqseCydVCE/LOdo2qfSv/lZme/GGMwlyk6J5H/sqWieXjx3
	Bt5u4i5bVmH3V0sdLZawtZ13uJT53TCcQJr1QBogneIF7Z6gC9JegNJ8m8Pkv/UympjWwEMCXNq
	i0avKTwcw8BTWTN/fd1WfcS+5eiE/rj5qyOK1KlLt2Tdrruq7xZP6RsQ4DRT9Wi2VNSn5x60Ap9
	iXbVU9aPat4BW0b4pev58unjvqQNkaKQFOpl3mNfL1Vzk9mHOyOFlqSVZ+bqDV3Rp7x34VOHmJX
	iw7U80RNr5M2q1h7UxlXsQR0rWD7AWd24PpjWgzGSQcK21s/bs07enHVljeS1xtJD1DzQGTFgRC
	n504AOq83Fn0hahOivBwSwr1dmsF+PXdXzUh/qOigZHvKchWasx7ywCCV
X-Google-Smtp-Source: AGHT+IHxIHGjEkE5SiJCVQleLSfE7Ew8CiAdy3INMXoGnJecgmb8mpelQgFGDmsS+2hlzLznSM+Hlw==
X-Received: by 2002:a17:907:803:b0:add:ede0:b9c4 with SMTP id a640c23a62f3a-ae6fc0c3696mr934268766b.42.1752395963198;
        Sun, 13 Jul 2025 01:39:23 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e90a42sm610876266b.27.2025.07.13.01.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 01:39:22 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Sun, 13 Jul 2025 10:39:00 +0200
Subject: [PATCH v8 10/10] arm64: dts: rockchip: enable NPU on ROCK 5B
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250713-6-10-rocket-v8-10-64fa3115e910@tomeuvizoso.net>
References: <20250713-6-10-rocket-v8-0-64fa3115e910@tomeuvizoso.net>
In-Reply-To: <20250713-6-10-rocket-v8-0-64fa3115e910@tomeuvizoso.net>
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
index 6052787d2560978d2bae6cfbeea5fc1d419d583a..06f73f16901026485c02cecf9176d0d7dc7a021a 100644
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
+&rknn_mmu_top {
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


