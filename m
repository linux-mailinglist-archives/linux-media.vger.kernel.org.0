Return-Path: <linux-media+bounces-5351-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA8385908C
	for <lists+linux-media@lfdr.de>; Sat, 17 Feb 2024 16:38:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 93663B212FF
	for <lists+linux-media@lfdr.de>; Sat, 17 Feb 2024 15:38:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3AF57C6D6;
	Sat, 17 Feb 2024 15:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nx1rlKGF"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757397C6D2
	for <linux-media@vger.kernel.org>; Sat, 17 Feb 2024 15:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708184300; cv=none; b=m+rgIyW5RdKm1wLzthrmw0vLkMSVuhYXFpL1udgqGj91F3joyNoaHri5IwoPyjd/9/1wZKAgh90Ts/epB03gm0n1hQu/QolE80AoFKBARpEg4Q1DD+fJFr9S0IzQ6QUmgNGw9erBx3f0EftNwM/jRt5JQyNYPa3HKE4mWPM/7dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708184300; c=relaxed/simple;
	bh=Mu1nrFqGXRZuAhPmspZXKLCYv2vTknXQV/XqrKeZ+Ko=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=pUxj1Y6kXzfjCxzXobK8QiU+1fhW0MvgryMnIq3X+Z5NXh5JPjO3rEGmUex2qNJ5u7VSFcAfpBKccphNLvdv/54RNFrmj0YeVwLSExZEL8m8X2a6T/hywnteGmEroO8Cwl7CLKbdOvOhGq7AAi9SMXplxzHJcZ3agaCD/XXIKB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nx1rlKGF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8B5056B3;
	Sat, 17 Feb 2024 16:38:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1708184291;
	bh=Mu1nrFqGXRZuAhPmspZXKLCYv2vTknXQV/XqrKeZ+Ko=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=nx1rlKGFRKDsYFsU5uCOcr91/qcG3IdqBrKaq63ycr70yXa/JRJ3DBLxa4KrQObGu
	 m+6ak936UPhPiOX2AFfH4mtEufa4fVFodeD5zjz5PEwwByFyuqoMAUNiGvpLV+OpXe
	 e1nBF85di5wa51FNNopToRbkOdweI/EjUS8VyBYI=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240216223237.326523-2-hdegoede@redhat.com>
References: <20240216223237.326523-1-hdegoede@redhat.com> <20240216223237.326523-2-hdegoede@redhat.com>
Subject: Re: [PATCH 1/5] media: ov2680: Stop sending more data then requested
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>, Rui Miguel Silva <rmfrfs@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Sat, 17 Feb 2024 15:38:13 +0000
Message-ID: <170818429397.1206667.7109669506551567157@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Hans de Goede (2024-02-16 22:32:33)
> There is no reason to send OV2680_END_MARGIN extra columns on top of
> the mode width and the same for sending extra lines over the mode height.
>=20
> This sending of extra lines/columns was inherited from the atomisp
> ov2680 driver, it is unclear why this was done and this complicates
> adding V4L2_CID_VBLANK support, so remove it.

Was this some niave way of adding some HBLANK to let the AtomISP keep up
with processing each line?

Or is it an optical black region? or padding? (I hit issues around that
on the IMX283 lately).

Is this a sensor you have and can visually check?

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/media/i2c/ov2680.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
> index 39d321e2b7f9..5b04c6c0554a 100644
> --- a/drivers/media/i2c/ov2680.c
> +++ b/drivers/media/i2c/ov2680.c
> @@ -86,9 +86,6 @@
>  #define OV2680_PIXELS_PER_LINE                 1704
>  #define OV2680_LINES_PER_FRAME                 1294
> =20
> -/* If possible send 16 extra rows / lines to the ISP as padding */
> -#define OV2680_END_MARGIN                      16
> -
>  /* Max exposure time is VTS - 8 */
>  #define OV2680_INTEGRATION_TIME_MARGIN         8
> =20
> @@ -359,11 +356,9 @@ static void ov2680_calc_mode(struct ov2680_dev *sens=
or)
>         sensor->mode.v_start =3D (sensor->mode.crop.top +
>                                 (sensor->mode.crop.height - height) / 2) =
& ~1;
>         sensor->mode.h_end =3D
> -               min(sensor->mode.h_start + width + OV2680_END_MARGIN - 1,
> -                   OV2680_NATIVE_WIDTH - 1);
> +               min(sensor->mode.h_start + width - 1, OV2680_NATIVE_WIDTH=
 - 1);
>         sensor->mode.v_end =3D
> -               min(sensor->mode.v_start + height + OV2680_END_MARGIN - 1,
> -                   OV2680_NATIVE_HEIGHT - 1);
> +               min(sensor->mode.v_start + height - 1, OV2680_NATIVE_HEIG=
HT - 1);
>         sensor->mode.h_output_size =3D orig_width;
>         sensor->mode.v_output_size =3D orig_height;
>         sensor->mode.hts =3D OV2680_PIXELS_PER_LINE;

Especially as seeing hts =3D OV2680_PIXELS_PER_LINE it does sound like the
margin is superfluous.

> --=20
> 2.43.0
>

