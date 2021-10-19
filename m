Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 306C0433944
	for <lists+linux-media@lfdr.de>; Tue, 19 Oct 2021 16:51:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231915AbhJSOxc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Oct 2021 10:53:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229764AbhJSOxb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Oct 2021 10:53:31 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03E39C06161C;
        Tue, 19 Oct 2021 07:51:17 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A040B12A;
        Tue, 19 Oct 2021 16:51:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1634655075;
        bh=iqr2dLNHFhosre1aYzI61wcJM13iboH8sIoEJKyps30=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=bLuNS/ZpJW8GN1xKYnIsnR2JRunVKqoTyZs68JuNR1nd5VsuKeHmvXRTFfqv9ZO1z
         h3oVNKV0cZ3i5+XNeTxtODMTOC1snvGgu3Ty9ZdzH+K/m0Vbq+iU5dc1uu1hzAFp5N
         6BaeuJwtZmc7rbUHLKRnKSXnt77MA02hDKS1EwoI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1634544036-36868-1-git-send-email-wangqing@vivo.com>
References: <1634544036-36868-1-git-send-email-wangqing@vivo.com>
Subject: Re: [PATCH V2] media: i2c: ccs: replace snprintf in show functions with sysfs_emit
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Qing Wang <wangqing@vivo.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Qing Wang <wangqing@vivo.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Date:   Tue, 19 Oct 2021 15:51:13 +0100
Message-ID: <163465507325.2083150.9943480540280019199@Monstersaurus>
User-Agent: alot/0.9.2
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

Quoting Qing Wang (2021-10-18 09:00:36)
> show() should not use snprintf() when formatting the value to be
> returned to user space.
>=20
> Fix the following coccicheck warning:
> drivers/media/i2c/ccs/ccs-core.c:3761: WARNING: use scnprintf or sprintf.
>=20

Thank you for posting a v2 with the lines adjusted ...

> Signed-off-by: Qing Wang <wangqing@vivo.com>
> ---
>  drivers/media/i2c/ccs/ccs-core.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs=
-core.c
> index 5363f3b..9158d3c
> --- a/drivers/media/i2c/ccs/ccs-core.c
> +++ b/drivers/media/i2c/ccs/ccs-core.c
> @@ -2758,13 +2758,13 @@ ident_show(struct device *dev, struct device_attr=
ibute *attr, char *buf)
>         struct ccs_module_info *minfo =3D &sensor->minfo;
> =20
>         if (minfo->mipi_manufacturer_id)
> -               return snprintf(buf, PAGE_SIZE, "%4.4x%4.4x%2.2x\n",
> -                               minfo->mipi_manufacturer_id, minfo->model=
_id,
> -                               minfo->revision_number) + 1;
> +               return sysfs_emit(buf, "%4.4x%4.4x%2.2x\n",
> +                                   minfo->mipi_manufacturer_id, minfo->m=
odel_id,
> +                                   minfo->revision_number) + 1;

However they are still not lined up correctly.
It should look like:


return sysfs_emit(buf, "%4.4x%4.4x%2.2x\n",
                  minfo->mipi_manufacturer_id, minfo->model_id,
                  minfo->revision_number) + 1;

With the m from 'minfo' aligned directly below the b from 'buf' to match
the indention.

--
Regards

Kieran



>         else
> -               return snprintf(buf, PAGE_SIZE, "%2.2x%4.4x%2.2x\n",
> -                               minfo->smia_manufacturer_id, minfo->model=
_id,
> -                               minfo->revision_number) + 1;
> +               return sysfs_emit(buf, "%2.2x%4.4x%2.2x\n",
> +                                   minfo->smia_manufacturer_id, minfo->m=
odel_id,
> +                                   minfo->revision_number) + 1;
>  }
>  static DEVICE_ATTR_RO(ident);
> =20
> --=20
> 2.7.4
>
