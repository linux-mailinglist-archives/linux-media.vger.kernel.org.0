Return-Path: <linux-media+bounces-43640-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AFDBB3F56
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 14:58:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C680E3A8924
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 12:58:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECB453115A2;
	Thu,  2 Oct 2025 12:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Iny3QpE/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A702DF146
	for <linux-media@vger.kernel.org>; Thu,  2 Oct 2025 12:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759409894; cv=none; b=CUb9oxXxx1VzRc0FZcnPAg+wxv72pqZIjv5IS/unP6hrSMxTFpVcJC3zJQm9tULuPnHfG9UbiYQSRo0V3l0EH+32pUGolrozcDXmMIKIYZH/AzLVUS+luM9940+zFaXUVTQ7IPG2yzv5K3t5LyZM/SydeDnbnUBMdGv+nAaRu0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759409894; c=relaxed/simple;
	bh=rwoTCG+vC/4a27tvGJXVSo3x+Qr28gT1DgOxt1WVOj4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=dEaVFJjuZfXc5gyD1wPwvvL2Lne1GsgoT8IRHXNzu6s1pr2SW3y80tcTkvp2MiHRxdRDRROdlS/oC6wZim0/XU6c1UTaCBCfHTYNbiULpgtTKj5CsE2EdfVsMjf/Nmv9wQUSvGyFhC2auWgkeoW1RaI/raFfl8R1+Z1oGw2K/sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Iny3QpE/; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-62fca01f0d9so2089023a12.3
        for <linux-media@vger.kernel.org>; Thu, 02 Oct 2025 05:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1759409889; x=1760014689; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mlHVXQUT5xjofjj/AzuHsPu9MqRuziU/HLOwq3aVews=;
        b=Iny3QpE/s2l2l/HftdnZsd7muY5uyGM7TmDliWrIk5yIWjRaqb6CThkOPifkSTxR23
         5PqB9TPNpzxv8VjOw8WF6CBcVf/29PLK+qyE97KwH8iiNShetA0IzyB7Sg1R/xmdhE9+
         TtNBPSbUqSMFWGVDQCug+BsC09qiNHW+H5V0ydzRYJ5iLPbtzeqHXZWWcEZRLiJ5IwXq
         uuzcjccs+E6X/J0vID6tXwpDuxcOmR+Cj21jqI6xuvwgItDcRwApYSIR7wV1+wcbHCfG
         KHEA4stc+2pAwdOGZxcda6WuO8dD+r9nw2Vv38uMpHUWpu9r08qsgQENTrLvzXCCTFY4
         K7FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759409889; x=1760014689;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mlHVXQUT5xjofjj/AzuHsPu9MqRuziU/HLOwq3aVews=;
        b=PePoKAl7aP094nAq9U++Oz1vXQmARNSl5F7634cuV+7LkbdvXelBD4Jskp6vqSUsnZ
         2o2iPShe+TZ+FyjeJNKLUA1Xp7a88QE/2uZF8uJ4ngswMyU098iYsbjznwOgJubqVZA8
         ctieCXZmxtINRHiijDAHuSzGS3uCD0H1s1UYfDYoCP95hgk3wpN6Pr4/zH/eccgOnsxW
         tUYHNSyYYDrC6StVuTRG8sZrIXVOR4QC/5HnRrqLyy1lVws57QYlSknqGzy+pQHMjnKd
         uSrPOa0JsH1MWRxdaH7keFaD0ZjY8gKkNc/lq5kyOajspz5UxJ8DGHZ6YgAByKM+DJcT
         f0Aw==
X-Gm-Message-State: AOJu0YwTShBXnUxGZCb34OitD1D61o+iVXTvSwyB4vIcrFMqvMtsonjC
	Vt7xUQ47GVjxxWkc4Q2V3/rUxbkijP58Fse5pREgjm8zMa0DsUeRdTBwLfiUOJF2DUw=
X-Gm-Gg: ASbGncsDowwhzf4F5DZQtdcemApqW9KIle/nGWg1/RsNgJym8naRDfuXAdECU8YIYu1
	tmeOREuYdyEMTx2vtFRh7c0vVysVkezh6mhaLGpgfGV+8cuBRtjvcSJW51EzSRQcEPtLiR6Jgg5
	M6jFPiOYXeYXlJa5l2iXzbXjg4AkolW3cB/Nup/SPPRgNadMjRmOPvOel9M1PVv92LhIdTdygZD
	ahq3LYVjvrZpn5cmVZbV2ZdafXivcX0qjhI+EVnp+HAMCDOI6Rzn+ofrHKPkQ2Mp0UHkpz4A9Up
	za/iYe8pTADeFRRQVP9a3TTV6jfQ7v4WOsrHz3TN0pULBn/NZpICi7MLLchlAoxIfepCIYJhXUf
	aXrEWBH+rGqPezpfNTSBBbav7ojUCirlHW1cyxgFnednxotzuL8zW0BUYpn/cN5LzZdVnla6eDD
	IcSqGACHdHz6Tj5UmY
X-Google-Smtp-Source: AGHT+IFQ1mVbSshFmP6hkBoNszw5KHlwHgEvKAoM6u/Ai0RegitKIfBOYx0FIZnlu+xOm0B4DjDmBA==
X-Received: by 2002:a05:6402:5241:b0:634:4f76:25f8 with SMTP id 4fb4d7f45d1cf-63678c80b42mr7833044a12.21.1759409889519;
        Thu, 02 Oct 2025 05:58:09 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-637881000c9sm1820799a12.31.2025.10.02.05.58.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Oct 2025 05:58:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Oct 2025 14:58:08 +0200
Message-Id: <DD7UR4O7OYEW.1LFYVKUEE6RED@fairphone.com>
Cc: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 2/4] media: i2c: dw9719: Add DW9800K support
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Griffin Kroah-Hartman" <griffin.kroah@fairphone.com>, "Mauro Carvalho
 Chehab" <mchehab@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 <devicetree@vger.kernel.org>, "Daniel Scally" <djrscally@gmail.com>,
 "Sakari Ailus" <sakari.ailus@linux.intel.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>,
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251002-dw9800-driver-v1-0-c305328e44f0@fairphone.com>
 <20251002-dw9800-driver-v1-2-c305328e44f0@fairphone.com>
In-Reply-To: <20251002-dw9800-driver-v1-2-c305328e44f0@fairphone.com>

On Thu Oct 2, 2025 at 12:15 PM CEST, Griffin Kroah-Hartman wrote:
> The DW9800K is a similar part to the DW9719. The method for operation is
> the same as the DW9719, but the register set is different. Add support
> for this part to the existing dw9719 driver.
>
> Tested on the Fairphone 5 smartphone.

Can confirm!

Tested-by: Luca Weiss <luca.weiss@fairphone.com>

Regards
Luca

> Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
> ---
>  drivers/media/i2c/dw9719.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/drivers/media/i2c/dw9719.c b/drivers/media/i2c/dw9719.c
> index 3627e78b8b6668933c4ecd92231465ce4105ff0c..172479f2c9f63f6b2a1f6eccf=
8184142edb383b9 100644
> --- a/drivers/media/i2c/dw9719.c
> +++ b/drivers/media/i2c/dw9719.c
> @@ -68,6 +68,9 @@
>  #define DW9761_VCM_PRELOAD		CCI_REG8(8)
>  #define DW9761_DEFAULT_VCM_PRELOAD	0x73
> =20
> +#define DW9800K_DEFAULT_SAC		1
> +#define DW9800K_MODE_SAC_SHIFT		6
> +#define DW9800K_DEFAULT_VCM_FREQ		0x10
> =20
>  #define to_dw9719_device(x) container_of(x, struct dw9719_device, sd)
> =20
> @@ -75,6 +78,7 @@ enum dw9719_model {
>  	DW9718S,
>  	DW9719,
>  	DW9761,
> +	DW9800K,
>  };
> =20
>  struct dw9719_device {
> @@ -137,6 +141,12 @@ static int dw9719_power_up(struct dw9719_device *dw9=
719, bool detect)
>  			goto props;
>  		}
> =20
> +		if (dw9719->model =3D=3D DW9800K) {
> +			dw9719->sac_mode =3D DW9800K_DEFAULT_SAC;
> +			dw9719->vcm_freq =3D DW9800K_DEFAULT_VCM_FREQ;
> +			goto props;
> +		}
> +
>  		ret =3D cci_read(dw9719->regmap, DW9719_INFO, &val, NULL);
>  		if (ret < 0)
>  			return ret;
> @@ -177,6 +187,12 @@ static int dw9719_power_up(struct dw9719_device *dw9=
719, bool detect)
>  	}
> =20
>  	switch (dw9719->model) {
> +	case DW9800K:
> +		cci_write(dw9719->regmap, DW9719_CONTROL, DW9719_ENABLE_RINGING, &ret)=
;
> +		cci_write(dw9719->regmap, DW9719_MODE,
> +				  dw9719->sac_mode << DW9800K_MODE_SAC_SHIFT, &ret);
> +		cci_write(dw9719->regmap, DW9719_VCM_FREQ, dw9719->vcm_freq, &ret);
> +		break;
>  	case DW9718S:
>  		/* Datasheet says [OCP/UVLO] should be disabled below 2.5V */
>  		dw9719->sac_mode &=3D DW9718S_CONTROL_SAC_MASK;
> @@ -426,6 +442,7 @@ static const struct of_device_id dw9719_of_table[] =
=3D {
>  	{ .compatible =3D "dongwoon,dw9718s", .data =3D (const void *)DW9718S }=
,
>  	{ .compatible =3D "dongwoon,dw9719", .data =3D (const void *)DW9719 },
>  	{ .compatible =3D "dongwoon,dw9761", .data =3D (const void *)DW9761 },
> +	{ .compatible =3D "dongwoon,dw9800k", .data =3D (const void *)DW9800K }=
,
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, dw9719_of_table);


