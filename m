Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EDA51D7CBC
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2020 17:22:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728266AbgERPW2 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 18 May 2020 11:22:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727903AbgERPW2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 May 2020 11:22:28 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CF2DC061A0C
        for <linux-media@vger.kernel.org>; Mon, 18 May 2020 08:22:28 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1jahb0-0006US-Jh; Mon, 18 May 2020 17:22:26 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1jahay-0008Ns-S3; Mon, 18 May 2020 17:22:24 +0200
Message-ID: <0161d77ea86b736f3cb2ca1cdc224b16760bce16.camel@pengutronix.de>
Subject: Re: [PATCH 1/2] media: imx-pxp: Fix routing configuration for i.MX7
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-imx@nxp.com,
        kernel@pengutronix.de
Date:   Mon, 18 May 2020 17:22:24 +0200
In-Reply-To: <20200518135410.GC5851@pendragon.ideasonboard.com>
References: <20200510223100.11641-1-laurent.pinchart@ideasonboard.com>
         <20200510223100.11641-2-laurent.pinchart@ideasonboard.com>
         <ac24f89ebe68ef2b40bf1d89cd69e566a380fd4a.camel@pengutronix.de>
         <20200518135410.GC5851@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Mon, 2020-05-18 at 16:54 +0300, Laurent Pinchart wrote:
[...] 
> > > +	/*
> > > +	 * Configure routing, disabling all paths that are not used by
> > > +	 * selecting the "no output" (3) option. The datasheet doesn't
> > > +	 * explicitly require this, but the PXP has been seen to hand after
> > > +	 * processing a few hundreds of frames otherwise.
> > > +	 */
> > >  	pxp_write(dev, HW_PXP_DATA_PATH_CTRL0,
> > 
> > Which commit should this patch be applied on? I have a writel() here.
> 
> My bad, I have a commit in my tree that wraps writel() and readl() into
> inline accessors, as it made it easier during debugging to add printk()
> calls there to log all register accesses. Would you accept that ? If so
> I'll include it in v2.

Sure, go ahead.

> > > -		  BF_PXP_DATA_PATH_CTRL0_MUX15_SEL(0)|
> > > -		  BF_PXP_DATA_PATH_CTRL0_MUX14_SEL(1)|
> > > -		  BF_PXP_DATA_PATH_CTRL0_MUX13_SEL(0)|
> > > -		  BF_PXP_DATA_PATH_CTRL0_MUX12_SEL(0)|
> > > +		  BF_PXP_DATA_PATH_CTRL0_MUX15_SEL(3)|
> > > +		  BF_PXP_DATA_PATH_CTRL0_MUX14_SEL(0)|
> > > +		  BF_PXP_DATA_PATH_CTRL0_MUX13_SEL(3)|
> > > +		  BF_PXP_DATA_PATH_CTRL0_MUX12_SEL(1)|
> > >  		  BF_PXP_DATA_PATH_CTRL0_MUX11_SEL(0)|
> > > -		  BF_PXP_DATA_PATH_CTRL0_MUX10_SEL(0)|
> > > +		  BF_PXP_DATA_PATH_CTRL0_MUX10_SEL(3)|
> > >  		  BF_PXP_DATA_PATH_CTRL0_MUX9_SEL(1)|
> > >  		  BF_PXP_DATA_PATH_CTRL0_MUX8_SEL(0)|
> > > -		  BF_PXP_DATA_PATH_CTRL0_MUX7_SEL(0)|
> > > -		  BF_PXP_DATA_PATH_CTRL0_MUX6_SEL(0)|
> > > -		  BF_PXP_DATA_PATH_CTRL0_MUX5_SEL(0)|
> > > -		  BF_PXP_DATA_PATH_CTRL0_MUX4_SEL(0)|
> > > +		  BF_PXP_DATA_PATH_CTRL0_MUX7_SEL(3)|
> > > +		  BF_PXP_DATA_PATH_CTRL0_MUX6_SEL(1)|
> > > +		  BF_PXP_DATA_PATH_CTRL0_MUX5_SEL(3)|
> > > +		  BF_PXP_DATA_PATH_CTRL0_MUX4_SEL(3)|
> > >  		  BF_PXP_DATA_PATH_CTRL0_MUX3_SEL(0)|
> > > -		  BF_PXP_DATA_PATH_CTRL0_MUX2_SEL(0)|
> > > -		  BF_PXP_DATA_PATH_CTRL0_MUX1_SEL(0)|
> > > -		  BF_PXP_DATA_PATH_CTRL0_MUX0_SEL(0));
> > > +		  BF_PXP_DATA_PATH_CTRL0_MUX2_SEL(3)|
> > > +		  BF_PXP_DATA_PATH_CTRL0_MUX1_SEL(3)|
> > > +		  BF_PXP_DATA_PATH_CTRL0_MUX0_SEL(3));
> > >  	pxp_write(dev, HW_PXP_DATA_PATH_CTRL1,
> > > -		  BF_PXP_DATA_PATH_CTRL1_MUX17_SEL(1) |
> > > -		  BF_PXP_DATA_PATH_CTRL1_MUX16_SEL(1));
> > > +		  BF_PXP_DATA_PATH_CTRL1_MUX17_SEL(3) |
> > > +		  BF_PXP_DATA_PATH_CTRL1_MUX16_SEL(3));
> > 
> > I have tried this change on i.MX6ULL / v5.6, it does not work.
> > The PXP interrupt never triggers.
> 
> :-( Could you try the combination of 1/2 and 2/2 ?

With both patches applied, it still hangs.

Looking at the "PXP Architecture" Figures 41-1 in the i.MX6ULL Reference
Manual and 13-87 in the i.MX7D Reference Manual, there are quite a few
muxes dropped on i.MX6ULL, especially around the rotation engines, and
the routing is slightly different. Muxes 2, 4-7, 10, 13, and 15 are all
documented as "reserved, read-only, always 0".

We'll have to use different path control settings per compatible.

regards
Philipp
