Return-Path: <linux-media+bounces-11834-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB1B8CDA4A
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 20:57:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8716128357F
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 18:57:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A00384A41;
	Thu, 23 May 2024 18:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YNouIM5W"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB2D82C67;
	Thu, 23 May 2024 18:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716490601; cv=none; b=adgdDl+c0l6Ug4LwayZftIJVBB3EpOBpBxog/0kvB8hPvjO1Vxhb0Np0XrVoQJboE02SSpB4lZFQoGsW8nBdmuIkP0IrBPBNodNxL99eGJGxK3me5HLKdw8zdgO3bigGBYCch+msdRkXHC7C51/Q1Sr0ObRIChbQpz92VyJp3mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716490601; c=relaxed/simple;
	bh=HZNVwOy63PnlLV/B4yl1rXiuzBKGyv+RHwrWFUlroEI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XB1hUP/Nq1aZrU3InrnYU5T9NnEy8E6GZ2B2oiw8jZBeYLtkTx2V5fDkqdSkHpQzPFTSMI2xJv2aRaRRv2OOSTJ9uLYzvGNmDg4lqTX7zWo2up1JYoNPatB0NXYha7feiQTVhJG/mVgmo/aIlbrWP4pOczsOCNF2qvgExyjKleA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YNouIM5W; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4200ee47de7so57552485e9.2;
        Thu, 23 May 2024 11:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716490598; x=1717095398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aagzBVjJ/D8Y1ifoBBVOq9JBnR6o7BIp7hhz9J64Up4=;
        b=YNouIM5WsLrLIBo/yinjjekmqWZikpjNqkamjdZvE90aogwD6m6M963Czaza4+aHMq
         tgABzU9AQr/VaBhURo/mx/YJcZhBamJUDFm1TuQkWDc/0cF7f/+MMhlKTElesVHk38ml
         iEUI0BMhc1jz22wGcGiPWa6d8WQ3O8WMMlXwZMQHYoNteKnBQPnNTv3ZbAeSgTMYNw7R
         A1jJCw+6ABZo+7nv91qkjOdryTPf6ZeTI4IS2fr+CvWoBnPi53P8JwFF3ep4DGP8uwSZ
         BxYvTrjxafsTSpOQXZvtSz+WnuGVCj9T4DbLwK7PvktJBiApbZxoO4Qk7zMCNV9VMqO0
         HcHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716490598; x=1717095398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aagzBVjJ/D8Y1ifoBBVOq9JBnR6o7BIp7hhz9J64Up4=;
        b=sQsUEk9O1Vm+Q3dBx5XJtYtwsmAZMvflLoDsa5SfUK8nwT5MBE513OD+dP0cT6no2C
         nQcQAQAIA68QsxUxpqZz/KfUbbh9DhPONzeSRGf1sn8rff+nK8r0xXSeiBqFN3bGEiKQ
         bE745ti1UzYuKq6IuTTZ+BlnTdJLtNUq/ydGsyYzoLvDXCHPlXKo5o9iqlhozKITxWvL
         USVyS4R4HUrVgdqyQrQMpWrrCdqLkZZF2iS+xUgarz58Qa2Jwfj1od9YLLVvEQZf+JFU
         G1mfSC8Q4W1jMOs2R/5Uw7q2li1Y2w5B27M8YVm0Qvws6QNla1GmGUlF365eyahmfK2A
         3khQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYxloLUhDaTGvT1lI5a0IfBJo+Iy6Zx6XaWF0WmZvz0sfHsemTgxPzXGJGh74gBtL7lvWPnNBkAyJesdiTODCcn8BuvYnfy57GnkUig5DUMzJHeEYfQei6vgrVo+6TfHAR8ve1WOVLtQ==
X-Gm-Message-State: AOJu0YwwUA5u6T17WkFUZlGUm3f9FPxkOyA3QCW13ZLL0sVqS6vfemj2
	e/40IJNg8Awu8x7poSkykXZLlODGUojbrFa7tyRwEfQhBXjHZ3w=
X-Google-Smtp-Source: AGHT+IHQtIRERiIjgF0uwBvsMBAGXfHwHjUykiz+HaZvwboLaRdKEhVREw2VDEvxpSx1HgPPVohtVA==
X-Received: by 2002:a05:600c:22d4:b0:41c:83aa:18b7 with SMTP id 5b1f17b1804b1-420fd35fcd1mr44947485e9.33.1716490598452;
        Thu, 23 May 2024 11:56:38 -0700 (PDT)
Received: from U4.lan ([2a02:810b:f40:4600:a453:b45b:e52a:2302])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3550c675581sm3965f8f.13.2024.05.23.11.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 11:56:38 -0700 (PDT)
From: Alex Bee <knaerzche@gmail.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alex Bee <knaerzche@gmail.com>
Subject: [PATCH 3/3] ARM: dts: rockchip: Add vpu nodes for RK3128
Date: Thu, 23 May 2024 20:56:33 +0200
Message-ID: <20240523185633.71355-4-knaerzche@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240523185633.71355-1-knaerzche@gmail.com>
References: <20240523185633.71355-1-knaerzche@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add nodes for the vpu and it's attached iommu which are both part of the
RK3128_PD_VIDEO powerdomain.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 arch/arm/boot/dts/rockchip/rk3128.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rk3128.dtsi b/arch/arm/boot/dts/rockchip/rk3128.dtsi
index fb98873fd94e..c11f55677841 100644
--- a/arch/arm/boot/dts/rockchip/rk3128.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3128.dtsi
@@ -252,6 +252,30 @@ power-domain@RK3128_PD_GPU {
 		};
 	};
 
+	vpu: video-codec@10106000 {
+		compatible = "rockchip,rk3128-vpu", "rockchip,rk3066-vpu";
+		reg = <0x10106000 0x800>;
+		interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "vepu", "vdpu";
+		clocks = <&cru ACLK_VDPU>, <&cru HCLK_VDPU>,
+			 <&cru ACLK_VEPU>, <&cru HCLK_VEPU>;
+		clock-names = "aclk_vdpu", "hclk_vdpu",
+			      "aclk_vepu", "hclk_vepu";
+		iommus = <&vpu_mmu>;
+		power-domains = <&power RK3128_PD_VIDEO>;
+	};
+
+	vpu_mmu: iommu@10106800 {
+		compatible = "rockchip,iommu";
+		reg = <0x10106800 0x100>;
+		interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru ACLK_VEPU>, <&cru HCLK_VDPU>;
+		clock-names = "aclk", "iface";
+		power-domains = <&power RK3128_PD_VIDEO>;
+		#iommu-cells = <0>;
+	};
+
 	vop: vop@1010e000 {
 		compatible = "rockchip,rk3126-vop";
 		reg = <0x1010e000 0x300>;
-- 
2.45.0


