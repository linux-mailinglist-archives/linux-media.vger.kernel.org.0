Return-Path: <linux-media+bounces-37348-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A4FB00A64
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 19:49:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57A133AD886
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 17:48:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DCE42F19A6;
	Thu, 10 Jul 2025 17:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="d9M65P4K"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795AB2F19A0;
	Thu, 10 Jul 2025 17:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169733; cv=none; b=laFH10PUC1DkJ886x7TJVMv9dQ+NGKhhTvNwJrlS7HyqLnmjbFmkBXevrgfCqLSrSkvJpB6VG/rKs4iwGToC0M3H2MFVN7Rsr7g+CAwoaMAeVaOopSlVKIFUJ3HRRZIwpqdo2thRIHmK7w3o/kGz2qsYIFR5BvkNOziL2Kk9F00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169733; c=relaxed/simple;
	bh=9jtrYa6P00ldve90oHbofklqOSGiI8pmg56lHpBtkKE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LY8/STtjflZqWW+MRNu2RnnVFhlX2UcMKpVOrOYFI30hALtMUFMA+RcuzAxybGhXJCaEu1cOHI3oG2/VgD5UTKUCxpijus0qvE1TT7WHrTCnVS7MYsI2KJEDDxFCnnDDECVIQiVLE06EupRD4jA0Xz2ksNxxo5oIeP1fIjQdGrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=d9M65P4K; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id C3ADE1AD5;
	Thu, 10 Jul 2025 19:48:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752169698;
	bh=9jtrYa6P00ldve90oHbofklqOSGiI8pmg56lHpBtkKE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d9M65P4K7iA3g7oy60nZGoYQepvDm/GbSp9hO9Ha3x1R/WVzriz2ItwmnnDdf2gL7
	 7JNDOaVq44c/T0ao6zqsH/3q/05wZUlqqiLPpzOxjcvGAi10oQ536EhsVGytEcVcd8
	 toeUtxXr4/RfBo15RjnWcGgt7f5lxWLbfNKeBG9Q=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 05/72] ARM: dts: nxp: imx6qdl-pico: Replace clock-frequency in camera sensor node
Date: Thu, 10 Jul 2025 20:47:01 +0300
Message-ID: <20250710174808.5361-6-laurent.pinchart@ideasonboard.com>
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
 arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi
index c39a9ebdaba1..7821404687f4 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi
@@ -232,8 +232,11 @@ camera@3c {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_ov5645>;
 		reg = <0x3c>;
+
 		clocks = <&clks IMX6QDL_CLK_CKO2>;
-		clock-frequency = <24000000>;
+		assigned-clocks = <&clks IMX6QDL_CLK_CKO2>;
+		assigned-clock-rates = <24000000>;
+
 		vdddo-supply = <&reg_1p8v>;
 		vdda-supply = <&reg_2p8v>;
 		vddd-supply = <&reg_1p5v>;
-- 
Regards,

Laurent Pinchart


