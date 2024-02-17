Return-Path: <linux-media+bounces-5354-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 965ED8590AD
	for <lists+linux-media@lfdr.de>; Sat, 17 Feb 2024 16:53:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3DF8282119
	for <lists+linux-media@lfdr.de>; Sat, 17 Feb 2024 15:53:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70F167C6EB;
	Sat, 17 Feb 2024 15:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OKJ2Eoau"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277BC26AE0
	for <linux-media@vger.kernel.org>; Sat, 17 Feb 2024 15:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708185199; cv=none; b=a5fjm9DgYmHWrITfQlQjx4aC1nCCXabqbAc/uwH2aHjEvHh6a3/Hzjxj9jGXfDvGgdUXRY9W9WYIgZXVc9vp5EGEkIgzK0EN/8f3Vr93y++x7FhxowhO7UYnEwQ5uvRokglz/4LrAbuk8zUoCDPAR3RkQBb8Tlo+4CMnjGCNO7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708185199; c=relaxed/simple;
	bh=1NAKtg2i9AI2DQmUOYV66FQ9TzlwLFfcY0DwW5trhsw=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=BrPG9GhGRO5aGIpLw1APnPf5OrKFhCc/QC6GAEFdBzMtmtIZNA836rhtOYq8OzvMO30nw0riQMuIovN30/mqLYeQtYECBjMYuH+jjZf0PsDYj2oyYuzKK+jehwpTcrGxOV+CasH5M+/1y+hNZkr6c2fRGX1rE0mMST56BFYtEyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OKJ2Eoau; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6DAA76B3;
	Sat, 17 Feb 2024 16:53:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1708185191;
	bh=1NAKtg2i9AI2DQmUOYV66FQ9TzlwLFfcY0DwW5trhsw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=OKJ2EoaulZTi83NhtHEYntJdNcYi2NkVRvBUl40vSuRSLHHtbsHHZmCeOw9cqGB0w
	 iimBjtteHdiSoAaSLrwt59tFfRn6JHSnkIbLAtiokaRFT5ofV4AfEDLE5rpWSt963G
	 NRfpcgOCn76ItFO8+K2K8qaw/h9y5e14pA5n+FFE=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240216223237.326523-5-hdegoede@redhat.com>
References: <20240216223237.326523-1-hdegoede@redhat.com> <20240216223237.326523-5-hdegoede@redhat.com>
Subject: Re: [PATCH 4/5] media: ov2680: Add hblank control
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>, Rui Miguel Silva <rmfrfs@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Sat, 17 Feb 2024 15:53:13 +0000
Message-ID: <170818519359.1206667.17643384403648980458@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Hans de Goede (2024-02-16 22:32:36)
> Add hblank control so that the sensor has all the mandatory
> controls for libcamera.

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

>=20
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/media/i2c/ov2680.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
> index 4c9db83d876e..fef9e11ee141 100644
> --- a/drivers/media/i2c/ov2680.c
> +++ b/drivers/media/i2c/ov2680.c
> @@ -130,6 +130,7 @@ struct ov2680_ctrls {
>         struct v4l2_ctrl *link_freq;
>         struct v4l2_ctrl *pixel_rate;
>         struct v4l2_ctrl *vblank;
> +       struct v4l2_ctrl *hblank;
>  };
> =20
>  struct ov2680_mode {
> @@ -684,6 +685,10 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
>         /* exposure range depends on vts which may have changed */
>         ov2680_exposure_update_range(sensor);
> =20
> +       /* adjust hblank value for new width */
> +       def =3D OV2680_PIXELS_PER_LINE - width;

I presume HTS 'could' be modified ... but I think it's reasonable to
keep it fixed.

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

> +       __v4l2_ctrl_modify_range(sensor->ctrls.hblank, def, def, 1, def);
> +
>  unlock:
>         mutex_unlock(&sensor->lock);
> =20
> @@ -984,6 +989,12 @@ static int ov2680_v4l2_register(struct ov2680_dev *s=
ensor)
>         ctrls->vblank =3D v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VBLANK,
>                                           OV2680_MIN_VBLANK, max, 1, def);
> =20
> +       def =3D OV2680_PIXELS_PER_LINE - OV2680_DEFAULT_WIDTH;
> +       ctrls->hblank =3D v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HBLANK,
> +                                         def, def, 1, def);
> +       if (ctrls->hblank)
> +               ctrls->hblank->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> +
>         if (hdl->error) {
>                 ret =3D hdl->error;
>                 goto cleanup_entity;
> --=20
> 2.43.0
>

