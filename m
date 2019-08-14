Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BCBB8D3D4
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2019 14:53:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728036AbfHNMwQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Aug 2019 08:52:16 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:60111 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727110AbfHNMwO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Aug 2019 08:52:14 -0400
X-Originating-IP: 86.250.200.211
Received: from aptenodytes (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 04F46E000C;
        Wed, 14 Aug 2019 12:52:10 +0000 (UTC)
Date:   Wed, 14 Aug 2019 14:52:10 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCHv2 01/12] videodev2.h: add
 V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM
Message-ID: <20190814125210.GA11714@aptenodytes>
References: <20190812110513.23774-1-hverkuil-cisco@xs4all.nl>
 <20190812110513.23774-2-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="YiEDa0DAkWCtVeE4"
Content-Disposition: inline
In-Reply-To: <20190812110513.23774-2-hverkuil-cisco@xs4all.nl>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--YiEDa0DAkWCtVeE4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon 12 Aug 19, 13:05, Hans Verkuil wrote:
> Add an enum_fmt format flag to specifically tag coded formats where
> full bytestream parsing is supported by the device.
>=20
> Some stateful decoders are capable of fully parsing a bytestream,
> but others require that userspace pre-parses the bytestream into
> frames or fields (see the corresponding pixelformat descriptions
> for details).
>=20
> If this flag is set, then this pre-parsing step is not required
> (but still possible, of course).

Although I wasn't involved with the initial issue, looks good to me!

Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Cheers,

Paul

> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  Documentation/media/uapi/v4l/vidioc-enum-fmt.rst | 8 ++++++++
>  Documentation/media/videodev2.h.rst.exceptions   | 1 +
>  include/uapi/linux/videodev2.h                   | 5 +++--
>  3 files changed, 12 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst b/Documenta=
tion/media/uapi/v4l/vidioc-enum-fmt.rst
> index 822d6730e7d2..ebc05ce74bdf 100644
> --- a/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
> +++ b/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
> @@ -127,6 +127,14 @@ one until ``EINVAL`` is returned.
>        - This format is not native to the device but emulated through
>  	software (usually libv4l2), where possible try to use a native
>  	format instead for better performance.
> +    * - ``V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM``
> +      - 0x0004
> +      - The hardware decoder for this compressed bytestream format (aka =
coded
> +	format) is capable of parsing a continuous bytestream. Applications do
> +	not need to parse the bytestream themselves to find the boundaries
> +	between frames/fields. This flag can only be used in combination with
> +	the ``V4L2_FMT_FLAG_COMPRESSED`` flag, since this applies to compressed
> +	formats only. This flag is valid for stateful decoders only.
> =20
> =20
>  Return Value
> diff --git a/Documentation/media/videodev2.h.rst.exceptions b/Documentati=
on/media/videodev2.h.rst.exceptions
> index 8e7d3492d248..a0640b6d0f68 100644
> --- a/Documentation/media/videodev2.h.rst.exceptions
> +++ b/Documentation/media/videodev2.h.rst.exceptions
> @@ -180,6 +180,7 @@ replace define V4L2_PIX_FMT_FLAG_PREMUL_ALPHA reserve=
d-formats
>  # V4L2 format flags
>  replace define V4L2_FMT_FLAG_COMPRESSED fmtdesc-flags
>  replace define V4L2_FMT_FLAG_EMULATED fmtdesc-flags
> +replace define V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM fmtdesc-flags
> =20
>  # V4L2 timecode types
>  replace define V4L2_TC_TYPE_24FPS timecode-type
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev=
2.h
> index 2427bc4d8eba..67077d52c59d 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -774,8 +774,9 @@ struct v4l2_fmtdesc {
>  	__u32		    reserved[4];
>  };
> =20
> -#define V4L2_FMT_FLAG_COMPRESSED 0x0001
> -#define V4L2_FMT_FLAG_EMULATED   0x0002
> +#define V4L2_FMT_FLAG_COMPRESSED		0x0001
> +#define V4L2_FMT_FLAG_EMULATED			0x0002
> +#define V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM	0x0004
> =20
>  	/* Frame Size and frame rate enumeration */
>  /*
> --=20
> 2.20.1
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--YiEDa0DAkWCtVeE4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl1UA/oACgkQ3cLmz3+f
v9E+Fwf/Xh/JFS6RTOtckm9ftRje3r/T3WXHXxXCrJqmUWIE/2CU3wMWSjpXXIG1
5O1NQALIWjIryrRaELzPQGNCmdL/6BS6y3bUagcWb6bNb5WVXs/kkPpcwFZ86Fhc
iheZ9pWJDxK4S+lgRxcVzlOTnqH/P2WyYenTneaU8vae95WVWRvRGIx8PAev9ZLx
gpKWuymA22nEXDRSEt8rkioISJMNgIZ1HUv7oP63xsiha7cEAH2JfYM6pSKD3APU
imiJp0qpyC6zSs0fy91NVUAT7MMXCquxYcQCmokuJQIsp/daZsma86HdBWOMiDV5
YLQW6sC3VofZklmzY9H1aIWiK2QLjg==
=0fQB
-----END PGP SIGNATURE-----

--YiEDa0DAkWCtVeE4--
