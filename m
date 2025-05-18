Return-Path: <linux-media+bounces-32715-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5E2ABAF10
	for <lists+linux-media@lfdr.de>; Sun, 18 May 2025 11:45:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 159B617668A
	for <lists+linux-media@lfdr.de>; Sun, 18 May 2025 09:44:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5B6B211A07;
	Sun, 18 May 2025 09:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="W5E1YoM/"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B002620C477
	for <linux-media@vger.kernel.org>; Sun, 18 May 2025 09:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747561472; cv=none; b=EX0t4qrVn0h24zNVGQxkfDHyu6XZI+BlGhVzcd4XWqKVUcDYtMdRrJnks3xf2WejqoqA3fKrdLxZHKtm2b4us+xFzWb3g82kcDFOQ/6G4VBf91wjo5+5N4aS2VrZIqpWxIYR6PmlCh+pMRCniRNSls9OU7CV2mQbeMZhaxotKfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747561472; c=relaxed/simple;
	bh=xz2DzyzGS9jB37iuZVM3obrb0z5GaS11TF36sibsSm4=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=DqJOW/XyrYJr1Ymr7dDrMgFPKBZDkYHJYASUi/ch5pcyx9NzxIVUhNeG5M/hyC7IeHX0fK7k3ZAVie18z/VyjbrYCMFnQo4rmlAWFGfGnmY5bWvw/McwR0pKxtvqRgzt/VGQOFWMC+MpvagKcc8tyKW1AYf5Cctm1YI4LVOmh5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=W5E1YoM/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 45718475;
	Sun, 18 May 2025 11:44:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747561450;
	bh=xz2DzyzGS9jB37iuZVM3obrb0z5GaS11TF36sibsSm4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=W5E1YoM/Lf4Iry7iLoTmod3Ioi9Bw2VXPp/Qt6SJOPZzA2dpzGAgccTf5lUlsOBSe
	 OwYv3q6U+SStbMASVPxNkbtNukeR9KlpVAeVorrbjBXFDYmCWf64w2jPDuHAc8PpSo
	 BSL5wjxE7plLWImzcUySTU1ZZW2LRTfrif90kEEk=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250517114106.43494-22-hdegoede@redhat.com>
References: <20250517114106.43494-1-hdegoede@redhat.com> <20250517114106.43494-22-hdegoede@redhat.com>
Subject: Re: [PATCH 21/23] media: atomisp: gc0310: Drop gc0310_get_frame_interval()
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-staging@lists.linux.dev
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Sun, 18 May 2025 10:44:26 +0100
Message-ID: <174756146675.4012029.11268561479739972974@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Hans de Goede (2025-05-17 12:41:04)
> On raw camera sensors the framerate is controlled through vblank
> (and optional) hblank controls.
>=20
> Having a get_frame_interval makes no sense in this case, drop it.
>=20
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

> ---
>  .../staging/media/atomisp/i2c/atomisp-gc0310.c | 18 ------------------
>  1 file changed, 18 deletions(-)
>=20
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers=
/staging/media/atomisp/i2c/atomisp-gc0310.c
> index 152835fa4226..73779c20ca68 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> @@ -513,23 +513,6 @@ static int gc0310_disable_streams(struct v4l2_subdev=
 *sd,
>         return ret;
>  }
> =20
> -static int gc0310_get_frame_interval(struct v4l2_subdev *sd,
> -                                    struct v4l2_subdev_state *sd_state,
> -                                    struct v4l2_subdev_frame_interval *i=
nterval)
> -{
> -       /*
> -        * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the=
 V4L2
> -        * subdev active state API.
> -        */
> -       if (interval->which !=3D V4L2_SUBDEV_FORMAT_ACTIVE)
> -               return -EINVAL;
> -
> -       interval->interval.numerator =3D 1;
> -       interval->interval.denominator =3D GC0310_FPS;
> -
> -       return 0;
> -}
> -
>  static int gc0310_enum_mbus_code(struct v4l2_subdev *sd,
>                                  struct v4l2_subdev_state *sd_state,
>                                  struct v4l2_subdev_mbus_code_enum *code)
> @@ -579,7 +562,6 @@ static const struct v4l2_subdev_pad_ops gc0310_pad_op=
s =3D {
>         .set_fmt =3D v4l2_subdev_get_fmt, /* Only 1 fixed mode supported =
*/
>         .get_selection =3D gc0310_get_selection,
>         .set_selection =3D gc0310_set_selection,
> -       .get_frame_interval =3D gc0310_get_frame_interval,
>         .enable_streams =3D gc0310_enable_streams,
>         .disable_streams =3D gc0310_disable_streams,
>  };
> --=20
> 2.49.0
>

