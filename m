Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AD92444474
	for <lists+linux-media@lfdr.de>; Wed,  3 Nov 2021 16:14:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231661AbhKCPQ5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Nov 2021 11:16:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231175AbhKCPQz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Nov 2021 11:16:55 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 496F3C061714;
        Wed,  3 Nov 2021 08:14:19 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A11AA1BFB;
        Wed,  3 Nov 2021 16:14:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1635952456;
        bh=/pT0t4HdxZZH4X3sUJBg74ZiNquibZZWZCEsPHLK+ZQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=URdzYwnH5zgh00Sm7Wb9YBwFkJgsCoWwAX27I69UjBlWQ54ILde1ZA8U4D1+0YURe
         Pn1IamuWX6Sqx6vQwA7U0BT23NMS1LjVv3pCE8AMUTYKlSoKvxmGcvWewr4XYchUJT
         +VZYGO4ZB8EDKouv8yoUhvNSPpSM0ifBXnQoRUqo=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211103083337.387083-1-yang.guang5@zte.com.cn>
References: <20211103083337.387083-1-yang.guang5@zte.com.cn>
Subject: Re: [PATCH] media: use swap() to make code cleaner
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     hverkuil-cisco@xs4all.nl, arnd@arndb.de,
        laurent.pinchart@ideasonboard.com, Julia.Lawall@inria.fr,
        yang.guang5@zte.com.cn, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     davidcomponentone@gmail.com, mchehab@kernel.org
Date:   Wed, 03 Nov 2021 15:14:14 +0000
Message-ID: <163595245449.275423.13730372490445199703@Monstersaurus>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi David,

Is this patch something you discovered somewhere and have posted on
behalf of Yang Guang?

Have you made any modifications to it that would require your sign off?
or is it simply a repost of a patch you came across?

Quoting davidcomponentone@gmail.com (2021-11-03 08:33:37)
> From: Yang Guang <yang.guang5@zte.com.cn>
>=20
> Use the macro 'swap()' defined in 'include/linux/minmax.h' to avoid
> opencoding it.
>=20
> Signed-off-by: Yang Guang <yang.guang5@zte.com.cn>

The change itself looks fine to me though.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/media/pci/saa7134/saa7134-video.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/media/pci/saa7134/saa7134-video.c b/drivers/media/pc=
i/saa7134/saa7134-video.c
> index 374c8e1087de..6f4132058c35 100644
> --- a/drivers/media/pci/saa7134/saa7134-video.c
> +++ b/drivers/media/pci/saa7134/saa7134-video.c
> @@ -823,7 +823,7 @@ static int buffer_activate(struct saa7134_dev *dev,
>  {
>         struct saa7134_dmaqueue *dmaq =3D buf->vb2.vb2_buf.vb2_queue->drv=
_priv;
>         unsigned long base,control,bpl;
> -       unsigned long bpl_uv,lines_uv,base2,base3,tmp; /* planar */
> +       unsigned long bpl_uv, lines_uv, base2, base3; /* planar */
> =20
>         video_dbg("buffer_activate buf=3D%p\n", buf);
>         buf->top_seen =3D 0;
> @@ -869,9 +869,7 @@ static int buffer_activate(struct saa7134_dev *dev,
>                 base2    =3D base + bpl * dev->height;
>                 base3    =3D base2 + bpl_uv * lines_uv;
>                 if (dev->fmt->uvswap) {
> -                       tmp =3D base2;
> -                       base2 =3D base3;
> -                       base3 =3D tmp;
> +                       swap(base2, base3);
>                 }
>                 video_dbg("uv: bpl=3D%ld lines=3D%ld base2/3=3D%ld/%ld\n",
>                         bpl_uv,lines_uv,base2,base3);
> --=20
> 2.30.2
>
