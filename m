Return-Path: <linux-media+bounces-18208-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7036A976AF5
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 15:42:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3229C282C5B
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 13:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D310E1AD25F;
	Thu, 12 Sep 2024 13:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HWK88ZAw"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3624C1AED23;
	Thu, 12 Sep 2024 13:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726148437; cv=none; b=Kg1AHVQzqDJ03E5MCeEH6Z1GANUL3ctz8alzN1SLJDigDI1wy6MaRW8enW26hnL5rFP8GBGZa/cM82GCq1Ao+qvRjRSbxsdbR0AMtbKgzAcRLfmc4fX435+KmSlKe5MA1Vsfjt6RKppx7pC7/9ahDWyhK6+Iy7VhYDSmrPtmI5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726148437; c=relaxed/simple;
	bh=2rmvX0x1OQyKw+qs0HdJHs8ChPhPINx7+7HMAnwbzm0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IBX4wGvDTAolVqypegWjvmlvDmlp3qR2MR+kRgdQ5Uvz6+Ngsyh0rwNpeda+u7UO83nXT1XSVkV7DbmX94t0xUq4Lpptk8uiG0iAkIMAFJW6VlbEjB2rUvaNPx125YyzB9Su5hNCMuA0KD7K2aIfbyk2IZbsRB+Z4ABd5/Q3yyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HWK88ZAw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15ACAC4AF0B;
	Thu, 12 Sep 2024 13:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726148437;
	bh=2rmvX0x1OQyKw+qs0HdJHs8ChPhPINx7+7HMAnwbzm0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HWK88ZAwguqXi9YeDwEY+pYNLY9NxeW4/zLycBXBID+txjdW4RfW+XLNQWzOKe6Dj
	 ab67uEzce8jhFerzpcDGvywKDAkZTpzp1Kxhs4VDvKYs7Y82BZ02xYDVReT0zxzOwh
	 MSuYfaGV9n1E93Kfq9h15DfwcDaRYiGs2fozJ/PLQvHvPFpuu1ktytAuvgWc/7IOWI
	 HGzDCSutF5xfZIelGM38HcoVO7+AGsZRVMN0WWcP9NfN11uaXIzzxp7FWb6UZrbNPA
	 iJ2Gx5LGDGub5xuNc1grPQVi7omljMXwXUzxMFK9jQbr5i5UzaQ3B2LSqRZWQjQtF7
	 iXbcp/ZjaARdw==
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-846c6b605abso1068303241.0;
        Thu, 12 Sep 2024 06:40:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU43ywYVJVS8zFA7I1QO3+d0PrakGGozFwZIeZdFgqFYAVnVpSoSifocYowL/1EfcVga2FiPlktrs0LUMY=@vger.kernel.org, AJvYcCVn5Yrlnod2Dd7snm81FVES/bMwS2PPufLz25LxIClVYag9qG7wbn/koNKlt7i5jewY5ACk89e6IU8eZGk=@vger.kernel.org, AJvYcCXsa/5DLRn9OANGdPSjrVl6Zya4H7SJkcGBLTcK9VJUCC0UOkky6M/yxJGpZnSzMs2C0RaM/UvCg+/iuio=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2jAWQgVo7lNt85zyQLoM9wE+pD2fM7W8mOyrqpoQDYmsnsBTm
	Je2VagZG1mTrD+HbRcvxinufKAg1D2loBZ44u2O2LuixHJXTimwDvfoFMmvWBNQRfMD0UYJ74S6
	q8ajMJr0z0Xf9b7kT/WhuDzW6dWY=
X-Google-Smtp-Source: AGHT+IEYSuifhBIE2YhlgJVaiglzUYRkcKzLk2+GCfSjce1iYMYdhJiOO+CMlaXSKqXz1ii5aLVEddvgUgx8txqBcJU=
X-Received: by 2002:a05:6122:3694:b0:502:c93c:7489 with SMTP id
 71dfb90a1353d-502f76ba86bmr8226119e0c.3.1726148434068; Thu, 12 Sep 2024
 06:40:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240902-imx214-v1-0-c96cba989315@apitzsch.eu> <20240902-imx214-v1-6-c96cba989315@apitzsch.eu>
In-Reply-To: <20240902-imx214-v1-6-c96cba989315@apitzsch.eu>
From: Ricardo Ribalda Delgado <ribalda@kernel.org>
Date: Thu, 12 Sep 2024 15:40:16 +0200
X-Gmail-Original-Message-ID: <CAPybu_1oicaRO8L5XGCH7FbAyE8P3tGhTgRPntmCPwA+65_XKQ@mail.gmail.com>
Message-ID: <CAPybu_1oicaRO8L5XGCH7FbAyE8P3tGhTgRPntmCPwA+65_XKQ@mail.gmail.com>
Subject: Re: [PATCH 06/13] media: i2c: imx214: Drop IMX214_REG_EXPOSURE from
 mode reg arrays
To: git@apitzsch.eu
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 2, 2024 at 11:53=E2=80=AFPM Andr=C3=A9 Apitzsch via B4 Relay
<devnull+git.apitzsch.eu@kernel.org> wrote:
>
> From: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
>
> The IMX214_REG_EXPOSURE is configured twice, once with a hardcoded value
> in the mode_<res> registers arrays, and once via v4l2_ctrl_ops. The
> latter is enough, drop the former.
>
> Signed-off-by: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
Acked-by: Ricardo Ribalda <ribalda@chromium.org>

> ---
>  drivers/media/i2c/imx214.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> index 91664e188fd0..4507e12dd4cd 100644
> --- a/drivers/media/i2c/imx214.c
> +++ b/drivers/media/i2c/imx214.c
> @@ -254,7 +254,6 @@ static const struct cci_reg_sequence mode_4096x2304[]=
 =3D {
>         { CCI_REG8(0x3011), 0x00 },
>         { IMX214_REG_STATS_OUT_EN, IMX214_STATS_OUT_ON },
>
> -       { IMX214_REG_EXPOSURE, IMX214_EXPOSURE_DEFAULT },
>         { IMX214_REG_SHORT_EXPOSURE, 500 },
>
>         { IMX214_REG_ANALOG_GAIN, 0 },
> @@ -328,7 +327,6 @@ static const struct cci_reg_sequence mode_1920x1080[]=
 =3D {
>         { CCI_REG8(0x3011), 0x00 },
>         { IMX214_REG_STATS_OUT_EN, IMX214_STATS_OUT_ON },
>
> -       { IMX214_REG_EXPOSURE, IMX214_EXPOSURE_DEFAULT },
>         { IMX214_REG_SHORT_EXPOSURE, 500 },
>
>         { IMX214_REG_ANALOG_GAIN, 0 },
>
> --
> 2.46.0
>
>

