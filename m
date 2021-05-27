Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B038B3932C2
	for <lists+linux-media@lfdr.de>; Thu, 27 May 2021 17:46:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235931AbhE0PrO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 May 2021 11:47:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235989AbhE0PrE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 May 2021 11:47:04 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47E57C06138F;
        Thu, 27 May 2021 08:45:30 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id i13so1378763edb.9;
        Thu, 27 May 2021 08:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gsjMFI5xRh9fU61vc6sGsHQBMH0/Rr505VNY3iesxmo=;
        b=fFfipLoo0fjZqkr6ftiPIsNGVbJvsb1to+BoH7WpsIIsOOKZRQNS50xCqVTdVMVewb
         3w+y/WIPOx2EUjAbo0yjhW+oX/vHkWMp/iVKRhcsLG/d4jAPWmSnToVZZZa37XRDle6f
         8WJYF9JmHck3vxXLK+6dh+ZJL2VHRFe2UeZn1sh0oHn8NSjKfaamKcDatWVeGFAOSwuX
         mldDwVusy1T3kSGT7GueSEIvz8QO3qzsCu6/7G/NqmTUIYwJyvR6dXuQ9PD3an1bILHd
         a78bklD2W9SvDiExsDohg2eupQKM3Vxn5el6Wn7mZ9oJcLpzdIESPkcAGN4apot/Wnq1
         DOyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gsjMFI5xRh9fU61vc6sGsHQBMH0/Rr505VNY3iesxmo=;
        b=o/RFgR9eWn3uS/jTvJbTOUFrmXdVwXufsQmXZ4uHIGcooa5SG2dnooTE0Ab5L/XEE+
         aoqTOZXVTeFJAduMx76eqgHefdHb91MTHM9uPVayRqli1OvjGxzo7LLUc31Qxc7zwNG7
         z8hHe0htdZqzsYuKRw/Q5ZTusUMgHmcDmf64DgyBNgpbM35ET0vdd4y1cH8gW9OKv5Ap
         7ZzH68GaecXcIwsTncX+/n61XqfEahUgaZoAuHivi8076heOLoYH3V20tVUT1wO0I3aK
         eZCjTds8tN9RiiaFGR1muplE9m7r+8hqOWa+IVFRBC6bu7RFxQv0Kvh8FAgKrCAwpfZX
         yXvg==
X-Gm-Message-State: AOAM531jF10Df0wugCdSsEAzsX+TZ6xu32TPDk1qQ8hGghUesaPrfLNL
        vWIxZLVqRPsVv1HFe8Xe/Q==
X-Google-Smtp-Source: ABdhPJwojdxE0cUsDMAT/63TtWD+CUhu/U6vgBc0kNVyTQ3DbDkSZXqmy0LgBNdCZOymj82MBHn1sQ==
X-Received: by 2002:a05:6402:2713:: with SMTP id y19mr4744066edd.59.1622130329228;
        Thu, 27 May 2021 08:45:29 -0700 (PDT)
Received: from localhost.localdomain ([2a02:810b:f40:e00:fefd:4d98:c981:7f97])
        by smtp.googlemail.com with ESMTPSA id u6sm1178826ejr.55.2021.05.27.08.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 08:45:28 -0700 (PDT)
From:   Alex Bee <knaerzche@gmail.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Lee Jones <lee.jones@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org
Cc:     Alex Bee <knaerzche@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 12/12] ARM: dts: rockchip: add vpu and vdec node for RK322x
Date:   Thu, 27 May 2021 17:44:55 +0200
Message-Id: <20210527154455.358869-13-knaerzche@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210527154455.358869-1-knaerzche@gmail.com>
References: <20210525152225.154302-1-knaerzche@gmail.com>
 <20210527154455.358869-1-knaerzche@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The VPU and the VDEC IP block of RK322x are the same as RK3399 has and
the drivers can be used as-is.

Add the respective nodes to the device tree.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---

 Changes in v2:
 - squashed previously 2 commits for vdec/vpu
 - moved power-domains property after iommu property

 arch/arm/boot/dts/rk322x.dtsi | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/rk322x.dtsi b/arch/arm/boot/dts/rk322x.dtsi
index 42033909c606..c0d8f4645937 100644
--- a/arch/arm/boot/dts/rk322x.dtsi
+++ b/arch/arm/boot/dts/rk322x.dtsi
@@ -612,6 +612,18 @@ gpu: gpu@20000000 {
 		status = "disabled";
 	};
 
+	vpu: video-codec@20020000 {
+		compatible = "rockchip,rk3228-vpu", "rockchip,rk3399-vpu";
+		reg = <0x20020000 0x800>;
+		interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI  9 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "vepu", "vdpu";
+		clocks = <&cru ACLK_VPU>, <&cru HCLK_VPU>;
+		clock-names = "aclk", "hclk";
+		iommus = <&vpu_mmu>;
+		power-domains = <&power RK3228_PD_VPU>;
+	};
+
 	vpu_mmu: iommu@20020800 {
 		compatible = "rockchip,iommu";
 		reg = <0x20020800 0x100>;
@@ -620,7 +632,19 @@ vpu_mmu: iommu@20020800 {
 		clock-names = "aclk", "iface";
 		power-domains = <&power RK3228_PD_VPU>;
 		#iommu-cells = <0>;
-		status = "disabled";
+	};
+
+	vdec: video-codec@20030000 {
+		compatible = "rockchip,rk3228-vdec", "rockchip,rk3399-vdec";
+		reg = <0x20030000 0x480>;
+		interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru ACLK_RKVDEC>, <&cru HCLK_RKVDEC>,
+			 <&cru SCLK_VDEC_CABAC>, <&cru SCLK_VDEC_CORE>;
+		clock-names = "axi", "ahb", "cabac", "core";
+		assigned-clocks = <&cru SCLK_VDEC_CABAC>, <&cru SCLK_VDEC_CORE>;
+		assigned-clock-rates = <300000000>, <300000000>;
+		iommus = <&vdec_mmu>;
+		power-domains = <&power RK3228_PD_RKVDEC>;
 	};
 
 	vdec_mmu: iommu@20030480 {
@@ -631,7 +655,6 @@ vdec_mmu: iommu@20030480 {
 		clock-names = "aclk", "iface";
 		power-domains = <&power RK3228_PD_RKVDEC>;
 		#iommu-cells = <0>;
-		status = "disabled";
 	};
 
 	vop: vop@20050000 {
-- 
2.27.0

