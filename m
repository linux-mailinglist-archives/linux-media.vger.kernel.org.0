Return-Path: <linux-media+bounces-34196-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 629E3ACFCCD
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 08:32:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D1401189C50A
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 06:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A96B7258CC9;
	Fri,  6 Jun 2025 06:29:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D46D257430;
	Fri,  6 Jun 2025 06:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749191355; cv=none; b=Y9NjTY6bJiOcnZ2ACs6jr7hew+XYZn9hcP+1V4ldiJLgdXTJYkpBUxxrNOBuPRJjmiaia3qR84hdusXw7XB2S0PYUFLwve6AJ8nqbgUj2pl7e2S0kmqOuAcfitN/LH7M2XgjwTXLUxRy7shUzeb5rQbSQOViB23L2OPsS6Z5h1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749191355; c=relaxed/simple;
	bh=i91shgPHsZNyilUroS+RDBNxOPQpEugf79RIy+zK7UQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K/jnE5QsU4mZeDWOOlqVhbpanvBNQOli6gafMlFDTzeXvHYT9IOEv9qN1ZkYSWkUngZYel7n3I+vcolYwLfyxgNcMsh9UomvIGgQSut5IPpLvuESHO8evvVvM9aLGyJnHWEq1JT9CCakMehRU4HVvat3pgv5X8rDUHrMVGC7IE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ad88d77314bso348351266b.1;
        Thu, 05 Jun 2025 23:29:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749191352; x=1749796152;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JMvFo5QL3bZFz0qcgL/CL0qvkVwIy7LI7zBc66tFtZI=;
        b=khqhTDx+aZiY7Z3KYTewT0kE/pywalg9djq53ttwuS0y7dJcUtMifkFhfns2Z8i3nu
         OFYMckVhdct0xtCCjUL+Hbbe4ekpjPaVg1UubJnnNI2sFaiYQvcsLR7eoGyFXsq+BZHp
         bMsqt/D+TTSCS4SvZPX0N2MWKq11prqskNii7Xbp1Wf7+bxz9WN6EptcACZXCo81Uzs8
         1prRuQZbV3dyrxIINmFmKl5CshQ0X4PVA6eohNaePgjf+VOFItncJijgm2JmU1mFkxKL
         G1rLHGrpQx2R3/gfpayEduJIfeltHdYdXBIT7K2ipLCrEFzaEAlkiAMPq+r9uYHStyD2
         ADVw==
X-Forwarded-Encrypted: i=1; AJvYcCUSqagS+ATYESt1TQU0NX8F+x5OD77XW5bwzLbg2YFxVXPmxweAGVDpOw003EsaPkxQxJXZARjt12x/X9E=@vger.kernel.org, AJvYcCV5woznnomY8In+8X3e2kC74DtuaCHvuFwbzUo9/rEb+BQHLCoORW9faR10lNkPyBtmJHYIj8w/7ckiQXmp@vger.kernel.org, AJvYcCW2XdELqVMPFSteJb7AUHmR2n3vLmS8i1uVr/wTeAwHE+yfjuS6X8VizkM+R+ju8u9ZQ8LlsThQ+H8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfiTOiKDfOfiHWgVlKJFyn6vJQDa4dd0eFPEDhGeWmXSSG8ABe
	o3OpaAy1ZGmgbtaY1OGKIU2jNcnpCml2HYrlp9AMEs8WdX0OovNsOXGY
X-Gm-Gg: ASbGncvAaIUi+oYbuGRo2kU97gfesZ0M8UgvQ812prmz7lqPCsTwlKpb2tsYDbcFE2E
	auOX7msk7EtmS6jammTAlbz3+B3f2dpGbtvwvYNfHCsj4Asb0CbTaNqRuxu/B8xl/g7XtXGiKLB
	Tu7o+GbDlfOeDbCzSQW/GVNzJMurBgZbz0Kq23cp40JRKHI37akWGQpzzbimP4hr4ABIth0kZPF
	mhX+9ktDZ7VaE/Sw9ThTrEV7oa+sHKcL9Bv5mVNXFvDL8Ek7SfBlvOm17qdpPigTB9wIIrc2or1
	6XKZwJ4wvpI07gG0+igpWwBv7A0iH8aodhUNscE6Af4Xdc/i+Ru6BsFX2nxalp8gpw6a9IT17h6
	MiInTxOhYOQ==
X-Google-Smtp-Source: AGHT+IH386t4fpjPSjXu6Q/P93pz2H4oKr1u5C7rbyqEt7KH415Hf2G+JglZ1eWXhfGWu7b+7DDqgw==
X-Received: by 2002:a17:907:97c2:b0:ad8:8efe:3206 with SMTP id a640c23a62f3a-ade1a9e825dmr164077166b.42.1749191351781;
        Thu, 05 Jun 2025 23:29:11 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1d754653sm67989966b.20.2025.06.05.23.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 23:29:11 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 06 Jun 2025 08:28:29 +0200
Subject: [PATCH v7 09/10] arm64: dts: rockchip: Enable the NPU on
 quartzpro64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250606-6-10-rocket-v7-9-dc16cfe6fe4e@tomeuvizoso.net>
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


