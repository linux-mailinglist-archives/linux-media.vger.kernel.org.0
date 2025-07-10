Return-Path: <linux-media+bounces-37356-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 09975B00A90
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 19:50:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6B6FD7BC412
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 17:48:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E98832F0E49;
	Thu, 10 Jul 2025 17:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rqh96iGt"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64CB2F2374;
	Thu, 10 Jul 2025 17:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169744; cv=none; b=usLBOEPxurXDf0FCi8cWdfNVaFHS5K34FP72eVbPzW0yJpQRSU+oS8YKuSdFGjyhzx1eiW+PnWuW0td/had9uyns1Fuzm/OLHcPlkOvsD+2NrI+oiZq2P8SnwheU+CJiNazJBHfslpT5U/jjV0z23PWtgYBVg2A3jTSbboRJWCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169744; c=relaxed/simple;
	bh=GdCcUcIRzR6qeWTvnBkFBb2Nq5DE/1fLwDmcWj6RG0g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HdgA3NTC5MGeJFRx3jE87d6zlLnEsYOcFKNB+Wtfj7lehldnXiB25b4pr5a+lYmcTDGHODm65rdS6dJP82dDP4tD8pWfQ0w6ugu4BuqoFQhyayQ8R4bEPx8uffKkjsbbGz7++MxzaOclnU2PNAJEhpHaT4xvLa6KcxPXYhwkUnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rqh96iGt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 1C4F5111D;
	Thu, 10 Jul 2025 19:48:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752169711;
	bh=GdCcUcIRzR6qeWTvnBkFBb2Nq5DE/1fLwDmcWj6RG0g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rqh96iGtbXt9WMOeeVY+WUU2snZf+XEAr2CqBCH48eiFx2CSc9urFasobqKs3Zv/e
	 yI/2pTUISqvaX49Qjyu7cwEUB0C6nM/NTVYFyLPFuaKQk7k+4eAFGj+q37g4qCGG4j
	 2hbhBsaZyoGzBz5ERyt3nVirZaUw+eBNs20tvFms=
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
Subject: [PATCH 13/72] arm64: dts: renesas: aistarvision-mipi-adapter-2.1: Drop clock-frequency from camera sensor node
Date: Thu, 10 Jul 2025 20:47:09 +0300
Message-ID: <20250710174808.5361-14-laurent.pinchart@ideasonboard.com>
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
 arch/arm64/boot/dts/renesas/aistarvision-mipi-adapter-2.1.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/aistarvision-mipi-adapter-2.1.dtsi b/arch/arm64/boot/dts/renesas/aistarvision-mipi-adapter-2.1.dtsi
index 7cb5c958aece..529388f6bf2b 100644
--- a/arch/arm64/boot/dts/renesas/aistarvision-mipi-adapter-2.1.dtsi
+++ b/arch/arm64/boot/dts/renesas/aistarvision-mipi-adapter-2.1.dtsi
@@ -66,7 +66,6 @@ ov5645: ov5645@3c {
 		compatible = "ovti,ov5645";
 		reg = <0x3c>;
 		clocks = <&osc25250_clk>;
-		clock-frequency = <24000000>;
 		vdddo-supply = <&ov5645_vdddo_1v8>;
 		vdda-supply = <&ov5645_vdda_2v8>;
 		vddd-supply = <&ov5645_vddd_1v5>;
-- 
Regards,

Laurent Pinchart


