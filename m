Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6FAC9C9ED
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2019 09:11:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729892AbfHZHK4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Aug 2019 03:10:56 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:54963 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729625AbfHZHK4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Aug 2019 03:10:56 -0400
Received: from uno.localdomain (unknown [87.18.63.98])
        (Authenticated sender: jacopo@jmondi.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id D9699240010;
        Mon, 26 Aug 2019 07:10:49 +0000 (UTC)
Date:   Mon, 26 Aug 2019 09:12:16 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/7] media: add V4L2_CID_UNIT_CELL_SIZE control
Message-ID: <20190826071216.i5k5dwvqutv6lu2u@uno.localdomain>
References: <20190823123737.7774-1-ribalda@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gy5q44t4rn2cb7ev"
Content-Disposition: inline
In-Reply-To: <20190823123737.7774-1-ribalda@kernel.org>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--gy5q44t4rn2cb7ev
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Ricardo,

On Fri, Aug 23, 2019 at 02:37:31PM +0200, Ricardo Ribalda Delgado wrote:
> This control returns the unit cell size in nanometres. The struct provides
> the width and the height in separated fields to take into consideration
> asymmetric pixels and/or hardware binning.
> This control is required for automatic calibration of sensors/cameras.
>
> Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
> ---
> v3:
> -Put together all actions on ctrl_fill
> -Move the control to IMAGE_SOURCE
>
>  drivers/media/v4l2-core/v4l2-ctrls.c | 11 +++++++++++
>  include/media/v4l2-ctrls.h           |  2 ++
>  include/uapi/linux/v4l2-controls.h   |  1 +
>  include/uapi/linux/videodev2.h       | 11 +++++++++++
>  4 files changed, 25 insertions(+)
>
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index 1d8f38824631..b3bf458df7f7 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -994,6 +994,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_AUTO_FOCUS_RANGE:		return "Auto Focus, Range";
>  	case V4L2_CID_PAN_SPEED:		return "Pan, Speed";
>  	case V4L2_CID_TILT_SPEED:		return "Tilt, Speed";
> +	case V4L2_CID_UNIT_CELL_SIZE:		return "Unit Cell Size";
>
>  	/* FM Radio Modulator controls */
>  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> @@ -1375,6 +1376,10 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  	case V4L2_CID_MPEG_VIDEO_VP8_FRAME_HEADER:
>  		*type = V4L2_CTRL_TYPE_VP8_FRAME_HEADER;
>  		break;
> +	case V4L2_CID_UNIT_CELL_SIZE:
> +		*type = V4L2_CTRL_TYPE_AREA;
> +		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +		break;
>  	default:
>  		*type = V4L2_CTRL_TYPE_INTEGER;
>  		break;
> @@ -1723,6 +1728,9 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>  	case V4L2_CTRL_TYPE_FWHT_PARAMS:
>  		break;
>
> +	case V4L2_CTRL_TYPE_AREA:
> +		break;
> +
>  	case V4L2_CTRL_TYPE_H264_SPS:
>  	case V4L2_CTRL_TYPE_H264_PPS:
>  	case V4L2_CTRL_TYPE_H264_SCALING_MATRIX:
> @@ -2421,6 +2429,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
>  	case V4L2_CTRL_TYPE_VP8_FRAME_HEADER:
>  		elem_size = sizeof(struct v4l2_ctrl_vp8_frame_header);
>  		break;
> +	case V4L2_CTRL_TYPE_AREA:
> +		elem_size = sizeof(struct v4l2_area);
> +		break;
>  	default:
>  		if (type < V4L2_CTRL_COMPOUND_TYPES)
>  			elem_size = sizeof(s32);
> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> index 570ff4b0205a..9a3d11350e67 100644
> --- a/include/media/v4l2-ctrls.h
> +++ b/include/media/v4l2-ctrls.h
> @@ -50,6 +50,7 @@ struct poll_table_struct;
>   * @p_h264_slice_params:	Pointer to a struct v4l2_ctrl_h264_slice_params.
>   * @p_h264_decode_params:	Pointer to a struct v4l2_ctrl_h264_decode_params.
>   * @p_vp8_frame_header:		Pointer to a VP8 frame header structure.
> + * @p_area:			Pointer to an area.
>   * @p:				Pointer to a compound value.
>   */
>  union v4l2_ctrl_ptr {
> @@ -68,6 +69,7 @@ union v4l2_ctrl_ptr {
>  	struct v4l2_ctrl_h264_slice_params *p_h264_slice_params;
>  	struct v4l2_ctrl_h264_decode_params *p_h264_decode_params;
>  	struct v4l2_ctrl_vp8_frame_header *p_vp8_frame_header;
> +	struct v4l2_area *p_area;
>  	void *p;
>  };
>
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index a2669b79b294..5a7bedee2b0e 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -1034,6 +1034,7 @@ enum v4l2_jpeg_chroma_subsampling {
>  #define V4L2_CID_TEST_PATTERN_GREENR		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 5)
>  #define V4L2_CID_TEST_PATTERN_BLUE		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 6)
>  #define V4L2_CID_TEST_PATTERN_GREENB		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 7)
> +#define V4L2_CID_UNIT_CELL_SIZE			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 8)
>
>
>  /* Image processing controls */
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 530638dffd93..05cfc69d7ed6 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -422,6 +422,11 @@ struct v4l2_fract {
>  	__u32   denominator;
>  };
>
> +struct v4l2_area {
> +	__u32   width;
> +	__u32   height;
> +};
> +
>  /**
>    * struct v4l2_capability - Describes V4L2 device caps returned by VIDIOC_QUERYCAP
>    *
> @@ -1720,6 +1725,12 @@ enum v4l2_ctrl_type {
>  	V4L2_CTRL_TYPE_U8	     = 0x0100,
>  	V4L2_CTRL_TYPE_U16	     = 0x0101,
>  	V4L2_CTRL_TYPE_U32	     = 0x0102,
> +	/*
> +	 * V4L2_CTRL_TYPE_MPEG2_SLICE_PARAMS = 0x0103,
> +	 * V4L2_CTRL_TYPE_MPEG2_QUANTIZATION = 0x0104,
> +	 * V4L2_CTRL_TYPE_FWHT_PARAMS = 0x0105,
> +	 */

With a confirmation from Hans and others this comments fits here

Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
   j

> +	V4L2_CTRL_TYPE_AREA    = 0x0106,
>  };
>
>  /*  Used in the VIDIOC_QUERYCTRL ioctl for querying controls */
> --
> 2.23.0.rc1
>

--gy5q44t4rn2cb7ev
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl1jhksACgkQcjQGjxah
VjwavRAAs3r3di+gEr5tGXIuX2dim23hkoLbcBHiJqMuJR3JZMizC3UGSE3AAkb+
1fczYyNCP8bvrgMIOBTGgwfidHfVV7bTeAfs67CO4f2RHIBYZbPx+UeXvTaMU/yc
E4vSRjpAcLOSCysE4S7d/XRjWbGGYxRm+szPsKWW/4Hmw3Q4tgZlDklddy29yUdy
QWk5GpA0RuhqJ4VCP1K/xPfeTF0RydVArkqMjSY9GKmhdSeNBB0fSnoDgoA5W7LU
aOuF5hlfIqjW1RX7PDKI27And9+e4PwGujyeAqxWBcIc1kNhXeIlrhVHy2jpc9AC
w+uNP3tGbzC1UNVpFL5Af2HSGbXgBg17cIwQeD3TKEZ5bEeZ1b0QPZ78ru+akEBz
aPuM6EO6TAHAjqLhMsHaFIsD84A6bgs7S2b4PkHIBv3aJGFx4etWj65xvWLNAK8M
9R8amaMEjzAqyw03SgS2/f6gkXGCql0A2mTMRwKNjYlbnNank242eOn17oz+oOHf
zQfs40W3/FedXYSwfMnwpADlLuJ6/Adi4kMvrn7vgiEKkIz/BrTfhzo3fZAByp9b
nRZWdZYGm53lggbt6tHsJkc0MNsFym49rUI6Cb1bjDLqEinqPobMfZU4SDY6TrjK
u1DvSlYLlIojnBRng6LiHqP1lYasemB9eukghI9/X5yBph7CMuA=
=h7S+
-----END PGP SIGNATURE-----

--gy5q44t4rn2cb7ev--
