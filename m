Return-Path: <linux-media+bounces-36388-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 16698AEF08D
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 10:10:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7674C1BC3A5A
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 08:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 059442698AE;
	Tue,  1 Jul 2025 08:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sjoerd@collabora.com header.b="CEwRl1S/"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5AA26A1C4;
	Tue,  1 Jul 2025 08:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751357434; cv=pass; b=jBeh4Vxm8c+dVn7A2ebBjr5euAhU9Ub6eBpQq4Hpywuq6d9QbKGLXEGCOPQTWSWWc5ENM2Y6gpawVJ2XHJN1KZlFkgutD698iyeq8jZAefWfj7uMA8N0JhkgnNoJrUCAsbROVldqTlYWRhxqdNZtf59xNSun1lpfGl5aZwfOrVM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751357434; c=relaxed/simple;
	bh=FmbvPSfq2h3/miVw2Ia9z7emMBNvSwQsnVph+ENro/I=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NQyExS6EQD2K7a3PLaokXgO9VIWZH7DD6W3QSvM+JmEadu9zvKUrkJBNbJAYiEte8FMN9bNhmJQp70KA1HkEZxcAi8h4v3KRVak5i0yDvfmMxBkW0MNChMqu+N290cPkRQwE0SaxlcC1RnNMejfE01lxZ3jYAYrnAaFBSjGQz6c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sjoerd@collabora.com header.b=CEwRl1S/; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1751357386; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NsNPod/rgbsI8etHvV0H9s0eMrCC/J2cbSS4S8fF/5nsovJflukEmqAYheJfelsIP9BWe5gr+C1i/2q2Vc7FS6PXryS49tcV+n9GwB/pg0aQ9WFQyS+/5Fis+dqlE9Nj5PIwvd/5pX9WXjt+CgZ8Q0bqGfbNvGPHf4vg/Ea6408=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751357386; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=K4dZn3NVcIpGzrcKLP4sLnB7bPgQrfNojFnFyr8sESg=; 
	b=KckBD0XaJ0B4O1uPqqsKmddpOoqY/s6X6uETq3rEfcNhXQTf3VlkZCnQKIlklePwuLPC4izIjcF2nFAYFfDfLOmEjGdkIt4rAhdYOwS6x9gGqreRTI1kzxYPvO4xoacgvZ920TQQ2AxHnrnWQpsqwYOWhNmzcX/Wle5+EgUDydM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sjoerd@collabora.com;
	dmarc=pass header.from=<sjoerd@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751357386;
	s=zohomail; d=collabora.com; i=sjoerd@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=K4dZn3NVcIpGzrcKLP4sLnB7bPgQrfNojFnFyr8sESg=;
	b=CEwRl1S/yF6Q0GCS6KBd50fV9lOKsJp3NnCBRbtaTD2N/6St+xsbXXSGFIXDNn23
	o+feq0345bK7zuHJI1MR8KmKxRzyYcDqLhlKSi3q+toQbgdXV7GUoGZY4xBmHmDqAfJ
	Xq3vh6RN9qTQVru33omY7yilCp2q8eUoF8bZ0nuw=
Received: by mx.zohomail.com with SMTPS id 1751357383778894.2496083182277;
	Tue, 1 Jul 2025 01:09:43 -0700 (PDT)
Message-ID: <ab421c6f9fc804a6f03833d824d5776c7272e6bb.camel@collabora.com>
Subject: Re: [PATCH v4 11/12] media: ti: j721e-csi2rx: Submit all available
 buffers
From: Sjoerd Simons <sjoerd@collabora.com>
To: Rishikesh Donadkar <r-donadkar@ti.com>, jai.luthra@linux.dev, 
	laurent.pinchart@ideasonboard.com, mripard@kernel.org, Julien Massot
	 <jmassot@collabora.com>
Cc: y-abhilashchandra@ti.com, devarsht@ti.com, vaishnav.a@ti.com,
 s-jain1@ti.com, 	vigneshr@ti.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, 	conor+dt@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil-cisco@xs4all.nl, 	tomi.valkeinen@ideasonboard.com,
 jai.luthra@ideasonboard.com, 	changhuang.liang@starfivetech.com,
 jack.zhu@starfivetech.com, 	linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, 	devicetree@vger.kernel.org, "Liu (EP), Bin"
 <b-liu@ti.com>
Date: Tue, 01 Jul 2025 10:09:38 +0200
In-Reply-To: <20250514112527.1983068-12-r-donadkar@ti.com>
References: <20250514112527.1983068-1-r-donadkar@ti.com>
	 <20250514112527.1983068-12-r-donadkar@ti.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ZohoMailClient: External

Hey,

On Wed, 2025-05-14 at 16:55 +0530, Rishikesh Donadkar wrote:
> From: Jai Luthra <j-luthra@ti.com>
>=20
> We already make sure to submit all available buffers to DMA in each DMA
> completion callback.
>=20
> Move that logic in a separate function, and use it during stream start
> as well, as most application queue all their buffers before stream on.
>=20
> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> ---
> =C2=A0.../platform/ti/j721e-csi2rx/j721e-csi2rx.c=C2=A0=C2=A0 | 43 ++++++=
+++++--------
> =C2=A01 file changed, 24 insertions(+), 19 deletions(-)
>=20
> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> index 7986f96c5e11b..ba2a30bfed37d 100644
> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> @@ -651,6 +651,27 @@ static int ti_csi2rx_drain_dma(struct ti_csi2rx_ctx =
*ctx)
> =C2=A0	return ret;
> =C2=A0}
> =C2=A0
> +static int ti_csi2rx_dma_submit_pending(struct ti_csi2rx_ctx *ctx)
> +{
> +	struct ti_csi2rx_dma *dma =3D &ctx->dma;
> +	struct ti_csi2rx_buffer *buf;
> +	int ret =3D 0;
> +
> +	/* If there are more buffers to process then start their transfer. */
> +	while (!list_empty(&dma->queue)) {
> +		buf =3D list_entry(dma->queue.next, struct ti_csi2rx_buffer,
> list);
> +		ret =3D ti_csi2rx_start_dma(ctx, buf);
> +		if (ret) {
> +			dev_err(ctx->csi->dev,
> +				"Failed to queue the next buffer for DMA\n");
> +			vb2_buffer_done(&buf->vb.vb2_buf,
> VB2_BUF_STATE_ERROR);
> +			break;

The break here seems wrong and does change the previous logic; It means onc=
e *a*
buffer fails to start DMA, you'll no longer try to submit the other (queued=
)
buffers. If this was called from the DMA callback of the last submitted buf=
fer
and userspace doesn't re-queue the error buffer, then capturing will stop, =
even
if there were still queued up buffers from a userspace pov.


For a potential next iteration you probably also want to wrap in the change=
s
from to fix list_del corruption:
https://lore.kernel.org/all/20250630-j721e-dma-fixup-v1-1-591e378ab3a8@coll=
abora.com/



> +		}
> +		list_move_tail(&buf->list, &dma->submitted);
> +	}
> +	return ret;
> +}
> +
> =C2=A0static void ti_csi2rx_dma_callback(void *param)
> =C2=A0{
> =C2=A0	struct ti_csi2rx_buffer *buf =3D param;
> @@ -671,18 +692,7 @@ static void ti_csi2rx_dma_callback(void *param)
> =C2=A0	vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
> =C2=A0	list_del(&buf->list);
> =C2=A0
> -	/* If there are more buffers to process then start their transfer. */
> -	while (!list_empty(&dma->queue)) {
> -		buf =3D list_entry(dma->queue.next, struct ti_csi2rx_buffer,
> list);
> -
> -		if (ti_csi2rx_start_dma(ctx, buf)) {
> -			dev_err(ctx->csi->dev,
> -				"Failed to queue the next buffer for DMA\n");
> -			vb2_buffer_done(&buf->vb.vb2_buf,
> VB2_BUF_STATE_ERROR);
> -		} else {
> -			list_move_tail(&buf->list, &dma->submitted);
> -		}
> -	}
> +	ti_csi2rx_dma_submit_pending(ctx);
> =C2=A0
> =C2=A0	if (list_empty(&dma->submitted))
> =C2=A0		dma->state =3D TI_CSI2RX_DMA_IDLE;
> @@ -941,7 +951,6 @@ static int ti_csi2rx_start_streaming(struct vb2_queue=
 *vq,
> unsigned int count)
> =C2=A0	struct ti_csi2rx_ctx *ctx =3D vb2_get_drv_priv(vq);
> =C2=A0	struct ti_csi2rx_dev *csi =3D ctx->csi;
> =C2=A0	struct ti_csi2rx_dma *dma =3D &ctx->dma;
> -	struct ti_csi2rx_buffer *buf;
> =C2=A0	unsigned long flags;
> =C2=A0	int ret =3D 0;
> =C2=A0
> @@ -980,16 +989,13 @@ static int ti_csi2rx_start_streaming(struct vb2_que=
ue
> *vq, unsigned int count)
> =C2=A0	ctx->sequence =3D 0;
> =C2=A0
> =C2=A0	spin_lock_irqsave(&dma->lock, flags);
> -	buf =3D list_entry(dma->queue.next, struct ti_csi2rx_buffer, list);
> =C2=A0
> -	ret =3D ti_csi2rx_start_dma(ctx, buf);
> +	ret =3D ti_csi2rx_dma_submit_pending(ctx);
> =C2=A0	if (ret) {
> -		dev_err(csi->dev, "Failed to start DMA: %d\n", ret);
> =C2=A0		spin_unlock_irqrestore(&dma->lock, flags);
> -		goto err_pipeline;
> +		goto err_dma;
> =C2=A0	}
> =C2=A0
> -	list_move_tail(&buf->list, &dma->submitted);
> =C2=A0	dma->state =3D TI_CSI2RX_DMA_ACTIVE;
> =C2=A0	spin_unlock_irqrestore(&dma->lock, flags);
> =C2=A0
> @@ -1004,7 +1010,6 @@ static int ti_csi2rx_start_streaming(struct vb2_que=
ue
> *vq, unsigned int count)
> =C2=A0
> =C2=A0err_dma:
> =C2=A0	ti_csi2rx_stop_dma(ctx);
> -err_pipeline:
> =C2=A0	video_device_pipeline_stop(&ctx->vdev);
> =C2=A0	writel(0, csi->shim + SHIM_CNTL);
> =C2=A0	writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));

