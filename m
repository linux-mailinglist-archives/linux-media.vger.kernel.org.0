Return-Path: <linux-media+bounces-39708-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8A5B23B50
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 23:52:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC74E587C26
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 21:50:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BB722EAB66;
	Tue, 12 Aug 2025 21:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZjuSKZ1r"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272812D73AC;
	Tue, 12 Aug 2025 21:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755035321; cv=none; b=oE8ckkTC0LS91MMBt4RfkCPP5pgFSFB3pGKGreyyX+MtMWHxU/W+9Y5Oq82FJ9xhJEz93dZ/c/GSi7gyVT3C4VyA4wZpCzeVT54LVajqrqY5ynRU22GtvsrASeGfYIfpTLNEgtWPFSrrp2eagSTQJ4caYFdwLEh4QtCTqCC41cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755035321; c=relaxed/simple;
	bh=80rQPWmlu9tmKbKo+UTwIGr+ObjO6jsfeyRI+3DLmLE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=frvcRayzjTeqWSsoSqNeo/sROvtt/MifU7n/vtYoTtyrplvApoDdOA/wrFc1vsOmMjRv6zVjln0mLKYNHUHBm35QkrclqvEXLplD1fCq8yRar8B0thsAdHmT0XyIh/oT0fagL89BxoLND52hlOf42VoxelkovCSBRqaVNTjx0Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZjuSKZ1r; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id CEF781123;
	Tue, 12 Aug 2025 23:47:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755035266;
	bh=80rQPWmlu9tmKbKo+UTwIGr+ObjO6jsfeyRI+3DLmLE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZjuSKZ1r7GmsC7usShNQ0ok9kae7BvCtQC27530Rl6P8ly26fkjppZIhNK38BQfny
	 I/v3oRp+XpFTLpYSgWWyFxVVRfUzBrsjWZr026ZbvxpdRt0+RiTX3vMeHl0esCu5Q0
	 jk/ICe+6XS9/TfD/Q/mDqjQtFLmSAxMnK8vS6QDY=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 72/72] arm64: dts: renesas: rzg2l-smarc: Drop clock-frequency from camera sensor node
Date: Wed, 13 Aug 2025 00:46:20 +0300
Message-ID: <20250812214620.30425-73-laurent.pinchart@ideasonboard.com>
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
the assigned-clocks and assigned-clock-rates properties. As the clock
source for the sensor is a fixed-frequency oscillator, simply drop the
clock-frequency.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This patch depends on "media: i2c: ov5645: Use V4L2 legacy sensor clock
helper", which we tentatively plan to merge for v6.18. It should
therefore be postponed to v6.19.
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


