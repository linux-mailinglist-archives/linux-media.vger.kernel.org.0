Return-Path: <linux-media+bounces-37566-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A34B0302F
	for <lists+linux-media@lfdr.de>; Sun, 13 Jul 2025 10:41:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 394DA3A7B02
	for <lists+linux-media@lfdr.de>; Sun, 13 Jul 2025 08:41:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E25B1F55FA;
	Sun, 13 Jul 2025 08:39:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EFCF223DFB;
	Sun, 13 Jul 2025 08:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752395965; cv=none; b=rOLOw7//X/qeQyZMAKQ/8TVGN9+DamNnVrZ/qBG0wMXDCXqGGWHk4xlFoaXQs4mf4xkgF0epOpNMg17jUYewJ8aevQ16QD7CLBjOwYVKS48mbbNmFMfcHS7g9iCDOFyGZA9b5+lee5AaTzn4nA1kyTmJhuEiBrCfxyijucqqDMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752395965; c=relaxed/simple;
	bh=EZMDe9PyWehTkIbAwv7vdYmD2bI0Je8hA9w0hVoheVg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nBH4KZ7gHaCGuqTSR1+QIv1h87p66hDTFyHM6pwBFN8S1uRwS7FxW7c86vW4z4A5yUJaeGBoOkSAr1lUCyTleCRM2V/n3q27iFvxEdOpV0xU1g0Oa17PzHlsrYUVBHv7Ikau/vykDY6xhl2E1xO5EGibr7krKMHZgQmY1g/FhlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ae3b37207easo699639266b.2;
        Sun, 13 Jul 2025 01:39:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752395961; x=1753000761;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ARZBUzEfFCMAq5v8g7vjIVwF7+PfjU6DnKWe8vqNJQ=;
        b=vgU8OpM2ZZ47o+Ti+xdjiuKOkriWyHO8QjqulJDd33+j8mDX1SIMXO3oaYPgHJ+hx+
         UIIKCD0CwUpoj66+3GmL0TUZ9DvsGIlcfFPzyNmR9/vhs6a8E3lxkeAds2PRplaiTK/F
         62Gw6lXywsIbIQOYai5+tee2jvNC3OsunYei3TGp/iiPZxns3C3Q4uDM8/MQDwFD0pgD
         T2njbXPX7xLvyHEOID0d/VeLcCYn+FkzJdXNxyDSQ5xKE4oRdq3hGTiSRRig59iwPe1Q
         AeLMN/bqDSWz/snLEr4UtDQab+5WflY2028Uc2nk6TQ4Il8eN+rnl3f6ljnLJRwchh6r
         gwkQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8dOCrUTZYBkhmY+1BPs4JfwhlIHQLQJdIZ4YHhllXwUFyhxneBmBXj0EXSQzX8doRld7ox/8yH7jFV6mW@vger.kernel.org, AJvYcCVAj2DGJsh8Z1vZCjQZhGq2Vj1eUrJlTpKxtCMHrwB1YNdk8x6UipsdLwU2G13ML1yK0mVLE5dgJ80kKGU=@vger.kernel.org, AJvYcCXJSkk2eJlDVR2gvzeBMAUFvumSTN329QGmzEAxDBN2H3rSp+z+gXtmUob0RLnWhcn8/TCAFMTtgNs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWYD7UGt8GhAn9derwUSOuimL1l9JQkYv4p244G4/CnzI3FaF1
	hv4VWNUebpxXjD7+LtdByXKk9J8aeP6VzYqLnd6U+hFm+g0bRXtuFA/+yno2xyjP
X-Gm-Gg: ASbGncszYzjSqeYCOMi/IDDHdz8K7nNBxci7IWGLIvZwuDfiwVf0oNZHq8AAbNx8uE7
	OTvYg+OEmRVwvw3OfMFMZ6r5okm3Aeh3kx+g9PmO+DJwKSuRVpf9PkzNWeS/9+vhxLK/JR/1G6y
	/wbvRuE4rExlo2rW83jVYZkfZj8fr4bR7TJfbrlM2F2r7nNJDuugtUbaIg7W+Pd7NNOtFdFWrcT
	1M+1WRkfANHxddXU7eaX5dSV9JpGC0oQZNtR2ffKgLD18U1eLxxla1HU45uOs25IlkDZpdSJhq0
	O/o2Xf8cITczrH9on9F8d5Wo4V7kqflZ86CZ/jB/icJdVhnhpkgxXhTsPDTwTf74gzXemEkhrGs
	7FFUzBffh6rFBNaqnfVTkGVLlFMEp6Uy+x7e6XvXV0ezSgu3jw+VoP7qu
X-Google-Smtp-Source: AGHT+IExBlEevT28yq3f8GIk8BvM6vD/0UZe4pkBaz+41fUQECzjnBCvYRpaZSboFe48piBAxJ1srQ==
X-Received: by 2002:a17:906:c110:b0:ae0:cbc1:3468 with SMTP id a640c23a62f3a-ae6fbc886eamr1032521766b.15.1752395961350;
        Sun, 13 Jul 2025 01:39:21 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e90a42sm610876266b.27.2025.07.13.01.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 01:39:20 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Sun, 13 Jul 2025 10:38:59 +0200
Subject: [PATCH v8 09/10] arm64: dts: rockchip: Enable the NPU on
 quartzpro64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250713-6-10-rocket-v8-9-64fa3115e910@tomeuvizoso.net>
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

Enable the nodes added in a previous commit to the rk3588s device tree.

v2:
- Split nodes (Sebastian Reichel)
- Sort nodes (Sebastian Reichel)
- Add board regulators (Sebastian Reichel)

v8:
- Remove notion of top core (Robin Murphy)

Tested-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 .../arm64/boot/dts/rockchip/rk3588-quartzpro64.dts | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts b/arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts
index 78aaa6635b5d20a650aba8d8c2d0d4f498ff0d33..f8a0c95be58dc6c60ec0d48a327a9151a66fec5d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts
@@ -415,6 +415,36 @@ &pcie3x4 {
 	status = "okay";
 };
 
+&rknn_core_0 {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_mem_s0>;
+	status = "okay";
+};
+
+&rknn_core_1 {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_mem_s0>;
+	status = "okay";
+};
+
+&rknn_core_2 {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_mem_s0>;
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
 	vref-supply = <&vcc_1v8_s0>;
 	status = "okay";

-- 
2.50.0


