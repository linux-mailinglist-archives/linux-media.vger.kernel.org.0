Return-Path: <linux-media+bounces-5799-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DD9861398
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 15:06:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9858AB23D65
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 14:06:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6C487F7CE;
	Fri, 23 Feb 2024 14:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="AIMZeMGO";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Ki0kzQxj"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A927F49F;
	Fri, 23 Feb 2024 14:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708697118; cv=none; b=Z642Bkq34p2JdEadRmnBGWU15F8a1zVj3ILG6bzD+T51L/0f7skQ8XVfaG294hxNAIgM69+JmNuOg2hKGwtN4AS9WyoNzTdROtyRB9GxXWhiM2qmcnYCwcOVIIVapTnQYQEPgqXKAXPVyU1KHQMlwetgzKCTcXbArkhsHDIUMpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708697118; c=relaxed/simple;
	bh=9tIjTE/kKva9xBA3gqPKlGyp5dZlS1Lj163OwzCwhJY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JhQS+BzF0Rxm1uUVWjZS127cSWZgNPt9MTHLEBOFfIigKOD9ODcLY5DcTpz3wGp/wATxtq5nfSLlzCbF8aQWw2+3nMKNyzkslsC1IOboz1rGOZQYHDCNBFdYbsABIMUhZU62h7yrn56iBnuhxDKBNDiQusdN1UD2E5yoa+DW7PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=AIMZeMGO; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Ki0kzQxj reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1708697116; x=1740233116;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YNkdmTrEJssYvYfNoX6EzwX2xAdmHMe+CFIvEXKOPQY=;
  b=AIMZeMGOHfTpFi8tR+I71alpDoILnM5qVLssJZEr0NWvfDb2pNAh8JNR
   rdMT7A2Nw8QwQsX2oJhDZ8/pJMFEZInvs4uDlVYSwCXn55r5tsaW8Zh0t
   0QOzLUqd4Uq5PvFnznCRCnaw7R1+OIp8EfW7FJsbMNwRvIjSdt3IEDp86
   RXPQA1HU2vLthYqnCKv4Dt2vi5ShePo0aLgzxBjGHVvHuNchsrc0dLd00
   wnlaPa2J0BGxi/buwU+NKPyzAkNRmFwV3B+DjTYLJRqfeBGcc/KHzey4w
   rKRpnlCl5QcZLOm31vm7w/rk3iGh/QN/sP//RmunoVAft3nEZF6g7lTfF
   w==;
X-IronPort-AV: E=Sophos;i="6.06,180,1705359600"; 
   d="scan'208";a="35569659"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 23 Feb 2024 15:05:13 +0100
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7CABF170698;
	Fri, 23 Feb 2024 15:05:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1708697109; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=YNkdmTrEJssYvYfNoX6EzwX2xAdmHMe+CFIvEXKOPQY=;
	b=Ki0kzQxjhIwqOi9zdF3f5+PIGv995rY5dcN2MxWrExbzqCTT/N2vlqXSPBOqPkyAq+0G8t
	Xab7KFdMpGAkHNS+TKTHQ1q0y1IucNJsvyHF7/Ptt1CaxSP1ArNTPcbvP7DTpLcgCGAvQb
	eWEK5Dwad9g0B2qSYhYn3IJHJx4U75oWwufCszyr8Zx8LWNkTBDnCKYKOjNQeqDRMTPJlb
	7ltnHnWpiRLR0MWL20wn4UMMcamobBEHxi39AwxrCa3Lyi7eImHiVhMeaSTIUfEkOTZ8/r
	mdAZMmjlbxW4ImdSuy5IHoZz/Fxdgcmp+ydP4XMx52Y5T6V1NAkixEIKgr8SAA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/3] arm64: dts: imx8mn: Use single port for ISI
Date: Fri, 23 Feb 2024 15:04:45 +0100
Message-Id: <20240223140445.1885083-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240223140445.1885083-1-alexander.stein@ew.tq-group.com>
References: <20240223140445.1885083-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The ISI on i.MX8M Nano only has one port/channel, so use the single port
node. Fixes the DTBS_CHECK warning:
/soc@0/bus@32c00000/isi@32e20000/ports: graph node has single child node
'port@0', #address-cells/#size-cells are not necessary

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx8mn.dtsi | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
index 136e75c51251a..de7704aafbc1a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
@@ -1118,15 +1118,9 @@ isi: isi@32e20000 {
 				power-domains = <&disp_blk_ctrl IMX8MN_DISPBLK_PD_ISI>;
 				status = "disabled";
 
-				ports {
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					port@0 {
-						reg = <0>;
-						isi_in: endpoint {
-							remote-endpoint = <&mipi_csi_out>;
-						};
+				port {
+					isi_in: endpoint {
+						remote-endpoint = <&mipi_csi_out>;
 					};
 				};
 			};
-- 
2.34.1


