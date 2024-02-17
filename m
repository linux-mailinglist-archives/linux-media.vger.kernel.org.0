Return-Path: <linux-media+bounces-5350-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6621A85907A
	for <lists+linux-media@lfdr.de>; Sat, 17 Feb 2024 16:22:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 987B01C215FA
	for <lists+linux-media@lfdr.de>; Sat, 17 Feb 2024 15:22:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C6CD7C0BE;
	Sat, 17 Feb 2024 15:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hTc/oFOS"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4146A69DE6
	for <linux-media@vger.kernel.org>; Sat, 17 Feb 2024 15:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708183336; cv=none; b=a9HV1F0nfVS9QBfnwVwr+8yPYxrGyeWmTbbwW8fI2fU+Zn3HN4stA82t98/0sAFFxIkZb1BK/vo4ypbtglWZ9hLV4Zb1rVOWTbkPhJYd7wfAjJJ4HA/uMZXEEn5T/i7DJJmsjZSX426acRCcM+TX6Ez4yPaPNsqJHnnyC3m+cCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708183336; c=relaxed/simple;
	bh=tN6Dv6OWltJAZdQJDSm1ISANWxJ+265xPj86aafbeuY=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=f2DPqCsQ6VrEF2YMbhqSnGBDjJ7pmG16yoHf3Aoo9l7NHe2ivJARj+Ofk6KSqHnfC7M2RaRcF3kMIVmy0KOH5dhMyYvlP0dHnW4xP5qkA8H8yEnzVhxlEjXDso+BoaFm3en5Vqs6+QwXGNNHW8rW+DGeqSqZ8/GL4CfI4Gk5c0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hTc/oFOS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F190A6B3;
	Sat, 17 Feb 2024 16:22:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1708183329;
	bh=tN6Dv6OWltJAZdQJDSm1ISANWxJ+265xPj86aafbeuY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=hTc/oFOSTrKJwq+ako3Xf0GzvYsmrglw5rBRWd+Pb3g8jUqneSZeYzsRDZRRWEt7V
	 m25W/orhAZu+w9k4eWoRhuSAD2GQHwz63AUMRXczDgH50ucoxyrQmvnqyl2P3biiT7
	 aQjJedDW40/F7UtYE5m5mrYEfg4ZimgudMFTux+g=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240217112438.15240-9-hdegoede@redhat.com>
References: <20240217112438.15240-1-hdegoede@redhat.com> <20240217112438.15240-9-hdegoede@redhat.com>
Subject: Re: [PATCH 8/9] media: atomisp: Make MC link from ISP to /dev/video# output node immutable
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>, Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org, linux-staging@lists.linux.dev
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Sat, 17 Feb 2024 15:22:11 +0000
Message-ID: <170818333182.1206667.4063532711751947215@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Hans de Goede (2024-02-17 11:24:37)
> The link from the ISP's source pad to the /dev/video# output v4l2-dev
> is always enabled and immutable, mark it as such.

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/staging/media/atomisp/pci/atomisp_v4l2.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/s=
taging/media/atomisp/pci/atomisp_v4l2.c
> index 1a936dbe8eb4..86028721e7cb 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> @@ -1090,7 +1090,8 @@ int atomisp_register_device_nodes(struct atomisp_de=
vice *isp)
>                 return err;
> =20
>         err =3D media_create_pad_link(&isp->asd.subdev.entity, ATOMISP_SU=
BDEV_PAD_SOURCE,
> -                                   &isp->asd.video_out.vdev.entity, 0, 0=
);
> +                                   &isp->asd.video_out.vdev.entity, 0,
> +                                   MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_I=
MMUTABLE);
>         if (err)
>                 return err;
> =20
> --=20
> 2.43.0
>

