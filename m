Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84AED43483B
	for <lists+linux-media@lfdr.de>; Wed, 20 Oct 2021 11:47:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230134AbhJTJuG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Oct 2021 05:50:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230201AbhJTJt4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Oct 2021 05:49:56 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FBC4C06176C;
        Wed, 20 Oct 2021 02:47:42 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 468C12A5;
        Wed, 20 Oct 2021 11:47:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1634723259;
        bh=KNdjG1dFElrO82qvZFpHcKPA6eMg45ePcQ5MyReTN8Q=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=hZiuWmyp5QNzAw2nlSsd05BXxkDF3meBcsHOTz9YlhppKMbP1DKEfXc5pJBq/yi++
         Ju6YVOcocvNn4anVIPm7qkTWX6vocscW2ziA+5fMN820ZkzDsZJXdvDpTyByYdFkmO
         5yVuJJccEdXlexK9W+VtV+Cm1ii5Txj9ylH3MI5Y=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1634696055-55861-1-git-send-email-wangqing@vivo.com>
References: <1634696055-55861-1-git-send-email-wangqing@vivo.com>
Subject: Re: [PATCH V3] media: i2c: ccs: replace snprintf in show functions with sysfs_emit
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Qing Wang <wangqing@vivo.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Qing Wang <wangqing@vivo.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Date:   Wed, 20 Oct 2021 10:47:36 +0100
Message-ID: <163472325682.2382401.4060377847168062683@Monstersaurus>
User-Agent: alot/0.9.2
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Qing,

Quoting Qing Wang (2021-10-20 03:14:15)
> show() should not use snprintf() when formatting the value to be
> returned to user space.
>=20
> Fix the following coccicheck warning:
> drivers/media/i2c/ccs/ccs-core.c:3761: WARNING: use scnprintf or sprintf.
>=20
> V3:
> - Fix some formatting problems.

This could go below the --- so that it doesn't get entered into the
commit itself, but I suspect that can be handled while applying. Not
sure what the preferences are for that.

Anyway, thank you for updating with my suggestions.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

>=20
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
> +                                 minfo->mipi_manufacturer_id, minfo->mod=
el_id,
> +                                 minfo->revision_number) + 1;
>         else
> -               return snprintf(buf, PAGE_SIZE, "%2.2x%4.4x%2.2x\n",
> -                               minfo->smia_manufacturer_id, minfo->model=
_id,
> -                               minfo->revision_number) + 1;
> +               return sysfs_emit(buf, "%2.2x%4.4x%2.2x\n",
> +                                 minfo->smia_manufacturer_id, minfo->mod=
el_id,
> +                                 minfo->revision_number) + 1;
>  }
>  static DEVICE_ATTR_RO(ident);
> =20
> --=20
> 2.7.4
>
