Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2F0F413566
	for <lists+linux-media@lfdr.de>; Tue, 21 Sep 2021 16:34:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233059AbhIUOfu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Sep 2021 10:35:50 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:37474 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbhIUOfs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Sep 2021 10:35:48 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DD8072BA;
        Tue, 21 Sep 2021 16:34:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1632234859;
        bh=ipcXOUNXYeLF6cJ1L/fM8zP9Oegt/DEE45TN+QShqh8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kvf4oL5yORORWNVxiD8xgujY86HCpO3mg6TuSgZpswUddec1T4ht4JxyV4OMYPf5h
         rqSbmQshd45DqRslw2JDwrr1Si+roHSDwoPOrJVMYgbpfzC5zwdnfxonsMgBbGsjtc
         xhLGa1HrSaTbiBhfZpR/BXOBaOYCT1SoMNk4C4Q4=
Date:   Tue, 21 Sep 2021 17:33:48 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>, tfiga@google.com,
        linux-media@vger.kernel.org, tian.shu.qiu@intel.com,
        bingbu.cao@intel.com
Subject: Re: [PATCH] media: staging: ipu3-imgu: Initialise height_per_slice
 in the stripes
Message-ID: <YUntTJQwZJ7U3m/E@pendragon.ideasonboard.com>
References: <20210916172504.677919-1-jeanmichel.hautbois@ideasonboard.com>
 <YUm82RNBbu9VbQj9@paasikivi.fi.intel.com>
 <19a2a09a-dcdd-fc32-0410-7f752cceffb5@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <19a2a09a-dcdd-fc32-0410-7f752cceffb5@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Sep 21, 2021 at 03:04:37PM +0200, Jean-Michel Hautbois wrote:
> Hi Sakari, and Tomasz as I have a remark/question for you :-)
> 
> On 21/09/2021 13:07, Sakari Ailus wrote:
> > Hi Jean-Michel --- and Bingbu and Tianshu,
> > 
> > On Thu, Sep 16, 2021 at 07:25:04PM +0200, Jean-Michel Hautbois wrote:
> >> While playing with low resolutions for the grid, it appeared that
> >> height_per_slice is not initialised if we are not using both stripes for
> >> the calculations. This pattern occurs three times:
> >> - for the awb_fr processing block
> >> - for the af processing block
> >> - for the awb processing block
> >>
> >> The idea of this small portion of code is to reduce complexity in
> >> loading the statistics, it could be done also when only one stripe is
> >> used. Fix it by getting this initialisation code outside of the else()
> >> test case.
> >>
> >> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
> >> ---
> >>  drivers/staging/media/ipu3/ipu3-css-params.c | 44 ++++++++++----------
> >>  1 file changed, 22 insertions(+), 22 deletions(-)
> >>
> >> diff --git a/drivers/staging/media/ipu3/ipu3-css-params.c b/drivers/staging/media/ipu3/ipu3-css-params.c
> >> index e9d6bd9e9332..05da7dbdca78 100644
> >> --- a/drivers/staging/media/ipu3/ipu3-css-params.c
> >> +++ b/drivers/staging/media/ipu3/ipu3-css-params.c
> >> @@ -2428,16 +2428,16 @@ int imgu_css_cfg_acc(struct imgu_css *css, unsigned int pipe,
> >>  					acc->awb_fr.stripes[1].grid_cfg.width,
> >>  					b_w_log2);
> >>  		acc->awb_fr.stripes[1].grid_cfg.x_end = end;
> >> -
> >> -		/*
> >> -		 * To reduce complexity of debubbling and loading
> >> -		 * statistics fix grid_height_per_slice to 1 for both
> >> -		 * stripes.
> >> -		 */
> >> -		for (i = 0; i < stripes; i++)
> >> -			acc->awb_fr.stripes[i].grid_cfg.height_per_slice = 1;
> >>  	}
> >>  
> >> +	/*
> >> +	 * To reduce complexity of debubbling and loading
> >> +	 * statistics fix grid_height_per_slice to 1 for both
> >> +	 * stripes.
> >> +	 */
> >> +	for (i = 0; i < stripes; i++)
> >> +		acc->awb_fr.stripes[i].grid_cfg.height_per_slice = 1;
> >> +
> >>  	if (imgu_css_awb_fr_ops_calc(css, pipe, &acc->awb_fr))
> >>  		return -EINVAL;
> >>  
> >> @@ -2591,15 +2591,15 @@ int imgu_css_cfg_acc(struct imgu_css *css, unsigned int pipe,
> >>  			imgu_css_grid_end(acc->af.stripes[1].grid_cfg.x_start,
> >>  					  acc->af.stripes[1].grid_cfg.width,
> >>  					  b_w_log2);
> >> -
> >> -		/*
> >> -		 * To reduce complexity of debubbling and loading statistics
> >> -		 * fix grid_height_per_slice to 1 for both stripes
> >> -		 */
> >> -		for (i = 0; i < stripes; i++)
> >> -			acc->af.stripes[i].grid_cfg.height_per_slice = 1;
> >>  	}
> >>  
> >> +	/*
> >> +	 * To reduce complexity of debubbling and loading statistics
> >> +	 * fix grid_height_per_slice to 1 for both stripes
> >> +	 */
> >> +	for (i = 0; i < stripes; i++)
> >> +		acc->af.stripes[i].grid_cfg.height_per_slice = 1;
> >> +
> >>  	if (imgu_css_af_ops_calc(css, pipe, &acc->af))
> >>  		return -EINVAL;
> >>  
> >> @@ -2660,15 +2660,15 @@ int imgu_css_cfg_acc(struct imgu_css *css, unsigned int pipe,
> >>  			imgu_css_grid_end(acc->awb.stripes[1].grid.x_start,
> >>  					  acc->awb.stripes[1].grid.width,
> >>  					  b_w_log2);
> >> -
> >> -		/*
> >> -		 * To reduce complexity of debubbling and loading statistics
> >> -		 * fix grid_height_per_slice to 1 for both stripes
> >> -		 */
> >> -		for (i = 0; i < stripes; i++)
> >> -			acc->awb.stripes[i].grid.height_per_slice = 1;
> >>  	}
> >>  
> >> +	/*
> >> +	 * To reduce complexity of debubbling and loading statistics
> >> +	 * fix grid_height_per_slice to 1 for both stripes
> >> +	 */
> >> +	for (i = 0; i < stripes; i++)
> >> +		acc->awb.stripes[i].grid.height_per_slice = 1;
> >> +
> >>  	if (imgu_css_awb_ops_calc(css, pipe, &acc->awb))
> >>  		return -EINVAL;
> >>  
> > 
> > While it seems like a sensible idea to initialise arguments to firmware, does this have an
> > effect on the statistics format? If so, can the existing user space cope
> > with that?
> 
> To try and figure that out, we have tested several grid configurations
> and inspected the captured statistics. We have converted the statistics
> in an image, rendering each cell as a pixel whose red, green and blue
> components are the cell's red, green and blue averages. This turned out
> to be a very effectice tool to quickly visualize AWB statistics.
> We have made a lot of tests with different output resolutions, from a
> small one up to the full-scale one.
> 
> Here is one example of a statistics output with a ViewFinder configured
> as 1920x1280, with a BDS output configuration set to 2304x1536 (sensor
> is 2592x1944).
> 
> Without the patch, configuring a 79x45 grid of 16x16 cells we obtain the
> image: https://pasteboard.co/g4nC4fHjbVER.png.
> We can notice a weird padding every two lines and it seems to be missing
> half of the frame.
> 
> With the patch applied, the same configuration gives us the image:
> https://pasteboard.co/rzap6axIvVdu.png
> 
> We can clearly see the one padding pixel on the right, and the frame is
> all there, as expected.
> 
> Tomasz: We're concerned that this patch may have an impact on the
> ChromeOS Intel Camera HAL with the IPU3. Is it possible for someone to
> review and test this please?

As shown by the images above, this is a real fix. It only affects grid
configurations that use a single stripe (left or right), so either
"small" resolutions (less than 1280 pixels at the BDS output if I recall
correctly), or grid configurations that span the left part of the image
with higher resolutions. The latter is probably unlikely. For the
former, it may affect the binary library, especially if it includes a
workaround for the bug.

Still, this change is good I believe, so it should be upstreamed.

-- 
Regards,

Laurent Pinchart
