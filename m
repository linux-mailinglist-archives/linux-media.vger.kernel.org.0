Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60EFE25CF16
	for <lists+linux-media@lfdr.de>; Fri,  4 Sep 2020 03:29:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729511AbgIDB3R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Sep 2020 21:29:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728134AbgIDB3R (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Sep 2020 21:29:17 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC162C061244;
        Thu,  3 Sep 2020 18:29:15 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2882B277;
        Fri,  4 Sep 2020 03:29:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1599182951;
        bh=+vMvvm96C0RM8WlV76DRDwG9Vmz0e1ZGmQsuEtOa8ZY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TpZWkOPzRWvoeKpN/JQTXvPSFDLBMFWzAEcmMUv2UKLK28dMC4pazpp1/lHlGvA99
         gFURUSlSD1XVkgCFlkC55lFvq6NqdbyH3qxBNl4beGpenFPy7EREHPPTSLojMo1ymP
         XuPjXDCbSgDcRJfrUftKDBHpfi8LABx6jPgw7CoA=
Date:   Fri, 4 Sep 2020 04:28:47 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH v3 2/2] media: i2c: ov772x: Add test pattern control
Message-ID: <20200904012847.GB9369@pendragon.ideasonboard.com>
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

Hi Prabhakar,

Thank you for the patch.

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
>  	}
>  
>  	return -EINVAL;
> @@ -1103,10 +1118,14 @@ static int ov772x_set_params(struct ov772x_priv *priv,
>  		val |= VFLIP_IMG;
>  	if (priv->info && (priv->info->flags & OV772X_FLAG_HFLIP))
>  		val |= HFLIP_IMG;
> +	if (priv->info && (priv->info->flags & OV772X_FLAG_TEST_PATTERN))
> +		val |= SCOLOR_TEST;

Why do you need this new flag ? First of all flags are only used on
systems that use platform data, which has been deprecated in favour of
DT for a long time, and then I don't see a need to enable the test
pattern from platform data.

>  	if (priv->vflip_ctrl->val)
>  		val ^= VFLIP_IMG;
>  	if (priv->hflip_ctrl->val)
>  		val ^= HFLIP_IMG;
> +	if (priv->test_pattern)
> +		val ^= SCOLOR_TEST;

It would be nice if we could replace the manual handling of controls in
this function by a call to v4l2_ctrl_handler_setup(), but that's a
candidate for a separate patch.

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

-- 
Regards,

Laurent Pinchart
