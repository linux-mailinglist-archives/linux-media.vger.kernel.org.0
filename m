Return-Path: <linux-media+bounces-6575-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0047487370A
	for <lists+linux-media@lfdr.de>; Wed,  6 Mar 2024 13:54:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DF611F24E69
	for <lists+linux-media@lfdr.de>; Wed,  6 Mar 2024 12:54:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1719E130ACC;
	Wed,  6 Mar 2024 12:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="YsGsApDT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2555984FAC
	for <linux-media@vger.kernel.org>; Wed,  6 Mar 2024 12:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709729623; cv=none; b=kAIhtBPZN7i431E/m3Gfg1y74o0jDiF8Kyb3GcFYRj4wNC5to3vkBw0KW9BCdCIAuBGi0eUhBLncswVxaFipXFvSWm0Kr1pgUdzaLo2uipx4x1Ja5ViJTxeqteFRECEqKcHvA88T4wv9XXlIZSncQGi/lQh0K81qL+9M/pVoSz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709729623; c=relaxed/simple;
	bh=wTxL3oGq2PV8ip0SAeTKYPnmrmogExVCRcSSl3ILHVc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rQjOLJiZUSVYv4UY2nS5yy9ujDyV6S/I4DDrR/7pE+mdRIxyOvWG+Nm4UqfZXIIRSXvLz6hUhS70q2lgkVAF82QDZbXDF3sTPYuelAGHLLfnQ1vUMTlVpNMyulV/QCbpczUNzw6CWcxH5dFPSW3sXoHLNvJXKAirBoCHoXIPziE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=YsGsApDT; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-563b7b3e3ecso10374041a12.0
        for <linux-media@vger.kernel.org>; Wed, 06 Mar 2024 04:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1709729619; x=1710334419; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=s2D/WP3t2gE0ichq8J9QX7dG3UDV9Rx20mPF7p3D4Os=;
        b=YsGsApDT+y8skky9VV4oX8vkvlqpjgwtVopzD5h4ERM+AcNeePrz62n3Grtg7yrriv
         9cD3e2ZA/GLJ6AW7oTl1ZGQMFeomOeCQpjEELiPaRbQesW4kyF6d2QDG6JEgvmDdt7bA
         cdc4LYtl7/CGrjKLEtCKe1Uz8f3rVh5Sr79ZS7zF5ig3q3jmqo/wYJLyAcO4U0tkFVbe
         Tey7HVO8xSZBiRrlT1itrkMl+xK8MiWFHji7lSH0QpkXVTtyQ8zMhtZ0v0/OQOmccuvV
         la4O88aCW1+W1FTHobmvPD9XqD+8lz2JzR0JPK+RSpzqlIa9/2DoH4MMDpMcXF3oEli2
         Ytug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709729619; x=1710334419;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s2D/WP3t2gE0ichq8J9QX7dG3UDV9Rx20mPF7p3D4Os=;
        b=GVmD04XfrVG8QvBoWvoco6/9RKluvbr3+4fk7myXX646/a+ve/vJ+z2HmfU0zQa3Om
         0Veg4mc89EmMacfgNApHRxtlyxP5q1tXYCsqt2n8LBeX0CS5kzQUAuikbYnSUSjwsWQJ
         4aT35t5fJp1o4dA/RnT6cs/+2FRsefzB7zBlAyycuWgehXOr2TAWGwTarCFe8bBN+TD0
         pqddY2pezNKPjJQn67zD5zXXybFXhXGUFZwG4FzeCQgQTrq/0au8GsgJnqC5qjQgJ6ut
         WQnUJwgxq5MPKZScTfyierXpgsBFZo7iYd/G7nGQp8aY83fZWMBUY4JgZtOlwqmOiykU
         +zpA==
X-Gm-Message-State: AOJu0YwkfDPJBZMabNkcCMmyM0ZDgVuAOVVDKw46psNCLfG0Vx9uNDSO
	FNb6dPcfuYtJFGjedY8K6l1AZuykStm7Vgr9pxcBlakaw+E23uYCkJdbV9uremfGvesfzoGDRSf
	z418KbbQJGWDKn0Eul4rxlq8Tsnjxj9GLPMR6zA==
X-Google-Smtp-Source: AGHT+IGCtM9jTSZ7CQzJmuLD23EEP+4vqqERVT+g3WwTLKNwa5ELh2CbnTt2DJutbB7xi1nAdzu/BX1eeyyVmvMbm9A=
X-Received: by 2002:a05:6402:3590:b0:566:fbf5:a279 with SMTP id
 y16-20020a056402359000b00566fbf5a279mr11267093edc.20.1709729619444; Wed, 06
 Mar 2024 04:53:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240305160855.147483-1-jacopo.mondi@ideasonboard.com> <20240305160855.147483-7-jacopo.mondi@ideasonboard.com>
In-Reply-To: <20240305160855.147483-7-jacopo.mondi@ideasonboard.com>
From: Naushir Patuck <naush@raspberrypi.com>
Date: Wed, 6 Mar 2024 12:53:03 +0000
Message-ID: <CAEmqJPpfNAHDyiv-_1dxJ9-BAi8tz8_hZ08VB7kaYvcq=6qBAw@mail.gmail.com>
Subject: Re: [PATCH v3 6/9] media: uapi: Add PiSP Compressed RAW Bayer formats
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

On Tue, 5 Mar 2024 at 16:09, Jacopo Mondi <jacopo.mondi@ideasonboard.com> wrote:
>
> Add Raspberry Pi compressed RAW Bayer formats.
>
> The compression algorithm description is provided by Nick Hollinghurst
> <nick.hollinghurst@raspberrypi.com> from Raspberry Pi.
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  .../userspace-api/media/v4l/pixfmt-bayer.rst  |  1 +
>  .../media/v4l/pixfmt-pisp-comp-rggb.rst       | 70 +++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-ioctl.c          | 10 +++
>  include/uapi/linux/videodev2.h                | 12 ++++
>  4 files changed, 93 insertions(+)
>  create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-pisp-comp-rggb.rst

Does the filename need to have the Bayer order suffix (rggb in this
case), or would it be better to name it pixfmt-pisp-comp?

>
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst b/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
> index 2500413e5f43..81b69ea4084a 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
> @@ -30,3 +30,4 @@ orders. See also `the Wikipedia article on Bayer filter
>      pixfmt-srggb14
>      pixfmt-srggb14p
>      pixfmt-srggb16
> +    pixfmt-pisp-comp-rggb
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-pisp-comp-rggb.rst b/Documentation/userspace-api/media/v4l/pixfmt-pisp-comp-rggb.rst
> new file mode 100644
> index 000000000000..7be1b25b2241
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-pisp-comp-rggb.rst
> @@ -0,0 +1,70 @@
> +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> +
> +.. _v4l2-pix-fmt-pisp-comp1-rggb:
> +.. _v4l2-pix-fmt-pisp-comp1-grbg:
> +.. _v4l2-pix-fmt-pisp-comp1-gbrg:
> +.. _v4l2-pix-fmt-pisp-comp1-bggr:
> +.. _v4l2-pix-fmt-pisp-comp1-mono:
> +.. _v4l2-pix-fmt-pisp-comp2-rggb:
> +.. _v4l2-pix-fmt-pisp-comp2-grbg:
> +.. _v4l2-pix-fmt-pisp-comp2-gbrg:
> +.. _v4l2-pix-fmt-pisp-comp2-bggr:
> +.. _v4l2-pix-fmt-pisp-comp2-mono:
> +
> +================================================
> +Raspberry Pi PiSP compressed 8-bit Bayer formats
> +================================================
> +
> +Description
> +===========
> +
> +Raspberry Pi ISP uses a family of three fixed-rate compressed Bayer formats.

s/Raspberry Pi ISP/The Raspberry Pi ISP (PiSP)/

These very minor comments aside:
Reviewed-by: Naushir Patuck <naush@raspberrypi.com>

> +A black-level offset may be subtracted to improve compression efficiency;
> +the nominal black level and amount of offset must be signalled out of band.
> +Each scanline is padded to a multiple of 8 pixels wide, and each block of 8
> +horizontally-contiguous pixels is coded using 8 bytes.
> +
> +Mode 1 uses a quantization and delta-based coding scheme which preserves up to
> +12 significant bits. Mode 2 is a simple sqrt-like companding scheme with 6 PWL
> +chords, preserving up to 12 significant bits. Mode 3 combines both companding
> +(with 4 chords) and the delta scheme, preserving up to 14 significant bits.
> +
> +The remainder of this description applies to Modes 1 and 3.
> +
> +Each block of 8 pixels is separated into even and odd phases of 4 pixels,
> +coded independently by 32-bit words at successive locations in memory.
> +The two LS bits of each 32-bit word give its "quantization mode".
> +
> +In quantization mode 0, the lowest 321 quantization levels are multiples of
> +FSD/4096 and the remaining levels are successive multiples of FSD/2048.
> +Quantization modes 1 and 2 use linear quantization with step sizes of
> +FSD/1024 and FSD/512 respectively. Each of the four pixels is quantized
> +independently, with rounding to the nearest level.
> +In quantization mode 2 where the middle two samples have quantized values
> +(q1,q2) both in the range [384..511], they are coded using 9 bits for q1
> +followed by 7 bits for (q2 & 127). Otherwise, for quantization modes
> +0, 1 and 2: a 9-bit field encodes MIN(q1,q2) which must be in the range
> +[0..511] and a 7-bit field encodes (q2-q1+64) which must be in [0..127].
> +
> +Each of the outer samples (q0,q3) is encoded using a 7-bit field based
> +on its inner neighbour q1 or q2. In quantization mode 2 where the inner
> +sample has a quantized value in the range [448..511], the field value is
> +(q0-384). Otherwise for quantization modes 0, 1 and 2: The outer sample
> +is encoded as (q0-MAX(0,q1-64)). q3 is likewise coded based on q2.
> +Each of these values must be in the range [0..127]. All these fields
> +of 2, 9, 7, 7, 7 bits respectively are packed in little-endian order
> +to give a 32-bit word with LE byte order.
> +
> +Quantization mode 3 has a "7.5-bit" escape, used when none of the above
> +encodings will fit. Each pixel value is quantized to the nearest of 176
> +levels, where the lowest 48 levels are multiples of FSD/256 and the
> +remaining levels are multiples of FSD/512 (level 175 represents values
> +very close to FSD and may require saturating arithmetic to decode).
> +
> +Each pair of quantized pixels (q0,q1) or (q2,q3) is jointly coded
> +by a 15-bit field: 2816*(q0>>4) + 16*q1 + (q0&15).
> +Three fields of 2, 15, 15 bits are packed in LE order {15,15,2}.
> +
> +An implementation of a software decoder of compressed formats is available
> +in `Raspberry Pi camera applications code base
> +<https://github.com/raspberrypi/rpicam-apps/blob/main/image/dng.cpp>_`.
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 18e9aa1297e1..fc7af7337ab4 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1516,6 +1516,16 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>                 case V4L2_PIX_FMT_MT2110T:      descr = "Mediatek 10bit Tile Mode"; break;
>                 case V4L2_PIX_FMT_MT2110R:      descr = "Mediatek 10bit Raster Mode"; break;
>                 case V4L2_PIX_FMT_HEXTILE:      descr = "Hextile Compressed Format"; break;
> +               case V4L2_PIX_FMT_PISP_COMP1_RGGB: descr = "PiSP 8b RGRG/GBGB mode1 compr"; break;
> +               case V4L2_PIX_FMT_PISP_COMP1_GRBG: descr = "PiSP 8b GRGR/BGBG mode1 compr"; break;
> +               case V4L2_PIX_FMT_PISP_COMP1_GBRG: descr = "PiSP 8b GBGB/RGRG mode1 compr"; break;
> +               case V4L2_PIX_FMT_PISP_COMP1_BGGR: descr = "PiSP 8b BGBG/GRGR mode1 compr"; break;
> +               case V4L2_PIX_FMT_PISP_COMP1_MONO: descr = "PiSP 8b monochrome mode1 compr"; break;
> +               case V4L2_PIX_FMT_PISP_COMP2_RGGB: descr = "PiSP 8b RGRG/GBGB mode2 compr"; break;
> +               case V4L2_PIX_FMT_PISP_COMP2_GRBG: descr = "PiSP 8b GRGR/BGBG mode2 compr"; break;
> +               case V4L2_PIX_FMT_PISP_COMP2_GBRG: descr = "PiSP 8b GBGB/RGRG mode2 compr"; break;
> +               case V4L2_PIX_FMT_PISP_COMP2_BGGR: descr = "PiSP 8b BGBG/GRGR mode2 compr"; break;
> +               case V4L2_PIX_FMT_PISP_COMP2_MONO: descr = "PiSP 8b monochrome mode2 compr"; break;
>                 default:
>                         if (fmt->description[0])
>                                 return;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index c3daf61f43d5..feab8a153d2e 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -818,6 +818,18 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_IPU3_SGRBG10      v4l2_fourcc('i', 'p', '3', 'G') /* IPU3 packed 10-bit GRBG bayer */
>  #define V4L2_PIX_FMT_IPU3_SRGGB10      v4l2_fourcc('i', 'p', '3', 'r') /* IPU3 packed 10-bit RGGB bayer */
>
> +/* Raspberry Pi PiSP compressed formats. */
> +#define V4L2_PIX_FMT_PISP_COMP1_RGGB   v4l2_fourcc('P', 'C', '1', 'R') /* PiSP 8-bit mode 1 compressed RGGB bayer */
> +#define V4L2_PIX_FMT_PISP_COMP1_GRBG   v4l2_fourcc('P', 'C', '1', 'G') /* PiSP 8-bit mode 1 compressed GRBG bayer */
> +#define V4L2_PIX_FMT_PISP_COMP1_GBRG   v4l2_fourcc('P', 'C', '1', 'g') /* PiSP 8-bit mode 1 compressed GBRG bayer */
> +#define V4L2_PIX_FMT_PISP_COMP1_BGGR   v4l2_fourcc('P', 'C', '1', 'B') /* PiSP 8-bit mode 1 compressed BGGR bayer */
> +#define V4L2_PIX_FMT_PISP_COMP1_MONO   v4l2_fourcc('P', 'C', '1', 'M') /* PiSP 8-bit mode 1 compressed monochrome */
> +#define V4L2_PIX_FMT_PISP_COMP2_RGGB   v4l2_fourcc('P', 'C', '2', 'R') /* PiSP 8-bit mode 2 compressed RGGB bayer */
> +#define V4L2_PIX_FMT_PISP_COMP2_GRBG   v4l2_fourcc('P', 'C', '2', 'G') /* PiSP 8-bit mode 2 compressed GRBG bayer */
> +#define V4L2_PIX_FMT_PISP_COMP2_GBRG   v4l2_fourcc('P', 'C', '2', 'g') /* PiSP 8-bit mode 2 compressed GBRG bayer */
> +#define V4L2_PIX_FMT_PISP_COMP2_BGGR   v4l2_fourcc('P', 'C', '2', 'B') /* PiSP 8-bit mode 2 compressed BGGR bayer */
> +#define V4L2_PIX_FMT_PISP_COMP2_MONO   v4l2_fourcc('P', 'C', '2', 'M') /* PiSP 8-bit mode 2 compressed monochrome */
> +
>  /* SDR formats - used only for Software Defined Radio devices */
>  #define V4L2_SDR_FMT_CU8          v4l2_fourcc('C', 'U', '0', '8') /* IQ u8 */
>  #define V4L2_SDR_FMT_CU16LE       v4l2_fourcc('C', 'U', '1', '6') /* IQ u16le */
> --
> 2.43.2
>

