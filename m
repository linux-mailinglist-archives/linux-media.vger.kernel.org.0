Return-Path: <linux-media+bounces-39699-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D79F3B23B3D
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 23:51:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A1FDE583B3C
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 21:50:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D60072E7BBB;
	Tue, 12 Aug 2025 21:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JitiK6Ru"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43542E7653;
	Tue, 12 Aug 2025 21:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755035307; cv=none; b=KnFAxUPmfEEhOKhJGnmpUL6OrNVPBMsuafXaOVmen6CYGDCHY/CHTBYPcRNtOt/PRrq76uTDToxJlrqFk+7EDokGXPxAsVPodWrLbmySxZBsfnx6fuk8KacbjOcqyV4dx25qd7AwmHYJNt0thfO+GxyZZqI9zHytmCLJqIe35Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755035307; c=relaxed/simple;
	bh=th+Tt+i8GHZE/TJ0BOOsHI2d+wou8zSZ8hqvcIg3cO8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cgRNKBtBOikLm0FvdpYRrjNvmzTkGZlXBkJvKGiJurDx+hCVpqjdovTSSoKz7Eq6Svlu012mBFz9MI9195bGBvKZuSzkSCW9I5H3UaO7316AOuQ3b1qyZbh09UIDaS5fLBgQ0RRE+/e6jciHJ2iWEUCRLzjevJ8eXoWrlAhcpkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JitiK6Ru; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 9AAB24A4;
	Tue, 12 Aug 2025 23:47:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755035251;
	bh=th+Tt+i8GHZE/TJ0BOOsHI2d+wou8zSZ8hqvcIg3cO8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JitiK6RuAVuFt7rsxxZN2p8ABjDKKpn18Xj2iOMIcj5mIG3SBvpNM4vsNpWkTveS7
	 OcWx1ZlWq5WNTVX/ruB7+8J/btpwhBpO8Eh5BMVIefeZ9BNF8zXCiMj+iNHmBOzNsS
	 jvLk8RNnTjHTNBGsoetz8p2f7rwjGep8v3XPPJfU=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 63/72] ARM: dts: samsung: exynos4210-i9100: Replace clock-frequency in camera sensor node
Date: Wed, 13 Aug 2025 00:46:11 +0300
Message-ID: <20250812214620.30425-64-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250812214620.30425-1-laurent.pinchart@ideasonboard.com>
References: <20250812214620.30425-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The clock-frequency for camera sensors has been deprecated in favour of
the assigned-clocks and assigned-clock-rates properties. Replace it in
the device tree.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
This patch can be merged independently from the previous clock handling
refactoring in the driver ("media: i2c: s5k5baf: Use V4L2 legacy sensor
clock helper").

Without the driver change, when the clock-frequency property is not set,
the driver defaults to a fixed 24MHz value. That is the frequency set in
DT for this board, so the resulting clock frequency does not change.
---
 arch/arm/boot/dts/samsung/exynos4210-i9100.dts | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4210-i9100.dts b/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
index df229fb8a16b..43cee5e26a9a 100644
--- a/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
+++ b/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
@@ -169,11 +169,14 @@ image-sensor@2d {
 			vdda-supply = <&cam_io_en_reg>;
 			vddreg-supply = <&vt_core_15v_reg>;
 			vddio-supply = <&vtcam_reg>;
+
 			clocks = <&camera 0>;
 			clock-names = "mclk";
+			assigned-clocks = <&camera 0>;
+			assigned-clock-rates = <24000000>;
+
 			stbyn-gpios = <&gpl2 0 GPIO_ACTIVE_LOW>;
 			rstn-gpios = <&gpl2 1 GPIO_ACTIVE_LOW>;
-			clock-frequency = <24000000>;
 
 			port {
 				s5k5bafx_ep: endpoint {
-- 
Regards,

Laurent Pinchart


