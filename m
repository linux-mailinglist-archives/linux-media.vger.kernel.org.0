Return-Path: <linux-media+bounces-41244-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AB30FB39B42
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 13:14:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6F9524E4240
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 11:14:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFB8530E0D1;
	Thu, 28 Aug 2025 11:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="u2RJJowG"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20DC279798;
	Thu, 28 Aug 2025 11:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756379636; cv=none; b=EEZeR8zUDQ95hs2QH420URQNHkyrBNiDLKFcIADWtqbWLr92GNMdCU2hcoN4XuOey6kPmOVR5761tgGRcuwGGvrPcDWhSJd/sh6XRGvXHJ46NjvLmyzlBm7Dt59IYb+ZJCJHL7DsZjY3G3fSJQWq5qYxnoZ1isiXa1U25j/cAlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756379636; c=relaxed/simple;
	bh=ZlMzfEU+OdSa0mkz6+PAzGz67knIN4MmLEFxeKzh3xc=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=E9iIUKQmEbV8Wur4hOW4hldN5LHQU7aRBb7U9eYkf3a+9GKZxoyyB4F5rlsZq8+HrdpQZs+/ATtBILPyRJ86+1QujYzPfwslsBtYwRMqHA0oJQpBUZwoZemMb+q3mv4ZX5kWDfkIMZK6W07muldOUoMA+9zcQW4nUcbwnSsvzH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=u2RJJowG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:1331:996f:e361:948:c527])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2274E20EE;
	Thu, 28 Aug 2025 13:12:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756379567;
	bh=ZlMzfEU+OdSa0mkz6+PAzGz67knIN4MmLEFxeKzh3xc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=u2RJJowGeffhqffaqSWXSUCBieb3uLWVA/X/Tl9CDfHxAmTXjrv4Aw8HMO+H1nM7j
	 Txv+u/oFjefI3RcOZEsW8j2V1WiXZE8nXfcEROGUPiOQQpvXlRJNQUTq2LaLyWucYp
	 48KjVImf8hBxyMe62J2fMS+/dk/boQMT2PZ7rsOI=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250825142522.1826188-10-r-donadkar@ti.com>
References: <20250825142522.1826188-1-r-donadkar@ti.com> <20250825142522.1826188-10-r-donadkar@ti.com>
Subject: Re: [PATCH v5 09/14] media: ti: j721e-csi2rx: add support for processing virtual channels
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: r-donadkar@ti.com, y-abhilashchandra@ti.com, devarsht@ti.com, vaishnav.a@ti.com, s-jain1@ti.com, vigneshr@ti.com, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl, tomi.valkeinen@ideasonboard.com, changhuang.liang@starfivetech.com, jack.zhu@starfivetech.com, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org
To: Rishikesh Donadkar <r-donadkar@ti.com>, jai.luthra@linux.dev, laurent.pinchart@ideasonboard.com, mripard@kernel.org
Date: Thu, 28 Aug 2025 16:43:46 +0530
Message-ID: <175637962616.1633224.4699307874299488136@freya>
User-Agent: alot/0.12.dev28+gd2c823fe

Quoting Rishikesh Donadkar (2025-08-25 19:55:17)
> From: Jai Luthra <j-luthra@ti.com>
>=20
> Use get_frame_desc() to get the frame desc from the connected source,
> and use the provided virtual channel instead of hardcoded one.
>=20
> get_frame_desc() returns the same information when called on each stream
> start, so instead get the VCs for all the routed stream at first
> stream start and cache this information in the driver.
>=20
> get_frame_desc() works per stream, but as we don't support multiple
> streams yet, we will just always use stream 0. If the source doesn't
> support get_frame_desc(), fall back to the previous method of always
> capturing virtual channel 0.
>=20
> Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> Co-developed-by: Pratyush Yadav <p.yadav@ti.com>
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> ---
>  .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 108 ++++++++++++++++++
>  1 file changed, 108 insertions(+)
>=20
> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/driv=
ers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> index 6cab7642aa10..45e9001fa35b 100644
> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> @@ -32,6 +32,7 @@
>  #define SHIM_DMACNTX_YUV422            GENMASK(27, 26)
>  #define SHIM_DMACNTX_DUAL_PCK_CFG      BIT(24)
>  #define SHIM_DMACNTX_SIZE              GENMASK(21, 20)
> +#define SHIM_DMACNTX_VC                        GENMASK(9, 6)
>  #define SHIM_DMACNTX_FMT               GENMASK(5, 0)
>  #define SHIM_DMACNTX_YUV422_MODE_11    3
>  #define SHIM_DMACNTX_SIZE_8            0
> @@ -103,6 +104,7 @@ struct ti_csi2rx_dev;
> =20
>  struct ti_csi2rx_ctx {
>         struct ti_csi2rx_dev            *csi;
> +       struct v4l2_subdev_route        *route;
>         struct video_device             vdev;
>         struct vb2_queue                vidq;
>         struct mutex                    mutex; /* To serialize ioctls. */
> @@ -111,6 +113,8 @@ struct ti_csi2rx_ctx {
>         struct media_pad                pad;
>         u32                             sequence;
>         u32                             idx;
> +       u32                             vc;
> +       u32                             stream;
>  };
> =20
>  struct ti_csi2rx_dev {
> @@ -134,6 +138,7 @@ struct ti_csi2rx_dev {
>                 dma_addr_t              paddr;
>                 size_t                  len;
>         } drain;
> +       bool                            vc_cached;
>  };
> =20
>  static inline struct ti_csi2rx_dev *to_csi2rx_dev(struct v4l2_subdev *sd)
> @@ -614,6 +619,7 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_ctx=
 *ctx)
>         }
> =20
>         reg |=3D FIELD_PREP(SHIM_DMACNTX_SIZE, fmt->size);
> +       reg |=3D FIELD_PREP(SHIM_DMACNTX_VC, ctx->vc);
> =20
>         writel(reg, csi->shim + SHIM_DMACNTX(ctx->idx));
> =20
> @@ -887,6 +893,83 @@ static void ti_csi2rx_buffer_queue(struct vb2_buffer=
 *vb)
>         }
>  }
> =20
> +static int ti_csi2rx_get_route(struct ti_csi2rx_ctx *ctx)
> +{
> +       struct ti_csi2rx_dev *csi =3D ctx->csi;
> +       struct media_pad *pad;
> +       struct v4l2_subdev_state *state;
> +       struct v4l2_subdev_route *r;
> +
> +       /* Get the source pad connected to this ctx */
> +       pad =3D media_entity_remote_source_pad_unique(ctx->pad.entity);
> +       if (!pad) {
> +               dev_err(csi->dev, "No pad connected to ctx %d\n", ctx->id=
x);
> +               v4l2_subdev_unlock_state(state);

Here the state =3D=3D NULL.

I think this is broken since v4. Please fix in the next one.

> +               return -ENODEV;
> +       }
> +
> +       state =3D v4l2_subdev_lock_and_get_active_state(&csi->subdev);
> +
> +       for_each_active_route(&state->routing, r) {
> +               if (!(r->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
> +                       continue;
> +               if (r->source_pad !=3D pad->index)
> +                       continue;
> +
> +               ctx->route =3D r;
> +       }
> +
> +       v4l2_subdev_unlock_state(state);
> +
> +       if (!ctx->route)
> +               return -ENODEV;
> +
> +       return 0;
> +}
> +
> +static int ti_csi2rx_get_vc(struct ti_csi2rx_ctx *ctx)
> +{
> +       struct ti_csi2rx_dev *csi =3D ctx->csi;
> +       struct ti_csi2rx_ctx *curr_ctx;
> +       struct v4l2_mbus_frame_desc fd;
> +       struct media_pad *source_pad;
> +       struct v4l2_subdev_route *curr_route;
> +       int ret;
> +       unsigned int i, j;
> +
> +       /* Get the frame desc form source */
> +       source_pad =3D media_entity_remote_pad_unique(&csi->subdev.entity=
, MEDIA_PAD_FL_SOURCE);
> +       if (!source_pad)
> +               return -ENODEV;
> +
> +       ret =3D v4l2_subdev_call(csi->source, pad, get_frame_desc, source=
_pad->index, &fd);
> +       if (ret)
> +               return ret;
> +
> +       if (fd.type !=3D V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
> +               return -EINVAL;
> +
> +       for (i =3D 0; i < csi->num_ctx; i++) {
> +               curr_ctx =3D &csi->ctx[i];
> +
> +               /* Capture VC 0 by default */
> +               curr_ctx->vc =3D 0;
> +
> +               ret =3D ti_csi2rx_get_route(curr_ctx);
> +               if (ret)
> +                       continue;
> +
> +               curr_route =3D curr_ctx->route;
> +               curr_ctx->stream =3D curr_route->sink_stream;
> +
> +               for (j =3D 0; j < fd.num_entries; j++)
> +                       if (curr_ctx->stream =3D=3D fd.entry[j].stream)
> +                               curr_ctx->vc =3D fd.entry[j].bus.csi2.vc;
> +       }
> +
> +       return 0;
> +}
> +
>  static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int =
count)
>  {
>         struct ti_csi2rx_ctx *ctx =3D vb2_get_drv_priv(vq);
> @@ -907,6 +990,25 @@ static int ti_csi2rx_start_streaming(struct vb2_queu=
e *vq, unsigned int count)
>         if (ret)
>                 goto err;
> =20
> +       /* If no stream is routed to this ctx, exit early */
> +       ret =3D ti_csi2rx_get_route(ctx);
> +       if (ret)
> +               goto err;
> +
> +       /* Get the VC for all enabled ctx on first stream start */
> +       mutex_lock(&csi->mutex);
> +       if (!csi->vc_cached) {
> +               ret =3D ti_csi2rx_get_vc(ctx);
> +               if (ret =3D=3D -ENOIOCTLCMD) {
> +                       ctx->vc =3D 0;
> +               } else if (ret < 0) {
> +                       mutex_unlock(&csi->mutex);
> +                       goto err;
> +               }
> +               csi->vc_cached =3D true;
> +       }
> +       mutex_unlock(&csi->mutex);
> +
>         ti_csi2rx_setup_shim(ctx);
> =20
>         ctx->sequence =3D 0;
> @@ -953,6 +1055,10 @@ static void ti_csi2rx_stop_streaming(struct vb2_que=
ue *vq)
>         writel(0, csi->shim + SHIM_CNTL);
>         writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
> =20
> +       mutex_lock(&csi->mutex);
> +       csi->vc_cached =3D false;
> +       mutex_unlock(&csi->mutex);
> +
>         ret =3D v4l2_subdev_call(&csi->subdev, video, s_stream, 0);
>         if (ret)
>                 dev_err(csi->dev, "Failed to stop subdev stream\n");
> @@ -1306,6 +1412,8 @@ static int ti_csi2rx_init_ctx(struct ti_csi2rx_ctx =
*ctx)
> =20
>         ti_csi2rx_fill_fmt(fmt, &ctx->v_fmt);
> =20
> +       ctx->route =3D NULL;
> +
>         ctx->pad.flags =3D MEDIA_PAD_FL_SINK;
>         vdev->entity.ops =3D &ti_csi2rx_video_entity_ops;
>         ret =3D media_entity_pads_init(&ctx->vdev.entity, 1, &ctx->pad);
> --=20
> 2.34.1
>

