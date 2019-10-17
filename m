Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 003D9DA7B2
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2019 10:47:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393000AbfJQIrQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Oct 2019 04:47:16 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:51005 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390755AbfJQIrQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Oct 2019 04:47:16 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 78D6760018;
        Thu, 17 Oct 2019 08:47:12 +0000 (UTC)
Date:   Thu, 17 Oct 2019 10:48:54 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms+renesas@verge.net.au>
Subject: Re: [PATCH v2 2/2] rcar-vin: Add support for outputting NV12
Message-ID: <20191017084854.6apwyqzwlmeyb5bx@uno.localdomain>
References: <20191014001615.2865301-1-niklas.soderlund+renesas@ragnatech.se>
 <20191014001615.2865301-3-niklas.soderlund+renesas@ragnatech.se>
 <20191014221107.GI23442@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xmwnq5wleo4xhzhi"
Content-Disposition: inline
In-Reply-To: <20191014221107.GI23442@pendragon.ideasonboard.com>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--xmwnq5wleo4xhzhi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Niklas, Laurent,

On Tue, Oct 15, 2019 at 01:11:07AM +0300, Laurent Pinchart wrote:
> Hi Niklas,
>
> Thank you for the patch.
>
> On Mon, Oct 14, 2019 at 02:16:15AM +0200, Niklas S=C3=B6derlund wrote:
> > Most Gen3 boards can output frames in NV12 format, add support for this
> > with a runtime check that the running hardware supports it.
> >
> > Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatec=
h.se>
> > Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> > ---
> >  drivers/media/platform/rcar-vin/rcar-dma.c  |  5 ++-
> >  drivers/media/platform/rcar-vin/rcar-v4l2.c | 39 +++++++++++++++++----
> >  2 files changed, 37 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media=
/platform/rcar-vin/rcar-dma.c
> > index af4f774149f08597..cf9029efeb0450cb 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-dma.c
> > +++ b/drivers/media/platform/rcar-vin/rcar-dma.c
> > @@ -118,6 +118,7 @@
> >  #define VNDMR_ABIT		(1 << 2)
> >  #define VNDMR_DTMD_YCSEP	(1 << 1)
>
> While at it, I would define this as (2 << 0).
>
> >  #define VNDMR_DTMD_ARGB		(1 << 0)
> > +#define VNDMR_DTMD_YCSEP_420	(3 << 0)
> >
> >  /* Video n Data Mode Register 2 bits */
> >  #define VNDMR2_VPS		(1 << 30)
> > @@ -701,11 +702,13 @@ static int rvin_setup(struct rvin_dev *vin)
> >  	 * Output format
> >  	 */
> >  	switch (vin->format.pixelformat) {
> > +	case V4L2_PIX_FMT_NV12:
> >  	case V4L2_PIX_FMT_NV16:
> >  		rvin_write(vin,
> >  			   ALIGN(vin->format.bytesperline * vin->format.height,
> >  				 0x80), VNUVAOF_REG);
> > -		dmr =3D VNDMR_DTMD_YCSEP;
> > +		dmr =3D vin->format.pixelformat =3D=3D V4L2_PIX_FMT_NV12 ?
> > +			VNDMR_DTMD_YCSEP_420 : VNDMR_DTMD_YCSEP;
>
> According to the datasheet, VNDMR_DTMD_YCSEP_420 is only valid for some
> of the channels (see footnote of the VnDMR register documentation).
>

It took me a while to interpret this footnote:
3. Do not make this setting for video channels 2, 3, 6, 7, 10(V3H), 11(V3H)=
, 14(V3H) and 15(V3H).

But if the note in table 26.15 is considered too:
Setting the DTMD[1:0] bits to B'11 is only allowed for video channels 0, 1,=
 4, and 5.

Can we refuse to set the fromat here or is it too late and should be
catched at rvin_format_from_pixel() time (where, if I'm not mistaken,
we have not channel id information available though).

Thanks
   j

> >  		output_is_yuv =3D true;
> >  		break;
> >  	case V4L2_PIX_FMT_YUYV:
> > diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/medi=
a/platform/rcar-vin/rcar-v4l2.c
> > index 13b7cd5d2e40415a..9e2e63ffcc47acad 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > @@ -30,6 +30,10 @@
> >   */
> >
> >  static const struct rvin_video_format rvin_formats[] =3D {
> > +	{
> > +		.fourcc			=3D V4L2_PIX_FMT_NV12,
> > +		.bpp			=3D 1,
> > +	},
> >  	{
> >  		.fourcc			=3D V4L2_PIX_FMT_NV16,
> >  		.bpp			=3D 1,
> > @@ -72,6 +76,9 @@ const struct rvin_video_format *rvin_format_from_pixe=
l(struct rvin_dev *vin,
> >  	if (vin->info->model =3D=3D RCAR_M1 && pixelformat =3D=3D V4L2_PIX_FM=
T_XBGR32)
> >  		return NULL;
> >
> > +	if (pixelformat =3D=3D V4L2_PIX_FMT_NV12 && !vin->info->nv12)
> > +		return NULL;
> > +
> >  	for (i =3D 0; i < ARRAY_SIZE(rvin_formats); i++)
> >  		if (rvin_formats[i].fourcc =3D=3D pixelformat)
> >  			return rvin_formats + i;
> > @@ -90,17 +97,29 @@ static u32 rvin_format_bytesperline(struct rvin_dev=
 *vin,
> >  	if (WARN_ON(!fmt))
> >  		return -EINVAL;
> >
> > -	align =3D pix->pixelformat =3D=3D V4L2_PIX_FMT_NV16 ? 0x20 : 0x10;
> > +	switch (pix->pixelformat) {
> > +	case V4L2_PIX_FMT_NV12:
> > +	case V4L2_PIX_FMT_NV16:
> > +		align =3D 0x20;
> > +		break;
> > +	default:
> > +		align =3D 0x10;
> > +		break;
> > +	}
> >
> >  	return ALIGN(pix->width, align) * fmt->bpp;
> >  }
> >
> >  static u32 rvin_format_sizeimage(struct v4l2_pix_format *pix)
> >  {
> > -	if (pix->pixelformat =3D=3D V4L2_PIX_FMT_NV16)
> > +	switch (pix->pixelformat) {
> > +	case V4L2_PIX_FMT_NV12:
> > +		return pix->bytesperline * pix->height * 3 / 2;
> > +	case V4L2_PIX_FMT_NV16:
> >  		return pix->bytesperline * pix->height * 2;
> > -
> > -	return pix->bytesperline * pix->height;
> > +	default:
> > +		return pix->bytesperline * pix->height;
> > +	}
> >  }
> >
> >  static void rvin_format_align(struct rvin_dev *vin, struct v4l2_pix_fo=
rmat *pix)
> > @@ -124,8 +143,16 @@ static void rvin_format_align(struct rvin_dev *vin=
, struct v4l2_pix_format *pix)
> >  		break;
> >  	}
> >
> > -	/* HW limit width to a multiple of 32 (2^5) for NV16 else 2 (2^1) */
> > -	walign =3D vin->format.pixelformat =3D=3D V4L2_PIX_FMT_NV16 ? 5 : 1;
> > +	/* HW limit width to a multiple of 32 (2^5) for NV12/16 else 2 (2^1) =
*/
> > +	switch (vin->format.pixelformat) {
> > +	case V4L2_PIX_FMT_NV12:
> > +	case V4L2_PIX_FMT_NV16:
> > +		walign =3D 5;
> > +		break;
> > +	default:
> > +		walign =3D 1;
> > +		break;
> > +	}
> >
> >  	/* Limit to VIN capabilities */
> >  	v4l_bound_align_image(&pix->width, 2, vin->info->max_width, walign,
>
> --
> Regards,
>
> Laurent Pinchart

--xmwnq5wleo4xhzhi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl2oKvIACgkQcjQGjxah
VjxB7BAAxNQAvZMEBvV7DAtwSrzHg+1uzjf8kvig2beifVYiXXXrv/d4iqTAF0Gj
ewQkBwZ1JAD/Qw7UOk+Ulv+Myt+o/HJl2T0G22odVI+v5lasc0WE3Jogu53nzt6j
TvS4V7ozloosBCPmNbobHhoghQ8rvkTzc3+1kATAcQodDIFu7/xu5D7W1nE5ElVA
SmAvSYYLmZVa/gWd4Pdjs+Z9iouznixjSsScFuZoIn5tx6m8qXCnHirqe5ipHV4o
BRyFWMO4k2lcgBaPo2/Q2LrvEndNEwyBlHy+0Jc/IRmfDpkpV+xisDsxBjGvKjlU
UZQ8zqj219c5asfQZgkphiLFCmnLl+y6H6izdM9pzPQ4yx9+8GwWRSx84lnFKULL
7M9qjhQ1s1fTTWAydJkJQN+dH/xHoW9azkME6GXQPaKAflL1NJDnAp/N3AC4Lrw3
EO2q/L1D2eufPq/ILvus8WGTP8RuEegwh7AV2UEd6pVT23zxxQnYXcoVETnHmuON
QhWNyuqOcuZ4zJ2KA7zK/IaIxJgAm4VYTVtU5/SJ1pO9LR7qc9J76Rb5Ys67te3B
I83CU+WYgiFm5u8jH3xEEcRhD6udHfjwK4e2KNK9w84qSOWO1Q0kElTKBPTJY5Z9
clEHMKwrxzBR64UbI9pp4ISMGx2FyHS98v3B5G5DqUtbi0gnVPs=
=5Fjo
-----END PGP SIGNATURE-----

--xmwnq5wleo4xhzhi--
