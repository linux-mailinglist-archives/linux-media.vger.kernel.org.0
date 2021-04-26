Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E586F36B31B
	for <lists+linux-media@lfdr.de>; Mon, 26 Apr 2021 14:33:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233345AbhDZMeS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Apr 2021 08:34:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:53006 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233407AbhDZMeQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Apr 2021 08:34:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 396B260233;
        Mon, 26 Apr 2021 12:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619440413;
        bh=WvMI72dlNKXKfzflyxeqjv661v4Ptuau37HZFZ2JpCU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=TwtJeLFjpMVq02zL6f76cEVapcwXwg7F7oL6Au9/efbENNz9p487RjgC1K0+H/hPo
         njAjp5XPzRdiWqJB3KjMHZ/pBMGQwXe2vc9UsIKhZUSyhqJVfLb3KRmK/hrLAEM3tl
         KdhfMDJeUg8F1bLvq8z6O9bIqDR80gquSkyrikymYcZ8xkeP2YyNU1JXsypS86Jcih
         ybCZ/T3GpFu2sn3SM17EynT+MeDqoYbcILLbJ7tCZfPhIr6hN7w/wgrK7uNr04medK
         e+qCIOm52KmIHG08YIF2jfq/uBi+jQRpYPsynW6sQOENwi1koIZgSWhV2ACv63YX00
         veVJuoVy/KvMg==
Date:   Mon, 26 Apr 2021 14:33:27 +0200
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
Message-ID: <20210426143327.4f9fb6ea@coco.lan>
In-Reply-To: <780afdc9b263928ed378dfbd3eaa8a5509a59a35.camel@collabora.com>
References: <cover.1619191723.git.mchehab+huawei@kernel.org>
        <0021158fb27035a56089683ee712fb3ed6f6032d.1619191723.git.mchehab+huawei@kernel.org>
        <780afdc9b263928ed378dfbd3eaa8a5509a59a35.camel@collabora.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sat, 24 Apr 2021 20:23:53 -0300
Ezequiel Garcia <ezequiel@collabora.com> escreveu:

> Hi Mauro,
>=20
> On Sat, 2021-04-24 at 08:44 +0200, Mauro Carvalho Chehab wrote:
> > Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to dea=
l with usage counter")
> > added pm_runtime_resume_and_get() in order to automatically handle
> > dev->power.usage_count decrement on errors.
> >=20
> > Use the new API, in order to cleanup the error check logic.
> >=20
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> > =C2=A0drivers/staging/media/hantro/hantro_drv.c | 2 +-
> > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/stagin=
g/media/hantro/hantro_drv.c
> > index 595e82a82728..3147dcbebeb9 100644
> > --- a/drivers/staging/media/hantro/hantro_drv.c
> > +++ b/drivers/staging/media/hantro/hantro_drv.c
> > @@ -155,7 +155,7 @@ static void device_run(void *priv)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D clk_bulk_enable=
(ctx->dev->variant->num_clocks, ctx->dev->clocks);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ret)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0goto err_cancel_job;
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D pm_runtime_get_sync(=
ctx->dev->dev);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D pm_runtime_resume_an=
d_get(ctx->dev->dev);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ret < 0)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0goto err_cancel_job;
> > =C2=A0 =20
>=20
> Seems this one needs a different fix: err_cancel_job
> will call hantro_job_finish which has a pm_runtime put.

Good point. Thanks for reviewing it!

It sounds that this is a place where the best seems
to keep using pm_runtime_get_sync(), but let's at least add a
comment explaining why it should be kept here. This should
help to avoid people to copy-and-paste the code on situations
where pm_runtime_resume_and_get() should be used instead.

See enclosed patch.

Thanks,
Mauro

[PATCH] media: hantro: document the usage of pm_runtime_get_sync()

Despite other *_get()/*_put() functions, where usage count is
incremented only if not errors, the pm_runtime_get_sync() has
a different behavior, incrementing the counter *even* on
errors.

That's an error prone behavior, as people often forget to
decrement the usage counter.

However, the hantro driver depends on this behavior, as it
will decrement the usage_count unconditionally at the m2m
job finish time, which makes sense.

So, intead of using the pm_runtime_resume_and_get() that
would decrement the counter on error, keep the current
API, but add a documentation explaining the rationale for
keep using pm_runtime_get_sync().

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/me=
dia/hantro/hantro_drv.c
index 595e82a82728..96f940c1c85c 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -155,6 +155,13 @@ static void device_run(void *priv)
 	ret =3D clk_bulk_enable(ctx->dev->variant->num_clocks, ctx->dev->clocks);
 	if (ret)
 		goto err_cancel_job;
+
+	/*
+	 * The pm_runtime_get_sync() will increment dev->power.usage_count,
+	 * even on errors. That's the expected behavior here, since the
+	 * hantro_job_finish() function at the error handling code
+	 * will internally call pm_runtime_put_autosuspend().
+	 */
 	ret =3D pm_runtime_get_sync(ctx->dev->dev);
 	if (ret < 0)
 		goto err_cancel_job;


