Return-Path: <linux-media+bounces-52844-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOUxHAPckmn3zAEAu9opvQ
	(envelope-from <linux-media+bounces-52844-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 09:57:39 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D90E5141BEE
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 09:57:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 675FD300D6A2
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 08:57:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 385DF283FCD;
	Mon, 16 Feb 2026 08:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="zgqw5BoI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F9C278753
	for <linux-media@vger.kernel.org>; Mon, 16 Feb 2026 08:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771232244; cv=none; b=QzH/gH8Nv3l7NFH/A1b/Uwje9APSf78TK2M76XsSerC8Pq+Y43n2gw4Fg+e3wEIe9wHEuDU9IrfwqgYB4rkCjv71NYgl9rJPzMZuSmOx9R7wRj0xSi4wXueYrsjzPtKwdMMTF+aAD05AkO0uGcWMuoz+HuwhBWY4Avr6dGe7r+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771232244; c=relaxed/simple;
	bh=Gvde/uR5jcPqoS06BhP+QGqm5hlplEzw4mjC+DC+Ypw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rVcC6mIvTKjFDMmhEN8nBhbl6/+/kbhq1mgGSz3JgGQqryfidO9NDVLDA/Uq0Td7+m/icuEyJXRWFRM5Z95UoDLMEfdiAeCUU0p9H2BeZhBhF583SVXAI60n6NFeiY6P5Jxo6yWmCfTy3Y8ZSu9roMTqjfDKBxi4Be2MX+H37JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=zgqw5BoI; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b8849dc12f6so364865166b.1
        for <linux-media@vger.kernel.org>; Mon, 16 Feb 2026 00:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1771232240; x=1771837040; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2wlsim1bO6kTzzi67XjtieI49JbUy+n4SVU6/pGgHf0=;
        b=zgqw5BoIT9hTK6yKLl4oQraz8H7Eav4HMgC9b/o7RGqdlySUNtb86z4tJR11byvboR
         glGNTdzAOL1zRahGwXamhhDduGAJI6pMCSzhuqqq2qyRA7HI2G7gVN7yEqcvfXZrb/EA
         l2ccYoRjqh5VPW1QndCSxPBN5KrWrEDpC+zFD7axIKN8QrWdHOBVhwgAGU69dZI1BSEu
         rkfbxZWO7Cy2jf2BEp/WTVOJXD4uStbmolK3h7yArU5bbMBghPQZs4rZVulzkYL1dDXA
         ar/E7A4Nk+A7/lZR0Pp8mjuVG1B+I6jvn+/+ypbZ4U/5PRp8bf+qIOKPTdFtlQYzvW1u
         gWdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771232240; x=1771837040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2wlsim1bO6kTzzi67XjtieI49JbUy+n4SVU6/pGgHf0=;
        b=iRqs82L7B5jaE0C1DWXDSHGCIOxgMgzP19sOF4UZFT/LjzYKhqWkdhAZaCk+1BOBvg
         ux3yD5oHKYy1yBcJj246icujGt1xM0JW1MU/+42oEeoDkYhtn2d6HKNAbwR/t9+mj/uN
         aVlijfBYdQOjD8J+JzJpNtEDvSRkOP40t6B0Bkd8O0mGut73zwwDkcmaUBVu0emrB9o7
         vOHHN3DI9nxeRflYRmIhP0V9TtYQkDje+euXh667UwW4uxAYSubY1s14B/hDadUN4MSK
         D5OCfmy/mDpUDpMmUpNEkg1Ik+C4jkGSxjGms2wku8it2WK99BKrnWgraHDfBNgXf8TU
         BJQA==
X-Forwarded-Encrypted: i=1; AJvYcCVrUJ3cSVGMkFhuofRWULoDRh3WFT3b+9Fn0s0Hya9LjIwAByM0Q77jL8K5YBpbl5AIMLuDKSG4O0mEzA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa8BVcnI/7iy4EWflL7CL8S769HjaWwUe5cTEekZMg4ggdF3Rl
	QMpgJvlZ6mx781VWsF/Lg06LqE+tHrjSYT5oOi4Fv2Rpdl1W9bc9Tfuco9Y1QJdBmiY=
X-Gm-Gg: AZuq6aI6p2bsPHNxNyhay9jvvfcfX9dWx+IRngDGZSfTQ8P6rpgw8m2tsmgWHnGIC0M
	BMlvLO+nRM9xsUflkXyMh/zdoDt2Xe9UpFyd9Tb0mth09Vn3lVOeWJQAVw+IG+/qINv1i6JO+oI
	NQ5lYNUF8CRHcMCd0HjGNeeTQIr8SuSLoLabk1fblatPpQBjIjgrNQt2bBBRptoXuKf+k08+P9u
	yjIajUj2WnMEk0Kn0fW5ryM+haR4VQYbcRvUOZGaFp/0CZ/XwTXEdPlyxba8Z3iwR2fZPlm7hWH
	6LEJZYNHdCh67hUevxwqfWhMP3y7nTn5i2S7bJkWJsFZXSBlBQ5Xbd67b+TWR/DmNHHNw3LQF1U
	enISmjhoyBETiPTwTQHFRnqjt1TkC19t38Ob7pZmwEjZs5g0i5v9r9bCJwDGtno2qeIuo3dHPlz
	PPOrMWUmZ52vflyJFJKyLmScrZOOXOJt2fmxk8iercFMyDI+cvRKC+MYwZIF0dYfdVfe5rrloHp
	sLk7EKd486viHN2
X-Received: by 2002:a17:907:1c28:b0:b88:f0f5:382f with SMTP id a640c23a62f3a-b8fb4179808mr515778666b.2.1771232240429;
        Mon, 16 Feb 2026 00:57:20 -0800 (PST)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc769437bsm236867966b.61.2026.02.16.00.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 00:57:20 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Mon, 16 Feb 2026 09:54:21 +0100
Subject: [PATCH v4 3/3] arm64: dts: qcom: sm6350: Add CAMSS node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-sm6350-camss-v4-3-b9df35f87edb@fairphone.com>
References: <20260216-sm6350-camss-v4-0-b9df35f87edb@fairphone.com>
In-Reply-To: <20260216-sm6350-camss-v4-0-b9df35f87edb@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771232235; l=7482;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=Gvde/uR5jcPqoS06BhP+QGqm5hlplEzw4mjC+DC+Ypw=;
 b=jGJMcHyS/Wyj0LMbq7NQBVdIbnlWjwhfgTkb7qi9/9q6bKJNucQUhBKbi1QzcWKkRHYKHXL7p
 ZMiVRXSY1zgBKEpJOY7KG4VIfwQopNdZoluZvcJ72eKYoeo/hkgoUrT
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52844-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[fairphone.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.0:email,0.0.0.1:email,0.0.0.2:email];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ad00000:email,0.0.0.3:email]
X-Rspamd-Queue-Id: D90E5141BEE
X-Rspamd-Action: no action

Add a node for the CAMSS on the SM6350 SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 233 +++++++++++++++++++++++++++++++++++
 1 file changed, 233 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 9f9b9f9af0da..9ff9508c5ce6 100644
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
+			power-domains = <&camcc IFE_0_GDSC>,
+					<&camcc IFE_1_GDSC>,
+					<&camcc IFE_2_GDSC>,
+					<&camcc TITAN_TOP_GDSC>,
+					<&camcc BPS_GDSC>,
+					<&camcc IPE_0_GDSC>;
+			power-domain-names = "ife0",
+					     "ife1",
+					     "ife2",
+					     "top",
+					     "bps",
+					     "ipe";
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


