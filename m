Return-Path: <linux-media+bounces-34041-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2EAACD8FD
	for <lists+linux-media@lfdr.de>; Wed,  4 Jun 2025 09:58:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3429A3A4E9E
	for <lists+linux-media@lfdr.de>; Wed,  4 Jun 2025 07:58:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E20D241C89;
	Wed,  4 Jun 2025 07:57:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9AB3239E95;
	Wed,  4 Jun 2025 07:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749023853; cv=none; b=dxP+9WD62nI25LGrXfiV7hQKNZMjiAp2r0rcz9IqABv5PaDyG0n03Fgsq4dlUuPkM6V0ketVV+xOVo/8tSicYNufCcQjEqtIwyzTBWnM+9FSMv+5mzKKRoUAotzf7Kaxwd2DBnv9aojbbINAxWLS/oQGgxFhOSMr+IXGGd68ryk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749023853; c=relaxed/simple;
	bh=i91shgPHsZNyilUroS+RDBNxOPQpEugf79RIy+zK7UQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IupobwY9tJCxjSN1pjhDLxzN0pDMXdvrFjIs2X8Tct5Nx4eHPDPl5SjYjXrBzshpK14PUgHXvI+vJuI+ysR22ZqDdgDK4189b4zxBl75oXsdfCsptjIVQ3Qf8lGTmm0tney0NSK6af9fU47nZGyqG6/zHvDsi2xFb6ANJquJuwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-606741e8e7cso5106151a12.1;
        Wed, 04 Jun 2025 00:57:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749023848; x=1749628648;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JMvFo5QL3bZFz0qcgL/CL0qvkVwIy7LI7zBc66tFtZI=;
        b=mB2KohFO7zNhRiehjVVtJLP1N410+B2gi65pHTNw74Qmd/YZI/K67VwdR/V3mbNjOP
         fN6MJGBuV3oCxKlLTQAT2vQDIEBIOB1mEr4HUHvEVe46F6nRfM2dngAyCuUIvqSZQBnH
         BQlQjceree6ezsHtvXs+L4Wyrw6jyoFBwfaoAIhFEpGiy/M9YkiLd8Am3YKQnmjU8A5u
         az+DE6RzL0Ojx+Y6QuM0PK2SzYmNViQUQ0HdPjIChblQrgThT0ERsCmbPOZ9VGWNuXf2
         IaiKj13ELyoeIiY2abUwdJXDVl6/Gr36MxHzH8RvzLi1GCyWFVzYWx/YKWYNNyBAlQx8
         8MIA==
X-Forwarded-Encrypted: i=1; AJvYcCVqG3E3p+o42MoQRosrvDkjPlaxuPkpmQH8H7V6+nqWYhskhNCVlkMFZuMzdG5XmjRxyd90xcKtmeA=@vger.kernel.org, AJvYcCVxRE5h+tgzNHd+UDXSEKmlFCMY4/3egB431oIceYA8MtTF62RkxgpzJRWcJPeaK3BL3XtAMm5a4/2v0i4=@vger.kernel.org, AJvYcCXgs1O4lUsTNewdz949a5hNVgU0rhF3wKIfKsMb2IT2r8lKwmvAOiKqkLTEGgueyvcPG6zLcPVk/VVNsRvM@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7+tJILyuQuOUzKzypD5+fizVKFIsYkSANnfMdSQPFHuqbcQ6s
	qX/fBqMgW5y8aUC0FM77AN07rO6Ch+ggSk7PHDRmcGdfHs3q1kASZegYNx1XytHf
X-Gm-Gg: ASbGncuOZ6usM3guARLqnz1pBWxv0Ggpgo+VhKuHDkdZCYAak5KsVkDZEFqFVOu2/dc
	XbeaRBSjBlkXZAJXpeqv6mpTMNxyuwW8qpKfDVPqtKm+PdujFGMYRipL5Rwh2UzMKocTjc9MyL8
	/qtF7mi5QjZ3qNCbekx10kV+0+FxtYF0uNpTmdC+NeQ3zL6+Faukv7TtmWYDQp/NiCik+elf0o5
	mvrk9De/UMdQ8X2GDmfOqinMKfRp6AM/PqHynLRxkjsiSybXxS+Jbn2moaHyyZ+n43Th99UvCCp
	x0oHgfhVzRTveTGA73skgRdCt5W9FamRBqzjDpmQ2KFgRVB7eDloMuKcTp037KslxpwhnlGEQil
	1M0pYrd9UKQ==
X-Google-Smtp-Source: AGHT+IGEU6JSHhOsqaZUgh9IRrRp0GWAjJJWZO/9WRDdIfgcT6aiVd16m1f2gcnNK7ZFqAce+m67Lw==
X-Received: by 2002:a17:907:1c26:b0:ad8:8529:4fa5 with SMTP id a640c23a62f3a-addf8fdd025mr150851166b.46.1749023847871;
        Wed, 04 Jun 2025 00:57:27 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-606fb36a160sm348569a12.45.2025.06.04.00.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 00:57:27 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 04 Jun 2025 09:57:16 +0200
Subject: [PATCH v6 03/10] arm64: dts: rockchip: Enable the NPU on
 quartzpro64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250604-6-10-rocket-v6-3-237ac75ddb5e@tomeuvizoso.net>
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
index 78aaa6635b5d20a650aba8d8c2d0d4f498ff0d33..2e45b213c25b99571dd71ce90bc7970418f60276 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts
@@ -415,6 +415,36 @@ &pcie3x4 {
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
2.49.0


