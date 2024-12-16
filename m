Return-Path: <linux-media+bounces-23475-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8921A9F315F
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 14:19:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 407A21884A77
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 13:19:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15707204684;
	Mon, 16 Dec 2024 13:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dvI4SQfx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87E229CA
	for <linux-media@vger.kernel.org>; Mon, 16 Dec 2024 13:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734355142; cv=none; b=LIsuzUGd5+udP0JbmTS6W6hQQ/+h9JJMtEDboICu9RzuxLKtcd4gi6LOWfimz88jYu/giVWsjKpk6PVDMklZ9IHRD2dr//JBNzSOmO/mcenaWsNmm2uS1UtDF5g3hEEcmB+Tt+LwVR4UJVCcS5se86RtmbT+PbXRd0rSVVQNFi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734355142; c=relaxed/simple;
	bh=Naa1r21cfTLvjx79DlwjxB9uDSfm8RzcWV4LpDoOI5M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=snX0cnJvXjjRbnXWbwOT1BQfQHhlFavJgTNMZsRLhwt9BBnXb6HhYDojSqlv5pP2RgrPAKrWpY9K43g8HMQfhz+cYY/sS6T7+wyqwiTomKTKySQJ0x9/GM9sKb8S1/GpjtTCfbYxoE2LJntjqR+DKoMqN0FK/AY8fC+uO8CcM+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dvI4SQfx; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5160f80e652so1010595e0c.2
        for <linux-media@vger.kernel.org>; Mon, 16 Dec 2024 05:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734355140; x=1734959940; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cylkGV/s33oM5Bw9YjhiSXcno3L8oN+1RPe1Nh/jKAE=;
        b=dvI4SQfxyNlzQF+VAQwfmU5xYHURPUrxHgGMj9ltccHbcnTqxkFDr2meoF4s8xNt3p
         NgCdUoGuK4+dikx8okBDpttCPB65rdE/jlhDFRJ8IPge9EMKbk77qUFGvbtjsJ5NCqAr
         KqjgewPIE4XDCFoNVG1rGcLDGVWFKy+yDUakz4E2Etc0cxNDyOKoiQGMQ0iNd7KWjW7H
         Rktm6IeipHuKQH30RpwGAkXJdYwsh0B+g758N31CMnSOyBgI30jC59nEPuh3MHf58wNA
         R/QpQGjbrJot+gdzsJoheVn2mAKz4GHqm/cHEnK5At7TosTKxpiStEkLtdUMQNZBcWa9
         6iSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734355140; x=1734959940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cylkGV/s33oM5Bw9YjhiSXcno3L8oN+1RPe1Nh/jKAE=;
        b=OJAUN4YE0JeGFpCNvWLfu291MIxdK+DaFjV+JL0S+GxpJpSyRbdXbiGgFyzupt8qX2
         CFUUuJXgb9RDSM81nxVXmPYBdH0t2/VzvGGqlxcGrSPQC6CQVE1DRyLCkrm8JkhXqwbJ
         CzELt6rp7HicGzMkfi9jPBvVMW49XROpZxPRYfE6d9oO5UJW0www83ZXF5LNKOSckYfE
         JFVUJ0O3dIopl/TC+xpXcFBeApNUVcQ3Un2Rykzouh2zstVvM+yG5zDGzxYR8S/H9k+1
         yZcQIpzuJhLaKUUAJs8acMStM6IBEJ9Kr6/HF7Y973rrweZQ7hPRb8nZcWV4ELximBmN
         HWMw==
X-Gm-Message-State: AOJu0YzkKvjcsnhX/XG1g0l8UAizAFHyo4XvLNMRl99PkOBjrvNjHvoD
	0Ovd2q4WG20iVEyXZcFsUiWcgh/MquPUFDyw1t2RV9TJolejFMNyB2D0pByULtZEJjtUO+JJ9MI
	bjLvBy6c8dx7uc7AikK/vZ8ScHDM=
X-Gm-Gg: ASbGncuVsj+ntYggjk1rw0GLz8RhfDT4CPrwJowzQEh+xWobfDzEEnv7KURviqSkP0I
	C+MxiZ0QwF7SR6etzdp+tbhjlktXb2odzbjVP4A==
X-Google-Smtp-Source: AGHT+IGZmVJZwMHF2m/AKdIV9Vw0tEYdHD7rcO+YS+03hAkL72ia5nZGrVk9mgYqIj2U/eYH1SV3M668/jSoAPonGYQ=
X-Received: by 2002:a05:6122:1d4a:b0:518:92c8:9426 with SMTP id
 71dfb90a1353d-518ca30a6f8mr9458317e0c.9.1734355139580; Mon, 16 Dec 2024
 05:18:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241202145831.127297-1-dan.scally@ideasonboard.com> <20241202145831.127297-5-dan.scally@ideasonboard.com>
In-Reply-To: <20241202145831.127297-5-dan.scally@ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 16 Dec 2024 13:18:33 +0000
Message-ID: <CA+V-a8sVVes+6gf-iEA=hpdqVsmORCDkR9UHBwiA-OW45h=JOg@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] media: rzg2l-cru: Support multiple mbus codes per
 pixel format
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl, 
	sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, jacopo.mondi@ideasonboard.com, 
	isaac.scott@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 2, 2024 at 3:51=E2=80=AFPM Daniel Scally
<dan.scally@ideasonboard.com> wrote:
>
> As a preliminary step for supporting the CRU pixel formats, extend
> the driver such that multiple media bus codes can support each of
> the output pixel formats.
>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
> Changes in v3:
>
>         - New patch due to changes to patch 1
>
>  .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  8 ++-
>  .../platform/renesas/rzg2l-cru/rzg2l-ip.c     | 67 +++++++++++++++----
>  .../platform/renesas/rzg2l-cru/rzg2l-video.c  |  2 +-
>  3 files changed, 61 insertions(+), 16 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drive=
rs/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> index aaf85054f8842..ab923bfa3becf 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> @@ -71,7 +71,11 @@ struct rzg2l_cru_ip {
>   * @yuv: Flag to indicate whether the format is YUV-based.
>   */
>  struct rzg2l_cru_ip_format {
> -       u32 code;
> +       /*
> +        * RAW output formats might be produced by RAW media codes with a=
ny one
> +        * of the 4 common bayer patterns.
> +        */
> +       u32 codes[4];
>         u32 datatype;
>         u32 format;
>         u32 icndmr;
> @@ -169,5 +173,7 @@ struct v4l2_mbus_framefmt *rzg2l_cru_ip_get_src_fmt(s=
truct rzg2l_cru_dev *cru);
>  const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int =
code);
>  const struct rzg2l_cru_ip_format *rzg2l_cru_ip_format_to_fmt(u32 format)=
;
>  const struct rzg2l_cru_ip_format *rzg2l_cru_ip_index_to_fmt(u32 index);
> +bool rzg2l_cru_ip_fmt_supports_mbus_code(const struct rzg2l_cru_ip_forma=
t *fmt,
> +                                        unsigned int code);
>
>  #endif
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/driver=
s/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> index 399a337dbafbf..54a79d5c13e10 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> @@ -13,35 +13,45 @@
>
>  static const struct rzg2l_cru_ip_format rzg2l_cru_ip_formats[] =3D {
>         {
> -               .code =3D MEDIA_BUS_FMT_UYVY8_1X16,
> +               .codes =3D {
> +                       MEDIA_BUS_FMT_UYVY8_1X16,
> +               },
>                 .datatype =3D MIPI_CSI2_DT_YUV422_8B,
>                 .format =3D V4L2_PIX_FMT_UYVY,
>                 .icndmr =3D ICnDMR_YCMODE_UYVY,
>                 .yuv =3D true,
>         },
>         {
> -               .code =3D MEDIA_BUS_FMT_SBGGR8_1X8,
> +               .codes =3D {
> +                       MEDIA_BUS_FMT_SBGGR8_1X8,
> +               },
>                 .format =3D V4L2_PIX_FMT_SBGGR8,
>                 .datatype =3D MIPI_CSI2_DT_RAW8,
>                 .icndmr =3D 0,
>                 .yuv =3D false,
>         },
>         {
> -               .code =3D MEDIA_BUS_FMT_SGBRG8_1X8,
> +               .codes =3D {
> +                       MEDIA_BUS_FMT_SGBRG8_1X8,
> +               },
>                 .format =3D V4L2_PIX_FMT_SGBRG8,
>                 .datatype =3D MIPI_CSI2_DT_RAW8,
>                 .icndmr =3D 0,
>                 .yuv =3D false,
>         },
>         {
> -               .code =3D MEDIA_BUS_FMT_SGRBG8_1X8,
> +               .codes =3D {
> +                       MEDIA_BUS_FMT_SGRBG8_1X8,
> +               },
>                 .format =3D V4L2_PIX_FMT_SGRBG8,
>                 .datatype =3D MIPI_CSI2_DT_RAW8,
>                 .icndmr =3D 0,
>                 .yuv =3D false,
>         },
>         {
> -               .code =3D MEDIA_BUS_FMT_SRGGB8_1X8,
> +               .codes =3D {
> +                       MEDIA_BUS_FMT_SRGGB8_1X8,
> +               },
>                 .format =3D V4L2_PIX_FMT_SRGGB8,
>                 .datatype =3D MIPI_CSI2_DT_RAW8,
>                 .icndmr =3D 0,
> @@ -51,11 +61,14 @@ static const struct rzg2l_cru_ip_format rzg2l_cru_ip_=
formats[] =3D {
>
>  const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int =
code)
>  {
> -       unsigned int i;
> +       unsigned int i, j;
>
> -       for (i =3D 0; i < ARRAY_SIZE(rzg2l_cru_ip_formats); i++)
> -               if (rzg2l_cru_ip_formats[i].code =3D=3D code)
> -                       return &rzg2l_cru_ip_formats[i];
> +       for (i =3D 0; i < ARRAY_SIZE(rzg2l_cru_ip_formats); i++) {
> +               for (j =3D 0; j < ARRAY_SIZE(rzg2l_cru_ip_formats[i].code=
s); j++) {
> +                       if (rzg2l_cru_ip_formats[i].codes[j] =3D=3D code)
> +                               return &rzg2l_cru_ip_formats[i];
> +               }
> +       }
>
>         return NULL;
>  }
> @@ -80,6 +93,17 @@ const struct rzg2l_cru_ip_format *rzg2l_cru_ip_index_t=
o_fmt(u32 index)
>         return &rzg2l_cru_ip_formats[index];
>  }
>
> +bool rzg2l_cru_ip_fmt_supports_mbus_code(const struct rzg2l_cru_ip_forma=
t *fmt,
> +                                        unsigned int code)
> +{
> +       unsigned int i;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(fmt->codes); i++)
> +               if (fmt->codes[i] =3D=3D code)
> +                       return true;
> +
> +       return false;
> +}
>  struct v4l2_mbus_framefmt *rzg2l_cru_ip_get_src_fmt(struct rzg2l_cru_dev=
 *cru)
>  {
>         struct v4l2_subdev_state *state;
> @@ -155,7 +179,7 @@ static int rzg2l_cru_ip_set_format(struct v4l2_subdev=
 *sd,
>         sink_format =3D v4l2_subdev_state_get_format(state, fmt->pad);
>
>         if (!rzg2l_cru_ip_code_to_fmt(fmt->format.code))
> -               sink_format->code =3D rzg2l_cru_ip_formats[0].code;
> +               sink_format->code =3D rzg2l_cru_ip_formats[0].codes[0];
>         else
>                 sink_format->code =3D fmt->format.code;
>
> @@ -181,11 +205,26 @@ static int rzg2l_cru_ip_enum_mbus_code(struct v4l2_=
subdev *sd,
>                                        struct v4l2_subdev_state *state,
>                                        struct v4l2_subdev_mbus_code_enum =
*code)
>  {
> -       if (code->index >=3D ARRAY_SIZE(rzg2l_cru_ip_formats))
> -               return -EINVAL;
> +       unsigned int index =3D code->index;
> +       unsigned int i, j;
>
> -       code->code =3D rzg2l_cru_ip_formats[code->index].code;
> -       return 0;
> +       for (i =3D 0; i < ARRAY_SIZE(rzg2l_cru_ip_formats); i++) {
> +               const struct rzg2l_cru_ip_format *fmt =3D &rzg2l_cru_ip_f=
ormats[i];
> +
> +               for (j =3D 0; j < ARRAY_SIZE(fmt->codes); j++) {
> +                       if (!fmt->codes[j])
> +                               continue;
> +
> +                       if (!index) {
> +                               code->code =3D fmt->codes[j];
> +                               return 0;
> +                       }
> +
> +                       index--;
> +               }
> +       }
> +
> +       return -EINVAL;
>  }
>
>  static int rzg2l_cru_ip_enum_frame_size(struct v4l2_subdev *sd,
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/dri=
vers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 028b390488c84..57d1ff45ce1e9 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -891,7 +891,7 @@ static int rzg2l_cru_video_link_validate(struct media=
_link *link)
>         if (fmt.format.width !=3D cru->format.width ||
>             fmt.format.height !=3D cru->format.height ||
>             fmt.format.field !=3D cru->format.field ||
> -           video_fmt->code !=3D fmt.format.code)
> +           !rzg2l_cru_ip_fmt_supports_mbus_code(video_fmt, fmt.format.co=
de))
>                 return -EPIPE;
>
>         return 0;
> --
> 2.34.1
>
>

