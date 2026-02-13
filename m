Return-Path: <linux-media+bounces-52682-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJFMHCSzjmmvDwEAu9opvQ
	(envelope-from <linux-media+bounces-52682-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 06:14:12 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB39132F52
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 06:14:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8701230B94BE
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 05:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E2552749DF;
	Fri, 13 Feb 2026 05:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tqSUYwmn"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9585321B9F5;
	Fri, 13 Feb 2026 05:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770959588; cv=none; b=KCHIZwPpcKR8w7Y7Vg55A60Ik0qr+yiHgWhaGq8cHnk2hhN5z2+JR9XMjQtzzWMBHJvWqOaUiHYR/ViV9gc7sTwK48Kd00iL85aCW45GyR5wpnNdEbcjD8MqPnb6CBdKEZ2wzRmR+F+GxGU+vodjSLH6xCQe0CncCgwJUSG3Ajs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770959588; c=relaxed/simple;
	bh=Zy41UwtVc78Y7hlHNkNvuMf7hnbnIw6ZTXc0eFogMko=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i6j7izA9yu7NIatcCm/v/GJ2CUxtzDA34JuVVooUVt+2e+kw+lsuadFsGDGEfpVgS8/f4z8I5xkaUQadKzDLi5KbHu2OsavZKnSWT8ZEgNLrXnw/a8Ku+TI0o2vgDi/loT/J9kPn/jk+8WUIhED9Uu0Xf4sP7ZxTlC97rfc0lFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tqSUYwmn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6B31BC19424;
	Fri, 13 Feb 2026 05:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770959588;
	bh=Zy41UwtVc78Y7hlHNkNvuMf7hnbnIw6ZTXc0eFogMko=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tqSUYwmnfOnHODzJdY7HHNEnQS6HyulkCg2dqoyAHX2Bs3MeGEizaFiW5PKNSnbi/
	 nsuTAr0jq8OgIvNIn9mGg3wkUQE3KDf8b2Di3+kX7B7sK2qp1Hv6f2dRXRhzUeIffk
	 P8xOrR/JBOraWmCoUvLWLYr6scEK6djF7qp1pSLIbODsUM6m2ojDRt0CUAu6EybbAN
	 Ai7tZYh8H2k8bTmDZEiwHE1Szak2xxerRt5gcROg41z1S4biSUkl2SJ9p9hRw7B5TL
	 u7e5KdrudueTwzAk98t0Ua6eZERBCGBnIdO2unAVpliKxxVvAyXJ9Eujw/dbzTJVVV
	 ys3VaOLeNhiCQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59F27EF48D3;
	Fri, 13 Feb 2026 05:13:08 +0000 (UTC)
From: Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org>
Date: Fri, 13 Feb 2026 13:12:40 +0800
Subject: [PATCH RFC v4 3/4] arm64: dts: amlogic: Add video decoder driver
 support for S4 SOCs
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-b4-s4-vdec-upstream-v4-3-c7112d00d662@amlogic.com>
References: <20260213-b4-s4-vdec-upstream-v4-0-c7112d00d662@amlogic.com>
In-Reply-To: <20260213-b4-s4-vdec-upstream-v4-0-c7112d00d662@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770959584; l=1534;
 i=zhentao.guo@amlogic.com; s=20251024; h=from:subject:message-id;
 bh=IzNXt2+VyFRVs1Y87t2pUqlUvtHK8Yc5ii/YgU+Xf3g=;
 b=QTs6TPy9KkrYLEDduY0sEmpyT8mclN0g9T3FDQX6AkMEGZVhX3DxD3eWySM4WD/SCcXjaqfRJ
 smAF/WbBOXuB0P17sOpMiuFlbD+b3m5Rz+8nxL6Nbk5rhu4ymvA+P1L
X-Developer-Key: i=zhentao.guo@amlogic.com; a=ed25519;
 pk=5yfDKrjreXwcAoEUsdtWafy6YN500upXp/CgtnXjLVU=
X-Endpoint-Received: by B4 Relay for zhentao.guo@amlogic.com/20251024 with
 auth_id=555
X-Original-From: Zhentao Guo <zhentao.guo@amlogic.com>
Reply-To: zhentao.guo@amlogic.com
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52682-lists,linux-media=lfdr.de,zhentao.guo.amlogic.com];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,baylibre.com,googlemail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[zhentao.guo@amlogic.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fe320000:email,fe08c000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,amlogic.com:mid,amlogic.com:email,amlogic.com:replyto,fe036048:email]
X-Rspamd-Queue-Id: CAB39132F52
X-Rspamd-Action: no action

From: Zhentao Guo <zhentao.guo@amlogic.com>

Add vcodec node to enable Amlogic V4L2 stateless video decoder
support.

Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index dfc0a30a6e61..b8355e41d550 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -862,5 +862,33 @@ emmc: mmc@fe08c000 {
 			assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_C>;
 			assigned-clock-rates = <24000000>;
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
+			resets = <&reset RESET_DOS>;
+		};
 	};
 };

-- 
2.42.0



