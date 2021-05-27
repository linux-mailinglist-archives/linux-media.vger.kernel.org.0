Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB75B3932BF
	for <lists+linux-media@lfdr.de>; Thu, 27 May 2021 17:46:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236931AbhE0PrM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 May 2021 11:47:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235835AbhE0PrD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 May 2021 11:47:03 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA949C06138A;
        Thu, 27 May 2021 08:45:28 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id gb17so804826ejc.8;
        Thu, 27 May 2021 08:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yiVuliP0he9GmuWyaOUYevvuXTeSG57Lbw/1w4RCrQU=;
        b=rxQWVocCI8O6BN5wWdHVpiE6z7OUa/zjiSsggSAMbigHOaDpmiI3r6F1M21jePE5+A
         42S6nlvHPfavPtFeEJO6tacCSUHOSaZfr/ZjmGsSWfJTtaV27eE1qrjgoKWMNBLJGaZE
         HgWJwAuAB7Y+5gijnJ5worJ3wXwdl/yZQPVPYHue3ihi8fzIKziESpswEkpoONNQ+XSv
         72UNW+TerNZqTKpEROORn2x7ydUHQf1TlM83o3dGwQylRWxDk0ndr2Add5GvMNzrUqnO
         vnI/tFYbcTqtGUJh+My91B/D/VLZ0UvxRmVyoepg1FCpjfajRxlR+u0Irsjhl4YYhbaT
         IrOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yiVuliP0he9GmuWyaOUYevvuXTeSG57Lbw/1w4RCrQU=;
        b=X7t4//LOnBgbCcTf7fPfTwNNZLgYn0jzuuoNqDIoyTFrMJK5YiGS4LAh+JWFCSsb+V
         sp1/PuYduOC+rNCzLTfwx1qYQUboVCENYxb+JWMYb9OQjrDszFQrv9ptmAlVtVH+14f5
         QcxdzommC7Bp4G5qMKEu4OBXohfDbkPmG0k0gc94VhgEtIhQXjclLLOclfcXIRekQdSJ
         IZczGrTcgn3UOoGumpsfm0Af3p0+U0jyX2BCLIMkhbA5nyryjcEPV9S29Moe8K05T1aQ
         Ea+UJcPyS8ZeHPQgdfSz19TigGGCrhbNDqcjTNgexZepq8TxM/EGvREFftq5i5sYAFiX
         JyfA==
X-Gm-Message-State: AOAM5335mvDEc6xjRIda0R8uZvGJIPQ8NsT1IYJ8Ezuzc2sgjTwvx/Sj
        2gl5Xv1H77RQWsJONzJ8lA==
X-Google-Smtp-Source: ABdhPJz4Lmp894N1oM4vHC/ZwNIqiobaYOumvcGSKuAuz3NsCfvxSBYDePq7R8qs9Fnfxvsu9RiYDA==
X-Received: by 2002:a17:906:1dd1:: with SMTP id v17mr4493149ejh.31.1622130327342;
        Thu, 27 May 2021 08:45:27 -0700 (PDT)
Received: from localhost.localdomain ([2a02:810b:f40:e00:fefd:4d98:c981:7f97])
        by smtp.googlemail.com with ESMTPSA id u6sm1178826ejr.55.2021.05.27.08.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 08:45:27 -0700 (PDT)
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
Subject: [PATCH v2 10/12] ARM: dts: rockchip: add vpu node for RK3036
Date:   Thu, 27 May 2021 17:44:53 +0200
Message-Id: <20210527154455.358869-11-knaerzche@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210527154455.358869-1-knaerzche@gmail.com>
References: <20210525152225.154302-1-knaerzche@gmail.com>
 <20210527154455.358869-1-knaerzche@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the vpu node and the node for the attached iommu for RK3036.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---

 Changes in v2:
 - added missing patch

 arch/arm/boot/dts/rk3036.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/rk3036.dtsi b/arch/arm/boot/dts/rk3036.dtsi
index 76ab663eccf7..f01529515ace 100644
--- a/arch/arm/boot/dts/rk3036.dtsi
+++ b/arch/arm/boot/dts/rk3036.dtsi
@@ -117,6 +117,27 @@ gpu: gpu@10090000 {
 		status = "disabled";
 	};
 
+	vpu: video-codec@10108000 {
+		compatible = "rockchip,rk3036-vpu";
+		reg = <0x10108000 0x800>;
+		interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "vdpu";
+		clocks = <&cru ACLK_VCODEC>, <&cru HCLK_VCODEC>;
+		clock-names = "aclk", "hclk";
+		iommus = <&vpu_mmu>;
+		power-domains = <&power RK3036_PD_VPU>;
+	};
+
+	vpu_mmu: iommu@10108800 {
+		compatible = "rockchip,iommu";
+		reg = <0x10108800 0x100>;
+		interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru ACLK_VCODEC>, <&cru HCLK_VCODEC>;
+		clock-names = "aclk", "iface";
+		power-domains = <&power RK3036_PD_VPU>;
+		#iommu-cells = <0>;
+	};
+
 	vop: vop@10118000 {
 		compatible = "rockchip,rk3036-vop";
 		reg = <0x10118000 0x19c>;
-- 
2.27.0

