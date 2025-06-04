Return-Path: <linux-media+bounces-34048-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D00F0ACD916
	for <lists+linux-media@lfdr.de>; Wed,  4 Jun 2025 10:00:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4CCC91647D1
	for <lists+linux-media@lfdr.de>; Wed,  4 Jun 2025 08:00:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 864E9248867;
	Wed,  4 Jun 2025 07:57:47 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B0D243964;
	Wed,  4 Jun 2025 07:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749023867; cv=none; b=K+Az0TaoHgZanh5DQ6WDpQVSb8o/GFZb977gZA4EHoGodlxuc+XhU9DY6+uWn2C26+gfIlvBRjFem8xL8x8gMptCbUWT+dfbRBVrockGNXedxeg5b69FLEZQSsopp6euadf0XegdTKORvquqj0VO8BQr7+4u8LAblOxPYh9HDsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749023867; c=relaxed/simple;
	bh=qcLANFQYB6F1aTadtJclYNPeTflXqceuvsxjG9tl5Gg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AAIECdMnYEy5ItcBD0FXJCSmER9oAoV9AUHOiJrJg7nTmt6uDFNjCNlOfWIZgzENan1dCmK0lqj33zb/DYh2TrgtqP557xhdZ/beOg8H9Sv0rOuzn3SIBdQcQoshnTzQGuys3K6bsJZsHLPj7DQ+9+fwFsl1dLz5HI2TyMt6w88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-601dfef6a8dso10688386a12.1;
        Wed, 04 Jun 2025 00:57:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749023861; x=1749628661;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=anhtEfC+aYWJeJvUly60jdWH8rm+sVcW8pcF9vb2eMk=;
        b=uVGDivixNMM9WdWC94sZC753qV1dEwiig+ztSMA+i8mTeEab6eAX7RLcmVTEdncx4A
         qJfd2qKrwYkQjZ346QNaIsjrNflYugAVatOOXNuOKcV3z/TCG/ZmlfL6f74tu+li7ZwV
         ZkpTMDu7jDKEeuAXvV6x+eH7GlhlZf8VHIN0ot0iZGVGkuCo2QkqlAS+wz/eOw4kt5NP
         /g5dRRr8UxZmrZov0B/PpuRvo6D/Lsdi+EuEArvYfU+zDV4WzfAGsqsB05+iwYOt5dR2
         MmSRcseO2+Mgw30afWCXAEMDC16KVPK+HPpnHn/Kj5lJ07oTGOc10Qw7NYusMjHg4X6F
         9SQg==
X-Forwarded-Encrypted: i=1; AJvYcCVeTfTuQ55CEU0pny6VYu+hEqSu1/RhEHYh7RdmTBPx7ok05wWBoNs9I7TSJdv9Rbhsqhkxs++aiunaDWph@vger.kernel.org, AJvYcCX34CFyD0AIH8VdQUJK7KGxbIFbNSeggqIfWpl1VtCru+5TwprudgjPx8chsKvAYvBfZhwJ25G8hsS9EWU=@vger.kernel.org, AJvYcCX5uG7e93to0Pj7GGj7QFLLz8p6mfDEaI5XFYyeqyXL3EkgJHcPfShnhzXK7/fcNp2WwleKxbji8Yc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqNeBwgvlU9mbdkZtTHeZN2dSrrjrv0fGXcDZSUUArNmVVyAZZ
	I3IGsLtJgqcqVd5nusuq3FEOWAM7rS4mLB6AJiYWjXr3pNXjqdX1digL
X-Gm-Gg: ASbGncuwQMTVQExhWhVEadmrcMRxeehNzxpUK7HkY14xKMkmVmyiMS77OrH8wUxrtq5
	anr/bHj3kuvxvj+Cs5nwtgAbYerXGREZ/zVfnXk/b5ydnNjj1hXM4hqT2ILIaoZMStAtPK67ogp
	4NEqILX/bQmC5gbmRS/yMW4i0kNNYmyX+x1OUk1oNmnKeQi0NEW6KTwNYTVU0Dfvm35bRf4dq+s
	b6CpBR4JRDgna+QOR0rm39zubQe3Ee/B9w5CudHE/RGj8NU+RxKjwMJKJUvDCzdJZ71SlovmAlo
	NKtSUgQElg932qmoXgdwp37FNlZytQ4XiukuLwHmVAqNd0Yd7Q1XYCe0qRjPtVNqpmNhIb7Z4X+
	qcQJY3tJh+Q==
X-Google-Smtp-Source: AGHT+IEdWWoFUq/i9FS76C9R6P00UBxKykLRi5OkyXWDWifwVDn9o0aBT66QEk8p9MYrjo3JtwHUSA==
X-Received: by 2002:a05:6402:234e:b0:602:c6a3:3f6 with SMTP id 4fb4d7f45d1cf-606e966e9b0mr2028441a12.13.1749023860547;
        Wed, 04 Jun 2025 00:57:40 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-606fb36a160sm348569a12.45.2025.06.04.00.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 00:57:40 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 04 Jun 2025 09:57:23 +0200
Subject: [PATCH v6 10/10] arm64: dts: rockchip: enable NPU on ROCK 5B
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250604-6-10-rocket-v6-10-237ac75ddb5e@tomeuvizoso.net>
References: <20250604-6-10-rocket-v6-0-237ac75ddb5e@tomeuvizoso.net>
In-Reply-To: <20250604-6-10-rocket-v6-0-237ac75ddb5e@tomeuvizoso.net>
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
 Kever Yang <kever.yang@rock-chips.com>, 
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

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts | 56 +++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
index d22068475c5dc6cb885f878f3f527a66edf1ba70..49500f7cbcb14af4919a6c1997e9e53a01d84973 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
@@ -316,6 +316,28 @@ regulator-state-mem {
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
+		regulator-min-microvolt = <550000>;
+		regulator-max-microvolt = <950000>;
+		regulator-ramp-delay = <2300>;
+		vin-supply = <&vcc5v0_sys>;
+
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+};
+
 &i2c6 {
 	status = "okay";
 
@@ -440,6 +462,10 @@ &pd_gpu {
 	domain-supply = <&vdd_gpu_s0>;
 };
 
+&pd_npu {
+	domain-supply = <&vdd_npu_s0>;
+};
+
 &pinctrl {
 	hdmirx {
 		hdmirx_hpd: hdmirx-5v-detection {
@@ -500,6 +526,36 @@ &pwm1 {
 	status = "okay";
 };
 
+&rknn_core_top {
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
2.49.0


