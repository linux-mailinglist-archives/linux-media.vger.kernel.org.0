Return-Path: <linux-media+bounces-32911-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A82ABD4EF
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 12:31:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DDB634C1652
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 10:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4C6F26B2BB;
	Tue, 20 May 2025 10:27:47 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55552701CB;
	Tue, 20 May 2025 10:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747736867; cv=none; b=GFt//Er8sywtLbB+vxEmd5Wr9nCerMNuuY7Se7vzoUYVG0v6WGtBqMtde6JsmnEtLoFzr8izh0VGZVwc6wXevalwNYY1ayovDiIh3aU8/TCMcIAUcO+d7TBuEVPTZ4Q3x+kS9eORCgEYKb84UTbaH/X+T5xjvABVeANQy/nqf5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747736867; c=relaxed/simple;
	bh=qcLANFQYB6F1aTadtJclYNPeTflXqceuvsxjG9tl5Gg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gLUFyCtwsqamR6tv453yV7PgIrYzTBE882ZZjruSKsWEsRuTKLx5NILPPfw8RKnGA2Yk1vO58/YoXRq37jGbx0+iDAPgcP1kU/GUWz9JZKT639i666/YIWdcM87wYZxHHfTXx/6Iqt9HsyoO/8gdXr6PSSts0qJy04XMf2UdUv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-442f9043f56so29597685e9.0;
        Tue, 20 May 2025 03:27:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747736864; x=1748341664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=anhtEfC+aYWJeJvUly60jdWH8rm+sVcW8pcF9vb2eMk=;
        b=N6WNFXRpPNc9+4xvuoJF3BsFa1PAqBYxuDGeDGf7s18Gszx0VqJLeJVNoH2nKHvBvf
         ewU3v09u7IRwhGwpYsm1XY1OsvueSMq18uZQ+Drqh4ICLEm4m1dKyIytGpfmAPzpqGRs
         LvbB4R4wwbIvqOWlXpwJo7Yc9Zd0epL7SmkLj7kfR5SpQeyb8bqKzzsfTLyiP5pX0kbs
         Udko8o2Gdd69BIKydAGozktSzr37IZYGfWPdRo59TduBfmM4o/7tLv2rJT8wh07JLwFh
         Kz5AV9E7Eh3W7ej6EOdrcU5MI01gGDZcn3AEWKGRNh6srfHMaJYGXXuk6t3Md3z5dggf
         1Xzw==
X-Forwarded-Encrypted: i=1; AJvYcCUXfjDRl4sUsEf8iR6YL7JPiGGMup2nBAkVj4q+hbd9UiSs741NlWaVfV1vpUAMJpdK5gCEFTobEwwxRiB0@vger.kernel.org, AJvYcCW2WKKLyIIvp7ZXG4g6Rrgux5l57xfZjzU09i7sOMJflS7UstM9Z47d8nulmtySXPVU4Bb+Fg9SV+khdt0=@vger.kernel.org, AJvYcCXFZkgVcjmp4bc8V0DYpdm6NKQ4P7/usX0YoJZcgkMgKdip4axNIKhZho/1jSuMGxgWcAvnK7po66Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/Folp1f4/ixCnIENp0U2mZcIW1cYc9+W2fZPppW1XMyZnhdhk
	mftGsAVqM2/RJabE/6dkvSQA/gFD8sn9Rqs1k11ukx7QQ8BPYJ2isq01IRZIi389
X-Gm-Gg: ASbGncuBTJJtrEhj58kbN1S2BYlEQvEyDpZCaIrKqdTFwP1LLa52qqZr3MS5M2B9ERn
	wGLxoryIX9TfusY5v+jWlNR/6I62KCx+xWCio6FxOFlWdwHSgby1wwjx+9U0SeQ7CT8VmRnbPeU
	sQ7XC6y6K/podCXdHsRxDoxYnXMrmGKeDhQtXuFu270mu9QFJAY45LzPJUnWlkB4tPRFnO7WPUe
	A1ZJB/YwWaYoO2BzZgbNeuW4VohWvFW7x74qGLptsqLYl+r6F7dqDGwYgIDp8A877c3paPThfCG
	/OsYdaUMMvbmXcF0pyzVXynqGlx3Hq9PZ1Z5OGg5Z/eKf35Dyv8/ZS7/1YQs2xsWAlxp08evxz0
	c8/6aRdV49g==
X-Google-Smtp-Source: AGHT+IGUarcsN0dGkfly/Rx4SdIOJyJyOrzjU/pgpXaQr2qIzh21VVgC/kOUDjf60ygnRBw0CXG2wQ==
X-Received: by 2002:a05:600c:154a:b0:442:eaa9:31c9 with SMTP id 5b1f17b1804b1-442fd66dd78mr108589395e9.22.1747736863892;
        Tue, 20 May 2025 03:27:43 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f73d3defsm24680025e9.18.2025.05.20.03.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 03:27:43 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Tue, 20 May 2025 12:27:03 +0200
Subject: [PATCH v5 10/10] arm64: dts: rockchip: enable NPU on ROCK 5B
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-6-10-rocket-v5-10-18c9ca0fcb3c@tomeuvizoso.net>
References: <20250520-6-10-rocket-v5-0-18c9ca0fcb3c@tomeuvizoso.net>
In-Reply-To: <20250520-6-10-rocket-v5-0-18c9ca0fcb3c@tomeuvizoso.net>
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


