Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B9458D3D9
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2019 14:53:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727895AbfHNMxl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Aug 2019 08:53:41 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:44135 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727910AbfHNMxj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Aug 2019 08:53:39 -0400
X-Originating-IP: 86.250.200.211
Received: from aptenodytes (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id A4BD11BF212;
        Wed, 14 Aug 2019 12:53:36 +0000 (UTC)
Date:   Wed, 14 Aug 2019 14:53:36 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
        Maxime Jourdan <mjourdan@baylibre.com>
Subject: Re: [PATCHv2 02/12] videodev2.h: add V4L2_FMT_FLAG_DYN_RESOLUTION
Message-ID: <20190814125336.GB11714@aptenodytes>
References: <20190812110513.23774-1-hverkuil-cisco@xs4all.nl>
 <20190812110513.23774-3-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="tjCHc7DPkfUGtrlw"
Content-Disposition: inline
In-Reply-To: <20190812110513.23774-3-hverkuil-cisco@xs4all.nl>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--tjCHc7DPkfUGtrlw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon 12 Aug 19, 13:05, Hans Verkuil wrote:
> From: Maxime Jourdan <mjourdan@baylibre.com>
>=20
> Add an enum_fmt format flag to specifically tag coded formats where
> dynamic resolution switching is supported by the device.
>=20
> This is useful for some codec drivers that can support dynamic
> resolution switching for one or more of their listed coded formats. It
> allows userspace to know whether it should extract the video parameters
> itself, or if it can rely on the device to send V4L2_EVENT_SOURCE_CHANGE
> when such changes are detected.

Makes sense and looks good to me:
Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

The docs aren't saying that this only applies to stateful decoders, but I t=
hink
it is quite clear that this can't apply to stateless decoders.

Cheers,

Paul

> Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> [hverkuil-cisco@xs4all.nl: added flag to videodev2.h.rst.exceptions]
> [hverkuil-cisco@xs4all.nl: updated commit text: 'one or more' instead of =
'all']
> Acked-by: Tomasz Figa <tfiga@chromium.org>
> ---
>  Documentation/media/uapi/v4l/vidioc-enum-fmt.rst | 8 ++++++++
>  Documentation/media/videodev2.h.rst.exceptions   | 1 +
>  include/uapi/linux/videodev2.h                   | 1 +
>  3 files changed, 10 insertions(+)
>=20
> diff --git a/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst b/Documenta=
tion/media/uapi/v4l/vidioc-enum-fmt.rst
> index ebc05ce74bdf..719f1ed64f7d 100644
> --- a/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
> +++ b/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
> @@ -135,6 +135,14 @@ one until ``EINVAL`` is returned.
>  	between frames/fields. This flag can only be used in combination with
>  	the ``V4L2_FMT_FLAG_COMPRESSED`` flag, since this applies to compressed
>  	formats only. This flag is valid for stateful decoders only.
> +    * - ``V4L2_FMT_FLAG_DYN_RESOLUTION``
> +      - 0x0008
> +      - Dynamic resolution switching is supported by the device for this
> +	compressed bytestream format (aka coded format). It will notify the user
> +	via the event ``V4L2_EVENT_SOURCE_CHANGE`` when changes in the video
> +	parameters are detected. This flag can only be used in combination
> +	with the ``V4L2_FMT_FLAG_COMPRESSED`` flag, since this applies to
> +	compressed formats only.
> =20
> =20
>  Return Value
> diff --git a/Documentation/media/videodev2.h.rst.exceptions b/Documentati=
on/media/videodev2.h.rst.exceptions
> index a0640b6d0f68..adeb6b7a15cb 100644
> --- a/Documentation/media/videodev2.h.rst.exceptions
> +++ b/Documentation/media/videodev2.h.rst.exceptions
> @@ -181,6 +181,7 @@ replace define V4L2_PIX_FMT_FLAG_PREMUL_ALPHA reserve=
d-formats
>  replace define V4L2_FMT_FLAG_COMPRESSED fmtdesc-flags
>  replace define V4L2_FMT_FLAG_EMULATED fmtdesc-flags
>  replace define V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM fmtdesc-flags
> +replace define V4L2_FMT_FLAG_DYN_RESOLUTION fmtdesc-flags
> =20
>  # V4L2 timecode types
>  replace define V4L2_TC_TYPE_24FPS timecode-type
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev=
2.h
> index 67077d52c59d..530638dffd93 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -777,6 +777,7 @@ struct v4l2_fmtdesc {
>  #define V4L2_FMT_FLAG_COMPRESSED		0x0001
>  #define V4L2_FMT_FLAG_EMULATED			0x0002
>  #define V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM	0x0004
> +#define V4L2_FMT_FLAG_DYN_RESOLUTION		0x0008
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

--tjCHc7DPkfUGtrlw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl1UBFAACgkQ3cLmz3+f
v9FPAggAiPADudshWRd3GIntuM0pg7CptLXK/LNQV2LxoHX8z0wnPxwS5IKcB8H7
Jd+1cp833fShilTgLgupzzBbJmuBWzHo5InUF9K1Z3xuIfnRJGlp35ZV0ClcYh5w
bcJ9EPH1bXUborvTFdFRblS7VdHgATDwsQblWcuGjWQOC2NOPV55gX5+EQcYzPro
tUyBPZBHtehJRiMz+dMxLG/BVYMg4dhObqXwJkYI4FjEOO8QU4ASAdozmMQqH+KD
XVvSiiX++n95q7BXSV+v2b++Lro34tudJLCX/6cn0W1agq1QKijcbv/dnQQaig/a
6YL4LlRyMuHhWFDuGByUgnIBs0wMWA==
=DFuS
-----END PGP SIGNATURE-----

--tjCHc7DPkfUGtrlw--
