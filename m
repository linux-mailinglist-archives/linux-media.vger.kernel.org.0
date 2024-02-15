Return-Path: <linux-media+bounces-5203-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D96B985605A
	for <lists+linux-media@lfdr.de>; Thu, 15 Feb 2024 11:57:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 09E2C1C2095F
	for <lists+linux-media@lfdr.de>; Thu, 15 Feb 2024 10:57:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B750412AAFF;
	Thu, 15 Feb 2024 10:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="O8OdwdWn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B37129A75
	for <linux-media@vger.kernel.org>; Thu, 15 Feb 2024 10:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707993757; cv=none; b=NVfhFJsTvAcLFzgRNAk8ocG9bLaRpYloCeN6yfDfSbqIQuzGLX6b8j1rRilAUVpK1qDmQ6wljBQ3SW8VXGECuoDCIyP833FAp6pD4bgimTSPmeRlEANXbQ1MoldKV09l2SA+WH/kCrWKCrWwJGYrRPEdeCplwwUBurQYBoHR2aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707993757; c=relaxed/simple;
	bh=n0FaRviDg9SvHvrq/coSDKjWw6SlUGZ05NtZPkHXEoU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B8pua/HNh78nSmLIFcD6feqPqb5Irb9ApWT9teRwjWqeX02UwEwcWEasXJp3snElbif8lX9+cmG9lgzj6lUshIKYCQDMdFZ4FnYAM978gtwRDUZmPpveT4NLZJ0gyNfVBgPiizNohlOnE+1eSNJO66DUu5AEECSSgY/NtY/fJDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=O8OdwdWn; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dcdb210cb6aso717183276.2
        for <linux-media@vger.kernel.org>; Thu, 15 Feb 2024 02:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1707993754; x=1708598554; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4qKysZlhglisU2LTbYG+GagSFxllV6zfoixWRhCtD3Q=;
        b=O8OdwdWnKJjZ/4LPw1+mxzj/MYRAQb8vw8VC2EVjpGK3XlzuptcHny/LiYsKl6fcdM
         AYdzeTxbo904zwZIT3JWUT81VDbTNLvRDpGOJdROXBnyQ0CvQL8kPmwGEqGEgoprPbMG
         YezA6s3c28Z5ewFb+XYc1e9fV1HV73WvbYUftIgCTRPI1VDiRWPYymcxLfS2vwEOwomO
         BKVuQFL+MngdS+uUIzCftADodpBYD4E5OlCcAW9ePMY5YkmmbZuK+qmH/fsP3RnJDqLi
         fO0Mvyou9Mov1ZsQWfJiFZNPCthsbgrMeay1Sl3IhgB8riiyoEkz0B+5ehNkjhkPwHKF
         eCZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707993754; x=1708598554;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4qKysZlhglisU2LTbYG+GagSFxllV6zfoixWRhCtD3Q=;
        b=CtBkIMV2I4+1ZE+pMINqywVxyAhkx8LKBuAmy+PWZ6lOj0zsgowCAlbmD9RqhUyNQY
         2Vcghl1xY4LpbE0ky0DexWl93P1MFWYtCTx29zvT9baSap6dB+9VSIzSQI4h29Zsu0th
         rk/jlCm9otLkBXrH6MiGAz7jX0EC+94WxqrQEUoTx3AAbO3LypkHTPvQ4P4M3alAZlPa
         r0WZrZBZt/hQEaBVMLHG6eX4dOyEm+HXKiaJxloAh/nm+f9HFru/Iqns2p9R1lc8B/T5
         EYVgijt2lPCG3KWs/bYCjFmMASsNckD/lNp23WC+uwCpNeHAKTQWS66/UOBqjf6M+ESe
         8ABw==
X-Gm-Message-State: AOJu0YyRW20aQ65eA4ckvmx1Z2LHTdmnAVFd2By1gPl6G5fwYsXXXORd
	gUj9TtYzth677zkCcRlsVBMhP3MKnE7Jr2aUDuMwuGISzqep91285qocTaJ4itC4PetJru4FdnU
	KGtVjfq4mCuGsgiX/VpgbnncYergbbJ9HMp+BJw==
X-Google-Smtp-Source: AGHT+IEfSc3zwxf7D85JSdzYuB0xAyGyKKj3kb9vPg35ah51kple+BesPkhykpqoQRuZYeptJWV+aJhO4UAcNKHrdM8=
X-Received: by 2002:a25:8a07:0:b0:dc2:466a:23bd with SMTP id
 g7-20020a258a07000000b00dc2466a23bdmr1048353ybl.54.1707993753912; Thu, 15 Feb
 2024 02:42:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240209164825.166800-1-jacopo.mondi@ideasonboard.com>
 <20240209164825.166800-4-jacopo.mondi@ideasonboard.com> <CAEmqJPrEynj=XEyE=Gi-ZQSt-yBFsLBE8dxn=wfWTaa42ALNbA@mail.gmail.com>
In-Reply-To: <CAEmqJPrEynj=XEyE=Gi-ZQSt-yBFsLBE8dxn=wfWTaa42ALNbA@mail.gmail.com>
From: Naushir Patuck <naush@raspberrypi.com>
Date: Thu, 15 Feb 2024 10:41:58 +0000
Message-ID: <CAEmqJPpaBwNERyZ=T0Wmt=7AwBs+NDtbnXVuRd6aXU8Edi=eow@mail.gmail.com>
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

On Thu, 15 Feb 2024 at 10:37, Naushir Patuck <naush@raspberrypi.com> wrote:
>
> Hi Jacopo,
>
> Thank you for your patch.
>
> On Fri, 9 Feb 2024 at 16:48, Jacopo Mondi <jacopo.mondi@ideasonboard.com> wrote:
> >
> > Add BGR48 and RGB48 16-bit per component image formats.
> >
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
> >  .../userspace-api/media/v4l/pixfmt-rgb.rst    | 39 +++++++++++++++++++
> >  drivers/media/v4l2-core/v4l2-common.c         |  2 +
> >  drivers/media/v4l2-core/v4l2-ioctl.c          |  2 +
> >  include/uapi/linux/videodev2.h                |  4 ++
> >  4 files changed, 47 insertions(+)
> >
> > diff --git a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
> > index b71b80d634d6..458308ae4eb8 100644
> > --- a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
> > +++ b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
> > @@ -996,6 +996,45 @@ arranged in little endian order.
> >
> >      \normalsize
> >
> > +16 Bits Per Component
> > +=====================
> > +
> > +These formats store an RGB triplet in six bytes, with 16 bits per component.
> > +
> > +.. raw:: latex
> > +
> > +    \small
> > +
> > +.. flat-table:: RGB Formats With 16 Bits Per Component
> > +    :header-rows:  1
> > +
> > +    * - Identifier
> > +      - Code
> > +      - Byte 1-0
> > +      - Byte 3-2
> > +      - Byte 5-4
> > +    * .. _V4L2-PIX-FMT-BGR48:
> > +
> > +      - ``V4L2_PIX_FMT_BGR48``
> > +      - 'BGR6'
> > +
> > +      - B\ :sub:`15-0`
> > +      - G\ :sub:`15-0`
> > +      - R\ :sub:`15-0`
> > +      -
> > +    * .. _V4L2-PIX-FMT-RGB48:
> > +
> > +      - ``V4L2_PIX_FMT_RGB48``
> > +      - 'RGB6'
> > +
> > +      - R\ :sub:`15-0`
> > +      - G\ :sub:`15-0`
> > +      - B\ :sub:`15-0`
> > +
> > +.. raw:: latex
> > +
> > +    \normalsize
> > +
> >  Deprecated RGB Formats
> >  ======================
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> > index d34d210908d9..ff4b4d2de9d2 100644
> > --- a/drivers/media/v4l2-core/v4l2-common.c
> > +++ b/drivers/media/v4l2-core/v4l2-common.c
> > @@ -253,6 +253,8 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
> >                 { .format = V4L2_PIX_FMT_RGB555,  .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
> >                 { .format = V4L2_PIX_FMT_BGR666,  .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
> >                 { .format = V4L2_PIX_FMT_BGR48_12, .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 6, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
> > +               { .format = V4L2_PIX_FMT_BGR48, .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 6, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
> > +               { .format = V4L2_PIX_FMT_RGB48, .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 6, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
> >                 { .format = V4L2_PIX_FMT_ABGR64_12, .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 8, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
> >                 { .format = V4L2_PIX_FMT_RGBA1010102, .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
> >                 { .format = V4L2_PIX_FMT_RGBX1010102, .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
> > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> > index 24f52485e59c..3c9b5b2f456c 100644
> > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > @@ -1298,6 +1298,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
> >         case V4L2_PIX_FMT_RGBX1010102:  descr = "32-bit RGBX 10-10-10-2"; break;
> >         case V4L2_PIX_FMT_RGBA1010102:  descr = "32-bit RGBA 10-10-10-2"; break;
> >         case V4L2_PIX_FMT_ARGB2101010:  descr = "32-bit ARGB 2-10-10-10"; break;
> > +       case V4L2_PIX_FMT_BGR48:        descr = "48-bit BGR 16-16-16"; break;
> > +       case V4L2_PIX_FMT_RGB48:        descr = "48-bit RGB 16-16-16"; break;
> >         case V4L2_PIX_FMT_BGR48_12:     descr = "12-bit Depth BGR"; break;
> >         case V4L2_PIX_FMT_ABGR64_12:    descr = "12-bit Depth BGRA"; break;
> >         case V4L2_PIX_FMT_GREY:         descr = "8-bit Greyscale"; break;
> > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> > index 94a0373e8234..2782c7962974 100644
> > --- a/include/uapi/linux/videodev2.h
> > +++ b/include/uapi/linux/videodev2.h
> > @@ -584,6 +584,10 @@ struct v4l2_pix_format {
> >  #define V4L2_PIX_FMT_BGR48_12    v4l2_fourcc('B', '3', '1', '2') /* 48  BGR 12-bit per component */
> >  #define V4L2_PIX_FMT_ABGR64_12   v4l2_fourcc('B', '4', '1', '2') /* 64  BGRA 12-bit per component */
> >
> > +/* RGB formats (6 bytes per pixel) */
>
> s/6/16/

Sorry, I missed *bytes* in that sentence.  Please ignore the above suggestion.


>
> Reviewed-by: Naushir Patuck <naush@raspberrypi.com>
>
> > +#define V4L2_PIX_FMT_BGR48 v4l2_fourcc('B', 'G', 'R', '6') /* 16  BGR-16-16-16 */
> > +#define V4L2_PIX_FMT_RGB48 v4l2_fourcc('R', 'G', 'B', '6') /* 16  RGB-16-16-16 */
> > +
> >  /* Grey formats */
> >  #define V4L2_PIX_FMT_GREY    v4l2_fourcc('G', 'R', 'E', 'Y') /*  8  Greyscale     */
> >  #define V4L2_PIX_FMT_Y4      v4l2_fourcc('Y', '0', '4', ' ') /*  4  Greyscale     */
> > --
> > 2.43.0
> >

