Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0BFC97FB6
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2019 18:10:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728299AbfHUQKZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Aug 2019 12:10:25 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:58161 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728194AbfHUQKZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Aug 2019 12:10:25 -0400
X-Originating-IP: 87.18.63.98
Received: from uno.localdomain (unknown [87.18.63.98])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 3716F1C0006;
        Wed, 21 Aug 2019 16:10:21 +0000 (UTC)
Date:   Wed, 21 Aug 2019 18:11:50 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] media: add pixel_size control
Message-ID: <20190821161150.hcbxzxcjvbkoqyb3@uno.localdomain>
References: <20190819121720.31345-1-ribalda@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="i2qbawnsbkak4g6z"
Content-Disposition: inline
In-Reply-To: <20190819121720.31345-1-ribalda@kernel.org>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--i2qbawnsbkak4g6z
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Ricardo,

On Mon, Aug 19, 2019 at 02:17:18PM +0200, Ricardo Ribalda Delgado wrote:
> This control returns the pixel size in nanometres. The struct provides
> the width and the height in separated fields to take into consideration
> asymmetric pixels and/or hardware binning.
> This control is required for automatic calibration of the sensor.
>
> Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
> ---
>  drivers/media/v4l2-core/v4l2-ctrls.c | 11 +++++++++++
>  include/media/v4l2-ctrls.h           |  2 ++
>  include/uapi/linux/v4l2-controls.h   |  3 +++
>  include/uapi/linux/videodev2.h       | 11 +++++++++++
>  4 files changed, 27 insertions(+)
>
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index cd1ae016706f..a3a0086c96ff 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -978,6 +978,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_AUTO_FOCUS_RANGE:		return "Auto Focus, Range";
>  	case V4L2_CID_PAN_SPEED:		return "Pan, Speed";
>  	case V4L2_CID_TILT_SPEED:		return "Tilt, Speed";
> +	case V4L2_CID_PIXEL_SIZE:		return "Pixel Size";

Is this a camera class control or an image source one ?
Also, isn't pixel size a bit too generic? I would somehow specify this is
the physical pixel size

>
>  	/* FM Radio Modulator controls */
>  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> @@ -1357,6 +1358,9 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  	case V4L2_CID_MPEG_VIDEO_VP8_FRAME_HEADER:
>  		*type = V4L2_CTRL_TYPE_VP8_FRAME_HEADER;
>  		break;
> +	case V4L2_CID_PIXEL_SIZE:
> +		*type = V4L2_CTRL_TYPE_PIXEL_SIZE;

Isn't this a read-only control?

> +		break;
>  	default:
>  		*type = V4L2_CTRL_TYPE_INTEGER;
>  		break;
> @@ -1423,6 +1427,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  	case V4L2_CID_RDS_RX_TRAFFIC_ANNOUNCEMENT:
>  	case V4L2_CID_RDS_RX_TRAFFIC_PROGRAM:
>  	case V4L2_CID_RDS_RX_MUSIC_SPEECH:
> +	case V4L2_CID_PIXEL_SIZE:
>  		*flags |= V4L2_CTRL_FLAG_READ_ONLY;

Ah yes, you set flags here... I don't get why we have two switches
here.. Anyway, I would set both type and flags in a single case,
otherwise one should jump back and forth...

>  		break;
>  	case V4L2_CID_RF_TUNER_PLL_LOCK:
> @@ -1705,6 +1710,9 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>  	case V4L2_CTRL_TYPE_FWHT_PARAMS:
>  		break;
>
> +	case V4L2_CTRL_TYPE_PIXEL_SIZE:
> +		break;
> +
>  	case V4L2_CTRL_TYPE_H264_SPS:
>  	case V4L2_CTRL_TYPE_H264_PPS:
>  	case V4L2_CTRL_TYPE_H264_SCALING_MATRIX:
> @@ -2403,6 +2411,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
>  	case V4L2_CTRL_TYPE_VP8_FRAME_HEADER:
>  		elem_size = sizeof(struct v4l2_ctrl_vp8_frame_header);
>  		break;
> +	case V4L2_CTRL_TYPE_PIXEL_SIZE:
> +		elem_size = sizeof(struct v4l2_pixel_size);
> +		break;
>  	default:
>  		if (type < V4L2_CTRL_COMPOUND_TYPES)
>  			elem_size = sizeof(s32);
> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> index 570ff4b0205a..63de780398b8 100644
> --- a/include/media/v4l2-ctrls.h
> +++ b/include/media/v4l2-ctrls.h
> @@ -50,6 +50,7 @@ struct poll_table_struct;
>   * @p_h264_slice_params:	Pointer to a struct v4l2_ctrl_h264_slice_params.
>   * @p_h264_decode_params:	Pointer to a struct v4l2_ctrl_h264_decode_params.
>   * @p_vp8_frame_header:		Pointer to a VP8 frame header structure.
> + * @p_pixel_size:		Pointer to a pixel_size value.
>   * @p:				Pointer to a compound value.
>   */
>  union v4l2_ctrl_ptr {
> @@ -68,6 +69,7 @@ union v4l2_ctrl_ptr {
>  	struct v4l2_ctrl_h264_slice_params *p_h264_slice_params;
>  	struct v4l2_ctrl_h264_decode_params *p_h264_decode_params;
>  	struct v4l2_ctrl_vp8_frame_header *p_vp8_frame_header;
> +	struct v4l2_pixel_size *p_pixel_size;
>  	void *p;
>  };
>
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index a2669b79b294..13f0410df4c6 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -912,6 +912,9 @@ enum v4l2_auto_focus_range {
>  #define V4L2_CID_PAN_SPEED			(V4L2_CID_CAMERA_CLASS_BASE+32)
>  #define V4L2_CID_TILT_SPEED			(V4L2_CID_CAMERA_CLASS_BASE+33)
>
> +#define V4L2_CID_PIXEL_SIZE			(V4L2_CID_CAMERA_CLASS_BASE+34)
> +
> +

Double empty line

>  /* FM Modulator class control IDs */
>
>  #define V4L2_CID_FM_TX_CLASS_BASE		(V4L2_CTRL_CLASS_FM_TX | 0x900)
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 2427bc4d8eba..21f4846dca0b 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -422,6 +422,11 @@ struct v4l2_fract {
>  	__u32   denominator;
>  };
>
> +struct v4l2_pixel_size {

I wonder if instead of defining a 'pixel size' this shouldn't be a
more generic v4l2_size or something similar. Or even a v4l2_rect with
left=top=0.

> +	__u32   width;
> +	__u32   height;
> +};
> +
>  /**
>    * struct v4l2_capability - Describes V4L2 device caps returned by VIDIOC_QUERYCAP
>    *
> @@ -1718,6 +1723,12 @@ enum v4l2_ctrl_type {
>  	V4L2_CTRL_TYPE_U8	     = 0x0100,
>  	V4L2_CTRL_TYPE_U16	     = 0x0101,
>  	V4L2_CTRL_TYPE_U32	     = 0x0102,
> +	/*
> +	 * V4L2_CTRL_TYPE_MPEG2_SLICE_PARAMS = 0x0103,
> +	 * V4L2_CTRL_TYPE_MPEG2_QUANTIZATION = 0x0104,
> +	 * V4L2_CTRL_TYPE_FWHT_PARAMS = 0x0105,
> +	 */

leftovers ?

> +	V4L2_CTRL_TYPE_PIXEL_SIZE    = 0x0106,

I don't see other compound controls with a custom payload adding their
types here. What am I missing?

Thanks
  j

>  };
>
>  /*  Used in the VIDIOC_QUERYCTRL ioctl for querying controls */
> --
> 2.23.0.rc1
>

--i2qbawnsbkak4g6z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl1dbUYACgkQcjQGjxah
VjzMSg//T3Z0Pn/MM4rl0d9E08+UhovwymM92g/k2giBnTTDmLyZSanh4wJ5z95z
CcySqDqSdsgk4oe7BSMR3+kaK/O0M9o7wkzNUIzpgT0H2zPIkhLo4rkYN97W2XCj
eVIcUkdK0YSRpJLUYXP4PyTYMNhwwmP8ugCtfnhdMnVP5ly5H/jHcH9PVlBUVpaq
qrZVRmfzX7N6jt5L3QE7EMXnH0OouQuZRE7c0RqcRYkFwtsyDtu7Wc9cfAxQGKW2
Udkx387YTsLGTvh3TgVyiR28fonYxfo48lj8YPM49O53stwsqgMeg667UJ6HPzko
RY6QUwbz9Yo5ThnMhfIRqIP88wPTYyd+gls8Hs6PJ+LZx5AGYavfBvtWI15NuRSc
+VKrN9s2pqrO4SJsZvtxR0P4he6SeGPNDjozLv2rgtrJDlWstPKe97fwoRWBhFwd
xb8dHGD6LD5X6bDiJNWFNs5gMti3lMH92CfXC36S2OktV40EVAXWQCryQWohH3cm
hvFbS8odj2AvXP+1ogErP5QgZe4iI+kDct1kUxt1TjE3iWjbvIENpjgTU9WUvM70
VY6YcW58J1vk+DZHORiEbB5lA/8cDeoWYSVTROKq9FPrfGxOybwzLzcVfo5N37QO
JaPhMfm1TLiecZV2w8KdpdfHsEJF3QEGDy9pBztLV/B8FCw7xA0=
=+EdP
-----END PGP SIGNATURE-----

--i2qbawnsbkak4g6z--
