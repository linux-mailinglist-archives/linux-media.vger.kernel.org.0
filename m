Return-Path: <linux-media+bounces-19398-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B04A6999E19
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 09:39:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5785D28A70F
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 07:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70911209F4D;
	Fri, 11 Oct 2024 07:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jULN4X2w"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C2320897F
	for <linux-media@vger.kernel.org>; Fri, 11 Oct 2024 07:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728632365; cv=none; b=s1MGwQHxZ/7eg3/aXxu3Y2kHVv9CfVjvfXtnhmEMM5p62XuTf93VHXz2RJQNgrYEOPIJsODOE3/tNZAPGTOBG7BP5twd+3SuaHFkWjdrfs+y5WLz8B7xOMdL/afryEZfTq3hNl5kdIHoMv+ILPhEMe8jikD22qQIgNKYzWj7XBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728632365; c=relaxed/simple;
	bh=N9s6vNcBLYhsQ9mk13y5mdF6jh9wzSBntT55M4D5yGQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JAmWuBn4L1Emj81yKRfbLRhb9qyv+TRMAAJm73Sy9c81Y9ttx8MOz6g0WwU1bJWGjJLFXqq3zAuvw6j4k2mkjeOqZo6A/UmhvJQYdRBgLGIn1pCUTfeMcfrge3XPBg9Z38VxEu1dULsNgddRVb4z7FIhROqOPnH6jxgx5FhR76c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jULN4X2w; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5e5d0a80db4so890459eaf.3
        for <linux-media@vger.kernel.org>; Fri, 11 Oct 2024 00:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728632363; x=1729237163; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3QGK0KqvaLrNRtQBZUwM76VFtn49u1FVoQQ16dvotBs=;
        b=jULN4X2w2jvERVl2d8fIFEPfcRdQX08iR5Cm8UW//GJHa279xmL1AG53Uuz31OgIid
         e19IpCNiY4hLwVPiCpqUw1G6pdWNbFLilVMNQMLghu0xvhd3WWIvJDIhPBL0AZ38BJIo
         YVstQUrwNJefIoWTxnB0gdymKPX7YSCzHRhO34qehCYacPZN/Nx1CUEs8WH2+G34i0dF
         cu4bDdSIcMZsLxrbHdvXal4pnuapBq0IudrEr2M2a0Y4QiFdlJ7sMRLDYvt0YtskEnAM
         pk1+OQoq9R5g90Bz7ooGFuPtXYxApj3dKg41wDz+/VzKol+jiLWu3lPYTXwHpZso7p3N
         NNAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728632363; x=1729237163;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3QGK0KqvaLrNRtQBZUwM76VFtn49u1FVoQQ16dvotBs=;
        b=IAxWvlrRX5QCG3nRScsyWX56QX+oNIqnBSSyBEC0ooGnb95JGBotOCK60Oa7BcVRhb
         jgIt2/0Y3Yn8NcwAnFAZ09jx8m7P9TOucOkR3ja51ZX22watat2GcwEORriBDBH6qAxL
         R1p9IEgQp/HeJrtHCs8eCOwHo/KgTnWpVCaCePCdzGkcUWZl+XYsAldjL0YvIXeH5MTd
         L2DwhdB/53iv7Oc+7L9IouVfZvfUXY2IPJ+vL/RTpbVq4om9kTDOeaGMCMx0ywXr+h+J
         PVexrV1wCTMfd9ReTEYLUIdv9dmoJOesP8nkBa4CPJ+6ZI26e30h93vWFA6F/wPZqFJ+
         IUOA==
X-Forwarded-Encrypted: i=1; AJvYcCUKlPnskPQg5wVdyR2qDyRzJXaWyBpdw/WzWJgwWAuMVm5/PQlA0Xd+mxKZeQ5G3HiCCRLRB/DiwcuFiA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz74K0tDP3Kh0Ypp8vuLlfWFHqX8Xj2u9A7uNOpZpCF2pZUe+bw
	WoyFYZZ9uCZynJTXwmlUau2FTTorXVYb+Se+n6l4VBA19L36iCrr0gFxGGa4q26jGt4Fj9Dreow
	DAFcGcIPTsOFeDOjgdHVrdvVii/Kkspe0
X-Google-Smtp-Source: AGHT+IE1t9Ei50hg/i1YSMReXAgWgf7hQjjDupnWYLI7NNv3Yj5U/S4pr2SF7rL6OPhMmyYf4p+sqOtZ7rgdX4OOLCI=
X-Received: by 2002:a05:6870:700e:b0:277:caf7:3631 with SMTP id
 586e51a60fabf-2886dced4a6mr1502321fac.5.1728632363000; Fri, 11 Oct 2024
 00:39:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241011070828.851449-2-u.kleine-koenig@baylibre.com>
In-Reply-To: <20241011070828.851449-2-u.kleine-koenig@baylibre.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Fri, 11 Oct 2024 09:39:09 +0200
Message-ID: <CAMhs-H8-8wmg_OqxQrO93ZV1Mrh-2GKowoWpvdk5qkvQbQ-F=A@mail.gmail.com>
Subject: Re: [PATCH v2] staging: media: Switch back to struct platform_driver::remove()
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Uwe,

On Fri, Oct 11, 2024 at 9:09=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
>
> Convert all platform drivers below drivers/staging/media/ to use
> .remove(), with the eventual goal to drop struct
> platform_driver::remove_new(). As .remove() and .remove_new() have the
> same prototypes, conversion is done by just changing the structure
> member name in the driver initializer.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
> ---
> Hello,
>
> just rebase to
> https://gitlab.freedesktop.org/linux-media/media-committers.git next
> to make the CI happy. The only change is that the adaption for
> drivers/staging/media/omap4iss/iss.c is dropped from v2 as this file was
> deleted in above branch (since yesterday's next).
>
> v1 available at https://lore.kernel.org/linux-media/20241011055540.844629=
-2-u.kleine-koenig@baylibre.com
>
> Best regards
> Uwe
>
>  drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c | 2 +-
>  drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c | 2 +-
>  drivers/staging/media/imx/imx-media-csi.c                  | 2 +-
>  drivers/staging/media/imx/imx-media-dev.c                  | 2 +-
>  drivers/staging/media/imx/imx6-mipi-csi2.c                 | 2 +-
>  drivers/staging/media/meson/vdec/vdec.c                    | 2 +-
>  drivers/staging/media/rkvdec/rkvdec.c                      | 2 +-
>  drivers/staging/media/starfive/camss/stf-camss.c           | 2 +-
>  drivers/staging/media/sunxi/cedrus/cedrus.c                | 2 +-
>  drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c          | 2 +-
>  drivers/staging/media/tegra-video/csi.c                    | 2 +-
>  drivers/staging/media/tegra-video/vi.c                     | 2 +-
>  drivers/staging/media/tegra-video/vip.c                    | 2 +-
>  13 files changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c b=
/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c
> index 712f916f0935..bc360875516c 100644
> --- a/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c
> +++ b/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c
> @@ -629,7 +629,7 @@ MODULE_DEVICE_TABLE(of, atmel_isc_of_match);
>
>  static struct platform_driver atmel_isc_driver =3D {
>         .probe  =3D atmel_isc_probe,
> -       .remove_new =3D atmel_isc_remove,
> +       .remove =3D atmel_isc_remove,
>         .driver =3D {
>                 .name           =3D "atmel-sama5d2-isc",
>                 .pm             =3D &atmel_isc_dev_pm_ops,
> diff --git a/drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c b=
/drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c
> index 9485167d5b7d..c62985e502e4 100644
> --- a/drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c
> +++ b/drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c
> @@ -592,7 +592,7 @@ MODULE_DEVICE_TABLE(of, microchip_xisc_of_match);
>
>  static struct platform_driver microchip_xisc_driver =3D {
>         .probe  =3D microchip_xisc_probe,
> -       .remove_new =3D microchip_xisc_remove,
> +       .remove =3D microchip_xisc_remove,
>         .driver =3D {
>                 .name           =3D "microchip-sama7g5-xisc",
>                 .pm             =3D &microchip_xisc_dev_pm_ops,
> diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/=
media/imx/imx-media-csi.c
> index 785aac881922..3edbc57be2ca 100644
> --- a/drivers/staging/media/imx/imx-media-csi.c
> +++ b/drivers/staging/media/imx/imx-media-csi.c
> @@ -2076,7 +2076,7 @@ MODULE_DEVICE_TABLE(platform, imx_csi_ids);
>
>  static struct platform_driver imx_csi_driver =3D {
>         .probe =3D imx_csi_probe,
> -       .remove_new =3D imx_csi_remove,
> +       .remove =3D imx_csi_remove,
>         .id_table =3D imx_csi_ids,
>         .driver =3D {
>                 .name =3D "imx-ipuv3-csi",
> diff --git a/drivers/staging/media/imx/imx-media-dev.c b/drivers/staging/=
media/imx/imx-media-dev.c
> index be54dca11465..a08389b99d14 100644
> --- a/drivers/staging/media/imx/imx-media-dev.c
> +++ b/drivers/staging/media/imx/imx-media-dev.c
> @@ -129,7 +129,7 @@ MODULE_DEVICE_TABLE(of, imx_media_dt_ids);
>
>  static struct platform_driver imx_media_pdrv =3D {
>         .probe          =3D imx_media_probe,
> -       .remove_new     =3D imx_media_remove,
> +       .remove         =3D imx_media_remove,
>         .driver         =3D {
>                 .name   =3D "imx-media",
>                 .of_match_table =3D imx_media_dt_ids,
> diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging=
/media/imx/imx6-mipi-csi2.c
> index 0d8b42061623..dd8c7b3233bc 100644
> --- a/drivers/staging/media/imx/imx6-mipi-csi2.c
> +++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
> @@ -836,7 +836,7 @@ static struct platform_driver csi2_driver =3D {
>                 .of_match_table =3D csi2_dt_ids,
>         },
>         .probe =3D csi2_probe,
> -       .remove_new =3D csi2_remove,
> +       .remove =3D csi2_remove,
>  };
>
>  module_platform_driver(csi2_driver);
> diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/me=
dia/meson/vdec/vdec.c
> index 5e5b296f93ba..6bf7ade0c6a1 100644
> --- a/drivers/staging/media/meson/vdec/vdec.c
> +++ b/drivers/staging/media/meson/vdec/vdec.c
> @@ -1119,7 +1119,7 @@ static void vdec_remove(struct platform_device *pde=
v)
>
>  static struct platform_driver meson_vdec_driver =3D {
>         .probe =3D vdec_probe,
> -       .remove_new =3D vdec_remove,
> +       .remove =3D vdec_remove,
>         .driver =3D {
>                 .name =3D "meson-vdec",
>                 .of_match_table =3D vdec_dt_match,
> diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/medi=
a/rkvdec/rkvdec.c
> index ac398b5a9736..433df4778c95 100644
> --- a/drivers/staging/media/rkvdec/rkvdec.c
> +++ b/drivers/staging/media/rkvdec/rkvdec.c
> @@ -1103,7 +1103,7 @@ static const struct dev_pm_ops rkvdec_pm_ops =3D {
>
>  static struct platform_driver rkvdec_driver =3D {
>         .probe =3D rkvdec_probe,
> -       .remove_new =3D rkvdec_remove,
> +       .remove =3D rkvdec_remove,
>         .driver =3D {
>                    .name =3D "rkvdec",
>                    .of_match_table =3D of_rkvdec_match,
> diff --git a/drivers/staging/media/starfive/camss/stf-camss.c b/drivers/s=
taging/media/starfive/camss/stf-camss.c
> index b6d34145bc19..259aaad010d2 100644
> --- a/drivers/staging/media/starfive/camss/stf-camss.c
> +++ b/drivers/staging/media/starfive/camss/stf-camss.c
> @@ -422,7 +422,7 @@ static const struct dev_pm_ops stfcamss_pm_ops =3D {
>
>  static struct platform_driver stfcamss_driver =3D {
>         .probe =3D stfcamss_probe,
> -       .remove_new =3D stfcamss_remove,
> +       .remove =3D stfcamss_remove,
>         .driver =3D {
>                 .name =3D "starfive-camss",
>                 .pm =3D &stfcamss_pm_ops,
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/stagin=
g/media/sunxi/cedrus/cedrus.c
> index f52df6836045..52a9588462ce 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
> @@ -705,7 +705,7 @@ static const struct dev_pm_ops cedrus_dev_pm_ops =3D =
{
>
>  static struct platform_driver cedrus_driver =3D {
>         .probe          =3D cedrus_probe,
> -       .remove_new     =3D cedrus_remove,
> +       .remove         =3D cedrus_remove,
>         .driver         =3D {
>                 .name           =3D CEDRUS_NAME,
>                 .of_match_table =3D cedrus_dt_match,
> diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c b/drivers/=
staging/media/sunxi/sun6i-isp/sun6i_isp.c
> index 58f8ae92320d..f087643ea2cb 100644
> --- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c
> +++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c
> @@ -536,7 +536,7 @@ MODULE_DEVICE_TABLE(of, sun6i_isp_of_match);
>
>  static struct platform_driver sun6i_isp_platform_driver =3D {
>         .probe  =3D sun6i_isp_probe,
> -       .remove_new =3D sun6i_isp_remove,
> +       .remove =3D sun6i_isp_remove,
>         .driver =3D {
>                 .name           =3D SUN6I_ISP_NAME,
>                 .of_match_table =3D sun6i_isp_of_match,
> diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/me=
dia/tegra-video/csi.c
> index 255cccd0c5fd..604185c00a1a 100644
> --- a/drivers/staging/media/tegra-video/csi.c
> +++ b/drivers/staging/media/tegra-video/csi.c
> @@ -858,5 +858,5 @@ struct platform_driver tegra_csi_driver =3D {
>                 .pm             =3D &tegra_csi_pm_ops,
>         },
>         .probe                  =3D tegra_csi_probe,
> -       .remove_new             =3D tegra_csi_remove,
> +       .remove                 =3D tegra_csi_remove,
>  };
> diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/med=
ia/tegra-video/vi.c
> index 57a856a21e90..c068dfedd97a 100644
> --- a/drivers/staging/media/tegra-video/vi.c
> +++ b/drivers/staging/media/tegra-video/vi.c
> @@ -1979,5 +1979,5 @@ struct platform_driver tegra_vi_driver =3D {
>                 .pm =3D &tegra_vi_pm_ops,
>         },
>         .probe =3D tegra_vi_probe,
> -       .remove_new =3D tegra_vi_remove,
> +       .remove =3D tegra_vi_remove,
>  };
> diff --git a/drivers/staging/media/tegra-video/vip.c b/drivers/staging/me=
dia/tegra-video/vip.c
> index 8504b9ea9cea..5ec717f3afd5 100644
> --- a/drivers/staging/media/tegra-video/vip.c
> +++ b/drivers/staging/media/tegra-video/vip.c
> @@ -281,5 +281,5 @@ struct platform_driver tegra_vip_driver =3D {
>                 .of_match_table =3D tegra_vip_of_id_table,
>         },
>         .probe                  =3D tegra_vip_probe,
> -       .remove_new             =3D tegra_vip_remove,
> +       .remove                 =3D tegra_vip_remove,
>  };
>
> base-commit: 4115edeff98f2ce9f821a8bddcd7a646cfdde77a
> --
> 2.45.2
>
>

I sent a patch the other day to convert all staging drivers to use
remove which was applied yesterday.

See: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git/com=
mit/?h=3Dstaging-next&id=3Dc1a5060ec80020ce879fa5b2a16875bd9a5ab930

Thanks,
    Sergio Paracuellos

