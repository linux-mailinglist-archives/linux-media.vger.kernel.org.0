Return-Path: <linux-media+bounces-32645-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E32AABA137
	for <lists+linux-media@lfdr.de>; Fri, 16 May 2025 18:55:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC0B74E4B29
	for <lists+linux-media@lfdr.de>; Fri, 16 May 2025 16:54:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C98911FC0F3;
	Fri, 16 May 2025 16:53:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842961F153C;
	Fri, 16 May 2025 16:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747414416; cv=none; b=dPE0a6B/87qSMxZ3chnwklr24OsxaByI6lKy/H+x7IWrPmYI4dJsdaZyRtemEjQJXoD5hAu+/xLC9dRM2SAoaoPqYqvjp0dH2PpYw06kggdBEBsNXJJVJOSXgCi7RG1shGnhyzz89GqBFSKRX6jXPQX9hzwr13MXlIJcGGBxtVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747414416; c=relaxed/simple;
	bh=i91shgPHsZNyilUroS+RDBNxOPQpEugf79RIy+zK7UQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SU4UNijdFARGW8WoCOFaNGVzN2ggt26VulMDUsQJLhfWha0a/uM0ISBBI4kDqhB6TZYvUkbJDB3xcUCeukaR8pllLWo982rAwblVoGuDA1QeSBlDDALxKg8aHBj1Ba57PRdy2RcXDhGxwXjV6jG6/cDUKYmOhzPKawDyzpFadI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-441d1ed82faso17462365e9.0;
        Fri, 16 May 2025 09:53:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747414413; x=1748019213;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JMvFo5QL3bZFz0qcgL/CL0qvkVwIy7LI7zBc66tFtZI=;
        b=pGzOTcfxqNEULl+sT5CfJjj85pEwSL1vuF0nnbuPUMYmYRdb26E2RF97KJ1sCDZc5e
         wPoy2U4+1TjNKIckCGD13+BsdhgTSTugX4iXPab27EY2oURgygVQjWuZHK5CLDNa0Lo4
         my/X2zIM5CQ4d7k3YN6NweYJ6pNHt6c7aVJS7qwurTHxasZerT3hMkUB4AIp9UPY3Bi/
         kDSwVG0lJfRJtczmrCMkNpL3MUTQhumQrqY/4b3ArippRijnj95hty66jYddWoHCAJkB
         mdGI6PMY+k6USp/xQRSEumWq7Svgr1z8MXxvoHd7j8DA5p7WzHXgjMYQOfQ4m9cewmma
         f+GA==
X-Forwarded-Encrypted: i=1; AJvYcCW3hjXfBAWtyAp3WrWmmbybnJFcq0oD0ZDtP1ef6/PMvYAt89g2/SSY+uD4MkFEOnTmLPKaI3wBcboT7eA=@vger.kernel.org, AJvYcCWL4jmpinAxu4y19f7zNGnkanQPRuOa47Bmbp+alr20Ln0+u9ckeP4gT8sYAlLCHRaMEUOJqpT5UE8=@vger.kernel.org, AJvYcCXrCUhpJt4e5B9pKwyOX2fZFrp8clv4K4BmX6coOZHm42zYF8/A3f+tVFPokNYuuw3k88aPf3YffUWaTBTM@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0/22Q9nb+wzUGIY7xejKGs6t/xgaFbxJQLJFZzY3s6LO3M/Xc
	mDtA6inEHUqa0JiXueTgAn6q+oIedka2i4kJkAMQwdJgHBsRBno8gcq6
X-Gm-Gg: ASbGnctQvW2/gsnPtMD/iSPAj0Tb82urQOLDVJwAKq8FiHTzHl7Cisy2NQNMxLsNjwy
	+d4SJ6fX0LFZz38vBWy0SOs8hwoy9+M+PmNspnQW+BRziJ9NTqjKOl8U1KdCY75biVP2nF3+iZ5
	1wbbU/xt4XLhR3i4OGogLunNye7X4iRoT/3ICUZnACMvLQDCViw+9zXRs65BM7L6uJXZtgc+Ekj
	aQUYWk2hYPQT3Ta6rxRmWRpxyLw8DC+An+8wsN6b1Uf20+lSx4J9ezPzEZnrXEkYXsH9z9JoQCo
	BOp3VIF4xlQ5XQr/MZJVGvBrTKzRE/D3A4Se1wYzD47k9VCDpSULdsmrlO0iqA9UZuZ7poqy/4k
	krVVZFAnHJw==
X-Google-Smtp-Source: AGHT+IE3kKJia1yJ69hIetn7LETCPISzu5AThEm8caL/gjKNo+SI7DcwJ/kykHCbu+Yw1iluEYSstA==
X-Received: by 2002:a05:6000:2af:b0:3a1:f5cf:9553 with SMTP id ffacd0b85a97d-3a35fe6628amr3027912f8f.6.1747414412687;
        Fri, 16 May 2025 09:53:32 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f3380498sm116511755e9.11.2025.05.16.09.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 09:53:32 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 16 May 2025 18:53:17 +0200
Subject: [PATCH v3 03/10] arm64: dts: rockchip: Enable the NPU on
 quartzpro64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250516-6-10-rocket-v3-3-7051ac9225db@tomeuvizoso.net>
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


