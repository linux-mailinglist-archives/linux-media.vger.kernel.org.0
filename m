Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EA5E36E5AC
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 09:13:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239076AbhD2HO3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Apr 2021 03:14:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:33790 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232075AbhD2HO1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Apr 2021 03:14:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 177EF6141E;
        Thu, 29 Apr 2021 07:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619680421;
        bh=58tmw40R8d7hq0bYQ7ucYztt+FsoRTyGxT8Or5otJ0Q=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=u57bft8gaxqZ58WFZiZsaUCAj2+SFYgQnW+zHQWeVoDKQuNe28Ui9nkShXq8gVFJP
         CxAeWwIPITWLcLLSYO5a8o1543Vr7+nNrZWBDirk+efgJkiDxpcY4TllSycRwVeHqg
         D5XQknT64m26ahQWr9FzltYNllvJes0t6xG92DVAzgEcUYHABn0wodLonRFrXo+4WZ
         5gby7lVxrfSdnbgxKvu763v6/b6KwHgoB5P54m1Hq6INKRHT4092QQMLAxJBZggXG6
         C4dTCZbYAp6DMa/E3SHwqVrYbvqocLq0CDv4pM58sLQpLqyduPUhwBWODkU91qqkXU
         1Q14nXullZdgg==
Date:   Thu, 29 Apr 2021 09:13:35 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 79/79] media: hantro: do a PM resume earlier
Message-ID: <20210429091335.2b563ab5@coco.lan>
In-Reply-To: <e5eeffbbad6ee90204cb3928cfd6774efb6174f3.camel@collabora.com>
References: <cover.1619621413.git.mchehab+huawei@kernel.org>
        <569838d406dde80dcc64989a663882817a54cbb2.1619621413.git.mchehab+huawei@kernel.org>
        <e5eeffbbad6ee90204cb3928cfd6774efb6174f3.camel@collabora.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 28 Apr 2021 14:17:50 -0300
Ezequiel Garcia <ezequiel@collabora.com> escreveu:

> Hi Mauro,
>=20
> Thanks a lot for taking care of this.
>=20
> On Wed, 2021-04-28 at 16:52 +0200, Mauro Carvalho Chehab wrote:
> > The device_run() first enables the clock and then
> > tries to resume PM runtime, checking for errors.
> >=20
> > Well, if for some reason the pm_runtime can not resume,
> > it would be better to detect it beforehand.
> >=20
> > So, change the order inside device_run().
> >=20
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org> =20
>=20
> Clocks could be behind power-domains, IIRC, so this change
> is fixing that.
>=20
> However, this has ever been a problem for this driver,
> so I don't think it makes sense to bother with Fixes tag.

I would prefer to move this patch to the first part of this
series, together with other fixes, rebasing it to apply cleanly
before the pm_runtime_resume_and_get() patch, with:

    Fixes: 775fec69008d ("media: add Rockchip VPU JPEG encoder driver")

This way, people that could be interested on backporting it will be
capable to apply it as is to stable Kernel releases that came
with this driver.

>=20
> Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
>=20
> Thanks,
> Ezequiel
>=20
> > ---
> > =C2=A0drivers/staging/media/hantro/hantro_drv.c | 8 ++++----
> > =C2=A01 file changed, 4 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/stagin=
g/media/hantro/hantro_drv.c
> > index 25fa36e7e773..67de6b15236d 100644
> > --- a/drivers/staging/media/hantro/hantro_drv.c
> > +++ b/drivers/staging/media/hantro/hantro_drv.c
> > @@ -160,14 +160,14 @@ static void device_run(void *priv)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0src =3D hantro_get_src_=
buf(ctx);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dst =3D hantro_get_dst_=
buf(ctx);
> > =C2=A0
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D clk_bulk_enable(ctx-=
>dev->variant->num_clocks, ctx->dev->clocks);
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ret)
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0goto err_cancel_job;
> > -
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D pm_runtime_resu=
me_and_get(ctx->dev->dev);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ret < 0)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0goto err_cancel_job;
> > =C2=A0
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D clk_bulk_enable(ctx-=
>dev->variant->num_clocks, ctx->dev->clocks);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ret)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0goto err_cancel_job;
> > +
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0v4l2_m2m_buf_copy_metad=
ata(src, dst, true);
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ctx->codec_ops->run(ctx=
); =20
>=20
>=20



Thanks,
Mauro
