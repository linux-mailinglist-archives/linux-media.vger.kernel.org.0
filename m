Return-Path: <linux-media+bounces-41834-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B222B455E5
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 13:13:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93B827C6307
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 11:13:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 805AC3451BD;
	Fri,  5 Sep 2025 11:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="plCrPNYZ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316F534DCE7;
	Fri,  5 Sep 2025 11:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757070681; cv=none; b=UNHlXLcTpkK3ON9JTrlzFVWbllz8AGDeb2skyt3LKvPLHTaQZh6HaqWPqaRvBbv6aYrD/VPllLjFkFYxbokVevqienQRERKZRNs0cyF2Lg7y2fXms7tSKDDrXJmOFF/A+iTz2FbIJZpZ7DMNsi+mNyjWFTeXEAH8gOrF8aNErso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757070681; c=relaxed/simple;
	bh=Tdmh/rrDhjA6qSA8AQTunmy/z48vnc+TipqIicgz1SU=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=qhlw5QdZQ5RunF4G/CzXLL1dZXJ63mjU/w890m0jtiNKw0m1CeIbyUbzHjYbt3vX7vjK7aZalmENST41XJgHoyUyrsa41xQtxi22H7K7SB+Z+KC2dOxIRfV4VXyIdEnH6K6KLp9ASJUIHn2OMfNMkZxkj9ZeomOShtZDV2DTYVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=plCrPNYZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c67:84a2:d86d:fcf7:24b4:e467])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6AE017F0;
	Fri,  5 Sep 2025 13:10:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757070607;
	bh=Tdmh/rrDhjA6qSA8AQTunmy/z48vnc+TipqIicgz1SU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=plCrPNYZSvWC5/1nqQP6T+WdgFxqfMEvJgUOTN2umt/QyxF86aHD18uKkCxBWdQw8
	 4f5JjnEf3zirwsPCuTlYZS/vUUTWl7XPNL6Z3xbYglaASbIYOqn80vO5JDRwYIj7im
	 WDwJG1Y3VmqKHd7BGcwY39THE1vxzgo3CiDUdu2c=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250825142522.1826188-15-r-donadkar@ti.com>
References: <20250825142522.1826188-1-r-donadkar@ti.com> <20250825142522.1826188-15-r-donadkar@ti.com>
Subject: Re: [PATCH v5 14/14] media: ti: j721e-csi2rx: Wait for the last drain completion
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: r-donadkar@ti.com, y-abhilashchandra@ti.com, devarsht@ti.com, vaishnav.a@ti.com, s-jain1@ti.com, vigneshr@ti.com, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl, tomi.valkeinen@ideasonboard.com, changhuang.liang@starfivetech.com, jack.zhu@starfivetech.com, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org
To: Rishikesh Donadkar <r-donadkar@ti.com>, jai.luthra@linux.dev, laurent.pinchart@ideasonboard.com, mripard@kernel.org
Date: Fri, 05 Sep 2025 16:41:11 +0530
Message-ID: <175707067154.8095.10777597561482124941@freya>
User-Agent: alot/0.12.dev28+gd2c823fe

Quoting Rishikesh Donadkar (2025-08-25 19:55:22)
> dmaengine_terminate_sync() causes all activity for the DMA channel to be
> stopped, and may discard data in the DMA FIFO which hasn't been fully
> transferred. No callback functions will be called for any
> incomplete transfers[1].
>=20
> In multistream use case, calling dmaengine_terminate_sync() immediately
> after issuing the last drain transaction will result in no callback
> for the last drain cycle.
>=20
> Implement complete callback for the last drain cycle to make sure that
> the last drain has completed properly, this will ensure that stale data
> is not left out in the HW FIFO.
>=20
> [1] : https://docs.kernel.org/driver-api/dmaengine/client.html
>=20
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> ---
>  drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/driv=
ers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> index 4ac6a76b9409..520ee05eb5b4 100644
> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> @@ -62,6 +62,7 @@
>  #define TI_CSI2RX_MAX_PADS             (1 + TI_CSI2RX_MAX_SOURCE_PADS)
> =20
>  #define DRAIN_BUFFER_SIZE              SZ_32K
> +#define DRAIN_TIMEOUT_MS               50

This was dropped in the previous patch, and now reintroduce.

IIUC this patch is fixing a bug introduced by the previous one, so it's
better to squash them together, and have a combined commit description that
goes over this end-of-stream case, as well as why continuous drain was
needed for mid-stream scenario.

> =20
>  #define CSI2RX_BRIDGE_SOURCE_PAD       1
> =20
> @@ -137,6 +138,7 @@ struct ti_csi2rx_dev {
>                 size_t                  len;
>         } drain;
>         bool                            vc_cached;
> +       struct completion drain_complete;

Why is the struct completion shared amongst all contexts in the
ti_csi2rx_dev structure?

What happens when two streams are stopped together?

>  };
> =20
>  static inline struct ti_csi2rx_dev *to_csi2rx_dev(struct v4l2_subdev *sd)
> @@ -624,12 +626,14 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_c=
tx *ctx)
>  static void ti_csi2rx_drain_callback(void *param)
>  {
>         struct ti_csi2rx_ctx *ctx =3D param;
> +       struct ti_csi2rx_dev *csi =3D ctx->csi;
>         struct ti_csi2rx_dma *dma =3D &ctx->dma;
>         unsigned long flags;
> =20
>         spin_lock_irqsave(&dma->lock, flags);
> =20
>         if (dma->state =3D=3D TI_CSI2RX_DMA_STOPPED) {
> +               complete(&csi->drain_complete);

Please also add comment above this if case explaining why we need to wait
for the drain to complete when dma->state =3D=3D STOPPED, which is set by t=
he
driver elsewhere when streamoff was requested, and no more data will be
coming in from the source.

>                 spin_unlock_irqrestore(&dma->lock, flags);
>                 return;
>         }
> @@ -774,6 +778,7 @@ static int ti_csi2rx_start_dma(struct ti_csi2rx_ctx *=
ctx,
>  static void ti_csi2rx_stop_dma(struct ti_csi2rx_ctx *ctx)
>  {
>         struct ti_csi2rx_dma *dma =3D &ctx->dma;
> +       struct ti_csi2rx_dev *csi =3D ctx->csi;
>         enum ti_csi2rx_dma_state state;
>         unsigned long flags;
>         int ret;
> @@ -783,6 +788,8 @@ static void ti_csi2rx_stop_dma(struct ti_csi2rx_ctx *=
ctx)
>         dma->state =3D TI_CSI2RX_DMA_STOPPED;
>         spin_unlock_irqrestore(&dma->lock, flags);
> =20
> +       init_completion(&csi->drain_complete);
> +
>         if (state !=3D TI_CSI2RX_DMA_STOPPED) {
>                 /*
>                  * Normal DMA termination does not clean up pending data =
on
> @@ -796,6 +803,10 @@ static void ti_csi2rx_stop_dma(struct ti_csi2rx_ctx =
*ctx)
>                                  "Failed to drain DMA. Next frame might b=
e bogus\n");
>         }
> =20
> +       if (!wait_for_completion_timeout(&csi->drain_complete,
> +                                        msecs_to_jiffies(DRAIN_TIMEOUT_M=
S)))
> +               dev_dbg(csi->dev, "DMA transfer timed out for drain buffe=
r\n");
> +
>         ret =3D dmaengine_terminate_sync(ctx->dma.chan);
>         if (ret)
>                 dev_err(ctx->csi->dev, "Failed to stop DMA: %d\n", ret);
> --=20
> 2.34.1
>

Thanks,
    Jai

