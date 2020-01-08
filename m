Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95D5113453E
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2020 15:43:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728215AbgAHOnl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jan 2020 09:43:41 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:48047 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726697AbgAHOnl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jan 2020 09:43:41 -0500
X-Originating-IP: 90.76.211.102
Received: from aptenodytes (lfbn-tou-1-1151-102.w90-76.abo.wanadoo.fr [90.76.211.102])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 03BCE6001B;
        Wed,  8 Jan 2020 14:43:36 +0000 (UTC)
Date:   Wed, 8 Jan 2020 15:43:36 +0100
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Jernej Skrabec <jernej.skrabec@siol.net>, mripard@kernel.org,
        hverkuil@xs4all.nl, gregkh@linuxfoundation.org, wens@csie.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/4] media: uapi: hevc: Add scaling matrix control
Message-ID: <20200108144336.GB229960@aptenodytes>
References: <20191213160428.54303-1-jernej.skrabec@siol.net>
 <20191213160428.54303-2-jernej.skrabec@siol.net>
 <20200108151157.17cf9774@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xgyAXRrhYN0wYx8y"
Content-Disposition: inline
In-Reply-To: <20200108151157.17cf9774@kernel.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--xgyAXRrhYN0wYx8y
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mauro,

On Wed 08 Jan 20, 15:11, Mauro Carvalho Chehab wrote:
> Em Fri, 13 Dec 2019 17:04:25 +0100
> Jernej Skrabec <jernej.skrabec@siol.net> escreveu:
>=20
> > HEVC has a scaling matrix concept. Add support for it.
>=20
> > +struct v4l2_ctrl_hevc_scaling_matrix {
> > +	__u8	scaling_list_4x4[6][16];
> > +	__u8	scaling_list_8x8[6][64];
> > +	__u8	scaling_list_16x16[6][64];
> > +	__u8	scaling_list_32x32[2][64];
> > +	__u8	scaling_list_dc_coef_16x16[6];
> > +	__u8	scaling_list_dc_coef_32x32[2];
> > +};
>=20
> I never looked at HEVC spec, but the above seems really weird.
>=20
> Please correct me if I am wrong, but each of the above matrixes
> is independent, and the driver will use just one of the above on
> any specific time (for a given video output node), right?

I am not too sure about what the specification really entails, but it is my
understanding that HEVC allows simultaneous block sizes between 4x4 and 32x=
32
to exist within the same coding tree and slice. That suggests that it makes
sense to have specific coefficients for each case.

Note that the hardware also has distinct registers for each scaling list.

Cheers,

Paul

> If so, why would userspace be forced to update lots of matrixes, if would
> likely use just one at a given time?
>=20
> IMO, the proper way would be, instead, to use an uAPI like:
>=20
> /*
>  * Actually, as this is uAPI, we will use a fixed size integer type, like
>  *  unsigned int
>  */
> enum hevc_scaling_matrix_type {
> 	HEVC_SCALING_MATRIX_4x4,
> 	HEVC_SCALING_MATRIX_8x8,
> ...
> 	HEVC_SCALING_MATRIX_DC_COEF_32x32,
> };
>=20
> struct v4l2_ctrl_hevc_scaling_matrix {
> 	__u32	scaling_type 		/* as defined by enum hevc_scaling_matrix_type */
>=20
> 	union {
> 		__u8	scaling_list_4x4[6][16];
> 		__u8	scaling_list_8x8[6][64];
> 		__u8	scaling_list_16x16[6][64];
> 		__u8	scaling_list_32x32[2][64];
> 		__u8	scaling_list_dc_coef_16x16[6];
> 		__u8	scaling_list_dc_coef_32x32[2];
> 	};
> };
>=20
> And let the core use a default for each scaling matrix, if userspace does=
n't
> set it.
>=20
>=20
>=20
> Cheers,
> Mauro

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--xgyAXRrhYN0wYx8y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl4V6pgACgkQ3cLmz3+f
v9F7hQf/XAlLHjAzimIvRq2xlPR1NvyAr7jDe7fBqBk3L9lKzKcKlvkzuOd/DQd7
/zm4Z01MtrhbBQvcufpIH0L4LFVyMIwNUoMoRP2ds+yt2fG9Pdc66yJG+mWdq370
vZtDY5ExsIOrt7moQfB3XQ9/6TnEMMb7H+/u/g9GsuQ8JxlMnuo11xxoCjUfznZ+
RCwBNxrBfD4sB5ZAl27J4lUiSisKQm/vP2k3WlWs/XWpEJYsNqij2juBFfFjlReQ
t5qzEHJFEg3Q1p9JxjbTODWsVDw9NcIB+9n36nYIgwr0EhyY6hGtfAVgCcQ9cF/J
rkslVxMZS9Qq6vCfzn7leATtsAQ1Mg==
=HWQs
-----END PGP SIGNATURE-----

--xgyAXRrhYN0wYx8y--
