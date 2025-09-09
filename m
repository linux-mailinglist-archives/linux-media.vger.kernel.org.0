Return-Path: <linux-media+bounces-42111-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 646D0B4FB96
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 14:47:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E49F344DEC
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 12:47:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DE3833A03C;
	Tue,  9 Sep 2025 12:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BefQr6ky"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026EA259CB9;
	Tue,  9 Sep 2025 12:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757422017; cv=none; b=UwkYpxsLDkINDheX2olRluX3lWjKozPvJbpg1WmmPc8G/fojiPRsoA+H/Rftu3mfIRwd2SbTTA98Gcwir9vtJ8y6hujuekllionGampxgiGRi+7dyNETatT0omTAJsHEsR6wJIXk33Y9faqLOTHbaXaDOG9zT9WLQL0MND9MhRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757422017; c=relaxed/simple;
	bh=XavEHRV8Ps5amkfu/J/w1R5OrJiFeHMHuZHP31nQp14=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=FI2SqXAY/7M+sidVp/P7wirer9Ol+i9vy74yBXGQvpxZ/0/bqns/nhRQBeaWNncQIQpzwu0Qcyuf3Qz3Vuzl4mqL4tEUrj36VObkUDEkD3bnZ88LlxvqSOrnBIESfablaPdrRstd/Pw2xllHEHFHZI+G8v13J/QufPQgIDSIGB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BefQr6ky; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:c9e9:75f9:f434:33cd:e4fe])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 92ED55B3;
	Tue,  9 Sep 2025 14:45:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757421932;
	bh=XavEHRV8Ps5amkfu/J/w1R5OrJiFeHMHuZHP31nQp14=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=BefQr6kyaRgYMmu2F38RFPpH6a/P/1ibfDhM/uGf4J8wh5tFMGfvTuUTDw16367Ci
	 0ZuZfbYrfiWRlnCaGR4dH4+mU9zpUvrud8S9aEsSaeA5f3ph3v2uBqL+/jC8SoKam7
	 NW0U4QN31GnynTMMIegpD3Ntgy/vQmeeV32x5gX0=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250908134729.3940366-4-r-donadkar@ti.com>
References: <20250908134729.3940366-1-r-donadkar@ti.com> <20250908134729.3940366-4-r-donadkar@ti.com>
Subject: Re: [PATCH v6 03/16] media: ti: j721e-csi2rx: separate out device and context
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: r-donadkar@ti.com, y-abhilashchandra@ti.com, devarsht@ti.com, s-jain1@ti.com, vigneshr@ti.com, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, p.zabel@pengutronix.de, conor+dt@kernel.org, sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl, tomi.valkeinen@ideasonboard.com, changhuang.liang@starfivetech.com, jack.zhu@starfivetech.com, sjoerd@collabora.com, hverkuil+cisco@kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org
To: Rishikesh Donadkar <r-donadkar@ti.com>, jai.luthra@linux.dev, laurent.pinchart@ideasonboard.com, mripard@kernel.org
Date: Tue, 09 Sep 2025 18:16:38 +0530
Message-ID: <175742199859.8095.15741744253077635339@freya>
User-Agent: alot/0.12.dev28+gd2c823fe

Hi Rishikesh,

Quoting Rishikesh Donadkar (2025-09-08 19:17:16)
> From: Jai Luthra <j-luthra@ti.com>
>=20
> The TI CSI2RX wrapper has two parts: the main device and the DMA
> contexts. The driver was originally written with single camera capture
> in mind, so only one DMA context was needed. For the sake of simplicity,
> the context specific stuff was not modeled different to the main device.
>=20
> To enable multiplexed stream capture, the contexts need to be separated
> out from the main device. Create a struct ti_csi2rx_ctx that holds the
> DMA context specific things. Separate out functions handling the device
> and context related functionality.
>=20
> Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> Co-developed-by: Pratyush Yadav <p.yadav@ti.com>
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> ---
>  .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 420 ++++++++++--------
>  1 file changed, 232 insertions(+), 188 deletions(-)
>=20
> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/driv=
ers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> index 6a981b5f5d51..7b3036548cd0 100644
> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> @@ -44,6 +44,8 @@
> =20
>  #define TI_CSI2RX_MAX_PIX_PER_CLK      4
>  #define PSIL_WORD_SIZE_BYTES           16
> +#define TI_CSI2RX_NUM_CTX              1
> +
>  /*
>   * There are no hard limits on the width or height. The DMA engine can h=
andle
>   * all sizes. The max width and height are arbitrary numbers for this dr=
iver.
> @@ -70,7 +72,7 @@ struct ti_csi2rx_buffer {
>         /* Common v4l2 buffer. Must be first. */
>         struct vb2_v4l2_buffer          vb;
>         struct list_head                list;
> -       struct ti_csi2rx_dev            *csi;
> +       struct ti_csi2rx_ctx            *ctx;
>  };
> =20
>  enum ti_csi2rx_dma_state {
> @@ -90,30 +92,38 @@ struct ti_csi2rx_dma {
>          * Queue of buffers submitted to DMA engine.
>          */
>         struct list_head                submitted;
> -       /* Buffer to drain stale data from PSI-L endpoint */
> -       struct {
> -               void                    *vaddr;
> -               dma_addr_t              paddr;
> -               size_t                  len;
> -       } drain;
> +};
> +
> +struct ti_csi2rx_dev;
> +
> +struct ti_csi2rx_ctx {
> +       struct ti_csi2rx_dev            *csi;
> +       struct video_device             vdev;
> +       struct vb2_queue                vidq;
> +       struct mutex                    mutex; /* To serialize ioctls. */
> +       struct v4l2_format              v_fmt;
> +       struct ti_csi2rx_dma            dma;
> +       u32                             sequence;
> +       u32                             idx;
>  };
> =20
>  struct ti_csi2rx_dev {
>         struct device                   *dev;
>         void __iomem                    *shim;
>         struct v4l2_device              v4l2_dev;
> -       struct video_device             vdev;
>         struct media_device             mdev;
>         struct media_pipeline           pipe;
>         struct media_pad                pad;
>         struct v4l2_async_notifier      notifier;
>         struct v4l2_subdev              *source;
> -       struct vb2_queue                vidq;
> -       struct mutex                    mutex; /* To serialize ioctls. */
> -       struct v4l2_format              v_fmt;
> -       struct ti_csi2rx_dma            dma;
> -       u32                             sequence;
> +       struct ti_csi2rx_ctx            ctx[TI_CSI2RX_NUM_CTX];
>         u8                              pix_per_clk;
> +       /* Buffer to drain stale data from PSI-L endpoint */
> +       struct {
> +               void                    *vaddr;
> +               dma_addr_t              paddr;
> +               size_t                  len;
> +       } drain;
>  };
> =20
>  static const struct ti_csi2rx_fmt ti_csi2rx_formats[] =3D {
> @@ -219,7 +229,7 @@ static const struct ti_csi2rx_fmt ti_csi2rx_formats[]=
 =3D {
>  };
> =20
>  /* Forward declaration needed by ti_csi2rx_dma_callback. */
> -static int ti_csi2rx_start_dma(struct ti_csi2rx_dev *csi,
> +static int ti_csi2rx_start_dma(struct ti_csi2rx_ctx *ctx,
>                                struct ti_csi2rx_buffer *buf);
> =20
>  static const struct ti_csi2rx_fmt *find_format_by_fourcc(u32 pixelformat)
> @@ -302,7 +312,7 @@ static int ti_csi2rx_enum_fmt_vid_cap(struct file *fi=
le, void *priv,
>  static int ti_csi2rx_g_fmt_vid_cap(struct file *file, void *priv,
>                                    struct v4l2_format *f)
>  {
> -       struct ti_csi2rx_dev *csi =3D video_drvdata(file);
> +       struct ti_csi2rx_ctx *csi =3D video_drvdata(file);
> =20
>         *f =3D csi->v_fmt;
> =20
> @@ -333,7 +343,7 @@ static int ti_csi2rx_try_fmt_vid_cap(struct file *fil=
e, void *priv,
>  static int ti_csi2rx_s_fmt_vid_cap(struct file *file, void *priv,
>                                    struct v4l2_format *f)
>  {
> -       struct ti_csi2rx_dev *csi =3D video_drvdata(file);
> +       struct ti_csi2rx_ctx *csi =3D video_drvdata(file);
>         struct vb2_queue *q =3D &csi->vidq;
>         int ret;
> =20
> @@ -411,26 +421,35 @@ static int csi_async_notifier_bound(struct v4l2_asy=
nc_notifier *notifier,
>  static int csi_async_notifier_complete(struct v4l2_async_notifier *notif=
ier)
>  {
>         struct ti_csi2rx_dev *csi =3D dev_get_drvdata(notifier->v4l2_dev-=
>dev);
> -       struct video_device *vdev =3D &csi->vdev;
> -       int ret;
> +       int ret, i;
> =20
> -       ret =3D video_register_device(vdev, VFL_TYPE_VIDEO, -1);
> -       if (ret)
> -               return ret;
> -
> -       ret =3D media_create_pad_link(&csi->source->entity, CSI2RX_BRIDGE=
_SOURCE_PAD,
> -                                   &vdev->entity, csi->pad.index,
> -                                   MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL=
_ENABLED);
> +       for (i =3D 0; i < TI_CSI2RX_NUM_CTX; i++) {
> +               struct ti_csi2rx_ctx *ctx =3D &csi->ctx[i];
> +               struct video_device *vdev =3D &ctx->vdev;
> =20
> -       if (ret) {
> -               video_unregister_device(vdev);
> -               return ret;
> +               ret =3D video_register_device(vdev, VFL_TYPE_VIDEO, -1);
> +               if (ret)
> +                       goto unregister_dev;
>         }
> =20
> +       ret =3D media_create_pad_link(&csi->source->entity,
> +                                   CSI2RX_BRIDGE_SOURCE_PAD,
> +                                   &vdev->entity, csi->pad.index,

"vdev" is not in scope here. This leads to compilation failures, patchwork
reported this as a bisect issue from v5 of your series.

Please also make sure to do a range-diff before populating the changelog,
which seems to have missed this.

> +                                   MEDIA_LNK_FL_IMMUTABLE |
> +                                   MEDIA_LNK_FL_ENABLED);
> +       if (ret)
> +               goto unregister_dev;
> +
>         ret =3D v4l2_device_register_subdev_nodes(&csi->v4l2_dev);
>         if (ret)
> -               video_unregister_device(vdev);
> +               goto unregister_dev;
> =20
> +       return 0;
> +
> +unregister_dev:
> +       i--;
> +       for (; i >=3D 0; i--)
> +               video_unregister_device(&csi->ctx[i].vdev);
>         return ret;
>  }
> =20
> @@ -475,13 +494,14 @@ static int ti_csi2rx_notifier_register(struct ti_cs=
i2rx_dev *csi)
>  }
> =20
>  /* Request maximum possible pixels per clock from the bridge */
> -static void ti_csi2rx_request_max_ppc(struct ti_csi2rx_dev *csi)
> +static void ti_csi2rx_request_max_ppc(struct ti_csi2rx_ctx *ctx)
>  {
> +       struct ti_csi2rx_dev *csi =3D ctx->csi;
>         u8 ppc =3D TI_CSI2RX_MAX_PIX_PER_CLK;
>         struct media_pad *pad;
>         int ret;
> =20
> -       pad =3D media_entity_remote_source_pad_unique(&csi->vdev.entity);
> +       pad =3D media_entity_remote_source_pad_unique(&ctx->vdev.entity);
>         if (!pad)
>                 return;
> =20
> @@ -494,19 +514,20 @@ static void ti_csi2rx_request_max_ppc(struct ti_csi=
2rx_dev *csi)
>         }
>  }
> =20
> -static void ti_csi2rx_setup_shim(struct ti_csi2rx_dev *csi)
> +static void ti_csi2rx_setup_shim(struct ti_csi2rx_ctx *ctx)
>  {
> +       struct ti_csi2rx_dev *csi =3D ctx->csi;
>         const struct ti_csi2rx_fmt *fmt;
>         unsigned int reg;
> =20
> -       fmt =3D find_format_by_fourcc(csi->v_fmt.fmt.pix.pixelformat);
> +       fmt =3D find_format_by_fourcc(ctx->v_fmt.fmt.pix.pixelformat);
> =20
>         /* De-assert the pixel interface reset. */
>         reg =3D SHIM_CNTL_PIX_RST;
>         writel(reg, csi->shim + SHIM_CNTL);
> =20
>         /* Negotiate pixel count from the source */
> -       ti_csi2rx_request_max_ppc(csi);
> +       ti_csi2rx_request_max_ppc(ctx);
> =20
>         reg =3D SHIM_DMACNTX_EN;
>         reg |=3D FIELD_PREP(SHIM_DMACNTX_FMT, fmt->csi_dt);
> @@ -573,8 +594,9 @@ static void ti_csi2rx_drain_callback(void *param)
>   * To prevent that stale data corrupting the subsequent transactions, it=
 is
>   * required to issue DMA requests to drain it out.
>   */
> -static int ti_csi2rx_drain_dma(struct ti_csi2rx_dev *csi)
> +static int ti_csi2rx_drain_dma(struct ti_csi2rx_ctx *ctx)
>  {
> +       struct ti_csi2rx_dev *csi =3D ctx->csi;
>         struct dma_async_tx_descriptor *desc;
>         struct completion drain_complete;
>         dma_cookie_t cookie;
> @@ -582,8 +604,8 @@ static int ti_csi2rx_drain_dma(struct ti_csi2rx_dev *=
csi)
> =20
>         init_completion(&drain_complete);
> =20
> -       desc =3D dmaengine_prep_slave_single(csi->dma.chan, csi->dma.drai=
n.paddr,
> -                                          csi->dma.drain.len, DMA_DEV_TO=
_MEM,
> +       desc =3D dmaengine_prep_slave_single(ctx->dma.chan, csi->drain.pa=
ddr,
> +                                          csi->drain.len, DMA_DEV_TO_MEM,
>                                            DMA_PREP_INTERRUPT | DMA_CTRL_=
ACK);
>         if (!desc) {
>                 ret =3D -EIO;
> @@ -598,11 +620,11 @@ static int ti_csi2rx_drain_dma(struct ti_csi2rx_dev=
 *csi)
>         if (ret)
>                 goto out;
> =20
> -       dma_async_issue_pending(csi->dma.chan);
> +       dma_async_issue_pending(ctx->dma.chan);
> =20
>         if (!wait_for_completion_timeout(&drain_complete,
>                                          msecs_to_jiffies(DRAIN_TIMEOUT_M=
S))) {
> -               dmaengine_terminate_sync(csi->dma.chan);
> +               dmaengine_terminate_sync(ctx->dma.chan);
>                 dev_dbg(csi->dev, "DMA transfer timed out for drain buffe=
r\n");
>                 ret =3D -ETIMEDOUT;
>                 goto out;
> @@ -614,8 +636,8 @@ static int ti_csi2rx_drain_dma(struct ti_csi2rx_dev *=
csi)
>  static void ti_csi2rx_dma_callback(void *param)
>  {
>         struct ti_csi2rx_buffer *buf =3D param;
> -       struct ti_csi2rx_dev *csi =3D buf->csi;
> -       struct ti_csi2rx_dma *dma =3D &csi->dma;
> +       struct ti_csi2rx_ctx *ctx =3D buf->ctx;
> +       struct ti_csi2rx_dma *dma =3D &ctx->dma;
>         unsigned long flags;
> =20
>         /*


You missed a usage of "csi" in this function. This was done correctly in
v4, but has been broken since v5.=20

@@ -617,8 +637,9 @@ static void ti_csi2rx_dma_callback(void *param)
 	while (!list_empty(&dma->queue)) {
 		buf =3D list_entry(dma->queue.next, struct ti_csi2rx_buffer, list);
=20
-		if (ti_csi2rx_start_dma(csi, buf)) {
-			dev_err(csi->dev, "Failed to queue the next buffer for DMA\n");
+		if (ti_csi2rx_start_dma(ctx, buf)) {
+			dev_err(ctx->csi->dev,
+				"Failed to queue the next buffer for DMA\n");
 			vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
 		} else {
 			list_move_tail(&buf->list, &dma->submitted);

This also causes compilation/bisect issues.

> @@ -623,7 +645,7 @@ static void ti_csi2rx_dma_callback(void *param)
>          * hardware monitor registers.
>          */
>         buf->vb.vb2_buf.timestamp =3D ktime_get_ns();
> -       buf->vb.sequence =3D csi->sequence++;
> +       buf->vb.sequence =3D ctx->sequence++;
> =20
>         spin_lock_irqsave(&dma->lock, flags);
> =20
> @@ -650,17 +672,17 @@ static void ti_csi2rx_dma_callback(void *param)
>         spin_unlock_irqrestore(&dma->lock, flags);
>  }
> =20
> -static int ti_csi2rx_start_dma(struct ti_csi2rx_dev *csi,
> +static int ti_csi2rx_start_dma(struct ti_csi2rx_ctx *ctx,
>                                struct ti_csi2rx_buffer *buf)
>  {
>         unsigned long addr;
>         struct dma_async_tx_descriptor *desc;
> -       size_t len =3D csi->v_fmt.fmt.pix.sizeimage;
> +       size_t len =3D ctx->v_fmt.fmt.pix.sizeimage;
>         dma_cookie_t cookie;
>         int ret =3D 0;
> =20
>         addr =3D vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
> -       desc =3D dmaengine_prep_slave_single(csi->dma.chan, addr, len,
> +       desc =3D dmaengine_prep_slave_single(ctx->dma.chan, addr, len,
>                                            DMA_DEV_TO_MEM,
>                                            DMA_PREP_INTERRUPT | DMA_CTRL_=
ACK);
>         if (!desc)
> @@ -674,20 +696,20 @@ static int ti_csi2rx_start_dma(struct ti_csi2rx_dev=
 *csi,
>         if (ret)
>                 return ret;
> =20
> -       dma_async_issue_pending(csi->dma.chan);
> +       dma_async_issue_pending(ctx->dma.chan);
> =20
>         return 0;
>  }
> =20
> -static void ti_csi2rx_stop_dma(struct ti_csi2rx_dev *csi)
> +static void ti_csi2rx_stop_dma(struct ti_csi2rx_ctx *ctx)
>  {
> -       struct ti_csi2rx_dma *dma =3D &csi->dma;
> +       struct ti_csi2rx_dma *dma =3D &ctx->dma;
>         enum ti_csi2rx_dma_state state;
>         unsigned long flags;
>         int ret;
> =20
>         spin_lock_irqsave(&dma->lock, flags);
> -       state =3D csi->dma.state;
> +       state =3D ctx->dma.state;
>         dma->state =3D TI_CSI2RX_DMA_STOPPED;
>         spin_unlock_irqrestore(&dma->lock, flags);
> =20
> @@ -698,30 +720,30 @@ static void ti_csi2rx_stop_dma(struct ti_csi2rx_dev=
 *csi)
>                  * is stopped, as the module-level pixel reset cannot be
>                  * enforced before terminating DMA.
>                  */
> -               ret =3D ti_csi2rx_drain_dma(csi);
> +               ret =3D ti_csi2rx_drain_dma(ctx);
>                 if (ret && ret !=3D -ETIMEDOUT)
> -                       dev_warn(csi->dev,
> +                       dev_warn(ctx->csi->dev,
>                                  "Failed to drain DMA. Next frame might b=
e bogus\n");
>         }
> =20
> -       ret =3D dmaengine_terminate_sync(csi->dma.chan);
> +       ret =3D dmaengine_terminate_sync(ctx->dma.chan);
>         if (ret)
> -               dev_err(csi->dev, "Failed to stop DMA: %d\n", ret);
> +               dev_err(ctx->csi->dev, "Failed to stop DMA: %d\n", ret);
>  }
> =20
> -static void ti_csi2rx_cleanup_buffers(struct ti_csi2rx_dev *csi,
> +static void ti_csi2rx_cleanup_buffers(struct ti_csi2rx_ctx *ctx,
>                                       enum vb2_buffer_state state)
>  {
> -       struct ti_csi2rx_dma *dma =3D &csi->dma;
> +       struct ti_csi2rx_dma *dma =3D &ctx->dma;
>         struct ti_csi2rx_buffer *buf, *tmp;
>         unsigned long flags;
> =20
>         spin_lock_irqsave(&dma->lock, flags);
> -       list_for_each_entry_safe(buf, tmp, &csi->dma.queue, list) {
> +       list_for_each_entry_safe(buf, tmp, &ctx->dma.queue, list) {
>                 list_del(&buf->list);
>                 vb2_buffer_done(&buf->vb.vb2_buf, state);
>         }
> -       list_for_each_entry_safe(buf, tmp, &csi->dma.submitted, list) {
> +       list_for_each_entry_safe(buf, tmp, &ctx->dma.submitted, list) {
>                 list_del(&buf->list);
>                 vb2_buffer_done(&buf->vb.vb2_buf, state);
>         }
> @@ -732,8 +754,8 @@ static int ti_csi2rx_queue_setup(struct vb2_queue *q,=
 unsigned int *nbuffers,
>                                  unsigned int *nplanes, unsigned int size=
s[],
>                                  struct device *alloc_devs[])
>  {
> -       struct ti_csi2rx_dev *csi =3D vb2_get_drv_priv(q);
> -       unsigned int size =3D csi->v_fmt.fmt.pix.sizeimage;
> +       struct ti_csi2rx_ctx *ctx =3D vb2_get_drv_priv(q);
> +       unsigned int size =3D ctx->v_fmt.fmt.pix.sizeimage;
> =20
>         if (*nplanes) {
>                 if (sizes[0] < size)
> @@ -749,11 +771,11 @@ static int ti_csi2rx_queue_setup(struct vb2_queue *=
q, unsigned int *nbuffers,
> =20
>  static int ti_csi2rx_buffer_prepare(struct vb2_buffer *vb)
>  {
> -       struct ti_csi2rx_dev *csi =3D vb2_get_drv_priv(vb->vb2_queue);
> -       unsigned long size =3D csi->v_fmt.fmt.pix.sizeimage;
> +       struct ti_csi2rx_ctx *ctx =3D vb2_get_drv_priv(vb->vb2_queue);
> +       unsigned long size =3D ctx->v_fmt.fmt.pix.sizeimage;
> =20
>         if (vb2_plane_size(vb, 0) < size) {
> -               dev_err(csi->dev, "Data will not fit into plane\n");
> +               dev_err(ctx->csi->dev, "Data will not fit into plane\n");
>                 return -EINVAL;
>         }
> =20
> @@ -763,15 +785,15 @@ static int ti_csi2rx_buffer_prepare(struct vb2_buff=
er *vb)
> =20
>  static void ti_csi2rx_buffer_queue(struct vb2_buffer *vb)
>  {
> -       struct ti_csi2rx_dev *csi =3D vb2_get_drv_priv(vb->vb2_queue);
> +       struct ti_csi2rx_ctx *ctx =3D vb2_get_drv_priv(vb->vb2_queue);
>         struct ti_csi2rx_buffer *buf;
> -       struct ti_csi2rx_dma *dma =3D &csi->dma;
> +       struct ti_csi2rx_dma *dma =3D &ctx->dma;
>         bool restart_dma =3D false;
>         unsigned long flags =3D 0;
>         int ret;
> =20
>         buf =3D container_of(vb, struct ti_csi2rx_buffer, vb.vb2_buf);
> -       buf->csi =3D csi;
> +       buf->ctx =3D ctx;
> =20
>         spin_lock_irqsave(&dma->lock, flags);
>         /*
> @@ -800,18 +822,18 @@ static void ti_csi2rx_buffer_queue(struct vb2_buffe=
r *vb)
>                  * the application and will only confuse it. Issue a DMA
>                  * transaction to drain that up.
>                  */
> -               ret =3D ti_csi2rx_drain_dma(csi);
> +               ret =3D ti_csi2rx_drain_dma(ctx);
>                 if (ret && ret !=3D -ETIMEDOUT)
> -                       dev_warn(csi->dev,
> +                       dev_warn(ctx->csi->dev,
>                                  "Failed to drain DMA. Next frame might b=
e bogus\n");
> =20
>                 spin_lock_irqsave(&dma->lock, flags);
> -               ret =3D ti_csi2rx_start_dma(csi, buf);
> +               ret =3D ti_csi2rx_start_dma(ctx, buf);
>                 if (ret) {
>                         vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_E=
RROR);
>                         dma->state =3D TI_CSI2RX_DMA_IDLE;
>                         spin_unlock_irqrestore(&dma->lock, flags);
> -                       dev_err(csi->dev, "Failed to start DMA: %d\n", re=
t);
> +                       dev_err(ctx->csi->dev, "Failed to start DMA: %d\n=
", ret);
>                 } else {
>                         list_add_tail(&buf->list, &dma->submitted);
>                         spin_unlock_irqrestore(&dma->lock, flags);
> @@ -821,8 +843,9 @@ static void ti_csi2rx_buffer_queue(struct vb2_buffer =
*vb)
> =20
>  static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int =
count)
>  {
> -       struct ti_csi2rx_dev *csi =3D vb2_get_drv_priv(vq);
> -       struct ti_csi2rx_dma *dma =3D &csi->dma;
> +       struct ti_csi2rx_ctx *ctx =3D vb2_get_drv_priv(vq);
> +       struct ti_csi2rx_dev *csi =3D ctx->csi;
> +       struct ti_csi2rx_dma *dma =3D &ctx->dma;
>         struct ti_csi2rx_buffer *buf;
>         unsigned long flags;
>         int ret =3D 0;
> @@ -834,18 +857,18 @@ static int ti_csi2rx_start_streaming(struct vb2_que=
ue *vq, unsigned int count)
>         if (ret)
>                 return ret;
> =20
> -       ret =3D video_device_pipeline_start(&csi->vdev, &csi->pipe);
> +       ret =3D video_device_pipeline_start(&ctx->vdev, &csi->pipe);
>         if (ret)
>                 goto err;
> =20
> -       ti_csi2rx_setup_shim(csi);
> +       ti_csi2rx_setup_shim(ctx);
> =20
> -       csi->sequence =3D 0;
> +       ctx->sequence =3D 0;
> =20
>         spin_lock_irqsave(&dma->lock, flags);
>         buf =3D list_entry(dma->queue.next, struct ti_csi2rx_buffer, list=
);
> =20
> -       ret =3D ti_csi2rx_start_dma(csi, buf);
> +       ret =3D ti_csi2rx_start_dma(ctx, buf);
>         if (ret) {
>                 dev_err(csi->dev, "Failed to start DMA: %d\n", ret);
>                 spin_unlock_irqrestore(&dma->lock, flags);
> @@ -863,22 +886,23 @@ static int ti_csi2rx_start_streaming(struct vb2_que=
ue *vq, unsigned int count)
>         return 0;
> =20
>  err_dma:
> -       ti_csi2rx_stop_dma(csi);
> +       ti_csi2rx_stop_dma(ctx);
>  err_pipeline:
> -       video_device_pipeline_stop(&csi->vdev);
> +       video_device_pipeline_stop(&ctx->vdev);
>         writel(0, csi->shim + SHIM_CNTL);
>         writel(0, csi->shim + SHIM_DMACNTX);
>  err:
> -       ti_csi2rx_cleanup_buffers(csi, VB2_BUF_STATE_QUEUED);
> +       ti_csi2rx_cleanup_buffers(ctx, VB2_BUF_STATE_QUEUED);
>         return ret;
>  }
> =20
>  static void ti_csi2rx_stop_streaming(struct vb2_queue *vq)
>  {
> -       struct ti_csi2rx_dev *csi =3D vb2_get_drv_priv(vq);
> +       struct ti_csi2rx_ctx *ctx =3D vb2_get_drv_priv(vq);
> +       struct ti_csi2rx_dev *csi =3D ctx->csi;
>         int ret;
> =20
> -       video_device_pipeline_stop(&csi->vdev);
> +       video_device_pipeline_stop(&ctx->vdev);
> =20
>         writel(0, csi->shim + SHIM_CNTL);
>         writel(0, csi->shim + SHIM_DMACNTX);
> @@ -887,8 +911,8 @@ static void ti_csi2rx_stop_streaming(struct vb2_queue=
 *vq)
>         if (ret)
>                 dev_err(csi->dev, "Failed to stop subdev stream\n");
> =20
> -       ti_csi2rx_stop_dma(csi);
> -       ti_csi2rx_cleanup_buffers(csi, VB2_BUF_STATE_ERROR);
> +       ti_csi2rx_stop_dma(ctx);
> +       ti_csi2rx_cleanup_buffers(ctx, VB2_BUF_STATE_ERROR);
>  }
> =20
>  static const struct vb2_ops csi_vb2_qops =3D {
> @@ -899,20 +923,43 @@ static const struct vb2_ops csi_vb2_qops =3D {
>         .stop_streaming =3D ti_csi2rx_stop_streaming,
>  };
> =20
> -static int ti_csi2rx_init_vb2q(struct ti_csi2rx_dev *csi)
> +static void ti_csi2rx_cleanup_v4l2(struct ti_csi2rx_dev *csi)
>  {
> -       struct vb2_queue *q =3D &csi->vidq;
> +       media_device_unregister(&csi->mdev);
> +       v4l2_device_unregister(&csi->v4l2_dev);
> +       media_device_cleanup(&csi->mdev);
> +}
> +
> +static void ti_csi2rx_cleanup_notifier(struct ti_csi2rx_dev *csi)
> +{
> +       v4l2_async_nf_unregister(&csi->notifier);
> +       v4l2_async_nf_cleanup(&csi->notifier);
> +}
> +
> +static void ti_csi2rx_cleanup_ctx(struct ti_csi2rx_ctx *ctx)
> +{
> +       dma_release_channel(ctx->dma.chan);
> +       vb2_queue_release(&ctx->vidq);
> +
> +       video_unregister_device(&ctx->vdev);
> +
> +       mutex_destroy(&ctx->mutex);
> +}
> +
> +static int ti_csi2rx_init_vb2q(struct ti_csi2rx_ctx *ctx)
> +{
> +       struct vb2_queue *q =3D &ctx->vidq;
>         int ret;
> =20
>         q->type =3D V4L2_BUF_TYPE_VIDEO_CAPTURE;
>         q->io_modes =3D VB2_MMAP | VB2_DMABUF;
> -       q->drv_priv =3D csi;
> +       q->drv_priv =3D ctx;
>         q->buf_struct_size =3D sizeof(struct ti_csi2rx_buffer);
>         q->ops =3D &csi_vb2_qops;
>         q->mem_ops =3D &vb2_dma_contig_memops;
>         q->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> -       q->dev =3D dmaengine_get_dma_device(csi->dma.chan);
> -       q->lock =3D &csi->mutex;
> +       q->dev =3D dmaengine_get_dma_device(ctx->dma.chan);
> +       q->lock =3D &ctx->mutex;
>         q->min_queued_buffers =3D 1;
>         q->allow_cache_hints =3D 1;
> =20
> @@ -920,7 +967,7 @@ static int ti_csi2rx_init_vb2q(struct ti_csi2rx_dev *=
csi)
>         if (ret)
>                 return ret;
> =20
> -       csi->vdev.queue =3D q;
> +       ctx->vdev.queue =3D q;
> =20
>         return 0;
>  }
> @@ -929,8 +976,9 @@ static int ti_csi2rx_link_validate(struct media_link =
*link)
>  {
>         struct media_entity *entity =3D link->sink->entity;
>         struct video_device *vdev =3D media_entity_to_video_device(entity=
);
> -       struct ti_csi2rx_dev *csi =3D container_of(vdev, struct ti_csi2rx=
_dev, vdev);
> -       struct v4l2_pix_format *csi_fmt =3D &csi->v_fmt.fmt.pix;
> +       struct ti_csi2rx_ctx *ctx =3D container_of(vdev, struct ti_csi2rx=
_ctx, vdev);
> +       struct ti_csi2rx_dev *csi =3D ctx->csi;
> +       struct v4l2_pix_format *csi_fmt =3D &ctx->v_fmt.fmt.pix;
>         struct v4l2_subdev_format source_fmt =3D {
>                 .which  =3D V4L2_SUBDEV_FORMAT_ACTIVE,
>                 .pad    =3D link->source->index,
> @@ -983,47 +1031,63 @@ static const struct media_entity_operations ti_csi=
2rx_video_entity_ops =3D {
>         .link_validate =3D ti_csi2rx_link_validate,
>  };
> =20
> -static int ti_csi2rx_init_dma(struct ti_csi2rx_dev *csi)
> +static int ti_csi2rx_init_dma(struct ti_csi2rx_ctx *ctx)
>  {
>         struct dma_slave_config cfg =3D {
>                 .src_addr_width =3D DMA_SLAVE_BUSWIDTH_16_BYTES,
>         };
>         int ret;
> =20
> -       INIT_LIST_HEAD(&csi->dma.queue);
> -       INIT_LIST_HEAD(&csi->dma.submitted);
> -       spin_lock_init(&csi->dma.lock);
> -
> -       csi->dma.state =3D TI_CSI2RX_DMA_STOPPED;
> +       ctx->dma.chan =3D dma_request_chan(ctx->csi->dev, "rx0");
> +       if (IS_ERR(ctx->dma.chan))
> +               return PTR_ERR(ctx->dma.chan);
> =20
> -       csi->dma.chan =3D dma_request_chan(csi->dev, "rx0");
> -       if (IS_ERR(csi->dma.chan))
> -               return PTR_ERR(csi->dma.chan);
> -
> -       ret =3D dmaengine_slave_config(csi->dma.chan, &cfg);
> +       ret =3D dmaengine_slave_config(ctx->dma.chan, &cfg);
>         if (ret) {
> -               dma_release_channel(csi->dma.chan);
> +               dma_release_channel(ctx->dma.chan);
>                 return ret;
>         }
> =20
> -       csi->dma.drain.len =3D DRAIN_BUFFER_SIZE;
> -       csi->dma.drain.vaddr =3D dma_alloc_coherent(csi->dev, csi->dma.dr=
ain.len,
> -                                                 &csi->dma.drain.paddr,
> -                                                 GFP_KERNEL);
> -       if (!csi->dma.drain.vaddr)
> -               return -ENOMEM;
> -
>         return 0;
>  }
> =20
>  static int ti_csi2rx_v4l2_init(struct ti_csi2rx_dev *csi)
>  {
>         struct media_device *mdev =3D &csi->mdev;
> -       struct video_device *vdev =3D &csi->vdev;
> +       int ret;
> +
> +       mdev->dev =3D csi->dev;
> +       mdev->hw_revision =3D 1;
> +       strscpy(mdev->model, "TI-CSI2RX", sizeof(mdev->model));
> +
> +       media_device_init(mdev);
> +
> +       csi->v4l2_dev.mdev =3D mdev;
> +
> +       ret =3D v4l2_device_register(csi->dev, &csi->v4l2_dev);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D media_device_register(mdev);
> +       if (ret) {
> +               v4l2_device_unregister(&csi->v4l2_dev);
> +               media_device_cleanup(mdev);
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +static int ti_csi2rx_init_ctx(struct ti_csi2rx_ctx *ctx)
> +{
> +       struct ti_csi2rx_dev *csi =3D ctx->csi;
> +       struct video_device *vdev =3D &ctx->vdev;
>         const struct ti_csi2rx_fmt *fmt;
> -       struct v4l2_pix_format *pix_fmt =3D &csi->v_fmt.fmt.pix;
> +       struct v4l2_pix_format *pix_fmt =3D &ctx->v_fmt.fmt.pix;
>         int ret;
> =20
> +       mutex_init(&ctx->mutex);
> +
>         fmt =3D find_format_by_fourcc(V4L2_PIX_FMT_UYVY);
>         if (!fmt)
>                 return -EINVAL;
> @@ -1032,19 +1096,20 @@ static int ti_csi2rx_v4l2_init(struct ti_csi2rx_d=
ev *csi)
>         pix_fmt->height =3D 480;
>         pix_fmt->field =3D V4L2_FIELD_NONE;
>         pix_fmt->colorspace =3D V4L2_COLORSPACE_SRGB;
> -       pix_fmt->ycbcr_enc =3D V4L2_YCBCR_ENC_601;
> -       pix_fmt->quantization =3D V4L2_QUANTIZATION_LIM_RANGE;
> -       pix_fmt->xfer_func =3D V4L2_XFER_FUNC_SRGB;
> +       pix_fmt->ycbcr_enc =3D V4L2_YCBCR_ENC_601,
> +       pix_fmt->quantization =3D V4L2_QUANTIZATION_LIM_RANGE,
> +       pix_fmt->xfer_func =3D V4L2_XFER_FUNC_SRGB,
> =20
> -       ti_csi2rx_fill_fmt(fmt, &csi->v_fmt);
> +       ti_csi2rx_fill_fmt(fmt, &ctx->v_fmt);
> =20
> -       mdev->dev =3D csi->dev;
> -       mdev->hw_revision =3D 1;
> -       strscpy(mdev->model, "TI-CSI2RX", sizeof(mdev->model));
> -
> -       media_device_init(mdev);
> +       csi->pad.flags =3D MEDIA_PAD_FL_SINK;
> +       vdev->entity.ops =3D &ti_csi2rx_video_entity_ops;
> +       ret =3D media_entity_pads_init(&ctx->vdev.entity, 1, &csi->pad);
> +       if (ret)
> +               return ret;
> =20
> -       strscpy(vdev->name, TI_CSI2RX_MODULE_NAME, sizeof(vdev->name));
> +       snprintf(vdev->name, sizeof(vdev->name), "%s context %u",
> +                dev_name(csi->dev), ctx->idx);
>         vdev->v4l2_dev =3D &csi->v4l2_dev;
>         vdev->vfl_dir =3D VFL_DIR_RX;
>         vdev->fops =3D &csi_fops;
> @@ -1052,61 +1117,33 @@ static int ti_csi2rx_v4l2_init(struct ti_csi2rx_d=
ev *csi)
>         vdev->release =3D video_device_release_empty;
>         vdev->device_caps =3D V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING=
 |
>                             V4L2_CAP_IO_MC;
> -       vdev->lock =3D &csi->mutex;
> -       video_set_drvdata(vdev, csi);
> +       vdev->lock =3D &ctx->mutex;
> +       video_set_drvdata(vdev, ctx);
> =20
> -       csi->pad.flags =3D MEDIA_PAD_FL_SINK;
> -       vdev->entity.ops =3D &ti_csi2rx_video_entity_ops;
> -       ret =3D media_entity_pads_init(&csi->vdev.entity, 1, &csi->pad);
> -       if (ret)
> -               return ret;
> +       INIT_LIST_HEAD(&ctx->dma.queue);
> +       INIT_LIST_HEAD(&ctx->dma.submitted);
> +       spin_lock_init(&ctx->dma.lock);
> +       ctx->dma.state =3D TI_CSI2RX_DMA_STOPPED;
> =20
> -       csi->v4l2_dev.mdev =3D mdev;
> -
> -       ret =3D v4l2_device_register(csi->dev, &csi->v4l2_dev);
> +       ret =3D ti_csi2rx_init_dma(ctx);
>         if (ret)
>                 return ret;
> =20
> -       ret =3D media_device_register(mdev);
> -       if (ret) {
> -               v4l2_device_unregister(&csi->v4l2_dev);
> -               media_device_cleanup(mdev);
> -               return ret;
> -       }
> +       ret =3D ti_csi2rx_init_vb2q(ctx);
> +       if (ret)
> +               goto cleanup_dma;
> =20
>         return 0;
> -}
> -
> -static void ti_csi2rx_cleanup_dma(struct ti_csi2rx_dev *csi)
> -{
> -       dma_free_coherent(csi->dev, csi->dma.drain.len,
> -                         csi->dma.drain.vaddr, csi->dma.drain.paddr);
> -       csi->dma.drain.vaddr =3D NULL;
> -       dma_release_channel(csi->dma.chan);
> -}
> -
> -static void ti_csi2rx_cleanup_v4l2(struct ti_csi2rx_dev *csi)
> -{
> -       media_device_unregister(&csi->mdev);
> -       v4l2_device_unregister(&csi->v4l2_dev);
> -       media_device_cleanup(&csi->mdev);
> -}
> -
> -static void ti_csi2rx_cleanup_subdev(struct ti_csi2rx_dev *csi)
> -{
> -       v4l2_async_nf_unregister(&csi->notifier);
> -       v4l2_async_nf_cleanup(&csi->notifier);
> -}
> =20
> -static void ti_csi2rx_cleanup_vb2q(struct ti_csi2rx_dev *csi)
> -{
> -       vb2_queue_release(&csi->vidq);
> +cleanup_dma:
> +       dma_release_channel(ctx->dma.chan);
> +       return ret;
>  }
> =20
>  static int ti_csi2rx_probe(struct platform_device *pdev)
>  {
>         struct ti_csi2rx_dev *csi;
> -       int ret;
> +       int ret, i;
> =20
>         csi =3D devm_kzalloc(&pdev->dev, sizeof(*csi), GFP_KERNEL);
>         if (!csi)
> @@ -1115,62 +1152,69 @@ static int ti_csi2rx_probe(struct platform_device=
 *pdev)
>         csi->dev =3D &pdev->dev;
>         platform_set_drvdata(pdev, csi);
> =20
> -       mutex_init(&csi->mutex);
>         csi->shim =3D devm_platform_ioremap_resource(pdev, 0);
>         if (IS_ERR(csi->shim)) {
>                 ret =3D PTR_ERR(csi->shim);
> -               goto err_mutex;
> +               return ret;
>         }
> =20
> -       ret =3D ti_csi2rx_init_dma(csi);
> -       if (ret)
> -               goto err_mutex;
> +       csi->drain.len =3D DRAIN_BUFFER_SIZE;
> +       csi->drain.vaddr =3D dma_alloc_coherent(csi->dev, csi->drain.len,
> +                                             &csi->drain.paddr,
> +                                             GFP_KERNEL);
> +       if (!csi->drain.vaddr)
> +               return -ENOMEM;
> =20
>         ret =3D ti_csi2rx_v4l2_init(csi);
> -       if (ret)
> -               goto err_dma;
> -
> -       ret =3D ti_csi2rx_init_vb2q(csi);
>         if (ret)
>                 goto err_v4l2;
> =20
> +       for (i =3D 0; i < TI_CSI2RX_NUM_CTX; i++) {
> +               csi->ctx[i].idx =3D i;
> +               csi->ctx[i].csi =3D csi;
> +               ret =3D ti_csi2rx_init_ctx(&csi->ctx[i]);
> +               if (ret)
> +                       goto err_ctx;
> +       }
> +
>         ret =3D ti_csi2rx_notifier_register(csi);
>         if (ret)
> -               goto err_vb2q;
> +               goto err_ctx;
> =20
>         ret =3D devm_of_platform_populate(csi->dev);
>         if (ret) {
>                 dev_err(csi->dev, "Failed to create children: %d\n", ret);
> -               goto err_subdev;
> +               goto err_notifier;
>         }
> =20
>         return 0;
> =20
> -err_subdev:
> -       ti_csi2rx_cleanup_subdev(csi);
> -err_vb2q:
> -       ti_csi2rx_cleanup_vb2q(csi);
> -err_v4l2:
> +err_notifier:
> +       ti_csi2rx_cleanup_notifier(csi);
> +err_ctx:
> +       i--;
> +       for (; i >=3D 0; i--)
> +               ti_csi2rx_cleanup_ctx(&csi->ctx[i]);
>         ti_csi2rx_cleanup_v4l2(csi);
> -err_dma:
> -       ti_csi2rx_cleanup_dma(csi);
> -err_mutex:
> -       mutex_destroy(&csi->mutex);
> +err_v4l2:
> +       dma_free_coherent(csi->dev, csi->drain.len, csi->drain.vaddr,
> +                         csi->drain.paddr);
>         return ret;
>  }
> =20
>  static void ti_csi2rx_remove(struct platform_device *pdev)
>  {
>         struct ti_csi2rx_dev *csi =3D platform_get_drvdata(pdev);
> +       unsigned int i;
> =20
> -       video_unregister_device(&csi->vdev);
> +       for (i =3D 0; i < TI_CSI2RX_NUM_CTX; i++)
> +               ti_csi2rx_cleanup_ctx(&csi->ctx[i]);
> =20
> -       ti_csi2rx_cleanup_vb2q(csi);
> -       ti_csi2rx_cleanup_subdev(csi);
> +       ti_csi2rx_cleanup_notifier(csi);
>         ti_csi2rx_cleanup_v4l2(csi);
> -       ti_csi2rx_cleanup_dma(csi);
> =20
> -       mutex_destroy(&csi->mutex);
> +       dma_free_coherent(csi->dev, csi->drain.len, csi->drain.vaddr,
> +                         csi->drain.paddr);
>  }
> =20
>  static const struct of_device_id ti_csi2rx_of_match[] =3D {
> --=20
> 2.34.1
>=20


Thanks,
    Jai

