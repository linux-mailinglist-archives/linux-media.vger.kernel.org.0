Return-Path: <linux-media+bounces-48373-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A71CAC679
	for <lists+linux-media@lfdr.de>; Mon, 08 Dec 2025 08:47:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 27B11302D2BA
	for <lists+linux-media@lfdr.de>; Mon,  8 Dec 2025 07:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB3C42D24B7;
	Mon,  8 Dec 2025 07:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JrQeXTiE"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7518E208994;
	Mon,  8 Dec 2025 07:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765180052; cv=none; b=k1CK6Z9J6EKSYu0mn8z4dYtkQ7YHPpwCRoUDNnOCJADpDokoS0JyThdhN3/8VZsg7xdMTRY2ydQExUUjNFi19WTvKinpqoAT6E6obIqiaPca3TjMLID/u2j3b+0IzwQE2HIpURHnf+qBbi15oewm8fVwIVBKgvmwPNVOD00AMWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765180052; c=relaxed/simple;
	bh=bSs3lvW9GKXYTm9yQ7kchJrQyAulU1QWE0NdWgxDge4=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=maQGpSPm/gp3smp+VD7rhWe2Vi/svCbpnb1mUx0192pjjD2AUZ/83PTmXRE6TXEE1+FT5bVLTNG7jUWtflwVohe30QFWTm8UFyFvQKC1aVoEc9ep/isEU/4ThPt6AFyuf/nUH7Lhd5oTqp34i6/Ie58eyTdcFID0DXezGscSnaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JrQeXTiE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:be8a:6a58:2d26:4571:d85d:6729])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 84DE5AD0;
	Mon,  8 Dec 2025 08:45:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765179908;
	bh=bSs3lvW9GKXYTm9yQ7kchJrQyAulU1QWE0NdWgxDge4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=JrQeXTiEaY2P/vP0OjCVNAubzT5wRQ8lV02H+eob+Dl3So4G3ucrP/rjgvrVyyy4U
	 KjsDSE445/vbGp4b3MHtbjPMjggMLcRMhLwPMRFL3UdQwITp+L3G4x8injDjOSjMMf
	 eE0IRsRevbbyNVASziMG45k9Uj9zSiwdl5GT0O8M=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aR8UlHdBppncdlRD@kekkonen.localdomain>
References: <20251112115459.2479225-1-r-donadkar@ti.com> <20251112115459.2479225-18-r-donadkar@ti.com> <aR8UlHdBppncdlRD@kekkonen.localdomain>
Subject: Re: [PATCH v8 17/18] media: ti: j721e-csi2rx: Support runtime suspend
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: jai.luthra@linux.dev, laurent.pinchart@ideasonboard.com, mripard@kernel.org, y-abhilashchandra@ti.com, devarsht@ti.com, s-jain1@ti.com, vigneshr@ti.com, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, p.zabel@pengutronix.de, conor+dt@kernel.org, hverkuil-cisco@xs4all.nl, tomi.valkeinen@ideasonboard.com, changhuang.liang@starfivetech.com, jack.zhu@starfivetech.com, sjoerd@collabora.com, dan.carpenter@linaro.org, hverkuil+cisco@kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org
To: Rishikesh Donadkar <r-donadkar@ti.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Mon, 08 Dec 2025 13:17:21 +0530
Message-ID: <176518004114.20066.3953707820070167261@freya>
User-Agent: alot/0.12.dev62+gb9d6144a6

Hi Sakari,

Thanks for the review.

Quoting Sakari Ailus (2025-11-20 18:46:14)
> Hi Rishikesh,
>=20
> On Wed, Nov 12, 2025 at 05:24:58PM +0530, Rishikesh Donadkar wrote:
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
>=20
> What's the motivation for this change? Do the DMA channel need to be
> released only if the device's RPM status isn't suspended?
>=20
> Is there a guarantee Runtime PM is disabled when the function is called?
> Otherwise there's no guarantee state change couldn't occur.
>=20

The channels are released during PM runtime suspend, and re-paired in
resume. I like Tomi's suggestion of removing the channel logic from
init/cleanup_ctx altogether, which will also get rid of this change.

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
>=20
> You could declare i (as unsigned int) here.
>=20
> The same for ret actually.
>=20

Will do.

> > +             ret =3D ti_csi2rx_init_dma(&csi->ctx[i]);
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
>=20
> Note that the sub-device driver's UAPI may be already available to users
> when the async sub-device is registered. Therefore you'll need enable
> runtime PM before that.
>=20

The only place where the driver actually writes registers to the hardware
is in .start_streaming(), which I presume can only be called after the
whole media pipeline is probed?

> > +     pm_request_idle(csi->dev);
> > +
> >       return 0;
> > =20
> >  err_notifier:
> > @@ -1609,6 +1656,9 @@ static void ti_csi2rx_remove(struct platform_devi=
ce *pdev)
> >       mutex_destroy(&csi->mutex);
> >       dma_free_coherent(csi->dev, csi->drain.len, csi->drain.vaddr,
> >                         csi->drain.paddr);
>=20
> Is there a guarantee the device is in a particular runtime PM state here,
> e.g. suspended?
>=20

I don't think so, userspace could attempt to remove the device while
streaming. Good point, I haven't checked what all goes wrong in that case.

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
>=20
> --=20
> Kind regards,
>=20
> Sakari Ailus

Thanks,
Jai

