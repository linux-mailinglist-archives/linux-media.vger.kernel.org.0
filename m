Return-Path: <linux-media+bounces-31056-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AB0A9C7B9
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 13:36:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 353844C1E2E
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 11:36:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B913C243364;
	Fri, 25 Apr 2025 11:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="GbTttXX/"
X-Original-To: linux-media@vger.kernel.org
Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B421C7019
	for <linux-media@vger.kernel.org>; Fri, 25 Apr 2025 11:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745580972; cv=none; b=S9YNMq92wLRztVQNQEOXy2Y9b+k+k1HCyTwPlqWT05MA2CtQ049FKwCclU+QJybxhElcA2T1Z9LU1p0IjeNByZdjDIgTIfYDaTwgJINCM2VygoSs6bMNyTRss+ZL/NRyse6ugmLCni0mH1UmPOC1DjWx03NALZHUMBXRsw+y6AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745580972; c=relaxed/simple;
	bh=ectO4fwhjO+/xJg06cgXt40EEqO+yG3Xo8g4Thu3QMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bw2Bq+ZwWOITGOh9omKpign/AmsreHp8J+HVvF9q/dVoDmRvSztKmqXSOYCumKchBhd9rxQGupblnaarJUeHOCYtRPUnKCbLOQsdkNtoQPepRyY1wh4VtxjrjbguzrCm4nUjfITdDR/yuO3tQ3V+ipuE2mCMGZNEDtXorbzTEAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=GbTttXX/; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Fri, 25 Apr 2025 17:05:46 +0530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745580956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bVKei5aVMPfJlUQVkr0Ho/XvVolQTZAT0nof14LXCKA=;
	b=GbTttXX/rnh4YxvlzOcmfUhkDItOdL6++qu/CHSKLzvBg56GF8hDNnAC92AngRb9/m1GhB
	UVN6oOMGDWTdor5+C6NyevqwLt1MpbYHS0pjARU2JvSDw0Wc4X6eAREdAr4h+ceHSzbF44
	IiewGUFhTgBr9SKd+6NrR4fxX+ZdZyo=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Jai Luthra <jai.luthra@linux.dev>
To: Rishikesh Donadkar <r-donadkar@ti.com>
Cc: mripard@kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, devarsht@ti.com, 
	y-abhilashchandra@ti.com, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, vaishnav.a@ti.com, s-jain1@ti.com, vigneshr@ti.com, 
	sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl, tomi.valkeinen@ideasonboard.com, 
	jai.luthra@ideasonboard.com, changhuang.liang@starfivetech.com, jack.zhu@starfivetech.com, 
	laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v3 13/13] media: ti: j721e-csi2rx: Change the drain
 architecture for multistream
Message-ID: <5zz3ojgkk6uggx5moglrwn44g7vdnraa4skqkxt4k6pjvta4lh@oproxefudzrt>
X-PGP-Key: http://jailuthra.in/files/public-key.asc
References: <20250417065554.437541-1-r-donadkar@ti.com>
 <20250417065554.437541-14-r-donadkar@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gvy5bgo5bv6kbv5p"
Content-Disposition: inline
In-Reply-To: <20250417065554.437541-14-r-donadkar@ti.com>
X-Migadu-Flow: FLOW_OUT


--gvy5bgo5bv6kbv5p
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 13/13] media: ti: j721e-csi2rx: Change the drain
 architecture for multistream
MIME-Version: 1.0

Hi Rishikesh,

Thanks for the patch.

On Thu, Apr 17, 2025 at 12:25:54PM +0530, Rishikesh Donadkar wrote:
> In Multistream use cases, we may face buffer starvation due to various
> reasons like slow downstream element in gstreamer pipeline. In these
> scenarios we need to make sure that the data corresponding to the slow
> pipeline is pulled out of the shared HW FIFO in CSI2RX IP to prevent
> other streams to get stalled due to FIFO overflow.
>=20
> Previously, in case of buffer starvation, dma was marked IDLE and the
> next buffer_queue() would drain the data before marking new buffer ready
> for DMA transaction. Here the driver waits for the next VIDIOC_QBUF
> ioctl callback to drain the stale data from the HW FIFO, if there is a
> delay in this callback being called, HW FIFO will overflow leading all
> the other camera pipelines in the media graph to hang.

The above description is a little hard to follow, and not correct. A "late"=
=20
QBUF callback is what buffer starvation *is*. With single-stream scenarios =
the=20
older drain architecture worked fine, as the goal there was to drain out st=
ale=20
data in the FIFOs when buffers are available again.

>=20
> Introduce a new architecture where, CSI data is always pulled out of
> the shared HW FIFO irrespective of the availability of buffers from
> userspace.

I think this description does not make it very clear why multiple streams=
=20
(VCs) cause the older drain architecture to not work, and what exactly is t=
he=20
limitation in the hardware FIFOs.

How about the following instead:

    On buffer starvation the DMA is marked IDLE, and the stale data in the=
=20
    internal FIFOs gets drained only on the next VIDIOC_QBUF call from the=
=20
    userspace. This approach works fine for a single stream case.

    But in multistream scenarios, buffer starvation for one stream i.e. one=
=20
    virtual channel, can block the shared HW FIFO of the CSI2RX IP. This ca=
n=20
    stall the pipeline for all other virtual channels, even if buffers are=
=20
    available for them.

    This patch introduces a new architecture, that continuously drains data=
=20
    from the shared HW FIFO into a small (32KiB) buffer if no buffers are m=
ade=20
    available to the driver from the userspace. This ensures independence=
=20
    between different streams, where a slower downstream element for one=20
    camera does not block streaming for other cameras.

>=20
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> ---
>  .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 96 +++++++------------
>  1 file changed, 33 insertions(+), 63 deletions(-)
>=20
> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/driv=
ers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> index 23d63d8bcd36a..7f476c78c4a92 100644
> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> @@ -57,7 +57,6 @@
>  #define TI_CSI2RX_MAX_SOURCE_PADS	TI_CSI2RX_MAX_CTX
>  #define TI_CSI2RX_MAX_PADS		(1 + TI_CSI2RX_MAX_SOURCE_PADS)
> =20
> -#define DRAIN_TIMEOUT_MS		50
>  #define DRAIN_BUFFER_SIZE		SZ_32K

As you are draining 32KiB chunks, it is likely that the hardware is in the=
=20
middle of a frame when the userspace queues a new buffer and you stop=20
draining, and change the target address to a user-facing buffer. How does t=
he=20
PSIL/DMA engine handle the SoF/EoF boundaries in such a case?

Would it be possible for you to verify if the first user-facing buffer afte=
r=20
draining has valid data? And if not, please highlight it so it may get fixe=
d=20
in the future.

> =20
>  struct ti_csi2rx_fmt {
> @@ -77,7 +76,6 @@ struct ti_csi2rx_buffer {
> =20
>  enum ti_csi2rx_dma_state {
>  	TI_CSI2RX_DMA_STOPPED,	/* Streaming not started yet. */
> -	TI_CSI2RX_DMA_IDLE,	/* Streaming but no pending DMA operation. */
>  	TI_CSI2RX_DMA_ACTIVE,	/* Streaming and pending DMA operation. */
>  };
> =20
> @@ -238,6 +236,10 @@ static const struct ti_csi2rx_fmt ti_csi2rx_formats[=
] =3D {
>  static int ti_csi2rx_start_dma(struct ti_csi2rx_ctx *ctx,
>  			       struct ti_csi2rx_buffer *buf);
> =20
> +/* Forward declarations needed by ti_csi2rx_drain_callback. */
> +static int ti_csi2rx_drain_dma(struct ti_csi2rx_ctx *ctx);
> +static int ti_csi2rx_dma_submit_pending(struct ti_csi2rx_ctx *ctx);
> +
>  static const struct ti_csi2rx_fmt *find_format_by_fourcc(u32 pixelformat)
>  {
>  	unsigned int i;
> @@ -589,9 +591,28 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_ct=
x *ctx)
> =20
>  static void ti_csi2rx_drain_callback(void *param)
>  {
> -	struct completion *drain_complete =3D param;
> +	struct ti_csi2rx_ctx *ctx =3D param;
> +	struct ti_csi2rx_dma *dma =3D &ctx->dma;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&dma->lock, flags);
> =20
> -	complete(drain_complete);
> +	if (dma->state =3D=3D TI_CSI2RX_DMA_STOPPED) {
> +		spin_unlock_irqrestore(&dma->lock, flags);
> +		return;
> +	}
> +
> +	/*
> +	 * If dma->queue is empty, it signals no buffer has arrived from
> +	 * user space, so, queue more transaction to drain dma
> +	 */
> +	if (list_empty(&dma->queue)) {
> +		if (ti_csi2rx_drain_dma(ctx))
> +			dev_warn(ctx->csi->dev, "DMA drain failed\n");
> +	} else {
> +		ti_csi2rx_dma_submit_pending(ctx);
> +	}
> +	spin_unlock_irqrestore(&dma->lock, flags);
>  }
> =20
>  /*
> @@ -609,12 +630,9 @@ static int ti_csi2rx_drain_dma(struct ti_csi2rx_ctx =
*ctx)
>  {
>  	struct ti_csi2rx_dev *csi =3D ctx->csi;
>  	struct dma_async_tx_descriptor *desc;
> -	struct completion drain_complete;
>  	dma_cookie_t cookie;
>  	int ret;
> =20
> -	init_completion(&drain_complete);
> -
>  	desc =3D dmaengine_prep_slave_single(ctx->dma.chan, csi->drain.paddr,
>  					   csi->drain.len, DMA_DEV_TO_MEM,
>  					   DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
> @@ -624,7 +642,7 @@ static int ti_csi2rx_drain_dma(struct ti_csi2rx_ctx *=
ctx)
>  	}
> =20
>  	desc->callback =3D ti_csi2rx_drain_callback;
> -	desc->callback_param =3D &drain_complete;
> +	desc->callback_param =3D ctx;
> =20
>  	cookie =3D dmaengine_submit(desc);
>  	ret =3D dma_submit_error(cookie);
> @@ -633,13 +651,6 @@ static int ti_csi2rx_drain_dma(struct ti_csi2rx_ctx =
*ctx)
> =20
>  	dma_async_issue_pending(ctx->dma.chan);
> =20
> -	if (!wait_for_completion_timeout(&drain_complete,
> -					 msecs_to_jiffies(DRAIN_TIMEOUT_MS))) {
> -		dmaengine_terminate_sync(ctx->dma.chan);
> -		dev_dbg(csi->dev, "DMA transfer timed out for drain buffer\n");
> -		ret =3D -ETIMEDOUT;
> -		goto out;
> -	}
>  out:
>  	return ret;
>  }
> @@ -687,9 +698,11 @@ static void ti_csi2rx_dma_callback(void *param)
> =20
>  	ti_csi2rx_dma_submit_pending(ctx);
> =20
> -	if (list_empty(&dma->submitted))
> -		dma->state =3D TI_CSI2RX_DMA_IDLE;
> -
> +	if (list_empty(&dma->submitted)) {
> +		if (ti_csi2rx_drain_dma(ctx))
> +			dev_warn(ctx->csi->dev,
> +				"DMA drain failed on one of the transactions\n");

Checkpatch warning here:

CHECK: Alignment should match open parenthesis
#138: FILE: drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c:704:
+			dev_warn(ctx->csi->dev,
+				"DMA drain failed on one of the transactions\n");

total: 0 errors, 0 warnings, 1 checks, 167 lines checked

> +	}
>  	spin_unlock_irqrestore(&dma->lock, flags);
>  }
> =20
> @@ -742,7 +755,7 @@ static void ti_csi2rx_stop_dma(struct ti_csi2rx_ctx *=
ctx)
>  		 * enforced before terminating DMA.
>  		 */
>  		ret =3D ti_csi2rx_drain_dma(ctx);
> -		if (ret && ret !=3D -ETIMEDOUT)
> +		if (ret)
>  			dev_warn(ctx->csi->dev,
>  				 "Failed to drain DMA. Next frame might be bogus\n");
>  	}
> @@ -809,57 +822,14 @@ static void ti_csi2rx_buffer_queue(struct vb2_buffe=
r *vb)
>  	struct ti_csi2rx_ctx *ctx =3D vb2_get_drv_priv(vb->vb2_queue);
>  	struct ti_csi2rx_buffer *buf;
>  	struct ti_csi2rx_dma *dma =3D &ctx->dma;
> -	bool restart_dma =3D false;
>  	unsigned long flags =3D 0;
> -	int ret;
> =20
>  	buf =3D container_of(vb, struct ti_csi2rx_buffer, vb.vb2_buf);
>  	buf->ctx =3D ctx;
> =20
>  	spin_lock_irqsave(&dma->lock, flags);
> -	/*
> -	 * Usually the DMA callback takes care of queueing the pending buffers.
> -	 * But if DMA has stalled due to lack of buffers, restart it now.
> -	 */
> -	if (dma->state =3D=3D TI_CSI2RX_DMA_IDLE) {
> -		/*
> -		 * Do not restart DMA with the lock held because
> -		 * ti_csi2rx_drain_dma() might block for completion.
> -		 * There won't be a race on queueing DMA anyway since the
> -		 * callback is not being fired.
> -		 */
> -		restart_dma =3D true;
> -		dma->state =3D TI_CSI2RX_DMA_ACTIVE;
> -	} else {
> -		list_add_tail(&buf->list, &dma->queue);
> -	}
> +	list_add_tail(&buf->list, &dma->queue);
>  	spin_unlock_irqrestore(&dma->lock, flags);
> -
> -	if (restart_dma) {
> -		/*
> -		 * Once frames start dropping, some data gets stuck in the DMA
> -		 * pipeline somewhere. So the first DMA transfer after frame
> -		 * drops gives a partial frame. This is obviously not useful to
> -		 * the application and will only confuse it. Issue a DMA
> -		 * transaction to drain that up.
> -		 */
> -		ret =3D ti_csi2rx_drain_dma(ctx);
> -		if (ret && ret !=3D -ETIMEDOUT)
> -			dev_warn(ctx->csi->dev,
> -				 "Failed to drain DMA. Next frame might be bogus\n");
> -
> -		spin_lock_irqsave(&dma->lock, flags);
> -		ret =3D ti_csi2rx_start_dma(ctx, buf);
> -		if (ret) {
> -			vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
> -			dma->state =3D TI_CSI2RX_DMA_IDLE;
> -			spin_unlock_irqrestore(&dma->lock, flags);
> -			dev_err(ctx->csi->dev, "Failed to start DMA: %d\n", ret);
> -		} else {
> -			list_add_tail(&buf->list, &dma->submitted);
> -			spin_unlock_irqrestore(&dma->lock, flags);
> -		}
> -	}
>  }
> =20
>  static int ti_csi2rx_get_vc(struct ti_csi2rx_ctx *ctx)
> --=20
> 2.34.1
>=20

Thanks,
Jai

--gvy5bgo5bv6kbv5p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmgLc5IACgkQQ96R+SSa
cUWlPxAAqmWJq/5qoPrmSaLEA7yWzJlMugFolYdVzSIzvY1oLfNyo1HIvgT+6WM3
oIgDrzneIKUm6FbKjeESvrFmM2N5yiuIR5uKzaCGjKTnKB9RG+Fn/8li6nOMMf+K
GkoPu9CRQFVGruPux1HlOlnvOHPr1MSwcrE4yy3J1PtQnaGpCmDgGm1hTh02JCUt
UaurPqNSKywH9saAwIKIOp8EiWGV9N5zdFVB1a9qv5nrVSdXrL43VSwZm4OXYLZl
iuMh0eqvqHZsxHl5Q4I4GpPPKTtDvi+WsnE/PAr03+et5u1egJy7HQZK+Hqm0PzW
Zekl4qsh9R54laOif3GN4YTbPRYnnntzj+fB8Bu6Wq3+JwYIrXr0UqODEMDlRxsO
1PsZLkeVoU/401XZ4212AH5QuHNDxwOxhxDmGLBYWzVugy7Flkjf2L0xkj3IAE04
/j9zLTuuR84FQlZxOFoD4ovc8QT7FVSlfDXyDYM/0BDEtoJyL8GB3UtqgLVbgtk8
QuxDkLPGGA9PpSb9KyQ1Jk8bi9L95Mv+47VnBXXLz5JLopft3qOJddJ3TacufNCi
/rROUyCYTRvrxkUogzbKHKXplB/6+GO8lswQvwOrdnMnYSM/5Cd0ytxFbRBmOzV1
UfRe5z7F/UyV8dZG8fz1YodusmFFqporUcOafxvyPttDALELyUU=
=Rr94
-----END PGP SIGNATURE-----

--gvy5bgo5bv6kbv5p--

