Return-Path: <linux-media+bounces-13597-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5467A90DBB8
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 20:39:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C04A1C22672
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 18:39:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C8841607A3;
	Tue, 18 Jun 2024 18:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="MEMVXWoW"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2088715F3FE;
	Tue, 18 Jun 2024 18:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718735904; cv=none; b=ZJQxm3Waz1skCc2gfCCO7tDyVPSuiHvx6YfW4zLJ/lzdkbeNnvL/0ANSIQiZ5jnPFaYtitJGCSSNM1R7POK1Jb2R4VJ2M12LBBaD6v/esgHkq5KvihVR4Y+g1Hazdg3mfq2TOmbVMdjzFYxFifXRdlIUr/j+nmscG3Xzp/Xc3Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718735904; c=relaxed/simple;
	bh=cqxhYAbbW9RM1md+oyI3TV89a9uLQWQLY+gbU0lSp64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pnICvZxclaVZrJWMOtpQ5BMAupsFkwj9dT9lrZdLXzLBJHSoSzxea4+cq2pC660OaaUeCguD8atGpwGMOyjih/fy7lBXKP9KG0gzJ0esV3DmZL/kaFvbU4DigJ8D4KOpUBAERZFxErvS01InnsnhPMnNLHz0bapojYXuhi38r+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=MEMVXWoW; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718735898;
	bh=cqxhYAbbW9RM1md+oyI3TV89a9uLQWQLY+gbU0lSp64=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MEMVXWoWX6DVACd5wKvk58SUSRT7VswErtSexVBwD5U7bU8R5/5mEtQpUijEqEjQb
	 K1+8fYvfGdATRoHH+bABTPrSg8Gk9aVng8EfFfriRS1JHwidxYRyqX3KDKHsBsir0z
	 9j6kW282YGCvoN5e+9ad+1pHhu0aTpWAbG3gSruX71qvZPqNNi26KxNTzNmqPInIFp
	 QR6RABLEMcNchMblHSBKuse2WXCKjbsnQuyK+TaRZ+JY29N9JKLbnk4Gmz3tD5T802
	 Lc+ak/tk+S5TDSq1WL+R4TXRsxAakZwTFk+R7u6in3CwvMG7Ao4UyZmX6IqqerahcL
	 B9LyEVoGoWH4Q==
Received: from jupiter.universe (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 11236378219F;
	Tue, 18 Jun 2024 18:38:18 +0000 (UTC)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 35ED54800D1; Tue, 18 Jun 2024 20:38:17 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com,
	Hugh Cole-Baker <sigmaris@gmail.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v7 6/6] arm64: dts: rockchip: Add VPU121 support for RK3588
Date: Tue, 18 Jun 2024 20:18:37 +0200
Message-ID: <20240618183816.77597-7-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240618183816.77597-1-sebastian.reichel@collabora.com>
References: <20240618183816.77597-1-sebastian.reichel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jianfeng Liu <liujianfeng1994@gmail.com>

Enable Hantro G1 video decoder in RK3588's devicetree.

Tested with FFmpeg v4l2_request code taken from [1]
with MPEG2, H.264 and VP8 samples.

[1] https://github.com/LibreELEC/LibreELEC.tv/blob/master/packages/multimedia/ffmpeg/patches/v4l2-request/ffmpeg-001-v4l2-request.patch

Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
Tested-by: Hugh Cole-Baker <sigmaris@gmail.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
index dd85d4e55922..c0466982646f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
@@ -1159,6 +1159,27 @@ power-domain@RK3588_PD_SDMMC {
 		};
 	};
 
+	vpu121: video-codec@fdb50000 {
+		compatible = "rockchip,rk3588-vpu121", "rockchip,rk3568-vpu";
+		reg = <0x0 0xfdb50000 0x0 0x800>;
+		interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH 0>;
+		interrupt-names = "vdpu";
+		clocks = <&cru ACLK_VPU>, <&cru HCLK_VPU>;
+		clock-names = "aclk", "hclk";
+		iommus = <&vpu121_mmu>;
+		power-domains = <&power RK3588_PD_VDPU>;
+	};
+
+	vpu121_mmu: iommu@fdb50800 {
+		compatible = "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
+		reg = <0x0 0xfdb50800 0x0 0x40>;
+		interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH 0>;
+		clock-names = "aclk", "iface";
+		clocks = <&cru ACLK_VPU>, <&cru HCLK_VPU>;
+		power-domains = <&power RK3588_PD_VDPU>;
+		#iommu-cells = <0>;
+	};
+
 	vepu121_0: video-codec@fdba0000 {
 		compatible = "rockchip,rk3588-vepu121";
 		reg = <0x0 0xfdba0000 0x0 0x800>;
-- 
2.43.0


