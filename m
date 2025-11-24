Return-Path: <linux-media+bounces-47641-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A911C7EE4B
	for <lists+linux-media@lfdr.de>; Mon, 24 Nov 2025 04:33:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CB47E4E2144
	for <lists+linux-media@lfdr.de>; Mon, 24 Nov 2025 03:32:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96BB429BDB1;
	Mon, 24 Nov 2025 03:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LIvqdsee"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5B12853F7;
	Mon, 24 Nov 2025 03:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763955155; cv=none; b=OMlcFKOqP6KLCzDDfhmqmAMLtx7DDjr3qaO8gMol3iJLeiZ530ZrZczyLzGIwczBP4jlEEz5PqluwSPbqqK5NAD48OBWrfbpd4DxYEodXF3WUsk4zWskB0b+/QyxtG5040PvDa43GINVCutchoSsX8x/545vtTPffqVbnS+yCHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763955155; c=relaxed/simple;
	bh=nQMpas0P68zqe+jsuAUQuc78OljFGZeSHfJ158LMKlg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bB76r+S2ypRz3M712p7iKKJMFE3MA6Yu7DhILUDz42Nb6NCCoJlXZ9SkrcSbJU03uCll7S1VsdVcuD8FYZGqbUROVn4ppszHtDQfbe8jvpRGzxFNj+QqRhoGNWdo1kEjYhvn8YsHqYkKCKWQbTTdbdITVhYmvck6g+ZaN3moqcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LIvqdsee; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 94261C2BC9E;
	Mon, 24 Nov 2025 03:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763955154;
	bh=nQMpas0P68zqe+jsuAUQuc78OljFGZeSHfJ158LMKlg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LIvqdsee1woYL1Q8LlyGqPI8UWC+R3TubGMryLxV0Lbrjw1PUqH1+0rJGHSYq1tzW
	 eDifwaEwSBYALohqMjo5p22/686Mjw832VBupIP5TTaoZtBobhGXBLaAftNEjtFIco
	 dX5gzqMTJxLrX2RrCe1r+154pMsLSTq0Is4iJPJ9K7vm1I1fDlSw3Iu567FfLMI9N2
	 OoNfNVbVdk2YMATkWV2uyfnW7+vyqnaGpvhI0K2dTG39slf9Mw9tFBCKXOEZ1yRDwk
	 05P/M7Mfirm+JfS8T2VyNAcKtQVFyZEVfqAS+qgUJnEMyhdg352PJA+QpsmmO8+lqT
	 BT3og9flY3swA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8685BCFD31F;
	Mon, 24 Nov 2025 03:32:34 +0000 (UTC)
From: Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org>
Date: Mon, 24 Nov 2025 11:32:19 +0800
Subject: [PATCH RFC v2 3/3] arm64: dts: amlogic: Add video decoder driver
 support for S4 SOCs
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251124-b4-s4-vdec-upstream-v2-3-bdbbce3f11a6@amlogic.com>
References: <20251124-b4-s4-vdec-upstream-v2-0-bdbbce3f11a6@amlogic.com>
In-Reply-To: <20251124-b4-s4-vdec-upstream-v2-0-bdbbce3f11a6@amlogic.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, Zhentao Guo <zhentao.guo@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763955152; l=1441;
 i=zhentao.guo@amlogic.com; s=20251024; h=from:subject:message-id;
 bh=ipvSyoCuAjlj5iGd/O8ZvsuGOB2B3dXxp1S6BN3SOc4=;
 b=+1wPmnRCbaMUs0SfXj44FPENcjNu8W4k/F7Tgy5s0bjQiMcfnJkYcBKCv5+xdb+cSPZT7jend
 eHRRpV6VIQSA8ZOxSqEmAJO5YdnW3ZVx3xXwZdX4csth3oNHl+54ezg
X-Developer-Key: i=zhentao.guo@amlogic.com; a=ed25519;
 pk=5yfDKrjreXwcAoEUsdtWafy6YN500upXp/CgtnXjLVU=
X-Endpoint-Received: by B4 Relay for zhentao.guo@amlogic.com/20251024 with
 auth_id=555
X-Original-From: Zhentao Guo <zhentao.guo@amlogic.com>
Reply-To: zhentao.guo@amlogic.com

From: Zhentao Guo <zhentao.guo@amlogic.com>

Add vcodec node to enable Amlogic V4L2 stateless video decoder
support.

Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index 9d99ed2994df..80f1b92492a5 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -853,5 +853,32 @@ emmc: mmc@fe08c000 {
 			no-sd;
 			status = "disabled";
 		};
+
+		canvas: video-lut@fe036048 {
+			compatible = "amlogic,canvas";
+			reg = <0x0 0xfe036048 0x0 0x14>;
+		};
+
+		video-codec@fe320000 {
+			compatible = "amlogic,s4-vcodec-dec";
+			reg = <0x0 0xfe320000 0x0 0x10000>,
+			      <0x0 0xfe036000 0x0 0x20>;
+			amlogic,canvas = <&canvas>;
+			reg-names = "dos",
+				    "dmc";
+			interrupts = <GIC_SPI 91 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 92 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 93 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&clkc_periphs CLKID_DOS>,
+				 <&clkc_periphs CLKID_VDEC_SEL>,
+				 <&clkc_periphs CLKID_HEVCF_SEL>;
+			clock-names = "vdec",
+				      "clk_vdec_mux",
+				      "clk_hevcf_mux";
+			power-domains = <&pwrc PWRC_S4_DOS_VDEC_ID>,
+					<&pwrc PWRC_S4_DOS_HEVC_ID>;
+			power-domain-names = "vdec",
+					     "hevc";
+		};
 	};
 };

-- 
2.42.0



