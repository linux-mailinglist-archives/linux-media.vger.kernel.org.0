Return-Path: <linux-media+bounces-34197-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3E3ACFCD4
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 08:32:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9DC53AB1BE
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 06:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1D8A259CAC;
	Fri,  6 Jun 2025 06:29:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AAEF258CFA;
	Fri,  6 Jun 2025 06:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749191358; cv=none; b=KBGujxJtMXH6O3eSazGKT4dIuRZwCfnaH4GybMUQX0aAO4ZawJxSb3gaL47Wc1wY+Dwyn5Mv0tetm6MyxGQk/OTJ4CD8wef7cNSa0yGUFyaXnDiCogTg9hgao4NBEv6HzuU90M2PxwvTUF1NjAD2gq1b3B075s0wOnsBKCJffns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749191358; c=relaxed/simple;
	bh=qcLANFQYB6F1aTadtJclYNPeTflXqceuvsxjG9tl5Gg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UqUqzLEdVS2q1Rv+hMs9o91wIIJ69hp+vytQ699kC5knxCRxGe+BHFG9QSAfn208DrODz4gQyVHhw+SyMmYTdXf7NoiTa6n1dm8oJ80OTke9fEVXzT0F8xnzdUmjqeulFnCQz+cHme5b5VM6W+DUz3wC9GjBlkAA332/Hxk6tNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-604b9c53f6fso3569073a12.2;
        Thu, 05 Jun 2025 23:29:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749191354; x=1749796154;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=anhtEfC+aYWJeJvUly60jdWH8rm+sVcW8pcF9vb2eMk=;
        b=W3vCRqnirNsT3umsMTw/mj5V5iWtrD/uBseXACX3CeeyJBkPqWldRBYkH0heEv64jx
         i3TOZzf10LXmZ0X6SRIqx/ta0Mx5lS6HniHCp2BCRlvc8fxTUO+xae+ic52FuCyU8L7j
         maXxuME/2/VeoLjpDhIFzH4Du4mITHessTVDuvrWu369xBy7LdIMVuD2HJA979/AVlQE
         GostxWctYxM1Uwi//5ucCbuJSNU0FvcL5GytB7MVCauEAD2P7AjY4sYI2bO5OOd4Oalr
         mtMsnbJP3u+yG3Oj5JxPfNLxUEk+XZdrj1OzUCOOkquJiOS8qIv8yinxVSXSFs/CAjr3
         +pSg==
X-Forwarded-Encrypted: i=1; AJvYcCU50p100FaiJ42YuHz3xLJiLsTIDyZS0P1kcZsmdKmQQ3GfCfjlKoTJEkzR0EvZzTTnK7k/HgPQKQU=@vger.kernel.org, AJvYcCU8GYGKaJMGPev38HkJQ1+ZiURLq8XVmA+/b9GfeKMOSKqOysPgY/GzMRnn0uzbWv3BcC+5Iekh9DEd8JI=@vger.kernel.org, AJvYcCVFBfEsrCODwoRlxbKeyoviaI4GQs1XjkMgIZ1VmTf+h/5ukaOkS9j/39yRyqfUCNKhL/1ReV/BNUgDzJua@vger.kernel.org
X-Gm-Message-State: AOJu0YzNOHkmsBvMoVe9EET6GqbDkKD74L5v0K34xYl8KkqYK2rrowWM
	QNF3eyKg1jjekmw2z1L2WVxq/jwYkxk1o00W1Q/eSbaK219WXjsO93wz
X-Gm-Gg: ASbGnct5rIOgL6MZS1JIVWArfWRAZ0M4BvWBBAxLgvWEpIXQQzrkR5KA9BO4aAYFDyU
	0jM0kwBKMR6VA9acKO9+1UovLoZrocwSgp1cZwSFxnnTgR+grGps+sVH6g2p7Bu5EAplC6wv7zI
	E0Vo8wO5GjTGhgRQBcelsTMleS0iJac45r988FG8U6oXFe9Zjg9CGYLtXjeYQmOp1s/3Gxv6vwV
	RbwP8KrUFTC3npqbROPmptsQfTLGMcG2noID7/imwk8JusoEkk87E/NldAVvULDcRPbNZo8YoLD
	+UmBXb6mST+zZx5w7Y3q7G8Jh3yFH8wVWEGxhdluliwXsMo29q1mawM6A3A7lTiswK5j3qRt9+h
	UwNj3YOfF3jEFu5BJ1Ett
X-Google-Smtp-Source: AGHT+IEQhHpZGVCxH1ZaUqlfgXtzTnbNuSiyE94GQATLfAusLPGKyuMEVAdsVmPX89pYi5j539z3bQ==
X-Received: by 2002:a17:907:94c8:b0:ad5:55db:e413 with SMTP id a640c23a62f3a-ade1a9248d4mr174784266b.26.1749191353364;
        Thu, 05 Jun 2025 23:29:13 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1d754653sm67989966b.20.2025.06.05.23.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 23:29:12 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 06 Jun 2025 08:28:30 +0200
Subject: [PATCH v7 10/10] arm64: dts: rockchip: enable NPU on ROCK 5B
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250606-6-10-rocket-v7-10-dc16cfe6fe4e@tomeuvizoso.net>
References: <20250606-6-10-rocket-v7-0-dc16cfe6fe4e@tomeuvizoso.net>
In-Reply-To: <20250606-6-10-rocket-v7-0-dc16cfe6fe4e@tomeuvizoso.net>
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


