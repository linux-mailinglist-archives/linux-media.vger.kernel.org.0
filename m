Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8640225C62C
	for <lists+linux-media@lfdr.de>; Thu,  3 Sep 2020 18:07:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728419AbgICQHc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Sep 2020 12:07:32 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:57375 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727786AbgICQH3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Sep 2020 12:07:29 -0400
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 191AE240016;
        Thu,  3 Sep 2020 16:07:22 +0000 (UTC)
Date:   Thu, 3 Sep 2020 18:11:08 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH v3 2/2] media: i2c: ov772x: Add test pattern control
Message-ID: <20200903161108.aqlgicfhwgyccwou@uno.localdomain>
References: <20200824190406.27478-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200824190406.27478-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200824190406.27478-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On Mon, Aug 24, 2020 at 08:04:06PM +0100, Lad Prabhakar wrote:
> Add support for test pattern control supported by the sensor.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/media/i2c/ov772x.c | 25 ++++++++++++++++++++++++-
>  include/media/i2c/ov772x.h |  1 +
>  2 files changed, 25 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/ov772x.c b/drivers/media/i2c/ov772x.c
> index 67764d647526..f267d8abd742 100644
> --- a/drivers/media/i2c/ov772x.c
> +++ b/drivers/media/i2c/ov772x.c
> @@ -227,7 +227,7 @@
>
>  /* COM3 */
>  #define SWAP_MASK       (SWAP_RGB | SWAP_YUV | SWAP_ML)
> -#define IMG_MASK        (VFLIP_IMG | HFLIP_IMG)
> +#define IMG_MASK        (VFLIP_IMG | HFLIP_IMG | SCOLOR_TEST)
>
>  #define VFLIP_IMG       0x80	/* Vertical flip image ON/OFF selection */
>  #define HFLIP_IMG       0x40	/* Horizontal mirror image ON/OFF selection */
> @@ -425,6 +425,7 @@ struct ov772x_priv {
>  	const struct ov772x_win_size     *win;
>  	struct v4l2_ctrl		 *vflip_ctrl;
>  	struct v4l2_ctrl		 *hflip_ctrl;
> +	unsigned int			  test_pattern;
>  	/* band_filter = COM8[5] ? 256 - BDBASE : 0 */
>  	struct v4l2_ctrl		 *band_filter_ctrl;
>  	unsigned int			  fps;
> @@ -540,6 +541,11 @@ static const struct ov772x_win_size ov772x_win_sizes[] = {
>  	},
>  };
>
> +static const char * const ov772x_test_pattern_menu[] = {
> +	"Disabled",
> +	"Vertical Color Bar Type 1",
> +};
> +
>  /*
>   * frame rate settings lists
>   */
> @@ -762,6 +768,13 @@ static int ov772x_s_frame_interval(struct v4l2_subdev *sd,
>  	return ret;
>  }
>
> +static int ov772x_enable_test_pattern(struct ov772x_priv *priv, u32 pattern)
> +{
> +	priv->test_pattern = pattern;
> +	return regmap_update_bits(priv->regmap, COM3, SCOLOR_TEST,
> +				  pattern ? SCOLOR_TEST : 0x00);
> +}
> +
>  static int ov772x_s_ctrl(struct v4l2_ctrl *ctrl)
>  {
>  	struct ov772x_priv *priv = container_of(ctrl->handler,
> @@ -809,6 +822,8 @@ static int ov772x_s_ctrl(struct v4l2_ctrl *ctrl)
>  		}
>
>  		return ret;
> +	case V4L2_CID_TEST_PATTERN:
> +		return ov772x_enable_test_pattern(priv, ctrl->val);

I think you should rather save ctrl->val in priv->test_patter here,
and then apply it at set_params() time (which is called at power on).
But I see the driver refusing to s_ctrl() and not calling
__v4l2_ctrl_handler_setup() at power up time, so I think the idea is
just to ignore controls set when the sensor is powered down..

>  	}
>
>  	return -EINVAL;
> @@ -1103,10 +1118,14 @@ static int ov772x_set_params(struct ov772x_priv *priv,
>  		val |= VFLIP_IMG;
>  	if (priv->info && (priv->info->flags & OV772X_FLAG_HFLIP))
>  		val |= HFLIP_IMG;
> +	if (priv->info && (priv->info->flags & OV772X_FLAG_TEST_PATTERN))
> +		val |= SCOLOR_TEST;
>  	if (priv->vflip_ctrl->val)
>  		val ^= VFLIP_IMG;
>  	if (priv->hflip_ctrl->val)
>  		val ^= HFLIP_IMG;
> +	if (priv->test_pattern)
> +		val ^= SCOLOR_TEST;

I'm not sure this is required to be honest.

For hflip/vflip the =^ serves to invert the v4l2-control meaning, as
the image is said to be already H/V flipped by the platform data (if I
got this part right).

For test pattern, do we want the same behaviour ? If enabled by
platform data then selecting "Vertical Color Bar Type 1" then disables
it ? I don't think so...

Anyway, minor issue. With this addressed
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
  j

>
>  	ret = regmap_update_bits(priv->regmap, COM3, SWAP_MASK | IMG_MASK, val);
>  	if (ret < 0)
> @@ -1404,6 +1423,10 @@ static int ov772x_probe(struct i2c_client *client)
>  	priv->band_filter_ctrl = v4l2_ctrl_new_std(&priv->hdl, &ov772x_ctrl_ops,
>  						   V4L2_CID_BAND_STOP_FILTER,
>  						   0, 256, 1, 0);
> +	v4l2_ctrl_new_std_menu_items(&priv->hdl, &ov772x_ctrl_ops,
> +				     V4L2_CID_TEST_PATTERN,
> +				     ARRAY_SIZE(ov772x_test_pattern_menu) - 1,
> +				     0, 0, ov772x_test_pattern_menu);
>  	priv->subdev.ctrl_handler = &priv->hdl;
>  	if (priv->hdl.error) {
>  		ret = priv->hdl.error;
> diff --git a/include/media/i2c/ov772x.h b/include/media/i2c/ov772x.h
> index a1702d420087..65e6f8d2f4bb 100644
> --- a/include/media/i2c/ov772x.h
> +++ b/include/media/i2c/ov772x.h
> @@ -12,6 +12,7 @@
>  /* for flags */
>  #define OV772X_FLAG_VFLIP	(1 << 0) /* Vertical flip image */
>  #define OV772X_FLAG_HFLIP	(1 << 1) /* Horizontal flip image */
> +#define OV772X_FLAG_TEST_PATTERN	(1 << 2) /* Test pattern */
>
>  /*
>   * for Edge ctrl
> --
> 2.17.1
>
