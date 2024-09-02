Return-Path: <linux-media+bounces-17315-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D81AF968033
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 09:13:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81FF61F23954
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 07:13:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1AE1178CDF;
	Mon,  2 Sep 2024 07:12:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from ni.piap.pl (ni.piap.pl [195.187.100.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B3B176ADF;
	Mon,  2 Sep 2024 07:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.187.100.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725261128; cv=none; b=EUqyEz4PXVlx+mwwUjwKO06zzMgOxZoSYmCAbTr7t+hGbMXyv4JgUX5uJgs59P5AQeJQ8DwjcDiKfxMG4mf2FRphklIJgKztTBM/uWWBz9NYJe9qf4Adpy1uqxOBNlE0CycXWGmIryWAjBKsy6d/6DJlmCjZcmhyOFGdTPgGGpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725261128; c=relaxed/simple;
	bh=aGFASkabaDN5O7NgeK+wlM3RKLPtOTqxSw/c2Yx/+vw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pXdyORBbo5QgGvo4QZr+FH8Q5OOPAxBG6KY+j8QCWzF8SyfABypmzT3fIobhetty+tFlcnj8v2LKPPAUIxn5PfS5VbosQE0I5NIsMmLmhlGlRqHfm4q/2Ntr5KKCN6IaR9/WNd2Ms6p/uP//itigMzVDHu7mrpxX+vl66rZ/FTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl; spf=pass smtp.mailfrom=piap.pl; arc=none smtp.client-ip=195.187.100.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=piap.pl
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
	by ni.piap.pl (Postfix) with ESMTPS id 75E09C3F2A57;
	Mon,  2 Sep 2024 09:11:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 75E09C3F2A57
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,  Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Sylwester Nawrocki <s.nawrocki@samsung.com>,
  Andrzej Hajda <andrzej.hajda@intel.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  Kevin Hilman <khilman@baylibre.com>,
  Jerome Brunet <jbrunet@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Hans Verkuil
 <hverkuil-cisco@xs4all.nl>,  linux-media@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-amlogic@lists.infradead.org,
  linux-staging@lists.linux.dev,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/6] media: ar0521: Refactor ar0521_power_off()
In-Reply-To: <20240816-smatch-clock-v2-1-c63105db07e8@chromium.org> (Ricardo
	Ribalda's message of "Fri, 16 Aug 2024 12:31:59 +0000")
References: <20240816-smatch-clock-v2-0-c63105db07e8@chromium.org>
	<20240816-smatch-clock-v2-1-c63105db07e8@chromium.org>
Sender: khalasa@piap.pl
Date: Mon, 02 Sep 2024 09:11:55 +0200
Message-ID: <m3tteycyx0.fsf@t19.piap.pl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Ricardo,

Ricardo Ribalda <ribalda@chromium.org> writes:

> Factor out all the power off logic, except the clk_disable_unprepare(),
> to a new function __ar0521_power_off().
>
> This allows ar0521_power_on() to explicitly clean-out the clock during
> the error-path.
>
> The following smatch warning is fixed:
> drivers/media/i2c/ar0521.c:912 ar0521_power_on() warn: 'sensor->extclk' f=
rom clk_prepare_enable() not released on lines: 912.

TBH I don't know if the code with the patch applied is better or not.
It if silences the tool, well, sometimes things are not as clear as we
want them.

Acked-by: Krzysztof Ha=C5=82asa <khalasa@piap.pl>

> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/i2c/ar0521.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
> index 09331cf95c62..56a724b4d47e 100644
> --- a/drivers/media/i2c/ar0521.c
> +++ b/drivers/media/i2c/ar0521.c
> @@ -835,14 +835,12 @@ static const struct initial_reg {
>              be(0x0707)), /* 3F44: couple k factor 2 */
>  };
>
> -static int ar0521_power_off(struct device *dev)
> +static void __ar0521_power_off(struct device *dev)
>  {
>         struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
>         struct ar0521_dev *sensor =3D to_ar0521_dev(sd);
>         int i;
>
> -       clk_disable_unprepare(sensor->extclk);
> -
>         if (sensor->reset_gpio)
>                 gpiod_set_value(sensor->reset_gpio, 1); /* assert RESET s=
ignal */
>
> @@ -850,6 +848,16 @@ static int ar0521_power_off(struct device *dev)
>                 if (sensor->supplies[i])
>                         regulator_disable(sensor->supplies[i]);
>         }
> +}
> +
> +static int ar0521_power_off(struct device *dev)
> +{
> +       struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> +       struct ar0521_dev *sensor =3D to_ar0521_dev(sd);
> +
> +       clk_disable_unprepare(sensor->extclk);
> +       __ar0521_power_off(dev);
> +
>         return 0;
>  }
>
> @@ -908,7 +916,8 @@ static int ar0521_power_on(struct device *dev)
>
>         return 0;
>  off:
> -       ar0521_power_off(dev);
> +       clk_disable_unprepare(sensor->extclk);
> +       __ar0521_power_off(dev);
>         return ret;
>  }
>

--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa

