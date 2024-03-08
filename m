Return-Path: <linux-media+bounces-6708-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B62876175
	for <lists+linux-media@lfdr.de>; Fri,  8 Mar 2024 11:04:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B17252842B8
	for <lists+linux-media@lfdr.de>; Fri,  8 Mar 2024 10:04:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEF4D53801;
	Fri,  8 Mar 2024 10:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="jMLXNAOI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A3A2CCB3
	for <linux-media@vger.kernel.org>; Fri,  8 Mar 2024 10:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709892263; cv=none; b=DjSub2KrJDM2md+JfbPVdXZYAEFrywDc8lCmbr3vS46d8j1oXgNZ13LmCI8dpTOuDb0lQhr602aDXi7Dcg4vlfJDNbEauR7qFYvNF1Alz3XmVz+5DZVS754lHrhoy0XodGaClGDi8tCK8sKkbbpBbMO3ym0GycMpe1KdLHWvoh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709892263; c=relaxed/simple;
	bh=3pttau+Sirt4d2IGmbp6DsNwmObwSO5SEq0xWaBgj5w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=avv/S/DN4Hm5vFF/dLkLidxszMSRpLSdeUFFEmlOSL4xy5lelN7TtDdF6TdC+bvkCq6y6OWRvLFGNWnNNzwDaRyej/Vqi/pQo5V5J447YVJggqQgmQCtZGri7iz6xVZ5LSMpYCTflNDRlEwmaG7ktAHs1mOKF22Shk4Xpr/VLwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=jMLXNAOI; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-609f3ca61e0so16345837b3.3
        for <linux-media@vger.kernel.org>; Fri, 08 Mar 2024 02:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1709892260; x=1710497060; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=innGYI8qPJw/O3BK8RNvxrGzEp2fOJkW3cmvicSUvlo=;
        b=jMLXNAOIx15YgNFpOpRtqOLHtMwjwm27+hvTLqKhQCtHw/hyN8S9RqgDdBdedtlCLU
         beUlhYl2reRPbBCEgmWBJ/aKLcoPRy61BxWBGzg9if3OPU/z1WI95zY12TjkTGU58S8z
         zwDoaGq3sbRd1Hj3tLWaw1WddeXdfZM6ch1Q+5eT3q+7d4XTXJJAfd50n6GIomzjiBjn
         OtCUtHXfaWMAibKusTXO9Sf/Gf4ydWeC00SIQdUeR3KsdKqhreX6etv/4+SKiZTKFHLO
         0NI8C3ej8h9u2dGcd3DLxks0Ue8HT4Y1X7hKNgFyvJm1gG6gsI79G10cVK3CqtKT8JvI
         1u0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709892260; x=1710497060;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=innGYI8qPJw/O3BK8RNvxrGzEp2fOJkW3cmvicSUvlo=;
        b=ResAyoh2J0Zav/a2xt9AgyVKjcaBtNMAwmzia8QHKa/SP+yJUGJuyCXKzg5geGWMdC
         WCSVS3zPlKTUpytYf2JLAr/0ywzsshc+IVy+qTO4tDkys1D6a9pjkBozjmJ3Xyn0gQNG
         ijAGyqpFDVXdSDyZ5IzuefanX9B6nA9FIE3dnKG8hADVlNgM7bujb9BAzocZO2qi4JZr
         Ujkv7lxUfNf2kXig2noeG+wSzIEaWp6VV2y69+akNQIqBki4/is8j3hnqtsLCFFPISu5
         Qe9C6VkpWrBxX22yIT/DVp7939BsaKFBDRUAoVHROeKmsw52jED8C1gi4He0orf3I6r6
         7BHg==
X-Gm-Message-State: AOJu0Yxc0YfXY8+OsjicUm/eGF94pl840UMWKciRcYnK7CsN9MzMpZNz
	BxpyGlTuA4cIE94RtjACl05iqYj7jKLJx20yIUqtLEGZWtEpdQIKvFppFAXac2IOntpfKda9gSY
	oykAwY52/EFXnm3L9kM1vrfBPxVJper4blW+vC9e2EzYsD6OaAa8=
X-Google-Smtp-Source: AGHT+IFT3PhD6tvK7EZ7PY8RFKCe2r0o1BJ1X041N5Tkeq+rsDEzAgo4wJtLcvpbmirFbHM2mRch2VDqX5Hyx4P1UWo=
X-Received: by 2002:a81:52c2:0:b0:609:fded:23e with SMTP id
 g185-20020a8152c2000000b00609fded023emr3209599ywb.0.1709892260532; Fri, 08
 Mar 2024 02:04:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240308085028.44388-1-jacopo.mondi@ideasonboard.com> <20240308085028.44388-5-jacopo.mondi@ideasonboard.com>
In-Reply-To: <20240308085028.44388-5-jacopo.mondi@ideasonboard.com>
From: Naushir Patuck <naush@raspberrypi.com>
Date: Fri, 8 Mar 2024 10:03:44 +0000
Message-ID: <CAEmqJPpwgdHJf85BmwG6V0iYY9iiU5tX8n=h0_UtfpGiESjESw@mail.gmail.com>
Subject: Re: [PATCH v4 4/9] media: uapi: Add a pixel format for BGR48 and RGB48
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

On Fri, 8 Mar 2024 at 08:50, Jacopo Mondi <jacopo.mondi@ideasonboard.com> wrote:
>
> Add BGR48 and RGB48 16-bit per component image formats.
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

Reviewed-by: Naushir Patuck <naush@raspberrypi.com>

> ---
>  .../userspace-api/media/v4l/pixfmt-rgb.rst    | 54 +++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-common.c         |  2 +
>  drivers/media/v4l2-core/v4l2-ioctl.c          |  2 +
>  include/uapi/linux/videodev2.h                |  2 +
>  4 files changed, 60 insertions(+)
>
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
> index b71b80d634d6..5ed4d62df909 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
> @@ -996,6 +996,60 @@ arranged in little endian order.
>
>      \normalsize
>
> +16 Bits Per Component
> +=====================
> +
> +These formats store an RGB triplet in six bytes, with 16 bits per component
> +stored in memory in little endian byte order. They are named based on the order
> +of the RGB components as stored in memory. For instance, RGB48 stores R\
> +:sub:`7:0` and R\ :sub:`15:8` in bytes 0 and 1 respectively. This differs from
> +the DRM format nomenclature that instead uses the order of components as seen in
> +the 48-bits little endian word.
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
> +      - Byte 0
> +      - Byte 1
> +      - Byte 2
> +      - Byte 3
> +      - Byte 4
> +      - Byte 5
> +
> +    * .. _V4L2-PIX-FMT-BGR48:
> +
> +      - ``V4L2_PIX_FMT_BGR48``
> +      - 'BGR6'
> +
> +      - B\ :sub:`7-0`
> +      - B\ :sub:`15-8`
> +      - G\ :sub:`7-0`
> +      - G\ :sub:`15-8`
> +      - R\ :sub:`7-0`
> +      - R\ :sub:`15-8`
> +
> +    * .. _V4L2-PIX-FMT-RGB48:
> +
> +      - ``V4L2_PIX_FMT_RGB48``
> +      - 'RGB6'
> +
> +      - R\ :sub:`7-0`
> +      - R\ :sub:`15-8`
> +      - G\ :sub:`7-0`
> +      - G\ :sub:`15-8`
> +      - B\ :sub:`7-0`
> +      - B\ :sub:`15-8`
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
> index d0724240a446..a2f9c446a565 100644
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
> index 911f00ed28fd..91fba9adcda2 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -582,6 +582,8 @@ struct v4l2_pix_format {
>
>  /* RGB formats (6 or 8 bytes per pixel) */
>  #define V4L2_PIX_FMT_BGR48_12    v4l2_fourcc('B', '3', '1', '2') /* 48  BGR 12-bit per component */
> +#define V4L2_PIX_FMT_BGR48       v4l2_fourcc('B', 'G', 'R', '6') /* 48  BGR 16-bit per component */
> +#define V4L2_PIX_FMT_RGB48       v4l2_fourcc('R', 'G', 'B', '6') /* 48  RGB 16-bit per component */
>  #define V4L2_PIX_FMT_ABGR64_12   v4l2_fourcc('B', '4', '1', '2') /* 64  BGRA 12-bit per component */
>
>  /* Grey formats */
> --
> 2.43.2
>

