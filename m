Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93295487663
	for <lists+linux-media@lfdr.de>; Fri,  7 Jan 2022 12:21:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347018AbiAGLVW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jan 2022 06:21:22 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:34860 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237534AbiAGLVV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Jan 2022 06:21:21 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2744D8D7;
        Fri,  7 Jan 2022 12:21:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1641554479;
        bh=bVpJR1wF3s5NtA+h5U2QF6/aihbJ++2CjlgWwOZfgIY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rsQm9dxmnHzbqoi0LxQW/0X4U0EOlJMKIASOMQl/zxNmIVWVCrPL9w16DLso37w86
         g/KUvZ+PJEZvSs0Qa5sUnp/xbX/05dSngspuehALvQlx/ORQXVslwQmz8xwMmdUqEh
         gRyvI9IgF2g3UDBVN4esH7Zwi4344h7zjHcZPBA0=
Date:   Fri, 7 Jan 2022 13:21:11 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Rui Miguel Silva <rmfrfs@gmail.com>
Cc:     linux-media@vger.kernel.org,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        =?utf-8?B?SsOpcsO0bWU=?= Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH v1 2/3] staging: media: imx: imx7_mipi_csis: Add timings
 override through debugfs
Message-ID: <YdgiJwNMNPUXfxfh@pendragon.ideasonboard.com>
References: <20220106172441.7399-1-laurent.pinchart@ideasonboard.com>
 <20220106172441.7399-3-laurent.pinchart@ideasonboard.com>
 <CGZDCQ28LN5P.1C0GI87K2SRRI@arch-thunder>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CGZDCQ28LN5P.1C0GI87K2SRRI@arch-thunder>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rui,

On Fri, Jan 07, 2022 at 10:27:31AM +0000, Rui Miguel Silva wrote:
> Hi Laurent,
> thanks for the patch.
> 
> On Thu Jan 6, 2022 at 5:24 PM WET, Laurent Pinchart wrote:
> 
> > Add two debugfs files, ths_settle and tclk_settle, to allow overriding
> > the corresponding timing parameters for test purpose.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/staging/media/imx/imx7-mipi-csis.c | 35 ++++++++++++++++++----
> >  1 file changed, 29 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
> > index c9c0089ad816..d7bcfb1a0c52 100644
> > --- a/drivers/staging/media/imx/imx7-mipi-csis.c
> > +++ b/drivers/staging/media/imx/imx7-mipi-csis.c
> > @@ -333,7 +333,11 @@ struct csi_state {
> >  	spinlock_t slock;	/* Protect events */
> >  	struct mipi_csis_event events[MIPI_CSIS_NUM_EVENTS];
> >  	struct dentry *debugfs_root;
> > -	bool debug;
> > +	struct {
> > +		bool debug;
> 
> I think here would make more sense to call it "enable", I think
> state->debug.enable is more readable than state->debug.debug.

Good idea, I'll do that.

> Other than this LGTM
> 
> Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
> 
> > +		u32 hs_settle;
> > +		u32 clk_settle;
> > +	} debug;
> >  };
> >  
> >  /* -----------------------------------------------------------------------------
> > @@ -543,6 +547,18 @@ static int mipi_csis_calculate_params(struct csi_state *state)
> >  	dev_dbg(state->dev, "lane rate %u, Tclk_settle %u, Ths_settle %u\n",
> >  		lane_rate, state->clk_settle, state->hs_settle);
> >  
> > +	if (state->debug.hs_settle < 0xff) {
> > +		dev_dbg(state->dev, "overriding Ths_settle with %u\n",
> > +			state->debug.hs_settle);
> > +		state->hs_settle = state->debug.hs_settle;
> > +	}
> > +
> > +	if (state->debug.clk_settle < 4) {
> > +		dev_dbg(state->dev, "overriding Tclk_settle with %u\n",
> > +			state->debug.clk_settle);
> > +		state->clk_settle = state->debug.clk_settle;
> > +	}
> > +
> >  	return 0;
> >  }
> >  
> > @@ -659,7 +675,7 @@ static irqreturn_t mipi_csis_irq_handler(int irq, void *dev_id)
> >  	spin_lock_irqsave(&state->slock, flags);
> >  
> >  	/* Update the event/error counters */
> > -	if ((status & MIPI_CSIS_INT_SRC_ERRORS) || state->debug) {
> > +	if ((status & MIPI_CSIS_INT_SRC_ERRORS) || state->debug.debug) {
> >  		for (i = 0; i < MIPI_CSIS_NUM_EVENTS; i++) {
> >  			struct mipi_csis_event *event = &state->events[i];
> >  
> > @@ -749,7 +765,7 @@ static void mipi_csis_log_counters(struct csi_state *state, bool non_errors)
> >  	spin_lock_irqsave(&state->slock, flags);
> >  
> >  	for (i = 0; i < num_events; ++i) {
> > -		if (state->events[i].counter > 0 || state->debug)
> > +		if (state->events[i].counter > 0 || state->debug.debug)
> >  			dev_info(state->dev, "%s events: %d\n",
> >  				 state->events[i].name,
> >  				 state->events[i].counter);
> > @@ -801,12 +817,19 @@ DEFINE_SHOW_ATTRIBUTE(mipi_csis_dump_regs);
> >  
> >  static void mipi_csis_debugfs_init(struct csi_state *state)
> >  {
> > +	state->debug.hs_settle = UINT_MAX;
> > +	state->debug.clk_settle = UINT_MAX;
> > +
> >  	state->debugfs_root = debugfs_create_dir(dev_name(state->dev), NULL);
> >  
> >  	debugfs_create_bool("debug_enable", 0600, state->debugfs_root,
> > -			    &state->debug);
> > +			    &state->debug.debug);
> >  	debugfs_create_file("dump_regs", 0600, state->debugfs_root, state,
> >  			    &mipi_csis_dump_regs_fops);
> > +	debugfs_create_u32("tclk_settle", 0600, state->debugfs_root,
> > +			   &state->debug.clk_settle);
> > +	debugfs_create_u32("ths_settle", 0600, state->debugfs_root,
> > +			   &state->debug.hs_settle);
> >  }
> >  
> >  static void mipi_csis_debugfs_exit(struct csi_state *state)
> > @@ -867,7 +890,7 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
> >  			ret = 0;
> >  		mipi_csis_stop_stream(state);
> >  		state->state &= ~ST_STREAMING;
> > -		if (state->debug)
> > +		if (state->debug.debug)
> >  			mipi_csis_log_counters(state, true);
> >  	}
> >  
> > @@ -1064,7 +1087,7 @@ static int mipi_csis_log_status(struct v4l2_subdev *sd)
> >  
> >  	mutex_lock(&state->lock);
> >  	mipi_csis_log_counters(state, true);
> > -	if (state->debug && (state->state & ST_POWERED))
> > +	if (state->debug.debug && (state->state & ST_POWERED))
> >  		mipi_csis_dump_regs(state);
> >  	mutex_unlock(&state->lock);
> >  

-- 
Regards,

Laurent Pinchart
