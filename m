Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9171942FE46
	for <lists+linux-media@lfdr.de>; Sat, 16 Oct 2021 00:36:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239167AbhJOWio (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Oct 2021 18:38:44 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:34194 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238862AbhJOWio (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Oct 2021 18:38:44 -0400
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 27C8029B;
        Sat, 16 Oct 2021 00:36:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1634337396;
        bh=YpIjKWhPxlJyMotrj5Fz/0HcYL2+g6oIM0JniTO7h/w=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Kq9KImXlIzpLQTqx8ZwP0zlaNIvrLXhnN0OWhPHp+JUKuaFNmsHWwziSCMdf4EmaE
         hoDogb7/lH0i6iN5mkRRZkwkZQ7jecCSwCvGgABfJXG0KHMwpPXG/7/oiopcXEqxDO
         eiJpxo63jXUy+e4wuxUPpkUs2kGiE0xUH0WQePs8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1634280562-4629-1-git-send-email-wangqing@vivo.com>
References: <1634280562-4629-1-git-send-email-wangqing@vivo.com>
Subject: Re: [PATCH] media: ccs: replace snprintf in show functions with sysfs_emit
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Qing Wang <wangqing@vivo.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Qing Wang <wangqing@vivo.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Date:   Fri, 15 Oct 2021 23:36:33 +0100
Message-ID: <163433739388.456562.9392744334237641054@Monstersaurus>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

Quoting Qing Wang (2021-10-15 07:49:22)
> show() must not use snprintf() when formatting the value to be
> returned to user space.
>=20
> Fix the following coccicheck warning:
> drivers/media/i2c/ccs/ccs-core.c:2717: WARNING: use scnprintf or sprintf.
>=20
> Use sysfs_emit instead of scnprintf or sprintf makes more sense.
>=20
> Signed-off-by: Qing Wang <wangqing@vivo.com>
> ---
>  drivers/media/i2c/ccs/ccs-core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs=
-core.c
> index a9403a2..21a156d 100644
> --- a/drivers/media/i2c/ccs/ccs-core.c
> +++ b/drivers/media/i2c/ccs/ccs-core.c
> @@ -2715,11 +2715,11 @@ ccs_sysfs_ident_read(struct device *dev, struct d=
evice_attribute *attr,

What version of the kernel is this patch against?

I can't find the direct line mapping for this in either the linux-media
tree or torvalds master branch (closest match at
https://git.linuxtv.org/media_tree.git/tree/drivers/media/i2c/ccs/ccs-core.=
c#n2754)

Ah: https://lore.kernel.org/all/20210603071750.11594-1-thunder.leizhen@huaw=
ei.com/
updated this, so I suspect this patch has been submitted against perhaps
a v5.14 kernel? It would be best to rebase and repost against the latest
branch of https://git.linuxtv.org/media_tree.git


>         struct ccs_module_info *minfo =3D &sensor->minfo;
> =20
>         if (minfo->mipi_manufacturer_id)
> -               return snprintf(buf, PAGE_SIZE, "%4.4x%4.4x%2.2x\n",
> +               return sysfs_emit(buf, "%4.4x%4.4x%2.2x\n",
>                                 minfo->mipi_manufacturer_id, minfo->model=
_id,
>                                 minfo->revision_number) + 1;

This change looks good, but I think it might be better to re-indent the
minfo lines to match as well...

>         else
> -               return snprintf(buf, PAGE_SIZE, "%2.2x%4.4x%2.2x\n",
> +               return sysfs_emit(buf, "%2.2x%4.4x%2.2x\n",
>                                 minfo->smia_manufacturer_id, minfo->model=
_id,
>                                 minfo->revision_number) + 1;

here as well of course.

--
Kieran


>  }
> --=20
> 2.7.4
>
