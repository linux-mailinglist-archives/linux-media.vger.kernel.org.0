Return-Path: <linux-media+bounces-32689-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 95996ABAA9E
	for <lists+linux-media@lfdr.de>; Sat, 17 May 2025 16:13:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BEBB189F933
	for <lists+linux-media@lfdr.de>; Sat, 17 May 2025 14:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 846A1204090;
	Sat, 17 May 2025 14:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="B25XEvZT"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E485155393
	for <linux-media@vger.kernel.org>; Sat, 17 May 2025 14:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747491175; cv=none; b=d6pcc0si9q//kjpyrs1n8iQ3iz3HClvmPPzh8VRSZ1QmqMzEL2rZGBNbDeKKLLVNpVVz2TU1hG/d/lyNV0h7ywGZY9xOarEHhzbhZMpfMaaR8xn8nDKXFtdzuDG1TgTi5u4Ts5VzdpI77XcobTfb6/CemD7yT8NLrZvjSbBs4iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747491175; c=relaxed/simple;
	bh=k0U5GPNsCXmA3hWYy7qG4QWRzGVm7Ww8vXjL56JDEJ4=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=U2k+3DVomzI+MJNkRizbbx9Nve6BMQSGKiQakbnNHTpX/AJgmddCO3CmrkbFNLNQOThFto7tHHdxJ9XQwkA3cnk8rvPgBynt/2fWMIA8HWFxD8mlznQwpCL3PnXSv1NmLbq7LlYsLQZXrRMKC0dVQRh3w2EbvC4GcH0Fw0kUle0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=B25XEvZT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3BCAD4AD;
	Sat, 17 May 2025 16:12:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747491148;
	bh=k0U5GPNsCXmA3hWYy7qG4QWRzGVm7Ww8vXjL56JDEJ4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=B25XEvZTKcwm7ajZsupJ0nqEZ3U5kvLbVEwDGlufBbglQMrx4BswmK+Nryx6XyJww
	 hcEOwktLOzKMkw4MJvPuJZMXOAfMsjIyHsGqqv0aP5kz+F/9nL8C1z3Oaf6T8L98zW
	 CHGakjdiZiWoeOpFYIzpvfjdaAaKBWkjIJ3E2a7Q=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250517114106.43494-23-hdegoede@redhat.com>
References: <20250517114106.43494-1-hdegoede@redhat.com> <20250517114106.43494-23-hdegoede@redhat.com>
Subject: Re: [PATCH 22/23] media: atomisp: gc0310: Drop gc0310_g_skip_frames()
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-staging@lists.linux.dev
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Sat, 17 May 2025 15:12:43 +0100
Message-ID: <174749116399.3878759.7479066161021210171@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Hi Hans,

Great looking series!
Makes me want to spend time cleaning up the OV5675 that I have here on
this laptop ... Oh to have more time ...


Quoting Hans de Goede (2025-05-17 12:41:05)
> The g_skip_frames sensor-op is obsolete, drop it.
>=20
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/staging/media/atomisp/i2c/atomisp-gc0310.c | 11 -----------
>  1 file changed, 11 deletions(-)
>=20
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers=
/staging/media/atomisp/i2c/atomisp-gc0310.c
> index 73779c20ca68..edcad228272a 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> @@ -541,16 +541,6 @@ static int gc0310_enum_frame_size(struct v4l2_subdev=
 *sd,
>         return 0;
>  }
> =20
> -static int gc0310_g_skip_frames(struct v4l2_subdev *sd, u32 *frames)
> -{
> -       *frames =3D GC0310_SKIP_FRAMES;

Skimming through - this seems to be the first comment I have ... :-)

I think GC0310_SKIP_FRAMES can be removed at this point.

We don't yet have a 'skip' frames parameter in libcamera sensor
properties - but especially after the libcamera workshop - we should add
the skip-frames (or other wise startup-frame named?) property as  '3' to
libcamera.

With that,=20

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>


> -       return 0;
> -}
> -
> -static const struct v4l2_subdev_sensor_ops gc0310_sensor_ops =3D {
> -       .g_skip_frames  =3D gc0310_g_skip_frames,
> -};
> -
>  static const struct v4l2_subdev_video_ops gc0310_video_ops =3D {
>         .s_stream =3D v4l2_subdev_s_stream_helper,
>  };
> @@ -569,7 +559,6 @@ static const struct v4l2_subdev_pad_ops gc0310_pad_op=
s =3D {
>  static const struct v4l2_subdev_ops gc0310_ops =3D {
>         .video =3D &gc0310_video_ops,
>         .pad =3D &gc0310_pad_ops,
> -       .sensor =3D &gc0310_sensor_ops,
>  };
> =20
>  static int gc0310_init_state(struct v4l2_subdev *sd,
> --=20
> 2.49.0
>

