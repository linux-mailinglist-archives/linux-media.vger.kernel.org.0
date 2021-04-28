Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15D7036D216
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 08:16:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235859AbhD1GQx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 02:16:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:59414 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229464AbhD1GQx (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 02:16:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 13AC861411;
        Wed, 28 Apr 2021 06:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619590569;
        bh=XV3oMV5FoWuEKQt9D6lhsXyyVkS6RL6u4LEmp+7nXxs=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=lYvTziSA/4pv+NC8fzyfn3syRWuQk6KU/X6XBOZqYrOTqYUkIZJ5wqYMUNXUxnnZf
         9LoHNjGTvFYYtA+6ewnA+Ldw4qu5J98C72cUjqYzlVVqQogZRWgBMqxlbErhKjiEFq
         VwUoi91q1aver0mxw7c5Ujvm5+2Il1vbMFU18WA4UFggyPcSZ3F1b9s4vBGzTNk/3z
         Rg5qbZqJYnjx3Psv2KRFZsuZnJM3REaJciX85GYpAXHwGWhV9dpS9rLOLMOGuwyEiL
         fnTdVTQlLkCmtMeGl4xzIQvPEkk7Qp67G+bAXPL0esxnfp0WnL5Az0g93OdCMcGKRl
         eZANV0bTZhiew==
Date:   Wed, 28 Apr 2021 08:16:02 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Niklas =?UTF-8?B?U8O2ZGVybHVuZA==?= 
        <niklas.soderlund@ragnatech.se>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 78/79] media: rcar-vin: use
 pm_runtime_resume_and_get()
Message-ID: <20210428081602.68a0d82f@coco.lan>
In-Reply-To: <YIhwLhJSNyKPbzu9@oden.dyn.berto.se>
References: <cover.1619519080.git.mchehab+huawei@kernel.org>
        <85d92ba9e709ef00673a3e0e11769b121745e9cb.1619519080.git.mchehab+huawei@kernel.org>
        <YIhwLhJSNyKPbzu9@oden.dyn.berto.se>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

Em Tue, 27 Apr 2021 22:12:30 +0200
Niklas S=C3=B6derlund <niklas.soderlund@ragnatech.se> escreveu:

> Hi Mauro,
>=20
> On 2021-04-27 12:27:08 +0200, Mauro Carvalho Chehab wrote:
> > Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to dea=
l with usage counter")
> > added pm_runtime_resume_and_get() in order to automatically handle
> > dev->power.usage_count decrement on errors.
> >=20
> > Use the new API, in order to cleanup the error check logic.
> >=20
> > Reviewed-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> >  drivers/media/platform/rcar-vin/rcar-csi2.c | 6 ++++++
> >  drivers/media/platform/rcar-vin/rcar-dma.c  | 6 ++----
> >  drivers/media/platform/rcar-vin/rcar-v4l2.c | 6 ++----
> >  3 files changed, 10 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/medi=
a/platform/rcar-vin/rcar-csi2.c
> > index e06cd512aba2..ce8e84f9e3d9 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> > +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> > @@ -408,6 +408,12 @@ static void rcsi2_enter_standby(struct rcar_csi2 *=
priv)
> > =20
> >  static void rcsi2_exit_standby(struct rcar_csi2 *priv)
> >  {
> > +	/*
> > +	 * The code at rcsi2_enter_standby() assumes
> > +	 * inconditionally that PM runtime usage count was
> > +	 * incremented. So, it shouldn't use pm_runtime_resume_and_get()
> > +	 * here.
> > +	 */ =20
>=20
>  	pm_runtime_get_sync(priv->dev);
>
> I think this comment is a bit much. I won't object if you really want to=
=20
> keep it but my preference would be to drop it.

Hmm... I guess we could do this, instead:


diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/pl=
atform/rcar-vin/rcar-csi2.c
index e06cd512aba2..1fc2e6f4b607 100644
--- a/drivers/media/platform/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
@@ -406,9 +406,14 @@ static void rcsi2_enter_standby(struct rcar_csi2 *priv)
        pm_runtime_put(priv->dev);
 }
=20
-static void rcsi2_exit_standby(struct rcar_csi2 *priv)
+static int rcsi2_exit_standby(struct rcar_csi2 *priv)
 {
-       pm_runtime_get_sync(priv->dev);
+       int ret;
+
+       ret =3D pm_runtime_resume_and_get(priv->dev);
+       if (ret < 0)
+               return ret;
+
        reset_control_deassert(priv->rstc);
 }
=20
@@ -657,7 +662,9 @@ static int rcsi2_start(struct rcar_csi2 *priv)
 {
        int ret;
=20
-       rcsi2_exit_standby(priv);
+       ret =3D rcsi2_exit_standby(priv);
+       if (ret < 0)
+               return ret;
=20
        ret =3D rcsi2_start_receiver(priv);
        if (ret) {

Thanks,
Mauro
