Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA84A36B34E
	for <lists+linux-media@lfdr.de>; Mon, 26 Apr 2021 14:42:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233319AbhDZMnD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Apr 2021 08:43:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:57916 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232364AbhDZMnB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Apr 2021 08:43:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8106D611CE;
        Mon, 26 Apr 2021 12:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619440939;
        bh=6CTY4exOmL7l22aXrPfGFjlNeMqnCUXrgJOGfHlDDfo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=VWTJ3W71PmyDqp2EIS/gk2qcSkPxTNg1O0TT+qg7l1CRzIQpx4x8gsLGCNeg8hde6
         LLDLmGKzWciNzTnd4C+6dzY5zEounZxBbd9JgOYs5KCHTIlFzr0JImy7G9qczdd0FR
         qhtq4lWhv+/8FcQmtwsRDLXIJvtQRRIsqO1vl59SXtWthmgmlsJzAPNXEgoco4RVrw
         Ia6nGezETvVK1HyU80csrp7r0GLCF6hIwxruTJo96NyGn/7UM1uUm9LYfjZPBy/5bu
         SPqi4+DDkZ+3U0VKbxA/UxJ26R/9NcfdWZIqjUnt7SlVIouV29c7DIheCkQFZXiXFA
         iInt69scoTQrw==
Date:   Mon, 26 Apr 2021 14:42:12 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 13/78] staging: media: hantro_drv: use
 pm_runtime_resume_and_get()
Message-ID: <20210426144212.1f8430ce@coco.lan>
In-Reply-To: <20210426143327.4f9fb6ea@coco.lan>
References: <cover.1619191723.git.mchehab+huawei@kernel.org>
        <0021158fb27035a56089683ee712fb3ed6f6032d.1619191723.git.mchehab+huawei@kernel.org>
        <780afdc9b263928ed378dfbd3eaa8a5509a59a35.camel@collabora.com>
        <20210426143327.4f9fb6ea@coco.lan>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 26 Apr 2021 14:33:27 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

> Em Sat, 24 Apr 2021 20:23:53 -0300
> Ezequiel Garcia <ezequiel@collabora.com> escreveu:
>=20
> > Hi Mauro,
> >=20
> > On Sat, 2021-04-24 at 08:44 +0200, Mauro Carvalho Chehab wrote: =20
> > > Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to d=
eal with usage counter")
> > > added pm_runtime_resume_and_get() in order to automatically handle
> > > dev->power.usage_count decrement on errors.
> > >=20
> > > Use the new API, in order to cleanup the error check logic.
> > >=20
> > > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > > ---
> > > =C2=A0drivers/staging/media/hantro/hantro_drv.c | 2 +-
> > > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/stag=
ing/media/hantro/hantro_drv.c
> > > index 595e82a82728..3147dcbebeb9 100644
> > > --- a/drivers/staging/media/hantro/hantro_drv.c
> > > +++ b/drivers/staging/media/hantro/hantro_drv.c
> > > @@ -155,7 +155,7 @@ static void device_run(void *priv)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D clk_bulk_enab=
le(ctx->dev->variant->num_clocks, ctx->dev->clocks);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ret)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0goto err_cancel_job;
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D pm_runtime_get_syn=
c(ctx->dev->dev);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D pm_runtime_resume_=
and_get(ctx->dev->dev);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ret < 0)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0goto err_cancel_job;
> > > =C2=A0   =20
> >=20
> > Seems this one needs a different fix: err_cancel_job
> > will call hantro_job_finish which has a pm_runtime put. =20
>=20
> Good point. Thanks for reviewing it!
>=20
> It sounds that this is a place where the best seems
> to keep using pm_runtime_get_sync(), but let's at least add a
> comment explaining why it should be kept here. This should
> help to avoid people to copy-and-paste the code on situations
> where pm_runtime_resume_and_get() should be used instead.
>=20
> See enclosed patch.
>=20
> Thanks,
> Mauro
>=20
> [PATCH] media: hantro: document the usage of pm_runtime_get_sync()
>=20
> Despite other *_get()/*_put() functions, where usage count is
> incremented only if not errors, the pm_runtime_get_sync() has
> a different behavior, incrementing the counter *even* on
> errors.
>=20
> That's an error prone behavior, as people often forget to
> decrement the usage counter.
>=20
> However, the hantro driver depends on this behavior, as it
> will decrement the usage_count unconditionally at the m2m
> job finish time, which makes sense.
>=20
> So, intead of using the pm_runtime_resume_and_get() that
> would decrement the counter on error, keep the current
> API, but add a documentation explaining the rationale for
> keep using pm_runtime_get_sync().
>=20
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Hmm... maybe it can, instead, use the same solution as the
rkvdec driver does, having a job_finish_no_pm() plus the normal
job_finish().

What do you think?

Regards,
Mauro

>=20
> diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/=
media/hantro/hantro_drv.c
> index 595e82a82728..96f940c1c85c 100644
> --- a/drivers/staging/media/hantro/hantro_drv.c
> +++ b/drivers/staging/media/hantro/hantro_drv.c
> @@ -155,6 +155,13 @@ static void device_run(void *priv)
>  	ret =3D clk_bulk_enable(ctx->dev->variant->num_clocks, ctx->dev->clocks=
);
>  	if (ret)
>  		goto err_cancel_job;
> +
> +	/*
> +	 * The pm_runtime_get_sync() will increment dev->power.usage_count,
> +	 * even on errors. That's the expected behavior here, since the
> +	 * hantro_job_finish() function at the error handling code
> +	 * will internally call pm_runtime_put_autosuspend().
> +	 */
>  	ret =3D pm_runtime_get_sync(ctx->dev->dev);
>  	if (ret < 0)
>  		goto err_cancel_job;
>=20
>=20



Thanks,
Mauro
