Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FE474A5E31
	for <lists+linux-media@lfdr.de>; Tue,  1 Feb 2022 15:25:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239240AbiBAOZp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Feb 2022 09:25:45 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:36040 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239222AbiBAOZo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Feb 2022 09:25:44 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 09790332;
        Tue,  1 Feb 2022 15:25:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1643725543;
        bh=8+vCXJCUrXzkqDJvd8ITDcepkOEUoVQ5YeO7odhIlMI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MotEUBTbUmdlt/l5/Gw9h9JPAOhd9s6FGkGNbQn8IuN9bCu8SpjO5voh9Dk2iGAsz
         wPzK9VouSBOzGWibRfHJ79N5ENdC1r3nQVA+a4QFmOxcCIW1XyNxjpsWfGr3j8AoFl
         kQDiLTea8Vz1M+9TkJcB0g+OU9KI+zRJqzC8/JgI=
Date:   Tue, 1 Feb 2022 16:25:20 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, tomi.valkeinen@ideasonboard.com,
        hugues.fruchet@st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        aford173@gmail.com, festevam@gmail.com,
        Eugen.Hristev@microchip.com, jbrunet@baylibre.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 03/21] media: ov5640: Add is_mipi() function
Message-ID: <YflC0PwlJ4OQeR5a@pendragon.ideasonboard.com>
References: <20220131143245.128089-1-jacopo@jmondi.org>
 <20220131143245.128089-4-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220131143245.128089-4-jacopo@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

s/is_mipi/ov5640_is_mipi/

On Mon, Jan 31, 2022 at 03:32:27PM +0100, Jacopo Mondi wrote:
> Checking if the sensor is used in DVP or MIPI mode is a repeated
> pattern which is about to be repeated more often.
> 
> Provide an inline function to shortcut that.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/i2c/ov5640.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 7e7732f30486..fc3e4f61709c 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -310,6 +310,11 @@ static inline struct v4l2_subdev *ctrl_to_sd(struct v4l2_ctrl *ctrl)
>  			     ctrls.handler)->sd;
>  }
>  
> +static inline bool ov5640_is_mipi(struct ov5640_dev *sensor)

I'd name is ov5640_is_csi2() as MIPI is more than just CSI-2. Up to you.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +{
> +	return sensor->ep.bus_type == V4L2_MBUS_CSI2_DPHY;
> +}
> +
>  /*
>   * FIXME: all of these register tables are likely filled with
>   * entries that set the register to their power-on default values,
> @@ -1224,7 +1229,7 @@ static int ov5640_load_regs(struct ov5640_dev *sensor,
>  		/* remain in power down mode for DVP */
>  		if (regs->reg_addr == OV5640_REG_SYS_CTRL0 &&
>  		    val == OV5640_REG_SYS_CTRL0_SW_PWUP &&
> -		    sensor->ep.bus_type != V4L2_MBUS_CSI2_DPHY)
> +		    !ov5640_is_mipi(sensor))
>  			continue;
>  
>  		if (mask)
> @@ -1859,7 +1864,7 @@ static int ov5640_set_mode(struct ov5640_dev *sensor)
>  	 * the same rate than YUV, so we can just use 16 bpp all the time.
>  	 */
>  	rate = ov5640_calc_pixel_rate(sensor) * 16;
> -	if (sensor->ep.bus_type == V4L2_MBUS_CSI2_DPHY) {
> +	if (ov5640_is_mipi(sensor)) {
>  		rate = rate / sensor->ep.bus.mipi_csi2.num_data_lanes;
>  		ret = ov5640_set_mipi_pclk(sensor, rate);
>  	} else {
> @@ -3042,7 +3047,7 @@ static int ov5640_s_stream(struct v4l2_subdev *sd, int enable)
>  			sensor->pending_fmt_change = false;
>  		}
>  
> -		if (sensor->ep.bus_type == V4L2_MBUS_CSI2_DPHY)
> +		if (ov5640_is_mipi(sensor))
>  			ret = ov5640_set_stream_mipi(sensor, enable);
>  		else
>  			ret = ov5640_set_stream_dvp(sensor, enable);

-- 
Regards,

Laurent Pinchart
