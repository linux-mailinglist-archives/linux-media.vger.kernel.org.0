Return-Path: <linux-media+bounces-6574-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 873578736D9
	for <lists+linux-media@lfdr.de>; Wed,  6 Mar 2024 13:45:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB6E01C22330
	for <lists+linux-media@lfdr.de>; Wed,  6 Mar 2024 12:45:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1115D126F1C;
	Wed,  6 Mar 2024 12:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="HgYhUpYw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DDF80026
	for <linux-media@vger.kernel.org>; Wed,  6 Mar 2024 12:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709729146; cv=none; b=uWOVhdp9BRdMVr/CRWCBI0oHs5bakX/wCWmie96oh4CKgKbPaxDFvHb4SDQaeVvGxDovjH7vOGLV6hL/U0VItWu1sa1+9QWvgTIzKntrcG0R0CMYyDR65R3iyLoZBTVzDzLfJhsW+FX8QvID2y9gB/ADuTA5tVl9ZIm8PSZ3dzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709729146; c=relaxed/simple;
	bh=hP5NRC2Px6k0oUeMZEZXclY3uEQPY5ScKRYysSM4Vak=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WvUbSSZ8qwOVhvsoPP59oUthHdS9/V3Hf4CeTEGRHqhg++DQdAxL+hV+xpJFyQnFZB91BGHYXfYEalisD3gbP87ET42rUl8dwhePh3XbzQVl5aNe/vUVexLHqLdlaB/eaM0zAJOkEXK8b8r9RzS7byoVntyz8+whwqjFDB6t9W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=HgYhUpYw; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-513173e8191so8600171e87.1
        for <linux-media@vger.kernel.org>; Wed, 06 Mar 2024 04:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1709729142; x=1710333942; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=D49uZpKa3RQIRnRXIeHAEmgAY9p/pXHEmup0N8WQ4m8=;
        b=HgYhUpYwEp05xssgtYIv2TFuqOs4MERWfdawAxGilHfaaW/fEBA6sx6zj8sbj83ro5
         qgDhph6AuJv0oeBmtBQV08qddk4Lfn6BokLT456x/qllDyYLbKgN3pFLIUV5tPGP+FTW
         NmLtTN6NqKgPQFPiar+0nGeoTC5c7l5HDwTUc7LjYTdZkVU9hEpDbyH52zWaUSBSX6Rw
         86kCy4pGoqDDhhPWjgxaLziMhRbKkSD673asK2TKI7NFmsRjWD5Mgp871dTwMEeQF4ml
         e7+W2N/gv+z1CblzEO/sIPpbrerS8mNmVlTy5G060KLHtl0Tpb56FEjxg626EwManIjs
         OFAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709729142; x=1710333942;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D49uZpKa3RQIRnRXIeHAEmgAY9p/pXHEmup0N8WQ4m8=;
        b=o32KioDQ8vcZF9hkMtu0R3N+jq42zmNdrPlbg7gJm6xAl/ZfIXbga5zMQ6N2ubtZJP
         pOuvjP3BGcC39ACt4DIzyrlCP1aOAIo2F5UW0p6lt7exf6FEmTcHxeLdXfzi1WZwKbFm
         Pi5uJeulIdYuHEy3zmtOIKoBFlEZNta473w+Bp7SYjmiOwXNw55pOjTvxVFhRpxVoP0V
         BMT7PF7ONR0nrWjdNeyNxwigJJPBbiPnB//nlfGgJqKimRVn9sf+JE2j/S73HjqxykfS
         iKTJCCGnxPA8SfiGm7OwTHk2sg+E0pQoWfnOnzmH77f53v7UqyEIb3dqdTi8F0WXrBMr
         kODg==
X-Gm-Message-State: AOJu0YwAwJXT+OCiSEqcJu88wBpFd3pmQhs34llGikDOOmk2cZrF3J31
	kBrQdGUr6wdd/jGVcpb9p/pKTMX+3ReDuiChkgWJrQEg8hiRR8uu6cgBZzU2D54J6K2m7iowDHK
	h6TYVsEeZjYf9idNHJJKtsf7FXaS30d4HOSOmGw==
X-Google-Smtp-Source: AGHT+IEh/Ni4mi4K19UKSAYyNn5ux/+uSVltqnLu8PruJkdvV6WNU/FW6u+LbZd2enuJvD1ymC5e177JSzVivOqtqAc=
X-Received: by 2002:a05:6512:1191:b0:513:42e:ddf0 with SMTP id
 g17-20020a056512119100b00513042eddf0mr3882016lfr.36.1709729141802; Wed, 06
 Mar 2024 04:45:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240305160855.147483-1-jacopo.mondi@ideasonboard.com> <20240305160855.147483-6-jacopo.mondi@ideasonboard.com>
In-Reply-To: <20240305160855.147483-6-jacopo.mondi@ideasonboard.com>
From: Naushir Patuck <naush@raspberrypi.com>
Date: Wed, 6 Mar 2024 12:45:05 +0000
Message-ID: <CAEmqJPoT2NPie__STgfcSqu4jjnwGj8r757EkQur2fEWP1Djzg@mail.gmail.com>
Subject: Re: [PATCH v3 5/9] media: uapi: Add meta pixel format for PiSP BE config
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

Thank you for this work.

On Tue, 5 Mar 2024 at 16:09, Jacopo Mondi <jacopo.mondi@ideasonboard.com> wrote:
>
> Add format description for the PiSP Back End configuration parameter
> buffer.
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Reviewed-by: Naushir Patuck <naush@raspberrypi.com>

> ---
>  .../userspace-api/media/v4l/meta-formats.rst  |  1 +
>  .../media/v4l/metafmt-pisp-be.rst             | 46 +++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-ioctl.c          |  1 +
>  include/uapi/linux/videodev2.h                |  3 ++
>  4 files changed, 51 insertions(+)
>  create mode 100644 Documentation/userspace-api/media/v4l/metafmt-pisp-be.rst
>
> diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
> index 0bb61fc5bc00..d96ff1ea3373 100644
> --- a/Documentation/userspace-api/media/v4l/meta-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
> @@ -14,6 +14,7 @@ These formats are used for the :ref:`metadata` interface only.
>
>      metafmt-d4xx
>      metafmt-intel-ipu3
> +    metafmt-pisp-be
>      metafmt-rkisp1
>      metafmt-uvc
>      metafmt-vsp1-hgo
> diff --git a/Documentation/userspace-api/media/v4l/metafmt-pisp-be.rst b/Documentation/userspace-api/media/v4l/metafmt-pisp-be.rst
> new file mode 100644
> index 000000000000..f3d30ba989b3
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/metafmt-pisp-be.rst
> @@ -0,0 +1,46 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. _v4l2-meta-fmt-rpi-be-cfg:
> +
> +************************
> +V4L2_META_FMT_RPI_BE_CFG
> +************************
> +
> +Raspberry Pi PiSP Back End configuration format
> +===============================================
> +
> +The Raspberry Pi PiSP Back End memory-to-memory image signal processor is
> +configured by userspace by providing a buffer of configuration parameters
> +to the `pispbe-config` output video device node using the
> +:c:type:`v4l2_meta_format` interface.
> +
> +The PiSP Back End processes images in tiles, and its configuration requires
> +specifying two different sets of parameters by populating the members of
> +:c:type:`pisp_be_tiles_config` defined in the ``pisp_be_config.h`` header file.
> +
> +The `Raspberry Pi PiSP technical specification
> +<https://datasheets.raspberrypi.com/camera/raspberry-pi-image-signal-processor-specification.pdf>_`
> +provide detailed description of the ISP back end configuration and programming
> +model.
> +
> +Global configuration data
> +-------------------------
> +
> +The global configuration data describe how the pixels in a particular image are
> +to be processed and is therefore shared across all the tiles of the image. So
> +for example, LSC (Lens Shading Correction) or Denoise parameters would be common
> +across all tiles from the same frame.
> +
> +Global configuration data are passed to the ISP by populating the member of
> +:c:type:`pisp_be_config`.
> +
> +Tile parameters
> +---------------
> +
> +As the ISP processes images in tiles, each set of tiles parameters describe how
> +a single tile in an image is going to be processed. A single set of tile
> +parameters consist of 160 bytes of data and to process a batch of tiles several
> +sets of tiles parameters are required.
> +
> +Tiles parameters are passed to the ISP by populating the member of
> +:c:type:`pisp_tile` and the :c:type:`num_tiles` field.
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index a2f9c446a565..18e9aa1297e1 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1456,6 +1456,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>         case V4L2_PIX_FMT_Y210:         descr = "10-bit YUYV Packed"; break;
>         case V4L2_PIX_FMT_Y212:         descr = "12-bit YUYV Packed"; break;
>         case V4L2_PIX_FMT_Y216:         descr = "16-bit YUYV Packed"; break;
> +       case V4L2_META_FMT_RPI_BE_CFG:  descr = "RPi PiSP BE Config format"; break;
>
>         default:
>                 /* Compressed formats */
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 89b2b409fc03..c3daf61f43d5 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -845,6 +845,9 @@ struct v4l2_pix_format {
>  #define V4L2_META_FMT_RK_ISP1_PARAMS   v4l2_fourcc('R', 'K', '1', 'P') /* Rockchip ISP1 3A Parameters */
>  #define V4L2_META_FMT_RK_ISP1_STAT_3A  v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A Statistics */
>
> +/* Vendor specific - used for RaspberryPi PiSP */
> +#define V4L2_META_FMT_RPI_BE_CFG v4l2_fourcc('R', 'P', 'B', 'C') /* PiSP BE configuration */
> +
>  /* priv field value to indicates that subsequent fields are valid. */
>  #define V4L2_PIX_FMT_PRIV_MAGIC                0xfeedcafe
>
> --
> 2.43.2
>

