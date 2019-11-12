Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07B5CF8EF5
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2019 12:51:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727122AbfKLLvU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Nov 2019 06:51:20 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:55825 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725775AbfKLLvU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Nov 2019 06:51:20 -0500
X-Originating-IP: 93.34.114.233
Received: from uno.localdomain (93-34-114-233.ip49.fastwebnet.it [93.34.114.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 3BA914000A;
        Tue, 12 Nov 2019 11:51:17 +0000 (UTC)
Date:   Tue, 12 Nov 2019 12:53:11 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] rcar-vin: Add support for V4L2_FIELD_SEQ_{TB,BT}
Message-ID: <20191112115311.6f5xvxplqxfqkh5t@uno.localdomain>
References: <20191009222734.1911060-1-niklas.soderlund+renesas@ragnatech.se>
 <20191009222734.1911060-3-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="cyehlicuweltqj2q"
Content-Disposition: inline
In-Reply-To: <20191009222734.1911060-3-niklas.soderlund+renesas@ragnatech.se>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--cyehlicuweltqj2q
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Thu, Oct 10, 2019 at 12:27:34AM +0200, Niklas S=C3=B6derlund wrote:
> The hardware does not support capturing the field types
> V4L2_FIELD_SEQ_TB and V4L2_FIELD_SEQ_BT. To capture in these formats the
> driver needs to adjust the offset of the capture buffer and capture
> twice to each vb2 buffer.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> ---
>  drivers/media/platform/rcar-vin/rcar-dma.c  | 57 ++++++++++++++++++---
>  drivers/media/platform/rcar-vin/rcar-v4l2.c |  7 ++-
>  drivers/media/platform/rcar-vin/rcar-vin.h  | 19 +++++++
>  3 files changed, 74 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/p=
latform/rcar-vin/rcar-dma.c
> index a9fffadc268e96ba..c46f6e90627d45fd 100644
> --- a/drivers/media/platform/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/rcar-vin/rcar-dma.c
> @@ -534,7 +534,7 @@ static void rvin_crop_scale_comp_gen2(struct rvin_dev=
 *vin)
>
>  	/* Set scaling coefficient */
>  	crop_height =3D vin->crop.height;
> -	if (V4L2_FIELD_IS_INTERLACED(vin->format.field))
> +	if (V4L2_FIELD_HAS_BOTH(vin->format.field))
>  		crop_height *=3D 2;

Below in this same function there is a check for IS_INTERLACED which
has not been updated. It seems to be related to the post-clipping
image height, which I'm not sure happens on the full frame or on the
filed first. Could you confirm this was intentionally left out ?

>
>  	ys =3D 0;
> @@ -625,6 +625,8 @@ static int rvin_setup(struct rvin_dev *vin)
>  	case V4L2_FIELD_INTERLACED_BT:
>  		vnmc =3D VNMC_IM_FULL | VNMC_FOC;
>  		break;
> +	case V4L2_FIELD_SEQ_TB:
> +	case V4L2_FIELD_SEQ_BT:

Shouldn't you handle FOC depending on TB or BT ?

>  	case V4L2_FIELD_NONE:
>  		vnmc =3D VNMC_IM_ODD_EVEN;
>  		progressive =3D true;
> @@ -839,15 +841,23 @@ static void rvin_fill_hw_slot(struct rvin_dev *vin,=
 int slot)
>  	struct rvin_buffer *buf;
>  	struct vb2_v4l2_buffer *vbuf;
>  	dma_addr_t phys_addr;
> +	int prev;
>
>  	/* A already populated slot shall never be overwritten. */
>  	if (WARN_ON(vin->buf_hw[slot].buffer !=3D NULL))
>  		return;
>
> -	vin_dbg(vin, "Filling HW slot: %d\n", slot);
> +	prev =3D (slot =3D=3D 0 ? HW_BUFFER_NUM : slot) - 1;
>
> -	if (list_empty(&vin->buf_list)) {
> +	if (vin->buf_hw[prev].type =3D=3D HALF_TOP) {
> +		vbuf =3D vin->buf_hw[prev].buffer;
> +		vin->buf_hw[slot].buffer =3D vbuf;
> +		vin->buf_hw[slot].type =3D HALF_BOTTOM;
> +		phys_addr =3D vin->buf_hw[prev].phys + vin->format.sizeimage /
> +			(vin->format.pixelformat =3D=3D V4L2_PIX_FMT_NV16 ? 4 : 2);

Shouldn't NV12 be handled as well ? in that case the sizeimage field
is set to bytesperlin * height * 3 / 2, and should here be halved
accordingly, doesn't it ?


> +	} else if (list_empty(&vin->buf_list)) {
>  		vin->buf_hw[slot].buffer =3D NULL;
> +		vin->buf_hw[slot].type =3D FULL;
>  		phys_addr =3D vin->scratch_phys;
>  	} else {
>  		/* Keep track of buffer we give to HW */
> @@ -856,10 +866,18 @@ static void rvin_fill_hw_slot(struct rvin_dev *vin,=
 int slot)
>  		list_del_init(to_buf_list(vbuf));
>  		vin->buf_hw[slot].buffer =3D vbuf;
>
> +		vin->buf_hw[slot].type =3D
> +			V4L2_FIELD_IS_SEQUENTIAL(vin->format.field) ?
> +			HALF_TOP : FULL;
> +
>  		/* Setup DMA */
>  		phys_addr =3D vb2_dma_contig_plane_dma_addr(&vbuf->vb2_buf, 0);
>  	}
>
> +	vin_dbg(vin, "Filling HW slot: %d type: %d buffer: %p\n",
> +		slot, vin->buf_hw[slot].type, vin->buf_hw[slot].buffer);
> +
> +	vin->buf_hw[slot].phys =3D phys_addr;
>  	rvin_set_slot_addr(vin, slot, phys_addr);
>  }
>
> @@ -867,6 +885,11 @@ static int rvin_capture_start(struct rvin_dev *vin)
>  {
>  	int slot, ret;
>
> +	for (slot =3D 0; slot < HW_BUFFER_NUM; slot++) {
> +		vin->buf_hw[slot].buffer =3D NULL;
> +		vin->buf_hw[slot].type =3D FULL;
> +	}
> +
>  	for (slot =3D 0; slot < HW_BUFFER_NUM; slot++)
>  		rvin_fill_hw_slot(vin, slot);
>
> @@ -951,6 +974,16 @@ static irqreturn_t rvin_irq(int irq, void *data)
>
>  	/* Capture frame */
>  	if (vin->buf_hw[slot].buffer) {
> +		/*
> +		 * Nothing to do but refill the hardware slot if
> +		 * capture only filled first half of vb2 buffer.
> +		 */
> +		if (vin->buf_hw[slot].type =3D=3D HALF_TOP) {
> +			vin->buf_hw[slot].buffer =3D NULL;
> +			rvin_fill_hw_slot(vin, slot);
> +			goto done;
> +		}
> +
>  		vin->buf_hw[slot].buffer->field =3D
>  			rvin_get_active_field(vin, vnms);
>  		vin->buf_hw[slot].buffer->sequence =3D vin->sequence;
> @@ -978,14 +1011,22 @@ static void return_all_buffers(struct rvin_dev *vi=
n,
>  			       enum vb2_buffer_state state)
>  {
>  	struct rvin_buffer *buf, *node;
> -	int i;
> +	struct vb2_v4l2_buffer *freed[HW_BUFFER_NUM];
> +	unsigned int i, n;
>
>  	for (i =3D 0; i < HW_BUFFER_NUM; i++) {
> -		if (vin->buf_hw[i].buffer) {
> -			vb2_buffer_done(&vin->buf_hw[i].buffer->vb2_buf,
> -					state);
> -			vin->buf_hw[i].buffer =3D NULL;
> +		freed[i] =3D vin->buf_hw[i].buffer;
> +		vin->buf_hw[i].buffer =3D NULL;
> +
> +		for (n =3D 0; n < i; n++) {
> +			if (freed[i] =3D=3D freed[n]) {
> +				freed[i] =3D NULL;
> +				break;
> +			}

I'm not sure I get this...

>  		}
> +
> +		if (freed[i])
> +			vb2_buffer_done(&freed[i]->vb2_buf, state);
>  	}
>
>  	list_for_each_entry_safe(buf, node, &vin->buf_list, list) {
> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/=
platform/rcar-vin/rcar-v4l2.c
> index 9a9b89c0dc0b3be4..cbdb0a43aa439830 100644
> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> @@ -90,7 +90,10 @@ static u32 rvin_format_bytesperline(struct rvin_dev *v=
in,
>  	if (WARN_ON(!fmt))
>  		return -EINVAL;
>
> -	align =3D pix->pixelformat =3D=3D V4L2_PIX_FMT_NV16 ? 0x20 : 0x10;
> +	if (V4L2_FIELD_IS_SEQUENTIAL(pix->field))
> +		align =3D 0x80;
> +	else
> +		align =3D pix->pixelformat =3D=3D V4L2_PIX_FMT_NV16 ? 0x20 : 0x10;
>
>  	return ALIGN(pix->width, align) * fmt->bpp;
>  }
> @@ -118,6 +121,8 @@ static void rvin_format_align(struct rvin_dev *vin, s=
truct v4l2_pix_format *pix)
>  	case V4L2_FIELD_INTERLACED_BT:
>  	case V4L2_FIELD_INTERLACED:
>  	case V4L2_FIELD_ALTERNATE:
> +	case V4L2_FIELD_SEQ_TB:
> +	case V4L2_FIELD_SEQ_BT:
>  		break;
>  	default:
>  		pix->field =3D RVIN_DEFAULT_FIELD;
> diff --git a/drivers/media/platform/rcar-vin/rcar-vin.h b/drivers/media/p=
latform/rcar-vin/rcar-vin.h
> index 9031fe7f569b908e..8d48894bc49e4db6 100644
> --- a/drivers/media/platform/rcar-vin/rcar-vin.h
> +++ b/drivers/media/platform/rcar-vin/rcar-vin.h
> @@ -60,6 +60,23 @@ enum rvin_dma_state {
>  	STOPPING,
>  };
>
> +/**
> + * enum rvin_buffer_type
> + *
> + * Describes how a buffer is given to the hardware. To be able
> + * to capture SEQ_TB/BT it's needed to capture to the same vb2
> + * buffer twice so the type of buffer needs to be kept.
> + *
> + * FULL - One capture fills the whole vb2 buffer
> + * HALF_TOP- One capture fills the top half of the vb2 buffer

nit: HALF_TOP -

> + * HALF_BOTTOM - One capture fills the bottom half of the vb2 buffer

Isn't documentation generated for VIN ? I was about to suggest to
prefix the enum members documentation with @ but I don't see any VIN
documentation...

Thanks
   j


> + */
> +enum rvin_buffer_type {
> +	FULL,
> +	HALF_TOP,
> +	HALF_BOTTOM,
> +};
> +
>  /**
>   * struct rvin_video_format - Data format stored in memory
>   * @fourcc:	Pixelformat
> @@ -204,6 +221,8 @@ struct rvin_dev {
>  	spinlock_t qlock;
>  	struct {
>  		struct vb2_v4l2_buffer *buffer;
> +		enum rvin_buffer_type type;
> +		dma_addr_t phys;
>  	} buf_hw[HW_BUFFER_NUM];
>  	struct list_head buf_list;
>  	unsigned int sequence;
> --
> 2.23.0
>

--cyehlicuweltqj2q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl3KnScACgkQcjQGjxah
VjwVVBAApVSCO92+2nOr+B9hgK6isODs83KanP7wWPC6Cks/iMykoPC1gReKqIJC
Txy5M3BzB+kIAF5FEJLlKSfzN1SRScaKvxwUKD6J+lelrJeJRx7Pb3TR9A57TUhM
M7PWu9jbTqt+DjfV72817NWEbhZx9AkMQulcTH+GFEyihQTcC9+ilnL7WqISf4f4
h4LWP5mJ8W0o94zwgkbnYpsPvbUNIOpnWFmaD+kna61718UwqFJvoCZkKPCDDOhj
Z0t4CHZ0+88Fyubk/aoyxmkOGsUOaOi6MGkz99rcogr4dr7/bPAWct4kb11DYYNd
Qygra9Pr6dTH/YwSLzozDs1/zzs1ZQSa87CXYLUw7H5yHYbLeWBYAdQcW07JJTng
5E/LgnWjhNOhb3FrOQtPTcPLkcKZ2ucHemqCgDbQivRk27NQZRVNaaVyDb2q7Evz
N9PKwemoxoZ9jngHv9kb+mDYQzkL14uPcE+Q7J6XJGWsbV6psoTpDMxEQvX20gO8
jLo5CmjK99yvc4pd0hTgVz2KnZBDQyeTNLjdXTYZyr7oDxbWbSDGtxKmPvAA9QNU
fCzDQbfC5QEutqkXPKjv76817/nHQTkAcWr7KDFTN23xLTk9eg8H949quOaZD/h8
wtlA4vnpvMWSvA1nEjZGUaIba4Zyh0IY6tJrjVzZnFASylm992w=
=wgCY
-----END PGP SIGNATURE-----

--cyehlicuweltqj2q--
