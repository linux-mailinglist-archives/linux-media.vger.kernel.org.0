Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C85B21D7A78
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2020 15:54:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727937AbgERNyV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 May 2020 09:54:21 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35282 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726945AbgERNyV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 May 2020 09:54:21 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E7101258;
        Mon, 18 May 2020 15:54:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1589810059;
        bh=0i7+IiWAWovy/9bH3+a7EghZuxM5qRY2P3I9gZFSzJA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BaqRF3+Y1o6Yvx28J4udFVCWSWHKAeck/NJExPFXpNv0LuEB982BYGuo9RQfJKxtU
         eDsqzJS6+zZp5Z91Jkp8FBJ1ZyPG7aGHyk65AkeRgG7N6o+wpdRgoYCj/5YeoRuxuD
         y40TAwlroSmorOA/u1NLoIM4RfCWRlSnudTsYo+k=
Date:   Mon, 18 May 2020 16:54:10 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-media@vger.kernel.org, linux-imx@nxp.com,
        kernel@pengutronix.de
Subject: Re: [PATCH 1/2] media: imx-pxp: Fix routing configuration for i.MX7
Message-ID: <20200518135410.GC5851@pendragon.ideasonboard.com>
References: <20200510223100.11641-1-laurent.pinchart@ideasonboard.com>
 <20200510223100.11641-2-laurent.pinchart@ideasonboard.com>
 <ac24f89ebe68ef2b40bf1d89cd69e566a380fd4a.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ac24f89ebe68ef2b40bf1d89cd69e566a380fd4a.camel@pengutronix.de>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Philipp,

On Mon, May 18, 2020 at 03:33:09PM +0200, Philipp Zabel wrote:
> On Mon, 2020-05-11 at 01:30 +0300, Laurent Pinchart wrote:
> > The PXP hangs without producing any frame on the i.MX7. This is caused
> > by a mismatch between the routing configuration and the modules
> > configuration. Fix the routing configuration by
> > 
> > - Selecting Composite Alpha Blending/Color Key 0 (main path) as the
> >   input to CSC2 (MUX6).
> > - Connecting the Rotation 0 block in the pipeline by feeding it with
> >   data (MUX12) and selecting its output (MUX14).
> > - Disabling all other muxes () by selecting the "no output" option. The
> >   datasheet doesn't explicitly require this, but the PXP has been
> >   noticed to hang after several hundreds frames when testing routing
> >   with the LUT disabled and the LUT input mux (MUX9) set to MUX8. It's
> >   thus safer to explicitly disable all unused paths.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/media/platform/imx-pxp.c | 34 +++++++++++++++++++-------------
> >  1 file changed, 20 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/media/platform/imx-pxp.c b/drivers/media/platform/imx-pxp.c
> > index 74e16011fc09..53e3f8c8435f 100644
> > --- a/drivers/media/platform/imx-pxp.c
> > +++ b/drivers/media/platform/imx-pxp.c
> > @@ -911,26 +911,32 @@ static int pxp_start(struct pxp_ctx *ctx, struct vb2_v4l2_buffer *in_vb,
> >  	/* bypass LUT */
> >  	pxp_write(dev, HW_PXP_LUT_CTRL, BM_PXP_LUT_CTRL_BYPASS);
> >  
> > +	/*
> > +	 * Configure routing, disabling all paths that are not used by
> > +	 * selecting the "no output" (3) option. The datasheet doesn't
> > +	 * explicitly require this, but the PXP has been seen to hand after
> > +	 * processing a few hundreds of frames otherwise.
> > +	 */
> >  	pxp_write(dev, HW_PXP_DATA_PATH_CTRL0,
> 
> Which commit should this patch be applied on? I have a writel() here.

My bad, I have a commit in my tree that wraps writel() and readl() into
inline accessors, as it made it easier during debugging to add printk()
calls there to log all register accesses. Would you accept that ? If so
I'll include it in v2.

> > -		  BF_PXP_DATA_PATH_CTRL0_MUX15_SEL(0)|
> > -		  BF_PXP_DATA_PATH_CTRL0_MUX14_SEL(1)|
> > -		  BF_PXP_DATA_PATH_CTRL0_MUX13_SEL(0)|
> > -		  BF_PXP_DATA_PATH_CTRL0_MUX12_SEL(0)|
> > +		  BF_PXP_DATA_PATH_CTRL0_MUX15_SEL(3)|
> > +		  BF_PXP_DATA_PATH_CTRL0_MUX14_SEL(0)|
> > +		  BF_PXP_DATA_PATH_CTRL0_MUX13_SEL(3)|
> > +		  BF_PXP_DATA_PATH_CTRL0_MUX12_SEL(1)|
> >  		  BF_PXP_DATA_PATH_CTRL0_MUX11_SEL(0)|
> > -		  BF_PXP_DATA_PATH_CTRL0_MUX10_SEL(0)|
> > +		  BF_PXP_DATA_PATH_CTRL0_MUX10_SEL(3)|
> >  		  BF_PXP_DATA_PATH_CTRL0_MUX9_SEL(1)|
> >  		  BF_PXP_DATA_PATH_CTRL0_MUX8_SEL(0)|
> > -		  BF_PXP_DATA_PATH_CTRL0_MUX7_SEL(0)|
> > -		  BF_PXP_DATA_PATH_CTRL0_MUX6_SEL(0)|
> > -		  BF_PXP_DATA_PATH_CTRL0_MUX5_SEL(0)|
> > -		  BF_PXP_DATA_PATH_CTRL0_MUX4_SEL(0)|
> > +		  BF_PXP_DATA_PATH_CTRL0_MUX7_SEL(3)|
> > +		  BF_PXP_DATA_PATH_CTRL0_MUX6_SEL(1)|
> > +		  BF_PXP_DATA_PATH_CTRL0_MUX5_SEL(3)|
> > +		  BF_PXP_DATA_PATH_CTRL0_MUX4_SEL(3)|
> >  		  BF_PXP_DATA_PATH_CTRL0_MUX3_SEL(0)|
> > -		  BF_PXP_DATA_PATH_CTRL0_MUX2_SEL(0)|
> > -		  BF_PXP_DATA_PATH_CTRL0_MUX1_SEL(0)|
> > -		  BF_PXP_DATA_PATH_CTRL0_MUX0_SEL(0));
> > +		  BF_PXP_DATA_PATH_CTRL0_MUX2_SEL(3)|
> > +		  BF_PXP_DATA_PATH_CTRL0_MUX1_SEL(3)|
> > +		  BF_PXP_DATA_PATH_CTRL0_MUX0_SEL(3));
> >  	pxp_write(dev, HW_PXP_DATA_PATH_CTRL1,
> > -		  BF_PXP_DATA_PATH_CTRL1_MUX17_SEL(1) |
> > -		  BF_PXP_DATA_PATH_CTRL1_MUX16_SEL(1));
> > +		  BF_PXP_DATA_PATH_CTRL1_MUX17_SEL(3) |
> > +		  BF_PXP_DATA_PATH_CTRL1_MUX16_SEL(3));
> 
> I have tried this change on i.MX6ULL / v5.6, it does not work.
> The PXP interrupt never triggers.

:-( Could you try the combination of 1/2 and 2/2 ?

-- 
Regards,

Laurent Pinchart
