Return-Path: <linux-media+bounces-38140-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC31BB0C009
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 11:21:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E68F1AA0299
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 09:20:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3ABE28C01D;
	Mon, 21 Jul 2025 09:18:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7822028BA9F;
	Mon, 21 Jul 2025 09:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753089508; cv=none; b=r5Vh4sglstM+1FfRObartPB6aZitayeRxMTETlSM2zfsggrAtVWOvXJTyLavXxim/ymzHEZAwSev4hRXzH4V3xdbvRpsJM4f/DcnqS0qECM1v61jXnd4aViVy15iKGyqkqsyOFdvX5B5JIq/pQH4qRgRKazEDjfg7TP02W+SExA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753089508; c=relaxed/simple;
	bh=r+D3pNRSLE6qrCsiULKIgNe2pbygH3E8q7nM3MPZaxs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oE4/i2cAYcdCxlSWbu326xyZSbNfiaUr67+6ezhSVnC1BkQLzGC/xsnMnUehNVdIWTYg1cS+Ex/M/fjLquJYDHkaFS19ufySbpyLsSSg3HhYQPmVDbXEUSUfAqe18QE5iR6e5Ys2trcw+wo4XXP3cdvXCp1aBFdOyTRgoua+x+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ae0bc7aa21bso803343466b.2;
        Mon, 21 Jul 2025 02:18:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753089505; x=1753694305;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uw1eDADEVnjLekcZOf8BqlzoLj1qhBCrbU+NvqhrVGg=;
        b=PJi3NatHKoebDKjprPBueSJ3Oww3iJgKN5oY8AhvOgvMzqoWfUy/5AeenNAbU3PHgl
         Svqp1j+lAISn29QrUneLz8KZKHltbHHfb5kctnd/mUZfhkUl6liljPzYPS1xO0e0AhiH
         hyEzqUm/jBRJzTOg+ptcyk3bVyofzJ2Sjis8ERc5mqgasoS+v8qbwwfoOJiQW0zeMiLC
         cl4bV7W4xu4mpTfokXwEDUkLLcfRdssz1oI151UUdXR3u4ldZc9c8NM+yhWiWWVSCHGp
         46MJMzkxvPUYCJVnAPXOH7n1JhDDjbt3QI/SMx1IIR7hp8MbSpiGEMZ5OfGJT8VW/gxE
         D/RQ==
X-Forwarded-Encrypted: i=1; AJvYcCUquiKIc+/2f1enoVHSkPQO8vAn5rbuS+G6xxlGrKKZ7EVSq7OLNvpaSf6GvIXjjseapPOkXl3B6HiVK5PO@vger.kernel.org, AJvYcCXR/+7vY7EeyJJ7Tiq+uZrhC74J7MOAuwLX8wUqYQkkUEqTYgU+EezfvVkyMk5A++4pEaCRxJo6x+o=@vger.kernel.org, AJvYcCXZSM+4N8uT4QSOOoCYSbeZqhU0w6ZYmKNyWh0kTUqOg6b2AQ9r+i6p4U6UvfuxmP6+L+3xn4iBYCuy+q8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPULo9jKZsPFoJzBE24+Ztb7w6Q6JRwUksrHFkhq/Ssi3Ug11r
	k3k2mcywzC934wtt8m46i+PdOjpWAgbYMWNlWZwdXF3pDuV0/HRAFL7y
X-Gm-Gg: ASbGncubpB4ZhJIRk1+Nz8HocK01uUY6aKuExikRb0pNtj99/u1P6HSDwSMsVk/XWyY
	4eZB3wuT/aZOLFHEIzxn4S8jOCnALV5IDDCQrBr4Qbpg4YmkZGHf5tbxJj21AecBYVmz8qEmjyj
	WpOd70T3d9a/BHls6qNH91kfqLoJ0aZri5Vrjxhoj3H+NAZt6vJE9Tx46E98SW4pD1+g+67o2YQ
	WrboUExoYqNmZtENc1k1RQBcHF9eA6KEVX+qURiK4xia0ljGoUxBA6gCn/vHIzzfrkV2HZNSHUs
	kJ+hRlhv4UfzxG+pTgj2WYz9M65HCeFBfnBY2PT4v0rmxrJdCajTmGFUs6RrJWp3YBmutJ3EIX3
	9PqJW2YEuVV/KkXCiTk2Bdc6rsTl4Cv1urPLUAXAaoeqPYsSdeEhgJ2IE
X-Google-Smtp-Source: AGHT+IHsm1ePBUjMjzCvzap3g5+01eEdQ+wj7EdefzOzw9qpCsRvUCz/JpSRjM/NIMEES6ZIOqq5NA==
X-Received: by 2002:a17:907:c04:b0:ae9:b800:2283 with SMTP id a640c23a62f3a-ae9cdddb9a3mr1998711266b.15.1753089504662;
        Mon, 21 Jul 2025 02:18:24 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6ca2efc1sm643125266b.83.2025.07.21.02.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 02:18:24 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Mon, 21 Jul 2025 11:17:36 +0200
Subject: [PATCH v9 09/10] arm64: dts: rockchip: Enable the NPU on
 quartzpro64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-6-10-rocket-v9-9-77ebd484941e@tomeuvizoso.net>
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
index 78aaa6635b5d20a650aba8d8c2d0d4f498ff0d33..b2336c36da01af3b67fe347d5ff0b7c4ee6b0556 100644
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
 	vref-supply = <&vcc_1v8_s0>;
 	status = "okay";

-- 
2.50.0


