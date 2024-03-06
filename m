Return-Path: <linux-media+bounces-6558-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC57387338E
	for <lists+linux-media@lfdr.de>; Wed,  6 Mar 2024 11:06:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6EE8EB232B5
	for <lists+linux-media@lfdr.de>; Wed,  6 Mar 2024 10:02:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD0AC5F869;
	Wed,  6 Mar 2024 10:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Flo+EAAd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112BB5C904
	for <linux-media@vger.kernel.org>; Wed,  6 Mar 2024 10:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709719284; cv=none; b=akhNGSeHCdCI4MUkxMDJmbzVE+wbKoGVLPcBsEmZ5e+d2krccEm4gawxGqYEk+b/l0eof/Ssg8QeabL3Hf+n2J5O4I1qBJEicLUp/eOH+0nthkgI/pESCWReghrzGUXZkWdMbMeneUf+zHej29TAvez9UPMFfWrm3N/gLr1WS2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709719284; c=relaxed/simple;
	bh=7YlbL5FXHM2t8ZgcqMzlHxU/6jlLBVcXvzX/m4OgbtY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s4EVEByHkM5FHOI6XbsjNpM3gKP683AqBXl+4tByEZ65hjqfDqKpIfFEsH14BRCKol4jvwmSmwWJ8WpKfh+j9YJ/vLU/gDZU0Rm4eakWLLBDZduiklwo9drDbZLGuIYhOfLyoHBEey6TEoKuYhSTu+Fq/xc0dmbGRbmr/0JQUNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=Flo+EAAd; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-55a5e7fa471so9539020a12.1
        for <linux-media@vger.kernel.org>; Wed, 06 Mar 2024 02:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1709719280; x=1710324080; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CYholU35Rv09I56VVPU/DhK/wEZo3q7lswY+0d7LmlE=;
        b=Flo+EAAddPLyqaIenzpvPRXsFGIeWLZXrbSbyjfmG/jbhjvdVSj1T8RTPSJw1njCAp
         jghVBVWRF5+Co5YnpRt2ZUQzPXQ5jePd/kskOuCSDf0u9v8foSKKv/7Q00w63u1IXnCv
         VTMsxOpHWV3YHMJ9KyOFFz40Hb2f1AiipeWvbU2Dwz2n2ePsFlr64yYP8FKE5L17KLqK
         C8ipWyvgvWsXZRLbUCmqX14v16IxVhM9caNZ+RYT2OYtdzUvPfHm7C4rgJtpmTjKNhkJ
         GY1+lJXrsxLKMNxjg7WGYFiIrKdVlDyyK3KEBg6gKWJjEv3l2odUBlKzppIFp+4px/DU
         fapg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709719280; x=1710324080;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CYholU35Rv09I56VVPU/DhK/wEZo3q7lswY+0d7LmlE=;
        b=r6TMdu82sOGZLgHVPqLq3q9moIktnLn57TYnL9oPGeCVf97xsU8MOp59TC4GWe/yTi
         AZ3fXMdFFdj0yWO03d+WmomWmKWnfe1LF2sgYXk16Ulu098U8p0WwFXNxklLeXi3Iw+W
         g6mwKfPoR5NEo9lv9tWNl4GSrchmHpusk0oxZJCT0GzneNdGorQ/aKhdCpcmle4xQQaY
         WXYvFdo5Gy6PMFl9ulcJpEkVgD73ly8Eimh/5PSILm4pSVXlgWNeUzr84A6NR4Km42j5
         lHYiCAzWW57ZeLBH/c3+evcb+l1JYyPlWP5L7TyqpQZ0C9JWXs3HatIuGjeI+1+pc+EH
         9v2Q==
X-Gm-Message-State: AOJu0Yy9Ir3iYMmrZZhVVrBIFjN1MVc1drYZH4/bKusEmczc/Lj/yK7E
	zDR+8UiaUnsFSYtZQsmeIV4lCkybzUqrKDOq7643z9sJNqjG58TLpwe1Cb4lSzdwSfooNEw32mc
	tBjpjMNdN5D/otDEFy4oE9peB2tZFvFd2zi5Pm9TqincbVQDa
X-Google-Smtp-Source: AGHT+IFUHGNEKm936y64M+l1I1Pot9ZFzrK7sg47/cdviMOHYr3IP8YJ65sQ3/jCH/MEGPmDrFFnSr4yehk6PnyIFuE=
X-Received: by 2002:a05:6402:2153:b0:566:777:af4f with SMTP id
 bq19-20020a056402215300b005660777af4fmr9374138edb.1.1709719280228; Wed, 06
 Mar 2024 02:01:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240305160855.147483-1-jacopo.mondi@ideasonboard.com> <20240305160855.147483-3-jacopo.mondi@ideasonboard.com>
In-Reply-To: <20240305160855.147483-3-jacopo.mondi@ideasonboard.com>
From: Naushir Patuck <naush@raspberrypi.com>
Date: Wed, 6 Mar 2024 10:00:43 +0000
Message-ID: <CAEmqJPoznpA8z9AkBewcto5o+E+4_xf+Z6P_e=Gzx1YmAhjB5g@mail.gmail.com>
Subject: Re: [PATCH v3 2/9] media: uapi: Add MIPI packed 14bit luma
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

On Tue, 5 Mar 2024 at 16:09, Jacopo Mondi <jacopo.mondi@ideasonboard.com> wrote:
>
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
>
> Add the Y14P format to describe monochrome 14 bit image format
> packed according to the RAW14 format as defined by the MIPI
> CSI-2 specification.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Naushir Patuck <naush@raspberrypi.com>


> ---
>  .../media/v4l/pixfmt-yuv-luma.rst             | 37 +++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-ioctl.c          |  1 +
>  include/uapi/linux/videodev2.h                |  1 +
>  3 files changed, 39 insertions(+)
>
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
> index 585d736f36e5..3af6e3cb70c4 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
> @@ -36,6 +36,8 @@ are often referred to as greyscale formats.
>        - Byte 2
>        - Byte 3
>        - Byte 4
> +      - Byte 5
> +      - Byte 6
>
>      * .. _V4L2-PIX-FMT-GREY:
>
> @@ -47,6 +49,8 @@ are often referred to as greyscale formats.
>        - ...
>        - ...
>        - ...
> +      - ...
> +      - ...
>
>      * .. _V4L2-PIX-FMT-IPU3-Y10:
>
> @@ -58,6 +62,8 @@ are often referred to as greyscale formats.
>        - Y'\ :sub:`2`\ [3:0] Y'\ :sub:`1`\ [9:6]
>        - Y'\ :sub:`3`\ [1:0] Y'\ :sub:`2`\ [9:4]
>        - Y'\ :sub:`3`\ [9:2]
> +      - ...
> +      - ...
>
>      * .. _V4L2-PIX-FMT-Y10:
>
> @@ -69,6 +75,8 @@ are often referred to as greyscale formats.
>        - ...
>        - ...
>        - ...
> +      - ...
> +      - ...
>
>      * .. _V4L2-PIX-FMT-Y10BPACK:
>
> @@ -80,6 +88,8 @@ are often referred to as greyscale formats.
>        - Y'\ :sub:`1`\ [3:0] Y'\ :sub:`2`\ [9:6]
>        - Y'\ :sub:`2`\ [5:0] Y'\ :sub:`3`\ [9:8]
>        - Y'\ :sub:`3`\ [7:0]
> +      - ...
> +      - ...
>
>      * .. _V4L2-PIX-FMT-Y10P:
>
> @@ -91,6 +101,8 @@ are often referred to as greyscale formats.
>        - Y'\ :sub:`2`\ [9:2]
>        - Y'\ :sub:`3`\ [9:2]
>        - Y'\ :sub:`3`\ [1:0] Y'\ :sub:`2`\ [1:0] Y'\ :sub:`1`\ [1:0] Y'\ :sub:`0`\ [1:0]
> +      - ...
> +      - ...
>
>      * .. _V4L2-PIX-FMT-Y12:
>
> @@ -102,6 +114,8 @@ are often referred to as greyscale formats.
>        - ...
>        - ...
>        - ...
> +      - ...
> +      - ...
>
>      * .. _V4L2-PIX-FMT-Y012:
>
> @@ -113,6 +127,8 @@ are often referred to as greyscale formats.
>        - ...
>        - ...
>        - ...
> +      - ...
> +      - ...
>
>      * .. _V4L2-PIX-FMT-Y12P:
>
> @@ -124,6 +140,8 @@ are often referred to as greyscale formats.
>        -  Y'\ :sub:`1`\ [3:0] Y'\ :sub:`0`\ [3:0]
>        - ...
>        - ...
> +      - ...
> +      - ...
>
>      * .. _V4L2-PIX-FMT-Y14:
>
> @@ -135,6 +153,21 @@ are often referred to as greyscale formats.
>        - ...
>        - ...
>        - ...
> +      - ...
> +      - ...
> +
> +    * .. _V4L2-PIX-FMT-Y14P:
> +
> +      - ``V4L2_PIX_FMT_Y14P``
> +      - 'Y14P'
> +
> +      -  Y'\ :sub:`0`\ [13:6]
> +      -  Y'\ :sub:`1`\ [13:6]
> +      -  Y'\ :sub:`2`\ [13:6]
> +      -  Y'\ :sub:`3`\ [13:6]
> +      -  Y'\ :sub:`1`\ [1:0] Y'\ :sub:`0`\ [5:0]
> +      -  Y'\ :sub:`2`\ [3:0] Y'\ :sub:`1`\ [5:2]
> +      -  Y'\ :sub:`3`\ [5:0] Y'\ :sub:`2`\ [5:4]
>
>      * .. _V4L2-PIX-FMT-Y16:
>
> @@ -146,6 +179,8 @@ are often referred to as greyscale formats.
>        - ...
>        - ...
>        - ...
> +      - ...
> +      - ...
>
>      * .. _V4L2-PIX-FMT-Y16-BE:
>
> @@ -157,6 +192,8 @@ are often referred to as greyscale formats.
>        - ...
>        - ...
>        - ...
> +      - ...
> +      - ...
>
>  .. raw:: latex
>
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 9cb09334161b..d0724240a446 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1312,6 +1312,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>         case V4L2_PIX_FMT_Y10BPACK:     descr = "10-bit Greyscale (Packed)"; break;
>         case V4L2_PIX_FMT_Y10P:         descr = "10-bit Greyscale (MIPI Packed)"; break;
>         case V4L2_PIX_FMT_Y12P:         descr = "12-bit Greyscale (MIPI Packed)"; break;
> +       case V4L2_PIX_FMT_Y14P:         descr = "14-bit Greyscale (MIPI Packed)"; break;
>         case V4L2_PIX_FMT_IPU3_Y10:     descr = "10-bit greyscale (IPU3 Packed)"; break;
>         case V4L2_PIX_FMT_Y8I:          descr = "Interleaved 8-bit Greyscale"; break;
>         case V4L2_PIX_FMT_Y12I:         descr = "Interleaved 12-bit Greyscale"; break;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 11ebf9b22ccb..911f00ed28fd 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -599,6 +599,7 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_Y10BPACK    v4l2_fourcc('Y', '1', '0', 'B') /* 10  Greyscale bit-packed */
>  #define V4L2_PIX_FMT_Y10P    v4l2_fourcc('Y', '1', '0', 'P') /* 10  Greyscale, MIPI RAW10 packed */
>  #define V4L2_PIX_FMT_Y12P    v4l2_fourcc('Y', '1', '2', 'P') /* 12  Greyscale, MIPI RAW12 packed */
> +#define V4L2_PIX_FMT_Y14P    v4l2_fourcc('Y', '1', '4', 'P') /* 14  Greyscale, MIPI RAW14 packed */
>  #define V4L2_PIX_FMT_IPU3_Y10          v4l2_fourcc('i', 'p', '3', 'y') /* IPU3 packed 10-bit greyscale */
>
>  /* Palette formats */
> --
> 2.43.2
>

