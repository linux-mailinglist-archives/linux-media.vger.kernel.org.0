Return-Path: <linux-media+bounces-62983-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OKUvBzXAGGoumwgAu9opvQ
	(envelope-from <linux-media+bounces-62983-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 00:22:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 908DF5FAE77
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 00:22:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C664B309286F
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 22:21:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8227636A030;
	Thu, 28 May 2026 22:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oVDCIb11"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D968935E1B6;
	Thu, 28 May 2026 22:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780006901; cv=none; b=oU/Q7iPqWAWVD2V+/Iy05pXrEwYqSIRPD5XK7ZBB/erLnPwaCAphoNSye4Jk5ALaNv+NoqJ9QuePV5uoOe5dDlAqCVFofZcUpCVvded8eo6nkUOV2DOZHjxCIptN9rmmbO2XtPHFdofQ3uMMyLiFFUjYTUi0YJkvMQGJApsU47w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780006901; c=relaxed/simple;
	bh=Mz63/CkyFYep9DnMMJtYFqQR/TTuUo9JhtPAEXop1E4=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=JJKhoxkOqOFDGoqScy03WvruT1mgk/KwEXxiuRFfGKwGh2wc0rIT06Oj5pDNZZynQAqnXgvU5SSfNz3ylEIZhna4N8KeoVJFMZeeBWFCPmlkbl3p//u/AJjCozjAOwLjAm7iH2AggkyT2M8UrO5QxKiVTy3mXBAMANMY/qA01js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oVDCIb11; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA3F11F000E9;
	Thu, 28 May 2026 22:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780006899;
	bh=mZmARthFPXCAyxYUsxgldu6mzFwjs58vao40Hr/sGrU=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=oVDCIb11pBEckiH0eMeGLTs3Ia2XRJ32VOv1TFeRIohYt3LQ3Xkn6cxTjZx4U3Qfk
	 Bysq1aE3ULxHL1IY4wF5QFO9cL9MgS/M2CYzXue08ySxGlvLRIY0wktVq6KvUupWoU
	 kUoctmhG4iqqYx2HQkLfMM6dk2AOCv5iODIqDnT9IzT7LL+da1Qk3PKsKgMvFqGGzA
	 24NF90JvYx5xGhJO2gTXfASez5fMbhbPANqKbuaeF5upRAfLoVJPj7zBTcdjHz5Cbu
	 Silfhy48If6qmd/1Pg6GTRB88rPkbJYy5C3OER/R2GeHNaCZnjIOiwYnNQkV/z17Ey
	 nNRauk22KuAVg==
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 4/8] arm64: dts: qcom: shikra: Add CAMSS node
From: bod@kernel.org
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Suresh Vankadara <quic_svankada@quicinc.com>, 
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>
In-Reply-To: <20260526-shikra-camss-review-v1-4-645d2c8c75a7@qti.qualcomm.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
 <20260526-shikra-camss-review-v1-4-645d2c8c75a7@qti.qualcomm.com>
Date: Thu, 28 May 2026 23:21:31 +0100
Message-Id: <178000689150.4557.11759359941436928903.b4-reply@b4>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=4068; i=bod@kernel.org;
 h=from:subject:message-id; bh=Mz63/CkyFYep9DnMMJtYFqQR/TTuUo9JhtPAEXop1E4=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqGL/tatFRK0PAVLSvVheUTY08eMxxcBtAGbDsh
 plxVRE24JuJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCahi/7QAKCRAicTuzoY3I
 OkdaEACdNsKvRUMFoJhIfD/HZ1qJRzzcz/1y5eumxiCBhWLQJR/21fZt4iBCqN27QjZ42TXDbmj
 EmtJw43/xp84I6xI9Xv8wRlii/0LJVOr8r5JxhFc/BqPzNxfT77cNqCXLuQCBgkWXAnEo4YvBsq
 AKOeYCX7rUZ25HWKg6l6PxkP/Ghda9xPtT2/s0rDN4o+JEtD/AGhw219HeGBY/zN279/xUTnIWL
 4v3sChtOCKesNWldKfKc3aF9z3SLR6cUdrEMWNbMxids93dlpay+8ef84wPmqg9zZMQn+JyGuKf
 HzwYg0kKg1uxw4QwDLvhvL9SRNeQWC5yjaxWrJbrN8X+HihUm5jA/uEksIZ5S8RCYmx29CbY3N8
 OR/oVNjc6jMNVx8CN2oAdLfPUhFsxexBwya1zrrUnpNcZbxsVdVEZKyvo1mwwpB02sAHszgX8A0
 5km82psvANdxR+mD1/+J7Qitsvk8o7mZp5DksWMQEmNfUiqOKMKlrJZQqnhVfG5+QCyecDHUfrF
 O1PmQs/LAoHcpssGfS3JXrV8S6zuecwtsifKUnfWJ0Dz3j23kzzITEaqzK0325dVqxylpxlNgB9
 slGz78LUm1mgePoZxZYiuI42TydUKEsiUjC7qOS8Kc7rnkMxJehdPgRSvA2EsR2nfn/wjfSpQT7
 9mJcIikSqxLOzgQ==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62983-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,oss.qualcomm.com,nxp.com,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,quicinc.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,5c11000:email]
X-Rspamd-Queue-Id: 908DF5FAE77
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-05-26 22:42 +0530, Nihal Kumar Gupta wrote:
> Add node for the Shikra camera subsystem.
> 
> Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
> Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 99 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 99 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> index a4334d99c1f35ee851ca8266ec37d4a200a07ee5..6c47cf2a7ef26b4bb7d7f642a240b435cf5208d8 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -604,6 +604,105 @@ opp-384000000 {
>  			};
>  		};
>  
> +		camss: camss@5c11000 {
> +			compatible = "qcom,shikra-camss";
> +
> +			reg = <0x0 0x05c11000 0x0 0x1000>,
> +			      <0x0 0x05c6e000 0x0 0x1000>,
> +			      <0x0 0x05c75000 0x0 0x1000>,
> +			      <0x0 0x05c52000 0x0 0x1000>,
> +			      <0x0 0x05c53000 0x0 0x1000>,
> +			      <0x0 0x05c66000 0x0 0x400>,
> +			      <0x0 0x05c68000 0x0 0x400>,
> +			      <0x0 0x05c6f000 0x0 0x4000>,
> +			      <0x0 0x05c76000 0x0 0x4000>;
> +			reg-names = "top",
> +				    "csid0",
> +				    "csid1",
> +				    "csiphy0",
> +				    "csiphy1",
> +				    "csitpg0",
> +				    "csitpg1",
> +				    "vfe0",
> +				    "vfe1";
> +
> +			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
> +				 <&gcc GCC_CAMSS_AXI_CLK>,
> +				 <&gcc GCC_CAMSS_NRT_AXI_CLK>,
> +				 <&gcc GCC_CAMSS_RT_AXI_CLK>,
> +				 <&gcc GCC_CAMSS_TFE_0_CSID_CLK>,
> +				 <&gcc GCC_CAMSS_TFE_1_CSID_CLK>,
> +				 <&gcc GCC_CAMSS_CPHY_0_CLK>,
> +				 <&gcc GCC_CAMSS_CSI0PHYTIMER_CLK>,
> +				 <&gcc GCC_CAMSS_CPHY_1_CLK>,
> +				 <&gcc GCC_CAMSS_CSI1PHYTIMER_CLK>,
> +				 <&gcc GCC_CAMSS_TOP_AHB_CLK>,
> +				 <&gcc GCC_CAMSS_TFE_0_CLK>,
> +				 <&gcc GCC_CAMSS_TFE_0_CPHY_RX_CLK>,
> +				 <&gcc GCC_CAMSS_TFE_1_CLK>,
> +				 <&gcc GCC_CAMSS_TFE_1_CPHY_RX_CLK>;
> +			clock-names = "ahb",
> +				      "axi",
> +				      "camnoc_nrt_axi",
> +				      "camnoc_rt_axi",
> +				      "csi0",
> +				      "csi1",
> +				      "csiphy0",
> +				      "csiphy0_timer",
> +				      "csiphy1",
> +				      "csiphy1_timer",
> +				      "top_ahb",
> +				      "vfe0",
> +				      "vfe0_cphy_rx",
> +				      "vfe1",
> +				      "vfe1_cphy_rx";
> +
> +			interrupts = <GIC_SPI 210 IRQ_TYPE_EDGE_RISING 0>,
> +				     <GIC_SPI 212 IRQ_TYPE_EDGE_RISING 0>,
> +				     <GIC_SPI 72 IRQ_TYPE_EDGE_RISING 0>,
> +				     <GIC_SPI 73 IRQ_TYPE_EDGE_RISING 0>,
> +				     <GIC_SPI 309 IRQ_TYPE_EDGE_RISING 0>,
> +				     <GIC_SPI 310 IRQ_TYPE_EDGE_RISING 0>,
> +				     <GIC_SPI 211 IRQ_TYPE_EDGE_RISING 0>,
> +				     <GIC_SPI 213 IRQ_TYPE_EDGE_RISING 0>;
> +			interrupt-names = "csid0",
> +					  "csid1",
> +					  "csiphy0",
> +					  "csiphy1",
> +					  "csitpg0",
> +					  "csitpg1",
> +					  "vfe0",
> +					  "vfe1";
> +
> +			interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
> +					 &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
> +					<&mmrt_virt MASTER_CAMNOC_HF RPM_ALWAYS_TAG
> +					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
> +					<&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
> +					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
> +			interconnect-names = "ahb",
> +					     "hf_mnoc",
> +					     "sf_mnoc";
> +
> +			iommus = <&apps_smmu 0x400 0x0>;

So I'm suspicious of this IOMMU.

We should list the full range of IFE SIDs here not a subset. Since we are
register compatible with Agatti that implies to me we should also be IOMMU
compatible.

Please list in your next submission commit log the IOMMU SIDs - comment in
the DTS is fine too.

Ideally list the IOMMus for Agatti/2290 and then explain why the singleton
you have enumerated here is the only required one.

Right now my suspicion radar is high that either the Agatti binding is
wrong or the Shikra binding is.

Possibly both.

---
bod


