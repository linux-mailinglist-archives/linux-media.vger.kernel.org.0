Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57FE34A7B3D
	for <lists+linux-media@lfdr.de>; Wed,  2 Feb 2022 23:44:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241637AbiBBWos (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Feb 2022 17:44:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239223AbiBBWoq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Feb 2022 17:44:46 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CEC4C061714
        for <linux-media@vger.kernel.org>; Wed,  2 Feb 2022 14:44:46 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A474AD88;
        Wed,  2 Feb 2022 23:44:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1643841884;
        bh=pilRJBgNjBg7egcEnh62qq9nLqCjXOGuuLyZ9MwQxtg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kmuzHD41dQAUYaXRGvTkNCvaZIJYAyVkTLG8oM2O07mqnivwNoZy+WVUuvs1yTv3t
         bsb1YQJ4iiKDWsNe5O6N9iRvl6OK5KCB3jZnbgmfJK9P81Yk7xhhFS19okRoGsiJmd
         PjCP0jtIx31bsaVX/0fVCTz2mFCGXMWC/Tm+bRcI=
Date:   Thu, 3 Feb 2022 00:44:22 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     slongerbeam@gmail.com, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, tomi.valkeinen@ideasonboard.com,
        hugues.fruchet@st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        aford173@gmail.com, festevam@gmail.com,
        eugen.hristev@microchip.com, jbrunet@baylibre.com,
        mchehab@kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 17/21] media: ov5640: Register device properties
Message-ID: <YfsJRiR3Q86VLvxr@pendragon.ideasonboard.com>
References: <20220131143245.128089-1-jacopo@jmondi.org>
 <20220131144529.129096-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220131144529.129096-1-jacopo@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Mon, Jan 31, 2022 at 03:45:27PM +0100, Jacopo Mondi wrote:
> Parse the device properties and register the rotation and orientation
> V4L2 controls using v4l2_ctrl_new_fwnode_properties().
> 
> Remove the open-coded parsing of the rotation property and assume the
> DTS is correct is providing either <0> or <180> as possible rotations.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/ov5640.c | 29 ++++++++++++-----------------
>  1 file changed, 12 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 28da0ddd2a06..9d6eb3288b07 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -3164,6 +3164,7 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
>  	const struct v4l2_ctrl_ops *ops = &ov5640_ctrl_ops;
>  	struct ov5640_ctrls *ctrls = &sensor->ctrls;
>  	struct v4l2_ctrl_handler *hdl = &ctrls->handler;
> +	struct v4l2_fwnode_device_properties props;
>  	unsigned int max_vblank;
>  	unsigned int hblank;
>  	int ret;
> @@ -3240,6 +3241,17 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
>  		goto free_ctrls;
>  	}
>  
> +	ret = v4l2_fwnode_device_parse(&sensor->i2c_client->dev, &props);
> +	if (ret)
> +		goto free_ctrls;
> +
> +	if (props.rotation == 180)
> +		sensor->upside_down = true;
> +
> +	ret = v4l2_ctrl_new_fwnode_properties(hdl, ops, &props);
> +	if (ret)
> +		goto free_ctrls;
> +
>  	ctrls->pixel_rate->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>  	ctrls->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>  	ctrls->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> @@ -3512,7 +3524,6 @@ static int ov5640_probe(struct i2c_client *client)
>  	struct device *dev = &client->dev;
>  	struct fwnode_handle *endpoint;
>  	struct ov5640_dev *sensor;
> -	u32 rotation;
>  	int ret;
>  
>  	sensor = devm_kzalloc(dev, sizeof(*sensor), GFP_KERNEL);
> @@ -3535,22 +3546,6 @@ static int ov5640_probe(struct i2c_client *client)
>  
>  	sensor->ae_target = 52;
>  
> -	/* optional indication of physical rotation of sensor */
> -	ret = fwnode_property_read_u32(dev_fwnode(&client->dev), "rotation",
> -				       &rotation);
> -	if (!ret) {
> -		switch (rotation) {
> -		case 180:
> -			sensor->upside_down = true;
> -			fallthrough;
> -		case 0:
> -			break;
> -		default:
> -			dev_warn(dev, "%u degrees rotation is not supported, ignoring...\n",
> -				 rotation);
> -		}
> -	}
> -
>  	endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(&client->dev),
>  						  NULL);
>  	if (!endpoint) {

-- 
Regards,

Laurent Pinchart
