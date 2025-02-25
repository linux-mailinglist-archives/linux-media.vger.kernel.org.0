Return-Path: <linux-media+bounces-26900-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB14A436A9
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 08:57:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 851F97A8E50
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 07:56:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0E4225E446;
	Tue, 25 Feb 2025 07:56:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12A325D53C;
	Tue, 25 Feb 2025 07:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740470169; cv=none; b=eP11cPTdBPPC61ZjPxkMkdJktk3jXEMXenBnFwlLfi5H0ncr5jKr2u1zc/i5gigogfIJEMABuahS2W6uCj42NX/rI+kIdQzMgb/zgVrXZJMMXY1ALUvZevCSRcVi4sefdQ5Ef4lIrkwKfyHJezitHCZI/fCPb9xsxHl3BmrKgG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740470169; c=relaxed/simple;
	bh=WmAQSDyqxVR3LHHwUfiGK+TV8dYT09H/xx3ewkMcre8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MomwJIhGuxK1acB6BGsbuqRcsD/76HNa0sSqKwBjOtgXb/35lD3gQfDdFkdirLH2jXyg1r92UPUSjZQhC9KpFSwt+qJP31mam7pim0bb8b3yCKWR61+dnhDPrw+qn9Fw9+0PcCyPYHaAegmBZZyynTyMBs+BO/dnwzdDoBqHRc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4393dc02b78so35647775e9.3;
        Mon, 24 Feb 2025 23:56:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740470166; x=1741074966;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZjST+tDBanh80dU/tgOfgWNh4nJ1bOb18ngSnNilxXE=;
        b=qmDFs59x0UL/LIW5wRBD73NEoPj2XWr0axV+ugMl19nMKukEkIH0miJmsq/6FQMRq2
         Otq42JEb6fykdaD+xwVQvhVvNGqHMuFuQu0rKHas4LbtyyhPDLqlWXFL9mHkCZZZhV/N
         0gFXtPP8jzNjmHEhMIGrC262WhC0b4eDFPXFMQw0q+D2SFOFkGObm+2N/RNDQ3ULQsw6
         jFaDjZQ585ZFtvo1VnZraA8DyHeaSrdywcLqTeAuZm9ieifsZapEFIimbZT2WnttL1FS
         hLmGJD2z9i6fUrttHLzHwrmQb8kciwoEOXbvy6dadCHCSaTFPp2wwcU9Bsz3MKscZTq5
         sLqA==
X-Forwarded-Encrypted: i=1; AJvYcCVtXcm/O9JYKRBUxVjfMZ4WUAJVbMgq4E//8TvWt+MIrgetNjSdi8uokLwzaFjsMG3ZMiS19cdvYt9h8xE=@vger.kernel.org, AJvYcCWDRt9ZsJZAVrHv8S4cLAgEreh5tHxgjOuQu9yvPVX5k5qKgIsiHgs3/tOBCygflIEQ4JIc9dUg3pM=@vger.kernel.org, AJvYcCXuHD0jnxrsp8L658/902athNq3T4L8KE8UKGG6cHEeLkmLXBfcAdEGgYjbvQ9uCCXRyz5zYdMZOuiCJ5Xy@vger.kernel.org
X-Gm-Message-State: AOJu0YyT5sStqnWqoEikUflAauWNUw1WRp5tjWyqRbnp2QpPr2RrIbOI
	cEjXj178Fh7HZlYvmYEaKuO3JSCCBHyh0oaqxFWcgZWQLAYOS90F
X-Gm-Gg: ASbGncsje0dfmzBRbRRS3YKY0pibaHqNOUK1pFL0p0zrvp8WRB8Owyo6Vp83RXl6wZw
	xupz8d9yg9B1kGqVRUwqoePhQCIXc/DexF1Rk3PFXyv82w9ukUPTNji8M1vAxRIatNwKiyJQ1aa
	NF43CqrMRriT0lq3VSOUUWfTf+aVIXJj2sh6NF7uLtZCxiWh3TWGHqZBz9ks4MYm7VrFngJXrP7
	VdPHgsY9oqm7NPrPz8ErwKxphHEopCQWHM1wDN7jegA6IG9PafQ5qeS9YfxF3IsbPrcYycs7Lsy
	390MwpUEM6GKRXt+geiWyQd0D3BFJff7gQUSN+JE5oFD2Mo92MaeGaAZ9w==
X-Google-Smtp-Source: AGHT+IFBVupjmoCIi4Z8rhYBHew03hpkxD1lkVsBkpbYaL9RCDyWui5OGx8IsblEOSEcCQ6omhnnfg==
X-Received: by 2002:a05:600c:5493:b0:439:9e8b:228e with SMTP id 5b1f17b1804b1-439ae21cdddmr121462285e9.20.1740470165919;
        Mon, 24 Feb 2025 23:56:05 -0800 (PST)
Received: from [10.42.0.1] (cst-prg-37-50.cust.vodafone.cz. [46.135.37.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b02f2475sm130299475e9.20.2025.02.24.23.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 23:56:04 -0800 (PST)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Tue, 25 Feb 2025 08:55:49 +0100
Subject: [PATCH v2 3/7] arm64: dts: rockchip: Enable the NPU on quartzpro64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-6-10-rocket-v2-3-d4dbcfafc141@tomeuvizoso.net>
References: <20250225-6-10-rocket-v2-0-d4dbcfafc141@tomeuvizoso.net>
In-Reply-To: <20250225-6-10-rocket-v2-0-d4dbcfafc141@tomeuvizoso.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Jeffrey Hugo <quic_jhugo@quicinc.com>
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

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 .../arm64/boot/dts/rockchip/rk3588-quartzpro64.dts | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts b/arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts
index 088cfade6f6f14b6383ab844fa174c69fa711fc0..5f6b87dc46361eea93ea2a1fa373cb9ecdb7bbce 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts
@@ -411,6 +411,36 @@ &pcie3x4 {
 	status = "okay";
 };
 
+&rknn_core_top {
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
2.48.1


