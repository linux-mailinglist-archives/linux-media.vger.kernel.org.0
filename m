Return-Path: <linux-media+bounces-21508-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DD79D0DC8
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2024 11:08:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89FF12825F5
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2024 10:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CE17192597;
	Mon, 18 Nov 2024 10:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DDuGOd3A"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6EF149E0E;
	Mon, 18 Nov 2024 10:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731924524; cv=none; b=tKixfTs02aAhuylqtFn5ms46Rb4jpy0JTsXw6huq8Jv/wU4DQw1sKeTbHNJyNHMlO8slgcIBkA7aH/Plaz1ydbPVJOyWtD6zAbswcI0Ln4g51cznR4C2+r74a33cLfSzzqICs/dxGyuZ3SCbBKgV/klFIaC8YpuhQ5sIopC7FCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731924524; c=relaxed/simple;
	bh=+I6CBYu789NxdvDPh4vsIPgLgJkrLQ2juHoUSHgI+90=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=i+FJhUGWrEWY8wQye5imQqEdgtzTOIKkvrmzAjPo32KhxTNsWhRXE9TL2x2L0YG7Dd6gquwVDFY02j6UJKFWmLBtzR5FCv1l8x2ukj0cO/uiKAg65UF9r0N30tSqpmPJQ86LH+ZVlRb87RjnBT/GE9OSKVFgp2uQII6KjYZv9u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DDuGOd3A; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C6DCF8FA;
	Mon, 18 Nov 2024 11:08:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731924504;
	bh=+I6CBYu789NxdvDPh4vsIPgLgJkrLQ2juHoUSHgI+90=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=DDuGOd3Adyic8/MBkLs0GOoSXPD9usSB5moAvma3R0HgyKWvPYn0vcy+CFPcXBspl
	 aPH2tLG//T48ecv91XvPPW2pzRlIXyNGRGhckt5muRmJ47WM9EXFVtEpqU9xt+C6+X
	 vZZVVt9/kp6+mLTHnwbLJ4EbMZaJPrefIGPzmGp4=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241115180717.10820-1-aardelean@baylibre.com>
References: <20241115142021.574402-1-aardelean@baylibre.com> <20241115180717.10820-1-aardelean@baylibre.com>
Subject: Re: [PATCH v2] drivers: media: imx296: Add standby delay during probe
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: laurent.pinchart@ideasonboard.com, manivannan.sadhasivam@linaro.org, sakari.ailus@linux.intel.com, mchehab@kernel.org, naush@raspberrypi.com, Alexandru Ardelean <aardelean@baylibre.com>
To: Alexandru Ardelean <aardelean@baylibre.com>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Date: Mon, 18 Nov 2024 10:08:38 +0000
Message-ID: <173192451835.576258.8765067630505878740@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Alexandru Ardelean (2024-11-15 18:07:17)
> From: Naushir Patuck <naush@raspberrypi.com>
>=20
> Add a 2-5ms delay when coming out of standby and before reading the
> sensor info register durning probe, as instructed by the datasheet. This
> standby delay is already present when the sensor starts streaming.
>=20
> During a cold-boot, reading the IMX296_SENSOR_INFO register would often
> return a value of 0x0000, if this delay is not present before.
>=20
> Fixes: cb33db2b6ccfe ("media: i2c: IMX296 camera sensor driver")
> Tested-by: Alexandru Ardelean <aardelean@baylibre.com>
> Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> ---
>=20
> Changelog v1 -> v2:
> * https://lore.kernel.org/linux-media/20241115142021.574402-1-aardelean@b=
aylibre.com/
> * Technically, this is not a true V2, but rather a new patch
>   - But in V1, the attempt was to fix an issue found with the upstream
>     IMX296 driver, which was pointed out by Kieran that it was already
>     fixed (more elegantly) in the RPi tree.

Thanks,


Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

>   - The standby delay helps during a cold-boot so that the driver can read
>     the IMX296_SENSOR_INFO register. If the delay isn't present the value
>     read is 0xx0000.
>   - Original patch can be found:
>     https://github.com/raspberrypi/linux/commit/7713ce38e6a26425ace3a57b3=
d03ba0125c16f89
>   - From the original patch of Naushir Patuck,
>     - Added comment=20
>       -------
>       During a cold-boot, reading the IMX296_SENSOR_INFO register would o=
ften=20
>       return a value of 0x0000, if this delay is not present before.
>       -------
>     - Added 'Tested-by: Alexandru Ardelean <aardelean@baylibre.com>
>     - Added 'Fixes: cb33db2b6ccfe ("media: i2c: IMX296 camera sensor driv=
er")'
>=20
>  drivers/media/i2c/imx296.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/media/i2c/imx296.c b/drivers/media/i2c/imx296.c
> index f942f66fa664..395bfe4fb23d 100644
> --- a/drivers/media/i2c/imx296.c
> +++ b/drivers/media/i2c/imx296.c
> @@ -940,6 +940,8 @@ static int imx296_identify_model(struct imx296 *senso=
r)
>                 return ret;
>         }
> =20
> +       usleep_range(2000, 5000);
> +
>         ret =3D imx296_read(sensor, IMX296_SENSOR_INFO);
>         if (ret < 0) {
>                 dev_err(sensor->dev, "failed to read sensor information (=
%d)\n",
> --=20
> 2.46.1
>

