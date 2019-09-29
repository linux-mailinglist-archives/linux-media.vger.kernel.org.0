Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B207C1284
	for <lists+linux-media@lfdr.de>; Sun, 29 Sep 2019 02:08:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728784AbfI2AIs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 28 Sep 2019 20:08:48 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:39719 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728699AbfI2AIs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 28 Sep 2019 20:08:48 -0400
Received: by mail-io1-f68.google.com with SMTP id a1so27805223ioc.6;
        Sat, 28 Sep 2019 17:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=sySYmdanx8FlKrC5M/xI9bXiDTGnSPM1TKZx0s0iEwo=;
        b=NCW2fQ1a9sQDlIZ42JYWNH4b+9nCYHx7SgpJedzFVmGdDYUOdftiPhz5nl+ecIx2tc
         69+thtrjgPxpATNxzlS9HC2pyy5rsyp1OcjOtHD+XG1La+fhHzXEdB9n53Dv8GG31QC3
         xJhFHwpUuf/bEDpMWXW16REZZgsBcy8QHE+OfWaCEIkcW+PiigdR0VFHKQIkEZBDRkV/
         oAV5ON6xOEajtCEp8WEz6uAf0OHGoL99MYOrOb2gXf9vbuvoHCRMni96Y32jDLFCeZr0
         jzSZpFfwHiedgy7aTTt86yjrWWO3EsGkbHxdtArtfqTh1S9UW9LvpTbpKRDDfxxsa1oL
         SPaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=sySYmdanx8FlKrC5M/xI9bXiDTGnSPM1TKZx0s0iEwo=;
        b=GCCG1iNlzPEUujC9+g6nqBjPxiD36fg5RdOhYLI8nwD3qteRD48bpSw0H17B10idA+
         rTymXx7n5adGN8ArlL7HAggKd1BCLG7SysoD7nJkma0yhLz84N82r7205kB/wCneumdR
         vuq4xNSZKYb088u86lkcWMavD1rCojrSRLoDwZuzn+L4oAmM763vwN5xR2r1gqSds/nt
         xfhDIcB4Tf1pN1zVhEoEASCDoQ4CQT2+QngILyr/BkyRHfztOfalEwR08CMd7w3HonEx
         wkWSwDNijzNtoK6/axqNCENUACdHLiNHVBD2RSVtKCUC0WRxplYB7VCrMCmdMo1FUeA+
         RUoA==
X-Gm-Message-State: APjAAAVYrzCUH0886psRHLMjAFjYhmGGPhgDRRRtxf5jcU2Z1J+EUSUM
        LPipMsM3UghVvCDrnfREiZWd9IdNpgCUSP5C7lo=
X-Google-Smtp-Source: APXvYqxTyPZTUWBm7blYKJlUhNEilGHuqgwFewfkd2OZyk32KgEnEjohIti6fziLTNuPCQZbhFtJJNM7BJ+dhhYPeJI=
X-Received: by 2002:a05:6e02:4ce:: with SMTP id f14mr12781454ils.278.1569715726965;
 Sat, 28 Sep 2019 17:08:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190927183650.31345-1-bparrot@ti.com> <20190927183650.31345-3-bparrot@ti.com>
In-Reply-To: <20190927183650.31345-3-bparrot@ti.com>
From:   Austin Kim <austinkernel.kim@gmail.com>
Date:   Sun, 29 Sep 2019 09:08:37 +0900
Message-ID: <CAOoBcBUd7reG=-WOq+Vq9SynZMJ81CWFZPN35MkmaQvquZ9xyg@mail.gmail.com>
Subject: Re: [Patch 02/16] media: ti-vpe: vpe: Add missing null pointer checks
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

2019=EB=85=84 9=EC=9B=94 28=EC=9D=BC (=ED=86=A0) =EC=98=A4=EC=A0=84 3:37, B=
enoit Parrot <bparrot@ti.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> A few NULL pointer checks were missing.
> Add check with appropriate return code.
>
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> ---
>  drivers/media/platform/ti-vpe/vpe.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/ti-vpe/vpe.c b/drivers/media/platform=
/ti-vpe/vpe.c
> index 5ba72445584d..56f60dbea15c 100644
> --- a/drivers/media/platform/ti-vpe/vpe.c
> +++ b/drivers/media/platform/ti-vpe/vpe.c
> @@ -1537,6 +1537,8 @@ static int vpe_g_fmt(struct file *file, void *priv,=
 struct v4l2_format *f)
>                 return -EINVAL;
>
>         q_data =3D get_q_data(ctx, f->type);
> +       if (!q_data)
> +               return -EINVAL;

With this commit, it seems that 'Null Pointer Dereference' could be
avoidable even though 'get_q_data(ctx, f->type);' returns NULL.

* Original Code:
        q_data =3D get_q_data(ctx, f->type);
        // q_data =3D NULL;

        pix->width =3D q_data->width;
        // pix->width =3D  (NULL)->width;
        // In this case, data abort would be raised.

>
>         pix->width =3D q_data->width;
>         pix->height =3D q_data->height;
> @@ -2001,6 +2003,8 @@ static int vpe_queue_setup(struct vb2_queue *vq,
>         struct vpe_q_data *q_data;
>
>         q_data =3D get_q_data(ctx, vq->type);
> +       if (!q_data)
> +               return -EINVAL;
>
>         *nplanes =3D q_data->nplanes;
>
> @@ -2025,6 +2029,8 @@ static int vpe_buf_prepare(struct vb2_buffer *vb)
>         vpe_dbg(ctx->dev, "type: %d\n", vb->vb2_queue->type);
>
>         q_data =3D get_q_data(ctx, vb->vb2_queue->type);
> +       if (!q_data)
> +               return -EINVAL;
>         num_planes =3D q_data->nplanes;
>
>         if (vb->vb2_queue->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)=
 {
> @@ -2481,7 +2487,12 @@ static int vpe_probe(struct platform_device *pdev)
>         mutex_init(&dev->dev_mutex);
>
>         dev->res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM,
> -                       "vpe_top");
> +                                               "vpe_top");
> +       if (!dev->res) {
> +               dev_err(&pdev->dev, "missing 'vpe_top' resources data\n")=
;
> +               return -ENODEV;
> +       }
> +
>         /*
>          * HACK: we get resource info from device tree in the form of a l=
ist of
>          * VPE sub blocks, the driver currently uses only the base of vpe=
_top
> --
> 2.17.1
>
