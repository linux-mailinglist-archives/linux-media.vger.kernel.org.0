Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6680B23DC96
	for <lists+linux-media@lfdr.de>; Thu,  6 Aug 2020 18:54:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729729AbgHFQxu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Aug 2020 12:53:50 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:58524 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729701AbgHFQxo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Aug 2020 12:53:44 -0400
Received: from relay7-d.mail.gandi.net (unknown [217.70.183.200])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 9524F3AF934;
        Thu,  6 Aug 2020 15:57:38 +0000 (UTC)
X-Originating-IP: 93.29.109.196
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 3A1B820006;
        Thu,  6 Aug 2020 15:52:15 +0000 (UTC)
Date:   Thu, 6 Aug 2020 17:52:15 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Subject: Re: [PATCH v2 09/14] media: uapi: h264: Clarify SLICE_BASED mode
Message-ID: <20200806155215.GC1621078@aptenodytes>
References: <20200806151310.98624-1-ezequiel@collabora.com>
 <20200806151310.98624-10-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Qbvjkv9qwOGw/5Fx"
Content-Disposition: inline
In-Reply-To: <20200806151310.98624-10-ezequiel@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--Qbvjkv9qwOGw/5Fx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu 06 Aug 20, 12:13, Ezequiel Garcia wrote:
> Currently, the SLICE_BASED and FRAME_BASED modes documentation
> is misleading and not matching the intended use-cases.
>=20
> Drop non-required fields SLICE_PARAMS 'start_byte_offset' and
> DECODE_PARAMS 'num_slices' and clarify the decoding modes in the
> documentation.
>=20
> On SLICE_BASED mode, a single slice is expected per OUTPUT buffer,
> and therefore 'start_byte_offset' is not needed (since the offset
> to the slice is the start of the buffer).

Same comment as for the size: how do we plan on managing multiple slices
in a single output buffer later on after removing this?

Cheers,

Paul

> This mode requires the use of CAPTURE buffer holding, and so
> the number of slices shall not be required.
>=20
> On FRAME_BASED mode, the devices are expected to take care of slice
> parsing. Neither SLICE_PARAMS are required (and shouldn't be
> exposed by frame-based drivers), nor the number of slices.
>=20
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  .../media/v4l/ext-ctrls-codec.rst             | 39 +++++--------------
>  include/media/h264-ctrls.h                    |  4 --
>  2 files changed, 10 insertions(+), 33 deletions(-)
>=20
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/=
Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index fff74b7bf32a..b3963c1acc2c 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -1748,9 +1748,6 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>         This compound control is not yet part of the public kernel API
>         and it is expected to change.
> =20
> -       This structure is expected to be passed as an array, with one
> -       entry for each slice included in the bitstream buffer.
> -
>  .. c:type:: v4l2_ctrl_h264_slice_params
> =20
>  .. cssclass:: longtable
> @@ -1760,17 +1757,9 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type=
 -
>      :stub-columns: 0
>      :widths:       1 1 2
> =20
> -    * - __u32
> -      - ``start_byte_offset``
> -        Offset (in bytes) from the beginning of the OUTPUT buffer to the=
 start
> -        of the slice. If the slice starts with a start code, then this i=
s the
> -        offset to such start code. When operating in slice-based decodin=
g mode
> -        (see :c:type:`v4l2_mpeg_video_h264_decode_mode`), this field sho=
uld
> -        be set to 0. When operating in frame-based decoding mode, this f=
ield
> -        should be 0 for the first slice.
>      * - __u32
>        - ``header_bit_size``
> -      -
> +      - Offset in bits to slice_data() from the beginning of this slice.
>      * - __u32
>        - ``first_mb_in_slice``
>        -
> @@ -1998,12 +1987,6 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type=
 -
>      * - struct :c:type:`v4l2_h264_dpb_entry`
>        - ``dpb[16]``
>        -
> -    * - __u16
> -      - ``num_slices``
> -      - Number of slices needed to decode the current frame/field. When
> -        operating in slice-based decoding mode (see
> -        :c:type:`v4l2_mpeg_video_h264_decode_mode`), this field
> -        should always be set to one.
>      * - __u16
>        - ``nal_ref_idc``
>        - NAL reference ID value coming from the NAL Unit header
> @@ -2121,22 +2104,20 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_typ=
e -
>      * - ``V4L2_MPEG_VIDEO_H264_DECODE_MODE_SLICE_BASED``
>        - 0
>        - Decoding is done at the slice granularity.
> -        In this mode, ``num_slices`` field in struct
> -        :c:type:`v4l2_ctrl_h264_decode_params` should be set to 1,
> -        and ``start_byte_offset`` in struct
> -        :c:type:`v4l2_ctrl_h264_slice_params` should be set to 0.
>          The OUTPUT buffer must contain a single slice.
> +        When this mode is selected, the ``V4L2_CID_MPEG_VIDEO_H264_SLICE=
_PARAMS``
> +        control shall be set. When multiple slices compose a frame,
> +        use of ``V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF`` flag
> +        is required.
>      * - ``V4L2_MPEG_VIDEO_H264_DECODE_MODE_FRAME_BASED``
>        - 1
> -      - Decoding is done at the frame granularity.
> -        In this mode, ``num_slices`` field in struct
> -        :c:type:`v4l2_ctrl_h264_decode_params` should be set to the numb=
er
> -        of slices in the frame, and ``start_byte_offset`` in struct
> -        :c:type:`v4l2_ctrl_h264_slice_params` should be set accordingly
> -        for each slice. For the first slice, ``start_byte_offset`` should
> -        be zero.
> +      - Decoding is done at the frame granularity,
>          The OUTPUT buffer must contain all slices needed to decode the
>          frame. The OUTPUT buffer must also contain both fields.
> +        This mode will be supported by devices that
> +        parse the slice(s) header(s) in hardware. When this mode is
> +        selected, the ``V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS``
> +        control shall not be set.
> =20
>  ``V4L2_CID_MPEG_VIDEO_H264_START_CODE (enum)``
>      Specifies the H264 slice start code expected for each slice.
> diff --git a/include/media/h264-ctrls.h b/include/media/h264-ctrls.h
> index f74736fcfa00..ea8c8c93305b 100644
> --- a/include/media/h264-ctrls.h
> +++ b/include/media/h264-ctrls.h
> @@ -158,9 +158,6 @@ struct v4l2_h264_reference {
>  };
> =20
>  struct v4l2_ctrl_h264_slice_params {
> -	/* Offset in bytes to the start of slice in the OUTPUT buffer. */
> -	__u32 start_byte_offset;
> -
>  	/* Offset in bits to slice_data() from the beginning of this slice. */
>  	__u32 header_bit_size;
> =20
> @@ -219,7 +216,6 @@ struct v4l2_h264_dpb_entry {
> =20
>  struct v4l2_ctrl_h264_decode_params {
>  	struct v4l2_h264_dpb_entry dpb[V4L2_H264_NUM_DPB_ENTRIES];
> -	__u16 num_slices;
>  	__u16 nal_ref_idc;
>  	__s32 top_field_order_cnt;
>  	__s32 bottom_field_order_cnt;
> --=20
> 2.27.0
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--Qbvjkv9qwOGw/5Fx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl8sJy8ACgkQ3cLmz3+f
v9FX6wgAoLxd25vNiCRwFeLA5Y7OuzOZYlhR/37nBCHTqFERK0c+ScDXvSILbfuX
nM2sRhRmjQvjAJO1fGBWEdFk1h0JUitPZk39NrUsT+aiJSbfTvAbcDyGERuEz7XI
oDwFQ5PwYqXmEYFFp6nJvwBgK2O5zr6ztrZ747NqaqzxedN1F9bmcuDtUIH34Fdz
qK8JFSb6CuEQu6SkIHbj7Mel7G9UoX+aSpoRBUQwEENmD/MPI4RmYRU/ag5r25pw
dnTxJC02M0UFwKRglhOXyIsvKzCUyAyGyfgvdaK0VoC+N8QmzMGggYyAVbc/VCk+
ymrtDBlLXJVMj4fVx2K66p1/oJGNpg==
=2OoY
-----END PGP SIGNATURE-----

--Qbvjkv9qwOGw/5Fx--
