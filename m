Return-Path: <linux-media+bounces-21461-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA159CE54E
	for <lists+linux-media@lfdr.de>; Fri, 15 Nov 2024 15:57:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B86111F21AA1
	for <lists+linux-media@lfdr.de>; Fri, 15 Nov 2024 14:57:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 564121D434F;
	Fri, 15 Nov 2024 14:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="syXaLNMu"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BCB1CEACD;
	Fri, 15 Nov 2024 14:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731682645; cv=none; b=UAjyfgWZpxocyJBffumiOAitVjQoMv2u03tZEuBBc9Q22WERK4bIFqEQZLqVBVmdKlGJwt4SVxp4PBjFG4ehJCKU9Irx3bQPB5rQGH+Fjpwf/Z6BvrXorkrvhJqESrTkiFRfHn7E/elBlYii8mzZLfNK8RfLYOgqcSOJsUk9H7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731682645; c=relaxed/simple;
	bh=7MnetFlkb9OJmOI/k44Ipc1Bj/+6iLOQEFymTNtvPiY=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=RIA5Cv/nZTu8yutwGOVgobNguJjLWV426bX3Kwi9RNVw5mNXXVWC/wKDftiuX7TdrohbAr6rgMc9CTesYONSjI23kAf9q/oNgZLIuPNyxBZPycP6G4fDh+cDMUX3xgpStMp8tgkZTZY4g8k+01CC5QEXOnmLpad7enFR5MdRERM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=syXaLNMu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 210F26BE;
	Fri, 15 Nov 2024 15:57:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731682621;
	bh=7MnetFlkb9OJmOI/k44Ipc1Bj/+6iLOQEFymTNtvPiY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=syXaLNMutVtm67kKThaUqIPzy9uN+eiknmOzGTqTdlVr4jlmdjS1eOKy/Ojs2b0xs
	 vzUrposeKuGsWbNF+LToEzc1CfavTnZj5hAXeSbeQwua8caUiXVLdZZZ3xn4vgmFEm
	 9lZv/s5jPT8EWWEVzCg38xYdOFBY6g4Tk9hS6FYc=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241115142021.574402-1-aardelean@baylibre.com>
References: <20241115142021.574402-1-aardelean@baylibre.com>
Subject: Re: [PATCH] media: i2c: imx296: Implement simple retry for model identification
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: laurent.pinchart@ideasonboard.com, manivannan.sadhasivam@linaro.org, sakari.ailus@linux.intel.com, mchehab@kernel.org, Alexandru Ardelean <alex@shruggie.ro>, Alexandru Ardelean <aardelean@baylibre.com>
To: Alexandru Ardelean <aardelean@baylibre.com>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Date: Fri, 15 Nov 2024 14:57:12 +0000
Message-ID: <173168263299.4187655.2771344063896221513@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Alexandru Ardelean (2024-11-15 14:20:21)
> From: Alexandru Ardelean <alex@shruggie.ro>
>=20
> On a cold boot of the device (and sensor), and when using the 'sony,imx29=
6'
> compatible string, it often seems that I get 'invalid device model 0x0000=
'.
> After doing a soft reboot, it seems to work fine.
>=20
> After applying this change (to do several retries), the sensor is
> identified on the first cold boot. The assumption here would be that the
> wake-up from standby takes too long. But even trying a 'udelay(100)' after
> writing register IMX296_CTRL00 doesn't seem to help (100 microseconds
> should be a reasonable fixed time).

I believe Raspberry Pi have an IMX296 and have some out of tree patches.

 https://github.com/raspberrypi/linux/commits/rpi-6.6.y/drivers/media/i2c/i=
mx296.c

It looks like they do similar fixes for bootup, for instance:
=20
 https://github.com/raspberrypi/linux/commit/7713ce38e6a26425ace3a57b3d03ba=
0125c16f89

which introduces a 2-5ms delay before reading the IMX296_SENSOR_INFO
register.

As this delay is significantly longer tahn the 100microseconds you've
tried it might be worth testing Naushir's patch, which states:

"""
Add a 2-5ms delay when coming out of standby and before reading the
sensor info register durning probe, as instructed by the datasheet. This
standby delay is already present when the sensor starts streaming.
"""

Regards
--
Kieran

>=20
> However, after implementing the retry loop (as this patch does it), seems
> to resolve the issue on the cold boot, and the device is identified.
>=20
> When using the 'sony,imx296ll' and 'sony,imx296lq' compatible strings, the
> device identification process isn't happening, and the sensor works fine.
>=20
> Signed-off-by: Alexandru Ardelean <aardelean@baylibre.com>
> ---
>  drivers/media/i2c/imx296.c | 44 ++++++++++++++++++++++----------------
>  1 file changed, 26 insertions(+), 18 deletions(-)
>=20
> diff --git a/drivers/media/i2c/imx296.c b/drivers/media/i2c/imx296.c
> index 83149fa729c4..9c3641c005a4 100644
> --- a/drivers/media/i2c/imx296.c
> +++ b/drivers/media/i2c/imx296.c
> @@ -931,7 +931,7 @@ static int imx296_read_temperature(struct imx296 *sen=
sor, int *temp)
>  static int imx296_identify_model(struct imx296 *sensor)
>  {
>         unsigned int model;
> -       int temp =3D 0;
> +       int temp =3D 0, retries;
>         int ret;
> =20
>         model =3D (uintptr_t)of_device_get_match_data(sensor->dev);
> @@ -943,25 +943,33 @@ static int imx296_identify_model(struct imx296 *sen=
sor)
>                 return 0;
>         }
> =20
> -       /*
> -        * While most registers can be read when the sensor is in standby=
, this
> -        * is not the case of the sensor info register :-(
> -        */
> -       ret =3D imx296_write(sensor, IMX296_CTRL00, 0, NULL);
> -       if (ret < 0) {
> -               dev_err(sensor->dev,
> -                       "failed to get sensor out of standby (%d)\n", ret=
);
> -               return ret;
> -       }
> +       retries =3D 0;
> +       do {
> +               /*
> +                * While most registers can be read when the sensor is in
> +                * standby, this is not the case of the sensor info regis=
ter :-(
> +                */
> +               ret =3D imx296_write(sensor, IMX296_CTRL00, 0, NULL);
> +               if (ret < 0) {
> +                       dev_err(sensor->dev,
> +                               "failed to get sensor out of standby (%d)=
\n",
> +                               ret);
> +                       return ret;
> +               }
> =20
> -       ret =3D imx296_read(sensor, IMX296_SENSOR_INFO);
> -       if (ret < 0) {
> -               dev_err(sensor->dev, "failed to read sensor information (=
%d)\n",
> -                       ret);
> -               goto done;
> -       }
> +               udelay(10);
> +
> +               ret =3D imx296_read(sensor, IMX296_SENSOR_INFO);
> +               if (ret < 0) {
> +                       dev_err(sensor->dev,
> +                               "failed to read sensor information (%d)\n=
",
> +                               ret);
> +                       goto done;
> +               }
> +
> +               model =3D (ret >> 6) & 0x1ff;
> +       } while (model =3D=3D 0 && retries++ < 3);
> =20
> -       model =3D (ret >> 6) & 0x1ff;
> =20
>         switch (model) {
>         case 296:
> --=20
> 2.46.1
>

