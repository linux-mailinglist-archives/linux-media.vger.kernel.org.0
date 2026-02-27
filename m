Return-Path: <linux-media+bounces-53786-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMzjHN0Uomk0zAQAu9opvQ
	(envelope-from <linux-media+bounces-53786-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 23:04:13 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD10E1BE6AA
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 23:04:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA3CB3040A99
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 22:02:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6754547A0B8;
	Fri, 27 Feb 2026 22:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vsAWn+Wi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532FE39A7E8
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 22:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772229760; cv=none; b=Dd/rrV+qJS8PIXuJXhPJxy/4nh/lZ8bRNdMNhoAGD5KYXZZx9Qnwf/H6g01to2BeBNUrXpCIcN1jYEHOvl92JWnd8ZbyldOAP9n7KTTVqb+laXI5/L/e4buArZDdhIOYv7+8h5y1oLXdeSPlU+AtbbwfNIYbmjA/j1c1IKnn0Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772229760; c=relaxed/simple;
	bh=4Fb26j5vTfieYch+seVLLPeFSYE4hBxYLaTjZ68Ieuc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QgzKrTA0J3EX/koW+a2FUMw+OZEOa2HasreMRn5WWJjR7ROHuMbO9idwbPm2ahqNaOPKKH7H4QRjjj+wM8MjEtOLMGniPM3DEw4stB1DLq16CSFTLUnS2qUxNPtuqfYaqQVzNpdfXU6VF2aT2dUxlRLGBKe5fFEtndpX59Y13Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vsAWn+Wi; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-483a233819aso25086625e9.3
        for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 14:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772229758; x=1772834558; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qbVQyBBqf3r/Whw+7lnX7iODWdqwkPoqOOSohK0cUc4=;
        b=vsAWn+WiosGwdOxk3EyBLoFb0Zh5GAvwNj569vZjoM5Be/dDtYBGpLX+sttEt1atNu
         JGxctc0luFxQtxXHGqcMoBsAyH1FJ8DxQURWrNiJcbspAdLW2XLzDw5EZ8avv8IWxJ2M
         hcUqD5UpUjB2u4bn1u1d++5YZ80S0Jf+4BpmS1wSgTlcZ+lpckcGqm0q7j9h16rS1X7w
         FHy7UePlh2xiO5UkAA3QppvfaSGWKc22HrkFPFlzflr9V63QrWJMoSsC6ZJQ46WC2tNk
         Pie1tyJlehw8BfGFoDUa7L8+mNq57SXnrF+c9wlMukTFC6TO7Yfg09qy079mEUDIyGPc
         piIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772229758; x=1772834558;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qbVQyBBqf3r/Whw+7lnX7iODWdqwkPoqOOSohK0cUc4=;
        b=Z5kpYjfJLrsAUMF31KXodA6TBSz3tKTidQsYlPEG+CsphFmbgZEEizNCTo0DQpqdx6
         ugJ36zJpmJXr5j0Mps5XDR4GD+THUIsVYKlX9mItaChJXi0q4V6wu2QWVTjccS4Dlchb
         Z46qgzpS9QmU8IBEEGMErQlxZuMXBgbr97O4IggDMrqRlTOaKH0YCz+W9OItFma8QtCF
         ptukPsDC5tXIhMEmGFovYioZFueRoBVd6i2Zxxpi/Wt4KDG9k5K80K260k7apoluEeU2
         mRORz/642ngAx691kfU9Uk6+RM8EKyUKJ35BRTP+BPGEkT9uhInq6igUJLE2ePwl0M+X
         HvuA==
X-Forwarded-Encrypted: i=1; AJvYcCV5V3U+35iBxnvcTmj/CZ79a2x42eMykwO5QW/iNrCGKYjvtDoEt86eycV154KP1dcKoMmqwnXQWOJGbw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/Q1Wj6+6h3D19IbksUlkeAgpn1ewGQLQxLLjhFBfqdzdbAk6T
	I9MyN5WPqMQN1YWvpzS/K0xfelJNuJaHP7sKedAXm3GgUekxzJe3sAk8uB7z3KmmUGA=
X-Gm-Gg: ATEYQzyZCJjqeoOcbKBOY05+6abfjEGB3+rFYgnj2x4SUtjEvDs3Yvw5ERhUbsJDRif
	kwuiPHaeuhigzU2fbY3ZBtGHa4U8JPPUtFRhIGClI/G7stdSnQBL8LkNkGULmkIsCUR3a5Tm11Q
	TzxtS6VMaJhhne/9/u1cye2j+2OM/gMTdDh4DxvEAWDWP4CT2YcnepgP9/7QFIMXd0ygCxdyt/i
	zn8nv1tm207dAAyX9J5YnpUoWWKfYAAT1SG7xSZqgIwJmnAmKwH7lP4id8xKS9gSaI81IQZDmAG
	lajtISYM38sCwFRba9NNMuqQ6tJMyI7pJWzALoggAcmUEdC4q8ewZWVa1B+P6b/7hce+0i4/hiI
	pm12+9BIjILnJOoTXks8kF1vq8LRKniL9LVy3JPw6f3u/MKEMpFX2wGAa7W5CPcuTQMtCTqWsOU
	R7/xIdVQ0rTKXpJw82yz5LUPjcj2EbK9kGa36uyud5kS+IegSo00hBmBXrw0JRJus25u0R12t79
	2KHtCfTU1hkm6olO8UCfb+lMLtNX1sp92s=
X-Received: by 2002:a05:600c:4e08:b0:477:fcb:2256 with SMTP id 5b1f17b1804b1-483c9c0bb0amr67180355e9.17.1772229757631;
        Fri, 27 Feb 2026 14:02:37 -0800 (PST)
Received: from [192.168.16.154] (host86-188-11-239.range86-188.btcentralplus.com. [86.188.11.239])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd765604sm209952065e9.15.2026.02.27.14.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 14:02:37 -0800 (PST)
Message-ID: <22126bec3375b76f197cf7e70baa5e33a21bf0d6.camel@linaro.org>
Subject: Re: [PATCH v8 05/18] media: qcom: camss: Add legacy_phy flag to SoC
 definition structures
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
Date: Fri, 27 Feb 2026 22:02:36 +0000
In-Reply-To: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-5-95517393bcb2@linaro.org>
References: 
	<20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
	 <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-5-95517393bcb2@linaro.org>
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
	TAGGED_FROM(0.00)[bounces-53786-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:dkim,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BD10E1BE6AA
X-Rspamd-Action: no action

Hi Bryan,

On Wed, 2026-02-25 at 15:11 +0000, Bryan O'Donoghue wrote:
> Flag which SoCs have legacy - builtin PHY code. This will be useful in
> subsequent patches to inform PHY bringup logic if legacy bindings are
> available.
>=20
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
Tested-by: Christopher Obbard <christopher.obbard@linaro.org>

> ---
>  drivers/media/platform/qcom/camss/camss.c | 17 +++++++++++++++++
>  drivers/media/platform/qcom/camss/camss.h |  1 +
>  2 files changed, 18 insertions(+)
>=20
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 00b87fd9afbd8..5fb5ad87e1671 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -5104,6 +5104,7 @@ static void camss_remove(struct platform_device *pd=
ev)
> =20
>  static const struct camss_resources msm8916_resources =3D {
>  	.version =3D CAMSS_8x16,
> +	.legacy_phy =3D true,
>  	.csiphy_res =3D csiphy_res_8x16,
>  	.csid_res =3D csid_res_8x16,
>  	.ispif_res =3D &ispif_res_8x16,
> @@ -5115,6 +5116,7 @@ static const struct camss_resources msm8916_resourc=
es =3D {
> =20
>  static const struct camss_resources msm8939_resources =3D {
>  	.version =3D CAMSS_8x39,
> +	.legacy_phy =3D true,
>  	.csiphy_res =3D csiphy_res_8x39,
>  	.csid_res =3D csid_res_8x39,
>  	.ispif_res =3D &ispif_res_8x39,
> @@ -5126,6 +5128,7 @@ static const struct camss_resources msm8939_resourc=
es =3D {
> =20
>  static const struct camss_resources msm8953_resources =3D {
>  	.version =3D CAMSS_8x53,
> +	.legacy_phy =3D true,
>  	.icc_res =3D icc_res_8x53,
>  	.icc_path_num =3D ARRAY_SIZE(icc_res_8x53),
>  	.csiphy_res =3D csiphy_res_8x96,
> @@ -5139,6 +5142,7 @@ static const struct camss_resources msm8953_resourc=
es =3D {
> =20
>  static const struct camss_resources msm8996_resources =3D {
>  	.version =3D CAMSS_8x96,
> +	.legacy_phy =3D true,
>  	.csiphy_res =3D csiphy_res_8x96,
>  	.csid_res =3D csid_res_8x96,
>  	.ispif_res =3D &ispif_res_8x96,
> @@ -5150,6 +5154,7 @@ static const struct camss_resources msm8996_resourc=
es =3D {
> =20
>  static const struct camss_resources qcm2290_resources =3D {
>  	.version =3D CAMSS_2290,
> +	.legacy_phy =3D true,
>  	.csiphy_res =3D csiphy_res_2290,
>  	.csid_res =3D csid_res_2290,
>  	.vfe_res =3D vfe_res_2290,
> @@ -5163,6 +5168,7 @@ static const struct camss_resources qcm2290_resourc=
es =3D {
>  static const struct camss_resources qcs8300_resources =3D {
>  	.version =3D CAMSS_8300,
>  	.pd_name =3D "top",
> +	.legacy_phy =3D true,
>  	.csiphy_res =3D csiphy_res_8300,
>  	.csid_res =3D csid_res_8775p,
>  	.csid_wrapper_res =3D &csid_wrapper_res_sm8550,
> @@ -5177,6 +5183,7 @@ static const struct camss_resources qcs8300_resourc=
es =3D {
>  static const struct camss_resources sa8775p_resources =3D {
>  	.version =3D CAMSS_8775P,
>  	.pd_name =3D "top",
> +	.legacy_phy =3D true,
>  	.csiphy_res =3D csiphy_res_8775p,
>  	.csid_res =3D csid_res_8775p,
>  	.csid_wrapper_res =3D &csid_wrapper_res_sm8550,
> @@ -5190,6 +5197,7 @@ static const struct camss_resources sa8775p_resourc=
es =3D {
> =20
>  static const struct camss_resources sdm660_resources =3D {
>  	.version =3D CAMSS_660,
> +	.legacy_phy =3D true,
>  	.csiphy_res =3D csiphy_res_660,
>  	.csid_res =3D csid_res_660,
>  	.ispif_res =3D &ispif_res_660,
> @@ -5201,6 +5209,7 @@ static const struct camss_resources sdm660_resource=
s =3D {
> =20
>  static const struct camss_resources sdm670_resources =3D {
>  	.version =3D CAMSS_845,
> +	.legacy_phy =3D true,
>  	.csiphy_res =3D csiphy_res_670,
>  	.csid_res =3D csid_res_670,
>  	.vfe_res =3D vfe_res_670,
> @@ -5212,6 +5221,7 @@ static const struct camss_resources sdm670_resource=
s =3D {
>  static const struct camss_resources sdm845_resources =3D {
>  	.version =3D CAMSS_845,
>  	.pd_name =3D "top",
> +	.legacy_phy =3D true,
>  	.csiphy_res =3D csiphy_res_845,
>  	.csid_res =3D csid_res_845,
>  	.vfe_res =3D vfe_res_845,
> @@ -5223,6 +5233,7 @@ static const struct camss_resources sdm845_resource=
s =3D {
>  static const struct camss_resources sm6150_resources =3D {
>  	.version =3D CAMSS_6150,
>  	.pd_name =3D "top",
> +	.legacy_phy =3D true,
>  	.csiphy_res =3D csiphy_res_sm6150,
>  	.csid_res =3D csid_res_sm6150,
>  	.vfe_res =3D vfe_res_sm6150,
> @@ -5236,6 +5247,7 @@ static const struct camss_resources sm6150_resource=
s =3D {
>  static const struct camss_resources sm8250_resources =3D {
>  	.version =3D CAMSS_8250,
>  	.pd_name =3D "top",
> +	.legacy_phy =3D true,
>  	.csiphy_res =3D csiphy_res_8250,
>  	.csid_res =3D csid_res_8250,
>  	.vfe_res =3D vfe_res_8250,
> @@ -5249,6 +5261,7 @@ static const struct camss_resources sm8250_resource=
s =3D {
>  static const struct camss_resources sc8280xp_resources =3D {
>  	.version =3D CAMSS_8280XP,
>  	.pd_name =3D "top",
> +	.legacy_phy =3D true,
>  	.csiphy_res =3D csiphy_res_sc8280xp,
>  	.csid_res =3D csid_res_sc8280xp,
>  	.ispif_res =3D NULL,
> @@ -5263,6 +5276,7 @@ static const struct camss_resources sc8280xp_resour=
ces =3D {
>  static const struct camss_resources sc7280_resources =3D {
>  	.version =3D CAMSS_7280,
>  	.pd_name =3D "top",
> +	.legacy_phy =3D true,
>  	.csiphy_res =3D csiphy_res_7280,
>  	.csid_res =3D csid_res_7280,
>  	.vfe_res =3D vfe_res_7280,
> @@ -5276,6 +5290,7 @@ static const struct camss_resources sc7280_resource=
s =3D {
>  static const struct camss_resources sm8550_resources =3D {
>  	.version =3D CAMSS_8550,
>  	.pd_name =3D "top",
> +	.legacy_phy =3D true,
>  	.csiphy_res =3D csiphy_res_8550,
>  	.csid_res =3D csid_res_8550,
>  	.vfe_res =3D vfe_res_8550,
> @@ -5290,6 +5305,7 @@ static const struct camss_resources sm8550_resource=
s =3D {
>  static const struct camss_resources sm8650_resources =3D {
>  	.version =3D CAMSS_8650,
>  	.pd_name =3D "top",
> +	.legacy_phy =3D true,
>  	.csiphy_res =3D csiphy_res_sm8650,
>  	.csid_res =3D csid_res_sm8650,
>  	.csid_wrapper_res =3D &csid_wrapper_res_sm8550,
> @@ -5304,6 +5320,7 @@ static const struct camss_resources sm8650_resource=
s =3D {
>  static const struct camss_resources x1e80100_resources =3D {
>  	.version =3D CAMSS_X1E80100,
>  	.pd_name =3D "top",
> +	.legacy_phy =3D true,
>  	.csiphy_res =3D csiphy_res_x1e80100,
>  	.csid_res =3D csid_res_x1e80100,
>  	.vfe_res =3D vfe_res_x1e80100,
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/pl=
atform/qcom/camss/camss.h
> index 6d048414c919e..24ec3ad7990e7 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -104,6 +104,7 @@ enum icc_count {
>  struct camss_resources {
>  	enum camss_version version;
>  	const char *pd_name;
> +	const bool legacy_phy;
>  	const struct camss_subdev_resources *csiphy_res;
>  	const struct camss_subdev_resources *csid_res;
>  	const struct camss_subdev_resources *ispif_res;

