Return-Path: <linux-media+bounces-5352-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDEE85908D
	for <lists+linux-media@lfdr.de>; Sat, 17 Feb 2024 16:39:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B3AC3B20D57
	for <lists+linux-media@lfdr.de>; Sat, 17 Feb 2024 15:39:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17AD67C6CB;
	Sat, 17 Feb 2024 15:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lCSvOW4h"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAB97C6C4
	for <linux-media@vger.kernel.org>; Sat, 17 Feb 2024 15:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708184370; cv=none; b=GDl2fCY4UJ1SXa7lWCTUExTxFAPKrUVA44I8Tbje/OmbsA50gxxEV7faTL64Db0jtBxfEooingoOFozSouLnz2llS4IvbV1yU3HwKq2mJo8hoCBvqcrnqicJLx+N5UohcUQuh14KWixAta3BRn/b6SXnAtUDsWvnhC6fKXRETjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708184370; c=relaxed/simple;
	bh=e0HR3uNbj+l7Z2i31od5K3aWc3YPCbo84dqem3G90ks=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=NCuEwv0hT50ujW3uZ/VEa3eCfneQt7nelTuuCHDp2MrYbF3cWuNbbqWYPOanGUZ5sOypp/e2yOCX8NIgZ8cPGPZaqW8+X68+f6zcQz1UXeIDp2HtHVKCwLR5xpmw08ofxpwdLZVLTR2IIZxOShk8fPwuanV/5ic7xKD5LiCBY8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lCSvOW4h; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 519656B3;
	Sat, 17 Feb 2024 16:39:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1708184362;
	bh=e0HR3uNbj+l7Z2i31od5K3aWc3YPCbo84dqem3G90ks=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=lCSvOW4hpPZAurry+fdEmhZlER7ORyGmyk5R3m9yXrS+FmEeyHowowyuh1FfqQRe/
	 aXA26i4mL+997fe6jAKLEwEOo5fLWgcmo0NsBi7kOUmIiL3WiAr4tV3Qmz7TiZ0fxM
	 6SE9+L91bkdRM6pGHsBmPmxW0ABV9uISVUtopgzg=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240216223237.326523-3-hdegoede@redhat.com>
References: <20240216223237.326523-1-hdegoede@redhat.com> <20240216223237.326523-3-hdegoede@redhat.com>
Subject: Re: [PATCH 2/5] media: ov2680: Drop hts, vts ov2680_mode struct members
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>, Rui Miguel Silva <rmfrfs@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Sat, 17 Feb 2024 15:39:24 +0000
Message-ID: <170818436418.1206667.8409016141912876053@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Hans de Goede (2024-02-16 22:32:34)
> The hts, vts ov2680_mode struct members always contain
> OV2680_PIXELS_PER_LINE resp. OV2680_LINES_PER_FRAME,
> drop them and simply use these values directly.
>=20


Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/media/i2c/ov2680.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
> index 5b04c6c0554a..b4d5936dcd02 100644
> --- a/drivers/media/i2c/ov2680.c
> +++ b/drivers/media/i2c/ov2680.c
> @@ -140,8 +140,6 @@ struct ov2680_mode {
>         u16                             v_end;
>         u16                             h_output_size;
>         u16                             v_output_size;
> -       u16                             hts;
> -       u16                             vts;
>  };
> =20
>  struct ov2680_dev {
> @@ -361,8 +359,6 @@ static void ov2680_calc_mode(struct ov2680_dev *senso=
r)
>                 min(sensor->mode.v_start + height - 1, OV2680_NATIVE_HEIG=
HT - 1);
>         sensor->mode.h_output_size =3D orig_width;
>         sensor->mode.v_output_size =3D orig_height;
> -       sensor->mode.hts =3D OV2680_PIXELS_PER_LINE;
> -       sensor->mode.vts =3D OV2680_LINES_PER_FRAME;
>  }
> =20
>  static int ov2680_set_mode(struct ov2680_dev *sensor)
> @@ -397,9 +393,9 @@ static int ov2680_set_mode(struct ov2680_dev *sensor)
>         cci_write(sensor->regmap, OV2680_REG_VERTICAL_OUTPUT_SIZE,
>                   sensor->mode.v_output_size, &ret);
>         cci_write(sensor->regmap, OV2680_REG_TIMING_HTS,
> -                 sensor->mode.hts, &ret);
> +                 OV2680_PIXELS_PER_LINE, &ret);
>         cci_write(sensor->regmap, OV2680_REG_TIMING_VTS,
> -                 sensor->mode.vts, &ret);
> +                 OV2680_LINES_PER_FRAME, &ret);
>         cci_write(sensor->regmap, OV2680_REG_ISP_X_WIN, 0, &ret);
>         cci_write(sensor->regmap, OV2680_REG_ISP_Y_WIN, 0, &ret);
>         cci_write(sensor->regmap, OV2680_REG_X_INC, inc, &ret);
> --=20
> 2.43.0
>

