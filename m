Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F45D4A7A2D
	for <lists+linux-media@lfdr.de>; Wed,  2 Feb 2022 22:22:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347488AbiBBVVN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Feb 2022 16:21:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347337AbiBBVVH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Feb 2022 16:21:07 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CC7FC061714
        for <linux-media@vger.kernel.org>; Wed,  2 Feb 2022 13:21:07 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 483ADD88;
        Wed,  2 Feb 2022 22:21:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1643836865;
        bh=OooRAd9ZgKgkXFZ+eqm8dDDeDgF2ZaEUEkRT/TNMeoY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LJx7yYIQLdZtX0sW8Ela7R2PMYDgK/HsQGaHeSMT+lSLf1HipR/rZoHdUDqC1ycX4
         CE3EStonGc5Xrv27s1GrOo8IqYPO0aSl8Oh4F+rgpbme/VXTFMwlpyVvWd6WNhYcMm
         HuXTNW0hE+PLLs2uEyIGKQgGrcR+Taov4uRNwnVc=
Date:   Wed, 2 Feb 2022 23:20:42 +0200
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
Subject: Re: [PATCH 10/21] media: ov5640: Add HBLANK control
Message-ID: <Yfr1qhEXp2OBDo5V@pendragon.ideasonboard.com>
References: <20220131143245.128089-1-jacopo@jmondi.org>
 <20220131143245.128089-11-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220131143245.128089-11-jacopo@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Mon, Jan 31, 2022 at 03:32:34PM +0100, Jacopo Mondi wrote:
> Add the HBLANK control as read-only.
> 
> The hblank value is fixed in the mode definition and is updated
> everytime a new format is applied.

s/everytime/every time/

> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/i2c/ov5640.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 1e2f37c93f0d..b2961e8e07c3 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -266,6 +266,7 @@ struct ov5640_ctrls {
>  	struct v4l2_ctrl_handler handler;
>  	struct v4l2_ctrl *pixel_rate;
>  	struct v4l2_ctrl *link_freq;
> +	struct v4l2_ctrl *hblank;
>  	struct {
>  		struct v4l2_ctrl *auto_exp;
>  		struct v4l2_ctrl *exposure;
> @@ -2530,6 +2531,7 @@ static int ov5640_update_pixel_rate(struct ov5640_dev *sensor)
>  	struct v4l2_mbus_framefmt *fmt = &sensor->fmt;
>  	enum ov5640_pixel_rate_id pixel_rate_id = mode->pixel_rate;
>  	u32 num_lanes = sensor->ep.bus.mipi_csi2.num_data_lanes;
> +	unsigned int hblank;
>  	unsigned int i = 0;
>  	u32 pixel_rate;
>  	s64 link_freq;
> @@ -2580,6 +2582,10 @@ static int ov5640_update_pixel_rate(struct ov5640_dev *sensor)
>  	__v4l2_ctrl_s_ctrl_int64(sensor->ctrls.pixel_rate, pixel_rate);
>  	__v4l2_ctrl_s_ctrl(sensor->ctrls.link_freq, i);
>  
> +	hblank = mode->ppl - mode->crop.width;
> +	__v4l2_ctrl_modify_range(sensor->ctrls.hblank,
> +				 hblank, hblank, 1, hblank);
> +
>  	return 0;
>  }
>  
> @@ -3044,6 +3050,7 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
>  	const struct v4l2_ctrl_ops *ops = &ov5640_ctrl_ops;
>  	struct ov5640_ctrls *ctrls = &sensor->ctrls;
>  	struct v4l2_ctrl_handler *hdl = &ctrls->handler;
> +	unsigned int hblank;
>  	int ret;
>  
>  	v4l2_ctrl_handler_init(hdl, 32);
> @@ -3062,6 +3069,10 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
>  					ARRAY_SIZE(ov5640_csi2_link_freqs) - 1,
>  					4, ov5640_csi2_link_freqs);
>  
> +	hblank = mode->ppl - mode->crop.width;
> +	ctrls->hblank = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HBLANK, hblank,
> +					  hblank, 1, hblank);

I was going to say that you should increase the number of controls
passed to v4l2_ctrl_handler_init(), but it's already 32, higher than the
actual number of controls. Maybe you could reduce it to the right number
on top of this series ?

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
>  	/* Auto/manual white balance */
>  	ctrls->auto_wb = v4l2_ctrl_new_std(hdl, ops,
>  					   V4L2_CID_AUTO_WHITE_BALANCE,
> @@ -3111,6 +3122,7 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
>  
>  	ctrls->pixel_rate->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>  	ctrls->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +	ctrls->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>  	ctrls->gain->flags |= V4L2_CTRL_FLAG_VOLATILE;
>  	ctrls->exposure->flags |= V4L2_CTRL_FLAG_VOLATILE;
>  

-- 
Regards,

Laurent Pinchart
