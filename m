Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83E9414AF8
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2019 15:35:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725883AbfEFNfp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 May 2019 09:35:45 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:43821 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725813AbfEFNfp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 May 2019 09:35:45 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id E082C1BF20A;
        Mon,  6 May 2019 13:35:39 +0000 (UTC)
Date:   Mon, 6 May 2019 15:36:33 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hans.verkuil@cisco.com, jacopo+renesas@jmondi.org,
        robh+dt@kernel.org, laurent.pinchart@ideasonboard.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH v6 07/13] media: tvp5150: add FORMAT_TRY support for
 get/set selection handlers
Message-ID: <20190506133555.yrxaeg5lbswzcd3i@uno.localdomain>
References: <20190415124413.18456-1-m.felsch@pengutronix.de>
 <20190415124413.18456-8-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="lqlwi3dao4omlvmz"
Content-Disposition: inline
In-Reply-To: <20190415124413.18456-8-m.felsch@pengutronix.de>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--lqlwi3dao4omlvmz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Marco,

On Mon, Apr 15, 2019 at 02:44:07PM +0200, Marco Felsch wrote:
> Since commit 10d5509c8d50 ("[media] v4l2: remove g/s_crop from video ops")
> the 'which' field for set/get_selection must be FORMAT_ACTIVE. There is
> no way to try different selections. The patch adds a helper function to
> select the correct selection memory space (sub-device file handle or
> driver state) which will be set/returned.
>
> The TVP5150 AVID will be updated if the 'which' field is FORMAT_ACTIVE
> and the requested selection rectangle differs from the already set one.
>
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
> Changelog:
>
> v5:
>  - handle stub for v4l2_subdev_get_try_crop() internal since commit
>    ("media: v4l2-subdev: add stubs for v4l2_subdev_get_try_*")
>    isn't anymore part of this series.
>  - add error handling of __tvp5150_get_pad_crop()
> v4:
>  - fix merge conflict due to rebase on top of media-tree/master
>  - __tvp5150_get_pad_crop(): cosmetic alignment fixes
>
>  drivers/media/i2c/tvp5150.c | 130 ++++++++++++++++++++++++++----------
>  1 file changed, 96 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
> index 4e3228b2ccbc..9331609425bf 100644
> --- a/drivers/media/i2c/tvp5150.c
> +++ b/drivers/media/i2c/tvp5150.c
> @@ -19,6 +19,7 @@
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-fwnode.h>
>  #include <media/v4l2-mc.h>
> +#include <media/v4l2-rect.h>
>
>  #include "tvp5150_reg.h"
>
> @@ -997,20 +998,48 @@ static void tvp5150_set_default(v4l2_std_id std, struct v4l2_rect *crop)
>  		crop->height = TVP5150_V_MAX_OTHERS;
>  }
>
> +static struct v4l2_rect *
> +__tvp5150_get_pad_crop(struct tvp5150 *decoder,
> +		       struct v4l2_subdev_pad_config *cfg, unsigned int pad,
> +		       enum v4l2_subdev_format_whence which)
> +{
> +	switch (which) {
> +	case V4L2_SUBDEV_FORMAT_TRY:
> +#if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
> +		return v4l2_subdev_get_try_crop(&decoder->sd, cfg, pad);
> +#else
> +		return ERR_PTR(-ENOTTY);
> +#endif
> +	case V4L2_SUBDEV_FORMAT_ACTIVE:
> +		return &decoder->rect;
> +	default:
> +		return NULL;

Do you need this default case? Can you return -EINVAL so that...

> +	}
> +}
> +
>  static int tvp5150_fill_fmt(struct v4l2_subdev *sd,
>  			    struct v4l2_subdev_pad_config *cfg,
>  			    struct v4l2_subdev_format *format)
>  {
>  	struct v4l2_mbus_framefmt *f;
> +	struct v4l2_rect *__crop;
>  	struct tvp5150 *decoder = to_tvp5150(sd);
>
>  	if (!format || (format->pad != TVP5150_PAD_VID_OUT))
>  		return -EINVAL;
>
>  	f = &format->format;
> +	__crop = __tvp5150_get_pad_crop(decoder, cfg, format->pad,
> +					format->which);
> +	if (IS_ERR_OR_NULL(__crop)) {

... here you just need to check if (IS_ERR()) and return it?

> +		if (!__crop)
> +			return -EINVAL;
> +		else
> +			return PTR_ERR(__crop);
> +	}
>
> -	f->width = decoder->rect.width;
> -	f->height = decoder->rect.height / 2;
> +	f->width = __crop->width;
> +	f->height = __crop->height / 2;
>
>  	f->code = TVP5150_MBUS_FMT;
>  	f->field = TVP5150_FIELD;
> @@ -1021,17 +1050,51 @@ static int tvp5150_fill_fmt(struct v4l2_subdev *sd,
>  	return 0;
>  }
>
> +unsigned int tvp5150_get_hmax(struct v4l2_subdev *sd)
> +{
> +	struct tvp5150 *decoder = to_tvp5150(sd);
> +	v4l2_std_id std;
> +
> +	/* Calculate height based on current standard */
> +	if (decoder->norm == V4L2_STD_ALL)
> +		std = tvp5150_read_std(sd);
> +	else
> +		std = decoder->norm;
> +
> +	return (std & V4L2_STD_525_60) ?
> +		TVP5150_V_MAX_525_60 : TVP5150_V_MAX_OTHERS;
> +}
> +
> +static inline void
> +__tvp5150_set_selection(struct v4l2_subdev *sd, struct v4l2_rect rect)
> +{
> +	struct tvp5150 *decoder = to_tvp5150(sd);
> +	unsigned int hmax = tvp5150_get_hmax(sd);
> +
> +	regmap_write(decoder->regmap, TVP5150_VERT_BLANKING_START, rect.top);
> +	regmap_write(decoder->regmap, TVP5150_VERT_BLANKING_STOP,
> +		     rect.top + rect.height - hmax);
> +	regmap_write(decoder->regmap, TVP5150_ACT_VD_CROP_ST_MSB,
> +		     rect.left >> TVP5150_CROP_SHIFT);
> +	regmap_write(decoder->regmap, TVP5150_ACT_VD_CROP_ST_LSB,
> +		     rect.left | (1 << TVP5150_CROP_SHIFT));
> +	regmap_write(decoder->regmap, TVP5150_ACT_VD_CROP_STP_MSB,
> +		     (rect.left + rect.width - TVP5150_MAX_CROP_LEFT) >>
> +		     TVP5150_CROP_SHIFT);
> +	regmap_write(decoder->regmap, TVP5150_ACT_VD_CROP_STP_LSB,
> +		     rect.left + rect.width - TVP5150_MAX_CROP_LEFT);
> +}
> +
>  static int tvp5150_set_selection(struct v4l2_subdev *sd,
>  				 struct v4l2_subdev_pad_config *cfg,
>  				 struct v4l2_subdev_selection *sel)
>  {
>  	struct tvp5150 *decoder = to_tvp5150(sd);
>  	struct v4l2_rect rect = sel->r;
> -	v4l2_std_id std;
> -	int hmax;
> +	struct v4l2_rect *__crop;
> +	unsigned int hmax;
>
> -	if (sel->which != V4L2_SUBDEV_FORMAT_ACTIVE ||
> -	    sel->target != V4L2_SEL_TGT_CROP)
> +	if (sel->target != V4L2_SEL_TGT_CROP)
>  		return -EINVAL;
>
>  	dev_dbg_lvl(sd->dev, 1, debug, "%s left=%d, top=%d, width=%d, height=%d\n",
> @@ -1040,17 +1103,7 @@ static int tvp5150_set_selection(struct v4l2_subdev *sd,
>  	/* tvp5150 has some special limits */
>  	rect.left = clamp(rect.left, 0, TVP5150_MAX_CROP_LEFT);
>  	rect.top = clamp(rect.top, 0, TVP5150_MAX_CROP_TOP);
> -
> -	/* Calculate height based on current standard */
> -	if (decoder->norm == V4L2_STD_ALL)
> -		std = tvp5150_read_std(sd);
> -	else
> -		std = decoder->norm;
> -
> -	if (std & V4L2_STD_525_60)
> -		hmax = TVP5150_V_MAX_525_60;
> -	else
> -		hmax = TVP5150_V_MAX_OTHERS;
> +	hmax = tvp5150_get_hmax(sd);
>
>  	/*
>  	 * alignments:
> @@ -1063,20 +1116,23 @@ static int tvp5150_set_selection(struct v4l2_subdev *sd,
>  			      hmax - TVP5150_MAX_CROP_TOP - rect.top,
>  			      hmax - rect.top, 0, 0);
>
> -	regmap_write(decoder->regmap, TVP5150_VERT_BLANKING_START, rect.top);
> -	regmap_write(decoder->regmap, TVP5150_VERT_BLANKING_STOP,
> -		     rect.top + rect.height - hmax);
> -	regmap_write(decoder->regmap, TVP5150_ACT_VD_CROP_ST_MSB,
> -		     rect.left >> TVP5150_CROP_SHIFT);
> -	regmap_write(decoder->regmap, TVP5150_ACT_VD_CROP_ST_LSB,
> -		     rect.left | (1 << TVP5150_CROP_SHIFT));
> -	regmap_write(decoder->regmap, TVP5150_ACT_VD_CROP_STP_MSB,
> -		     (rect.left + rect.width - TVP5150_MAX_CROP_LEFT) >>
> -		     TVP5150_CROP_SHIFT);
> -	regmap_write(decoder->regmap, TVP5150_ACT_VD_CROP_STP_LSB,
> -		     rect.left + rect.width - TVP5150_MAX_CROP_LEFT);
> +	__crop = __tvp5150_get_pad_crop(decoder, cfg, sel->pad, sel->which);
> +	if (IS_ERR_OR_NULL(__crop)) {
> +		if (!__crop)
> +			return -EINVAL;
> +		else
> +			return PTR_ERR(__crop);

here too

> +	}
> +
> +	/*
> +	 * Update output image size if the selection (crop) rectangle size or
> +	 * position has been modified.
> +	 */
> +	if (!v4l2_rect_equal(&rect, __crop))
> +		if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE)

Can this be a single condition?
Or maybe you could check if the rects are equal and this is a TRY and
return here.

> +			__tvp5150_set_selection(sd, rect);
>
> -	decoder->rect = rect;
> +	*__crop = rect;
>
>  	return 0;
>  }
> @@ -1086,11 +1142,9 @@ static int tvp5150_get_selection(struct v4l2_subdev *sd,
>  				 struct v4l2_subdev_selection *sel)
>  {
>  	struct tvp5150 *decoder = container_of(sd, struct tvp5150, sd);
> +	struct v4l2_rect *__crop;
>  	v4l2_std_id std;
>
> -	if (sel->which != V4L2_SUBDEV_FORMAT_ACTIVE)
> -		return -EINVAL;
> -
>  	switch (sel->target) {
>  	case V4L2_SEL_TGT_CROP_BOUNDS:
>  		sel->r.left = 0;
> @@ -1108,7 +1162,15 @@ static int tvp5150_get_selection(struct v4l2_subdev *sd,
>  			sel->r.height = TVP5150_V_MAX_OTHERS;
>  		return 0;
>  	case V4L2_SEL_TGT_CROP:
> -		sel->r = decoder->rect;
> +		__crop = __tvp5150_get_pad_crop(decoder, cfg, sel->pad,
> +						sel->which);
> +		if (IS_ERR_OR_NULL(__crop)) {
> +			if (!__crop)
> +				return -EINVAL;
> +			else
> +				return PTR_ERR(__crop);
> +		}
> +		sel->r = *__crop;
>  		return 0;
>  	default:
>  		return -EINVAL;
> --
> 2.20.1
>

--lqlwi3dao4omlvmz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAlzQOGEACgkQcjQGjxah
Vjwczg/+LsOHw6lFHWUQLBgIBiGHfnLrgxNrJFvJYcgBxwte9iWhdOzhZEPSUXbz
qTkzSyV7etvrrvWHRvAXjjQrhpLl/gv4FEtblZjDx+W3sqhURIvoM8nJCXAs6b9j
5MpOcB8MTmOd10kZl9wt74duNWfV3cWhOg57x1AeSdaCkr2zDweEYJbnhPu/cJBQ
NXpcf5gul77C4Ahc4ZFvQ2SKPta87vGVuNQpEUyTPdWTo67lQi327tn6KmhNnOeZ
CUiYbGY+yqT3W+fTzRg5MRkxx0677SXu9VtezT3S+4d0RrIL+E0wVWBtaxbDFQAi
BdJZMI0dKoYthkQrQCD91AmkxNpCe5qY8Tg8SFMiAR/OPR+U2Ac6kQOqn5V7Be1R
KR/Z2Yge5vOuyDZi9YQ+C6O6gXqyc98+F0Q8Z6lUbdMN3L0C+aXEVy/insan/c1b
QP+9gdSJSrgoir65QwK3aYovX9wst7LuAQWRGSH2b/fwsR4mJBt+S7XC6drSQ0xY
Is5ZWbk+iXcb/wrl17uAKs8YxmaYjA5lGnGHmrSl3+DMC/Td5qDiIs1gJtanqfEx
UrxNbLYhJv2ntJDkxEYC+MEkF/P0LFmC8RopQBcxX5ZGfxIB3s+1mjzGq/SrIVK5
0dq03kgQ0YplyyqycEpZVZkbfW21bwgCa+R+gkq65VLUsI4ca0E=
=7m8K
-----END PGP SIGNATURE-----

--lqlwi3dao4omlvmz--
