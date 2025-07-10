Return-Path: <linux-media+bounces-37357-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A26B00A7F
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 19:49:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 63D2F1774F1
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 17:49:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D1D32F272A;
	Thu, 10 Jul 2025 17:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CFWNszdl"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD07199BC;
	Thu, 10 Jul 2025 17:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169745; cv=none; b=fr5g/lpiCT7pZg4YNx85E5qA/PIgmIBwZVCKrrbCktWzLNEqIuEsLK0xc6FyCl6ce9haA21hV/WhZaNssrxpVi2zlErC3+jUZNQ9DgU/4o03QVurAKJexhpzPL0gGuQWPI1XaumMuE4FQQQQ1waiyaDu+j7z7KyLMcpRAox4RI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169745; c=relaxed/simple;
	bh=8aMoKZ1sOL5EVDzlkK8be+F/TE619YYW1a1ZtVYqOhs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ejr0ODZUyY9ZU9P7kaXuqFaKZEXCAMZx2h9/HqjCHiTsuwZaL1Nnpt99Vi2/2v+KeX6Pvr1e/F88Rn2cJqSZc/dwkbCNZyC9wkdrbzhW14e1JrUHkd1SfT8Vy6m3GSTbLjIYv7+Tluh0h3hUNa5tdC9bses+Z7v32rqJXWvk4do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CFWNszdl; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id B15AEC0B;
	Thu, 10 Jul 2025 19:48:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752169712;
	bh=8aMoKZ1sOL5EVDzlkK8be+F/TE619YYW1a1ZtVYqOhs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CFWNszdlfczeQzLNs7J34srOmd0hF5CwzvIhNmyBKPzeyUDJQqcZ6xGWXlCtoCdcy
	 4cwNX7v/3cm+kyY+o1lPu/RiRIcdsBolIX6utGV7yrZGJCPXdToUP11tv9zSb0XXLN
	 HrAy4nRnxRa9BzGkCb9yhMxruIIw49eLND1GXhP8=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 14/72] arm64: dts: renesas: rzg2l-smarc: Drop clock-frequency from camera sensor node
Date: Thu, 10 Jul 2025 20:47:10 +0300
Message-ID: <20250710174808.5361-15-laurent.pinchart@ideasonboard.com>
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
the assigned-clocks and assigned-clock-rates properties. As the clock
source for the sensor is a fixed-frequency oscillator, simply drop the
clock-frequency.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/rz-smarc-cru-csi-ov5645.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/rz-smarc-cru-csi-ov5645.dtsi b/arch/arm64/boot/dts/renesas/rz-smarc-cru-csi-ov5645.dtsi
index c5bb63c63b47..4d2b0655859a 100644
--- a/arch/arm64/boot/dts/renesas/rz-smarc-cru-csi-ov5645.dtsi
+++ b/arch/arm64/boot/dts/renesas/rz-smarc-cru-csi-ov5645.dtsi
@@ -64,7 +64,6 @@ ov5645: camera@3c {
 		compatible = "ovti,ov5645";
 		reg = <0x3c>;
 		clocks = <&ov5645_fixed_clk>;
-		clock-frequency = <24000000>;
 		vdddo-supply = <&ov5645_vdddo_1v8>;
 		vdda-supply = <&ov5645_vdda_2v8>;
 		vddd-supply = <&ov5645_vddd_1v5>;
-- 
Regards,

Laurent Pinchart


