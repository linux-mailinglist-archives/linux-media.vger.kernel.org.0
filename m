Return-Path: <linux-media+bounces-51008-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0C6D39E35
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 07:04:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8227E303524E
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 06:04:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7BF52571B0;
	Mon, 19 Jan 2026 06:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Yvg3Wfen"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052C478F2B;
	Mon, 19 Jan 2026 06:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768802655; cv=none; b=X1NJZx+F/jSbqVasYrrJCMNGqxycKpGrp+DX6IJN4hpanWSR9cQxd3u+psonG4pezwB+fs6ue+fwP/0EvTJ/VYK9/ukp2MHPI80wcsZ3hf8/jRQYStMSLrCiBGHZkNuTRzhZ/w6ATFvKXKSRZXAen+FJPFJSMyTdsywwKpwUNzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768802655; c=relaxed/simple;
	bh=NBwFaIqcW+D5WpQbZIDND6Rdmvl7XjMKpYCvxg9hul0=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=hb5XedOxr8Hy2/oOLh0miw2qbYbMVyaZBPLn/SgpYmt3EgYBog9gc/fJWUJJmnsAnO5UmV1uAS0/sYEekrtBjqHIoK1Dsxr7m9J3ybC1H0NnzQ0jinZcmM2SYBZyR0PeYKLXni3SzIr06F1ustthede3GeW2FqeiwD5VFMuI0Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Yvg3Wfen; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:14a8:6c0f:bab:e527:aefa])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 486C2BE1;
	Mon, 19 Jan 2026 07:03:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768802618;
	bh=NBwFaIqcW+D5WpQbZIDND6Rdmvl7XjMKpYCvxg9hul0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Yvg3WfenWeEUDrBVsT63HDmDguQhTyorfkptDAc68Ev/TKdo11cov0pPOaBPL9ziu
	 rX8MWpfu65SUj0Cp4ZUgrP4TYceHBNVKgGyN1rflmT6SwXeeSDirC9bLh2np6GcUUK
	 5swZkFaL2O1CoDohDzjS8NiJ/Y0LSDONrPHmZO3I=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <57b147bc-cdce-4033-8320-ce41b501519c@ideasonboard.com>
References: <20251230083220.2405247-1-r-donadkar@ti.com> <20251230083220.2405247-19-r-donadkar@ti.com> <57b147bc-cdce-4033-8320-ce41b501519c@ideasonboard.com>
Subject: Re: [PATCH v9 18/19] media: ti: j721e-csi2rx: Support runtime suspend
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: y-abhilashchandra@ti.com, devarsht@ti.com, s-jain1@ti.com, vigneshr@ti.com, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, p.zabel@pengutronix.de, conor+dt@kernel.org, sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl, changhuang.liang@starfivetech.com, jack.zhu@starfivetech.com, sjoerd@collabora.com, dan.carpenter@linaro.org, hverkuil+cisco@kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, jai.luthra@linux.dev, laurent.pinchart@ideasonboard.com, mripard@kernel.org
To: Rishikesh Donadkar <r-donadkar@ti.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Mon, 19 Jan 2026 11:34:04 +0530
Message-ID: <176880264444.9154.1426306631873007814@freya>
User-Agent: alot/0.12.dev62+gb9d6144a6

Hi

Quoting Tomi Valkeinen (2026-01-15 18:16:14)
> Hi,
>=20
> On 30/12/2025 10:32, Rishikesh Donadkar wrote:
> > From: Jai Luthra <jai.luthra@ideasonboard.com>
> >=20
> > Add support for runtime power-management to enable powering off the
> > shared power domain between Cadence CSI2RX and TI CSI2RX wrapper when
> > the device(s) are not in use.
> >=20
> > When powering off the IP, the PSI-L endpoint loses the paired DMA
> > channels. Thus we have to release the DMA channels at runtime suspend
> > and request them again at resume.
> >=20
> > Tested-by: Rishikesh Donadkar <r-donadkar@ti.com>
> > Reviewed-by: Rishikesh Donadkar <r-donadkar@ti.com>
> > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > Co-developed-by: Rishikesh Donadkar <r-donadkar@ti.com>
> > Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> > ---
> >  drivers/media/platform/ti/Kconfig             |  1 +
> >  .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 59 +++++++++++++++----
> >  2 files changed, 50 insertions(+), 10 deletions(-)
>=20
> Should pixel interface reset belong to the runtime suspend/resume
> functions? (Not a suggestion, just a question =3D).

Yeah that would indeed make things cleaner, but the problem is that pixel
reset needs to be asserted before we stop streaming on the source, as it is
currently done in ti_csi2rx_stop_streaming(), to prevent issues with stale
data on SoCs where the power domain doesn't turn off due to other
dependencies.

I am also not sure the correct ordering would be possible if it is tied to
the pm_runtime_put due to the two subdevs (cadence and shim) between the
video node and the camera, where both need to be awake for DMA transactions
to complete.

It still might be worth investigating, but I think for this iteration of
the driver it is better to keep it separate, as moving the pixel reset has
lead to weird bugs due to stale data in the past.

>=20
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>=20
>  Tomi
>=20

Thanks,
    Jai

> > diff --git a/drivers/media/platform/ti/Kconfig b/drivers/media/platform=
/ti/Kconfig
> > index 3bc4aa35887e6..a808063e24779 100644
> > --- a/drivers/media/platform/ti/Kconfig
> > +++ b/drivers/media/platform/ti/Kconfig
> > @@ -70,6 +70,7 @@ config VIDEO_TI_J721E_CSI2RX
> >       depends on VIDEO_CADENCE_CSI2RX
> >       depends on PHY_CADENCE_DPHY_RX || COMPILE_TEST
> >       depends on ARCH_K3 || COMPILE_TEST
> > +     depends on PM
> >       select VIDEOBUF2_DMA_CONTIG
> >       select V4L2_FWNODE
> >       help
> > diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/dr=
ivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> > index 3922bd67e78da..72da58738e16e 100644
> > --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> > +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> > @@ -13,6 +13,7 @@
> >  #include <linux/module.h>
> >  #include <linux/of_platform.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/pm_runtime.h>
> >  #include <linux/property.h>
> > =20
> >  #include <media/cadence/cdns-csi2rx.h>
> > @@ -964,12 +965,16 @@ static int ti_csi2rx_start_streaming(struct vb2_q=
ueue *vq, unsigned int count)
> >       unsigned long flags;
> >       int ret =3D 0;
> > =20
> > +     ret =3D pm_runtime_resume_and_get(csi->dev);
> > +     if (ret)
> > +             return ret;
> > +
> >       spin_lock_irqsave(&dma->lock, flags);
> >       if (list_empty(&dma->queue))
> >               ret =3D -EIO;
> >       spin_unlock_irqrestore(&dma->lock, flags);
> >       if (ret)
> > -             return ret;
> > +             goto err;
> > =20
> >       ret =3D video_device_pipeline_start(&ctx->vdev, &csi->pipe);
> >       if (ret)
> > @@ -991,6 +996,8 @@ static int ti_csi2rx_start_streaming(struct vb2_que=
ue *vq, unsigned int count)
> >       writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
> >  err:
> >       ti_csi2rx_cleanup_buffers(ctx, VB2_BUF_STATE_QUEUED);
> > +     pm_runtime_put(csi->dev);
> > +
> >       return ret;
> >  }
> > =20
> > @@ -1022,6 +1029,7 @@ static void ti_csi2rx_stop_streaming(struct vb2_q=
ueue *vq)
> > =20
> >       ti_csi2rx_stop_dma(ctx);
> >       ti_csi2rx_cleanup_buffers(ctx, VB2_BUF_STATE_ERROR);
> > +     pm_runtime_put(csi->dev);
> >  }
> > =20
> >  static const struct vb2_ops csi_vb2_qops =3D {
> > @@ -1263,7 +1271,6 @@ static void ti_csi2rx_cleanup_notifier(struct ti_=
csi2rx_dev *csi)
> > =20
> >  static void ti_csi2rx_cleanup_ctx(struct ti_csi2rx_ctx *ctx)
> >  {
> > -     dma_release_channel(ctx->dma.chan);
> >       vb2_queue_release(&ctx->vidq);
> > =20
> >       video_unregister_device(&ctx->vdev);
> > @@ -1283,7 +1290,7 @@ static int ti_csi2rx_init_vb2q(struct ti_csi2rx_c=
tx *ctx)
> >       q->ops =3D &csi_vb2_qops;
> >       q->mem_ops =3D &vb2_dma_contig_memops;
> >       q->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> > -     q->dev =3D dmaengine_get_dma_device(ctx->dma.chan);
> > +     q->dev =3D ctx->csi->dev;
> >       q->lock =3D &ctx->mutex;
> >       q->min_queued_buffers =3D 1;
> >       q->allow_cache_hints =3D 1;
> > @@ -1497,21 +1504,46 @@ static int ti_csi2rx_init_ctx(struct ti_csi2rx_=
ctx *ctx)
> >       spin_lock_init(&ctx->dma.lock);
> >       ctx->dma.state =3D TI_CSI2RX_DMA_STOPPED;
> > =20
> > -     ret =3D ti_csi2rx_init_dma(ctx);
> > +     ret =3D ti_csi2rx_init_vb2q(ctx);
> >       if (ret)
> >               return ret;
> > =20
> > -     ret =3D ti_csi2rx_init_vb2q(ctx);
> > -     if (ret)
> > -             goto cleanup_dma;
> > +     return 0;
> > +}
> > +
> > +static int ti_csi2rx_runtime_suspend(struct device *dev)
> > +{
> > +     struct ti_csi2rx_dev *csi =3D dev_get_drvdata(dev);
> > +     int i;
> > +
> > +     if (csi->enable_count !=3D 0)
> > +             return -EBUSY;
> > +
> > +     for (i =3D 0; i < csi->num_ctx; i++)
> > +             dma_release_channel(csi->ctx[i].dma.chan);
> > =20
> >       return 0;
> > +}
> > =20
> > -cleanup_dma:
> > -     dma_release_channel(ctx->dma.chan);
> > -     return ret;
> > +static int ti_csi2rx_runtime_resume(struct device *dev)
> > +{
> > +     struct ti_csi2rx_dev *csi =3D dev_get_drvdata(dev);
> > +     unsigned int ret, i;
> > +
> > +     for (i =3D 0; i < csi->num_ctx; i++) {
> > +             ret =3D ti_csi2rx_init_dma(&csi->ctx[i]);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     return 0;
> >  }
> > =20
> > +static const struct dev_pm_ops ti_csi2rx_pm_ops =3D {
> > +     RUNTIME_PM_OPS(ti_csi2rx_runtime_suspend, ti_csi2rx_runtime_resum=
e,
> > +                    NULL)
> > +};
> > +
> >  static int ti_csi2rx_probe(struct platform_device *pdev)
> >  {
> >       struct device_node *np =3D pdev->dev.of_node;
> > @@ -1569,6 +1601,8 @@ static int ti_csi2rx_probe(struct platform_device=
 *pdev)
> >                       goto err_ctx;
> >       }
> > =20
> > +     pm_runtime_enable(csi->dev);
> > +
> >       ret =3D ti_csi2rx_notifier_register(csi);
> >       if (ret)
> >               goto err_ctx;
> > @@ -1601,6 +1635,9 @@ static void ti_csi2rx_remove(struct platform_devi=
ce *pdev)
> >       struct ti_csi2rx_dev *csi =3D platform_get_drvdata(pdev);
> >       unsigned int i;
> > =20
> > +     if (!pm_runtime_status_suspended(&pdev->dev))
> > +             pm_runtime_set_suspended(&pdev->dev);
> > +
> >       for (i =3D 0; i < csi->num_ctx; i++)
> >               ti_csi2rx_cleanup_ctx(&csi->ctx[i]);
> > =20
> > @@ -1609,6 +1646,7 @@ static void ti_csi2rx_remove(struct platform_devi=
ce *pdev)
> >       mutex_destroy(&csi->mutex);
> >       dma_free_coherent(csi->dev, csi->drain.len, csi->drain.vaddr,
> >                         csi->drain.paddr);
> > +     pm_runtime_disable(&pdev->dev);
> >  }
> > =20
> >  static const struct of_device_id ti_csi2rx_of_match[] =3D {
> > @@ -1623,6 +1661,7 @@ static struct platform_driver ti_csi2rx_pdrv =3D {
> >       .driver =3D {
> >               .name =3D TI_CSI2RX_MODULE_NAME,
> >               .of_match_table =3D ti_csi2rx_of_match,
> > +             .pm             =3D &ti_csi2rx_pm_ops,
> >       },
> >  };
> > =20
>

