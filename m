Return-Path: <linux-media+bounces-53790-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFYeBBYVomk0zAQAu9opvQ
	(envelope-from <linux-media+bounces-53790-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 23:05:10 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D31B1BE712
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 23:05:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0722A30AF874
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 22:04:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 155EC47A0D5;
	Fri, 27 Feb 2026 22:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SJtbfJM2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E54535A38C
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 22:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772229856; cv=none; b=Qp95hxtdHmEQ5d69D+ekvOk69//W3Npeh5Ix4g6tBC9mjovjoY+fqhvEL0niKcQIqmJEZtZ3dhQ33EY0cOoT1PcA8ZCK1uM9EbftJg1c68WoD2MgQVYuq5j+OPiGAte9ZcKQGn7CMOCbKerTqFS8i21n1h8szl2YN1lm2AZtKIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772229856; c=relaxed/simple;
	bh=Fn1+xlv4sVuLJvtcP8Y+Ff3UxlWJcj0ZhhG0o/CH5bc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DX8JJnZg5xH4Jp6muL0sgrqO2t6FzbX3/znLOfA1x5NdlCjjmkJQLWZxwhy1jKHh1CZcbh2eHCh+Q0oTgsMme9tZDL6NoJyr94288C7zXYpHJqk68jfqgarV+dMrYiRgqolC2j0Sdh+46E5aEOzwKhUFufpNZ/YJGVKKabQ2uMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SJtbfJM2; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso21224495e9.1
        for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 14:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772229853; x=1772834653; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QgYXSQoGqTg+lHfGXm2ZX+HC3rb5TB8gWO5tCTpe9Y4=;
        b=SJtbfJM2JXGKsipMMUxan3w8Im3SmZpVwPgsJJylriMMCUEd3/BHz1yNwCZrqk3xlv
         n7IaeSMSPLsWG6Op2Jt21jWRpNMK/xvECAoSITDIT9Rqq5uy6IlhGDA2ZGvGN86zzu1X
         bwIXf9LsVxW6uaa4821104Nhmu6pAKspuRp9qHBxXnEbB9EM89lIozJAOMjXZuMPj9GW
         DqdHZXeEOVC2kypCHGax4ySRn9VkBKBljllKSxiMFpNnaLlRclOhhBszlEzX3HqYasVu
         AYYc7n7CQDGeh7KbWV2mOzYE0TJvEsJ1OYYS6WlZbrs8MF0HUEjX3uWUj9fgaw5SMZwD
         twww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772229853; x=1772834653;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QgYXSQoGqTg+lHfGXm2ZX+HC3rb5TB8gWO5tCTpe9Y4=;
        b=Lu2X8R7OLWmaE+657xoP8e36QxSP5Bs3vn40SkBJio2CTzIWn/vkIYH1M6AFLFtQev
         G/HRV/sc/Ope77bqUbQejDj4faIAqELCT8euM0IfegkFC3LXXOc9hAOdTHTxMCSTZ19j
         tB3l09gQTHdJKSMalzlWsigCWiDMIpFvEFSxAanwdMhAfe3+S4h1hxW1bo5rm27NpJrX
         IyjeJvOIGgAZddJsXyrtSzqa5aSflpMiAzW8O1816CScLE+reJ4p31yWkms5h2b1NKpI
         YxXh6PFeU+0qlWhNU/ASbnrBCO45tveffwishsdlhURCaLp//w4JcKpYCnWbc1Ro77rW
         m2rA==
X-Forwarded-Encrypted: i=1; AJvYcCXmVHQJ5XmwadsAIHGu4a7lOnAFK47uiZ7FC+TDmCkfGmLiC2RjhZQiAVlpiYjDI6tTWOGJ6hAXBiUFOw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxAqwFVQGflGRCkNzRY3TSbc9YcAZ5S4evnVMI4SRaxDEn748R
	0WlK0/IcKiohPq5Kd3IrNoGoStQcrM/HioVGPCb+xw9BehrmPfui2KdyyAwEw3vBH60=
X-Gm-Gg: ATEYQzwuezyKxaRdaivReTWTnTwndTuMcMqVc6mGSjWzsfphztiRwKYrOhRwpFKoiAi
	eRig2mFBv/mFXi5+i6c5fOR5ppIXtDMmiznmqIHlLA5hnmXveyH3BuWjiFC0CLOEGJd5cBDYpLR
	+yYCdaBiffLJhmhenwznRDUkiGr7QGM9g50SOGKjmgDXdJpmTNbS+YafB9LWDirb+bMlCQXMljT
	oMH2lKuhVvE4fAdSj8rwRmTvxmWrhyMIWm4pwfDtaUDOE7W4wI5UngpbnjqKCco8VaZ/kruTdft
	9AfWq6whM7M0kG4SmnqCbFrTyVl988VPXk5S1sR9SXHOxG3Xoa0/rVm0mrdbSn0/+HoY89IIscB
	fXEGkFvcKNRiQfywHYzEb3PrtUaLEzXboLe1iVz3dVTXZloOoGAjnUAmnLIDwQ/RaHnJvLdgH4L
	dQcX6S/VqWFD2v6mAiv2inrkh8GDYv5Iw5NMcvnZkPjpz5FuZ7RD3IufHxIj49X2IPmfwa8v0rS
	KMs5s/om8JqXmgWF9mOGpV78edDYTAymB0=
X-Received: by 2002:a05:600c:4fc8:b0:480:4a90:1b00 with SMTP id 5b1f17b1804b1-483c9bead27mr63982935e9.20.1772229852834;
        Fri, 27 Feb 2026 14:04:12 -0800 (PST)
Received: from [192.168.16.154] (host86-188-11-239.range86-188.btcentralplus.com. [86.188.11.239])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd7031f3sm213289985e9.6.2026.02.27.14.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 14:04:12 -0800 (PST)
Message-ID: <e5ea9ca261ad05afdc30ab231f60c5d18c1007de.camel@linaro.org>
Subject: Re: [PATCH v8 09/18] arm64: dts: qcom: x1e80100: Add CCI definitions
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
	linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Konrad
 Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 22:04:11 +0000
In-Reply-To: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-9-95517393bcb2@linaro.org>
References: 
	<20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
	 <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-9-95517393bcb2@linaro.org>
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
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53790-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,baylibre.com,gmail.com];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christopher.obbard@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8D31B1BE712
X-Rspamd-Action: no action

Hi Bryan,

On Wed, 2026-02-25 at 15:11 +0000, Bryan O'Donoghue wrote:
> Add in two CCI buses.
>=20
> One bus has two CCI bus master pinouts:
> cci_i2c_sda0 =3D gpio101
> cci_i2c_scl0 =3D gpio102
>=20
> cci_i2c_sda1 =3D gpio103
> cci_i2c_scl1 =3D gpio104
>=20
> The second bus has two CCI bus master pinouts:
> cci_i2c_sda2 =3D gpio105
> cci_i2c_scl2 =3D gpio106
>=20
> aon_cci_i2c_sda3 =3D gpio235
> aon_cci_i2c_scl3 =3D gpio236
>=20
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
Tested-by: Christopher Obbard <christopher.obbard@linaro.org>

>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 149 ++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 149 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qc=
om/hamoa.dtsi
> index f96411f481305..38f9da6ad9ca5 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -5465,6 +5465,83 @@ videocc: clock-controller@aaf0000 {
>  			#power-domain-cells =3D <1>;
>  		};
> =20
> +		cci0: cci@ac15000 {
> +			compatible =3D "qcom,x1e80100-cci", "qcom,msm8996-cci";
> +			reg =3D <0 0x0ac15000 0 0x1000>;
> +
> +			interrupts =3D <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
> +
> +			clocks =3D <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CCI_0_CLK>;
> +			clock-names =3D "camnoc_axi",
> +				      "cpas_ahb",
> +				      "cci";
> +
> +			power-domains =3D <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +
> +			pinctrl-0 =3D <&cci0_default>;
> +			pinctrl-1 =3D <&cci0_sleep>;
> +			pinctrl-names =3D "default", "sleep";
> +
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			status =3D "disabled";
> +
> +			cci0_i2c0: i2c-bus@0 {
> +				reg =3D <0>;
> +				clock-frequency =3D <1000000>;
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +			};
> +
> +			cci0_i2c1: i2c-bus@1 {
> +				reg =3D <1>;
> +				clock-frequency =3D <1000000>;
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +			};
> +		};
> +
> +		cci1: cci@ac16000 {
> +			compatible =3D "qcom,x1e80100-cci", "qcom,msm8996-cci";
> +			reg =3D <0 0x0ac16000 0 0x1000>;
> +
> +			interrupts =3D <GIC_SPI 271 IRQ_TYPE_EDGE_RISING>;
> +
> +			clocks =3D <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CCI_1_CLK>;
> +			clock-names =3D "camnoc_axi",
> +				      "cpas_ahb",
> +				      "cci";
> +
> +			power-domains =3D <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +
> +			pinctrl-0 =3D <&cci1_default>;
> +			pinctrl-1 =3D <&cci1_sleep>;
> +			pinctrl-names =3D "default", "sleep";
> +
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			status =3D "disabled";
> +
> +			cci1_i2c0: i2c-bus@0 {
> +				reg =3D <0>;
> +				clock-frequency =3D <1000000>;
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +			};
> +
> +			cci1_i2c1: i2c-bus@1 {
> +				reg =3D <1>;
> +				clock-frequency =3D <1000000>;
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +			};
> +		};
> =20
>  		camcc: clock-controller@ade0000 {
>  			compatible =3D "qcom,x1e80100-camcc";
> @@ -6116,6 +6193,78 @@ tlmm: pinctrl@f100000 {
>  			gpio-ranges =3D <&tlmm 0 0 239>;
>  			wakeup-parent =3D <&pdc>;
> =20
> +			cci0_default: cci0-default-state {
> +				cci0_i2c0_default: cci0-i2c0-default-pins {
> +					/* cci_i2c_sda0, cci_i2c_scl0 */
> +					pins =3D "gpio101", "gpio102";
> +					function =3D "cci_i2c";
> +					drive-strength =3D <2>;
> +					bias-pull-up;
> +				};
> +
> +				cci0_i2c1_default: cci0-i2c1-default-pins {
> +					/* cci_i2c_sda1, cci_i2c_scl1 */
> +					pins =3D "gpio103", "gpio104";
> +					function =3D "cci_i2c";
> +					drive-strength =3D <2>;
> +					bias-pull-up;
> +				};
> +			};
> +
> +			cci0_sleep: cci0-sleep-state {
> +				cci0_i2c0_sleep: cci0-i2c0-sleep-pins {
> +					/* cci_i2c_sda0, cci_i2c_scl0 */
> +					pins =3D "gpio101", "gpio102";
> +					function =3D "cci_i2c";
> +					drive-strength =3D <2>;
> +					bias-pull-down;
> +				};
> +
> +				cci0_i2c1_sleep: cci0-i2c1-sleep-pins {
> +					/* cci_i2c_sda1, cci_i2c_scl1 */
> +					pins =3D "gpio103", "gpio104";
> +					function =3D "cci_i2c";
> +					drive-strength =3D <2>;
> +					bias-pull-down;
> +				};
> +			};
> +
> +			cci1_default: cci1-default-state {
> +				cci1_i2c0_default: cci1-i2c0-default-pins {
> +					/* cci_i2c_sda2, cci_i2c_scl2 */
> +					pins =3D "gpio105", "gpio106";
> +					function =3D "cci_i2c";
> +					drive-strength =3D <2>;
> +					bias-pull-up;
> +				};
> +
> +				cci1_i2c1_default: cci1-i2c1-default-pins {
> +					/* aon_cci_i2c_sda3, aon_cci_i2c_scl3 */
> +					pins =3D "gpio235", "gpio236";
> +					function =3D "aon_cci";
> +					drive-strength =3D <2>;
> +					bias-pull-up;
> +				};
> +			};
> +
> +			cci1_sleep: cci1-sleep-state {
> +				cci1_i2c0_sleep: cci1-i2c0-sleep-pins {
> +					/* cci_i2c_sda2, cci_i2c_scl2 */
> +					pins =3D "gpio105", "gpio106";
> +					function =3D "cci_i2c";
> +					drive-strength =3D <2>;
> +					bias-pull-down;
> +				};
> +
> +				cci1_i2c1_sleep: cci1-i2c1-sleep-pins {
> +					/* aon_cci_i2c_sda3, aon_cci_i2c_scl3 */
> +					pins =3D "gpio235", "gpio236";
> +					function =3D "aon_cci";
> +					drive-strength =3D <2>;
> +					bias-pull-down;
> +				};
> +			};
> +
>  			edp0_hpd_default: edp0-hpd-default-state {
>  				pins =3D "gpio119";
>  				function =3D "edp0_hot";

