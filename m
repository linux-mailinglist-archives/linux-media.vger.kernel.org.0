Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 937B4BD9DD
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2019 10:29:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2634109AbfIYI3G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Sep 2019 04:29:06 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:58917 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2634104AbfIYI3G (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Sep 2019 04:29:06 -0400
X-Originating-IP: 79.19.63.71
Received: from uno.localdomain (host71-63-dynamic.19-79-r.retail.telecomitalia.it [79.19.63.71])
        (Authenticated sender: jacopo@jmondi.org)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 5FBCB240002;
        Wed, 25 Sep 2019 08:29:02 +0000 (UTC)
Date:   Wed, 25 Sep 2019 10:30:43 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Ricardo Ribalda Delgado <ricardo@ribalda.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/7] media: add V4L2_CTRL_TYPE_AREA control type
Message-ID: <20190925083043.7dt6f7hahmoap3vt@uno.localdomain>
References: <20190920135137.10052-1-ricardo@ribalda.com>
 <20190920135137.10052-4-ricardo@ribalda.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jnyrvndesrd5u7p5"
Content-Disposition: inline
In-Reply-To: <20190920135137.10052-4-ricardo@ribalda.com>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--jnyrvndesrd5u7p5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Ricardo,

On Fri, Sep 20, 2019 at 03:51:33PM +0200, Ricardo Ribalda Delgado wrote:
> This type contains the width and the height of a rectangular area.
>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
> ---
>  drivers/media/v4l2-core/v4l2-ctrls.c | 21 ++++++++++++++
>  include/media/v4l2-ctrls.h           | 41 ++++++++++++++++++++++++++++
>  include/uapi/linux/videodev2.h       |  6 ++++
>  3 files changed, 68 insertions(+)
>
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index 219d8aeefa20..b9a46f536406 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -1678,6 +1678,7 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>  	struct v4l2_ctrl_mpeg2_slice_params *p_mpeg2_slice_params;
>  	struct v4l2_ctrl_vp8_frame_header *p_vp8_frame_header;
>  	void *p = ptr.p + idx * ctrl->elem_size;
> +	struct v4l2_area *area;
>
>  	switch ((u32)ctrl->type) {
>  	case V4L2_CTRL_TYPE_MPEG2_SLICE_PARAMS:
> @@ -1753,6 +1754,11 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>  		zero_padding(p_vp8_frame_header->entropy_header);
>  		zero_padding(p_vp8_frame_header->coder_state);
>  		break;
> +	case V4L2_CTRL_TYPE_AREA:
> +		area = p;
> +		if (!area->width || !area->height)
> +			return -EINVAL;
> +		break;
>  	default:
>  		return -EINVAL;
>  	}
> @@ -2427,6 +2433,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
>  	case V4L2_CTRL_TYPE_VP8_FRAME_HEADER:
>  		elem_size = sizeof(struct v4l2_ctrl_vp8_frame_header);
>  		break;
> +	case V4L2_CTRL_TYPE_AREA:
> +		elem_size = sizeof(struct v4l2_area);
> +		break;
>  	default:
>  		if (type < V4L2_CTRL_COMPOUND_TYPES)
>  			elem_size = sizeof(s32);
> @@ -4116,6 +4125,18 @@ int __v4l2_ctrl_s_ctrl_string(struct v4l2_ctrl *ctrl, const char *s)
>  }
>  EXPORT_SYMBOL(__v4l2_ctrl_s_ctrl_string);
>
> +int __v4l2_ctrl_s_ctrl_area(struct v4l2_ctrl *ctrl,
> +			    const struct v4l2_area *area)
> +{
> +	lockdep_assert_held(ctrl->handler->lock);
> +
> +	/* It's a driver bug if this happens. */
> +	WARN_ON(ctrl->type != V4L2_CTRL_TYPE_AREA);
> +	memcpy(ctrl->p_new.p_area, area, sizeof(*area));
> +	return set_ctrl(NULL, ctrl, 0);
> +}
> +EXPORT_SYMBOL(__v4l2_ctrl_s_ctrl_area);
> +
>  void v4l2_ctrl_request_complete(struct media_request *req,
>  				struct v4l2_ctrl_handler *main_hdl)
>  {
> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> index 4b356df850a1..746969559ef3 100644
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
> @@ -1085,6 +1087,45 @@ static inline int v4l2_ctrl_s_ctrl_string(struct v4l2_ctrl *ctrl, const char *s)
>  	return rval;
>  }
>
> +/**
> + * __v4l2_ctrl_s_ctrl_area() - Unlocked variant of v4l2_ctrl_s_ctrl_area().
> + *
> + * @ctrl:	The control.
> + * @area:	The new area.
> + *
> + * This sets the control's new area safely by going through the control
> + * framework. This function assumes the control's handler is already locked,
> + * allowing it to be used from within the &v4l2_ctrl_ops functions.
> + *
> + * This function is for area type controls only.
> + */
> +int __v4l2_ctrl_s_ctrl_area(struct v4l2_ctrl *ctrl,
> +			    const struct v4l2_area *area);
> +
> +/**
> + * v4l2_ctrl_s_ctrl_area() - Helper function to set a control's area value
> + *	 from within a driver.
> + *
> + * @ctrl:	The control.
> + * @s:		The new area.
> + *
> + * This sets the control's new area safely by going through the control
> + * framework. This function will lock the control's handler, so it cannot be
> + * used from within the &v4l2_ctrl_ops functions.
> + *
> + * This function is for area type controls only.
> + */
> +static inline int v4l2_ctrl_s_ctrl_area(struct v4l2_ctrl *ctrl,
> +					const struct v4l2_area *area)
> +{
> +	int rval;
> +
> +	v4l2_ctrl_lock(ctrl);
> +	rval = __v4l2_ctrl_s_ctrl_area(ctrl, area);
> +	v4l2_ctrl_unlock(ctrl);
> +
> +	return rval;
> +}

Newline maybe?

>  /* Internal helper functions that deal with control events. */
>  extern const struct v4l2_subscribed_event_ops v4l2_ctrl_sub_ev_ops;
>
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 530638dffd93..b3c0961b62a0 100644
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
> @@ -1720,6 +1725,7 @@ enum v4l2_ctrl_type {
>  	V4L2_CTRL_TYPE_U8	     = 0x0100,
>  	V4L2_CTRL_TYPE_U16	     = 0x0101,
>  	V4L2_CTRL_TYPE_U32	     = 0x0102,
> +	V4L2_CTRL_TYPE_AREA          = 0x0106,

I'll let Hans comment on these two bits as I don't know if that's
adding a new control type is right or not.

Have my R-b for the rest though:
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
   j


>  };
>
>  /*  Used in the VIDIOC_QUERYCTRL ioctl for querying controls */
> --
> 2.23.0
>

--jnyrvndesrd5u7p5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl2LJbIACgkQcjQGjxah
VjxKgg//YkjUPQFoVLRgpwIkRCKS3WyvGnGUT0Jl30rhHMCesM9MQAIZJV9W9Tx7
jOGbXZxefjvbljeqFVmwABuEgH9RcIT3fM2Dm5GMYhl8ycLlJrODscg4A1rCyMNW
c9t+mjU+bd4R0bUstcTvbU93xgQjhzDv7D8+ACiNJsDyUEEn21w1tgTM/0eVI/ln
jwdr+EjiFgL6J9om5W1eagTNgx7oBjVGdV90ehlB7ZYPOy2fiC/08J3eRCuhpM+h
84M3TztKOCxtPjo7wZC/GFSp19OTCtEnAOc4hTG/8kCLTn5S8CKgJiE4D+AxPPlG
TtSZNle8G32o+2uEVhGJi4t30OowZbZiGp1wYVM/PHr1eEIIgxdOyqAa7srKMtbA
zRDToS2ajS5qm9j66s5XDC3++tbhiXxwTdP+fWyxhf8diCBWvQIZX+vuAIbZp3NI
MfKQyBJHHAS013SL+9C0BwnHS6fAGSvOJEXleMF/DoUTJDlJGS76en9vS/GDyIOZ
7lE8pYa8eu3uS1ZOyACQRsyOKjDhfWQQIqvbWC5E62FAV8gr8qo22FaEAMC+4JWw
hWVPmqe9Yv+7q5p7+XqVZKisnIaDU59XhK1HZRd6t2XI4LHuL8OJz7bGPbaizAjo
JxdEf/GpH4qOLmazO4IyBYZ7svTJIDEUkKIJ97Ywiwpub/6Yk2U=
=5xeq
-----END PGP SIGNATURE-----

--jnyrvndesrd5u7p5--
