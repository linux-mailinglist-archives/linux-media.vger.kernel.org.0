Return-Path: <linux-media+bounces-52728-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMAoK+8jj2lNKAEAu9opvQ
	(envelope-from <linux-media+bounces-52728-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 14:15:27 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D58651363B3
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 14:15:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3D96D301B858
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 13:15:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11FDA3612F7;
	Fri, 13 Feb 2026 13:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="dFmNtiI7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3ABA35FF7A
	for <linux-media@vger.kernel.org>; Fri, 13 Feb 2026 13:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770988511; cv=none; b=THUtexf/3wBq8mOxNuOOE1lCqLEqbRohyqgYjGk9m/TB6SNx52Di6wtwdXDihcCS8LJJtznNROhoUN4Ac01Wiy64jbAdLT+YjcPxCVFIvnLpzguRvuIVA3wW7fKxJc87A30PywsebYD18ucgc4EUqYkIeY7ZfCxBkrU1C6O2yRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770988511; c=relaxed/simple;
	bh=ydhmJSCIZaIH22AlYiY5zbtcSZF7dLVsHrUi82mpK0s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JelBimrCCfdfHNv4vBxpWMZg2i7gU+6tWYSxC09s+Xhj1xwI/Hz4BHY6q10BvysxUuunPK0OccQdQsZFEwsOKcAzt5Do0z/8KswjfeKDkTabrqcxBgq96pVn6za/oCPYwDRJwPOWr91I5VqRKVJyxN3gPtoGs7pw7HcG1D1tBNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=dFmNtiI7; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-65a36c8bcabso1620869a12.1
        for <linux-media@vger.kernel.org>; Fri, 13 Feb 2026 05:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1770988507; x=1771593307; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3T+zUpq9H0nLacgX2lpZL7d91Dtqet9InTc/kLd9coE=;
        b=dFmNtiI7ELvJWH3nxqo6J7ffBEmbuOsti2NC4DVN3qNsAOCaNEy8dWKXFGObdOml84
         gIYXP9z7zl+EUoSZM1w/QtX4hpYH2PDafshDf4ssMK/hEOyFEdRt1zsmBlSwm/7VUx0j
         YdC543vXGg3qGBkXuseEuzFsg4BlWigaIfC0Oe0BqypCncyMLupWzN+5Vfa2Uz6yLKGf
         9DgEj+/uEb7ytAc2C0bS9W085tjpgOvOs2vmxlvKyU/WS+b9BTcEyf7sLjsQKZE3ttBE
         0vgaLIoDgc8xjiy1FPOo8DCLcNUEkTZnnVj8aQJXp0XBbupPusVLguwSTdn9Jk13/CU/
         OuOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770988507; x=1771593307;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3T+zUpq9H0nLacgX2lpZL7d91Dtqet9InTc/kLd9coE=;
        b=wwBZ1UoLyRYlHp9KdR4qZkAogbSQsP+sY2NQX0dCd0VPZgkE2reT04edqPlLxPZTLk
         w7rxlmoQ4GcQS6XoBpO31xLR0gCNmKIbrZhhIRe/fsCuaR06DmuW+gbJveJk1LIVeRna
         yMwhjG6/EpOMGCg4uNi1dGl5wFe2YPqpe3cDW0GvCw259TRIOvjhP7S+/CUCLZUnRY01
         Dqr5Yesn5vI/jNhlz83ukQd42e7A18uH0f84BUylcvEFH/BURDniQrSBbb6dhbtNuAz6
         qaiRsKQP0W81fQaaj9t7XXKtMOq8WdLQldYKWzK3p1gH0sMYdnwuLnOowjRsmEX0ssco
         nPYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPGTjJxCVc3XNx3migRDoS5jEJcn+lNQlbXJpIt1N0vuOf1gM+4Vp71Kq6BQB1lMbs/FKkzb+AT4M3cQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGPN/l1jms98NNJzz1/48x88m2CQRHGcDq3iiiDEJiQpGLUC/s
	OV4IMuCgmEiMDgtV2C1JIC+RKHLZfRiKH11C4nEwZo+GzbTWd3cbhsd47wZ9BJBhCen729vdz56
	gJTh0
X-Gm-Gg: AZuq6aIkaskYmRTWHNd7IxZwZ98bL7Z8OvaCoiXGQxkRMoxqwoAAye1vDk7gc8fHJp6
	IZ3CGv8QquFlAeKE8lpqSmpYaSX+gFkXxDQFJjMQ6uvQNGPIaDrn/OLtUlAN8RMlLN8Pyhpt/Xf
	u+cmnDoRn7nM+G4tejFX/Tjb6UHODHaVpfmktYq6SieqjYBAQq8XUwUe/AfKpLO2aw7bEARyS4p
	VHje8hlyX6pqQWJXEbi1PoJJmlWZsKAP9iTQus3oOTPaTrjIcOGZXbfH3lL4zR4PsnesPxT81oK
	lhsVTz/kCe/ho/Yt9evZFhzrBPOhiijKc0JGLSJl5+lDynyxUYa0Hi+h25AZVD9YGNwIjl7nGTm
	5jMG7Vk0rl/pU7nG8+82Q282NqXjIzB3+2eA4cv7dy+w2fPwnRO12EYBBq+Kvd0fwveg3Whyn01
	I3AK4RqHiUBB8QnPkzFU2aOmQla4/K2ZjVW+YBd9EJDcjC6YJo/4d7sM4fKyiEmz3RqI713Fq0W
	ET7
X-Received: by 2002:a05:6402:4445:b0:658:bd67:bc16 with SMTP id 4fb4d7f45d1cf-65bace362damr901167a12.20.1770988506996;
        Fri, 13 Feb 2026 05:15:06 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bace3fc4esm674231a12.0.2026.02.13.05.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 05:15:06 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 13 Feb 2026 14:15:03 +0100
Subject: [PATCH v3 3/3] arm64: dts: qcom: sm6350: Add CAMSS node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-sm6350-camss-v3-3-30a845b0b7cc@fairphone.com>
References: <20260213-sm6350-camss-v3-0-30a845b0b7cc@fairphone.com>
In-Reply-To: <20260213-sm6350-camss-v3-0-30a845b0b7cc@fairphone.com>
To: Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770988501; l=7482;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=ydhmJSCIZaIH22AlYiY5zbtcSZF7dLVsHrUi82mpK0s=;
 b=RL7EdMIv+OMN80Kmw4Nf5DmJG6mHymFBALfSHtD/yo7ntH77Zgug+cQn//pCyoHG0+hTdPD6A
 /NOlgCzivb2CPcR79dceAklPuPy9H6cjQdigmKIHrCkG22eXg9ip9vQ
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52728-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[fairphone.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:mid,fairphone.com:dkim,fairphone.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,0.0.0.0:email,0.0.0.1:email,0.0.0.3:email,0.0.0.2:email]
X-Rspamd-Queue-Id: D58651363B3
X-Rspamd-Action: no action

Add a node for the CAMSS on the SM6350 SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 233 +++++++++++++++++++++++++++++++++++
 1 file changed, 233 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 9f9b9f9af0da..07887a07644f 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -2161,6 +2161,239 @@ cci1_i2c0: i2c-bus@0 {
 			/* SM6350 seems to have cci1_i2c1 on gpio2 & gpio3 but unused downstream */
 		};
 
+		camss: isp@acb3000 {
+			compatible = "qcom,sm6350-camss";
+
+			reg = <0x0 0x0acb3000 0x0 0x1000>,
+			      <0x0 0x0acba000 0x0 0x1000>,
+			      <0x0 0x0acc1000 0x0 0x1000>,
+			      <0x0 0x0acc8000 0x0 0x1000>,
+			      <0x0 0x0ac65000 0x0 0x1000>,
+			      <0x0 0x0ac66000 0x0 0x1000>,
+			      <0x0 0x0ac67000 0x0 0x1000>,
+			      <0x0 0x0ac68000 0x0 0x1000>,
+			      <0x0 0x0acaf000 0x0 0x4000>,
+			      <0x0 0x0acb6000 0x0 0x4000>,
+			      <0x0 0x0acbd000 0x0 0x4000>,
+			      <0x0 0x0acc4000 0x0 0x4000>,
+			      <0x0 0x0ac18000 0x0 0x3000>,
+			      <0x0 0x0ac00000 0x0 0x6000>,
+			      <0x0 0x0ac10000 0x0 0x8000>,
+			      <0x0 0x0ac6f000 0x0 0x8000>,
+			      <0x0 0x0ac42000 0x0 0x4600>,
+			      <0x0 0x01fc0000 0x0 0x40000>,
+			      <0x0 0x0ac48000 0x0 0x1000>,
+			      <0x0 0x0ac40000 0x0 0x1000>,
+			      <0x0 0x0ac87000 0x0 0xa000>,
+			      <0x0 0x0ac52000 0x0 0x4000>,
+			      <0x0 0x0ac4e000 0x0 0x4000>,
+			      <0x0 0x0ac6b000 0x0 0xa00>;
+			reg-names = "csid0",
+				    "csid1",
+				    "csid2",
+				    "csid_lite",
+				    "csiphy0",
+				    "csiphy1",
+				    "csiphy2",
+				    "csiphy3",
+				    "vfe0",
+				    "vfe1",
+				    "vfe2",
+				    "vfe_lite",
+				    "a5_csr",
+				    "a5_qgic",
+				    "a5_sierra",
+				    "bps",
+				    "camnoc",
+				    "core_top_csr_tcsr",
+				    "cpas_cdm",
+				    "cpas_top",
+				    "ipe",
+				    "jpeg_dma",
+				    "jpeg_enc",
+				    "lrme";
+
+			clocks = <&gcc GCC_CAMERA_AXI_CLK>,
+				 <&camcc CAMCC_SOC_AHB_CLK>,
+				 <&camcc CAMCC_CAMNOC_AXI_CLK>,
+				 <&camcc CAMCC_CORE_AHB_CLK>,
+				 <&camcc CAMCC_CPAS_AHB_CLK>,
+				 <&camcc CAMCC_CSIPHY0_CLK>,
+				 <&camcc CAMCC_CSI0PHYTIMER_CLK>,
+				 <&camcc CAMCC_CSIPHY1_CLK>,
+				 <&camcc CAMCC_CSI1PHYTIMER_CLK>,
+				 <&camcc CAMCC_CSIPHY2_CLK>,
+				 <&camcc CAMCC_CSI2PHYTIMER_CLK>,
+				 <&camcc CAMCC_CSIPHY3_CLK>,
+				 <&camcc CAMCC_CSI3PHYTIMER_CLK>,
+				 <&camcc CAMCC_IFE_0_AXI_CLK>,
+				 <&camcc CAMCC_IFE_0_CLK>,
+				 <&camcc CAMCC_IFE_0_CPHY_RX_CLK>,
+				 <&camcc CAMCC_IFE_0_CSID_CLK>,
+				 <&camcc CAMCC_IFE_1_AXI_CLK>,
+				 <&camcc CAMCC_IFE_1_CLK>,
+				 <&camcc CAMCC_IFE_1_CPHY_RX_CLK>,
+				 <&camcc CAMCC_IFE_1_CSID_CLK>,
+				 <&camcc CAMCC_IFE_2_AXI_CLK>,
+				 <&camcc CAMCC_IFE_2_CLK>,
+				 <&camcc CAMCC_IFE_2_CPHY_RX_CLK>,
+				 <&camcc CAMCC_IFE_2_CSID_CLK>,
+				 <&camcc CAMCC_IFE_LITE_CLK>,
+				 <&camcc CAMCC_IFE_LITE_CPHY_RX_CLK>,
+				 <&camcc CAMCC_IFE_LITE_CSID_CLK>,
+				 <&camcc CAMCC_BPS_CLK>,
+				 <&camcc CAMCC_BPS_AHB_CLK>,
+				 <&camcc CAMCC_BPS_AREG_CLK>,
+				 <&camcc CAMCC_BPS_AXI_CLK>,
+				 <&camcc CAMCC_ICP_CLK>,
+				 <&camcc CAMCC_IPE_0_CLK>,
+				 <&camcc CAMCC_IPE_0_AHB_CLK>,
+				 <&camcc CAMCC_IPE_0_AREG_CLK>,
+				 <&camcc CAMCC_IPE_0_AXI_CLK>,
+				 <&camcc CAMCC_JPEG_CLK>,
+				 <&camcc CAMCC_LRME_CLK>;
+			clock-names = "cam_axi",
+				      "soc_ahb",
+				      "camnoc_axi",
+				      "core_ahb",
+				      "cpas_ahb",
+				      "csiphy0",
+				      "csiphy0_timer",
+				      "csiphy1",
+				      "csiphy1_timer",
+				      "csiphy2",
+				      "csiphy2_timer",
+				      "csiphy3",
+				      "csiphy3_timer",
+				      "vfe0_axi",
+				      "vfe0",
+				      "vfe0_cphy_rx",
+				      "vfe0_csid",
+				      "vfe1_axi",
+				      "vfe1",
+				      "vfe1_cphy_rx",
+				      "vfe1_csid",
+				      "vfe2_axi",
+				      "vfe2",
+				      "vfe2_cphy_rx",
+				      "vfe2_csid",
+				      "vfe_lite",
+				      "vfe_lite_cphy_rx",
+				      "vfe_lite_csid",
+				      "bps",
+				      "bps_ahb",
+				      "bps_areg",
+				      "bps_axi",
+				      "icp",
+				      "ipe0",
+				      "ipe0_ahb",
+				      "ipe0_areg",
+				      "ipe0_axi",
+				      "jpeg",
+				      "lrme";
+
+			interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 717 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 473 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 461 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 718 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 472 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 463 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 459 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 475 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 476 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csid2",
+					  "csid_lite",
+					  "csiphy0",
+					  "csiphy1",
+					  "csiphy2",
+					  "csiphy3",
+					  "vfe0",
+					  "vfe1",
+					  "vfe2",
+					  "vfe_lite",
+					  "a5",
+					  "cpas",
+					  "cpas_cdm",
+					  "jpeg_dma",
+					  "jpeg_enc",
+					  "lrme";
+
+			interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+					 &clk_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
+					<&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
+					 &clk_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
+					<&mmss_noc MASTER_CAMNOC_ICP QCOM_ICC_TAG_ALWAYS
+					 &clk_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "ahb",
+					     "hf_mnoc",
+					     "sf_mnoc",
+					     "sf_icp_mnoc";
+
+			iommus = <&apps_smmu 0x820 0xc0>,
+				 <&apps_smmu 0x840 0x0>,
+				 <&apps_smmu 0x860 0xc0>,
+				 <&apps_smmu 0x880 0x0>,
+				 <&apps_smmu 0xc40 0x20>,
+				 <&apps_smmu 0xc60 0x20>,
+				 <&apps_smmu 0xc80 0x0>,
+				 <&apps_smmu 0xca2 0x0>,
+				 <&apps_smmu 0xcc0 0x20>,
+				 <&apps_smmu 0xce0 0x20>,
+				 <&apps_smmu 0xd00 0x20>,
+				 <&apps_smmu 0xd20 0x20>,
+				 <&apps_smmu 0xd40 0x20>,
+				 <&apps_smmu 0xd60 0x20>;
+
+			power-domains = <&camcc BPS_GDSC>,
+					<&camcc IFE_0_GDSC>,
+					<&camcc IFE_1_GDSC>,
+					<&camcc IFE_2_GDSC>,
+					<&camcc IPE_0_GDSC>,
+					<&camcc TITAN_TOP_GDSC>;
+			power-domain-names = "bps",
+					     "ife0",
+					     "ife1",
+					     "ife2",
+					     "ipe",
+					     "top";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+
+				port@2 {
+					reg = <2>;
+				};
+
+				port@3 {
+					reg = <3>;
+				};
+			};
+		};
+
 		camcc: clock-controller@ad00000 {
 			compatible = "qcom,sm6350-camcc";
 			reg = <0x0 0x0ad00000 0x0 0x16000>;

-- 
2.53.0


