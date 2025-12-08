Return-Path: <linux-media+bounces-48375-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CE9CAC722
	for <lists+linux-media@lfdr.de>; Mon, 08 Dec 2025 09:01:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA9C13026AAD
	for <lists+linux-media@lfdr.de>; Mon,  8 Dec 2025 08:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69CA923BF9F;
	Mon,  8 Dec 2025 08:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pee4eEpG"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688BA1F5435;
	Mon,  8 Dec 2025 08:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765180892; cv=none; b=Xz7HGtrHyHzFEDLNpfxIELcpBakT8DhsFFGmmh2yRI2Nop54gYdO0kGhNsoNmywiYvBMFTDwEfPbFuPaAzHa2j2ww8hashq0wylZ+AhqqTQOVMD+XPK9sERULfYnvdUjj6x3jVC/VcOYax80+V0qAhpsgvJ28/bVBk3MotF6gt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765180892; c=relaxed/simple;
	bh=+8HbFXxcyp4fLDBJULe+ij2ZK9Iolz0gw82N40AiZ48=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=j5znktjQq0ogRD+htp0ZWhEb2MVyAcxy2YrKpQoYFTFuEJ15ZqOcXSqBSp2mYFR1nx9zxE+Q0oaJZRohXDNL/HmN/+knazb1XaQGw6SBpqMEYIYUVPzjMrcudaly8/eNFRx4fr8fbRnJofBWqAHExuIL/B9Zb0Ve4i0D/qS1kPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pee4eEpG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:be8a:6a58:2d26:4571:d85d:6729])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3E670766;
	Mon,  8 Dec 2025 08:59:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765180745;
	bh=+8HbFXxcyp4fLDBJULe+ij2ZK9Iolz0gw82N40AiZ48=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=pee4eEpG2yqzFNJaeIoMskqfUumX9mDrBjFousSwbELoKJ8PLYQih5t7qemnCVYKI
	 85wsW/fHqP21cXdtXnQ/RX5kMAKuec5nzIm3okO7ZRSI7Bc8owwtNFFFH9P32fKdwC
	 6gqjclaGjSf3J11PUHvTME94zgR9aOXVXqOP5oWs=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <09699385-0aea-4e31-8417-11dfb81ae36d@ideasonboard.com>
References: <20251112115459.2479225-1-r-donadkar@ti.com> <20251112115459.2479225-19-r-donadkar@ti.com> <09699385-0aea-4e31-8417-11dfb81ae36d@ideasonboard.com>
Subject: Re: [PATCH v8 18/18] media: ti: j721e-csi2rx: Support system suspend using pm_notifier
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: y-abhilashchandra@ti.com, devarsht@ti.com, s-jain1@ti.com, vigneshr@ti.com, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, p.zabel@pengutronix.de, conor+dt@kernel.org, sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl, changhuang.liang@starfivetech.com, jack.zhu@starfivetech.com, sjoerd@collabora.com, dan.carpenter@linaro.org, hverkuil+cisco@kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org
To: Rishikesh Donadkar <r-donadkar@ti.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, jai.luthra@linux.dev, laurent.pinchart@ideasonboard.com, mripard@kernel.org
Date: Mon, 08 Dec 2025 13:31:17 +0530
Message-ID: <176518087747.20066.2164303044523575108@freya>
User-Agent: alot/0.12.dev62+gb9d6144a6

Quoting Tomi Valkeinen (2025-12-01 19:16:38)
> Hi,
>=20
> On 12/11/2025 13:54, Rishikesh Donadkar wrote:
> > From: Jai Luthra <jai.luthra@ideasonboard.com>
> >=20
> > As this device is the "orchestrator" for the rest of the media
> > pipeline, we need to stop all on-going streams before system suspend and
> > enable them back when the system wakes up from sleep.
> >=20
> > Using .suspend/.resume callbacks does not work, as the order of those
> > callbacks amongst various devices in the camera pipeline like the senso=
r,
> > FPD serdes, CSI bridge etc. is impossible to enforce, even with
> > device links. For example, the Cadence CSI bridge is a child device of
> > this device, thus we cannot create a device link with the CSI bridge as
> > a provider and this device as consumer. This can lead to situations
> > where all the dependencies for the bridge have not yet resumed when we
> > request the subdev to start streaming again through the .resume callback
> > defined in this device.
> >=20
> > Instead here we register a notifier callback with the PM framework
> > which is triggered when the system is fully functional. At this point we
> > can cleanly stop or start the streams, because we know all other devices
> > and their dependencies are functional. A downside of this approach is
> > that the userspace is also alive (not frozen yet, or just thawed), so
> > the suspend notifier might complete before the userspace has completed
> > all ioctls, like QBUF/DQBUF/STREAMON/STREAMOFF.
> >=20
> > Tested-by: Rishikesh Donadkar <r-donadkar@ti.com>
> > Reviewed-by: Rishikesh Donadkar <r-donadkar@ti.com>
> > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> > ---
> >  .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 128 ++++++++++++++++++
> >  1 file changed, 128 insertions(+)
> >=20
> > diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/dr=
ivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> > index 21e032c64b901..dd47758d51a90 100644
> > --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> > +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> > @@ -131,6 +131,7 @@ struct ti_csi2rx_dev {
> >       struct v4l2_subdev              *source;
> >       struct v4l2_subdev              subdev;
> >       struct ti_csi2rx_ctx            ctx[TI_CSI2RX_MAX_CTX];
> > +     struct notifier_block           pm_notifier;
> >       u8                              pix_per_clk;
> >       /* Buffer to drain stale data from PSI-L endpoint */
> >       struct {
> > @@ -1550,6 +1551,124 @@ static int ti_csi2rx_runtime_resume(struct devi=
ce *dev)
> >       return 0;
> >  }
> > =20
> > +static int ti_csi2rx_suspend(struct device *dev)
> > +{
> > +     struct ti_csi2rx_dev *csi =3D dev_get_drvdata(dev);
> > +     enum ti_csi2rx_dma_state state;
> > +     struct ti_csi2rx_ctx *ctx;
> > +     struct ti_csi2rx_dma *dma;
> > +     unsigned long flags =3D 0;
> > +     int i, ret =3D 0;
> > +
> > +     /* If device was not in use we can simply suspend */
> > +     if (pm_runtime_status_suspended(dev))
> > +             return 0;
> > +
> > +     /*
> > +      * If device is running, assert the pixel reset to cleanly stop a=
ny
> > +      * on-going streams before we suspend.
> > +      */
> > +     writel(0, csi->shim + SHIM_CNTL);
> > +
> > +     for (i =3D 0; i < csi->num_ctx; i++) {
> > +             ctx =3D &csi->ctx[i];
> > +             dma =3D &ctx->dma;
> > +
> > +             spin_lock_irqsave(&dma->lock, flags);
> > +             state =3D dma->state;
> > +             spin_unlock_irqrestore(&dma->lock, flags);
> > +
> > +             if (state !=3D TI_CSI2RX_DMA_STOPPED) {
> > +                     /* Disable source */
> > +                     ret =3D v4l2_subdev_disable_streams(&csi->subdev,
> > +                                                       TI_CSI2RX_PAD_F=
IRST_SOURCE + ctx->idx,
> > +                                                       BIT(0));
> > +                     if (ret)
> > +                             dev_err(csi->dev, "Failed to stop subdev =
stream\n");
> > +             }
> > +
> > +             /* Stop any on-going streams */
> > +             writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
> > +
> > +             /* Drain DMA */
> > +             ti_csi2rx_drain_dma(ctx);
> > +
> > +             /* Terminate DMA */
> > +             ret =3D dmaengine_terminate_sync(ctx->dma.chan);
> > +             if (ret)
> > +                     dev_err(csi->dev, "Failed to stop DMA\n");
> > +     }
> > +
> > +     return ret;
> > +}
> > +
> > +static int ti_csi2rx_resume(struct device *dev)
> > +{
> > +     struct ti_csi2rx_dev *csi =3D dev_get_drvdata(dev);
> > +     struct ti_csi2rx_ctx *ctx;
> > +     struct ti_csi2rx_dma *dma;
> > +     struct ti_csi2rx_buffer *buf;
> > +     unsigned long flags =3D 0;
> > +     unsigned int reg;
> > +     int i, ret =3D 0;
> > +
> > +     /* If device was not in use, we can simply wakeup */
> > +     if (pm_runtime_status_suspended(dev))
> > +             return 0;
>=20
> Don't we have a streaming-count that would be more intuitive to use as a
> "are we streaming"?

Indeed.

>=20
> And the previous patch said that we lose the DMA channel pairings when
> suspending. Doesn't that happen here?

In the case of system suspend the UDMA driver has (late) hooks that do the
book-keeping of channel configuration and restores it (early) on system
resume.

Thanks,
    Jai
>=20
>  Tomi
>=20
> > +
> > +     /* If device was in use before, restore all the running streams */
> > +     reg =3D SHIM_CNTL_PIX_RST;
> > +     writel(reg, csi->shim + SHIM_CNTL);
> > +
> > +     for (i =3D 0; i < csi->num_ctx; i++) {
> > +             ctx =3D &csi->ctx[i];
> > +             dma =3D &ctx->dma;
> > +             spin_lock_irqsave(&dma->lock, flags);
> > +             if (dma->state !=3D TI_CSI2RX_DMA_STOPPED) {
> > +                     /* Re-submit all previously submitted buffers to =
DMA */
> > +                     list_for_each_entry(buf, &ctx->dma.submitted, lis=
t) {
> > +                             ti_csi2rx_start_dma(ctx, buf);
> > +                     }
> > +                     spin_unlock_irqrestore(&dma->lock, flags);
> > +
> > +                     /* Restore stream config */
> > +                     ti_csi2rx_setup_shim(ctx);
> > +
> > +                     ret =3D v4l2_subdev_enable_streams(&csi->subdev,
> > +                                                      TI_CSI2RX_PAD_FI=
RST_SOURCE + ctx->idx,
> > +                                                      BIT(0));
> > +                     if (ret)
> > +                             dev_err(ctx->csi->dev, "Failed to start s=
ubdev\n");
> > +             } else {
> > +                     spin_unlock_irqrestore(&dma->lock, flags);
> > +             }
> > +     }
> > +
> > +     return ret;
> > +}
> > +
> > +static int ti_csi2rx_pm_notifier(struct notifier_block *nb,
> > +                              unsigned long action, void *data)
> > +{
> > +     struct ti_csi2rx_dev *csi =3D
> > +             container_of(nb, struct ti_csi2rx_dev, pm_notifier);
> > +
> > +     switch (action) {
> > +     case PM_HIBERNATION_PREPARE:
> > +     case PM_SUSPEND_PREPARE:
> > +     case PM_RESTORE_PREPARE:
> > +             ti_csi2rx_suspend(csi->dev);
> > +             break;
> > +     case PM_POST_SUSPEND:
> > +     case PM_POST_HIBERNATION:
> > +     case PM_POST_RESTORE:
> > +             ti_csi2rx_resume(csi->dev);
> > +             break;
> > +     }
> > +
> > +     return NOTIFY_DONE;
> > +}
> > +
> >  static const struct dev_pm_ops ti_csi2rx_pm_ops =3D {
> >       RUNTIME_PM_OPS(ti_csi2rx_runtime_suspend, ti_csi2rx_runtime_resum=
e,
> >                      NULL)
> > @@ -1622,6 +1741,13 @@ static int ti_csi2rx_probe(struct platform_devic=
e *pdev)
> >               goto err_notifier;
> >       }
> > =20
> > +     csi->pm_notifier.notifier_call =3D ti_csi2rx_pm_notifier;
> > +     ret =3D register_pm_notifier(&csi->pm_notifier);
> > +     if (ret) {
> > +             dev_err(csi->dev, "Failed to create PM notifier: %d\n", r=
et);
> > +             goto err_notifier;
> > +     }
> > +
> >       pm_runtime_set_active(csi->dev);
> >       pm_runtime_enable(csi->dev);
> >       pm_request_idle(csi->dev);
> > @@ -1652,6 +1778,8 @@ static void ti_csi2rx_remove(struct platform_devi=
ce *pdev)
> >               ti_csi2rx_cleanup_ctx(&csi->ctx[i]);
> > =20
> >       ti_csi2rx_cleanup_notifier(csi);
> > +     unregister_pm_notifier(&csi->pm_notifier);
> > +
> >       ti_csi2rx_cleanup_v4l2(csi);
> >       mutex_destroy(&csi->mutex);
> >       dma_free_coherent(csi->dev, csi->drain.len, csi->drain.vaddr,
>

