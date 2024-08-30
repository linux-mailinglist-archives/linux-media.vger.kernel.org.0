Return-Path: <linux-media+bounces-17189-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DFE965642
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 06:23:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 76162B21C9C
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 04:23:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBEBB14A624;
	Fri, 30 Aug 2024 04:23:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from ni.piap.pl (ni.piap.pl [195.187.100.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9688C71750;
	Fri, 30 Aug 2024 04:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.187.100.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724991821; cv=none; b=rGcroeoZ1HUeud2Cud1A/UIcZl4GwwcPKosehtr/qaR/YpPDs/SmhFt+R5RqgliJZezsVmF2oSw9xVvP7ldi3PylxrC1i/IBwP9ngfvSnKI+/FPWbEekzoR/LYRgxqi9/gf0vrF6Fe44jJtqkbRVDYwyZgsylLQaMYL2NQCiiYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724991821; c=relaxed/simple;
	bh=IA5fO1pMxmVnjPUveYTyLOeSTItzyo6eYll4Ij/Nn1E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=E9or/oInr5gM863If+6zGvbnEuEmLSAiMe+wxUaJsSBQs82vzg8LOun2RWn3WHzSvyDKm58nww9Rt6VhAOddBORJV8uFaRIyEwbLT8vFO3Rs2zvEXX+1cNzyuNBIyR8geQmj/zvHyJeaO1dTb61pA+AbP4jcAgo+SgIfhWKGIrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl; spf=pass smtp.mailfrom=piap.pl; arc=none smtp.client-ip=195.187.100.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=piap.pl
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
	by ni.piap.pl (Postfix) with ESMTPS id E2976C3F2A57;
	Fri, 30 Aug 2024 06:17:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl E2976C3F2A57
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: Alexander Shiyan <eagle.alexander923@gmail.com>
Cc: linux-media@vger.kernel.org,  Sakari Ailus
 <sakari.ailus@linux.intel.com>,  Mauro Carvalho Chehab
 <mchehab@kernel.org>,  stable@vger.kernel.org
Subject: Re: [PATCH] media: i2c: ar0521: Use cansleep version of
 gpiod_set_value()
In-Reply-To: <20240829054849.4761-1-eagle.alexander923@gmail.com> (Alexander
	Shiyan's message of "Thu, 29 Aug 2024 08:48:49 +0300")
References: <20240829054849.4761-1-eagle.alexander923@gmail.com>
Sender: khalasa@piap.pl
Date: Fri, 30 Aug 2024 06:17:41 +0200
Message-ID: <m37cbyeja2.fsf@t19.piap.pl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Alexander,

Alexander Shiyan <eagle.alexander923@gmail.com> writes:

> If we use GPIO reset from I2C port expander, we must use *_cansleep()
> variant of GPIO functions.
> This was not done in ar0521_power_on()/ar0521_power_off() functions.
> Let's fix that.

Definitely.

> Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
> Fixes: 852b50aeed15 ("media: On Semi AR0521 sensor driver")
> Cc: stable@vger.kernel.org

Acked-by: Krzysztof Ha=C5=82asa <khalasa@piap.pl>

> +++ b/drivers/media/i2c/ar0521.c
> @@ -844,7 +844,8 @@ static int ar0521_power_off(struct device *dev)
>         clk_disable_unprepare(sensor->extclk);
>
>         if (sensor->reset_gpio)
> -               gpiod_set_value(sensor->reset_gpio, 1); /* assert RESET s=
ignal */
> +               /* assert RESET signal */
> +               gpiod_set_value_cansleep(sensor->reset_gpio, 1);
>
>         for (i =3D ARRAY_SIZE(ar0521_supply_names) - 1; i >=3D 0; i--) {
>                 if (sensor->supplies[i])
> @@ -878,7 +879,7 @@ static int ar0521_power_on(struct device *dev)
>
>         if (sensor->reset_gpio)
>                 /* deassert RESET signal */
> -               gpiod_set_value(sensor->reset_gpio, 0);
> +               gpiod_set_value_cansleep(sensor->reset_gpio, 0);
>         usleep_range(4500, 5000); /* min 45000 clocks */
>
>         for (cnt =3D 0; cnt < ARRAY_SIZE(initial_regs); cnt++) {

--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa

