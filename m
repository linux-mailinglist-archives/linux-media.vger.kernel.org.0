Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D9DA36D22C
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 08:27:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235087AbhD1G2d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 02:28:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:38144 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232966AbhD1G2c (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 02:28:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 873AB61158;
        Wed, 28 Apr 2021 06:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619591268;
        bh=0XZAnGMbHQVb6640NACUhIc6RdCMbx/GXT7x2D/JQy8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=TTNCRtbSwT/1sPcCsPNBGMdt1T+unT0fTEBc7xEEJNuRXDHXQ6Yr3m3rCWgPfygv2
         wpZyYjGW1b6saQCMxu2r7f633/udi8Y1TyYNlDM2dMyIx4KgYLng/im0COlcu2R2/j
         C+p7XV+6uorxR7fkT8FieAn7dvmh7yCgrQU4PPbEQpO8+PwNnB+c7NbxtpAs9JZGgj
         LRDnsoHpLcfUDUJ112FRCdmoutrb8+QWuO1n9LIH1IyVprMi8W8Gm7y9eVggDj3Hy0
         Zc6K4hC03OHQu5qwRTwHs9TRjHtSk6PDlRyjMWwzT99e86p+8P689Ag+UrAFH4Qffa
         m1Oo9fuP0eVuw==
Date:   Wed, 28 Apr 2021 08:27:42 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Robin Murphy <robin.murphy@arm.com>, linuxarm@huawei.com,
        mauro.chehab@huawei.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 79/79] media: hantro: document the usage of
 pm_runtime_get_sync()
Message-ID: <20210428082742.20d54db1@coco.lan>
In-Reply-To: <95ea572e201545b27ff9f48313f7aaea157d4764.camel@collabora.com>
References: <cover.1619519080.git.mchehab+huawei@kernel.org>
        <230f22170db7fa57b49cff4570cef15bf11b2ad5.1619519080.git.mchehab+huawei@kernel.org>
        <02948673-9572-a570-d28e-03a7208f39e1@arm.com>
        <95ea572e201545b27ff9f48313f7aaea157d4764.camel@collabora.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Tue, 27 Apr 2021 12:18:32 -0300
Ezequiel Garcia <ezequiel@collabora.com> escreveu:

> On Tue, 2021-04-27 at 16:08 +0100, Robin Murphy wrote:
> > On 2021-04-27 11:27, Mauro Carvalho Chehab wrote: =20
> > > Despite other *_get()/*_put() functions, where usage count is
> > > incremented only if not errors, the pm_runtime_get_sync() has
> > > a different behavior, incrementing the counter *even* on
> > > errors.
> > >=20
> > > That's an error prone behavior, as people often forget to
> > > decrement the usage counter.
> > >=20
> > > However, the hantro driver depends on this behavior, as it
> > > will decrement the usage_count unconditionally at the m2m
> > > job finish time, which makes sense.
> > >=20
> > > So, intead of using the pm_runtime_resume_and_get() that
> > > would decrement the counter on error, keep the current
> > > API, but add a documentation explaining the rationale for
> > > keep using pm_runtime_get_sync().
> > >=20
> > > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > > ---
> > > =C2=A0 drivers/staging/media/hantro/hantro_drv.c | 7 +++++++
> > > =C2=A0 1 file changed, 7 insertions(+)
> > >=20
> > > diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/stag=
ing/media/hantro/hantro_drv.c
> > > index 595e82a82728..96f940c1c85c 100644
> > > --- a/drivers/staging/media/hantro/hantro_drv.c
> > > +++ b/drivers/staging/media/hantro/hantro_drv.c
> > > @@ -155,6 +155,13 @@ static void device_run(void *priv)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D clk_bulk_enab=
le(ctx->dev->variant->num_clocks, ctx->dev->clocks);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ret)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0goto err_cancel_job; =20
> >=20
> > ..except this can also cause the same pm_runtime_put_autosuspend() call=
=20
> > without even reaching the "matching" get below, so rather than some kin=
d=20
> > of cleverness it seems more like it's just broken :/
> >  =20
>=20
> Indeed, I was trying to find time to cook a quick patch, but kept
> getting preempted.
>=20
> Feel free to submit a fix for this, otherwise, I'll try to find
> time later this week.

What about doing this instead:

diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/me=
dia/hantro/hantro_drv.c
index 595e82a82728..67de6b15236d 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -56,14 +56,12 @@ dma_addr_t hantro_get_ref(struct hantro_ctx *ctx, u64 t=
s)
 	return hantro_get_dec_buf_addr(ctx, buf);
 }
=20
-static void hantro_job_finish(struct hantro_dev *vpu,
-			      struct hantro_ctx *ctx,
-			      enum vb2_buffer_state result)
+static void hantro_job_finish_no_pm(struct hantro_dev *vpu,
+				    struct hantro_ctx *ctx,
+				    enum vb2_buffer_state result)
 {
 	struct vb2_v4l2_buffer *src, *dst;
=20
-	pm_runtime_mark_last_busy(vpu->dev);
-	pm_runtime_put_autosuspend(vpu->dev);
 	clk_bulk_disable(vpu->variant->num_clocks, vpu->clocks);
=20
 	src =3D v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
@@ -81,6 +79,16 @@ static void hantro_job_finish(struct hantro_dev *vpu,
 					 result);
 }
=20
+static void hantro_job_finish(struct hantro_dev *vpu,
+			      struct hantro_ctx *ctx,
+			      enum vb2_buffer_state result)
+{
+	pm_runtime_mark_last_busy(vpu->dev);
+	pm_runtime_put_autosuspend(vpu->dev);
+
+	hantro_job_finish_no_pm(vpu, ctx, result);
+}
+
 void hantro_irq_done(struct hantro_dev *vpu,
 		     enum vb2_buffer_state result)
 {
@@ -152,12 +160,13 @@ static void device_run(void *priv)
 	src =3D hantro_get_src_buf(ctx);
 	dst =3D hantro_get_dst_buf(ctx);
=20
+	ret =3D pm_runtime_resume_and_get(ctx->dev->dev);
+	if (ret < 0)
+		goto err_cancel_job;
+
 	ret =3D clk_bulk_enable(ctx->dev->variant->num_clocks, ctx->dev->clocks);
 	if (ret)
 		goto err_cancel_job;
-	ret =3D pm_runtime_get_sync(ctx->dev->dev);
-	if (ret < 0)
-		goto err_cancel_job;
=20
 	v4l2_m2m_buf_copy_metadata(src, dst, true);
=20
@@ -165,7 +174,7 @@ static void device_run(void *priv)
 	return;
=20
 err_cancel_job:
-	hantro_job_finish(ctx->dev, ctx, VB2_BUF_STATE_ERROR);
+	hantro_job_finish_no_pm(ctx->dev, ctx, VB2_BUF_STATE_ERROR);
 }
=20
 static struct v4l2_m2m_ops vpu_m2m_ops =3D {

Thanks,
Mauro
