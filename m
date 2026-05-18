Return-Path: <linux-media+bounces-62024-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLvgM/IzC2qgEgUAu9opvQ
	(envelope-from <linux-media+bounces-62024-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 17:44:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A135703AB
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 17:44:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E0E7F3033975
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 15:38:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E86C63FDBEE;
	Mon, 18 May 2026 15:37:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4900536EA8C;
	Mon, 18 May 2026 15:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779118676; cv=none; b=ngbijQyj7EZDlkiVbNpJ/4Mi27FxAN4oMoiuYk6F3CPm4rlLkkmi9VlzNdVn+r4vXowgDyfY4s745flRvIcvWfYnzrwpSbI0L8k7xHBDa3ftXrCr1CJICO9JSmV7YRI1MeFOgIjC9OkNCUcZ6laydLjA5zYF78HWkXH43rG+R9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779118676; c=relaxed/simple;
	bh=rwrxHD/EagvAcfNUVBERMBS/rVq7WXiSvQi5erJesMc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tjY3f3CLL1ls69ekS7hHda9+YvcZEYeibqiN0PcUCqDM5y0WvpNDrHb6sN3S3H5tRBYaAxUYhepAmorbS7ZQmNzkhmZXXipl9hemiwz39s5pryGPOUVet90FGodTuCBkitqOyFtNz+3dGKlNeGzTAcR5+nYlhxOsDr4nQ+o13Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 859211F8004F;
	Mon, 18 May 2026 15:37:53 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 079BAB4081D; Mon, 18 May 2026 15:37:52 +0000 (UTC)
X-Spam-Level: *
Received: from collins (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id F1111B40803;
	Mon, 18 May 2026 15:33:47 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Yong Deng <yong.deng@magewell.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH v9 7/9] ARM: dts: sun8i: a83t: Add MIPI CSI-2 controller node
Date: Mon, 18 May 2026 17:33:36 +0200
Message-ID: <20260518153339.619947-8-paulk@sys-base.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518153339.619947-1-paulk@sys-base.io>
References: <20260518153339.619947-1-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-62024-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[magewell.com,sys-base.io,kernel.org,gmail.com,sholland.org,baylibre.com,redhat.com,bootlin.com];
	DMARC_NA(0.00)[sys-base.io];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[paulk@sys-base.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,bootlin.com:email,0.0.0.1:email,1cb0000:email,0.0.0.0:email,sys-base.io:mid,1ee0000:email]
X-Rspamd-Queue-Id: 72A135703AB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

MIPI CSI-2 is supported on the A83T with a dedicated controller that
covers both the protocol and D-PHY. It is connected to the only CSI
receiver with a fwnode graph link. Note that the CSI receiver supports
both this MIPI CSI-2 source and a parallel source.

An empty port with a label for the MIPI CSI-2 sensor input is also
defined for convenience.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm/boot/dts/allwinner/sun8i-a83t.dtsi | 43 +++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm/boot/dts/allwinner/sun8i-a83t.dtsi b/arch/arm/boot/dts/allwinner/sun8i-a83t.dtsi
index 6f88d8764e6a..cc107c6030de 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-a83t.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun8i-a83t.dtsi
@@ -1062,6 +1062,49 @@ csi: camera@1cb0000 {
 			clock-names = "bus", "mod", "ram";
 			resets = <&ccu RST_BUS_CSI>;
 			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@1 {
+					reg = <1>;
+
+					csi_in_mipi_csi2: endpoint {
+						remote-endpoint = <&mipi_csi2_out_csi>;
+					};
+				};
+			};
+		};
+
+		mipi_csi2: csi@1cb1000 {
+			compatible = "allwinner,sun8i-a83t-mipi-csi2";
+			reg = <0x01cb1000 0x1000>;
+			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_CSI>,
+				 <&ccu CLK_CSI_SCLK>,
+				 <&ccu CLK_MIPI_CSI>,
+				 <&ccu CLK_CSI_MISC>;
+			clock-names = "bus", "mod", "mipi", "misc";
+			resets = <&ccu RST_BUS_CSI>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				mipi_csi2_in: port@0 {
+					reg = <0>;
+				};
+
+				mipi_csi2_out: port@1 {
+					reg = <1>;
+
+					mipi_csi2_out_csi: endpoint {
+						remote-endpoint = <&csi_in_mipi_csi2>;
+					};
+				};
+			};
 		};
 
 		hdmi: hdmi@1ee0000 {
-- 
2.54.0


