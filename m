Return-Path: <linux-media+bounces-48372-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3E2CAC604
	for <lists+linux-media@lfdr.de>; Mon, 08 Dec 2025 08:39:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 194873037531
	for <lists+linux-media@lfdr.de>; Mon,  8 Dec 2025 07:36:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A5662D594F;
	Mon,  8 Dec 2025 07:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GIjxRrEr"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF16D2253FC;
	Mon,  8 Dec 2025 07:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765179396; cv=none; b=hIoUAabA0kNZmAdwvb3G2GO8+9H28p8/EVDTne9jGmcBCAHN8DSiaUXh8T+3rsrhoMHU9wRy1w5uhyrKN1lJ6oXbnQq7B984Uo68xoU/KW0VS3xYT9GmX4TMFfoJbHwImOWZ4n2lfDVidNOnIh9JESoIoBHdFdLCGD5Y8FV5Ae4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765179396; c=relaxed/simple;
	bh=D20F60M3wNp1R/DsE0AEzkJ+BGmXT4BYdML64JVTpvY=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=NqIoA+fl06mp5q6sKeu6CkR5INcOftpRD4CXS0rDZU9zJ/huJY9v/HK/1+DKW8y3GbXawYQmz1T9BWxSJUiq1pZWJms65G0sHeyOBSslEM1npUjkAgnR68ShfjBirREL4ACKjK62gopYY7yVuExeRZim+Usc9odYYQqfwRUUO0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GIjxRrEr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:be8a:6a58:2d26:4571:d85d:6729])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2EB49766;
	Mon,  8 Dec 2025 08:34:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765179246;
	bh=D20F60M3wNp1R/DsE0AEzkJ+BGmXT4BYdML64JVTpvY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=GIjxRrErZtbkvtoCD6tZar6AO3b6bm9pRjuw8ncizW785GQl22WVFkXSTJ5i+/p6i
	 txlgRHpw04YPyIYNK2JcWs1wRH4XUnCL8KbrGnc9aSfyJs5G1THvwQ2L4kMCY9DVvT
	 +Rj9ZEgsxMEfEPj5aHukWL+1Kt1UJuHXv+2QDEE8=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <032b441e-eefc-4574-bf7a-5c4d09599925@ideasonboard.com>
References: <20251112115459.2479225-1-r-donadkar@ti.com> <20251112115459.2479225-18-r-donadkar@ti.com> <032b441e-eefc-4574-bf7a-5c4d09599925@ideasonboard.com>
Subject: Re: [PATCH v8 17/18] media: ti: j721e-csi2rx: Support runtime suspend
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: y-abhilashchandra@ti.com, devarsht@ti.com, s-jain1@ti.com, vigneshr@ti.com, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, p.zabel@pengutronix.de, conor+dt@kernel.org, sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl, changhuang.liang@starfivetech.com, jack.zhu@starfivetech.com, sjoerd@collabora.com, dan.carpenter@linaro.org, hverkuil+cisco@kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org
To: Rishikesh Donadkar <r-donadkar@ti.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, jai.luthra@linux.dev, laurent.pinchart@ideasonboard.com, mripard@kernel.org, Vignesh Raghavendra <vigneshr@ti.com>
Date: Mon, 08 Dec 2025 13:06:18 +0530
Message-ID: <176517937821.20066.4604793543801654609@freya>
User-Agent: alot/0.12.dev62+gb9d6144a6

Hi Tomi,

Quoting Tomi Valkeinen (2025-12-01 18:52:36)
> Hi,
>=20
> On 12/11/2025 13:54, Rishikesh Donadkar wrote:
> > From: Jai Luthra <jai.luthra@ideasonboard.com>
> >=20
> > Add support for runtime power-management to enable powering off the
> > shared power domain between Cadence CSI2RX and TI CSI2RX wrapper when
> > the device(s) are not in use.
> >=20
> > When powering off the IP, the PSI-L endpoint loses the paired DMA
> > channels. Thus we have to release the DMA channels at runtime suspend
> > and request them again at resume.
>=20
> I'm not an expert on the dmaengine, but to me this sounds like a bug in
> the dma driver. It just sounds very wrong...
>=20

Cc: Vignesh

IIRC this was done because on AM62 the CSI2RX is on a separate power domain
and it uses DMA channels from the system-wide DMA engine.

And as those two drivers have different set of users, we have situations
where CSI2RX goes to runtime suspend state and turns off the power and
clocks, while the DMA engine remains on as it has other users. This leads
to the paired PSIL channels to become invalid, and needs a re-pairing.

I am not an expert on DMA engine APIs to know how feasible it would be to
do the book-keeping of the power state of various devices in the DMA driver
and manage the re-pairing entirely there.

On AM62A and later devices, there is a dedicated instance of the BCDMA
engine for camera pipeline on the same power domain as CSI2RX, so this is
not a problem. Rishikesh/Vignesh please correct me if I'm wrong, as it has
been a while since I looked at this in depth.


> > Tested-by: Rishikesh Donadkar <r-donadkar@ti.com>
> > Reviewed-by: Rishikesh Donadkar <r-donadkar@ti.com>
> > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> > ---
> >  drivers/media/platform/ti/Kconfig             |  1 +
> >  .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 55 ++++++++++++++++++-
> >  2 files changed, 54 insertions(+), 2 deletions(-)
> >=20
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
> > index 528041ee78cf3..21e032c64b901 100644
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
> > @@ -963,12 +964,16 @@ static int ti_csi2rx_start_streaming(struct vb2_q=
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
> > @@ -1024,6 +1029,8 @@ static int ti_csi2rx_start_streaming(struct vb2_q=
ueue *vq, unsigned int count)
> >       writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
> >  err:
> >       ti_csi2rx_cleanup_buffers(ctx, VB2_BUF_STATE_QUEUED);
> > +     pm_runtime_put(csi->dev);
> > +
> >       return ret;
> >  }
> > =20
> > @@ -1055,6 +1062,7 @@ static void ti_csi2rx_stop_streaming(struct vb2_q=
ueue *vq)
> > =20
> >       ti_csi2rx_stop_dma(ctx);
> >       ti_csi2rx_cleanup_buffers(ctx, VB2_BUF_STATE_ERROR);
> > +     pm_runtime_put(csi->dev);
> >  }
> > =20
> >  static const struct vb2_ops csi_vb2_qops =3D {
> > @@ -1261,7 +1269,9 @@ static void ti_csi2rx_cleanup_notifier(struct ti_=
csi2rx_dev *csi)
> > =20
> >  static void ti_csi2rx_cleanup_ctx(struct ti_csi2rx_ctx *ctx)
> >  {
> > -     dma_release_channel(ctx->dma.chan);
> > +     if (!pm_runtime_status_suspended(ctx->csi->dev))
> > +             dma_release_channel(ctx->dma.chan);
> > +
> >       vb2_queue_release(&ctx->vidq);
> > =20
> >       video_unregister_device(&ctx->vdev);
> > @@ -1512,6 +1522,39 @@ static int ti_csi2rx_init_ctx(struct ti_csi2rx_c=
tx *ctx)
> >       return ret;
> >  }
> > =20
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
> > +
> > +     return 0;
> > +}
> > +
> > +static int ti_csi2rx_runtime_resume(struct device *dev)
> > +{
> > +     struct ti_csi2rx_dev *csi =3D dev_get_drvdata(dev);
> > +     int ret, i;
> > +
> > +     for (i =3D 0; i < csi->num_ctx; i++) {
> > +             ret =3D ti_csi2rx_init_dma(&csi->ctx[i]);
>=20
> If runtime_resume always requests the dma channels, is the call to
> ti_csi2rx_init_dma() in ti_csi2rx_init_ctx() needed? If not, you could
> inline the code from ti_csi2rx_init_dma() to here and also drop the
> dma_release_channel() call from ti_csi2rx_cleanup_ctx(), making the flow
> more understandable.
>=20

Makes sense.

> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct dev_pm_ops ti_csi2rx_pm_ops =3D {
> > +     RUNTIME_PM_OPS(ti_csi2rx_runtime_suspend, ti_csi2rx_runtime_resum=
e,
> > +                    NULL)
> > +};
> > +
> >  static int ti_csi2rx_probe(struct platform_device *pdev)
> >  {
> >       struct device_node *np =3D pdev->dev.of_node;
> > @@ -1579,6 +1622,10 @@ static int ti_csi2rx_probe(struct platform_devic=
e *pdev)
> >               goto err_notifier;
> >       }
> > =20
> > +     pm_runtime_set_active(csi->dev);
> > +     pm_runtime_enable(csi->dev);
> > +     pm_request_idle(csi->dev);
>=20
> I always forget what exactly the runtime_pm funcs do. What's the idea
> here? If you do something else than the plain standard
> pm_runtime_enable(), I think it's good to mention what/why in a comment.
>=20

https://docs.kernel.org/power/runtime_pm.html#runtime-pm-initialization-dev=
ice-probing-and-removal

The pm_request_idle() is done to queue up a job to suspend the hardware
until userspace starts streaming, to save power.

The runtime_set_active() is used because the power domain for CSI is by
default turned on when system boots up. But Rishikesh, please double check
that before v9 on AM62.

> >       return 0;
> > =20
> >  err_notifier:
> > @@ -1609,6 +1656,9 @@ static void ti_csi2rx_remove(struct platform_devi=
ce *pdev)
> >       mutex_destroy(&csi->mutex);
> >       dma_free_coherent(csi->dev, csi->drain.len, csi->drain.vaddr,
> >                         csi->drain.paddr);
> > +     pm_runtime_disable(&pdev->dev);
> > +     pm_runtime_set_suspended(&pdev->dev);
> > +
> >  }
> > =20
> >  static const struct of_device_id ti_csi2rx_of_match[] =3D {
> > @@ -1623,6 +1673,7 @@ static struct platform_driver ti_csi2rx_pdrv =3D {
> >       .driver =3D {
> >               .name =3D TI_CSI2RX_MODULE_NAME,
> >               .of_match_table =3D ti_csi2rx_of_match,
> > +             .pm             =3D &ti_csi2rx_pm_ops,
> >       },
> >  };
> > =20
>

