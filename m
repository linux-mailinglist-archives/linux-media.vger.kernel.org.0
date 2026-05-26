Return-Path: <linux-media+bounces-62762-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAUQKtdcFWp7UgcAu9opvQ
	(envelope-from <linux-media+bounces-62762-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 10:41:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 235025D2940
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 10:41:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 79B523040DB2
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 08:40:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 185C73CF051;
	Tue, 26 May 2026 08:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s2UFptAJ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623963CC7E4;
	Tue, 26 May 2026 08:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779784832; cv=none; b=Apiu3EERNXWgRuGbnYout328sh5YQRZi5u7u8Qg6qMsAENDXIu371g3w3YMnE7+7MrzykTlmOiIsN2YxwoR04LtJyZ7FAiPLe2HJAWI7KBYTbIecn14wJ8XADTH5UDYvnrlIohB+7OBJriQZPOc/3rs5/dgi+CqMA7+duYTFRcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779784832; c=relaxed/simple;
	bh=Ex6/9dNKnvHs3Oge7eQrUgtoT6twrlN8SWMJ0lY6PFU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lbsbTD0zwqyT7AbGSR9b2+2iJfbbJc/lcvjaBD7ddn5qRdUjI5SNRxKd6k48B9HhvNsx8NZnUmj+6VpaFtF4K4DJk3pPh2B7eZdP6QA5Qbmlu03TeiKA8fZt4I0Vgk342mvZyLZ46k2pTSs3azFXbHTs7IXk0RaQyw6XkGAjIOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s2UFptAJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 303C8C2BD01;
	Tue, 26 May 2026 08:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779784832;
	bh=Ex6/9dNKnvHs3Oge7eQrUgtoT6twrlN8SWMJ0lY6PFU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=s2UFptAJqnqM1bNoR4DDPPEJwXcRVNNyjSHu56gokxtyDTexkpAZcP7PJuBtDs+g7
	 1fnID0GQmNmhRABhCSkyA+xpJMbDiQliQ8eIbvWfgJQu08e3R2dm5qxSi+ke/pQsaq
	 Atwi1voUdBWwkLCezUwKO2HYalmm0BeaFEinqG7ocvXmlw7pVGQU/tWiX4yos/V8Q9
	 0yN5I4zTXw9NnK5o6qLlsx8jfSgHwI71rUgled7Og8cbMl+hcyzdOUkJGCALWIXqw7
	 z7D0/zoXV+i0P7fOtyWQyZv3r4Lb2Lc2lFKP00LUn2HHmCq6i0KalzKp6X+K/1H/aO
	 yAeJl/oa0JQzA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A423CD5BD1;
	Tue, 26 May 2026 08:40:32 +0000 (UTC)
From: Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org>
Date: Tue, 26 May 2026 16:40:21 +0800
Subject: [PATCH RFC RESEND v5 5/6] arm64: dts: amlogic: Add video decoder
 driver support for S4 SOCs
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-b4-s4-vdec-upstream-v5-5-33bc817f93f4@amlogic.com>
References: <20260526-b4-s4-vdec-upstream-v5-0-33bc817f93f4@amlogic.com>
In-Reply-To: <20260526-b4-s4-vdec-upstream-v5-0-33bc817f93f4@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, Zhentao Guo <zhentao.guo@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779784828; l=1760;
 i=zhentao.guo@amlogic.com; s=20251024; h=from:subject:message-id;
 bh=1qF2f9ADFwCWWbSpwYb2bAeCjbaHvd/hJkHSg3Lnlh8=;
 b=ERzxHkusE0DRUGGalcEh+1YXN5WZTyPDZy2vKRneRZ1q7ucjdVO6J2OEbfZZe7cQ2I9srCrm5
 nWuS3mNzMsWDjYK7GZJDoTTxkYDGimh2q7qwjAUpdykwjXzKjXEVhCM
X-Developer-Key: i=zhentao.guo@amlogic.com; a=ed25519;
 pk=5yfDKrjreXwcAoEUsdtWafy6YN500upXp/CgtnXjLVU=
X-Endpoint-Received: by B4 Relay for zhentao.guo@amlogic.com/20251024 with
 auth_id=555
X-Original-From: Zhentao Guo <zhentao.guo@amlogic.com>
Reply-To: zhentao.guo@amlogic.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62762-lists,linux-media=lfdr.de,zhentao.guo.amlogic.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,baylibre.com,googlemail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[zhentao.guo@amlogic.com]
X-Rspamd-Queue-Id: 235025D2940
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Zhentao Guo <zhentao.guo@amlogic.com>

Add vdec node to enable Amlogic V4L2 stateless video decoder
support.

Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 34 +++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index 2a6fbd530836..5ad826e4b554 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -96,6 +96,11 @@ saradc: adc@fe026000 {
 		status = "disabled";
 	};
 
+	optee {
+		compatible = "linaro,optee-tz";
+		method = "smc";
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -907,5 +912,34 @@ emmc: mmc@fe08c000 {
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
+			compatible = "amlogic,s4-vdec";
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
+			clock-names = "dos",
+				      "vdec",
+				      "hevcf";
+			power-domains = <&pwrc PWRC_S4_DOS_VDEC_ID>,
+					<&pwrc PWRC_S4_DOS_HEVC_ID>;
+			power-domain-names = "vdec",
+					     "hevc";
+			resets = <&reset RESET_DOS>;
+			secure-monitor = <&sm>;
+		};
 	};
 };

-- 
2.42.0



