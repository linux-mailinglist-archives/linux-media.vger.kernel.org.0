Return-Path: <linux-media+bounces-35832-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F23E7AE706C
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 22:13:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A6D61BC408E
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 20:14:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA9272E92C1;
	Tue, 24 Jun 2025 20:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HxDbrOQ+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220B02550D3
	for <linux-media@vger.kernel.org>; Tue, 24 Jun 2025 20:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750796026; cv=none; b=Wmm69T2ZlAqs9tE1EOqYqK6+gVcTMXbSE2Dzzo2yoirCt9kUtsjC8jKUXt7hmxELgsainBc9oXACCauFy/SdOaZCOzAMrAo5IeLsprcTRfe9HsXzirN8OJmrzYVNYsN+Hp5jBCrQ569HhT7DnwV1LaHsyLMmG4M1yIG6ewKjgsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750796026; c=relaxed/simple;
	bh=04gs8oG7XytwujHVqZCUvBXZJFgNfuoGlbc8u5u1eG0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X8oSNP/rEuqAZttRoBnKGktGJwdJFzGEI7wddu5glgc8hb5IlY4A+n1YQAtM1UlxwBLqx8fJn2D2ZXQxauqHDhQIym81hm6A9dGA+xTtz1E7vT8Tva+N4x3i4NMmIskgB2fdv7bsK64zS9+s+7HflIorc1j1Vg+pigD1Zb+IbmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HxDbrOQ+; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-453643020bdso7886665e9.1
        for <linux-media@vger.kernel.org>; Tue, 24 Jun 2025 13:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750796022; x=1751400822; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ujsqQw1lPRcdAJORC/sMQ7+cZS3C+/7MBfclLqHhabI=;
        b=HxDbrOQ+WhW5MQ3Qn7n5/Q6iYnlFh3+VJuZkocNCHQuaNssNf9Am9KWrn/hvqCdn8b
         VpG/81sPbGsWdKVEA4wm30N00HS14DNY0qbAD0p2VUCp5qVQAbTuYefff0emmtdkazqu
         Yu4APlKaoWmZSS2c6RziEMTNGOXHPUCm4zs+J6W9fYq+IK38PhvDNtRrNKR1NsBf1HUY
         vGCJr6U6REKJatMLOasjfn4wl5pt+wrK6ZsEluIIHbr9TPiWtrxp80wXth8pgqtySMgp
         xM7Jw00XdFLtZ7Xn3mWfD7fvP6enRt9a9yf/dauqOaRFYI6mBi6FWlUt20SlxpYL/o2H
         7VvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750796022; x=1751400822;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ujsqQw1lPRcdAJORC/sMQ7+cZS3C+/7MBfclLqHhabI=;
        b=nNNVFEquyNguQFd9afgEBRcLq5hI3XxxVCHpdD2yKypEkj6i5DD1XKApP9n2y/iuai
         3+xCfqaVNvHs/F+w8cImY94GYdfcD+mqMBZXl1juFvSI+PJL1j1RJqH4zPuA4WQOIJLi
         Xn9PhSVH8GeIhb864IJi6Do+/8yir0xSOpHNHaqoithto00OBb+mtPpywlL06m13hFdW
         ORiE7mdP38umK/5L2pzv7sf3zUmkai1G5BFCnGJjmyXVxE+WHC2MUWxpnVqi/LcFlPFL
         PaQmexrE5OTYB+OgW52mFA7kzRjs0rezxFMP5YTOBI1stDiJ4Gs3u0M0YJvSq4D+WqQl
         UJcA==
X-Gm-Message-State: AOJu0Yy+9LpClZZ0XkPIWCdtx+SAyEn8BOTk3BRHdaix4nGpWUylsJi6
	zHxCiM0G98feXdkxge7v6dCHyDx81gyCJxU9lmhnSLHPHmpyQqqQ/zwNHMWkoaR3Bo4YzmyMfKb
	UHx4oIDHzJnIOMxG7m0oAJD1LZQiM4OE=
X-Gm-Gg: ASbGncvpak1Saw2m1OVslxLDujqgNPxVqB6k7YuRtL/bbR6XtcEnwBGLXsz5lIZetqd
	4rM/8PBPY7moJ0J8ZusmSCym+jbZAGy7S9syXdmjgb2sTDLy3l/fjpAuW54iC61jjY/XAR1cisz
	kmgjrn66kK7zcqx5SWk/1ovAfHsYSzZW6gPJFqhfdJDUQZlQ==
X-Google-Smtp-Source: AGHT+IHoSrdXukjoLJdsraIlcS6jfealnwibTdkad92B19TlbCLHEPpMfRqIFcrt1oN7gPSj7KLvIO/Y5G1QqOXVAtg=
X-Received: by 2002:a5d:5847:0:b0:3a3:7593:818b with SMTP id
 ffacd0b85a97d-3a6ed62eb62mr79455f8f.21.1750796022318; Tue, 24 Jun 2025
 13:13:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250619204712.16099-1-laurent.pinchart@ideasonboard.com> <20250619204712.16099-3-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20250619204712.16099-3-laurent.pinchart@ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 24 Jun 2025 21:13:15 +0100
X-Gm-Features: Ac12FXxlLbbLECGdpPlNhT4pIaBWuP21PzjNHDNJKiX2cXydTxZnisH620wxLz4
Message-ID: <CA+V-a8tW-VZtOLSsFy-Y=aQwrOq5hRG=e-kxtX0p4N601Tx6xA@mail.gmail.com>
Subject: Re: [PATCH 2/5] media: i2c: ds90ub913: Drop check on number of active routes
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Julien Massot <julien.massot@collabora.com>, Sakari Ailus <sakari.ailus@iki.fi>, 
	Hans Verkuil <hans@jjverkuil.nl>, Tommaso Merciai <tomm.merciai@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 9:48=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> The subdev core now limits the number of active routes to
> V4L2_FRAME_DESC_ENTRY_MAX. Drop the duplicated check in the ds90ub913
> driver.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/i2c/ds90ub913.c | 8 --------
>  1 file changed, 8 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.=
c
> index fd2d2d5272bf..61920d34efc5 100644
> --- a/drivers/media/i2c/ds90ub913.c
> +++ b/drivers/media/i2c/ds90ub913.c
> @@ -316,14 +316,6 @@ static int _ub913_set_routing(struct v4l2_subdev *sd=
,
>         unsigned int i;
>         int ret;
>
> -       /*
> -        * Note: we can only support up to V4L2_FRAME_DESC_ENTRY_MAX, unt=
il
> -        * frame desc is made dynamically allocated.
> -        */
> -
> -       if (routing->num_routes > V4L2_FRAME_DESC_ENTRY_MAX)
> -               return -EINVAL;
> -
>         ret =3D v4l2_subdev_routing_validate(sd, routing,
>                                            V4L2_SUBDEV_ROUTING_ONLY_1_TO_=
1);
>         if (ret)
> --
> Regards,
>
> Laurent Pinchart
>
>

