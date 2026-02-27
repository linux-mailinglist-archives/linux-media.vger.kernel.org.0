Return-Path: <linux-media+bounces-53792-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDC1BxAVomk0zAQAu9opvQ
	(envelope-from <linux-media+bounces-53792-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 23:05:04 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAD41BE6FA
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 23:05:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 160FD300D0D2
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 22:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFAF247A0CE;
	Fri, 27 Feb 2026 22:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AJcKJuZI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC2F286889
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 22:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772229901; cv=none; b=fSJf6m7F1IADKdX61sUTT3dFt9QngQF6iX0/f5x7XPIQ1NwiOfbR0XFmHOAL/g9KwtDXrXFkzRws5Y+Ry43wrzP7+jeUWvZmV63xrHNDiQCGa8P2weU6RCCrfi1/zJRkq+juRqSdolUipeus0hd9/JiPVhIWz8ZASZFObCxuXa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772229901; c=relaxed/simple;
	bh=WdTiESiUJi/ZikpLnYLLZMIv85uQ1DUOgxKPLUY9MdQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HVfEcHP64aanHVKQUkbcOyKsbHvtKbk1ZRJthLD9X5bG2GeK7w7huNZOzgweny4A/yl5z2HoVtUTBLahQ740nImADEgC58ZH1hyWeNDcAkmY84LKWuwi6sh7nw2mo5CPjCJNKYN+aLie+i5HgrfXom90pknp/EKMuRm8ln9UVys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AJcKJuZI; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4806cc07ce7so27213855e9.1
        for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 14:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772229897; x=1772834697; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Sf0cyeh31BT7bMM/+RaM1JIokednPwrHLYxxTyQtLrI=;
        b=AJcKJuZIEQ3muyZdHiC9tl4ufGPOxdzCB5oQkiGFfVnNMD8rIhl8c3/+PiMJZsTHYC
         uz43+Sep2GLdN9vVDlVtpLoQq1smyD0SS667mvw7+hoLjTB5BgMkq1Fq8c3jTYVxX2zx
         x+E47SSyzlUDL8djcNVebgkx8itVVJjKHLeJsylXd6/eCkYsgLnpOXaI9zH5tTMxiPd6
         9DR89RGbpVA1MGol4SlbDWGT5qKc5gEI4hTSU/+iACDLbygW+4jeNf1I1S7I79tKbJsn
         sjIajdn2IKZ/ZrMWX/8g7Z0hYq081EwYGP655GPWgnjyPB0A3DO/z9VAaN1D5MvU4QGS
         sMvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772229897; x=1772834697;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sf0cyeh31BT7bMM/+RaM1JIokednPwrHLYxxTyQtLrI=;
        b=XttJMt1j+v0zFDfqEu5/SscuqieX1hNn2cmGFhg17RFWFRRNDeoiTyhoNg6rlJ+u+/
         SR6B9INOaP/599SlwGQad/510Dfb6Cjz3po2CmEgHO+QhEjtQ4KzAfii0jNGgotc3GOM
         roqTAoGE4sDfO6am/COLJB9NiIYRhiF1VaFIxPajqd7utAbmAZuTaiTkkF1x4fhk6+1f
         2I9dX0hmUwoJcJWwSVFu/C0hSufEP6rcRZdNMDy85RRw66ptqEmKLSPQueuTNfoplGDz
         865HfkV2Wr0NN98f2X2h7ulVgc1ZSG3ZG91HzsJ3KjTqvC92zaPn2z/VPrCoewud07MI
         E0Iw==
X-Forwarded-Encrypted: i=1; AJvYcCXYUqCO6EZgKGHf/nhmhlG2RZE6GWSJGN1EshqD3e4PE5GmBJLOrP1lG8xqyqSiZSsfhwUYJn60e8Twug==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOJCA3f44tGuFXgzN0h2cejvrmxfjCGIQjTof44hutqbWcigNH
	373nfGg2lHEJv7nDiE4JypWiFmzqbOLL1CybgbhPS9eFZvnn6DSPOOYdKWddAd67uS0=
X-Gm-Gg: ATEYQzz1W0CoEWWp4Q0pBdanH4voN70WgsQLvzDLwg4RfHrajnkmftyOzc8Yo8bmXTn
	CWOWZ42zfEehibegOU39FJmY3D/9S1lep/dhXJxLXA9aET5Tt3RIXB1cWk3VE+NhgNUdMouqDEB
	LhkdwQGbBxnneceSaMsmUHjfxphYtEoD+Zigu4LvKyRR1pot2NKLkcWzfwNtZJ/rMPLRfnc8Lkl
	9aFQvhNbtvjxyrVhp9lLHTxdzXvrKqAnuu0qPNEW5f1WFDXDQlwGu8mfxmSW3uZuUvabohhv/Qv
	6/oWI/KjV8qNskIb9G/hCCVpvUmgqzGUujLDhtH1b6xMrYO147XcZfCLA8Pd+SXpcLrdZhTrzpi
	xAkB/EzcZFi4tk4/kbyOGrdVWcWXvCWtlMBtJeKyjlDZJMZmISw6hvHHVDhLgyZb1X30QJ6XQb5
	TVhDfSIH6MAFrtp2OXgRC/wX23P5DgBqZXpILJIMy9tkmJNWYQ9/Dg7w6swEjDecnoklBXpL3Az
	jSc0+bT+owdL5SmfREzRfSOjLVcRhMCoGM=
X-Received: by 2002:a05:600c:314a:b0:477:58:7cf4 with SMTP id 5b1f17b1804b1-483c9ba7e58mr65379815e9.4.1772229896953;
        Fri, 27 Feb 2026 14:04:56 -0800 (PST)
Received: from [192.168.16.154] (host86-188-11-239.range86-188.btcentralplus.com. [86.188.11.239])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfb9d9c6sm67853935e9.14.2026.02.27.14.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 14:04:56 -0800 (PST)
Message-ID: <d41febac2dcb913b98ca47dc681cf5d186225f20.camel@linaro.org>
Subject: Re: [PATCH v8 10/18] arm64: dts: qcom: x1e80100: Add MIPI CSI PHY
 nodes
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
Date: Fri, 27 Feb 2026 22:04:55 +0000
In-Reply-To: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-10-95517393bcb2@linaro.org>
References: 
	<20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
	 <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-10-95517393bcb2@linaro.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53792-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:dkim,linaro.org:email,ade0000:email,0.0.0.1:email,acec000:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AFAD41BE6FA
X-Rspamd-Action: no action

Hi Bryan,

On Wed, 2026-02-25 at 15:11 +0000, Bryan O'Donoghue wrote:
> Add csiphy nodes for
>=20
> - csiphy0
> - csiphy1
> - csiphy2
> - csiphy4
>=20
> The irregular naming of the PHYs comes directly from the hardware which f=
or
> whatever reason skipped csiphy3.
>=20
> Separating the nodes from CAMSS as we have done with the sensor I2C bus a=
ka
> the CCI interface is justified since the CSIPHYs have their own pinouts a=
nd
> voltage rails.
>=20
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
Tested-by: Christopher Obbard <christopher.obbard@linaro.org>

>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 115 ++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 115 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qc=
om/hamoa.dtsi
> index 38f9da6ad9ca5..9c5ebe1b48ecd 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -707,6 +707,25 @@ smem_mem: smem@ffe00000 {
>  		};
>  	};
> =20
> +	csiphy_opp_table: opp-table-csiphy {
> +		compatible =3D "operating-points-v2";
> +
> +		opp-300000000 {
> +			opp-hz =3D /bits/ 64 <300000000>;
> +			required-opps =3D <&rpmhpd_opp_low_svs_d1>;
> +		};
> +
> +		opp-400000000 {
> +			opp-hz =3D /bits/ 64 <400000000>;
> +			required-opps =3D <&rpmhpd_opp_low_svs>;
> +		};
> +
> +		opp-480000000 {
> +			opp-hz =3D /bits/ 64 <480000000>;
> +			required-opps =3D <&rpmhpd_opp_low_svs>;
> +		};
> +	};
> +
>  	qup_opp_table_100mhz: opp-table-qup100mhz {
>  		compatible =3D "operating-points-v2";
> =20
> @@ -5543,6 +5562,102 @@ cci1_i2c1: i2c-bus@1 {
>  			};
>  		};
> =20
> +		csiphy0: csiphy@ace4000 {
> +			compatible =3D "qcom,x1e80100-csi2-phy";
> +			reg =3D <0 0x0ace4000 0 0x2000>;
> +
> +			clocks =3D <&camcc CAM_CC_CSIPHY0_CLK>,
> +				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>;
> +			clock-names =3D "csiphy",
> +				      "csiphy_timer",
> +				      "camnoc_axi",
> +				      "cpas_ahb";
> +
> +			operating-points-v2 =3D <&csiphy_opp_table>;
> +
> +			interrupts =3D <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
> +
> +			power-domains =3D <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +
> +			#phy-cells =3D <1>;
> +
> +			status =3D "disabled";
> +		};
> +
> +		csiphy1: csiphy@ace6000 {
> +			compatible =3D "qcom,x1e80100-csi2-phy";
> +			reg =3D <0 0x0ace6000 0 0x2000>;
> +
> +			clocks =3D <&camcc CAM_CC_CSIPHY1_CLK>,
> +				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>;
> +			clock-names =3D "csiphy",
> +				      "csiphy_timer",
> +				      "camnoc_axi",
> +				      "cpas_ahb";
> +
> +			operating-points-v2 =3D <&csiphy_opp_table>;
> +
> +			interrupts =3D <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>;
> +
> +			power-domains =3D <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +
> +			#phy-cells =3D <1>;
> +
> +			status =3D "disabled";
> +		};
> +
> +		csiphy2: csiphy@ace8000 {
> +			compatible =3D "qcom,x1e80100-csi2-phy";
> +			reg =3D <0 0x0ace8000 0 0x2000>;
> +
> +			clocks =3D <&camcc CAM_CC_CSIPHY2_CLK>,
> +				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>;
> +			clock-names =3D "csiphy",
> +				      "csiphy_timer",
> +				      "camnoc_axi",
> +				      "cpas_ahb";
> +
> +			operating-points-v2 =3D <&csiphy_opp_table>;
> +
> +			interrupts =3D <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>;
> +
> +			power-domains =3D <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +
> +			#phy-cells =3D <1>;
> +
> +			status =3D "disabled";
> +		};
> +
> +		csiphy4: csiphy@acec000 {
> +			compatible =3D "qcom,x1e80100-csi2-phy";
> +			reg =3D <0 0x0acec000 0 0x2000>;
> +
> +			clocks =3D <&camcc CAM_CC_CSIPHY4_CLK>,
> +				 <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>;
> +			clock-names =3D "csiphy",
> +				      "csiphy_timer",
> +				      "camnoc_axi",
> +				      "cpas_ahb";
> +
> +			operating-points-v2 =3D <&csiphy_opp_table>;
> +
> +			interrupts =3D <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>;
> +
> +			power-domains =3D <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +
> +			#phy-cells =3D <1>;
> +
> +			status =3D "disabled";
> +		};
> +
>  		camcc: clock-controller@ade0000 {
>  			compatible =3D "qcom,x1e80100-camcc";
>  			reg =3D <0 0x0ade0000 0 0x20000>;

