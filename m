Return-Path: <linux-media+bounces-50010-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA8FCF7FE5
	for <lists+linux-media@lfdr.de>; Tue, 06 Jan 2026 12:16:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7086A3034919
	for <lists+linux-media@lfdr.de>; Tue,  6 Jan 2026 11:16:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 735E4326928;
	Tue,  6 Jan 2026 11:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tqdWmJiL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1BE2171CD;
	Tue,  6 Jan 2026 11:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767698164; cv=none; b=JqkpYzHkNSwx/X/ZwCj1jyIuxz2a0KKI3j/wPtBbUwA4O4I5TXtZ7dB/GQSwwznWMyuzqDyDjDE2rBboaYXo6TZcIqjT/8/6ytMw4xEdc+2b7wuG9zRTNuhiuD8mKtSyeuB8aD2BtVA1fzwydgjiRXzQZ1Nauilp6mMphcW7FAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767698164; c=relaxed/simple;
	bh=iMxoVRYUh5YVtvzHtfEiTB4hVe8VPcZRj/5+KAOXQyY=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=SlgU5opBNXjyxy4Rr8z+/m01OgoGC/XC2iOAiydxaaQS7I/2sRHYN2Kmin/z/ops7j4eyJ5flCdunpPXHsFO3ViHegvhVB36iYxLWa5hRZsYwxpnDiQNQJSRoSkb1LwYhJSIFmSG0kXGL6CXky6WLBPoHoWuLVLsRYSYyJ77F3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tqdWmJiL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:7a27:be73:8a11:8e2e:dcd3])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A9D4778E;
	Tue,  6 Jan 2026 12:15:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1767698137;
	bh=iMxoVRYUh5YVtvzHtfEiTB4hVe8VPcZRj/5+KAOXQyY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=tqdWmJiLwe/4UEkoZyM0JQs1GhesQldXFBpCrKpzSXF0tjsNDAWHnPRZw7BdDFcay
	 mj0obG3g4JgFsZnAw3ffqhwEYw/V59Jj7hGzmIOdZSOHERDrosXbfcr2VJOQy56jTf
	 BLSO1izDDfet+TtApv/TsB9O/9+M+T0bQa1Dvbtg=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251230083220.2405247-17-r-donadkar@ti.com>
References: <20251230083220.2405247-1-r-donadkar@ti.com> <20251230083220.2405247-17-r-donadkar@ti.com>
Subject: Re: [PATCH v9 16/19] media: ti: j721e-csi2rx: Return the partial frame as error
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: r-donadkar@ti.com, y-abhilashchandra@ti.com, devarsht@ti.com, s-jain1@ti.com, vigneshr@ti.com, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, p.zabel@pengutronix.de, conor+dt@kernel.org, sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl, tomi.valkeinen@ideasonboard.com, changhuang.liang@starfivetech.com, jack.zhu@starfivetech.com, sjoerd@collabora.com, dan.carpenter@linaro.org, hverkuil+cisco@kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org
To: Rishikesh Donadkar <r-donadkar@ti.com>, jai.luthra@linux.dev, laurent.pinchart@ideasonboard.com, mripard@kernel.org
Date: Tue, 06 Jan 2026 16:45:52 +0530
Message-ID: <176769815259.1604677.2330177800630667072@freya>
User-Agent: alot/0.12.dev62+gb9d6144a6

Hi Rishikesh,

Quoting Rishikesh Donadkar (2025-12-30 14:02:17)
> After draining, when a buffer is queued to the driver, ti will fill out
> the buffer with a partial frame as some part of the frame is drained.
> Return the partial frame with VB2_BUF_STATE_ERROR.

This should be squashed with the previous patch which changes the drain
architecture and leads to the partial frames. So for the combined patch:

Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>

>=20
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> ---
>  drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/driv=
ers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> index e713293696eb1..3922bd67e78da 100644
> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> @@ -83,6 +83,7 @@ struct ti_csi2rx_buffer {
>  enum ti_csi2rx_dma_state {
>         TI_CSI2RX_DMA_STOPPED,  /* Streaming not started yet. */
>         TI_CSI2RX_DMA_ACTIVE,   /* Streaming and pending DMA operation. */
> +       TI_CSI2RX_DMA_DRAINING, /* Dumping all the data in drain buffer */
>  };
> =20
>  struct ti_csi2rx_dma {
> @@ -728,12 +729,20 @@ static void ti_csi2rx_dma_callback(void *param)
>         spin_lock_irqsave(&dma->lock, flags);
> =20
>         WARN_ON(!list_is_first(&buf->list, &dma->submitted));
> -       vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
> +
> +       if (dma->state =3D=3D TI_CSI2RX_DMA_DRAINING) {
> +               vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
> +               dma->state =3D TI_CSI2RX_DMA_ACTIVE;
> +       } else {
> +               vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
> +       }
> +
>         list_del(&buf->list);
> =20
>         ti_csi2rx_dma_submit_pending(ctx);
> =20
>         if (list_empty(&dma->submitted)) {
> +               dma->state =3D TI_CSI2RX_DMA_DRAINING;
>                 if (ti_csi2rx_drain_dma(ctx))
>                         dev_warn(ctx->csi->dev,
>                                  "DMA drain failed on one of the transact=
ions\n");
> --=20
> 2.34.1
>=20
>

