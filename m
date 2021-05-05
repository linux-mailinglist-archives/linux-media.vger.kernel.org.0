Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFC2E373D71
	for <lists+linux-media@lfdr.de>; Wed,  5 May 2021 16:15:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232759AbhEEOQg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 May 2021 10:16:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:35654 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232733AbhEEOQe (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 5 May 2021 10:16:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7B97261106;
        Wed,  5 May 2021 14:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620224138;
        bh=Dm86HNWhTP5ywVYQgBazD3r+DHUcNYJVAYcVIdMuGt4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=mPQAayT+vIeGsDpuv5VCic1U8BoxH50iO7qWXqGufVb8NAbxCJtYhs6bsnKQtjN/C
         xBGcAoZ49N/sGES3er5z8VmPDdRGJ/BJeWWorTCFB/vfKsgk5V1Rc9W4o/FzZVwn5n
         KhiQV4CDU5lOQVeFp1S9Y0dvqLB7KHMkYHr+gbgFvCrkx0m5p4uD86WjQH/cBcYUkZ
         anyI8gy42uJ+/KDtm6G4uUWXi+rGgX5mpizE7GyIDHM3G65mF4HdCs8PvnMZuOPGxh
         r8HPWWQokQZ2tvGZzC4LHVwAf+iqzKsIBVO3FxrlTajLnrBMr9VpByvg1uejhk+My1
         1kFgXf0DdDseg==
Date:   Wed, 5 May 2021 16:15:32 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 09/25] media: hantro: do a PM resume earlier
Message-ID: <20210505161532.6d9da768@coco.lan>
In-Reply-To: <735925557d7fde1c11affeea703f8486febc825d.camel@collabora.com>
References: <cover.1620207353.git.mchehab+huawei@kernel.org>
        <82114a4bd9c7bc1188c6a7167a6e74bb3360961d.1620207353.git.mchehab+huawei@kernel.org>
        <11c24f97ef71b16c2e7b3ba40ca66a28c12df692.camel@collabora.com>
        <20210505154647.62784bf7@coco.lan>
        <735925557d7fde1c11affeea703f8486febc825d.camel@collabora.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 05 May 2021 11:01:35 -0300
Ezequiel Garcia <ezequiel@collabora.com> escreveu:

> On Wed, 2021-05-05 at 15:46 +0200, Mauro Carvalho Chehab wrote:
> > Em Wed, 05 May 2021 10:22:03 -0300
> > Ezequiel Garcia <ezequiel@collabora.com> escreveu:
> >  =20
> > > Hi Mauro,
> > >=20
> > > Thanks for working on this.
> > >=20
> > > On Wed, 2021-05-05 at 11:41 +0200, Mauro Carvalho Chehab wrote: =20
> > > > The device_run() first enables the clock and then
> > > > tries to resume PM runtime, checking for errors.
> > > >=20
> > > > Well, if for some reason the pm_runtime can not resume,
> > > > it would be better to detect it beforehand.
> > > >=20
> > > > So, change the order inside device_run().
> > > >=20
> > > > Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
> > > > Fixes: 775fec69008d ("media: add Rockchip VPU JPEG encoder driver")
> > > > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>=C2=
=A0  =20
> > >=20
> > > It seems this is wrong now, as this series doesn't have
> > >=20
> > > https://lore.kernel.org/linux-media/803c39fafdd62efc6f9e4d99a372af2c6=
955143b.1619621413.git.mchehab+huawei@kernel.org/
> > >=20
> > > I don't fully understand why all the back and forth
> > > happening on this series, but the former Hantro patches
> > > looked good (despite perhaps unclear commit messages). =20
> >=20
> > There was a request to break the original /79 series into smaller ones,
> > to make easier for reviewers. So, I opted to split it into (probably)
> > 3 series:
> >=20
> > 1. Fixes (this series);
> > 2. "use pm_runtime_resume_and_get" for the I2C drivers;
> > 3. "use pm_runtime_resume_and_get" for remaining ones.
> >=20
> > Before flooding everybody's email's with series (2) and (3), better
> > to focus at the fixes first. I'll probably send the other two series
> > by tomorrow.
> >  =20
> > > Any issues just squashing these two commits from "[PATCH v4 00/79] Ad=
dress some issues with PM runtime at media subsystem":
> > >=20
> > > =C2=A0 media: hantro: use pm_runtime_resume_and_get()
> > > =C2=A0 media: hantro: do a PM resume earlier =20
> >=20
> > The problem is that pm_runtime_resume_and_get() was added only
> > recently (Kernel v5.10).=20
> >=20
> > So, I opted to place the fix patches before the changes, as this
> > way, most (all?) patches can be easily be backported to legacy Kernels
> > as needed.
> >  =20
>=20
> Got it.
>=20
> Maybe the better fix would be the squash of [PATCH v4 78/79] media: hantr=
o: use pm_runtime_resume_and_get()
> and [PATCH v4 79/79] media: hantro: do a PM resume earlier but keeping pm=
_runtime_get_sync.
>=20
> And then you can replace the pm_runtime_get_sync with pm_runtime_resume_a=
nd_get.

Works for me. So, the fixes patch will be the enclosed one, right?

Btw, I agree with Jonathan that the best would be to also move this:

	clk_bulk_disable(vpu->variant->num_clocks, vpu->clocks);

out of hantro_job_finish_no_pm(), as, when an error happens at
device_run(), the clock lines won't be enabled at the first place.

> Thanks,
> Ezequiel

Thanks,
Mauro

[PATCH] media: hantro: do a PM resume earlier

The device_run() first enables the clock and then
tries to resume PM runtime, checking for errors.

Well, if for some reason the pm_runtime can not resume,
it would be better to detect it beforehand.

So, change the order inside device_run().

Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
Fixes: 775fec69008d ("media: add Rockchip VPU JPEG encoder driver")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/me=
dia/hantro/hantro_drv.c
index 595e82a82728..bdb57fb56f47 100644
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
@@ -152,12 +160,15 @@ static void device_run(void *priv)
 	src =3D hantro_get_src_buf(ctx);
 	dst =3D hantro_get_dst_buf(ctx);
=20
+	ret =3D pm_runtime_get_sync(ctx->dev->dev);
+	if (ret < 0) {
+		pm_runtime_put_noidle(ctx->dev->dev);
+		goto err_cancel_job;
+	}
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
@@ -165,7 +176,7 @@ static void device_run(void *priv)
 	return;
=20
 err_cancel_job:
-	hantro_job_finish(ctx->dev, ctx, VB2_BUF_STATE_ERROR);
+	hantro_job_finish_no_pm(ctx->dev, ctx, VB2_BUF_STATE_ERROR);
 }
=20
 static struct v4l2_m2m_ops vpu_m2m_ops =3D {


