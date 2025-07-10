Return-Path: <linux-media+bounces-37350-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 376ECB00A6D
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 19:49:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F41A01C4016B
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 17:49:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 482AC2F1FC6;
	Thu, 10 Jul 2025 17:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fZiyHS4D"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1912F19B2;
	Thu, 10 Jul 2025 17:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169735; cv=none; b=hrgIy7v52lI2aMBDXTHd5vDm7KmKYLHOKvPlNLlSmOHAgPanehX+01TgaAVjtCTmVfWl+URGubzodoJczrOw3IeKHZY4CRR9gDkA5dXKvKp7wzU4LzeH/xQsB701b4VZsSjwScjs3XAACbZggAbE/egd9TIW/PoSDtsx3XnGdMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169735; c=relaxed/simple;
	bh=H6gCI+dSz+/ay7cOpe6r3BToafJuOw8KI1SU2yBdPMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lYmLI05zQpdJOQrrbNZrJ/BZECISkut6dTF36WzAYIIr8p9XwAD4dnd0pnW1HItsv2oxkjRDWpqO079G8tOMUNTC930rUCoqE4P16aRhYzcfCIRGE+OWafUfUvnO9mmWXIc7XusB2d7H5Q3bnBmkF5wgzdpqOr1GXT/ajggoIT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fZiyHS4D; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 34DD7B2B;
	Thu, 10 Jul 2025 19:48:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752169701;
	bh=H6gCI+dSz+/ay7cOpe6r3BToafJuOw8KI1SU2yBdPMQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fZiyHS4DPKa9s6MtDpAXtEWnGxHYpTY8o2hp6eU0tzyS+FvNj6KmQ5VJYwidBtRXj
	 6iLXe20SLrA0gb7PonqirTlagqHjPjbOtr1rWJwUlG2ZQaOLwpHCuVWKuTEUvHOgWs
	 9etmHBOxQH4CmRLetq1jY+C0u6DHCQY/3lNWFHLA=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH 07/72] ARM: dts: samsung: exynos4210-i9100: Replace clock-frequency in camera sensor node
Date: Thu, 10 Jul 2025 20:47:03 +0300
Message-ID: <20250710174808.5361-8-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
References: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
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
 arch/arm/boot/dts/samsung/exynos4210-i9100.dts | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4210-i9100.dts b/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
index 0d8495792a70..cdc768a87757 100644
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


