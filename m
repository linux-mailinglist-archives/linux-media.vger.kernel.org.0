Return-Path: <linux-media+bounces-41444-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 791E0B3E7FC
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 16:56:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D98241A84118
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 14:57:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15C25258CDF;
	Mon,  1 Sep 2025 14:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kSuOjyba"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81E830DEBE;
	Mon,  1 Sep 2025 14:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756738601; cv=none; b=ZD4gy8HCAQsEuchfjlfMNmBN5AN5yyL25//OwYv+ID7uRoQ95FEhCHNkmwKCUaDj0r1jPx+Utlak4GJwJ/uR9PPvZmxcgMIGcs0UKLV0pXJ7cSIn/xUq7vO3HBoOBWQsTOJn3bISD0PPj9s6MSTIZRHHuq7PwpnyQ5i6JHcCPYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756738601; c=relaxed/simple;
	bh=Q7vtAAS4pPrBwgb174S42nZs6J3IFkl9a4ExFnlCZwg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tjFI/S6pdvy+WCCjyI/Rbfj9x2NuW/zLuaV7nF7EYMkNsnaY70z7+sitQQOS3J3a27ZNO8pzdoQ8xj+FS1ibhpeUXhrF/VQldNM4MBl+qqYGgAFOELfrE/r3kzrMJun5sJqqvXlgFOAuI+X7vgWdOJNDMkhusOYq4kA3Yx4d7z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kSuOjyba; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45b869d35a0so12589115e9.1;
        Mon, 01 Sep 2025 07:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756738598; x=1757343398; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g1USGZjLZDxsf6DuJdOKwwC3PA6DI/XPMPASznB/+fs=;
        b=kSuOjyba2GVaWPw6tLy6FWzb7LZxMIBRX3obeOb1jvlUiu6H27rnEwdigwEhfJ7Mzp
         gonrEvnZXNr5HwP3Mvtdny6YplZej9jA8h7CqrfmAgYQkBme5vQeftuQE5q9x8Ctshik
         WgtqXCzw56YaUGzP0NS3eBTldx2KEEb9GnpsuYYqqLmFOWlEhFn+f4DrB6D2QlN2R+aB
         Ipu8RrVxYSBwx3en0YUUpqggE7ny/3Ci2MtRh1REb6MSCgHnvkvwUyEzYHBmcM0K7Yba
         RoElz3I8r4gi+q28gwXq4hA+cbWx2WD2Lp1a/hfkY8jagem27+EQc9DJYddqW62e7IHE
         SLww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756738598; x=1757343398;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g1USGZjLZDxsf6DuJdOKwwC3PA6DI/XPMPASznB/+fs=;
        b=vCtkgh3YVmWLWEG6uTnxi7IElKlfnsbc78Jp/Xory4tFXm3TzheAPXgXVCP798X42M
         b2aXTBEPLWZuJcIRlFU/XmDmgvbhUgU8tCOJfGpbk+86qNk4xBAvqkllVF+zt8m2nwpm
         JtzUKfCFL5OPb/P1rszcz/IDLcV90eH742+oElvv7XcbXzLRx9nn57r98Q+4WXqXIwWW
         HV6GsRS7Yp8N8bhGa1nu57brpXxIlpss5Y33eaGIK7PdkH5L+lq28j2vymk0lngYwzj8
         fODKmS5C7K5bkC3/XxGNblRvvU+CWnwttPH9rwJWRjWUxjHobMAXzV7YxkOJhlDX0d+9
         gh4w==
X-Forwarded-Encrypted: i=1; AJvYcCXXMXKLj7+38Lir2B2xsY0WyM5VxDneEB5NnwlVqNdaqwdy9/PxvrrtWAw844dwCDZXHpIg8jPxGBRwCE8=@vger.kernel.org, AJvYcCXzCoYSOSx/DjQB7mRL86tvZjJLMdHpwKisjosoGf/K4AiFq8MmPQZxIBtTR4SJwqRrtnzzbqXQJ7FtRTY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHmtPPaYFlbreCLDPjLtUN0wwrMy5L2QMRq8Q7qNTQrvPdYnw7
	OxxTkso+aoP1vG8qTY0D2Fy2dpVfdIqMIJPHEDibg2yGDY1bVuNFokouQMmU76YyJ377cVg01s9
	4B6NuuIN9LlMpBNYcmOB3CjMkOT5qo+M=
X-Gm-Gg: ASbGncvfH87d/aIptq2+cDBsuh/jxtVlyJhyZyUsa3kDJp/3H9qebu3g0Ho8fmhyNID
	87y9354XcEff1oZTe5kpiJTD6bgPE/+77A7TyOZbEhvX/oUVg0e6IHwbQeDHOi+Y2MgI+FDxLCU
	PLz3swNmTHQETn5HURJUIyIynXUq0LNH3Ttz12MEBqMvIu3Uu4TgUwmcUdkvdggB2oqcGN11hnb
	9rB20o=
X-Google-Smtp-Source: AGHT+IHK90Unn6qwA9knnbDmxsWr35H/JutAIfB4QBaEcXcrhMufG6E5PBhHvtXwzueHpCDrnO1EsJPWJskPIN8DZN8=
X-Received: by 2002:a05:600c:8b23:b0:45b:47e1:ef6c with SMTP id
 5b1f17b1804b1-45b855b2b0emr63168335e9.35.1756738597648; Mon, 01 Sep 2025
 07:56:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250829-rzv2h-cru-sizes-v2-1-cc5050ddb145@ideasonboard.com>
In-Reply-To: <20250829-rzv2h-cru-sizes-v2-1-cc5050ddb145@ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 1 Sep 2025 15:56:11 +0100
X-Gm-Features: Ac12FXyMShyDzcyRd-vi9KcD-sV_GXgPwGVXkEy6vz9NKnDRug5zBpPdt9kdijs
Message-ID: <CA+V-a8vKRJq1BLRCYv27yLi2SQ+EJt5Vmxdn-1+QHUoPWo7U=g@mail.gmail.com>
Subject: Re: [PATCH v2] media: rzg2l-cru: csi-2: Support RZ/V2H input sizes
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil <hverkuil@kernel.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Daniel Scally <dan.scally+renesas@ideasonboard.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 29, 2025 at 12:12=E2=80=AFPM Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
>
> From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
>
> The CRU version on the RZ/V2H SoC supports larger input sizes
> (4096x4096) compared to the version on the RZ/G2L (2800x4095).
>
> Store the per-SoC min/max sizes in the device match info and use them
> in place of the hardcoded ones.
>
> While at it, use the min sizes reported by the info structure to replace
> the RZG2L_CSI2_DEFAULT_WIDTH/HEIGHT macros.
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
> Changes in v2:
> - Use the size values in the rzg2l_csi2_info instea of going through
>   macros
> - Use min_width/min_height to initialize the format and drop
>   RZG2L_CSI2_DEFAULT_WIDTH/HEIGHT
> - Add Tommaso's tag
> - Link to v1: https://lore.kernel.org/r/20250826-rzv2h-cru-sizes-v1-1-dbd=
fc54bba11@ideasonboard.com
> ---
>  .../media/platform/renesas/rzg2l-cru/rzg2l-csi2.c  | 41 ++++++++++++++--=
------
>  1 file changed, 26 insertions(+), 15 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/driv=
ers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> index 1520211e74185fea3bca85f36239254f6b4651db..183598d6cf0b255f779b4398e=
027d626ad1f3c1b 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> @@ -96,13 +96,6 @@
>
>  #define VSRSTS_RETRIES                 20
>
> -#define RZG2L_CSI2_MIN_WIDTH           320
> -#define RZG2L_CSI2_MIN_HEIGHT          240
> -#define RZG2L_CSI2_MAX_WIDTH           2800
> -#define RZG2L_CSI2_MAX_HEIGHT          4095
> -
> -#define RZG2L_CSI2_DEFAULT_WIDTH       RZG2L_CSI2_MIN_WIDTH
> -#define RZG2L_CSI2_DEFAULT_HEIGHT      RZG2L_CSI2_MIN_HEIGHT
>  #define RZG2L_CSI2_DEFAULT_FMT         MEDIA_BUS_FMT_UYVY8_1X16
>
>  enum rzg2l_csi2_pads {
> @@ -137,6 +130,10 @@ struct rzg2l_csi2_info {
>         int (*dphy_enable)(struct rzg2l_csi2 *csi2);
>         int (*dphy_disable)(struct rzg2l_csi2 *csi2);
>         bool has_system_clk;
> +       unsigned int min_width;
> +       unsigned int min_height;
> +       unsigned int max_width;
> +       unsigned int max_height;
>  };
>
>  struct rzg2l_csi2_timings {
> @@ -418,6 +415,10 @@ static const struct rzg2l_csi2_info rzg2l_csi2_info =
=3D {
>         .dphy_enable =3D rzg2l_csi2_dphy_enable,
>         .dphy_disable =3D rzg2l_csi2_dphy_disable,
>         .has_system_clk =3D true,
> +       .min_width =3D 320,
> +       .min_height =3D 240,
> +       .max_width =3D 2800,
> +       .max_height =3D 4095,
>  };
>
>  static int rzg2l_csi2_dphy_setting(struct v4l2_subdev *sd, bool on)
> @@ -542,6 +543,10 @@ static const struct rzg2l_csi2_info rzv2h_csi2_info =
=3D {
>         .dphy_enable =3D rzv2h_csi2_dphy_enable,
>         .dphy_disable =3D rzv2h_csi2_dphy_disable,
>         .has_system_clk =3D false,
> +       .min_width =3D 320,
> +       .min_height =3D 240,
> +       .max_width =3D 4096,
> +       .max_height =3D 4096,
>  };
>
>  static int rzg2l_csi2_mipi_link_setting(struct v4l2_subdev *sd, bool on)
> @@ -631,6 +636,7 @@ static int rzg2l_csi2_set_format(struct v4l2_subdev *=
sd,
>                                  struct v4l2_subdev_state *state,
>                                  struct v4l2_subdev_format *fmt)
>  {
> +       struct rzg2l_csi2 *csi2 =3D sd_to_csi2(sd);
>         struct v4l2_mbus_framefmt *src_format;
>         struct v4l2_mbus_framefmt *sink_format;
>
> @@ -653,9 +659,11 @@ static int rzg2l_csi2_set_format(struct v4l2_subdev =
*sd,
>         sink_format->ycbcr_enc =3D fmt->format.ycbcr_enc;
>         sink_format->quantization =3D fmt->format.quantization;
>         sink_format->width =3D clamp_t(u32, fmt->format.width,
> -                                    RZG2L_CSI2_MIN_WIDTH, RZG2L_CSI2_MAX=
_WIDTH);
> +                                    csi2->info->min_width,
> +                                    csi2->info->max_width);
>         sink_format->height =3D clamp_t(u32, fmt->format.height,
> -                                     RZG2L_CSI2_MIN_HEIGHT, RZG2L_CSI2_M=
AX_HEIGHT);
> +                                    csi2->info->min_height,
> +                                    csi2->info->max_height);
>         fmt->format =3D *sink_format;
>
>         /* propagate format to source pad */
> @@ -668,9 +676,10 @@ static int rzg2l_csi2_init_state(struct v4l2_subdev =
*sd,
>                                  struct v4l2_subdev_state *sd_state)
>  {
>         struct v4l2_subdev_format fmt =3D { .pad =3D RZG2L_CSI2_SINK, };
> +       struct rzg2l_csi2 *csi2 =3D sd_to_csi2(sd);
>
> -       fmt.format.width =3D RZG2L_CSI2_DEFAULT_WIDTH;
> -       fmt.format.height =3D RZG2L_CSI2_DEFAULT_HEIGHT;
> +       fmt.format.width =3D csi2->info->min_width;
> +       fmt.format.height =3D csi2->info->min_height;
>         fmt.format.field =3D V4L2_FIELD_NONE;
>         fmt.format.code =3D RZG2L_CSI2_DEFAULT_FMT;
>         fmt.format.colorspace =3D V4L2_COLORSPACE_SRGB;
> @@ -697,16 +706,18 @@ static int rzg2l_csi2_enum_frame_size(struct v4l2_s=
ubdev *sd,
>                                       struct v4l2_subdev_state *sd_state,
>                                       struct v4l2_subdev_frame_size_enum =
*fse)
>  {
> +       struct rzg2l_csi2 *csi2 =3D sd_to_csi2(sd);
> +
>         if (fse->index !=3D 0)
>                 return -EINVAL;
>
>         if (!rzg2l_csi2_code_to_fmt(fse->code))
>                 return -EINVAL;
>
> -       fse->min_width =3D RZG2L_CSI2_MIN_WIDTH;
> -       fse->min_height =3D RZG2L_CSI2_MIN_HEIGHT;
> -       fse->max_width =3D RZG2L_CSI2_MAX_WIDTH;
> -       fse->max_height =3D RZG2L_CSI2_MAX_HEIGHT;
> +       fse->min_width =3D csi2->info->min_width;
> +       fse->min_height =3D csi2->info->min_height;
> +       fse->max_width =3D csi2->info->max_width;
> +       fse->max_height =3D csi2->info->max_height;
>
>         return 0;
>  }
>
> ---
> base-commit: 16428e2449ab96cce27be6ab17b750b404c76c7c
> change-id: 20250826-rzv2h-cru-sizes-371ff5a88081
>
> Best regards,
> --
> Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>
>

