Return-Path: <linux-media+bounces-39700-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C78BB23B49
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 23:52:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1403C720EB0
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 21:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0E9B2E7BD2;
	Tue, 12 Aug 2025 21:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SsCh++08"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD1F2E7BB8;
	Tue, 12 Aug 2025 21:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755035309; cv=none; b=trqCXjgYYAENdSxB3iHmdFBFj5j6/yrryYEXBSjNONitmZNtolskEVRUwFc3IQBy8J9JwYMC+CPQcJpl0FgQvhhqmvTiM9aEK3wk297fmvP+ZQiI4H/BGdZbv5qcQBt67L3o42ya+NxkIveSCgyQY6Tzl/SEJOj9zzOEcvBii+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755035309; c=relaxed/simple;
	bh=w7k9w4ZekQGz6lOWcEWmQp+qbPKROd/tHGoFsIB/Jsk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JAGyg4Xa62tKA7mVBY46n7JhZAio4m2YaXZZ59n6CrBUqtsDJ01DTpWDXI2n644JJ2jcPkyvBcMV/yc7D3hqk/JwyJiPK00kJT6XSc13B2sepHgvhSAcFnG9ECilvmqe9Hd5Ezg/D6IXYWCW+yGkULd8ZgPKVVkq5JX5T0usuMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SsCh++08; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 3E2E31123;
	Tue, 12 Aug 2025 23:47:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755035253;
	bh=w7k9w4ZekQGz6lOWcEWmQp+qbPKROd/tHGoFsIB/Jsk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SsCh++08O1o5kx96gsqNPVtqlYmqp2b/p52qzPZxcfb6fidxJ+rps72JbvZRGzquw
	 IcJroM4d9+8pyLy1U7fM8Te5UNkVaBLJ5YSrMcPPqWMh68ZpSUd4n7d2T1fZEkxMgc
	 T+SlmcDCeKQ3WC6eOt/Njo6myOIdq988ZDAV2PmY=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 64/72] ARM: dts: samsung: exynos4412-midas: Replace clock-frequency in camera sensor node
Date: Wed, 13 Aug 2025 00:46:12 +0300
Message-ID: <20250812214620.30425-65-laurent.pinchart@ideasonboard.com>
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
refactoring in the driver ("media: i2c: s5k6a3: Use V4L2 legacy sensor
clock helper").

Without the driver change, when the clock-frequency property is not set,
the driver defaults to a fixed 24MHz value. That is the frequency set in
DT for this board, so the resulting clock frequency does not change.
---
 arch/arm/boot/dts/samsung/exynos4412-midas.dtsi | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4412-midas.dtsi b/arch/arm/boot/dts/samsung/exynos4412-midas.dtsi
index 05ddddb565ee..3cd027a99369 100644
--- a/arch/arm/boot/dts/samsung/exynos4412-midas.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4412-midas.dtsi
@@ -638,10 +638,13 @@ image-sensor@10 {
 		svdda-supply = <&cam_io_reg>;
 		svddio-supply = <&ldo19_reg>;
 		afvdd-supply = <&ldo19_reg>;
-		clock-frequency = <24000000>;
+
 		/* CAM_B_CLKOUT */
 		clocks = <&camera 1>;
 		clock-names = "extclk";
+		assigned-clocks = <&camera 1>;
+		assigned-clock-rates = <24000000>;
+
 		gpios = <&gpm1 6 GPIO_ACTIVE_LOW>;
 
 		port {
-- 
Regards,

Laurent Pinchart


