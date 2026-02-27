Return-Path: <linux-media+bounces-53796-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFJ2FuIVommizAQAu9opvQ
	(envelope-from <linux-media+bounces-53796-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 23:08:34 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6151BE80F
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 23:08:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E79A3309FB9D
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 22:08:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8F4847AF4B;
	Fri, 27 Feb 2026 22:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gdaK3WVw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3EC042E007
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 22:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772230087; cv=none; b=rRgEaabmx1Z3nDVn39lz5YzzlvxVpsEVvbjJeLJL/iHdpY13ah0LIU80A20ZS8vXwQ55JN9RuF5UJRL9fbGRyH20WRDI4NbFFCNzi+2UgEhzDQcSWmeiMTfFZu0a7c/6oKpGcS7oPMZy7Yfn7pJsDgr7muv7P7ZWoyOg2dkM+OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772230087; c=relaxed/simple;
	bh=tMJ8f5DPdRMekZbxffsBirzyWQULA5uML/MikBv/obs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iwEPVE7zLjwtAAjVJm2o3/j+uXhHW3bb8rOWKj/iEmoU6GBRA0Djhm3TkE2sV4uh0icKjJeonuGscBNwVq+xa+DqKYvwoxiSDk0u6nyG9OhgWWXkD7N7aRgZGO3dV/zSgYaaP9r1dJmEuMl5gG2fnuCE7OKhx8huipQZsVq+Ct0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gdaK3WVw; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48379a42f76so19265615e9.0
        for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 14:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772230084; x=1772834884; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HgpWCIEAXYCKG3dNcgQ8wee+NuBqJAXrkSxrYQnWihQ=;
        b=gdaK3WVwLnVtPEKuXbfNJrmMr+K9024i6iPqO1O6f+hGAzqwMsW/1upa5DxQbCW6gd
         +zgqxjThXh4tbbkHP8pl80J1W3gR5fCZJcnxk3O+U5Qk8sWvKES/ZQ+WOdYrHj2Qfffy
         ThLCUub/uH0dLIdDtiQX4nerZXF0WoCrkHBm9MI1z3zfDlXLyoFvS1hsRk77nYsl8gYU
         LJkr/qsHrh+MquPLMZX10iLlY297cehJ2OqelfThwenTxxbMwbykOR2S/v6F6xLZFWoV
         HVDpQE/v/Lz8v6/5bRAp/LG+mb0l7H6NMe2QmNPRNaIcQtzW6Wd2ylsur/Ya8bMF+byz
         sbkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772230084; x=1772834884;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HgpWCIEAXYCKG3dNcgQ8wee+NuBqJAXrkSxrYQnWihQ=;
        b=b+e15DpT/hNHF0iTvlN0kZjnA88oWJ7gh9D4MPGLg16wSOoiRwvbIdi4I7WQxT9yPT
         sbwxhEjQTpnLhoH4TLGOTJ5vb2xsn9pBbQBRSKrghpuWdd8FEmDQMP8XvhdmPvByhOS3
         6NT6IVkoCVmmYJDDR3zesiQPqIFmncokMH94xUrZwvZMilNBzTacXdEV12U1IlbDvqS+
         QcbWqncf29/LjO18kKmg/JMu9CoMG2m1G6vKsqPkxX+ZZGE/dHPNBctd+HTCwQw7c8qk
         azrH3GmuMpm/HQcQESUVeZUu0PyNk7bTF6zwYMfjmqHC6QIRm7sstv2/1IxFqrVzV3jc
         oCxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDlHMRu4Cc0pUe/nuqIzivaS6QUs6Tl5Q7/CcJRa3S+LSKaToPawCM1VngVeniLfdxIirDfrB2YB3H8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrpbB5zrgiR/R8RyW5jm977djUroMQxvQ8uf4El4R+dK4kcJm/
	NWANHVO6O8e/hfogc+8o//sBDNeQ5NLEfgW4jnCRVH4J8RMaR/IQZiiug8gNKT74wrk=
X-Gm-Gg: ATEYQzyIMsaOl2og8XgEueWBh5R/+pPyR02n1CJSqvYqaHiqmTlcgFZmpM6ZtZOfTmj
	Lc0NX+BNetUddTOKABxQYB1MIg4UOYmPdnhvB+HL4us7S+XOoC9OS20JR8wXDgJ+IrzWsLHsE+x
	N3uz14Kw6ZP/GJlgo3fbggPALUEi2XhNHCDZMxcFsx+C0LS7ClHjNKYxzqWAjcPoHrB61yUfWd8
	LFJSSed4cqF+grUWBt07K1YLvUeeLo6Q+2CIxfTsvi8JXNrUCFzoDT3n8tnB1HSMajEzvBsjqOv
	Gu4bM8OJ/c2mNIRfrT0LDxRJUEAW31R4vSzq9fjOCo6uwiPgrk/yie+VlXbgE0/ifYciSVobEy0
	AEir6ALl04O/3vHKGRp7JT3BwI1HOaEEMub5THxr/S1IW3gweUXmcxsk+d2bZA3flnMpHmdkhp5
	XfjnG9jZ5x6fcpE8SYro2wchXfo214NX88UNA4C5YHn+5gAnss9TupnqM7HyQnhMfqzkGfcTD6F
	x+jdVst0a5tQuFDFv8SGH10
X-Received: by 2002:a05:600c:828c:b0:482:dbd7:a1c1 with SMTP id 5b1f17b1804b1-483c9c23c72mr64791835e9.34.1772230084419;
        Fri, 27 Feb 2026 14:08:04 -0800 (PST)
Received: from [192.168.16.154] (host86-188-11-239.range86-188.btcentralplus.com. [86.188.11.239])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfb776b0sm71746555e9.1.2026.02.27.14.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 14:08:04 -0800 (PST)
Message-ID: <485524056b1c9588e81793964ff6bc0458401148.camel@linaro.org>
Subject: Re: [PATCH v8 15/18] arm64: dts: qcom: x1e80100-t14s: Add on
 ov02c10 RGB sensor on CSIPHY4
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
Date: Fri, 27 Feb 2026 22:08:03 +0000
In-Reply-To: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-15-95517393bcb2@linaro.org>
References: 
	<20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
	 <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-15-95517393bcb2@linaro.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53796-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.36:email,linaro.org:mid,linaro.org:dkim,linaro.org:email,0.0.0.3:email,0.0.0.0:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1B6151BE80F
X-Rspamd-Action: no action

Hi Bryan,

On Wed, 2026-02-25 at 15:11 +0000, Bryan O'Donoghue wrote:
> Switch on the ov02c10 RGB sensor on CSIPHY4.
>=20
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
Tested-by: Christopher Obbard <christopher.obbard@linaro.org>

>  .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    | 77 ++++++++++++++++=
++++++
>  1 file changed, 77 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi =
b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> index ee49785c9d005..54bf21f1c6f37 100644
> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> @@ -9,6 +9,7 @@
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/input/gpio-keys.h>
>  #include <dt-bindings/input/input.h>
> +#include <dt-bindings/phy/phy.h>
>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> =20
> @@ -866,6 +867,66 @@ vreg_l7m_2p8: ldo7 {
> =20
>  };
> =20
> +&camss {
> +	status =3D "okay";
> +
> +	ports {
> +		/*
> +		 * port0 =3D> csiphy0
> +		 * port1 =3D> csiphy1
> +		 * port2 =3D> csiphy2
> +		 * port3 =3D> csiphy4
> +		 */
> +		port@3 {
> +			camss_csiphy4_inep0: endpoint@0 {
> +				clock-lanes =3D <7>;
> +				data-lanes =3D <0 1>;
> +				remote-endpoint =3D <&ov02c10_ep>;
> +			};
> +		};
> +	};
> +};
> +
> +&cci1 {
> +	status =3D "okay";
> +};
> +
> +&cci1_i2c1 {
> +	camera@36 {
> +		compatible =3D "ovti,ov02c10";
> +		reg =3D <0x36>;
> +
> +		reset-gpios =3D <&tlmm 237 GPIO_ACTIVE_LOW>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&cam_rgb_default>;
> +
> +		clocks =3D <&camcc CAM_CC_MCLK4_CLK>;
> +		assigned-clocks =3D <&camcc CAM_CC_MCLK4_CLK>;
> +		assigned-clock-rates =3D <19200000>;
> +
> +		orientation =3D <0>; /* front facing */
> +
> +		avdd-supply =3D <&vreg_l7m_2p8>;
> +		dvdd-supply =3D <&vreg_l2m_1p2>;
> +		dovdd-supply =3D <&vreg_l4m_1p8>;
> +
> +		port {
> +			ov02c10_ep: endpoint {
> +				data-lanes =3D <1 2>;
> +				link-frequencies =3D /bits/ 64 <400000000>;
> +				remote-endpoint =3D <&camss_csiphy4_inep0>;
> +			};
> +		};
> +	};
> +};
> +
> +&csiphy4 {
> +	vdda-0p8-supply =3D <&vreg_l2c_0p8>;
> +	vdda-1p2-supply =3D <&vreg_l1c_1p2>;
> +
> +	status =3D "okay";
> +};
> +
>  &gpu {
>  	status =3D "okay";
>  };
> @@ -1447,6 +1508,22 @@ &tlmm {
>  			       <72 2>, /* Secure EC I2C connection (?) */
>  			       <238 1>; /* UFS Reset */
> =20
> +	cam_rgb_default: cam-rgb-default-state {
> +		mclk-pins {
> +			pins =3D "gpio100";
> +			function =3D "cam_aon";
> +			drive-strength =3D <16>;
> +			bias-disable;
> +		};
> +
> +		reset-n-pins {
> +			pins =3D "gpio237";
> +			function =3D "gpio";
> +			drive-strength =3D <2>;
> +			bias-disable;
> +		};
> +	};
> +
>  	ec_int_n_default: ec-int-n-state {
>  		pins =3D "gpio66";
>  		function =3D "gpio";

