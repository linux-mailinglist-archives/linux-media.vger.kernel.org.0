Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E79034888B0
	for <lists+linux-media@lfdr.de>; Sun,  9 Jan 2022 11:25:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230333AbiAIKZQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 9 Jan 2022 05:25:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229840AbiAIKZP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 9 Jan 2022 05:25:15 -0500
X-Greylist: delayed 1319 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 09 Jan 2022 02:25:14 PST
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A698EC06173F;
        Sun,  9 Jan 2022 02:25:14 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id B0C3120002;
        Sun,  9 Jan 2022 10:25:11 +0000 (UTC)
Date:   Sun, 9 Jan 2022 11:26:11 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Thomas Nizan <tnizan@witekio.com>
Subject: Re: [PATCH v2 05/11] media: i2c: max9286: Support manual framesync
 operation
Message-ID: <20220109102611.w2vae4eeavbwpfwj@uno.localdomain>
References: <20220101182806.19311-1-laurent.pinchart+renesas@ideasonboard.com>
 <20220101182806.19311-6-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220101182806.19311-6-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Sat, Jan 01, 2022 at 08:28:00PM +0200, Laurent Pinchart wrote:
> The MAX9286 can generate a framesync signal to synchronize the cameras,
> using an internal timer. Support this mode of operation and configure it
> through the .s_frameinterval() operation. If the frame interval is not
> 0, framesync is switched to manual mode with the specified interval,
> otherwise automatic mode is used.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
> Changes since v1:
>
> - Use pixel rate to calculate frame sync counter
> ---

Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
  j

>  drivers/media/i2c/max9286.c | 84 +++++++++++++++++++++++++++++++++----
>  1 file changed, 75 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index 15c80034e3a4..75374034724f 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -170,9 +170,11 @@ struct max9286_priv {
>  	u32 rev_chan_mv;
>
>  	struct v4l2_ctrl_handler ctrls;
> -	struct v4l2_ctrl *pixelrate;
> +	struct v4l2_ctrl *pixelrate_ctrl;
> +	unsigned int pixelrate;
>
>  	struct v4l2_mbus_framefmt fmt[MAX9286_N_SINKS];
> +	struct v4l2_fract interval;
>
>  	/* Protects controls and fmt structures */
>  	struct mutex mutex;
> @@ -473,6 +475,40 @@ static int max9286_check_config_link(struct max9286_priv *priv,
>  	return 0;
>  }
>
> +static void max9286_set_fsync_period(struct max9286_priv *priv)
> +{
> +	u32 fsync;
> +
> +	if (!priv->interval.numerator || !priv->interval.denominator) {
> +		/*
> +		 * Special case, a null interval enables automatic FRAMESYNC
> +		 * mode. FRAMESYNC is taken from the slowest link.
> +		 */
> +		max9286_write(priv, 0x01, MAX9286_FSYNCMODE_INT_HIZ |
> +			      MAX9286_FSYNCMETH_AUTO);
> +		return;
> +	}
> +
> +	/*
> +	 * Manual FRAMESYNC
> +	 *
> +	 * The FRAMESYNC generator is configured with a period expressed as a
> +	 * number of PCLK periods.
> +	 */
> +	fsync = div_u64((u64)priv->pixelrate * priv->interval.numerator,
> +			priv->interval.denominator);
> +
> +	dev_dbg(&priv->client->dev, "fsync period %u (pclk %u)\n", fsync,
> +		priv->pixelrate);
> +
> +	max9286_write(priv, 0x01, MAX9286_FSYNCMODE_INT_OUT |
> +		      MAX9286_FSYNCMETH_MANUAL);
> +
> +	max9286_write(priv, 0x06, (fsync >> 0) & 0xff);
> +	max9286_write(priv, 0x07, (fsync >> 8) & 0xff);
> +	max9286_write(priv, 0x08, (fsync >> 16) & 0xff);
> +}
> +
>  /* -----------------------------------------------------------------------------
>   * V4L2 Subdev
>   */
> @@ -511,11 +547,13 @@ static int max9286_set_pixelrate(struct max9286_priv *priv)
>  		return -EINVAL;
>  	}
>
> +	priv->pixelrate = pixelrate;
> +
>  	/*
>  	 * The CSI-2 transmitter pixel rate is the single source rate multiplied
>  	 * by the number of available sources.
>  	 */
> -	return v4l2_ctrl_s_ctrl_int64(priv->pixelrate,
> +	return v4l2_ctrl_s_ctrl_int64(priv->pixelrate_ctrl,
>  				      pixelrate * priv->nsources);
>  }
>
> @@ -655,6 +693,8 @@ static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
>  	int ret;
>
>  	if (enable) {
> +		max9286_set_fsync_period(priv);
> +
>  		/*
>  		 * The frame sync between cameras is transmitted across the
>  		 * reverse channel as GPIO. We must open all channels while
> @@ -714,6 +754,32 @@ static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
>  	return 0;
>  }
>
> +static int max9286_g_frame_interval(struct v4l2_subdev *sd,
> +				    struct v4l2_subdev_frame_interval *interval)
> +{
> +	struct max9286_priv *priv = sd_to_max9286(sd);
> +
> +	if (interval->pad != MAX9286_SRC_PAD)
> +		return -EINVAL;
> +
> +	interval->interval = priv->interval;
> +
> +	return 0;
> +}
> +
> +static int max9286_s_frame_interval(struct v4l2_subdev *sd,
> +				    struct v4l2_subdev_frame_interval *interval)
> +{
> +	struct max9286_priv *priv = sd_to_max9286(sd);
> +
> +	if (interval->pad != MAX9286_SRC_PAD)
> +		return -EINVAL;
> +
> +	priv->interval = interval->interval;
> +
> +	return 0;
> +}
> +
>  static int max9286_enum_mbus_code(struct v4l2_subdev *sd,
>  				  struct v4l2_subdev_state *sd_state,
>  				  struct v4l2_subdev_mbus_code_enum *code)
> @@ -805,6 +871,8 @@ static int max9286_get_fmt(struct v4l2_subdev *sd,
>
>  static const struct v4l2_subdev_video_ops max9286_video_ops = {
>  	.s_stream	= max9286_s_stream,
> +	.g_frame_interval = max9286_g_frame_interval,
> +	.s_frame_interval = max9286_s_frame_interval,
>  };
>
>  static const struct v4l2_subdev_pad_ops max9286_pad_ops = {
> @@ -885,10 +953,10 @@ static int max9286_v4l2_register(struct max9286_priv *priv)
>  	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
>
>  	v4l2_ctrl_handler_init(&priv->ctrls, 1);
> -	priv->pixelrate = v4l2_ctrl_new_std(&priv->ctrls,
> -					    &max9286_ctrl_ops,
> -					    V4L2_CID_PIXEL_RATE,
> -					    1, INT_MAX, 1, 50000000);
> +	priv->pixelrate_ctrl = v4l2_ctrl_new_std(&priv->ctrls,
> +						 &max9286_ctrl_ops,
> +						 V4L2_CID_PIXEL_RATE,
> +						 1, INT_MAX, 1, 50000000);
>
>  	priv->sd.ctrl_handler = &priv->ctrls;
>  	ret = priv->ctrls.error;
> @@ -997,9 +1065,7 @@ static int max9286_setup(struct max9286_priv *priv)
>  		      MAX9286_CSILANECNT(priv->csi2_data_lanes) |
>  		      MAX9286_DATATYPE_YUV422_8BIT);
>
> -	/* Automatic: FRAMESYNC taken from the slowest Link. */
> -	max9286_write(priv, 0x01, MAX9286_FSYNCMODE_INT_HIZ |
> -		      MAX9286_FSYNCMETH_AUTO);
> +	max9286_set_fsync_period(priv);
>
>  	/* Enable HS/VS encoding, use D14/15 for HS/VS, invert VS. */
>  	max9286_write(priv, 0x0c, MAX9286_HVEN | MAX9286_INVVS |
> --
> Regards,
>
> Laurent Pinchart
>
