Return-Path: <linux-media+bounces-53793-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLyPOCcWommizAQAu9opvQ
	(envelope-from <linux-media+bounces-53793-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 23:09:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 821091BE863
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 23:09:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C808731A1346
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 22:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F16FD2749CF;
	Fri, 27 Feb 2026 22:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g+hs2y0U"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F013535A3A0
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 22:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772229926; cv=none; b=oeX04ucu6pHfMBXYLlp+JZm2nLJWhLRSKTMp9eVspRrkDuUfCA4Yus+ExCRjucKLnVxfPm4+0GZ+VHdvFy1hhh9JvuRoYmAPLm/soHn9/gkbuVoKue+vW2nue2tuVhnIUpEKmSZi71HDuu1IRqNETB/yQ79WVh5drlTnoP0UeTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772229926; c=relaxed/simple;
	bh=IDj5Rn0oQ9xMORXPoJgzk06haI8L0G7nxe79nTKJ9Vc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FsHcwFKUxJDnNeHK6KDiW8/xvV/jMAqXWERwCX4LoYVHJ2zx81cdhorrneY3M5am5lv6wNQDYffj29c2DknKspd57GQYc77P7mFeZ3kutVVfSE5vk4fQL9ewG5VJ0QfqTDBp1cvOmYiRlnjCZiGkledH6gT+E6DD8WxUku2eAAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g+hs2y0U; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4377174e1ebso1802386f8f.3
        for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 14:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772229921; x=1772834721; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rBgTyc0JwXy7Q9otY3P3GvJm6ra8p82NpxJLudZ+C20=;
        b=g+hs2y0UnHQbARsipKAazQO5Pka6hyiiKq2rNIeG0VyAyiSYHFLeFYAbg8znWd0E6l
         NmXyrB4t4aBAzoGOMHlQgqRIoDwn0zeAzKf+yslECisJGDXxC5Rjp5UVDd74A+vqPUPU
         GYz6VxOYPnCVeXjbV0iLOGsy3JueRzhN9ewDq2OWx7n1Zg8dcTsvZRoDyVJ2eXKVfh1E
         fx5Z1l0+2jNMeZsLEDHw160KyQ4yjh1b0jcR3IJ+1DlTxFhnLwfopQKPPQO127TanibL
         RteZ/jw0LSBpjB585yQY6eZCYVPNTJufJvpEr4BoFoOKyBfvSMLV+RVpmtGdqxFT7y60
         wRrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772229921; x=1772834721;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rBgTyc0JwXy7Q9otY3P3GvJm6ra8p82NpxJLudZ+C20=;
        b=UwMjNzbj0n1d02m8CZzkQzt5lM+6QwvsCJ0xKwB4QmiA35DN/mPy7IcD3AAmFOOYps
         dilVGsYDmL2NDwWoBD1Baspofc8HE/Pijlw6thauz7up2GU6O0U/pXxAJSL4w2Y/8HUu
         fXJ+W8ZIrKQXEVisiuE0dHKqojuEiNs4eSsPwmhGCkgmV+Sx5AtigLjdZaqOtLUrKbjt
         qRiItfVQac3FeAHcBrtcv27oSwj9rQ5bZMRlOsSGaWhL6GdnOG4gGixX9317wJQ1Fe/K
         8FW37vo0llRDvGBEtDrR23mKZbYmTv3mxV1//AkmKVKpFL07nxd7x79yFSpeua6Y+DP7
         gSUw==
X-Forwarded-Encrypted: i=1; AJvYcCVq0IwEzJPwiqmuXMdik2xJF5oCsK0CJBUiiESm6bjyMHebYbXimEgWFLm4Zrb5u2os0B1Yij0kEl+kRA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWiMjxETjvDYJ6OqyTjmHtWk86hjQ8GGSixj2zmYAOrWgpvm20
	SOi2M4VVF/4W5gZXF5TsjqAPglDJKe7MYmSP4UQTgfTIpheQKFUou+SR32HVvPrRFIM=
X-Gm-Gg: ATEYQzyL4MaUum2TThTAjWrzZDFZuV9J00MjeHvCRFZ7vfQRqzi4MsrxiRVKRmp5alW
	JrXKqlr+26hnaP4kZL6uelFr1ykHsUr+tD8uoWtsSJWMXka8j6YluTvM49HFlpXCoqpHy5neoOM
	r37nxbtMtLLKZxS78KyX2b7LN7oSVY7NPFCren1Ba97BpRQIC6Y/3rRj6YT9T8B7+yFW3c9hV/j
	bsePWh2djksNfnW9kMT4LmRkPwdY4zYpKKeNfxc+Yjjl9Dg837oTea8+JTSRHdtoZgGfjH7Eyu6
	aoFiHDiyDZw5jdfi1vZfKKz+wJ8jSGjkGYa6pOaCySw3EVA1jAgCQNc8cP3LPg45+RXxrPEGkBv
	jdpuRRacxq+Q1xFbtSc1PhhU2SQ3KfM/3EJ5MCouVLXMicvuhkYbDxoQJJTfzldFa5n6o1rynUu
	gpyun/SKsTW6F4i7MjHgw9z/NaSVchOt41j8ZcxriWZURnRMNO4IS+mMm70uBkrCXYHSMSyqhBi
	4Ca4HRbZg236+mwUGiXUOzJ
X-Received: by 2002:a5d:5d0b:0:b0:439:94a7:5164 with SMTP id ffacd0b85a97d-4399de36b02mr7099438f8f.48.1772229921417;
        Fri, 27 Feb 2026 14:05:21 -0800 (PST)
Received: from [192.168.16.154] (host86-188-11-239.range86-188.btcentralplus.com. [86.188.11.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c71ad07sm9794155f8f.16.2026.02.27.14.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 14:05:21 -0800 (PST)
Message-ID: <051f77c615de15302ff7835757c130197df954a9.camel@linaro.org>
Subject: Re: [PATCH v8 11/18] arm64: dts: qcom: x1e80100: Add CAMSS block
 definition
From: Christopher Obbard <christopher.obbard@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Bjorn Andersson	
 <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Robert
 Foss	 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, Mauro Carvalho
 Chehab	 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Bryan O'Donoghue
 <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 27 Feb 2026 22:05:20 +0000
In-Reply-To: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-11-95517393bcb2@linaro.org>
References: 
	<20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
	 <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-11-95517393bcb2@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53793-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,baylibre.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christopher.obbard@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim,linaro.org:email,0.0.0.0:email,0.0.0.3:email,0.0.0.2:email,acb6000:email,0.0.0.1:email,ace4000:email]
X-Rspamd-Queue-Id: 821091BE863
X-Rspamd-Action: no action

Hi Bryan,

On Wed, 2026-02-25 at 15:11 +0000, Bryan O'Donoghue wrote:
> Add dtsi to describe the xe180100 CAMSS block
>=20
> 4 x CSIPHY
> 3 x TPG
> 2 x CSID
> 2 x CSID Lite
> 2 x IFE
> 2 x IFE Lite
>=20
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
Tested-by: Christopher Obbard <christopher.obbard@linaro.org>

>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 171 ++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 171 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qc=
om/hamoa.dtsi
> index 9c5ebe1b48ecd..5fac814ce0f6b 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -16,6 +16,7 @@
>  #include <dt-bindings/interconnect/qcom,x1e80100-rpmh.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/mailbox/qcom-ipcc.h>
> +#include <dt-bindings/phy/phy.h>
>  #include <dt-bindings/phy/phy-qcom-qmp.h>
>  #include <dt-bindings/power/qcom,rpmhpd.h>
>  #include <dt-bindings/power/qcom-rpmpd.h>
> @@ -5562,6 +5563,176 @@ cci1_i2c1: i2c-bus@1 {
>  			};
>  		};
> =20
> +		camss: isp@acb6000 {
> +			compatible =3D "qcom,x1e80100-camss";
> +
> +			reg =3D <0 0x0acb6000 0 0x1000>,
> +			      <0 0x0acb7000 0 0x2000>,
> +			      <0 0x0acb9000 0 0x2000>,
> +			      <0 0x0acbb000 0 0x2000>,
> +			      <0 0x0acc6000 0 0x1000>,
> +			      <0 0x0acca000 0 0x1000>,
> +			      <0 0x0acf6000 0 0x1000>,
> +			      <0 0x0acf7000 0 0x1000>,
> +			      <0 0x0acf8000 0 0x1000>,
> +			      <0 0x0ac62000 0 0x4000>,
> +			      <0 0x0ac71000 0 0x4000>,
> +			      <0 0x0acc7000 0 0x2000>,
> +			      <0 0x0accb000 0 0x2000>;
> +
> +			reg-names =3D "csid_wrapper",
> +				    "csid0",
> +				    "csid1",
> +				    "csid2",
> +				    "csid_lite0",
> +				    "csid_lite1",
> +				    "csitpg0",
> +				    "csitpg1",
> +				    "csitpg2",
> +				    "vfe0",
> +				    "vfe1",
> +				    "vfe_lite0",
> +				    "vfe_lite1";
> +
> +			clocks =3D <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>,
> +				 <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
> +				 <&camcc CAM_CC_CORE_AHB_CLK>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
> +				 <&camcc CAM_CC_CPAS_IFE_0_CLK>,
> +				 <&camcc CAM_CC_CPAS_IFE_1_CLK>,
> +				 <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
> +				 <&camcc CAM_CC_CPHY_RX_CLK_SRC>,
> +				 <&camcc CAM_CC_CSID_CLK>,
> +				 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
> +				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +				 <&gcc GCC_CAMERA_SF_AXI_CLK>,
> +				 <&camcc CAM_CC_IFE_0_CLK>,
> +				 <&camcc CAM_CC_IFE_0_FAST_AHB_CLK>,
> +				 <&camcc CAM_CC_IFE_1_CLK>,
> +				 <&camcc CAM_CC_IFE_1_FAST_AHB_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
> +
> +			clock-names =3D "camnoc_nrt_axi",
> +				      "camnoc_rt_axi",
> +				      "core_ahb",
> +				      "cpas_ahb",
> +				      "cpas_fast_ahb",
> +				      "cpas_vfe0",
> +				      "cpas_vfe1",
> +				      "cpas_vfe_lite",
> +				      "cphy_rx_clk_src",
> +				      "csid",
> +				      "csid_csiphy_rx",
> +				      "gcc_axi_hf",
> +				      "gcc_axi_sf",
> +				      "vfe0",
> +				      "vfe0_fast_ahb",
> +				      "vfe1",
> +				      "vfe1_fast_ahb",
> +				      "vfe_lite",
> +				      "vfe_lite_ahb",
> +				      "vfe_lite_cphy_rx",
> +				      "vfe_lite_csid";
> +
> +			interrupts =3D <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>;
> +
> +			interrupt-names =3D "csid0",
> +					  "csid1",
> +					  "csid2",
> +					  "csid_lite0",
> +					  "csid_lite1",
> +					  "vfe0",
> +					  "vfe1",
> +					  "vfe_lite0",
> +					  "vfe_lite1";
> +
> +			interconnects =3D <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONL=
Y
> +					 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> +					<&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +					<&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +					<&mmss_noc MASTER_CAMNOC_ICP QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names =3D "ahb",
> +					     "hf_mnoc",
> +					     "sf_mnoc",
> +					     "sf_icp_mnoc";
> +
> +			iommus =3D <&apps_smmu 0x800 0x60>,
> +				 <&apps_smmu 0x860 0x60>,
> +				 <&apps_smmu 0x1860 0x60>,
> +				 <&apps_smmu 0x18e0 0x00>,
> +				 <&apps_smmu 0x19a0 0x20>;
> +
> +			phys =3D <&csiphy0 PHY_TYPE_DPHY>, <&csiphy1 PHY_TYPE_DPHY>,
> +			       <&csiphy2 PHY_TYPE_DPHY>, <&csiphy4 PHY_TYPE_DPHY>;
> +			phy-names =3D "csiphy0", "csiphy1",
> +				    "csiphy2", "csiphy4";
> +
> +			power-domains =3D <&camcc CAM_CC_IFE_0_GDSC>,
> +					<&camcc CAM_CC_IFE_1_GDSC>,
> +					<&camcc CAM_CC_TITAN_TOP_GDSC>;
> +			power-domain-names =3D "ife0",
> +					     "ife1",
> +					     "top";
> +
> +			status =3D "disabled";
> +
> +			ports {
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				port@0 {
> +					reg =3D <0>;
> +					#address-cells =3D <1>;
> +					#size-cells =3D <0>;
> +					camss_csiphy0_inep0: endpoint@0 {
> +						reg =3D <0>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg =3D <1>;
> +					#address-cells =3D <1>;
> +					#size-cells =3D <0>;
> +					camss_csiphy1_inep0: endpoint@0 {
> +						reg =3D <0>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg =3D <2>;
> +					#address-cells =3D <1>;
> +					#size-cells =3D <0>;
> +					camss_csiphy2_inep0: endpoint@0 {
> +						reg =3D <0>;
> +					};
> +				};
> +
> +				port@3 {
> +					reg =3D <3>;
> +					#address-cells =3D <1>;
> +					#size-cells =3D <0>;
> +					camss_csiphy4_inep0: endpoint@0 {
> +						reg =3D <0>;
> +					};
> +				};
> +			};
> +		};
> +
>  		csiphy0: csiphy@ace4000 {
>  			compatible =3D "qcom,x1e80100-csi2-phy";
>  			reg =3D <0 0x0ace4000 0 0x2000>;

