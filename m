Return-Path: <linux-media+bounces-35842-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCA5AE7456
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 03:34:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F072A3BC4E9
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 01:33:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99DD317A2E3;
	Wed, 25 Jun 2025 01:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JqTerPlC"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C6F86338;
	Wed, 25 Jun 2025 01:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750815244; cv=none; b=r+h2kwMLBlz2KhE6mbjBcogXzYDEJXbSi0tHMScjxqMyvJjFye8x9MJ9risuhZGj3orBs0JflaYMBavute46VNjDXD8oHK3RrqPEzDd5U0+EXqeNlNfweqbG8cL32qxLGncMiCKWugV5mZoyhNUHAUenKDXsGQg486gWVwS7Cck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750815244; c=relaxed/simple;
	bh=jCiYhVobIE8vru8xScAz++vjjNziaIN1FPr6ZOLizAo=;
	h=Content-Type:MIME-Version:Content-Disposition:In-Reply-To:
	 References:Subject:From:Cc:To:Date:Message-ID; b=m+x/YNq/eFZU1HgjPB/2BjDKf8maIoe72944GHzOdWxA/s3/8ZAe2kUS6pho67KEEP2G6m2xSmqwtOPcahvgqdpAs9DoKk2xgepx9KdXo2INBoncnvNk/qUjYH9t2n+Eqe0WL73y9GtP/kB8MKVHrUXBxk4OHC4EuYwLSiiC7ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JqTerPlC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2601:602:8100:c320::cf66])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DCD9FD77;
	Wed, 25 Jun 2025 03:33:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750815222;
	bh=jCiYhVobIE8vru8xScAz++vjjNziaIN1FPr6ZOLizAo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=JqTerPlCF5iHX4/tvbpy8jtA1WZpDflNn/xw4hVyNykIBUC4hDlNxbg8ETOqu3edB
	 OSSH5WGpQO07g+JLKUpveY5ZfS2pDdsXQoLZUKdI8TaSxjkR8QGMNdTYmxOrwLLvxt
	 +qCy6aHE2FCPIu/AHjxOHFWHDjLbs4dfMN/6EloI=
Content-Type: multipart/signed; micalg="pgp-sha512"; protocol="application/pgp-signature"; boundary="===============5002358159074849269=="
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250514112527.1983068-13-r-donadkar@ti.com>
References: <20250514112527.1983068-1-r-donadkar@ti.com> <20250514112527.1983068-13-r-donadkar@ti.com>
Subject: Re: [PATCH v4 12/12] media: ti: j721e-csi2rx: Change the drain architecture for multistream
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: y-abhilashchandra@ti.com, devarsht@ti.com, vaishnav.a@ti.com, s-jain1@ti.com, vigneshr@ti.com, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl, tomi.valkeinen@ideasonboard.com, changhuang.liang@starfivetech.com, jack.zhu@starfivetech.com, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org
To: Rishikesh Donadkar <r-donadkar@ti.com>, jai.luthra@linux.dev, laurent.pinchart@ideasonboard.com, mripard@kernel.org
Date: Tue, 24 Jun 2025 18:33:54 -0700
Message-ID: <175081523471.8144.8244237988305732382@freya>
User-Agent: alot/0.12.dev28+gd2c823fe

--===============5002358159074849269==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Rishikesh,

Thanks for the patch.

Quoting Rishikesh Donadkar (2025-05-14 04:25:27)
> On buffer starvation the DMA is marked IDLE, and the stale data in the
> internal FIFOs gets drained only on the next VIDIOC_QBUF call from the
> userspace. This approach works fine for a single stream case.
>=20
> But in multistream scenarios, buffer starvation for one stream i.e. one
> virtual channel, can block the shared HW FIFO of the CSI2RX IP. This can
> stall the pipeline for all other virtual channels, even if buffers are
> available for them.
>=20
> This patch introduces a new architecture, that continuously drains data
> from the shared HW FIFO into a small (32KiB) buffer if no buffers are made
> available to the driver from the userspace. This ensures independence
> between different streams, where a slower downstream element for one
> camera does not block streaming for other cameras.
>=20
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> ---
>  .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 96 +++++++------------
>  1 file changed, 33 insertions(+), 63 deletions(-)
>=20
> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/driv=
ers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> index ba2a30bfed37d..3b046d3cf7e5a 100644
> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> @@ -57,7 +57,6 @@
>  #define TI_CSI2RX_MAX_SOURCE_PADS      TI_CSI2RX_MAX_CTX
>  #define TI_CSI2RX_MAX_PADS             (1 + TI_CSI2RX_MAX_SOURCE_PADS)
> =20
> -#define DRAIN_TIMEOUT_MS               50
>  #define DRAIN_BUFFER_SIZE              SZ_32K
> =20
>  struct ti_csi2rx_fmt {
> @@ -77,7 +76,6 @@ struct ti_csi2rx_buffer {
> =20
>  enum ti_csi2rx_dma_state {
>         TI_CSI2RX_DMA_STOPPED,  /* Streaming not started yet. */
> -       TI_CSI2RX_DMA_IDLE,     /* Streaming but no pending DMA operation=
. */
>         TI_CSI2RX_DMA_ACTIVE,   /* Streaming and pending DMA operation. */
>  };
> =20
> @@ -245,6 +243,10 @@ static const struct ti_csi2rx_fmt ti_csi2rx_formats[=
] =3D {
>  static int ti_csi2rx_start_dma(struct ti_csi2rx_ctx *ctx,
>                                struct ti_csi2rx_buffer *buf);
> =20
> +/* Forward declarations needed by ti_csi2rx_drain_callback. */
> +static int ti_csi2rx_drain_dma(struct ti_csi2rx_ctx *ctx);
> +static int ti_csi2rx_dma_submit_pending(struct ti_csi2rx_ctx *ctx);
> +
>  static const struct ti_csi2rx_fmt *find_format_by_fourcc(u32 pixelformat)
>  {
>         unsigned int i;
> @@ -596,9 +598,28 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_ct=
x *ctx)
> =20
>  static void ti_csi2rx_drain_callback(void *param)
>  {
> -       struct completion *drain_complete =3D param;
> +       struct ti_csi2rx_ctx *ctx =3D param;
> +       struct ti_csi2rx_dma *dma =3D &ctx->dma;
> +       unsigned long flags;
> +
> +       spin_lock_irqsave(&dma->lock, flags);
> =20
> -       complete(drain_complete);
> +       if (dma->state =3D=3D TI_CSI2RX_DMA_STOPPED) {
> +               spin_unlock_irqrestore(&dma->lock, flags);
> +               return;
> +       }
> +
> +       /*
> +        * If dma->queue is empty, it signals no buffer has arrived from
> +        * user space, so, queue more transaction to drain dma
> +        */
> +       if (list_empty(&dma->queue)) {
> +               if (ti_csi2rx_drain_dma(ctx))
> +                       dev_warn(ctx->csi->dev, "DMA drain failed\n");
> +       } else {
> +               ti_csi2rx_dma_submit_pending(ctx);
> +       }
> +       spin_unlock_irqrestore(&dma->lock, flags);
>  }
> =20
>  /*
> @@ -616,12 +637,9 @@ static int ti_csi2rx_drain_dma(struct ti_csi2rx_ctx =
*ctx)
>  {
>         struct ti_csi2rx_dev *csi =3D ctx->csi;
>         struct dma_async_tx_descriptor *desc;
> -       struct completion drain_complete;
>         dma_cookie_t cookie;
>         int ret;
> =20
> -       init_completion(&drain_complete);
> -
>         desc =3D dmaengine_prep_slave_single(ctx->dma.chan, csi->drain.pa=
ddr,
>                                            csi->drain.len, DMA_DEV_TO_MEM,
>                                            DMA_PREP_INTERRUPT | DMA_CTRL_=
ACK);
> @@ -631,7 +649,7 @@ static int ti_csi2rx_drain_dma(struct ti_csi2rx_ctx *=
ctx)
>         }
> =20
>         desc->callback =3D ti_csi2rx_drain_callback;
> -       desc->callback_param =3D &drain_complete;
> +       desc->callback_param =3D ctx;
> =20
>         cookie =3D dmaengine_submit(desc);
>         ret =3D dma_submit_error(cookie);
> @@ -640,13 +658,6 @@ static int ti_csi2rx_drain_dma(struct ti_csi2rx_ctx =
*ctx)
> =20
>         dma_async_issue_pending(ctx->dma.chan);
> =20
> -       if (!wait_for_completion_timeout(&drain_complete,
> -                                        msecs_to_jiffies(DRAIN_TIMEOUT_M=
S))) {
> -               dmaengine_terminate_sync(ctx->dma.chan);
> -               dev_dbg(csi->dev, "DMA transfer timed out for drain buffe=
r\n");
> -               ret =3D -ETIMEDOUT;
> -               goto out;
> -       }
>  out:
>         return ret;
>  }
> @@ -694,9 +705,11 @@ static void ti_csi2rx_dma_callback(void *param)
> =20
>         ti_csi2rx_dma_submit_pending(ctx);
> =20
> -       if (list_empty(&dma->submitted))
> -               dma->state =3D TI_CSI2RX_DMA_IDLE;
> -
> +       if (list_empty(&dma->submitted)) {
> +               if (ti_csi2rx_drain_dma(ctx))
> +                       dev_warn(ctx->csi->dev,
> +                                "DMA drain failed on one of the transact=
ions\n");
> +       }
>         spin_unlock_irqrestore(&dma->lock, flags);
>  }
> =20
> @@ -749,7 +762,7 @@ static void ti_csi2rx_stop_dma(struct ti_csi2rx_ctx *=
ctx)
>                  * enforced before terminating DMA.
>                  */
>                 ret =3D ti_csi2rx_drain_dma(ctx);
> -               if (ret && ret !=3D -ETIMEDOUT)
> +               if (ret)
>                         dev_warn(ctx->csi->dev,
>                                  "Failed to drain DMA. Next frame might b=
e bogus\n");
>         }
> @@ -816,57 +829,14 @@ static void ti_csi2rx_buffer_queue(struct vb2_buffe=
r *vb)
>         struct ti_csi2rx_ctx *ctx =3D vb2_get_drv_priv(vb->vb2_queue);
>         struct ti_csi2rx_buffer *buf;
>         struct ti_csi2rx_dma *dma =3D &ctx->dma;
> -       bool restart_dma =3D false;
>         unsigned long flags =3D 0;
> -       int ret;
> =20
>         buf =3D container_of(vb, struct ti_csi2rx_buffer, vb.vb2_buf);
>         buf->ctx =3D ctx;
> =20
>         spin_lock_irqsave(&dma->lock, flags);
> -       /*
> -        * Usually the DMA callback takes care of queueing the pending bu=
ffers.
> -        * But if DMA has stalled due to lack of buffers, restart it now.
> -        */
> -       if (dma->state =3D=3D TI_CSI2RX_DMA_IDLE) {
> -               /*
> -                * Do not restart DMA with the lock held because
> -                * ti_csi2rx_drain_dma() might block for completion.
> -                * There won't be a race on queueing DMA anyway since the
> -                * callback is not being fired.
> -                */
> -               restart_dma =3D true;
> -               dma->state =3D TI_CSI2RX_DMA_ACTIVE;
> -       } else {
> -               list_add_tail(&buf->list, &dma->queue);
> -       }
> +       list_add_tail(&buf->list, &dma->queue);
>         spin_unlock_irqrestore(&dma->lock, flags);
> -
> -       if (restart_dma) {
> -               /*
> -                * Once frames start dropping, some data gets stuck in th=
e DMA
> -                * pipeline somewhere. So the first DMA transfer after fr=
ame
> -                * drops gives a partial frame. This is obviously not use=
ful to

I think it would be good to retain a similar comment in the code, and also
in the commit message, as there is a possibility of returning a partial fra=
me
to the user post drain.

With that change,

Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>

> -                * the application and will only confuse it. Issue a DMA
> -                * transaction to drain that up.
> -                */
> -               ret =3D ti_csi2rx_drain_dma(ctx);
> -               if (ret && ret !=3D -ETIMEDOUT)
> -                       dev_warn(ctx->csi->dev,
> -                                "Failed to drain DMA. Next frame might b=
e bogus\n");
> -
> -               spin_lock_irqsave(&dma->lock, flags);
> -               ret =3D ti_csi2rx_start_dma(ctx, buf);
> -               if (ret) {
> -                       vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_E=
RROR);
> -                       dma->state =3D TI_CSI2RX_DMA_IDLE;
> -                       spin_unlock_irqrestore(&dma->lock, flags);
> -                       dev_err(ctx->csi->dev, "Failed to start DMA: %d\n=
", ret);
> -               } else {
> -                       list_add_tail(&buf->list, &dma->submitted);
> -                       spin_unlock_irqrestore(&dma->lock, flags);
> -               }
> -       }
>  }
> =20
>  static int ti_csi2rx_get_route(struct ti_csi2rx_ctx *ctx)
> --=20
> 2.34.1
>
--===============5002358159074849269==
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Description: signature
Content-Type: application/pgp-signature; name="signature.asc"; charset="us-ascii"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmhbUfgACgkQQ96R+SSa
cUUYCRAAgNZRhrRuTYsTSz7SUZoiDss//pcSSPr1PZ5Zunx2tVPE+j7Lq/79H35E
XAb08Pmcot5vt/PKXKaR1t+8LFBxQ5fNQfF/8YNtb4vItStbQimMRZlxScSywMnI
nxlrgiwxywaeAnLwXBj+4ql8yIlVqvzrYAdOnlq1SXNo5oyOIeR62NqTelmVh+QG
/UsYwnkjchp9HkiThIzU+5YpZeHWjD4i/CYSEXiq8anhGC0btvUYogq9UFupZO4v
V9utoBZymzL3EHdqlLCJGD0JcHKIM/eDfi337T+W50vytcSM8OSy6Z/4vc3Ijeyj
1XnnRo4pCoG3E1cRyZqwJcYaCZsRTYTDHhXHWX4f5P2LOn/FpjOacmBGUE4OjgqE
Ems0bL5+3Z57M5jt2RdoMnDwuPW0F76kguzdeBV6XBaUolgOJMLUoHsis8YkwB9h
+tgbxaxv5owIwT3Ct7ixlnyaZmuvfZuC54dwgTjTuPBEtTGq7r6dn4UdbbOxOg6V
GvQh6O0hajqAdxPDV1RN1Pmuglq4oLSZj0m5hJjC5z+uY8OCNrlTXGVeg+/66ncv
etgPIka1NVMa+z8aDnBmCRTWESbXOIPOWPAkHhqd3Oq6dWIe5CAFOL6hfS/KgBTp
X8czLyYBlm9TYi7MKb41rLkwRB8v0JGLO9HvH3XahQcQsylv464=
=jt1I
-----END PGP SIGNATURE-----

--===============5002358159074849269==--

