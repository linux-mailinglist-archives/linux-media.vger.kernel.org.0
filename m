Return-Path: <linux-media+bounces-53794-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFf1AWQVomk0zAQAu9opvQ
	(envelope-from <linux-media+bounces-53794-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 23:06:28 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EEF1BE767
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 23:06:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 04A7430B7A26
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 22:05:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D07447A0B3;
	Fri, 27 Feb 2026 22:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="krn+TKrO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EE546AEF1
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 22:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772229945; cv=none; b=lJ5/hE9i/EFnqz9onHCNgt1ytvQheMfYD/MfHBiqNZI8v9shyr4WGe3nJasPdY1MvIHHlFQp87k/4MhmF4Cw1+hitHnCI/nfghkFn496uxW6R8zQc9e971g41rySMk53B69vUTnVHhl8wm9R8id44AhIPsKLjoYO3x/kIQtGJkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772229945; c=relaxed/simple;
	bh=Gb6QcE9aWdGZHOycjMfnRVrXJxZtn+RbpOpm64+TpQc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RQa/FmmzqJ2oaecgRsabHoxWvhDqCjylT6ZSXW3GxBKWo76n+b1vMZidsoydNshd1wy5E6tff/B2HT5jPs9tWqlXAQz6sjd4ylVb8+LFw7xjMhtU5Qk8801H7hlixLlNC/F6gDWRE7Guox7d94Bs9cyDeslzVFjhX5urGbBrxQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=krn+TKrO; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4836e3288cdso16892925e9.0
        for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 14:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772229940; x=1772834740; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4JMcfUdK/nUzNjmnLhc+bvOBnyXoR2d2FLx4EtX6jrQ=;
        b=krn+TKrOU3HnqkakNzoqDwrOdJEX7JC2ghY4PugqZBTlT/GGRbRooh/6Oc8NR59y/i
         pAORAZY6QmXZd6GPc5/HovR0ciI1rwvCEqY2vzbgaVrBxa959moB3qPbE3Sazn8bvmwi
         mE8B9OK/5pOyKnXBeRUt+Etu5KXZABUJjlshNuvC206YoKp2kqIp9baaT1bcv1e7kHJv
         0988yw8J32p+5KckVtUTEoFIv4Cjw2Cqz9fKqBXfkqzA9CZli4mtAngOq8fYJu6XZDCx
         7TnuAVnhiLSlfMMHB/lfQI2F3PU1vbDfZD/3453IpXiOrH5Cqk+7HEVTx3aNtjh4eOIh
         554Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772229940; x=1772834740;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4JMcfUdK/nUzNjmnLhc+bvOBnyXoR2d2FLx4EtX6jrQ=;
        b=D0sr9mgTOnEUcXxp6L2DuacaDhGz8KU2Xfm3m2DTbMouUoo5rzLC6+vgonSkMAkWiW
         7awkr741yIBCMhYSx4sDT5KE+Jdm3MBMgcOOBTd2P/VlCHMnBxamhPrBQ23+7XbPt7Pt
         D9xEKhXA36312VePIwqAC+NoKt1ttPUw3Bb5HeY7H/dSgF06B+rPs/0VAXmw/kBlrF+Y
         4HnkblxJLYH/huHHb4KZXE8KCKZ3PzX1ygM0QAzYPUVAONwxWIvPEN9X73UaSNBP2eR+
         OaAtV476OSmHpFwGFGW4l+tVcQGEAhLhozqztztx6Db/UMYAcjeKXaZNFujEKIIf9jhI
         HGOw==
X-Forwarded-Encrypted: i=1; AJvYcCU7LejojdYyTJZx1xlXS782ywmJuY2reBIHuOZEHWISPMekyxT+CDa8c1PC3j3Yktcfxp9FcApcGwliaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywotg7IP9lrKwqkMPpBACpfkOl55otExHRL6E19wxf5sEPypJr9
	vDvlicTev8ONiNGdJbceZzhnxMYW9XVMEpdEYXktda9Yk/56421raYc0HnFwYcD8gz0=
X-Gm-Gg: ATEYQzxcoh35LONShhQ2QltYbE9lcuk4+48u2i9MHzOQlIWj2pIr85XbvM0/BIITkxp
	OrF22o3t3/vLUVhnjE6tdMI6/F/avXonUuBVG9DDKK65JwNvrIAiL467SqGORpxSte7bo03LLaH
	m3pqeXgf/QPQ3vCl99MYFPZfqnKNdSzGJViDPSo0ffahOejXT0JlulXcWrkkQbgb7UXv6p3JCye
	yehxK/itnetuTryBw2r17lV8ljjYYxEOsE3xYFhu0K3mYp6DKkoIlh2CKI8l+dUUCNFTN5l+H5L
	qaZ00JYMb14ha5bzrpHd9YNSg37Y87lEZwn5ije7NFcq69ck/NVn2N5Wxo0mZi8TtCNRjjohOBr
	yeGVAUDtXptegjWd/06O+oQR0tb3eMSfF8PA5w/fSryoMXAoekZU5cwEGw4jOhih3MDorbN0URz
	JuLGwy9vjbvedXj3tkWSaNu19kbbMD3iqe5HjzVopQ/e8GsZq7Cz2vnPlsgmU0T/9Bdjc/FAj7t
	ebnzte0r/r5LuykfUN4K7zYEUzdPiIoGBo=
X-Received: by 2002:a05:600c:1549:b0:47e:e59c:67c5 with SMTP id 5b1f17b1804b1-483c990de68mr72621495e9.8.1772229940362;
        Fri, 27 Feb 2026 14:05:40 -0800 (PST)
Received: from [192.168.16.154] (host86-188-11-239.range86-188.btcentralplus.com. [86.188.11.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c765c67sm10252283f8f.32.2026.02.27.14.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 14:05:40 -0800 (PST)
Message-ID: <a90ab7f217e3d2ad4ac9b926fcb5c9d8a6ce43e6.camel@linaro.org>
Subject: Re: [PATCH v8 12/18] arm64: dts: qcom: x1e80100-crd: Add pm8010 CRD
 pmic,id=m regulators
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
Date: Fri, 27 Feb 2026 22:05:39 +0000
In-Reply-To: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-12-95517393bcb2@linaro.org>
References: 
	<20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
	 <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-12-95517393bcb2@linaro.org>
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
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53794-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,baylibre.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christopher.obbard@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,linaro.org:mid,linaro.org:dkim,linaro.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 71EEF1BE767
X-Rspamd-Action: no action

Hi Bryan,

On Wed, 2026-02-25 at 15:11 +0000, Bryan O'Donoghue wrote:
> Add pmic,id =3D m rpmh to regulator definitions. This regulator set provi=
des
> vreg_l3m_1p8 the regulator for the ov08x40 RGB sensor on the CRD.
>=20
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>

>  arch/arm64/boot/dts/qcom/x1-crd.dtsi | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/q=
com/x1-crd.dtsi
> index ded96fb43489b..c89f5ad0aed56 100644
> --- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
> @@ -865,6 +865,36 @@ vreg_l3j_0p8: ldo3 {
>  			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>  		};
>  	};
> +
> +	regulators-8 {
> +		compatible =3D "qcom,pm8010-rpmh-regulators";
> +		qcom,pmic-id =3D "m";
> +
> +		vdd-l1-l2-supply =3D <&vreg_s5j_1p2>;
> +		vdd-l3-l4-supply =3D <&vreg_s4c_1p8>;
> +		vdd-l7-supply =3D <&vreg_bob1>;
> +
> +		vreg_l3m_1p8: ldo3 {
> +			regulator-name =3D "vreg_l3m_1p8";
> +			regulator-min-microvolt =3D <1800000>;
> +			regulator-max-microvolt =3D <1808000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l4m_1p8: ldo4 {
> +			regulator-name =3D "vreg_l4m_1p8";
> +			regulator-min-microvolt =3D <1800000>;
> +			regulator-max-microvolt =3D <1808000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l7m_2p9: ldo7 {
> +			regulator-name =3D "vreg_l7m_2p9";
> +			regulator-min-microvolt =3D <2912000>;
> +			regulator-max-microvolt =3D <2912000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
>  };
> =20
>  &gpu {

