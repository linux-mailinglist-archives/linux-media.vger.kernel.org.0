Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8B48CB0E1
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 23:12:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730663AbfJCVMv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 17:12:51 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:36919 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727789AbfJCVMv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 17:12:51 -0400
X-Originating-IP: 132.205.230.8
Received: from aptenodytes (unknown [132.205.230.8])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 570951BF204;
        Thu,  3 Oct 2019 21:12:48 +0000 (UTC)
Date:   Thu, 3 Oct 2019 17:12:47 -0400
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-media@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        kernel@pengutronix.de
Subject: Re: [PATCH] media: uapi: h264: clarify
 num_ref_idx_l[01]_(default_)active fields
Message-ID: <20191003211247.GC3927@aptenodytes>
References: <20190905114210.9232-1-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="B4IIlcmfBL/1gGOG"
Content-Disposition: inline
In-Reply-To: <20190905114210.9232-1-p.zabel@pengutronix.de>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--B4IIlcmfBL/1gGOG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu 05 Sep 19, 13:42, Philipp Zabel wrote:
> To explain why num_ref_idx_active_override_flag is not part of the API,
> describe how the num_ref_idx_l[01]_active_minus1 fields and the
> num_ref_idx_l[01]_default_active_minus1 fields are used, depending on
> whether the decoder parses slice headers itself or not.

Is there any particular reason why this is preferable to exposing the flag?
It feels like having the flag around sticks closer to the bitstream,
so it's more straightforward for everyone.

In case there's only one set of fields exposed by the hardware (and it does=
n't
do slice parsing itself), we could always check the flag in the driver and =
use
either the default PPS values or the slice-specific values there.

What do you think?

Cheers,

Paul

> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>  Documentation/media/uapi/v4l/ext-ctrls-codec.rst | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst b/Documenta=
tion/media/uapi/v4l/ext-ctrls-codec.rst
> index bc5dd8e76567..b9834625a939 100644
> --- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> @@ -1630,10 +1630,10 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_typ=
e -
>        -
>      * - __u8
>        - ``num_ref_idx_l0_default_active_minus1``
> -      -
> +      - This field is only used by decoders that parse slices themselves.
>      * - __u8
>        - ``num_ref_idx_l1_default_active_minus1``
> -      -
> +      - This field is only used by decoders that parse slices themselves.
>      * - __u8
>        - ``weighted_bipred_idc``
>        -
> @@ -1820,10 +1820,14 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_typ=
e -
>        -
>      * - __u8
>        - ``num_ref_idx_l0_active_minus1``
> -      -
> +      - This field is used by decoders that do not parse slices themselv=
es.
> +        If num_ref_idx_active_override_flag is not set, this field must =
be
> +        set to the value of num_ref_idx_l0_default_active_minus1.
>      * - __u8
>        - ``num_ref_idx_l1_active_minus1``
> -      -
> +      - This field is used by decoders that do not parse slices themselv=
es.
> +        If num_ref_idx_active_override_flag is not set, this field must =
be
> +        set to the value of num_ref_idx_l1_default_active_minus1.
>      * - __u32
>        - ``slice_group_change_cycle``
>        -
> --=20
> 2.20.1
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--B4IIlcmfBL/1gGOG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl2WZE4ACgkQ3cLmz3+f
v9EXiggAgWSMnZVKRXXi9LlaAxNxxP/DETQ9Wb+SluPPCqU/HTosI3y1oI9eBfXK
76/JuTVM+TlyrKt4H8+5qdBZ6MbxNAyHvHvGFM74XmQ80edJV8fpARtbIT+iOw6q
tE2XblpPIbtrX/LSLNe878+vnR8c7cQPBnaQFpyK09bZVzcBqhQRD9Hj/o2Fl33a
OiUl1xl13IgMeOeMMTT/9gZ7rxVX1f3/R1LajBMOYs1XAy5O0vG3TDB+8fuStq2C
2t6Atew5ual/HSPzrdP2xQmXTb+DTo2n/nKcr1VbiSm82RMhkJapKO9XJiwcdqu/
WbVWQGvEBnXLyJ7S/CvL5w0Q+25kBQ==
=ngGV
-----END PGP SIGNATURE-----

--B4IIlcmfBL/1gGOG--
