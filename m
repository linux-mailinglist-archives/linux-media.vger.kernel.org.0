Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23BC311A9C1
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2019 12:20:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728027AbfLKLUo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Dec 2019 06:20:44 -0500
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:50727 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727469AbfLKLUo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Dec 2019 06:20:44 -0500
X-Originating-IP: 93.34.114.233
Received: from uno.localdomain (93-34-114-233.ip49.fastwebnet.it [93.34.114.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id EF352FF806;
        Wed, 11 Dec 2019 11:20:39 +0000 (UTC)
Date:   Wed, 11 Dec 2019 12:22:46 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 2/2] rcar-vin: Add support for V4L2_FIELD_SEQ_{TB,BT}
Message-ID: <20191211112246.osfjrpkckcmadra4@uno.localdomain>
References: <20191210020559.170594-1-niklas.soderlund+renesas@ragnatech.se>
 <20191210020559.170594-3-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2rxkdho4z5z7doaw"
Content-Disposition: inline
In-Reply-To: <20191210020559.170594-3-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--2rxkdho4z5z7doaw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Tue, Dec 10, 2019 at 03:05:59AM +0100, Niklas S=C3=B6derlund wrote:
> The hardware does not support capturing the field types
> V4L2_FIELD_SEQ_TB and V4L2_FIELD_SEQ_BT. To capture in these formats the
> driver needs to adjust the offset of the capture buffer and capture
> twice to each vb2 buffer.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> ---
>  drivers/media/platform/rcar-vin/rcar-dma.c  | 68 ++++++++++++++++++---
>  drivers/media/platform/rcar-vin/rcar-v4l2.c |  5 ++
>  drivers/media/platform/rcar-vin/rcar-vin.h  | 19 ++++++
>  3 files changed, 83 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/p=
latform/rcar-vin/rcar-dma.c
> index cd1778977b2ba56e..f50b615eda36c107 100644
> --- a/drivers/media/platform/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/rcar-vin/rcar-dma.c
> @@ -535,7 +535,7 @@ static void rvin_crop_scale_comp_gen2(struct rvin_dev=
 *vin)
>
>  	/* Set scaling coefficient */
>  	crop_height =3D vin->crop.height;
> -	if (V4L2_FIELD_IS_INTERLACED(vin->format.field))
> +	if (V4L2_FIELD_HAS_BOTH(vin->format.field))
>  		crop_height *=3D 2;
>
>  	ys =3D 0;
> @@ -564,7 +564,7 @@ static void rvin_crop_scale_comp_gen2(struct rvin_dev=
 *vin)
>  	rvin_write(vin, 0, VNSLPOC_REG);
>  	rvin_write(vin, vin->format.width - 1, VNEPPOC_REG);
>
> -	if (V4L2_FIELD_IS_INTERLACED(vin->format.field))
> +	if (V4L2_FIELD_HAS_BOTH(vin->format.field))
>  		rvin_write(vin, vin->format.height / 2 - 1, VNELPOC_REG);
>  	else
>  		rvin_write(vin, vin->format.height - 1, VNELPOC_REG);
> @@ -626,6 +626,8 @@ static int rvin_setup(struct rvin_dev *vin)
>  	case V4L2_FIELD_INTERLACED_BT:
>  		vnmc =3D VNMC_IM_FULL | VNMC_FOC;
>  		break;
> +	case V4L2_FIELD_SEQ_TB:
> +	case V4L2_FIELD_SEQ_BT:
>  	case V4L2_FIELD_NONE:
>  		vnmc =3D VNMC_IM_ODD_EVEN;
>  		progressive =3D true;
> @@ -842,15 +844,32 @@ static void rvin_fill_hw_slot(struct rvin_dev *vin,=
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
> +		switch (vin->format.pixelformat) {
> +		case V4L2_PIX_FMT_NV12:
> +		case V4L2_PIX_FMT_NV16:
> +			phys_addr =3D vin->buf_hw[prev].phys +
> +				vin->format.sizeimage / 4;

Thanks for your reply on v2, but I'm still a bit puzzled, but it
might just be my poor understanding of the issue.

=46rom your reply I get that you want to end up with:

start ->+---------+   /
        |  Y odd  |   |
irq <-  +---------+   | v
        |  Y even |   | b
irq <-  +---------+   | u
        |CbCr  odd|   | f
irq <-  +---------+   |
        |CbCr even|   |
irq <-  +---------+   /

and to do so you advance phys addrs by 1/4 every time.
Did I get you right ?

I would have expected multiplanar formats when sent as TB/BT

       +---------+   /
       |  Y odd  |   |
       +---------+   | HALF_TOP
       |CbCr odd |   |
       +---------+   /
       |  Y even |   |
       +---------+   | HALF_BOTTOM
       |CbCr even|   |
       +---------+   /

And the final buffer, after 2 irqs to look like

start ->+---------+   /
        |  Y odd  |   |
        +---------+   | v
        |CbCr odd |   | b
irq <-  +---------+   | u
        |  Y even |   | f
        +---------+   |
        |CbCr even|   |
irq <-  +---------+   /

Have you tested NV12/NV16 ? what am I missing ?

> +			break;
> +		default:
> +			phys_addr =3D vin->buf_hw[prev].phys +
> +				vin->format.sizeimage / 2;

Nit: please align the + signe below the =3D, or align vin->format with
vin->buf... As you like it the most, as there are no other occurences
in the diver of multi-line operations like this one.


> +			break;
> +		}
> +	} else if (list_empty(&vin->buf_list)) {
>  		vin->buf_hw[slot].buffer =3D NULL;
> +		vin->buf_hw[slot].type =3D FULL;
>  		phys_addr =3D vin->scratch_phys;
>  	} else {
>  		/* Keep track of buffer we give to HW */
> @@ -859,10 +878,18 @@ static void rvin_fill_hw_slot(struct rvin_dev *vin,=
 int slot)
>  		list_del_init(to_buf_list(vbuf));
>  		vin->buf_hw[slot].buffer =3D vbuf;
>
> +		vin->buf_hw[slot].type =3D
> +			V4L2_FIELD_IS_SEQUENTIAL(vin->format.field) ?
> +			HALF_TOP : FULL;
> +

This seems sane, but do you think it would be more readable if the
whole
        if (HALF_TOP) {

        } else if (list_empty(&vin->buf_list)) {

        } else { /* which catches HALF_BOTTOM and FULL */

        }

could be re-structured as:

	if (list_empty(&vin->buf_list)) {
		vin->buf_hw[slot].buffer =3D NULL;
		vin->buf_hw[slot].type =3D FULL;
		vin->buf_hw[slot].phys =3D vin->scratch_phys;
		rvin_set_slot_addr(vin, slot, phys_addr);

		return;
	}

	switch (vin_buf_hw[prev].type) {
	case HALF_TOP:

		break;
	case HALF_BOTTOM:
	case FULL:

		break;
	}

>  		/* Setup DMA */

Even if you want to keep the current code structure, could you drop
these comments, as the same happens in the if (HALF_TOP) branch, but
it's only commented here. It feels a bit weird looking at the end
result

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
> @@ -870,6 +897,11 @@ static int rvin_capture_start(struct rvin_dev *vin)
>  {
>  	int slot, ret;

slot is an unsigned int

Actually rvin_fill_hw_slot() takes an int. Why so ?

>
> +	for (slot =3D 0; slot < HW_BUFFER_NUM; slot++) {
> +		vin->buf_hw[slot].buffer =3D NULL;
> +		vin->buf_hw[slot].type =3D FULL;
> +	}
> +
>  	for (slot =3D 0; slot < HW_BUFFER_NUM; slot++)
>  		rvin_fill_hw_slot(vin, slot);
>
> @@ -954,6 +986,16 @@ static irqreturn_t rvin_irq(int irq, void *data)
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

Have you considered jumping to the below rvin_fill_hw_slot() which is
just one line above the 'done' label you jump to here ?
Could you
                        goto fill_hw_slot;

?

Bonus point if you can avoid to duplicate
			vin->buf_hw[slot].buffer =3D NULL;

How would something like this look like ?

	if (vin->buf_hw[slot].buffer) {
  		struct vb2_v4l2_buffer *done =3D vin->buf_hw[slot].buffer;
                vin->buf_hw[slot].buffer =3D NULL;

		/*
		 * Nothing to do but refill the hardware slot if
		 * capture only filled first half of vb2 buffer.
		 */
		if (vin->buf_hw[slot].type =3D=3D HALF_TOP)
                        goto fill_hw_slot;

		done->field =3D rvin_get_active_field(vin, vnms);
		done->sequence =3D vin->sequence;
		done->vb2_buf.timestamp =3D ktime_get_ns();
		vb2_buffer_done(&done->vb2_buf, VB2_BUF_STATE_DONE);
       }

> +			goto done;
> +		}
> +
>  		vin->buf_hw[slot].buffer->field =3D
>  			rvin_get_active_field(vin, vnms);
>  		vin->buf_hw[slot].buffer->sequence =3D vin->sequence;
> @@ -981,14 +1023,22 @@ static void return_all_buffers(struct rvin_dev *vi=
n,
>  			       enum vb2_buffer_state state)
>  {
>  	struct rvin_buffer *buf, *node;
> -	int i;
> +	struct vb2_v4l2_buffer *freed[HW_BUFFER_NUM];
> +	unsigned int i, n;

nit: you could keep n inside the for loop if I'm not mistaken

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
>  		}
> +
> +		if (freed[i])
> +			vb2_buffer_done(&freed[i]->vb2_buf, state);
>  	}
>
>  	list_for_each_entry_safe(buf, node, &vin->buf_list, list) {
> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/=
platform/rcar-vin/rcar-v4l2.c
> index 9e2e63ffcc47acad..7ab938ae93826675 100644
> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> @@ -107,6 +107,9 @@ static u32 rvin_format_bytesperline(struct rvin_dev *=
vin,
>  		break;
>  	}
>
> +	if (V4L2_FIELD_IS_SEQUENTIAL(pix->field))
> +		align =3D 0x80;
> +
>  	return ALIGN(pix->width, align) * fmt->bpp;
>  }
>
> @@ -137,6 +140,8 @@ static void rvin_format_align(struct rvin_dev *vin, s=
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
> index 0aa904a4af5b0a97..c19d077ce1cb4f4b 100644
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

I would say that it describes how the frame's fields are expected to
be received and stored into memory, with FULL describing progressive
capture operations where one pass fills the whole memory buffer and
HALF_TOP/HALF_BOTTOM describing sequential interlaced capture
operations where to capture a full frame the same vb2 buffer has to be
filled by two consective passes.

> + * to capture SEQ_TB/BT it's needed to capture to the same vb2
> + * buffer twice so the type of buffer needs to be kept.
> + *
> + * FULL - One capture fills the whole vb2 buffer
> + * HALF_TOP - One capture fills the top half of the vb2 buffer
> + * HALF_BOTTOM - One capture fills the bottom half of the vb2 buffer
> + */
> +enum rvin_buffer_type {
> +	FULL,
> +	HALF_TOP,
> +	HALF_BOTTOM,
> +};
> +

Even if the documentation for the VIN interface is not generated, I
would use kerneldoc already.

With the NV12/16 thing clarified and a confirmation that it works, all
I have here are style suggestions you're free to take in or ignore, so
please add
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
   j
>  /**
>   * struct rvin_video_format - Data format stored in memory
>   * @fourcc:	Pixelformat
> @@ -206,6 +223,8 @@ struct rvin_dev {
>  	spinlock_t qlock;
>  	struct {
>  		struct vb2_v4l2_buffer *buffer;
> +		enum rvin_buffer_type type;
> +		dma_addr_t phys;
>  	} buf_hw[HW_BUFFER_NUM];
>  	struct list_head buf_list;
>  	unsigned int sequence;
> --
> 2.24.0
>

--2rxkdho4z5z7doaw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl3w0YYACgkQcjQGjxah
VjyvnA//c+kWe0OsdgoU5E6sCN/IeEr/RedSMTAjTvCJ7egZ8efLMrGYfz93wkke
0KyQmjJm1WBMtypqhSwfc0DKzF7YiPy2QKTFVldDvlxAbI/wz9orag6QdijB3h3i
6MYdQnxLKFbgou5rt9OVgbWwWO2eo08JR8PXOepmKWxgpyKgTamKR+7WXYR5Grs8
Hyq+wLvYoRpvHqDzQeyOFo/jCuzCiGEA+OlnIx1aUIX5Ffm7T5mcsjjLqzAe/uPV
BUqJRNwN4HWcKebMP0qOIg1oEDmDuivFW1X+7d9XA54RLnramckuVDiPdVYywGZW
KmvRy70qrVG0ytOPZqlCWWpxKm7ILIQ5dvfilAzEEgpJiOMaOZ2ZHqT1DOgaGDWU
ym8CFvITlapc5WtW2KK+TK9pQBxh2HAC1lVkQYatDttAJ+DZlm1AKn7Mg2xEjtCo
utyWj35q8uX+Fq84+kV5Li5X0iAMoZ/JhZgjv2Hv2UOZFanSz2Z5Q3rIlIXP5awf
tvaZ4TiNvxPZtrZ0iCEFdBPkyKuOk2SwevPM1JL25UzB3dN7BamwRKPD30029z8Q
MInFabQ3DFVSje5MBWr4PRPw5nLUfhK5WyIN0wW0Xsv70oKHTKtE2vLOqA63miBJ
Taeqsgupl2p1rtv2mvqSOpW92i1oM3O13+ohj2kIZ0Bg60vN1VM=
=CnqU
-----END PGP SIGNATURE-----

--2rxkdho4z5z7doaw--
