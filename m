Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E42D1FCA7A
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2020 12:06:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726491AbgFQKGP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Jun 2020 06:06:15 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48176 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725536AbgFQKGO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Jun 2020 06:06:14 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2C635F9;
        Wed, 17 Jun 2020 12:06:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592388371;
        bh=uE44aXeRdbJXAMVFx595SenMvHRSAIL7JgoDNrO7Dug=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hsdwQfyCU2iOIZCDQR8MUOQiQF7KnbTIczy7rHNw04r/wWlndKHHyaZ9qksicw3/j
         HU6RBxTUP1UbG62WaRM2rhaeLApAtfJbyyBaH9bqc0qRk4QxDtbTZxtFEG8GyJh9f1
         ilpTEV+wDNDaKhXD3+acGJs8gGRxy/7mrDMp0fnc=
Date:   Wed, 17 Jun 2020 13:05:48 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: Re: [PATCH v1 078/107] media: ti-vpe: cal: Don't store external rate
 in cal_camerarx
Message-ID: <20200617100548.GB5838@pendragon.ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
 <20200614235944.17716-79-laurent.pinchart@ideasonboard.com>
 <50074fee-06aa-8511-2134-3ff51a66eda0@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <50074fee-06aa-8511-2134-3ff51a66eda0@ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran,

On Wed, Jun 17, 2020 at 10:56:29AM +0100, Kieran Bingham wrote:
> On 15/06/2020 00:59, Laurent Pinchart wrote:
> > The external pixel rate is retrieved when starting the camerarx and only
> > used then. There's no need to store it in the cal_camerarx structure, it
> > can be returned by cal_camerarx_get_external_info() and explicitly
> > passed to cal_camerarx_config().
> > 
> > While at it, rename cal_camerarx_get_external_info() to
> > cal_camerarx_get_external_rate() to better reflect the function's
> > purpose.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/media/platform/ti-vpe/cal.c | 24 ++++++++++++------------
> >  1 file changed, 12 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> > index 8326db0e4197..a11457909134 100644
> > --- a/drivers/media/platform/ti-vpe/cal.c
> > +++ b/drivers/media/platform/ti-vpe/cal.c
> > @@ -272,7 +272,6 @@ struct cal_camerarx {
> >  	struct v4l2_fwnode_endpoint	endpoint;
> >  	struct device_node	*sensor_node;
> >  	struct v4l2_subdev	*sensor;
> > -	unsigned int		external_rate;
> 
> Here, external_rate is 32 bit,
> 
> >  };
> >  
> >  struct cal_dev {
> > @@ -481,9 +480,10 @@ static void cal_quickdump_regs(struct cal_dev *cal)
> >   * ------------------------------------------------------------------
> >   */
> >  
> > -static int cal_camerarx_get_external_info(struct cal_camerarx *phy)
> > +static s64 cal_camerarx_get_external_rate(struct cal_camerarx *phy)
> >  {
> >  	struct v4l2_ctrl *ctrl;
> > +	s64 rate;
> 
> and now it becomes a 64 bit value.
> 
> >  
> >  	if (!phy->sensor)
> >  		return -ENODEV;
> > @@ -495,10 +495,10 @@ static int cal_camerarx_get_external_info(struct cal_camerarx *phy)
> >  		return -EPIPE;
> >  	}
> >  
> > -	phy->external_rate = v4l2_ctrl_g_ctrl_int64(ctrl);
> > -	phy_dbg(3, phy, "sensor Pixel Rate: %u\n", phy->external_rate);
> > +	rate = v4l2_ctrl_g_ctrl_int64(ctrl);
> > +	phy_dbg(3, phy, "sensor Pixel Rate: %llu\n", rate);
> >  
> > -	return 0;
> > +	return rate;
> >  }
> >  
> >  static void cal_camerarx_lane_config(struct cal_camerarx *phy)
> > @@ -554,7 +554,7 @@ static void cal_camerarx_disable(struct cal_camerarx *phy)
> >  #define TCLK_MISS	1
> >  #define TCLK_SETTLE	14
> >  
> > -static void cal_camerarx_config(struct cal_camerarx *phy,
> > +static void cal_camerarx_config(struct cal_camerarx *phy, s64 external_rate,
> >  				const struct cal_fmt *fmt)
> >  {
> >  	unsigned int reg0, reg1;
> > @@ -566,7 +566,7 @@ static void cal_camerarx_config(struct cal_camerarx *phy,
> >  
> >  	/* DPHY timing configuration */
> >  	/* CSI-2 is DDR and we only count used lanes. */
> > -	csi2_ddrclk_khz = phy->external_rate / 1000
> > +	csi2_ddrclk_khz = external_rate / 1000
> >  		/ (2 * num_lanes) * fmt->bpp;
> 
> Which causes this calculation to fail on 32 bit ARM builds.
> (I'm building for the DRA76-EVM).

Oops :-/

> I've got the following fix up on the top of your tree to solve this, but
> I'm not particularly happy about having to break the calculation up (and
> re-use external_rate) though the use of do_div.
> 
> From ca6ce335a852e34364bc45cb4240f703e4ea4248 Mon Sep 17 00:00:00 2001
> From: Kieran Bingham <kieran.bingham@ideasonboard.com>
> Date: Tue, 16 Jun 2020 16:19:04 +0100
> Subject: [PATCH] media: ti-vpe: cal: Use do_div() for 64 bit operations
> 
> Support building the CAL driver on arm32 bit targets by updating the
> CSI2 clock calculation (which uses a signed 64 bit input value from
> the sensors pixel clock rate) to use the do_div() helpers.
> 
> The calculation is split into distinct parts to maintain
> order of operations while making use of the do_div macro and further
> re-ordered to convert to kHz at the end to maintain precision.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>  drivers/media/platform/ti-vpe/cal-camerarx.c | 22 +++++++++++++++++---
>  1 file changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c
> b/drivers/media/platform/ti-vpe/cal-camerarx.c
> index 014ca46509db..0ef19a516902 100644
> --- a/drivers/media/platform/ti-vpe/cal-camerarx.c
> +++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
> @@ -126,9 +126,25 @@ static void cal_camerarx_config(struct cal_camerarx
> *phy, s64 external_rate)
>         u32 num_lanes = mipi_csi2->num_data_lanes;
> 
>         /* DPHY timing configuration */
> -       /* CSI-2 is DDR and we only count used lanes. */
> -       csi2_ddrclk_khz = external_rate / 1000
> -               / (2 * num_lanes) * phy->fmtinfo->bpp;
> +
> +       /*
> +        * CSI-2 is DDR and we only count used lanes.
> +        *
> +        * csi2_ddrclk_khz = external_rate / 1000
> +        *                   / (2 * num_lanes) * phy->fmtinfo->bpp;
> +        *
> +        * The equation is broken into separate statements to maintain
> +        * order of operations, and conversion to kHz is done last to
> +        * keep precision.
> +        *
> +        * The 64 bit external_rate is modified during this equation and
> +        * contains the result, not the original after calculation.
> +        */
> +       do_div(external_rate, 2 * num_lanes);
> +       external_rate *= phy->fmtinfo->bpp;
> +       do_div(external_rate, 1000);
> +       csi2_ddrclk_khz = external_rate;

How about

	external_rate *= phy->fmtinfo->bpp;
 	do_div(external_rate, 2 * num_lanes * 1000);

> +
>         phy_dbg(1, phy, "csi2_ddrclk_khz: %d\n", csi2_ddrclk_khz);
> 
>         /* THS_TERM: Programmed value = floor(20 ns/DDRClk period) */
> -- 
> 2.25.1
> 
> 
> If you have a better way to correctly calculate the rate (also noting
> that I moved the /1000 to the end, I'm not sure if that's more correct,
> or makes it stop following what the hardware would do) - please update
> accordingly, or feel free to squash this patch in as you wish.
> 
> 
> With the calculation corrected:
> 
> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> 
> --
> Kieran
> 
> 
> >  	phy_dbg(1, phy, "csi2_ddrclk_khz: %d\n", csi2_ddrclk_khz);
> >  
> > @@ -667,13 +667,14 @@ static void cal_camerarx_wait_stop_state(struct cal_camerarx *phy)
> >  static int cal_camerarx_start(struct cal_camerarx *phy,
> >  			      const struct cal_fmt *fmt)
> >  {
> > +	s64 external_rate;
> >  	u32 sscounter;
> >  	u32 val;
> >  	int ret;
> >  
> > -	ret = cal_camerarx_get_external_info(phy);
> > -	if (ret < 0)
> > -		return ret;
> > +	external_rate = cal_camerarx_get_external_rate(phy);
> > +	if (external_rate < 0)
> > +		return external_rate;
> >  
> >  	ret = v4l2_subdev_call(phy->sensor, core, s_power, 1);
> >  	if (ret < 0 && ret != -ENOIOCTLCMD && ret != -ENODEV) {
> > @@ -719,7 +720,7 @@ static int cal_camerarx_start(struct cal_camerarx *phy,
> >  	reg_read(phy, CAL_CSI2_PHY_REG0);
> >  
> >  	/* Program the PHY timing parameters. */
> > -	cal_camerarx_config(phy, fmt);
> > +	cal_camerarx_config(phy, external_rate, fmt);
> >  
> >  	/*
> >  	 *    b. Assert the FORCERXMODE signal.
> > @@ -1034,7 +1035,6 @@ static struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
> >  
> >  	phy->cal = cal;
> >  	phy->instance = instance;
> > -	phy->external_rate = 192000000;
> >  
> >  	phy->res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> >  						(instance == 0) ?

-- 
Regards,

Laurent Pinchart
