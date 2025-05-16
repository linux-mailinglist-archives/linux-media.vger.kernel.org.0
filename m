Return-Path: <linux-media+bounces-32652-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 39305ABA146
	for <lists+linux-media@lfdr.de>; Fri, 16 May 2025 18:56:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59A711BA8C3D
	for <lists+linux-media@lfdr.de>; Fri, 16 May 2025 16:56:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 688D5211A16;
	Fri, 16 May 2025 16:53:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BE020D4E9;
	Fri, 16 May 2025 16:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747414431; cv=none; b=pc/R+pBl0Yt6prm8AutVZQQvKGbJe9mgA6FvRYKGuFFNPaPvsECwqWeVORBLocJ77xpgmd8QYmO/qXeQ/UmbDGxVp30nVeY1j9VD3Ai24x4dvvxlzAQtrCJMQT+ZyuWWhqWignNVKZRnpvbW4ISVx0v+mzy6IS66D5m2fPBs42A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747414431; c=relaxed/simple;
	bh=qcLANFQYB6F1aTadtJclYNPeTflXqceuvsxjG9tl5Gg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J9sGmrIxaXtFe/uSKg+AjwQNjc45Ad+YT3eQn/AycI+Uiaqfw/0FH/VMjhWcF9iArlHI0UC81O2iPQ/rgDVgW8IHvo78AXb9cvS3W+zGOY5xPLD4NZ+Bn6XPT01fuX/U7/sL61EtNsGSn14HXOvgd8qjmgbNV7YIku3w22Ql6iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so17783365e9.1;
        Fri, 16 May 2025 09:53:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747414428; x=1748019228;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=anhtEfC+aYWJeJvUly60jdWH8rm+sVcW8pcF9vb2eMk=;
        b=KCt5o+7X+Hens7w2Ctq/xlpM5IvaUTYOCHqgMFkEhA3+bBZDDuPetdrqLhj1eRJ4QO
         0dSjxb1xN645F0Goo4pJ81zrSjxYKu6SwypDXdT3CBzUYmzDJ/TsGShI1nlXVm2JOFKy
         6jsdDprL+2pqCwvCwjQyMhVsbSHMc2Umxm1G/YnfUBmJzN5AJO9ebl5X9SJBRJ7zTR+H
         Pvm7IACd3TZY3RlJCDJIQxtSIhC6wm0c91jiTZI3mj9e1i3IFlgZ3Zdqh2Fni+hVsAP7
         Eyp5ClKGg+AubYWrGcQuCMqBStPk7PhfJirme91Rwc+TJ5WRgYCoexkXF9pg6pfMPBJU
         2qfw==
X-Forwarded-Encrypted: i=1; AJvYcCVcPoUOpgmy2cPa7W9zUpjQ2d5oldDVuS317eNP6gQHqUv6uEoEKOWVQ+C3sS+MnqI5Brm8+Di4uymA2R0=@vger.kernel.org, AJvYcCVg8hCcsb/zpyERzRZwVE+zifspg3MBvSo3nGzks1s8D7qCdexd6O7htRYGQdfpPn+UOiZJ/+KPhpE=@vger.kernel.org, AJvYcCXTPkjrtGjBn6Fj1OdwAA+M3zbzvQN/qks3hFAZOXrybSUx5I2cpG0Bc0e9sYEGosw4X58kmZWS3g4rCNSw@vger.kernel.org
X-Gm-Message-State: AOJu0YyaQcQS2Qq3b7CwrjuqJ7wKVy+mT5u1XgWJfcxHNLwUzo4q4v8c
	X4jDPN8z8vNLCKFj8bNaq8nxRne4n3xbCGwJSJ/7saep/Myym/fBchxY
X-Gm-Gg: ASbGnct12pEknxqQUGQCTKe/7tx8ZypUtJymM4Kb8/kN/iwcFDuhrHT2DKoDu88Gnwl
	3FWuDm7Ni1NMrLO8oVzpsK1OA8hF3h7JfWxPMbg0I6+WSLilhw2jm8Cd92nqlTEUYq/SmTBRRlf
	d8jaOmJCafKUvS2gGzeMu8AVY0xniNC6YaQG1tKThh0jjBzZIPtagE09F3jgIPNwssongco0Fgx
	Q+lnfvkymoCImgm6A8iASHJmOEvRi3hMha6b7aZEyDF2zb+kQOfTULfEouJpqHPPAavAFkhUF0s
	SMe+6I6AKiS5lmkalfp3hOoiUAFIdrhBu1v7HMacwmkd4vRMGCBI6D/PaKcuy1gunkIfaKWIsdu
	7dpwkwGqdIw==
X-Google-Smtp-Source: AGHT+IEYfDmifEa0iTxLazrxFoXXzBf3KmDVOnp4+FnO5DW5ap6WM75YN8wmhjMrbGLA/7/G7xIfqw==
X-Received: by 2002:a05:600c:5012:b0:440:69f5:f179 with SMTP id 5b1f17b1804b1-442f84d5511mr89042655e9.7.1747414428190;
        Fri, 16 May 2025 09:53:48 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f3380498sm116511755e9.11.2025.05.16.09.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 09:53:46 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 16 May 2025 18:53:24 +0200
Subject: [PATCH v3 10/10] arm64: dts: rockchip: enable NPU on ROCK 5B
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250516-6-10-rocket-v3-10-7051ac9225db@tomeuvizoso.net>
References: <20250516-6-10-rocket-v3-0-7051ac9225db@tomeuvizoso.net>
In-Reply-To: <20250516-6-10-rocket-v3-0-7051ac9225db@tomeuvizoso.net>
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


