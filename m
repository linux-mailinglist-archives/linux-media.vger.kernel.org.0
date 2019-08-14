Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B88E18D443
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2019 15:10:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727122AbfHNNKB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Aug 2019 09:10:01 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:35329 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725800AbfHNNKB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Aug 2019 09:10:01 -0400
X-Originating-IP: 86.250.200.211
Received: from aptenodytes (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 410901BF20D;
        Wed, 14 Aug 2019 13:09:59 +0000 (UTC)
Date:   Wed, 14 Aug 2019 15:09:58 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCHv2 08/12] pixfmt-compressed.rst: improve
 H264/HEVC/MPEG1+2/VP8+9 documentation
Message-ID: <20190814130958.GG11714@aptenodytes>
References: <20190812110513.23774-1-hverkuil-cisco@xs4all.nl>
 <20190812110513.23774-9-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3xoW37o/FfUZJwQG"
Content-Disposition: inline
In-Reply-To: <20190812110513.23774-9-hverkuil-cisco@xs4all.nl>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--3xoW37o/FfUZJwQG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon 12 Aug 19, 13:05, Hans Verkuil wrote:
> The existing documentation was incorrect and did not correspond
> to how actual codec drivers implemented this.
>=20
> Update the documentation to explicitly specify what is actually
> expected.
>=20
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  .../media/uapi/v4l/pixfmt-compressed.rst      | 36 +++++++++++++++----
>  1 file changed, 30 insertions(+), 6 deletions(-)
>=20
> diff --git a/Documentation/media/uapi/v4l/pixfmt-compressed.rst b/Documen=
tation/media/uapi/v4l/pixfmt-compressed.rst
> index f52a7b67023d..9bb4a172a660 100644
> --- a/Documentation/media/uapi/v4l/pixfmt-compressed.rst
> +++ b/Documentation/media/uapi/v4l/pixfmt-compressed.rst
> @@ -41,7 +41,12 @@ Compressed Formats
> =20
>        - ``V4L2_PIX_FMT_H264``
>        - 'H264'
> -      - H264 video elementary stream with start codes.
> +      - H264 Access Unit.
> +	The decoder expects one Access Unit per buffer.
> +	The encoder generates one Access Unit per buffer.
> +	If :ref:`VIDIOC_ENUM_FMT` reports ``V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM=
``
> +	then the decoder has no requirements since it can parse all the
> +	information from the raw bytestream.

Maybe it would be clearer to mention that "no requirements" concerns the
lack of frame/field boundary requirement? Otherwise it feels a bit unclear
what userspace is expected to do or not do depending on the flag.

Cheers,

Paul

>      * .. _V4L2-PIX-FMT-H264-NO-SC:
> =20
>        - ``V4L2_PIX_FMT_H264_NO_SC``
> @@ -86,12 +91,20 @@ Compressed Formats
> =20
>        - ``V4L2_PIX_FMT_MPEG1``
>        - 'MPG1'
> -      - MPEG1 video elementary stream.
> +      - MPEG1 Picture. Each buffer starts with a Picture header, followed
> +	by other headers as needed and ending with the Picture data.
> +	If :ref:`VIDIOC_ENUM_FMT` reports ``V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM=
``
> +	then the decoder has no requirements since it can parse all the
> +	information from the raw bytestream.
>      * .. _V4L2-PIX-FMT-MPEG2:
> =20
>        - ``V4L2_PIX_FMT_MPEG2``
>        - 'MPG2'
> -      - MPEG2 video elementary stream.
> +      - MPEG2 Picture. Each buffer starts with a Picture header, followed
> +	by other headers as needed and ending with the Picture data.
> +	If :ref:`VIDIOC_ENUM_FMT` reports ``V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM=
``
> +	then the decoder has no requirements since it can parse all the
> +	information from the raw bytestream.
>      * .. _V4L2-PIX-FMT-MPEG2-SLICE:
> =20
>        - ``V4L2_PIX_FMT_MPEG2_SLICE``
> @@ -132,7 +145,9 @@ Compressed Formats
> =20
>        - ``V4L2_PIX_FMT_VP8``
>        - 'VP80'
> -      - VP8 video elementary stream.
> +      - VP8 compressed video frame. The encoder generates one
> +	compressed frame per buffer, and the decoder requires one
> +	compressed frame per buffer.
>      * .. _V4L2-PIX-FMT-VP8-FRAME:
> =20
>        - ``V4L2_PIX_FMT_VP8_FRAME``
> @@ -157,12 +172,19 @@ Compressed Formats
> =20
>        - ``V4L2_PIX_FMT_VP9``
>        - 'VP90'
> -      - VP9 video elementary stream.
> +      - VP9 compressed video frame. The encoder generates one
> +	compressed frame per buffer, and the decoder requires one
> +	compressed frame per buffer.
>      * .. _V4L2-PIX-FMT-HEVC:
> =20
>        - ``V4L2_PIX_FMT_HEVC``
>        - 'HEVC'
> -      - HEVC/H.265 video elementary stream.
> +      - HEVC/H.265 Access Unit.
> +	The decoder expects one Access Unit per buffer.
> +	The encoder generates one Access Unit per buffer.
> +	If :ref:`VIDIOC_ENUM_FMT` reports ``V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM=
``
> +	then the decoder has no	requirements since it can parse all the
> +	information from the raw bytestream.
>      * .. _V4L2-PIX-FMT-FWHT:
> =20
>        - ``V4L2_PIX_FMT_FWHT``
> @@ -170,6 +192,8 @@ Compressed Formats
>        - Video elementary stream using a codec based on the Fast Walsh Ha=
damard
>          Transform. This codec is implemented by the vicodec ('Virtual Co=
dec')
>  	driver. See the codec-fwht.h header for more details.
> +	:ref:`VIDIOC_ENUM_FMT` reports ``V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM``
> +	since the decoder can parse all the information from the raw bytestream.
>      * .. _V4L2-PIX-FMT-FWHT-STATELESS:
> =20
>        - ``V4L2_PIX_FMT_FWHT_STATELESS``
> --=20
> 2.20.1
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--3xoW37o/FfUZJwQG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl1UCCYACgkQ3cLmz3+f
v9F9LggAmG4ou/YY30gMCqFk4+XP0CGyxsEbcqFdyP8SGhOlragTXpK17vbZt49A
11R76uWYnI2mY8DqcNaVygmt3oy99Y54ZtZwN0EJM0i8TQtsSOn1ScI0gMMnQNfm
idN+J/QLyrg1NtzEfdO2drMS5cuanmC81yrKNmJ2zJUyT7j3CBto8w6T/wGL2MTP
anVQwSZ5wt4utCNgfVMMgjz8Y3bI8LqG+rxtWsN0INc0+7ZbFNc46M566K/afyO0
wkPP0Y3inp97961ySHyXWUKqOU4SKUv1U//dBiHAHFXhdpSis/fLRcHjfXwVQnLU
b7ki3k8Uz87/ODOon8Ofxo40FOL0BQ==
=toJ+
-----END PGP SIGNATURE-----

--3xoW37o/FfUZJwQG--
