Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFD5232FA5
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2019 14:30:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726635AbfFCMa0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jun 2019 08:30:26 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:38368 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726315AbfFCMa0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jun 2019 08:30:26 -0400
Received: by mail-wm1-f66.google.com with SMTP id t5so10882478wmh.3
        for <linux-media@vger.kernel.org>; Mon, 03 Jun 2019 05:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=RAy5Q/tmWmz4xxS2AF/2UoBhrYQJxv5tb3Og8Bp1ZSk=;
        b=bAEOZaOtMKsaxks2v7hak1u0vYEa6GUzzqZakDudwLOtZ35CbZgn1qGWcSw9YsaSw3
         30ZXGKnk2tnvXtmB4aVW5E7hyK185ii6dQcaR/EyVm+ovPavaukbjsRmF8BFYFGAvX5F
         2lvRujlvun2XdwRPCJUCJ03JqYfpSHEG5/R1vrixrfWsM2abgwL1vKcoR2Y0nhDBYfWQ
         Zc+IzKS+J8pzjRhDnM1FCVEc8wpiMA8XZ6N+h42kpKOFGW8wf3ghX9sLDwg31G9rHlHz
         AD8VURNuK/q9/KVtujpGynaNQlpiWECAOxDu9+DiFPCqlDmhV+O8iSqdh8IoXbODpFVg
         eENQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RAy5Q/tmWmz4xxS2AF/2UoBhrYQJxv5tb3Og8Bp1ZSk=;
        b=E/BlpQRFe0Lbc89JL2TXdx2/bOUlv4mxFuIHGxodpryyD2XzJbeBLpG1fH8oxn6Zpv
         T367K3Gh/GBWDMHWwQ9+oiK9a3yjvPlMdzfKnLGVkUpioB3PHYYsK5Ucofmq786lNHAT
         LtlqpGj0GofkwIMC10Qi3HHFBnU0k7wVpg5yqFGvIxYOpu4EmkKY60H1plFXwBUERA9J
         jx2Dtr3WaRcT7QEtOxFTtATfgN681tRVni0wAvv2mhCCIq0fLxxhwFltHwtdo0H85zCn
         V6vnA6LaKsmzNfxUWKKnAVE9iccP517zSLlqG4pW06LB2hiw2zmDplO+BVQvA4k/bcmk
         MXbg==
X-Gm-Message-State: APjAAAVeDMBGqBa9yTMb6k1DWcS//ahtkKZvzZnO1Dpg1+xx6vOnkovk
        lDfsCll9imMAv8ai7dVjLqM=
X-Google-Smtp-Source: APXvYqx9b1BMMSRlRrzejtIUwLZlarXN4Z/eNK5ylKLN0+7MzrRCxbpCexsOsfvVwjiWnxAhv8/asg==
X-Received: by 2002:a7b:c751:: with SMTP id w17mr2398958wmk.127.1559565022547;
        Mon, 03 Jun 2019 05:30:22 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id r9sm15119089wrq.0.2019.06.03.05.30.21
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 03 Jun 2019 05:30:21 -0700 (PDT)
Date:   Mon, 3 Jun 2019 14:30:20 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-media@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Alexandre Courbot <acourbot@chromium.org>
Subject: Re: [PATCH RFC 2/6] media: uapi: h264: Add the concept of decoding
 mode
Message-ID: <20190603123020.GC30132@ulmo>
References: <20190603110946.4952-1-boris.brezillon@collabora.com>
 <20190603110946.4952-3-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Bu8it7iiRSEf40bY"
Content-Disposition: inline
In-Reply-To: <20190603110946.4952-3-boris.brezillon@collabora.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--Bu8it7iiRSEf40bY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 03, 2019 at 01:09:42PM +0200, Boris Brezillon wrote:
> Some stateless decoders don't support per-slice decoding (or at least
> not in a way that would make them efficient or easy to use).
> Let's expose a menu to control and expose the supported decoding modes.
> Drivers are allowed to support only one decoding but they can support
> both too.
>=20
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  .../media/uapi/v4l/ext-ctrls-codec.rst        | 42 ++++++++++++++++++-
>  drivers/media/v4l2-core/v4l2-ctrls.c          |  9 ++++
>  include/media/h264-ctrls.h                    | 13 ++++++
>  3 files changed, 63 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst b/Documenta=
tion/media/uapi/v4l/ext-ctrls-codec.rst
> index 82547d5de250..188f625acb7c 100644
> --- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> @@ -1748,6 +1748,14 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type=
 -
>      * - __u32
>        - ``size``
>        -
> +    * - __u32
> +      - ``start_byte_offset``
> +      - Where the slice payload starts in the output buffer. Useful when
> +        operating in per frame decoding mode and decoding multi-slice co=
ntent.
> +        In this case, the output buffer will contain more than one slice=
 and
> +        some codecs need to know where each slice starts. Note that this
> +        offsets points to the beginning of the slice which is supposed to
> +        contain an ANNEX B start code
>      * - __u32
>        - ``header_bit_size``
>        -
> @@ -1931,7 +1939,10 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type=
 -
>        -
>      * - __u16
>        - ``num_slices``
> -      - Number of slices needed to decode the current frame
> +      - Number of slices needed to decode the current frame/field. When
> +        operating in per-slice decoding mode (see
> +        :c:type:`v4l2_mpeg_video_h264_decoding_mode`), this field
> +        should always be set to one
>      * - __u16
>        - ``nal_ref_idc``
>        - NAL reference ID value coming from the NAL Unit header
> @@ -2022,6 +2033,35 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type=
 -
>        - 0x00000004
>        - The DPB entry is a long term reference frame
> =20
> +``V4L2_CID_MPEG_VIDEO_H264_DECODING_MODE (enum)``
> +    Specifies the decoding mode to use. Currently exposes per slice and =
per
> +    frame decoding but new modes might be added later on.
> +
> +    .. note::
> +
> +       This menu control is not yet part of the public kernel API and
> +       it is expected to change.
> +
> +.. c:type:: v4l2_mpeg_video_h264_decoding_mode
> +
> +.. cssclass:: longtable
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 1 2
> +
> +    * - ``V4L2_MPEG_VIDEO_H264_DECODING_PER_SLICE``
> +      - 0
> +      - The decoding is done per slice. v4l2_ctrl_h264_decode_params->nu=
m_slices
> +        must be set to 1 and the output buffer should contain only one s=
lice.

I wonder if we need to be that strict. Wouldn't it be possible for
drivers to just iterate over a number of slices and decode each in turn
if userspace passed more than one?

Or perhaps a decoder can batch queue a couple of slices. I'm not sure
how frequent this is, but consider something like a spike in activity on
your system, causing some slices to get delayed so you actually get a
few buffered up before you get a chance to hand them to the V4L2 device.
Processing them all at once may help conceal the lag.

Thierry

> +    * - ``V4L2_MPEG_VIDEO_H264_DECODING_PER_FRAME``
> +      - 1
> +      - The decoding is done per frame. v4l2_ctrl_h264_decode_params->nu=
m_slices
> +        can be > 1. When that happens, the output buffer should contain =
all
> +        slices needed to decode a frame/field, each slice being prefixed=
 by an
> +        Annex B NAL header/start-code.
> +
>  .. _v4l2-mpeg-mpeg2:
> =20
>  ``V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS (struct)``
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-co=
re/v4l2-ctrls.c
> index 1217d38ea394..72bb3c8882f5 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -406,6 +406,11 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
>  		"Explicit",
>  		NULL,
>  	};
> +	static const char * const h264_decoding_mode[] =3D {
> +		"Per Slice",
> +		"Per Frame",
> +		NULL,
> +	};
>  	static const char * const mpeg_mpeg2_level[] =3D {
>  		"Low",
>  		"Main",
> @@ -637,6 +642,8 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
>  		return h264_fp_arrangement_type;
>  	case V4L2_CID_MPEG_VIDEO_H264_FMO_MAP_TYPE:
>  		return h264_fmo_map_type;
> +	case V4L2_CID_MPEG_VIDEO_H264_DECODING_MODE:
> +		return h264_decoding_mode;
>  	case V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL:
>  		return mpeg_mpeg2_level;
>  	case V4L2_CID_MPEG_VIDEO_MPEG2_PROFILE:
> @@ -856,6 +863,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX:		return "H264 Scaling Mat=
rix";
>  	case V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS:		return "H264 Slice Paramet=
ers";
>  	case V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS:		return "H264 Decode Param=
eters";
> +	case V4L2_CID_MPEG_VIDEO_H264_DECODING_MODE:		return "H264 Decoding Mod=
e";
>  	case V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL:			return "MPEG2 Level";
>  	case V4L2_CID_MPEG_VIDEO_MPEG2_PROFILE:			return "MPEG2 Profile";
>  	case V4L2_CID_MPEG_VIDEO_MPEG4_I_FRAME_QP:		return "MPEG4 I-Frame QP Va=
lue";
> @@ -1224,6 +1232,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum=
 v4l2_ctrl_type *type,
>  	case V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_IDC:
>  	case V4L2_CID_MPEG_VIDEO_H264_SEI_FP_ARRANGEMENT_TYPE:
>  	case V4L2_CID_MPEG_VIDEO_H264_FMO_MAP_TYPE:
> +	case V4L2_CID_MPEG_VIDEO_H264_DECODING_MODE:
>  	case V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL:
>  	case V4L2_CID_MPEG_VIDEO_MPEG2_PROFILE:
>  	case V4L2_CID_MPEG_VIDEO_MPEG4_LEVEL:
> diff --git a/include/media/h264-ctrls.h b/include/media/h264-ctrls.h
> index e1404d78d6ff..26de2243f6f5 100644
> --- a/include/media/h264-ctrls.h
> +++ b/include/media/h264-ctrls.h
> @@ -26,6 +26,7 @@
>  #define V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX	(V4L2_CID_MPEG_BASE+1002)
>  #define V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS	(V4L2_CID_MPEG_BASE+1003)
>  #define V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS	(V4L2_CID_MPEG_BASE+1004)
> +#define V4L2_CID_MPEG_VIDEO_H264_DECODING_MODE	(V4L2_CID_MPEG_BASE+1005)
> =20
>  /* enum v4l2_ctrl_type type values */
>  #define V4L2_CTRL_TYPE_H264_SPS			0x0110
> @@ -33,6 +34,12 @@
>  #define V4L2_CTRL_TYPE_H264_SCALING_MATRIX	0x0112
>  #define V4L2_CTRL_TYPE_H264_SLICE_PARAMS	0x0113
>  #define V4L2_CTRL_TYPE_H264_DECODE_PARAMS	0x0114
> +#define V4L2_CTRL_TYPE_H264_DECODING_MODE	0x0115
> +
> +enum v4l2_mpeg_video_h264_decoding_mode {
> +	V4L2_MPEG_VIDEO_H264_DECODING_PER_SLICE,
> +	V4L2_MPEG_VIDEO_H264_DECODING_PER_FRAME,
> +};
> =20
>  #define V4L2_H264_SPS_CONSTRAINT_SET0_FLAG			0x01
>  #define V4L2_H264_SPS_CONSTRAINT_SET1_FLAG			0x02
> @@ -111,6 +118,8 @@ struct v4l2_h264_pred_weight_table {
>  	struct v4l2_h264_weight_factors weight_factors[2];
>  };
> =20
> +#define V4L2_H264_MAX_SLICES_PER_FRAME			16
> +
>  #define V4L2_H264_SLICE_TYPE_P				0
>  #define V4L2_H264_SLICE_TYPE_B				1
>  #define V4L2_H264_SLICE_TYPE_I				2
> @@ -125,6 +134,10 @@ struct v4l2_h264_pred_weight_table {
>  struct v4l2_ctrl_h264_slice_params {
>  	/* Size in bytes, including header */
>  	__u32 size;
> +
> +	/* Where the slice starts in the output buffer (expressed in bytes). */
> +	__u32 start_byte_offset;
> +
>  	/* Offset in bits to slice_data() from the beginning of this slice. */
>  	__u32 header_bit_size;
> =20
> --=20
> 2.20.1
>=20

--Bu8it7iiRSEf40bY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlz1EtkACgkQ3SOs138+
s6FZQQ/8C7kJUSFWP/nYVE16Rta5Uj0IYwQ4vq8CepJTBG70+x1UGpFJxQ6wTLLe
T1JIwy5Qe10ZG46mnTPFsJ1y2OYJJZ3pi0+DzKUOoSgPltp2DJfj1wYj8XXdL4yv
cZKdMVLAAXZFe8O0tZpkUSgaTgYQa0Y83Xlb9xSdyQ+573XEqBElRb4cNI6v+VLr
ky33BRJAGuYQ4YCQq+nUytHh89pUneL2G7BmsicEsc6x7+82KifIBmiA9WKoqIAz
BQm9isDUtQtp/6QM+iB3JfP97nz5n4arMMJLlS92S0mpkGWhnSpgvuvdQx7OWfmX
GFiL/9vp+xkFnU8GVrXGw/gJunWtsSzc+a1oUA9hMmhmJn3l5jsoKeY+QkcEgIO3
kTOTWuqsaSJUmFdW+xROP8PWTEIPnzVi9fHa2zOvI0TvkeEyKr/jkBIFvsKUvfQd
VwmsT+8Xxk0D0uzbtHKR4aMNE1NQNc41IQfB2TOpLJn1Vh7/B+XxrrO/Qf8OlDKa
k+YPW+i0xRdm3xQuD300irQY2OSx40bF0JumGvpTP53pn3usjeeDSBj7FUGAB4U6
oj/yPTHUSwf6mSz1gHWbz4h9PmIo3mAXeUCoptKJYakeM9kNEoyOx01aSsEdhIdW
TEQbn39Zl1IhdhVTtgKX2u+CHLMDfWgzHm4gW2oCBLPBJ7m54g8=
=vtaX
-----END PGP SIGNATURE-----

--Bu8it7iiRSEf40bY--
