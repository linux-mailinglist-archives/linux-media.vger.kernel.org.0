Return-Path: <linux-media+bounces-5196-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 239A98560DB
	for <lists+linux-media@lfdr.de>; Thu, 15 Feb 2024 12:08:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2CA51B3679B
	for <lists+linux-media@lfdr.de>; Thu, 15 Feb 2024 10:48:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3153312F58E;
	Thu, 15 Feb 2024 10:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="jwDBCuG9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356D112F394
	for <linux-media@vger.kernel.org>; Thu, 15 Feb 2024 10:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707993500; cv=none; b=SwyQQSaOO7tzgBI6D70e8p7I/xeMGCUhO65R6G8lvRKVjvODOsM+mY57vpWxKuKwCtMYAngUT1GSHByxccjUGfG6nDQnZik0W1xat0XinEnwShSEtxRVcXAXrmehMaj0UNdXmnIfyv5KQbAilw2hcxp0hih47WDUpLCA386Jin8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707993500; c=relaxed/simple;
	bh=0f+Rr2ugPcTMQEfdhGolV0JMpe2FgJ3z0B0ODjdBfJ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W61daEFf6ThYFbadCeOdXEHyNKWtf/yUW7WuNUwB1mV8dLW9tGnpYiH/itn5is6Mr2Meo8P+oOhPNHMmTZUls/ApgGWGfgb85ZVQturDdr4JN8BSnmaThIahZOQ6c3V26tOI40dgMUNF9fPDBGGiak/zU3PAjm6yKs5MaGHH7pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=jwDBCuG9; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dc6d24737d7so613977276.0
        for <linux-media@vger.kernel.org>; Thu, 15 Feb 2024 02:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1707993497; x=1708598297; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XAM28l5o98xVt9RYIOmgdI1hVsJ6dvelMAChtEmib00=;
        b=jwDBCuG9Enxbx2tldVZTKA69rWxuNfavbUbyaoj/RIwHC1kDsvgcl9GRgfJaPg2tLr
         4XxFzCHmcpAk5bWqYRqPehn9Rye6b0wkulwIw4vzi3+ciStQvhK765X1R+CggOF005nY
         nY5RfkcsCOV8OvwUCkUJ2gEa60ZTjalzoG+6f//8J1Eon2xtwmJfxZyxw5hRelZi7GaV
         wSATIqKDWeG492dbPVJvMUnmZjJrVQddSViFXgCYvM0DqDua3k402VAKW7fP83kqxEFX
         DL9pMqG4SsqYl0ffxiu388yh7oIA9Na6M5IpmAxbwrKZXmOhR2Mwd1ya0U55bDfP6DN3
         efTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707993497; x=1708598297;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XAM28l5o98xVt9RYIOmgdI1hVsJ6dvelMAChtEmib00=;
        b=sP9Zzd+Q2TE1R6B8ovRN+N8xWxI4zw7a2yn0pMNTwgKpZ6BfzSljomgxJCuJFd2c7J
         EUDsVv6nUezR8K5oR+VRSVB2AwHzZ3MGxYn8E6v80db+9ZnbzWCRt9qpSrfCuv5g3hkg
         qgo7iP959VIPZ9kn/WOhrx99ZKcRjcyGda/vm7OyZpTFMh4+LZYio0FxbX4kVW6m3XWb
         +HJYDcyrA/CI8NUOiGDg/fOufuIway9nYjgcBAiQspxIBJTwsLA9ELljeVz9F39YkPzM
         CiB2uucFktrCz2ZjfeZNmPRLKbTuL/bBLtZ0AsB05Qj9jt4J50R3VM0alcGz7SiNxzTG
         qRLA==
X-Gm-Message-State: AOJu0YwSh4t3TY/zWpvXA+zij8oNk6Om5A2bdsxcWi7k/QN5SSsHl2cp
	VfJ9xfDF9AX3CIq6Vz+p84zGMTHV9B7gikycaM6Xjx+Ps7D66qThoIGAuOJOIaSBnBDzitDyHTp
	p7ghHurj67GAVOXhUxwFtJi+gd/q3rPJdYDlJtw==
X-Google-Smtp-Source: AGHT+IE8628/ryJcq0jWqgiyCOYnICNChe4Van+UHIOQKbeMZY6cksJTLZHkBsvo1UEa8l7Vdw0ft2CbehPS82QKEek=
X-Received: by 2002:a05:6902:1ac2:b0:dcd:8a5:d5b8 with SMTP id
 db2-20020a0569021ac200b00dcd08a5d5b8mr1319483ybb.49.1707993497024; Thu, 15
 Feb 2024 02:38:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240209164825.166800-1-jacopo.mondi@ideasonboard.com> <20240209164825.166800-4-jacopo.mondi@ideasonboard.com>
In-Reply-To: <20240209164825.166800-4-jacopo.mondi@ideasonboard.com>
From: Naushir Patuck <naush@raspberrypi.com>
Date: Thu, 15 Feb 2024 10:37:41 +0000
Message-ID: <CAEmqJPrEynj=XEyE=Gi-ZQSt-yBFsLBE8dxn=wfWTaa42ALNbA@mail.gmail.com>
Subject: Re: [PATCH 3/8] media: Add a pixel format for BRG48 and RGB48
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>, 
	David Plowman <david.plowman@raspberrypi.com>, 
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Sakari Ailus <sakari.ailus@iki.fi>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Jacopo,

Thank you for your patch.

On Fri, 9 Feb 2024 at 16:48, Jacopo Mondi <jacopo.mondi@ideasonboard.com> wrote:
>
> Add BGR48 and RGB48 16-bit per component image formats.
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  .../userspace-api/media/v4l/pixfmt-rgb.rst    | 39 +++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-common.c         |  2 +
>  drivers/media/v4l2-core/v4l2-ioctl.c          |  2 +
>  include/uapi/linux/videodev2.h                |  4 ++
>  4 files changed, 47 insertions(+)
>
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
> index b71b80d634d6..458308ae4eb8 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
> @@ -996,6 +996,45 @@ arranged in little endian order.
>
>      \normalsize
>
> +16 Bits Per Component
> +=====================
> +
> +These formats store an RGB triplet in six bytes, with 16 bits per component.
> +
> +.. raw:: latex
> +
> +    \small
> +
> +.. flat-table:: RGB Formats With 16 Bits Per Component
> +    :header-rows:  1
> +
> +    * - Identifier
> +      - Code
> +      - Byte 1-0
> +      - Byte 3-2
> +      - Byte 5-4
> +    * .. _V4L2-PIX-FMT-BGR48:
> +
> +      - ``V4L2_PIX_FMT_BGR48``
> +      - 'BGR6'
> +
> +      - B\ :sub:`15-0`
> +      - G\ :sub:`15-0`
> +      - R\ :sub:`15-0`
> +      -
> +    * .. _V4L2-PIX-FMT-RGB48:
> +
> +      - ``V4L2_PIX_FMT_RGB48``
> +      - 'RGB6'
> +
> +      - R\ :sub:`15-0`
> +      - G\ :sub:`15-0`
> +      - B\ :sub:`15-0`
> +
> +.. raw:: latex
> +
> +    \normalsize
> +
>  Deprecated RGB Formats
>  ======================
>
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> index d34d210908d9..ff4b4d2de9d2 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -253,6 +253,8 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
>                 { .format = V4L2_PIX_FMT_RGB555,  .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
>                 { .format = V4L2_PIX_FMT_BGR666,  .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
>                 { .format = V4L2_PIX_FMT_BGR48_12, .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 6, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
> +               { .format = V4L2_PIX_FMT_BGR48, .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 6, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
> +               { .format = V4L2_PIX_FMT_RGB48, .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 6, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
>                 { .format = V4L2_PIX_FMT_ABGR64_12, .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 8, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
>                 { .format = V4L2_PIX_FMT_RGBA1010102, .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
>                 { .format = V4L2_PIX_FMT_RGBX1010102, .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 24f52485e59c..3c9b5b2f456c 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1298,6 +1298,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>         case V4L2_PIX_FMT_RGBX1010102:  descr = "32-bit RGBX 10-10-10-2"; break;
>         case V4L2_PIX_FMT_RGBA1010102:  descr = "32-bit RGBA 10-10-10-2"; break;
>         case V4L2_PIX_FMT_ARGB2101010:  descr = "32-bit ARGB 2-10-10-10"; break;
> +       case V4L2_PIX_FMT_BGR48:        descr = "48-bit BGR 16-16-16"; break;
> +       case V4L2_PIX_FMT_RGB48:        descr = "48-bit RGB 16-16-16"; break;
>         case V4L2_PIX_FMT_BGR48_12:     descr = "12-bit Depth BGR"; break;
>         case V4L2_PIX_FMT_ABGR64_12:    descr = "12-bit Depth BGRA"; break;
>         case V4L2_PIX_FMT_GREY:         descr = "8-bit Greyscale"; break;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 94a0373e8234..2782c7962974 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -584,6 +584,10 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_BGR48_12    v4l2_fourcc('B', '3', '1', '2') /* 48  BGR 12-bit per component */
>  #define V4L2_PIX_FMT_ABGR64_12   v4l2_fourcc('B', '4', '1', '2') /* 64  BGRA 12-bit per component */
>
> +/* RGB formats (6 bytes per pixel) */

s/6/16/

Reviewed-by: Naushir Patuck <naush@raspberrypi.com>

> +#define V4L2_PIX_FMT_BGR48 v4l2_fourcc('B', 'G', 'R', '6') /* 16  BGR-16-16-16 */
> +#define V4L2_PIX_FMT_RGB48 v4l2_fourcc('R', 'G', 'B', '6') /* 16  RGB-16-16-16 */
> +
>  /* Grey formats */
>  #define V4L2_PIX_FMT_GREY    v4l2_fourcc('G', 'R', 'E', 'Y') /*  8  Greyscale     */
>  #define V4L2_PIX_FMT_Y4      v4l2_fourcc('Y', '0', '4', ' ') /*  4  Greyscale     */
> --
> 2.43.0
>

