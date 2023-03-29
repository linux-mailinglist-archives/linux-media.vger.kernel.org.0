Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 907EA6CEF7B
	for <lists+linux-media@lfdr.de>; Wed, 29 Mar 2023 18:32:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230101AbjC2QcO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Mar 2023 12:32:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229882AbjC2QcE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Mar 2023 12:32:04 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94FA77695
        for <linux-media@vger.kernel.org>; Wed, 29 Mar 2023 09:31:36 -0700 (PDT)
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 88C82AD0;
        Wed, 29 Mar 2023 18:31:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1680107476;
        bh=T2rs9BbBJO6opCdB8L2UA4i01rCYekC3DoxW6KoKQEo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WErKBtMhQokC+dZqwhae3qvHDlxp+dBfZU8gDN1i9KsC3DjOmA6aKK42J52MX7DoR
         maoX57rq2pD/RGOJVJ8nzxfomEfgLiZEtefxH+jT3Ueyy5c+r8fEBGkUsdLiVNeNhK
         Fs8xs1t3q9afXzNXkwkracfzufnYA34EWZkF2l6Y=
Date:   Wed, 29 Mar 2023 18:31:13 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, jacopo.mondi@ideasonboard.com
Subject: Re: [PATCH 2/2] media: ccs: Add V4L2 controls from properties
Message-ID: <20230329163113.uz7bcsmnhkerjtiv@uno.localdomain>
References: <20230328121625.1472037-1-sakari.ailus@linux.intel.com>
 <20230328121625.1472037-3-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230328121625.1472037-3-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari

On Tue, Mar 28, 2023 at 03:16:25PM +0300, Sakari Ailus wrote:
> Add V4L2 controls (currently CAMERA_SENSOR_ROTATION and
> CAMERA_SENSOR_ORIENTATION) from properties.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/ccs/ccs-core.c | 35 ++++++++++++--------------------
>  drivers/media/i2c/ccs/ccs.h      | 13 ------------
>  2 files changed, 13 insertions(+), 35 deletions(-)
>
> diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> index 431dd7d24cdc..b08938f42f61 100644
> --- a/drivers/media/i2c/ccs/ccs-core.c
> +++ b/drivers/media/i2c/ccs/ccs-core.c
> @@ -796,16 +796,24 @@ static const struct v4l2_ctrl_ops ccs_ctrl_ops = {
>  static int ccs_init_controls(struct ccs_sensor *sensor)
>  {
>  	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
> -	int default_flip sensor->hwcfg.module_board_orient ==
> -		CCS_MODULE_BOARD_ORIENT_180;
> +	struct v4l2_fwnode_device_properties props;
>  	int rval;
>
> -	rval = v4l2_ctrl_handler_init(&sensor->pixel_array->ctrl_handler, 17);
> +	rval = v4l2_ctrl_handler_init(&sensor->pixel_array->ctrl_handler, 19);
>  	if (rval)
>  		return rval;
>
>  	sensor->pixel_array->ctrl_handler.lock = &sensor->mutex;
>
> +	rval = v4l2_fwnode_device_parse(&client->dev, &props);
> +	if (rval)
> +		return rval;
> +
> +	rval = v4l2_ctrl_new_fwnode_properties(&sensor->pixel_array->ctrl_handler,
> +					       &ccs_ctrl_ops, &props);
> +	if (rval)
> +		return rval;
> +
>  	switch (CCS_LIM(sensor, ANALOG_GAIN_CAPABILITY)) {
>  	case CCS_ANALOG_GAIN_CAPABILITY_GLOBAL: {
>  		struct {
> @@ -946,10 +954,10 @@ static int ccs_init_controls(struct ccs_sensor *sensor)
>
>  	sensor->hflip = v4l2_ctrl_new_std(
>  		&sensor->pixel_array->ctrl_handler, &ccs_ctrl_ops,
> -		V4L2_CID_HFLIP, 0, 1, 1, default_flip);
> +		V4L2_CID_HFLIP, 0, 1, 1, props.rotation == 180);

Ah! ignore my comments on 1/2 :)

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

>  	sensor->vflip = v4l2_ctrl_new_std(
>  		&sensor->pixel_array->ctrl_handler, &ccs_ctrl_ops,
> -		V4L2_CID_VFLIP, 0, 1, 1, default_flip);
> +		V4L2_CID_VFLIP, 0, 1, 1, props.rotation == 180);
>
>  	sensor->vblank = v4l2_ctrl_new_std(
>  		&sensor->pixel_array->ctrl_handler, &ccs_ctrl_ops,
> @@ -3183,7 +3191,6 @@ static int ccs_get_hwconfig(struct ccs_sensor *sensor, struct device *dev)
>  	struct v4l2_fwnode_endpoint bus_cfg = { .bus_type = V4L2_MBUS_UNKNOWN };
>  	struct fwnode_handle *ep;
>  	struct fwnode_handle *fwnode = dev_fwnode(dev);
> -	u32 rotation;
>  	unsigned int i;
>  	int rval;
>
> @@ -3222,22 +3229,6 @@ static int ccs_get_hwconfig(struct ccs_sensor *sensor, struct device *dev)
>  		goto out_err;
>  	}
>
> -	rval = fwnode_property_read_u32(fwnode, "rotation", &rotation);
> -	if (!rval) {
> -		switch (rotation) {
> -		case 180:
> -			hwcfg->module_board_orient =
> -				CCS_MODULE_BOARD_ORIENT_180;
> -			fallthrough;
> -		case 0:
> -			break;
> -		default:
> -			dev_err(dev, "invalid rotation %u\n", rotation);
> -			rval = -EINVAL;
> -			goto out_err;
> -		}
> -	}
> -
>  	rval = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
>  					&hwcfg->ext_clk);
>  	if (rval)
> diff --git a/drivers/media/i2c/ccs/ccs.h b/drivers/media/i2c/ccs/ccs.h
> index ea8909f011d9..a94c796cea48 100644
> --- a/drivers/media/i2c/ccs/ccs.h
> +++ b/drivers/media/i2c/ccs/ccs.h
> @@ -57,17 +57,6 @@
>  #define CCS_LIM_AT(sensor, limit, offset)	\
>  	ccs_get_limit(sensor, CCS_L_##limit, CCS_L_##limit##_OFFSET(offset))
>
> -/*
> - * Sometimes due to board layout considerations the camera module can be
> - * mounted rotated. The typical rotation used is 180 degrees which can be
> - * corrected by giving a default H-FLIP and V-FLIP in the sensor readout.
> - * FIXME: rotation also changes the bayer pattern.
> - */
> -enum ccs_module_board_orient {
> -	CCS_MODULE_BOARD_ORIENT_0 = 0,
> -	CCS_MODULE_BOARD_ORIENT_180,
> -};
> -
>  struct ccs_flash_strobe_parms {
>  	u8 mode;
>  	u32 strobe_width_high_us;
> @@ -90,8 +79,6 @@ struct ccs_hwconfig {
>  	u32 csi_signalling_mode;	/* CCS_CSI_SIGNALLING_MODE_* */
>  	u64 *op_sys_clock;
>
> -	enum ccs_module_board_orient module_board_orient;
> -
>  	struct ccs_flash_strobe_parms *strobe_setup;
>  };
>
> --
> 2.30.2
>
