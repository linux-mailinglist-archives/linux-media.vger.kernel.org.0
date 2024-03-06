Return-Path: <linux-media+bounces-6547-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D743F87310D
	for <lists+linux-media@lfdr.de>; Wed,  6 Mar 2024 09:47:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5738BB27796
	for <lists+linux-media@lfdr.de>; Wed,  6 Mar 2024 08:47:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EA3A5D8E7;
	Wed,  6 Mar 2024 08:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="emlLeNSf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E035BAD4
	for <linux-media@vger.kernel.org>; Wed,  6 Mar 2024 08:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709714857; cv=none; b=gqDSuGSLqNDkBhvG+aiboWmbld5pvGcXTAxYKZBQg6GysyiBCDJL+soBrzrKv0U64zrDJ7LY/KpBZQapWHtlgywiN2UX4t/KMq/sHZFieSA3zGg+kPJ/c+Un/NZvmaGmRuUCv4xOT0RYlMJmRMebhhmcer2jhjrUnG3jutBdU7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709714857; c=relaxed/simple;
	bh=0ObD8vUy9fPvGDCtf5oS8e4y2wbyJRlH2la35Rf1gAI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NRcfNMMGaAeqbLaJ9+J8eOWv6xrN8qnQcpptn/IfBIKHe3gGdW+G2cLxiuVp2QRSzUxmWD5z3CJ7SRgQszU22Cyn4emOEpfVlXuY+vmKF6F3ZehVFr9ij4RFMovCR5mjMwHENvyZ7+5EVsrQKJx/jtK1DGNXvg42uOodITLRB2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=emlLeNSf; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-563b7b3e3ecso9945742a12.0
        for <linux-media@vger.kernel.org>; Wed, 06 Mar 2024 00:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1709714853; x=1710319653; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pHsOOy0NfXA3nHq5pK9p/eMAyDCZJgJ3Z95NrGIs5js=;
        b=emlLeNSfoe6tZ5lqfCgUU7R5JYxKwg0pbThaeMqN1vy15a0Ie5fMmGMBj1XduL4Eng
         B8LMcsvYouEUwUxDjJaxdetOTwwdy8H9gwIeHfO0TgR6gBDHPw8CvWaSc+CIZoMkWwJy
         R4cYKJizSHjubVJV5/g4RI9TRjGm9iZilAwfVWR6rU4uR8S/vLVZgiJpGyzaUKKnH70I
         4JXTa/gxmfcfveUk60yWzB4Pyvbwh2HM0aV4P1JfxR2+456rGTu55V8maWszqcnEAMRj
         FxKbot1QxGckLYih0HEVZgYRiMONdYMHxjeYDUvcTyFWTKfLqwZvFffNAfYqDrj4nzKS
         ggyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709714853; x=1710319653;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pHsOOy0NfXA3nHq5pK9p/eMAyDCZJgJ3Z95NrGIs5js=;
        b=thq7hOX3kFg6akF2iqylwQ861lTI+EBnz+7kxJqnIQ8TpkmLTOkfIQuBmvXrn0sG4W
         qQg3lrICt47qqK75LWCsTRUEnNGj/BYdEMgB0gZno4Baz7j1YTAoEFu/Ygp1PGeitHo5
         /pAhY7E+w8g/7MRIi2zWWefb5yc58layrPpCmTRLGf7Jwu670koA1oidIKAqfILTv5GN
         7xeGFH/E0NynQBlw9ivFnSw2ANw4Odo2OUbgFpNc5rIs/Tg5e6ZW5X0Rb5egifDpLauI
         oEbAPkpPm82WAjrOxssuntczN0PJE9m2FHFYAKFh3FStOZbRmr21gNLWZrqNHSwQNCMM
         kaDg==
X-Gm-Message-State: AOJu0Yzxlg4FAZzDY8ZcJBI9EVAAu60EuqMeDbXJaXn6/PSDEou4h276
	MmI/ysprE8g3f6sl3VTVlufaiRTKTNw2ClnPpKi/ZBuKfcEFS3GAWwyIHa3FI9durOtRAaC6WkL
	PfMaCgtoTRBh8cvepCVT3uGLaqDbIpWP2P2W6Dw==
X-Google-Smtp-Source: AGHT+IGGs3b1ar5wjISlNxdzTPtsqWfRGHo3NVnP9+xp4D5KSdwdR5A1meA3FBM3flBC1SIOuQ2RsqeNvEt+22HkllM=
X-Received: by 2002:a05:6402:5c3:b0:565:7edf:41b0 with SMTP id
 n3-20020a05640205c300b005657edf41b0mr10086510edx.6.1709714853554; Wed, 06 Mar
 2024 00:47:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240305160855.147483-1-jacopo.mondi@ideasonboard.com> <20240305160855.147483-2-jacopo.mondi@ideasonboard.com>
In-Reply-To: <20240305160855.147483-2-jacopo.mondi@ideasonboard.com>
From: Naushir Patuck <naush@raspberrypi.com>
Date: Wed, 6 Mar 2024 08:46:57 +0000
Message-ID: <CAEmqJPrOVXtXBioz9ukNkQYGW0Xn5VYVY38MkqMictd91NLkLQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] media: uapi: Add MIPI packed 12bit luma
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

Thank you for this patch.

On Tue, 5 Mar 2024 at 16:09, Jacopo Mondi <jacopo.mondi@ideasonboard.com> wrote:
>
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
>
> Add the Y12P format to describe monochrome 12 bit image format
> packed according to the RAW12 format as defined by the MIPI
> CSI-2 specification.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Naushir Patuck <naush@raspberrypi.com>

> ---
>  .../userspace-api/media/v4l/pixfmt-yuv-luma.rst       | 11 +++++++++++
>  drivers/media/v4l2-core/v4l2-ioctl.c                  |  1 +
>  include/uapi/linux/videodev2.h                        |  1 +
>  3 files changed, 13 insertions(+)
>
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
> index cf8e4dfbfbd4..585d736f36e5 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
> @@ -114,6 +114,17 @@ are often referred to as greyscale formats.
>        - ...
>        - ...
>
> +    * .. _V4L2-PIX-FMT-Y12P:
> +
> +      - ``V4L2_PIX_FMT_Y12P``
> +      - 'Y12P'
> +
> +      -  Y'\ :sub:`0`\ [11:4]
> +      -  Y'\ :sub:`1`\ [11:4]
> +      -  Y'\ :sub:`1`\ [3:0] Y'\ :sub:`0`\ [3:0]
> +      - ...
> +      - ...
> +
>      * .. _V4L2-PIX-FMT-Y14:
>
>        - ``V4L2_PIX_FMT_Y14``
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 6e7b8b682d13..9cb09334161b 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1311,6 +1311,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>         case V4L2_PIX_FMT_Y16_BE:       descr = "16-bit Greyscale BE"; break;
>         case V4L2_PIX_FMT_Y10BPACK:     descr = "10-bit Greyscale (Packed)"; break;
>         case V4L2_PIX_FMT_Y10P:         descr = "10-bit Greyscale (MIPI Packed)"; break;
> +       case V4L2_PIX_FMT_Y12P:         descr = "12-bit Greyscale (MIPI Packed)"; break;
>         case V4L2_PIX_FMT_IPU3_Y10:     descr = "10-bit greyscale (IPU3 Packed)"; break;
>         case V4L2_PIX_FMT_Y8I:          descr = "Interleaved 8-bit Greyscale"; break;
>         case V4L2_PIX_FMT_Y12I:         descr = "Interleaved 12-bit Greyscale"; break;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index a8015e5e7fa4..11ebf9b22ccb 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -598,6 +598,7 @@ struct v4l2_pix_format {
>  /* Grey bit-packed formats */
>  #define V4L2_PIX_FMT_Y10BPACK    v4l2_fourcc('Y', '1', '0', 'B') /* 10  Greyscale bit-packed */
>  #define V4L2_PIX_FMT_Y10P    v4l2_fourcc('Y', '1', '0', 'P') /* 10  Greyscale, MIPI RAW10 packed */
> +#define V4L2_PIX_FMT_Y12P    v4l2_fourcc('Y', '1', '2', 'P') /* 12  Greyscale, MIPI RAW12 packed */
>  #define V4L2_PIX_FMT_IPU3_Y10          v4l2_fourcc('i', 'p', '3', 'y') /* IPU3 packed 10-bit greyscale */
>
>  /* Palette formats */
> --
> 2.43.2
>

