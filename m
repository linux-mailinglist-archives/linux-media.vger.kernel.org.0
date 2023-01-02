Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5495865AE64
	for <lists+linux-media@lfdr.de>; Mon,  2 Jan 2023 09:52:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229843AbjABIwj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Jan 2023 03:52:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229582AbjABIwi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Jan 2023 03:52:38 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 359652662
        for <linux-media@vger.kernel.org>; Mon,  2 Jan 2023 00:52:36 -0800 (PST)
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6E5D75BA;
        Mon,  2 Jan 2023 09:52:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1672649553;
        bh=cXuz68GGDWItP8fgtKE7kW/9727qgwDFcIJY21BH5vE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SF8cRQ6tYjTPUjGObyWZi1H9TLgOTjG0Xt9B0rE5yWfdRH/bHBoCnX+/MLlgK1vVx
         AyjyopKWnlejI5VHKiFKIqX68VGgAcMB74k0Elyn5UajiLvK4269RxGGDQ5DnEaM8d
         LS/5KGA5ynwlh9y1R+Yhb2pitiEtxYQatUFVywvU=
Date:   Mon, 2 Jan 2023 09:52:30 +0100
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        slongerbeam@gmail.com, laurent.pinchart@ideasonboard.com,
        sakari.ailus@linux.intel.com
Subject: Re: [PATCH] media: ov5640: set correct default format for CSI-2 mode
Message-ID: <20230102085230.tl74u2hotpbfivmi@uno.localdomain>
References: <20221212040526.3549644-1-guoniu.zhou@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221212040526.3549644-1-guoniu.zhou@oss.nxp.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,
   sorry for the delay

On Mon, Dec 12, 2022 at 12:05:26PM +0800, G.N. Zhou (OSS) wrote:
> From: "Guoniu.zhou" <guoniu.zhou@nxp.com>
>
> In commit a89f14bbcfa5 ("media: ov5640: Split DVP and CSI-2 formats"),
> it splits format list for DVP and CSI-2 mode, but the default format
> defined in commit 90b0f355c5a3 ("media: ov5640: Implement init_cfg")
> is only supported by DVP mode, so define a new default format for
> CSI-2 mode.
>
> Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>

Thanks for fixing, this seems correct to me
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
   j

> ---
>  drivers/media/i2c/ov5640.c | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index e0f908af581b..2c37ed7b75d3 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -520,7 +520,18 @@ static u32 ov5640_code_to_bpp(struct ov5640_dev *sensor, u32 code)
>   */
>  /* YUV422 UYVY VGA@30fps */
>
> -static const struct v4l2_mbus_framefmt ov5640_default_fmt = {
> +static const struct v4l2_mbus_framefmt ov5640_csi2_default_fmt = {
> +	.code = MEDIA_BUS_FMT_UYVY8_1X16,
> +	.width = 640,
> +	.height = 480,
> +	.colorspace = V4L2_COLORSPACE_SRGB,
> +	.ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(V4L2_COLORSPACE_SRGB),
> +	.quantization = V4L2_QUANTIZATION_FULL_RANGE,
> +	.xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(V4L2_COLORSPACE_SRGB),
> +	.field = V4L2_FIELD_NONE,
> +};
> +
> +static const struct v4l2_mbus_framefmt ov5640_dvp_default_fmt = {
>  	.code = MEDIA_BUS_FMT_UYVY8_2X8,
>  	.width = 640,
>  	.height = 480,
> @@ -3719,11 +3730,13 @@ static int ov5640_s_stream(struct v4l2_subdev *sd, int enable)
>  static int ov5640_init_cfg(struct v4l2_subdev *sd,
>  			   struct v4l2_subdev_state *state)
>  {
> +	struct ov5640_dev *sensor = to_ov5640_dev(sd);
>  	struct v4l2_mbus_framefmt *fmt =
>  				v4l2_subdev_get_try_format(sd, state, 0);
>  	struct v4l2_rect *crop = v4l2_subdev_get_try_crop(sd, state, 0);
>
> -	*fmt = ov5640_default_fmt;
> +	*fmt = ov5640_is_csi2(sensor) ? ov5640_csi2_default_fmt :
> +					ov5640_dvp_default_fmt;
>
>  	crop->left = OV5640_PIXEL_ARRAY_LEFT;
>  	crop->top = OV5640_PIXEL_ARRAY_TOP;
> @@ -3812,7 +3825,6 @@ static int ov5640_probe(struct i2c_client *client)
>  	 * default init sequence initialize sensor to
>  	 * YUV422 UYVY VGA@30fps
>  	 */
> -	sensor->fmt = ov5640_default_fmt;
>  	sensor->frame_interval.numerator = 1;
>  	sensor->frame_interval.denominator = ov5640_framerates[OV5640_30_FPS];
>  	sensor->current_fr = OV5640_30_FPS;
> @@ -3845,6 +3857,9 @@ static int ov5640_probe(struct i2c_client *client)
>  		return -EINVAL;
>  	}
>
> +	sensor->fmt = ov5640_is_csi2(sensor) ? ov5640_csi2_default_fmt :
> +					       ov5640_dvp_default_fmt;
> +
>  	/* get system clock (xclk) */
>  	sensor->xclk = devm_clk_get(dev, "xclk");
>  	if (IS_ERR(sensor->xclk)) {
> --
> 2.37.1
>
