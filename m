Return-Path: <linux-media+bounces-5355-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4C38590B5
	for <lists+linux-media@lfdr.de>; Sat, 17 Feb 2024 16:57:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE7941C20B7D
	for <lists+linux-media@lfdr.de>; Sat, 17 Feb 2024 15:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82FA67CF04;
	Sat, 17 Feb 2024 15:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TvTKbur7"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C8826AE0
	for <linux-media@vger.kernel.org>; Sat, 17 Feb 2024 15:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708185444; cv=none; b=nNkxXJRE5DCQsDvsFtDgG39mfuavJN6iEYLdSKkE1+iprSikD4BVyOv/C3QklokUmZkoKH/WbW2UOjPigEmtNZUXrH+Ca+idllyrJw+71ehA9G5j60l03LfCbl3IFKXQqkB/mZH3si05AM3V/k7Dugrp1WkwjgJMf+u894R+8R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708185444; c=relaxed/simple;
	bh=h02pqtbC/GzkGGnHWdOU7K+B+VEdf4GZEurOMI+nXzs=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=s+EnkJ1wmgKdTqAdeR84keBjRpZGeOjo144XKr98sxHgCQZAbaOob5wycBN0QUiDtzRWdPW0WbHtBnz8zeGB+7urvOhFdik+11JiIC6Dd0m8tSaMvewECqC1jQ1HnMAqRO6WpULRZGNDynabzDoklGMbdcCs2k4LNrjFbFBxyyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TvTKbur7; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DE5336B3;
	Sat, 17 Feb 2024 16:57:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1708185435;
	bh=h02pqtbC/GzkGGnHWdOU7K+B+VEdf4GZEurOMI+nXzs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=TvTKbur7da2rZFX0cjv17Fc+MVErkfWPBOvQjJLxRC1DSfdWQRqdDB8sUf6kwzL0h
	 Z89p7a5jC5Ik3K+aYToezdUyLSL87DXsRRcrqJpBwz0h7Q/RcuNRDtoyEuJYqxaus2
	 Kb6C3OGVUQ7jO06QdUbA8rWd1WGKv9f55sHa/22A=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240216223237.326523-6-hdegoede@redhat.com>
References: <20240216223237.326523-1-hdegoede@redhat.com> <20240216223237.326523-6-hdegoede@redhat.com>
Subject: Re: [PATCH 5/5] media: ov2680: Add camera orientation and sensor rotation controls
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>, Rui Miguel Silva <rmfrfs@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Sat, 17 Feb 2024 15:57:18 +0000
Message-ID: <170818543830.1206667.13974348410813582954@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Hans de Goede (2024-02-16 22:32:37)
> Add camera orientation and sensor rotation controls using
> the v4l2_fwnode_device_parse() and v4l2_ctrl_new_fwnode_properties()
> helpers.
>=20
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>


Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

> ---
>  drivers/media/i2c/ov2680.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
> index fef9e11ee141..bcd031882a37 100644
> --- a/drivers/media/i2c/ov2680.c
> +++ b/drivers/media/i2c/ov2680.c
> @@ -946,6 +946,7 @@ static int ov2680_v4l2_register(struct ov2680_dev *se=
nsor)
>         const struct v4l2_ctrl_ops *ops =3D &ov2680_ctrl_ops;
>         struct ov2680_ctrls *ctrls =3D &sensor->ctrls;
>         struct v4l2_ctrl_handler *hdl =3D &ctrls->handler;
> +       struct v4l2_fwnode_device_properties props;
>         int def, max, ret =3D 0;
> =20
>         v4l2_i2c_subdev_init(&sensor->sd, client, &ov2680_subdev_ops);
> @@ -1000,6 +1001,14 @@ static int ov2680_v4l2_register(struct ov2680_dev =
*sensor)
>                 goto cleanup_entity;
>         }
> =20
> +       ret =3D v4l2_fwnode_device_parse(sensor->dev, &props);
> +       if (ret)
> +               goto cleanup_entity;
> +
> +       ret =3D v4l2_ctrl_new_fwnode_properties(hdl, ops, &props);
> +       if (ret)
> +               goto cleanup_entity;
> +
>         ctrls->vflip->flags |=3D V4L2_CTRL_FLAG_MODIFY_LAYOUT;
>         ctrls->hflip->flags |=3D V4L2_CTRL_FLAG_MODIFY_LAYOUT;
>         ctrls->link_freq->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> --=20
> 2.43.0
>

