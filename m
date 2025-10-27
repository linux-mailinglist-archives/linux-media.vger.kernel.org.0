Return-Path: <linux-media+bounces-45623-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25571C0BD92
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 06:44:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80A283BC238
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 05:43:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3DBA2D7812;
	Mon, 27 Oct 2025 05:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oj0Njm69"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C4C2D6612;
	Mon, 27 Oct 2025 05:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761543766; cv=none; b=DhW0Fa4bXzQeDEqewUtDRLFXdt8o/Va8ClfkGiRDn0CTZhnpQVrp9Y6K5xcX18F6KheAxc0IlGFKpFc2OsSR2DoGRQhWX6iJqrWuaFWiXzxIw3xXJD7NAASoHzxvJmpurZBryGcVGWhILRvfdG9K6wtB0eFMEuponuZgKedIks4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761543766; c=relaxed/simple;
	bh=44qN4cXbDRuGkOkp834OqQv4i7x65eWUBJtq27tjHD4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nnO8mn7CqYKdBuMduoG+6jhvp2S8At1yAgIYhwpMuUMmftEqhlB6wxljAEI0v8ERSAG+limNhwkpm0bob5TvgqVintcmZd4Iq7EI7s+aGNl8GUSN5KGlW4aNmKdB90avp7/cK6Q0C0olxNC6AiAsiUR9hNLbt7vwGqdKAWFBeRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oj0Njm69; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B0451C4CEFB;
	Mon, 27 Oct 2025 05:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761543765;
	bh=44qN4cXbDRuGkOkp834OqQv4i7x65eWUBJtq27tjHD4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=oj0Njm697xDGaxXE8xLeBb2PqytIbhJbwoIImZuEDlb7UA1u3tet7uw/1w6MGZ0cg
	 AadawIxZHYQM9hFthTAhOI7U60Yn5ktVfu+zaWFVvTG3JmBgyVQLxfm5vDzNhwv6Y3
	 7PpnMmnndLWcqhDG1hRJpWwczFBd6UTsWysRZmcxVsxT9Ty8++EmNqToFjEr1BoUd+
	 EqomDS5CzMJWyXYohLoJMkwzp5nO+xJNtWQNce2V2ZhpnAlNYZoomvs9PqklNxcJCC
	 o8HLP1Wjgbnh49odGswhM2TVh12++fM57QOm5uHlXEdvaXqpArt2SDL3eWAdzfI8D7
	 XU4OFK7ZfleTg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BF7DCCF9EB;
	Mon, 27 Oct 2025 05:42:45 +0000 (UTC)
From: Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org>
Date: Mon, 27 Oct 2025 13:42:38 +0800
Subject: [PATCH 2/3] dts: decoder: Support V4L2 stateless decoder dt node
 for S4
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-b4-s4-vdec-upstream-v1-2-620401813b5d@amlogic.com>
References: <20251027-b4-s4-vdec-upstream-v1-0-620401813b5d@amlogic.com>
In-Reply-To: <20251027-b4-s4-vdec-upstream-v1-0-620401813b5d@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761543762; l=1381;
 i=zhentao.guo@amlogic.com; s=20251024; h=from:subject:message-id;
 bh=LcY8cMBMKErZcyqsCWF2LS5nXjw5kG0pKkyeU/UPzbo=;
 b=Mr7z0YtZ2hQe/xIjZV57FO+a0pPguCGABpUUZmWIzYTlQHlNNnTTjWDxX3NM5t959kyXml7Zj
 HUjLajdPhxRD5iOtdXalisob0ScsnctG2q660clLZY8xN6O2Cy/XbKq
X-Developer-Key: i=zhentao.guo@amlogic.com; a=ed25519;
 pk=5yfDKrjreXwcAoEUsdtWafy6YN500upXp/CgtnXjLVU=
X-Endpoint-Received: by B4 Relay for zhentao.guo@amlogic.com/20251024 with
 auth_id=555
X-Original-From: Zhentao Guo <zhentao.guo@amlogic.com>
Reply-To: zhentao.guo@amlogic.com

From: Zhentao Guo <zhentao.guo@amlogic.com>

Add vcodec_dec to the s4 dtsi for the V4L2 stateless decoder driver

Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index 9d99ed2994df..028566f7423d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -853,5 +853,29 @@ emmc: mmc@fe08c000 {
 			no-sd;
 			status = "disabled";
 		};
+
+		video-codec@fe320000 {
+			compatible = "amlogic,s4-vcodec-dec";
+			reg = <0x0 0xfe320000 0x0 0x10000>,
+			      <0x0 0xfe036000 0x0 0x2000>;
+			reg-names = "dosbus",
+				    "dmcbus";
+			interrupts = <GIC_SPI 91 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 92 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 93 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "mailbox_0",
+					  "mailbox_1",
+					  "mailbox_2";
+			clocks = <&clkc_periphs CLKID_DOS>,
+				 <&clkc_periphs CLKID_VDEC_SEL>,
+				 <&clkc_periphs CLKID_HEVCF_SEL>;
+			clock-names = "vdec",
+				      "clk_vdec_mux",
+				      "clk_hevcf_mux";
+			power-domains = <&pwrc PWRC_S4_DOS_VDEC_ID>,
+					<&pwrc PWRC_S4_DOS_HEVC_ID>;
+			power-domain-names = "pwrc-vdec",
+					     "pwrc-hevc";
+		};
 	};
 };

-- 
2.42.0



