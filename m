Return-Path: <linux-media+bounces-28620-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCAAA6D791
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 10:36:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A671516FA68
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 09:35:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C543125DAE3;
	Mon, 24 Mar 2025 09:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="j5ljifUC"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C220A19E7D0;
	Mon, 24 Mar 2025 09:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742808948; cv=none; b=Mp+R0lPl4PQFFRNDqgZe3uYoFECjxSLpooWChI9ykfYayyqVmuvfLx1UaXOPdue7yaA0/chGa8q9SE2N+weKnRXb+wAietziVPpBDak3XGlazIAotot9YwO3Ykeu557d9oLpWWR/JFXH8Osow0rggOkw8uHG1IcWREGpyd5qhQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742808948; c=relaxed/simple;
	bh=jb/9NoePgJqnR/j8ePnj0a8rGY2uh7ZtAASLeqmS6nY=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=rnylWMUWz7Rwt2f0grc6F6Q8fi2GUCXVVoLgTyohPpqhFXg2UAGmtnVy68T2+uuEWLjOdLO8euYD8zod819bz1bzLYpl3hGdKok7gcOP81kprklyGU9Uq7sxHyEB/6BUfOoB1rxwxwdWUaDc0Z9qIZUztvOq6uI1H8/SqBFy11s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=j5ljifUC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 28302455;
	Mon, 24 Mar 2025 10:33:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742808839;
	bh=jb/9NoePgJqnR/j8ePnj0a8rGY2uh7ZtAASLeqmS6nY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=j5ljifUCp47O0kkJK74g5WttO+iS3+VbsGSfJn+d040tvUeiOVptr7wKbIFM8M9h+
	 8nlhQM6o5wwhYcFWBMUjF89XZQZz4sQJYTS05w7zJ5ZD3IMqycpgBKWic4MAEfVrAw
	 3db+XgAxgoVomPgfS7e7SDAE3AGu99ZI0cw+RHeE=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250324-cal-streams-v6-1-28c93fb8f0c9@ideasonboard.com>
References: <20250324-cal-streams-v6-0-28c93fb8f0c9@ideasonboard.com> <20250324-cal-streams-v6-1-28c93fb8f0c9@ideasonboard.com>
Subject: Re: [PATCH v6 1/3] media: ti: cal: Use printk's fourcc formatting
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>, linux-kernel@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, linux-media@vger.kernel.org
Date: Mon, 24 Mar 2025 09:35:42 +0000
Message-ID: <174280894255.3289779.11656220268332464691@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Tomi Valkeinen (2025-03-24 09:29:17)
> Use printk's fourcc formatting instead of a custom one.
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>


Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

> ---
>  drivers/media/platform/ti/cal/cal-video.c | 26 ++++++--------------------
>  1 file changed, 6 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/media/platform/ti/cal/cal-video.c b/drivers/media/pl=
atform/ti/cal/cal-video.c
> index e29743ae61e2..4eb77f46f030 100644
> --- a/drivers/media/platform/ti/cal/cal-video.c
> +++ b/drivers/media/platform/ti/cal/cal-video.c
> @@ -25,20 +25,6 @@
> =20
>  #include "cal.h"
> =20
> -/*  Print Four-character-code (FOURCC) */
> -static char *fourcc_to_str(u32 fmt)
> -{
> -       static char code[5];
> -
> -       code[0] =3D (unsigned char)(fmt & 0xff);
> -       code[1] =3D (unsigned char)((fmt >> 8) & 0xff);
> -       code[2] =3D (unsigned char)((fmt >> 16) & 0xff);
> -       code[3] =3D (unsigned char)((fmt >> 24) & 0xff);
> -       code[4] =3D '\0';
> -
> -       return code;
> -}
> -
>  /* ------------------------------------------------------------------
>   *     V4L2 Common IOCTLs
>   * ------------------------------------------------------------------
> @@ -180,8 +166,8 @@ static void cal_calc_format_size(struct cal_ctx *ctx,
>         f->fmt.pix.sizeimage =3D f->fmt.pix.height *
>                                f->fmt.pix.bytesperline;
> =20
> -       ctx_dbg(3, ctx, "%s: fourcc: %s size: %dx%d bpl:%d img_size:%d\n",
> -               __func__, fourcc_to_str(f->fmt.pix.pixelformat),
> +       ctx_dbg(3, ctx, "%s: fourcc: %p4cc size: %dx%d bpl:%d img_size:%d=
\n",
> +               __func__, &f->fmt.pix.pixelformat,
>                 f->fmt.pix.width, f->fmt.pix.height,
>                 f->fmt.pix.bytesperline, f->fmt.pix.sizeimage);
>  }
> @@ -509,8 +495,8 @@ static void cal_mc_try_fmt(struct cal_ctx *ctx, struc=
t v4l2_format *f,
>         if (info)
>                 *info =3D fmtinfo;
> =20
> -       ctx_dbg(3, ctx, "%s: %s %ux%u (bytesperline %u sizeimage %u)\n",
> -               __func__, fourcc_to_str(format->pixelformat),
> +       ctx_dbg(3, ctx, "%s: %p4cc %ux%u (bytesperline %u sizeimage %u)\n=
",
> +               __func__, &format->pixelformat,
>                 format->width, format->height,
>                 format->bytesperline, format->sizeimage);
>  }
> @@ -866,8 +852,8 @@ static int cal_ctx_v4l2_init_formats(struct cal_ctx *=
ctx)
>                         if (mbus_code.code =3D=3D fmtinfo->code) {
>                                 ctx->active_fmt[i] =3D fmtinfo;
>                                 ctx_dbg(2, ctx,
> -                                       "matched fourcc: %s: code: %04x i=
dx: %u\n",
> -                                       fourcc_to_str(fmtinfo->fourcc),
> +                                       "matched fourcc: %p4cc: code: %04=
x idx: %u\n",
> +                                       &fmtinfo->fourcc,
>                                         fmtinfo->code, i);
>                                 ctx->num_active_fmt =3D ++i;
>                         }
>=20
> --=20
> 2.43.0
>

