Return-Path: <linux-media+bounces-53797-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MDJN/cVommizAQAu9opvQ
	(envelope-from <linux-media+bounces-53797-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 23:08:55 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4781BE820
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 23:08:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7645B305F324
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 22:08:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A710C47AF4C;
	Fri, 27 Feb 2026 22:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yXIRqj1e"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DD147A0B3
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 22:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772230109; cv=none; b=GIuwvab+mj3I6DMMhym6gNMvchb3Fw7QH2Ag5XgZXnpT2ysxFrgd7rLdIi7WC40wSpFRIhtiKX7JCuNS54UaZwuVAxgqgSX9O66tby2eY4oRh46Fi4PY2W1m73euEmRPjSaEvgIRJ0TZHKvVBC2CMKR4w8usDrDfYCsYZhi86UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772230109; c=relaxed/simple;
	bh=Mb2V1kz8SmOB9dG55Z05i6Vkzl2XRS9xEoOEgGRATdQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CCRI/Ob6fq+07bqsnWccgWBAn1Lz5969TZJAJnOISOP0C1b4IMbDQvW61JRB6NnVF2Ul4rhWGtNGK2ceYMS9Iz/P/HHsLqIE9EKOdP1ArwFeYOAoZB/7UgBwC+SvrKKy+QEp6FZd/97VoE6c1qlYEgq2xkIHJGOZaWf+7Hv5Was=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yXIRqj1e; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4837584120eso18232465e9.1
        for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 14:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772230106; x=1772834906; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dA5B+tb+Eq6OoOsXIA4NDTzmJV2und0D9K22z1ftkxg=;
        b=yXIRqj1eze4KGVBYoOdu/Zk4LqnljqcMPMFbhEUm587B2C3KDeiHzrtR/GcGTEFBVl
         twfHMZxiP16f3Mn//uYN+VA1ycrjSLx2TEUmIhLuwOyRzPeidErRgvfnE9KhfC5ml+vB
         b89IE7YlAn2ukIMILAa1gD4N3YXjjW50+lQqIE13z82M/c8X3hPwrctb1Uw2Fa+nmIYU
         UZ8psFWODopboDVWk7cRvpw3drxZ3+6s3HFDQgamINrc8UyF4gKXXyncQuZZ5Zv68M3Q
         qlPQlYr3I7r/WyzV4hk/fPh8FsgSapquAM14ArWSLZ/f2G7uDis2kLbwCaLO3DcbioVh
         zICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772230106; x=1772834906;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dA5B+tb+Eq6OoOsXIA4NDTzmJV2und0D9K22z1ftkxg=;
        b=rGgUq7W5ooh9nDEenG2r6cEtU2AOR9AVJJkKjdW/XTCPdqBFauD3Nns7UNqm1gUH5h
         xFyj1lruI8ZE8905JyU1Y5OMQfgrCNX28q9CvwXvlpFFfh7A7sf8CRDUieH4E069iPZ2
         RIpi/UryRAwnrqlNeTnBnUxny5Lz24UlnSEEr5Y5WXf/5eT0ChpGNE/TDVjbvCDxACAr
         nssoR69EdG0Og+BMlcPtct/Z2r1PYapsoKYo/VYoqqBHHUiWiTCTEm4jQC7LUcSf2N2H
         EisJFjyP+HXKBjMcMa6rVtLKHIQQVg+sAZerbogbJiT4MPJ1LzGjBoQ323bjN2pzq1R+
         bhpA==
X-Forwarded-Encrypted: i=1; AJvYcCUoSboiFziX4n6WY39K4q02F1V06avq/YNo1q3pcnEi3/Hq2aP8LCOOP+cLp/KZYjFByNFZ99icQXBlQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyuUESRKgEYWMrYk3MnW1vgblPU54KFownM5XlWuHQ914eCcMuP
	mHqqicdtUFiHBzIBHSXndHLBJ0eHSMYCpSUw7/AAtXdymyHOXPjzS81WUcllK6QmtHQ=
X-Gm-Gg: ATEYQzxH3zbie/gHUpplY0obzjBQaJJ2+0Cl2AU3kFYVXPy8EuG2dMABg0n/Lf7n8eH
	MuBiQLIVZsmbb3V+FuQ+k17YE0SENKseznAb3UqqLStMTi4fTZFT4iFq99JwyAzw4tsP3gkK+ln
	2xFNjcUbwybpgguLKbLj7kctyuu0gTABW8cVslV3IC/v0tGrmleW6rESMoiDXFAO34k4rHCi8dA
	dPaR0TLjtSdUqqQ+RjdAei3l0+KTQcvqHTukuwCHe97Q+0P8H3nWwNYIKF99OXK39R1iZ+kbyhV
	BIUOVOHJz50D2Gpd0P1BVc/u9TMj8b+32L5LlFBP7pbn9QuSDRCx6YHDrlpT620NlpCSnEsZuED
	OKGPgw4qAD4YxRdUq1SbuNM21r3K622EYACw7J5reeYCJuYOP8RWwOS8rXhtV3odtSGkbV4SnGd
	PPviG/MWBNt5FuyKDo1PSJCaI0nP6q7akpI9HLSvOihlfcSon+PnIsI7NM6HadmRumgCI0USQJi
	fwPiIZAH+GnS+EzFU25g17N
X-Received: by 2002:a05:600c:1d12:b0:483:9cdc:8ac1 with SMTP id 5b1f17b1804b1-483c9b9eb7amr63356545e9.11.1772230106259;
        Fri, 27 Feb 2026 14:08:26 -0800 (PST)
Received: from [192.168.16.154] (host86-188-11-239.range86-188.btcentralplus.com. [86.188.11.239])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b89c99sm130583315e9.15.2026.02.27.14.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 14:08:25 -0800 (PST)
Message-ID: <58900cdf8f5159116b12278ba31da4aaea8d6cc5.camel@linaro.org>
Subject: Re: [PATCH v8 16/18] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x:
 Add pm8010 camera PMIC with voltage levels for IR and RGB camera
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
Date: Fri, 27 Feb 2026 22:08:25 +0000
In-Reply-To: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-16-95517393bcb2@linaro.org>
References: 
	<20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
	 <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-16-95517393bcb2@linaro.org>
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
	TAGGED_FROM(0.00)[bounces-53797-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:dkim,linaro.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5B4781BE820
X-Rspamd-Action: no action

Hi Bryan,

On Wed, 2026-02-25 at 15:11 +0000, Bryan O'Donoghue wrote:
> Add voltage regulators-8 for Camera on slim7x including:
>=20
> - vreg_l7m_2p8
> - vreg_l2m_1p2
> - vreg_l4m_1p8
>=20
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Reviewed-by: Christopher Obbard <christopher.obbard@linaro.or>

>  .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 51 ++++++++++++++++=
++++++
>  1 file changed, 51 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/a=
rch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> index d6472e5a3f9fa..f10dff1da7f8e 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> @@ -795,6 +795,57 @@ vreg_l3j_0p8: ldo3 {
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
> +		vreg_l1m_1p2: ldo1 {
> +			regulator-name =3D "vreg_l1m_1p2";
> +			regulator-min-microvolt =3D <1200000>;
> +			regulator-max-microvolt =3D <1260000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2m_1p2: ldo2 {
> +			regulator-name =3D "vreg_l2m_1p2";
> +			regulator-min-microvolt =3D <1200000>;
> +			regulator-max-microvolt =3D <1260000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l3m_1p8: ldo3 {
> +			regulator-name =3D "vreg_l3m_1p8";
> +			regulator-min-microvolt =3D <1800000>;
> +			regulator-max-microvolt =3D <1900000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l4m_1p8: ldo4 {
> +			regulator-name =3D "vreg_l4m_1p8";
> +			regulator-min-microvolt =3D <1800000>;
> +			regulator-max-microvolt =3D <1900000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l5m_2p8: ldo5 {
> +			regulator-name =3D "vreg_l5m_2p8";
> +			regulator-min-microvolt =3D <2800000>;
> +			regulator-max-microvolt =3D <3072000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l7m_2p8: ldo7 {
> +			regulator-name =3D "vreg_l7m_2p8";
> +			regulator-min-microvolt =3D <2800000>;
> +			regulator-max-microvolt =3D <3072000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
>  };
> =20
>  &gpu {

