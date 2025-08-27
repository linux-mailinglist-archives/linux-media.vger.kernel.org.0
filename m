Return-Path: <linux-media+bounces-41208-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2250AB38D81
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 00:15:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E6DF464EE2
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 22:14:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4829315793;
	Wed, 27 Aug 2025 22:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iugXPN0O"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8E831578F;
	Wed, 27 Aug 2025 22:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756332524; cv=none; b=A9NkZBRukhMxy2+5Mp29N7VM+y5QfeaEeOo1mSShuGg9KHXG9cbDhWapxcdLMG8/aCrG46b3Oc3HogacRj+8UWxt5gSnuNalVtiSV4tBFU794zDm+7cLmumHEwt2Xcyy6Hq4WIfXNsNRRYuvF+X18ljMtHExD4AMoYRanXXFqIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756332524; c=relaxed/simple;
	bh=q1no6700hSm+r3y2ZzQhTNjhasSRnDPnqRS3By0gMPk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AQWS66gpEA3c1VyHKRGIyYXZn6KY1MNNND9TQqjDMhvOrqzYRQRuE6GPGiTrHSn87lWbnWkM4YOVvzmQe8NVbELbkFoDXnXlvt+rYdJXLphlBS3Q2pny30E4um4jlbzIUgu0EvlSYggOdq1yRVLCuPCx7izK4jPFdkh1IvdWoog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iugXPN0O; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45a1b04f8b5so1585945e9.1;
        Wed, 27 Aug 2025 15:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756332521; x=1756937321; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rl4uR1undi2hLndggsDMeomTcONpI+N6b9vCtXfnWlA=;
        b=iugXPN0OtXh/UH7njHPnUeKcmoIT/W2XHNtu6bWRYZc0WHwWTdZxhBdoSO3CoT8k/W
         UliFNx1m9L/rfgsmBfyXFLm4t0+HZWtSa+PPND3upd5ytJAcPAZ4rg6BGqOqxj9h9s6S
         vorkR5S/bDagaQtMDF11iOfTi/pD4eBHbN/j2AaMlqESFxFjoKo4CdIKvlDyjPTWVVHY
         9BUAcLjBzMCA6FgoUJzZryPo4H/in0Q5N84ZE7cDojKEcpY939r1iZNTwVlGwKi6m7rC
         UrDSPHD1sOtd9JFTB9S20n0z74jbbEDKBso9gbnED7BKCnVJKZwo/V66FMritEdYJ5NY
         VCiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756332521; x=1756937321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rl4uR1undi2hLndggsDMeomTcONpI+N6b9vCtXfnWlA=;
        b=n99vt69YXIKIBg8yw+oAuUcB34sCaZBMUqcDmvglZfIvVIkstkyXsK/NTiQMElA2DS
         XJLes93pnBNlbBFKBoAskQf0C/kx3a+fUNtfh5gVvBbcWvQyaAonmtAWLaws0x6R7RQZ
         FEFxx5L8aTdpfwRtySikGQr+q8dcEa9tJXIbRvpoLYVDZGsOCGUskHVePqpjA4ZDbriF
         nov1qFEzDpFZjksChsMEbKkeTwkABmZVCJTfWI7RmQkHI08m+fl5d8SkpdueH+CSywc4
         YrJDf2V3IRzR5rtyjTomYOMfINgNcDVUadN4sGcl4FvnuKWfosrvV4uOJ8nc8QNqmG/9
         WTOA==
X-Forwarded-Encrypted: i=1; AJvYcCVlR6sco2VDEN4xhqEdDB9lr9HsejP3/tnI/UfMhZOVUnrjApGANQ0D6e8jAyvWS0EBkCWW//ke64IrRbY=@vger.kernel.org, AJvYcCWWZqpooY43IrrBViOlzWFy3xi/rtFQekto/Hr589oHBAh81qWDSFdDCZYauOlOf+Mo+gpEW6uNzvMidQA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyMerr+0FvPeKgKyX5N8KPlYqJMOQM2hYw1WgjhQNiGEY/REz2
	THgGFm1jaE3dK9N9wTdzD38jx27KzH6cP6NgwbI0dICn5fr4pGTtcNWy6lTpr9GG8tBfVfcKi72
	GgFNI+hixiT7zG/AQW4UVg8ZUv3x/s9B6uUVI8Tc=
X-Gm-Gg: ASbGncsVYyU9mNUw0BTHcglVV6uSkmwMXfnkFZRzGdjQUFNHE3JuVX4Ou+wDFat73SG
	zRSGpGqmLqDwnZpIx0Kn/5+SODleft6Ib2VUCMBeULxcysus3oQe/bX7xtBNDDGb5A8ioYsv3kC
	WekN0dOPYhvkJWSh6kUvKZ1aZgPEgh3ZfmhFhlinStYz9DSfJHqklBoEFKKndEKxgGOzyC6LSmz
	mq6w5w1da5kQbW04KM=
X-Google-Smtp-Source: AGHT+IHjHPjGGyZmdxxy9zsVU1+WBfGSaYVs5LzepEAwe+vQXYHvA2UfJ0GV3dP8c3UvsvGDhNMX/rmBLexSRfEQayA=
X-Received: by 2002:a5d:5f42:0:b0:3c7:ac80:6938 with SMTP id
 ffacd0b85a97d-3c7ac8fbe53mr11897903f8f.27.1756332520540; Wed, 27 Aug 2025
 15:08:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250826-rzv2h-cru-sizes-v1-1-dbdfc54bba11@ideasonboard.com>
In-Reply-To: <20250826-rzv2h-cru-sizes-v1-1-dbdfc54bba11@ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 27 Aug 2025 23:08:14 +0100
X-Gm-Features: Ac12FXzHW0W80QiEkk_RbotfUxLgokkWN7UqPtPj3VdHgBx3UQZLkmIJUNj-M3k
Message-ID: <CA+V-a8t+XXNBU2GtRmAD+QJnARcSiR13j=_hPNRc=Pw=p1QNzQ@mail.gmail.com>
Subject: Re: [PATCH] media: rzg2l-cru: csi-2: Support RZ/V2H input sizes
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

Hi Jacopo,

Thank you for the patch.

On Tue, Aug 26, 2025 at 11:59=E2=80=AFAM Jacopo Mondi
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
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> ---
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  .../media/platform/renesas/rzg2l-cru/rzg2l-csi2.c  | 34 ++++++++++++++++=
++----
>  1 file changed, 28 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/driv=
ers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> index 1520211e74185fea3bca85f36239254f6b4651db..96d17ae0048f9d88aa73bec91=
6365f3dbc421882 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> @@ -101,6 +101,11 @@
>  #define RZG2L_CSI2_MAX_WIDTH           2800
>  #define RZG2L_CSI2_MAX_HEIGHT          4095
>
> +#define RZV2H_CSI2_MIN_WIDTH           320
> +#define RZV2H_CSI2_MIN_HEIGHT          240
> +#define RZV2H_CSI2_MAX_WIDTH           4096
> +#define RZV2H_CSI2_MAX_HEIGHT          4096
> +
The changes LGTM. I'd prefer you to drop these macros and just use
plain numbers in the rzv2h_csi2_info/rzg2l_csi2_info.

Additionally we could also drop the
RZG2L_CSI2_DEFAULT_WIDTH/RZG2L_CSI2_DEFAULT_HEIGHT macros too and use
csi2->info->min_height/csi2->info->min_width in
rzg2l_csi2_init_state().

Cheers,
Prabhakar

>  #define RZG2L_CSI2_DEFAULT_WIDTH       RZG2L_CSI2_MIN_WIDTH
>  #define RZG2L_CSI2_DEFAULT_HEIGHT      RZG2L_CSI2_MIN_HEIGHT
>  #define RZG2L_CSI2_DEFAULT_FMT         MEDIA_BUS_FMT_UYVY8_1X16
> @@ -137,6 +142,10 @@ struct rzg2l_csi2_info {
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
> @@ -418,6 +427,10 @@ static const struct rzg2l_csi2_info rzg2l_csi2_info =
=3D {
>         .dphy_enable =3D rzg2l_csi2_dphy_enable,
>         .dphy_disable =3D rzg2l_csi2_dphy_disable,
>         .has_system_clk =3D true,
> +       .min_width =3D RZG2L_CSI2_MIN_WIDTH,
> +       .min_height =3D RZG2L_CSI2_MIN_HEIGHT,
> +       .max_width =3D RZG2L_CSI2_MAX_WIDTH,
> +       .max_height =3D RZG2L_CSI2_MAX_HEIGHT,
>  };
>
>  static int rzg2l_csi2_dphy_setting(struct v4l2_subdev *sd, bool on)
> @@ -542,6 +555,10 @@ static const struct rzg2l_csi2_info rzv2h_csi2_info =
=3D {
>         .dphy_enable =3D rzv2h_csi2_dphy_enable,
>         .dphy_disable =3D rzv2h_csi2_dphy_disable,
>         .has_system_clk =3D false,
> +       .min_width =3D RZV2H_CSI2_MIN_WIDTH,
> +       .min_height =3D RZV2H_CSI2_MIN_HEIGHT,
> +       .max_width =3D RZV2H_CSI2_MAX_WIDTH,
> +       .max_height =3D RZV2H_CSI2_MAX_HEIGHT,
>  };
>
>  static int rzg2l_csi2_mipi_link_setting(struct v4l2_subdev *sd, bool on)
> @@ -631,6 +648,7 @@ static int rzg2l_csi2_set_format(struct v4l2_subdev *=
sd,
>                                  struct v4l2_subdev_state *state,
>                                  struct v4l2_subdev_format *fmt)
>  {
> +       struct rzg2l_csi2 *csi2 =3D sd_to_csi2(sd);
>         struct v4l2_mbus_framefmt *src_format;
>         struct v4l2_mbus_framefmt *sink_format;
>
> @@ -653,9 +671,11 @@ static int rzg2l_csi2_set_format(struct v4l2_subdev =
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
> @@ -697,16 +717,18 @@ static int rzg2l_csi2_enum_frame_size(struct v4l2_s=
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

