Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4122E75BAF1
	for <lists+linux-media@lfdr.de>; Fri, 21 Jul 2023 01:00:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229689AbjGTXAB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jul 2023 19:00:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229528AbjGTXAA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jul 2023 19:00:00 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AC3992
        for <linux-media@vger.kernel.org>; Thu, 20 Jul 2023 15:59:59 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-99313a34b2dso192083566b.1
        for <linux-media@vger.kernel.org>; Thu, 20 Jul 2023 15:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20221208.gappssmtp.com; s=20221208; t=1689893998; x=1690498798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4qX478G28CC0EKN8pLOLCqh1i7R9Xk/60NqCY0YhmLQ=;
        b=Wc21uD/s6Qkjmen2i7y71Xp8KENTU0GbtbO4T1NkYhxG+zbXcGpi8YvVap6DzymR0C
         2fWhZAfoZNN1kdrjO9dU4gMbcgmmz17IHEau2mNrv1tJVG1EbEM+kxY+XDoDduK8mexQ
         FoQrG7c0KE6CCAL52ETOMP14f+L7noR6E9IBv0x7mLcfsktl03PEgzFD0DYpOM4xYjQo
         m7JDvqVxee+ewz/0SJ+IZLr52lcVMPkhteVGSPKwUlhdCSbDw+nTT/8QDrWRWzG6H3VF
         08qKGc+RXhGsSRmSszyUUZYh6GzMUvCO+69yKWeA5MTleOWIPqTG6ppb6Cs+XzLCxrPg
         S7qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689893998; x=1690498798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4qX478G28CC0EKN8pLOLCqh1i7R9Xk/60NqCY0YhmLQ=;
        b=QPaBqJYv9jgMeJji4y2caooXiTutrkcwXpf6yz6Hudd5lwtGQxT9sDGwFTg2l5ysXu
         YhGDVaIxNvggupxdi/AioFW2ksjtwQYBNGyHyQB8MwAQpHxeDHSwVuQn11nTvrB91vqD
         4pP30b3+vVv5q2xC31kF89YqGV3j0bY4xGhdSTzxh58NW4rlcneBOQioNZXY3/jDIpS6
         P859LuMSEQDy0SBeoJ1tmCBfnVgmFARbVMCXWJnAdwZt6i9jf/aC/oZSl6bdQ/ju/lih
         EWT0V4eDxP1dKTLuDKVPw6lJLqkMdaHQRO677sa6zMRvMio2MonEg5XIzBaT7jzjHb1F
         yCLQ==
X-Gm-Message-State: ABy/qLarCssE1GD5F/gFc4zzDwRdMPJrYoL7xwNdoYUCKhODXJN5ojsr
        IKieca8SDVmU6irb6MXYr2JnBQYLcl/qtf7XOzFgnQ==
X-Google-Smtp-Source: APBJJlHgmhyL80ZyXh5x7fl++j/Cap36kuc1ZiryuM6e2JiWA8J934BTWgP2KgxlCfi0pxznzMkKzoLGN4cQCbI0YDk=
X-Received: by 2002:a17:906:2da:b0:994:54af:e282 with SMTP id
 26-20020a17090602da00b0099454afe282mr120383ejk.10.1689893997246; Thu, 20 Jul
 2023 15:59:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230720222543.1740198-1-festevam@gmail.com>
In-Reply-To: <20230720222543.1740198-1-festevam@gmail.com>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Thu, 20 Jul 2023 15:59:43 -0700
Message-ID: <CAJ+vNU1DPrhy_eiW=+AsYwQZSAyGiDq5BO1iS2ghkfan49cFFw@mail.gmail.com>
Subject: Re: [PATCH v2] media: imx: imx7-media-csi: Fix applying format constraints
To:     Fabio Estevam <festevam@gmail.com>
Cc:     hverkuil-cisco@xs4all.nl, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com, rmfrfs@gmail.com,
        alexander.stein@ew.tq-group.com, linux-media@vger.kernel.org,
        Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jul 20, 2023 at 3:25=E2=80=AFPM Fabio Estevam <festevam@gmail.com> =
wrote:
>
> From: Fabio Estevam <festevam@denx.de>
>
> v4l_bound_align_image() aligns to a multiple power of 2 of walign, but th=
e
> result only needs to be a multiple of walign.
>
> This causes a 640x480 sensor that used to report:
>
>         Width/Height      : 640/480
>
> to incorrectly report:
>
>         Width/Height      : 768/480
>
> Fix this problem by doing the correct alignment via clamp_roundup().
>
> Reported-by: Tim Harvey <tharvey@gateworks.com>
> Fixes: 6f482c4729d9 ("media: imx: imx7-media-csi: Get rid of superfluous =
call to imx7_csi_mbus_fmt_to_pix_fmt")
> Co-developed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
> Changes since v1:
> - Export clamp_roundup().
>
>  drivers/media/platform/nxp/imx7-media-csi.c | 4 ++--
>  drivers/media/v4l2-core/v4l2-common.c       | 5 +++--
>  include/media/v4l2-common.h                 | 2 ++
>  3 files changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/=
platform/nxp/imx7-media-csi.c
> index 0bd2613b9320..f3c506fc19c4 100644
> --- a/drivers/media/platform/nxp/imx7-media-csi.c
> +++ b/drivers/media/platform/nxp/imx7-media-csi.c
> @@ -1137,8 +1137,8 @@ __imx7_csi_video_try_fmt(struct v4l2_pix_format *pi=
xfmt,
>          * TODO: Implement configurable stride support.
>          */
>         walign =3D 8 * 8 / cc->bpp;
> -       v4l_bound_align_image(&pixfmt->width, 1, 0xffff, walign,
> -                             &pixfmt->height, 1, 0xffff, 1, 0);
> +       pixfmt->width =3D clamp_roundup(pixfmt->width, 1, 0xffff, walign)=
;
> +       pixfmt->height =3D clamp_roundup(pixfmt->height, 1, 0xffff, 1);
>
>         pixfmt->bytesperline =3D pixfmt->width * cc->bpp / 8;
>         pixfmt->sizeimage =3D pixfmt->bytesperline * pixfmt->height;
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-c=
ore/v4l2-common.c
> index bee1535b04d3..3e8c16bcb0f6 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -106,8 +106,8 @@ static unsigned int clamp_align(unsigned int x, unsig=
ned int min,
>         return x;
>  }
>
> -static unsigned int clamp_roundup(unsigned int x, unsigned int min,
> -                                  unsigned int max, unsigned int alignme=
nt)
> +unsigned int clamp_roundup(unsigned int x, unsigned int min,
> +                          unsigned int max, unsigned int alignment)
>  {
>         x =3D clamp(x, min, max);
>         if (alignment)
> @@ -115,6 +115,7 @@ static unsigned int clamp_roundup(unsigned int x, uns=
igned int min,
>
>         return x;
>  }
> +EXPORT_SYMBOL(clamp_roundup);
>
>  void v4l_bound_align_image(u32 *w, unsigned int wmin, unsigned int wmax,
>                            unsigned int walign,
> diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> index d278836fd9cb..7059b99f4afa 100644
> --- a/include/media/v4l2-common.h
> +++ b/include/media/v4l2-common.h
> @@ -521,6 +521,8 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, =
u32 pixelformat,
>                      u32 width, u32 height);
>  int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixel=
format,
>                         u32 width, u32 height);
> +unsigned int clamp_roundup(unsigned int x, unsigned int min,
> +                          unsigned int max, unsigned int alignment);
>
>  /**
>   * v4l2_get_link_freq - Get link rate from transmitter
> --
> 2.34.1
>

Thanks Alexander and Fabio!

Acked-by: Tim Harvey <tharvey@gateworks.com>

tested on a imx8mm-gw72xx-0x with imx8mm-gw72xx-0x-imx219 overlay

Best regards,

Tim
