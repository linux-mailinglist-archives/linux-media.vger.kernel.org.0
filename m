Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BC6411A79E
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2019 10:42:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728516AbfLKJmG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Dec 2019 04:42:06 -0500
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:42035 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728030AbfLKJmG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Dec 2019 04:42:06 -0500
X-Originating-IP: 93.34.114.233
Received: from uno.localdomain (93-34-114-233.ip49.fastwebnet.it [93.34.114.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 7679524000D;
        Wed, 11 Dec 2019 09:42:02 +0000 (UTC)
Date:   Wed, 11 Dec 2019 10:44:11 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 1/2] rcar-vin: Move hardware buffer tracking to own
 struct
Message-ID: <20191211094411.kub2m6qhxtjoxalc@uno.localdomain>
References: <20191210020559.170594-1-niklas.soderlund+renesas@ragnatech.se>
 <20191210020559.170594-2-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bqt4f5c3iitqmbqv"
Content-Disposition: inline
In-Reply-To: <20191210020559.170594-2-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--bqt4f5c3iitqmbqv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Tue, Dec 10, 2019 at 03:05:58AM +0100, Niklas S=C3=B6derlund wrote:
> To support SEQ_TB/BT not all buffers given to the hardware will be
> equal, the driver needs to keep track of different buffer types. Move
> the tracking of buffers given to hardware into a struct so additional
> tracking fields can be associated with each buffer.
>

This change alone does not make sense by itself. I cannot judge if
it's a good idea or not if not looking at 2/2. Why have you kept it
separate ?

Thanks
   j

> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> ---
>  drivers/media/platform/rcar-vin/rcar-dma.c | 27 +++++++++++-----------
>  drivers/media/platform/rcar-vin/rcar-vin.h |  9 ++++----
>  2 files changed, 19 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/p=
latform/rcar-vin/rcar-dma.c
> index cf9029efeb0450cb..cd1778977b2ba56e 100644
> --- a/drivers/media/platform/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/rcar-vin/rcar-dma.c
> @@ -844,20 +844,20 @@ static void rvin_fill_hw_slot(struct rvin_dev *vin,=
 int slot)
>  	dma_addr_t phys_addr;
>
>  	/* A already populated slot shall never be overwritten. */
> -	if (WARN_ON(vin->queue_buf[slot] !=3D NULL))
> +	if (WARN_ON(vin->buf_hw[slot].buffer !=3D NULL))
>  		return;
>
>  	vin_dbg(vin, "Filling HW slot: %d\n", slot);
>
>  	if (list_empty(&vin->buf_list)) {
> -		vin->queue_buf[slot] =3D NULL;
> +		vin->buf_hw[slot].buffer =3D NULL;
>  		phys_addr =3D vin->scratch_phys;
>  	} else {
>  		/* Keep track of buffer we give to HW */
>  		buf =3D list_entry(vin->buf_list.next, struct rvin_buffer, list);
>  		vbuf =3D &buf->vb;
>  		list_del_init(to_buf_list(vbuf));
> -		vin->queue_buf[slot] =3D vbuf;
> +		vin->buf_hw[slot].buffer =3D vbuf;
>
>  		/* Setup DMA */
>  		phys_addr =3D vb2_dma_contig_plane_dma_addr(&vbuf->vb2_buf, 0);
> @@ -953,13 +953,14 @@ static irqreturn_t rvin_irq(int irq, void *data)
>  	}
>
>  	/* Capture frame */
> -	if (vin->queue_buf[slot]) {
> -		vin->queue_buf[slot]->field =3D rvin_get_active_field(vin, vnms);
> -		vin->queue_buf[slot]->sequence =3D vin->sequence;
> -		vin->queue_buf[slot]->vb2_buf.timestamp =3D ktime_get_ns();
> -		vb2_buffer_done(&vin->queue_buf[slot]->vb2_buf,
> +	if (vin->buf_hw[slot].buffer) {
> +		vin->buf_hw[slot].buffer->field =3D
> +			rvin_get_active_field(vin, vnms);
> +		vin->buf_hw[slot].buffer->sequence =3D vin->sequence;
> +		vin->buf_hw[slot].buffer->vb2_buf.timestamp =3D ktime_get_ns();
> +		vb2_buffer_done(&vin->buf_hw[slot].buffer->vb2_buf,
>  				VB2_BUF_STATE_DONE);
> -		vin->queue_buf[slot] =3D NULL;
> +		vin->buf_hw[slot].buffer =3D NULL;
>  	} else {
>  		/* Scratch buffer was used, dropping frame. */
>  		vin_dbg(vin, "Dropping frame %u\n", vin->sequence);
> @@ -983,10 +984,10 @@ static void return_all_buffers(struct rvin_dev *vin,
>  	int i;
>
>  	for (i =3D 0; i < HW_BUFFER_NUM; i++) {
> -		if (vin->queue_buf[i]) {
> -			vb2_buffer_done(&vin->queue_buf[i]->vb2_buf,
> +		if (vin->buf_hw[i].buffer) {
> +			vb2_buffer_done(&vin->buf_hw[i].buffer->vb2_buf,
>  					state);
> -			vin->queue_buf[i] =3D NULL;
> +			vin->buf_hw[i].buffer =3D NULL;
>  		}
>  	}
>
> @@ -1291,7 +1292,7 @@ int rvin_dma_register(struct rvin_dev *vin, int irq)
>  	vin->state =3D STOPPED;
>
>  	for (i =3D 0; i < HW_BUFFER_NUM; i++)
> -		vin->queue_buf[i] =3D NULL;
> +		vin->buf_hw[i].buffer =3D NULL;
>
>  	/* buffer queue */
>  	q->type =3D V4L2_BUF_TYPE_VIDEO_CAPTURE;
> diff --git a/drivers/media/platform/rcar-vin/rcar-vin.h b/drivers/media/p=
latform/rcar-vin/rcar-vin.h
> index a36b0824f81d171d..0aa904a4af5b0a97 100644
> --- a/drivers/media/platform/rcar-vin/rcar-vin.h
> +++ b/drivers/media/platform/rcar-vin/rcar-vin.h
> @@ -164,9 +164,8 @@ struct rvin_info {
>   * @scratch:		cpu address for scratch buffer
>   * @scratch_phys:	physical address of the scratch buffer
>   *
> - * @qlock:		protects @queue_buf, @buf_list, @sequence
> - *			@state
> - * @queue_buf:		Keeps track of buffers given to HW slot
> + * @qlock:		protects @buf_hw, @buf_list, @sequence and @state
> + * @buf_hw:		Keeps track of buffers given to HW slot
>   * @buf_list:		list of queued buffers
>   * @sequence:		V4L2 buffers sequence number
>   * @state:		keeps track of operation state
> @@ -205,7 +204,9 @@ struct rvin_dev {
>  	dma_addr_t scratch_phys;
>
>  	spinlock_t qlock;
> -	struct vb2_v4l2_buffer *queue_buf[HW_BUFFER_NUM];
> +	struct {
> +		struct vb2_v4l2_buffer *buffer;
> +	} buf_hw[HW_BUFFER_NUM];
>  	struct list_head buf_list;
>  	unsigned int sequence;
>  	enum rvin_dma_state state;
> --
> 2.24.0
>

--bqt4f5c3iitqmbqv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl3wumcACgkQcjQGjxah
VjwT+g/9GlaY82o+OR57LiAwzbE5rq+CZ4akMkEONGaP5ueBwpNDRU8HPjGuhepb
M+my6K+TJJO3/6FoENWITLm1aVJVx2DYj0M8VNYBYsRVZPOKvrfGR7zwn14hhmJs
ZYegnT+Kv04kRMXIDccqCZwaNSkfWUYjEhyxnRZ1SAQVw0PVBXtaZRmiDipCLV98
1TedEZUCwQUfOzOvbpiZ2Wgo2ARNXidTTRkgpu3oxGD0wmYEqbg5Z/Xt+ude/tJ/
8aSlU289wXl2VSoxb5D+Y8jOwX/faif6UU/jfaxbdUi3DcWdOROBfVhFS/qPz0Fg
AMM6L7ci4VDv5ealYzadp95Y6XJ//ulQQRB+Nh4874Qo2x2YjpGKGGXW/2mn4ehk
ap3yuwzwHv40KZcg1gl7xUCt/eCj8wWmZ/PJXlYKisBiHdI38b9/QFktnRE6Q3UI
BP/4eNCQxWtcM+ummfJUhEK5Azurc9cZbHx5NpMLHL/JtVPJXb2WXohT4m6RBZCV
q/H0UGOhdVuGTs2xG4xa79SmZRQSoZaxhiVVi83J0RddnNXXaYy30liiWKYv+iHo
Rt2pVGKuDbEF8sDGmzNhLGOA0Uxq4nfSYuyY4oRSKToKgHeG2zkHX69QxDsmtt/S
YhRe7+JILPdhaXAhvxQ5wMmnXCpZctSfl4GyJhbVjAyXJoNg4po=
=QsFe
-----END PGP SIGNATURE-----

--bqt4f5c3iitqmbqv--
