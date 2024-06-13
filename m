Return-Path: <linux-media+bounces-13198-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A37D9076A1
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 17:27:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C167288A4B
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 15:27:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A0C414A4EF;
	Thu, 13 Jun 2024 15:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dv4zqVht"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8057614A622
	for <linux-media@vger.kernel.org>; Thu, 13 Jun 2024 15:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718292409; cv=none; b=GRgyRAfpkGY0Pav4x/+/S2lUPRDv8SDn18Cu+r0aj/k4+NddF1TBV43+rynbZZi7uZycbDxoUjOdSBDD6NnnQdlU/onLYiowlPz5LH7V9/rl7QbwmelM3U7G3L1CGGrcCAl40nb6SetlsoV6Air0YUliPkI3OC0V4WMQNTAGV70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718292409; c=relaxed/simple;
	bh=CvwCoTqVofwFWXustYhXR12c8/8gg0NkBwT95BrQso4=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=ThhaOGZ8HpupF90123SGOJYHM8KlofoAqnsdO0CDMaSKjp+TWKlItUPso4rOjwape9OgD2nj5kHO/R4pFrrQsLl3b4Duf0VJJ3w4G0YxrbGhTcu0V0k2CicGoYU4jKDllktsU4TpXhyiPSkcgjx2zCMPcBBExc3jYzvR8JQUUDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dv4zqVht; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9688DE4;
	Thu, 13 Jun 2024 17:26:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718292391;
	bh=CvwCoTqVofwFWXustYhXR12c8/8gg0NkBwT95BrQso4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=dv4zqVhtoI0x6efVa4xrV1zpEaJZyOC+upFnLaifE0JCanprFw9JwLYe15fGqSXwm
	 2DMjzwKk5RsZePwYB8YaLsUfFv0Syc40W9knRbAiHpwpOeBfNqZNSf7KdTf9zUqgq4
	 Zusz/pe1sU3KmW5VmcSrFmxH/VRvPqSV5Zh6gG7A=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ff7a05e2-2908-4da0-817a-1d7c271e788a@xs4all.nl>
References: <ff7a05e2-2908-4da0-817a-1d7c271e788a@xs4all.nl>
Subject: Re: [PATCH] media: imx283: drop CENTERED_RECTANGLE due to clang failure
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil@xs4all.nl>, Linux Media Mailing List <linux-media@vger.kernel.org>
Date: Thu, 13 Jun 2024 16:26:43 +0100
Message-ID: <171829240304.2248009.15616094068000525791@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Hans Verkuil (2024-06-13 16:19:08)
> The CENTERED_RECTANGLE define fails to compile on clang and old gcc
> versions. Just drop it and fill in the crop rectangles explicitly.

So back when I was playing around with this I thought it would have got
dropped during review / upstreaming before now - because I couldn't find
a way to make sure the macro args were guaranteed to be used only once,
by putting some locals in the macro (because of the initialisation).

So I'm not surprised that it needs to be removed, but I am surprised
that it wasn't for the reason I expected ;-)

Anyway - maybe later I'll experiement with more common helpers perhaps -
but not if it hits compile errors..



>=20
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
> diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
> index 6428eb5394a9..8490618c5071 100644
> --- a/drivers/media/i2c/imx283.c
> +++ b/drivers/media/i2c/imx283.c
> @@ -407,14 +407,6 @@ static const struct imx283_reg_list link_freq_reglis=
t[] =3D {
>         },
>  };
>=20
> -#define CENTERED_RECTANGLE(rect, _width, _height)                      \
> -       {                                                               \
> -               .left =3D rect.left + ((rect.width - (_width)) / 2),     =
 \
> -               .top =3D rect.top + ((rect.height - (_height)) / 2),     =
 \
> -               .width =3D (_width),                                     =
 \
> -               .height =3D (_height),                                   =
 \
> -       }
> -
>  /* Mode configs */
>  static const struct imx283_mode supported_modes_12bit[] =3D {
>         {
> @@ -440,7 +432,12 @@ static const struct imx283_mode supported_modes_12bi=
t[] =3D {
>                 .min_shr =3D 11,
>                 .horizontal_ob =3D 96,
>                 .vertical_ob =3D 16,
> -               .crop =3D CENTERED_RECTANGLE(imx283_active_area, 5472, 36=
48),
> +               .crop =3D {
> +                       .top =3D 40,
> +                       .left =3D 108,
> +                       .width =3D 5472,
> +                       .height =3D 3648,
> +               },

I do recall using v4l2_rects to define the active area so they could be
used collectively rather than initialising things as
	.width =3D WIDTH,
	.height =3D HEIGHT,

So - perhaps this could be (if it compiles):
	.crop =3D imx283_active_area,

but either way is fine with me if it unbreaks linux-next.


Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

>         },
>         {
>                 /*
> @@ -468,7 +465,12 @@ static const struct imx283_mode supported_modes_12bi=
t[] =3D {
>                 .horizontal_ob =3D 48,
>                 .vertical_ob =3D 4,
>=20
> -               .crop =3D CENTERED_RECTANGLE(imx283_active_area, 5472, 36=
48),
> +               .crop =3D {
> +                       .top =3D 40,
> +                       .left =3D 108,
> +                       .width =3D 5472,
> +                       .height =3D 3648,
> +               },
>         },
>  };
>=20
> @@ -489,7 +491,12 @@ static const struct imx283_mode supported_modes_10bi=
t[] =3D {
>                 .min_shr =3D 10,
>                 .horizontal_ob =3D 96,
>                 .vertical_ob =3D 16,
> -               .crop =3D CENTERED_RECTANGLE(imx283_active_area, 5472, 36=
48),
> +               .crop =3D {
> +                       .top =3D 40,
> +                       .left =3D 108,
> +                       .width =3D 5472,
> +                       .height =3D 3648,
> +               },
>         },
>  };
>=20
>

