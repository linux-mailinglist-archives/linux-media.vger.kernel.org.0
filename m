Return-Path: <linux-media+bounces-19848-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8C89A3AA9
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 11:59:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F2F101F24366
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 09:59:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D73C1192B8F;
	Fri, 18 Oct 2024 09:58:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from ni.piap.pl (ni.piap.pl [195.187.100.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADC018EFCD;
	Fri, 18 Oct 2024 09:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.187.100.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729245518; cv=none; b=i3nzKIa3oii8Ua4CcYc8k1qU4MMFWjAcLpo0r1Pf+aYqT7RIndN6acl2FKKeAN78M0lIz06RCQ/YJu+mPUEDbEha0coNrKlno7R6a0jqWZffQhjm/tdgOSXNr+vEeFi2sZlUjn5Spg2D8fxuHANVlIkgQLOYmThKTIyvvZNbbgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729245518; c=relaxed/simple;
	bh=z1pUAeG7H0jJdiC6hXIRlAAtTMRbye2hW0ETT7Xndvo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=K7hs6Ay/07Zftw0iwIOZb0/T+I8EWcNtaI1Olrc4tlCRhajM5Zd3ERxFgjpAQ9f6grwgrF9vuTvoGxA7dGWBgqtM8nXxwnQEoCeRtIspCT6hq8wyPkVVBYmW1CzOUq+QRtT9nw14ART7j2XpQ1XJUoirhFox2oVdABfM99VjjCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl; spf=pass smtp.mailfrom=piap.pl; arc=none smtp.client-ip=195.187.100.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=piap.pl
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
	by ni.piap.pl (Postfix) with ESMTPS id 87985C3EEAC5;
	Fri, 18 Oct 2024 11:53:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 87985C3EEAC5
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
  linux-kernel@vger.kernel.org,  linux-media@vger.kernel.org,
  stable@vger.kernel.org
Subject: Re: [PATCH v2 08/13] media: ar0521: don't overflow when checking
 PLL values
In-Reply-To: <384bc1320658b93b43838a337b37d52dc8485df2.1729230718.git.mchehab+huawei@kernel.org>
	(Mauro Carvalho Chehab's message of "Fri, 18 Oct 2024 07:53:10 +0200")
References: <cover.1729230718.git.mchehab+huawei@kernel.org>
	<384bc1320658b93b43838a337b37d52dc8485df2.1729230718.git.mchehab+huawei@kernel.org>
Sender: khalasa@piap.pl
Date: Fri, 18 Oct 2024 11:53:11 +0200
Message-ID: <m3ldylka9k.fsf@t19.piap.pl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Mauro,

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> The PLL checks are comparing 64 bit integers with 32 bit
> ones, as reported by Coverity. Depending on the values of
> the variables, this may underflow.
>
> Fix it ensuring that both sides of the expression are u64.
>
> Fixes: 852b50aeed15 ("media: On Semi AR0521 sensor driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Acked-by: Krzysztof Ha=C5=82asa <khalasa@piap.pl>

> --- a/drivers/media/i2c/ar0521.c
> +++ b/drivers/media/i2c/ar0521.c
> @@ -255,10 +255,10 @@ static u32 calc_pll(struct ar0521_dev *sensor, u32 =
freq, u16 *pre_ptr, u16 *mult
>                         continue; /* Minimum value */
>                 if (new_mult > 254)
>                         break; /* Maximum, larger pre won't work either */
> -               if (sensor->extclk_freq * (u64)new_mult < AR0521_PLL_MIN *
> +               if (sensor->extclk_freq * (u64)new_mult < (u64)AR0521_PLL=
_MIN *
>                     new_pre)
>                         continue;
> -               if (sensor->extclk_freq * (u64)new_mult > AR0521_PLL_MAX *
> +               if (sensor->extclk_freq * (u64)new_mult > (u64)AR0521_PLL=
_MAX *
>                     new_pre)
>                         break; /* Larger pre won't work either */
>                 new_pll =3D div64_round_up(sensor->extclk_freq * (u64)new=
_mult,
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa

