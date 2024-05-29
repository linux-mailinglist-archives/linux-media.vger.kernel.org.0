Return-Path: <linux-media+bounces-12148-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A81BB8D333D
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 11:40:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF1F728A18C
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 09:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A77216A377;
	Wed, 29 May 2024 09:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Lk5ha5yW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70CA433CFC
	for <linux-media@vger.kernel.org>; Wed, 29 May 2024 09:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716975597; cv=none; b=rLZRi0gIvYKVhaBJy+FXQReD5V7IQJzyp18gRyshSrSxGW0FTlujB9cnNd7jKWhMHtpR3bC4XvW3soAuGbMP1aLSY+qNkqleNj3ZaHsBJnjJpkja6VUgTUzqBKgOdtffF/i7uxODb5d/QSc26vPdDikniORz/docaiUQROijJVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716975597; c=relaxed/simple;
	bh=JywtA6nACzRVSeMrwlt7frTXGeO11e5UeLNlmCfq0Nc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=drGL3KUof2vWQ8kGMLPe2bV9elRZC2+DaKk8ZBzKN6ggba5+RL1NYh4rPXDQC+9RfodW9UyO/zPPscRDXpMFPEJQPwEGLF2suYTYFv9D6yjqr2O52uVYf2OfO9W3hz6lC1gunPzo4l6QON7GBSxxg1Xt4+wzTvDf6Jb5UpfWZLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=Lk5ha5yW; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52b1ba74d39so387012e87.1
        for <linux-media@vger.kernel.org>; Wed, 29 May 2024 02:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1716975593; x=1717580393; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XegBjYT5RM9y6fuf3i7ryOt528bm712RwSXIUG+vwsw=;
        b=Lk5ha5yW1YJ8ZpSuQRHrRD0gXl+kuHEDaC/+IbeA3o1Pn6Z9u+SNyVq2i8iKhhZzMm
         G2TCaj/MNzKreoCOOcqJVTiX4qsg7q/xurg1M8ow7CfF5eAF/FUpE9fWGq8pMzEBDv6M
         A+sjje7MkamxfGc3dh5UgMVJuO5whX6G56PDdgoyC1YqpcN7ZobCj0w4hk4X0XIeqfjp
         AIw3fmIkTBAEu8XGiVeg+thqS/CR4rMB7XqpgqXZZFzxuoleh1D6/lTV7YjWdlrHAs50
         pAEWdMNV2bWZT2a/7I/TO39lo+BzsJDyyDsLGxqTjWpfXBxW7tTeRB1qOCGIn2RAvPL7
         7fsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716975593; x=1717580393;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XegBjYT5RM9y6fuf3i7ryOt528bm712RwSXIUG+vwsw=;
        b=RUftxLH2GSKmHvcv9u5n6DJataMVkHjFAcCdn+Oyf1YyTHQfU3ISNFZvy/ZxwS2T2d
         /U7t7PVvnEe+pnmBTySbcX7MCEZO8pLFtXrRXHBnYj4Fl50R6+RxDcmt3sBpFkSm0aNF
         Ku3TKSwO4kDV/VBvl5EVJmzqmHIPPf420/gSy6Y7Qz61J4UbJf3urgEK1/KJuS5BeKI9
         03akA7C4R8GlY2EextJ7wzzN7K0fS7UAWY4okxro8t9OHpWlVS56WVShyg9ekvqvJwKz
         UFCiMjXGdQK/JZke0nqU7grSBcZslvJvzR8ZTBjAZuZchFHZV/N9bMHEUF/Z57vE/zKW
         bg+A==
X-Gm-Message-State: AOJu0YwaYu9ZBgR7agGnynMXWYcjDEXZPevglrPIf+6dQETMVML7pPsE
	GuA/OqzOUaNLd77RA1Clp47GRp9nBAC0VlWroC5CARPKSqBhB06D0WP4QP5Ts3sDhPPTDXQpjx1
	V6SkSP29+PdLBshO3wwWiuOw91epW2WzU3XKx7w==
X-Google-Smtp-Source: AGHT+IGxqzKQPASL1ZFEOgMyDshzSzyu6PCnL7lRRx1BtdGH208qM6b5nV0VKPdFOqO1wgOEmpEvZ3Y8Xlq/PB54MZs=
X-Received: by 2002:a05:6512:3ca9:b0:529:b1ac:ccc9 with SMTP id
 2adb3069b0e04-529b1accd3dmr5960804e87.59.1716975593319; Wed, 29 May 2024
 02:39:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240528160407.304178-1-jacopo.mondi@ideasonboard.com> <20240528160407.304178-6-jacopo.mondi@ideasonboard.com>
In-Reply-To: <20240528160407.304178-6-jacopo.mondi@ideasonboard.com>
From: Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>
Date: Wed, 29 May 2024 10:39:40 +0100
Message-ID: <CAPhyPA62ftSUVFsjzUawbp_oK41+uOL+Twfh7W5QZAvu0eDhyQ@mail.gmail.com>
Subject: Re: [PATCH v8 5/8] media: uapi: Add PiSP Compressed RAW Bayer formats
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>, 
	David Plowman <david.plowman@raspberrypi.com>, Naushir Patuck <naush@raspberrypi.com>, 
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Sakari Ailus <sakari.ailus@iki.fi>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

I have just spotted an error here (the error is mine - sorry).

On Tue, 28 May 2024 at 17:04, Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
>
> Add Raspberry Pi compressed RAW Bayer formats.
>
> The compression algorithm description is provided by Nick Hollinghurst
> <nick.hollinghurst@raspberrypi.com> from Raspberry Pi.
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Reviewed-by: Naushir Patuck <naush@raspberrypi.com>
> ---
>  .../userspace-api/media/v4l/pixfmt-bayer.rst  |  1 +
>  .../media/v4l/pixfmt-srggb8-pisp-comp.rst     | 74 +++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-ioctl.c          | 10 +++
>  include/uapi/linux/videodev2.h                | 12 +++
>  4 files changed, 97 insertions(+)
>  create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-srggb8-p=
isp-comp.rst
>
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst b/Doc=
umentation/userspace-api/media/v4l/pixfmt-bayer.rst
> index 2500413e5f43..ed3eb432967d 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
> @@ -20,6 +20,7 @@ orders. See also `the Wikipedia article on Bayer filter
>      :maxdepth: 1
>
>      pixfmt-srggb8
> +    pixfmt-srggb8-pisp-comp
>      pixfmt-srggb10
>      pixfmt-srggb10p
>      pixfmt-srggb10alaw8
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-srggb8-pisp-com=
p.rst b/Documentation/userspace-api/media/v4l/pixfmt-srggb8-pisp-comp.rst
> new file mode 100644
> index 000000000000..ff0fbcf34258
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-srggb8-pisp-comp.rst
> @@ -0,0 +1,74 @@
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
> +************************************************************************=
***************************************************************************=
***************************************************************************=
***************************************************************************=
***************************************************************************=
**************
> +V4L2_PIX_FMT_PISP_COMP1_RGGB ('PC1R'), V4L2_PIX_FMT_PISP_COMP1_GRBG ('PC=
1G'), V4L2_PIX_FMT_PISP_COMP1_GBRG ('PC1g'), V4L2_PIX_FMT_PISP_COMP1_BGGR (=
'PC1B), V4L2_PIX_FMT_PISP_COMP1_MONO ('PC1M'), V4L2_PIX_FMT_PISP_COMP2_RGGB=
 ('PC2R'), V4L2_PIX_FMT_PISP_COMP2_GRBG ('PC2G'), V4L2_PIX_FMT_PISP_COMP2_G=
BRG ('PC2g'), V4L2_PIX_FMT_PISP_COMP2_BGGR ('PC2B), V4L2_PIX_FMT_PISP_COMP2=
_MONO ('PC2M')
> +************************************************************************=
***************************************************************************=
***************************************************************************=
***************************************************************************=
***************************************************************************=
**************
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Raspberry Pi PiSP compressed 8-bit Bayer formats
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Description
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The Raspberry Pi ISP (PiSP) uses a family of three fixed-rate compressed=
 Bayer
> +formats. A black-level offset may be subtracted to improve compression
> +efficiency; the nominal black level and amount of offset must be signall=
ed out
> +of band. Each scanline is padded to a multiple of 8 pixels wide, and eac=
h block
> +of 8 horizontally-contiguous pixels is coded using 8 bytes.
> +
> +Mode 1 uses a quantization and delta-based coding scheme which preserves=
 up to
> +12 significant bits. Mode 2 is a simple sqrt-like companding scheme with=
 6 PWL
> +chords, preserving up to 12 significant bits. Mode 3 combines both compa=
nding
> +(with 4 chords) and the delta scheme, preserving up to 14 significant bi=
ts.
> +
> +The remainder of this description applies to Modes 1 and 3.
> +
> +Each block of 8 pixels is separated into even and odd phases of 4 pixels=
,
> +coded independently by 32-bit words at successive locations in memory.
> +The two LS bits of each 32-bit word give its "quantization mode".
> +
> +In quantization mode 0, the lowest 321 quantization levels are multiples=
 of
> +FSD/4096 and the remaining levels are successive multiples of FSD/2048.
> +Quantization modes 1 and 2 use linear quantization with step sizes of
> +FSD/1024 and FSD/512 respectively. Each of the four pixels is quantized
> +independently, with rounding to the nearest level.
> +In quantization mode 2 where the middle two samples have quantized value=
s
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

Here I must have confused the step size with the fraction, writing FSD/512
when I meant FSD/128. I also managed to mix up a constant used in the
encoder (47+1) with a number of steps (94+1).
What I should have written is:

+levels, where the lowest 95 levels are multiples of FSD/256 and the
+remaining levels are multiples of FSD/128 (level 175 represents values
+very close to FSD and may require saturating arithmetic to decode).

 Nick


> +
> +Each pair of quantized pixels (q0,q1) or (q2,q3) is jointly coded
> +by a 15-bit field: 2816*(q0>>4) + 16*q1 + (q0&15).
> +Three fields of 2, 15, 15 bits are packed in LE order {15,15,2}.
> +
> +An implementation of a software decoder of compressed formats is availab=
le
> +in `Raspberry Pi camera applications code base
> +<https://github.com/raspberrypi/rpicam-apps/blob/main/image/dng.cpp>`_.
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-co=
re/v4l2-ioctl.c
> index 7c684788997c..5eb4d797d259 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1532,6 +1532,16 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *=
fmt)
>                 case V4L2_PIX_FMT_MT2110T:      descr =3D "Mediatek 10bit=
 Tile Mode"; break;
>                 case V4L2_PIX_FMT_MT2110R:      descr =3D "Mediatek 10bit=
 Raster Mode"; break;
>                 case V4L2_PIX_FMT_HEXTILE:      descr =3D "Hextile Compre=
ssed Format"; break;
> +               case V4L2_PIX_FMT_PISP_COMP1_RGGB: descr =3D "PiSP 8b RGR=
G/GBGB mode1 compr"; break;
> +               case V4L2_PIX_FMT_PISP_COMP1_GRBG: descr =3D "PiSP 8b GRG=
R/BGBG mode1 compr"; break;
> +               case V4L2_PIX_FMT_PISP_COMP1_GBRG: descr =3D "PiSP 8b GBG=
B/RGRG mode1 compr"; break;
> +               case V4L2_PIX_FMT_PISP_COMP1_BGGR: descr =3D "PiSP 8b BGB=
G/GRGR mode1 compr"; break;
> +               case V4L2_PIX_FMT_PISP_COMP1_MONO: descr =3D "PiSP 8b mon=
ochrome mode1 compr"; break;
> +               case V4L2_PIX_FMT_PISP_COMP2_RGGB: descr =3D "PiSP 8b RGR=
G/GBGB mode2 compr"; break;
> +               case V4L2_PIX_FMT_PISP_COMP2_GRBG: descr =3D "PiSP 8b GRG=
R/BGBG mode2 compr"; break;
> +               case V4L2_PIX_FMT_PISP_COMP2_GBRG: descr =3D "PiSP 8b GBG=
B/RGRG mode2 compr"; break;
> +               case V4L2_PIX_FMT_PISP_COMP2_BGGR: descr =3D "PiSP 8b BGB=
G/GRGR mode2 compr"; break;
> +               case V4L2_PIX_FMT_PISP_COMP2_MONO: descr =3D "PiSP 8b mon=
ochrome mode2 compr"; break;
>                 default:
>                         if (fmt->description[0])
>                                 return;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev=
2.h
> index 96fc0456081e..4e91362da6da 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -816,6 +816,18 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_IPU3_SGRBG10      v4l2_fourcc('i', 'p', '3', 'G') /=
* IPU3 packed 10-bit GRBG bayer */
>  #define V4L2_PIX_FMT_IPU3_SRGGB10      v4l2_fourcc('i', 'p', '3', 'r') /=
* IPU3 packed 10-bit RGGB bayer */
>
> +/* Raspberry Pi PiSP compressed formats. */
> +#define V4L2_PIX_FMT_PISP_COMP1_RGGB   v4l2_fourcc('P', 'C', '1', 'R') /=
* PiSP 8-bit mode 1 compressed RGGB bayer */
> +#define V4L2_PIX_FMT_PISP_COMP1_GRBG   v4l2_fourcc('P', 'C', '1', 'G') /=
* PiSP 8-bit mode 1 compressed GRBG bayer */
> +#define V4L2_PIX_FMT_PISP_COMP1_GBRG   v4l2_fourcc('P', 'C', '1', 'g') /=
* PiSP 8-bit mode 1 compressed GBRG bayer */
> +#define V4L2_PIX_FMT_PISP_COMP1_BGGR   v4l2_fourcc('P', 'C', '1', 'B') /=
* PiSP 8-bit mode 1 compressed BGGR bayer */
> +#define V4L2_PIX_FMT_PISP_COMP1_MONO   v4l2_fourcc('P', 'C', '1', 'M') /=
* PiSP 8-bit mode 1 compressed monochrome */
> +#define V4L2_PIX_FMT_PISP_COMP2_RGGB   v4l2_fourcc('P', 'C', '2', 'R') /=
* PiSP 8-bit mode 2 compressed RGGB bayer */
> +#define V4L2_PIX_FMT_PISP_COMP2_GRBG   v4l2_fourcc('P', 'C', '2', 'G') /=
* PiSP 8-bit mode 2 compressed GRBG bayer */
> +#define V4L2_PIX_FMT_PISP_COMP2_GBRG   v4l2_fourcc('P', 'C', '2', 'g') /=
* PiSP 8-bit mode 2 compressed GBRG bayer */
> +#define V4L2_PIX_FMT_PISP_COMP2_BGGR   v4l2_fourcc('P', 'C', '2', 'B') /=
* PiSP 8-bit mode 2 compressed BGGR bayer */
> +#define V4L2_PIX_FMT_PISP_COMP2_MONO   v4l2_fourcc('P', 'C', '2', 'M') /=
* PiSP 8-bit mode 2 compressed monochrome */
> +
>  /* SDR formats - used only for Software Defined Radio devices */
>  #define V4L2_SDR_FMT_CU8          v4l2_fourcc('C', 'U', '0', '8') /* IQ =
u8 */
>  #define V4L2_SDR_FMT_CU16LE       v4l2_fourcc('C', 'U', '1', '6') /* IQ =
u16le */
> --
> 2.45.1

