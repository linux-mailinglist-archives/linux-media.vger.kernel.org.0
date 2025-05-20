Return-Path: <linux-media+bounces-32904-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3387CABD4B8
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 12:28:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 64A1A1BA2429
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 10:28:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08A6E26D4CD;
	Tue, 20 May 2025 10:27:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E5026B949;
	Tue, 20 May 2025 10:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747736853; cv=none; b=RhUOcINZetEoV+45C6QAFyTedFSFl+OEIGTeDknQeDgVyn7Q86ve5o2C8PiYsHnfleMpmOd8huuQlyKLYHMPUOS34eQ9E9oL+u7uD/IcVAl+iTk67k6b91kzqaqil7Rj0eRg5YNYdbvkwmw63d6Dn3CloB/2jaZsR45UU21xoIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747736853; c=relaxed/simple;
	bh=i91shgPHsZNyilUroS+RDBNxOPQpEugf79RIy+zK7UQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OMdPBN6/+MqlOFc5W/rcsxpVaWOd/Vm3r1hSL0K9lLbIBjw7wxm9YOvkRoVMMGVY/alyalbh0E6cVlM8EqG8fL/40GYVhg9WzJSRJuW8/asJU0w32nMm9LxrA2x5SrUdxdjgWya9/r9cCiKaKvgFN2vUSseMyuiE29n6Y+ZQ0sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43edb40f357so44760355e9.0;
        Tue, 20 May 2025 03:27:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747736850; x=1748341650;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JMvFo5QL3bZFz0qcgL/CL0qvkVwIy7LI7zBc66tFtZI=;
        b=uBgMHzGSEf7j1nfz5XDuM3mb6bBee0MC3g282ukeSAT+20C0aGN/+gwVbsx6HTVV5J
         UJYiRvrFKHNAOR34uVXGoPr55DBlTegV28592yIUQ6WM2k4/ubBKpcD/a9HpDCh044er
         r0elZCh8nb422NizbvZuN6VYONbAvvYdK4w5Vy2s6ZDvBCaitU5Ze6hJdOZ/EZ5hRFVb
         uVsVXS+Rd2mV1TeqKizjHXN7G5PTazTQJ9nd94vfYRI/xXqhURdSndt7nF++9fYtchpy
         agvxv/2lKJY+64PwanBngcHp9uBMxTPqj/lhu+LYzZEDFzG74JedlE6vGCJpKunzub3b
         1qZw==
X-Forwarded-Encrypted: i=1; AJvYcCUcvT1JQmSs9/ZisD04TXxvl8WNkjuhhmmY2G9fN2RHekrELUCAU9Bfv7W6ShNKkGeFIRIOndaDwir7Ehr1@vger.kernel.org, AJvYcCVGLCdpj4sbXPMJb77YwDEkje4v8H9xgNkRx0DmQtpqCwDImxP4AyJXpAYuVI+jwA7fQ6kbQ2wsMEo=@vger.kernel.org, AJvYcCVlEZp+OULUrmSZ12ydkrOhUcZngb34OOy+n49JCKzEeSnShfsKyqRqa0/xFHNXXs6JftTe/EmafUivjQ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQMDOjKCVaHBHWRmENcr2XdUUT1mwoSRWFPawaFPRM0hQe0U1y
	wlp9B2NIhhwZlmYda25k3wZE/DQovwec/DBg/ZMTV2IPdM3NL+4Z1hSSngiLYNzg
X-Gm-Gg: ASbGnct5ycsSpqM9UdYtXPi+eaB11dJKOg1d9O1+I/8PFeBLKrqLMfF9EMaU6A6HMG0
	fbOe/HYmyDqIFWDsaYxwARZsGGtDJhf6Kix+WQvvrkmXxNZdiImm7FEN5c0VIQ1R+PohxXYWJGr
	GhkacQlz+FwtNRjYflo6SkGmPGjBCOmdgr05Y4z8e7uhvqyWastzpT3Kq4Gck6tnzy0d7U3mNEQ
	/TvXhMQGmVtqv35WRA5p98CKqdxS5ic62Ztoq4uqFc6Bbohxt83WX3pDp+e+VQQCXNtKongoAwx
	PJ6LFAOwN1ZaJal6pi4EpNM1svMq2wYt6ePvDQYZkq1PJYfW8fPM/SuvHqGI4wmmfSAmguvzAT4
	/ypXq8jBEhw==
X-Google-Smtp-Source: AGHT+IFaTNDTTs/HbVoDD7uNt9+VoHIWuf+2KdFCdYZjQ41F12fKv5MmzphIdTQmi2qfd3qs7Ll6jA==
X-Received: by 2002:a05:600c:4e42:b0:43c:e70d:4504 with SMTP id 5b1f17b1804b1-442fd64dfccmr154018695e9.19.1747736849844;
        Tue, 20 May 2025 03:27:29 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f73d3defsm24680025e9.18.2025.05.20.03.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 03:27:29 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Tue, 20 May 2025 12:26:56 +0200
Subject: [PATCH v5 03/10] arm64: dts: rockchip: Enable the NPU on
 quartzpro64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-6-10-rocket-v5-3-18c9ca0fcb3c@tomeuvizoso.net>
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


