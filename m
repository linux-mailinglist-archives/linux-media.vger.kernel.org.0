Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A165415B42
	for <lists+linux-media@lfdr.de>; Thu, 23 Sep 2021 11:46:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240224AbhIWJrh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Sep 2021 05:47:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240212AbhIWJrg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Sep 2021 05:47:36 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66CDEC061574
        for <linux-media@vger.kernel.org>; Thu, 23 Sep 2021 02:46:05 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D1EC645E;
        Thu, 23 Sep 2021 11:46:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1632390362;
        bh=/CJWm00iSn8RcfqSPfHUx3InHMkqMdytgc3rmPmss7E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UNpVyLGxj505otHDvILaXcl3uDYrMSmyHneNoH7xoEc1SCd81TCBC9KCsTr1/F/S5
         CpscwCcjiD6o5YR/ikJleSC05KmBHkEgMyxIe4F4QjepXT3kP4m6eHO+WLw0Cfw/pX
         FVeCbQWl+9g1P6ah/hpQSa6UGU4j1Wteq+OTIfkE=
Date:   Thu, 23 Sep 2021 12:45:59 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     "Cao, Bingbu" <bingbu.cao@intel.com>
Cc:     Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "tfiga@google.com" <tfiga@google.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>
Subject: Re: [PATCH] media: staging: ipu3-imgu: Initialise height_per_slice
 in the stripes
Message-ID: <YUxM18uOp0eamBPH@pendragon.ideasonboard.com>
References: <20210916172504.677919-1-jeanmichel.hautbois@ideasonboard.com>
 <YUm82RNBbu9VbQj9@paasikivi.fi.intel.com>
 <19a2a09a-dcdd-fc32-0410-7f752cceffb5@ideasonboard.com>
 <YUntTJQwZJ7U3m/E@pendragon.ideasonboard.com>
 <DM8PR11MB5653D63F3F76CA1D9E80E01199A29@DM8PR11MB5653.namprd11.prod.outlook.com>
 <a8a0ee6f-e83c-7f99-6967-f017c549ff05@ideasonboard.com>
 <DM8PR11MB5653CFD59F01C2AB66508F8A99A39@DM8PR11MB5653.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DM8PR11MB5653CFD59F01C2AB66508F8A99A39@DM8PR11MB5653.namprd11.prod.outlook.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bingbu,

On Thu, Sep 23, 2021 at 09:06:32AM +0000, Cao, Bingbu wrote:
> Jean-Michel,
> 
> Firstly, the .height_per_slice could be 0 if your .grid.width larger than 32.

Which .height_per_slice are you talking about ? A field of that name
exists in both ipu3_uapi_acc_param.awb.config.grid and 
struct ipu3_uapi_grid_config and imgu_abi_awb_config.stripes.grid.

They are both computed by the driver, in imgu_css_cfg_acc(). The former
is set to

	acc->awb.config.grid.height_per_slice =
		IMGU_ABI_AWB_MAX_CELLS_PER_SET / acc->awb.config.grid.width,

IMGU_ABI_AWB_MAX_CELLS_PER_SET is equal to 160, so it can only be 0 if
grid.width > 160, which is invalid.

> From your configuration, looks like something wrong in the stripe configuration
> cause not entering the 2 stripes branch.

Why is that ? Isn't it valid for a grid configuration to use a single
stripe, if the image is small enough, or if the grid only covers the
left part of the image ?

> On Wednesday, September 22, 2021 1:54 PM, Jean-Michel Hautbois wrote:
> > On 22/09/2021 06:33, Cao, Bingbu wrote:
> > > Jean-Michel,
> > >
> > > Thanks for you patch.
> > > What is the value of .config.grid_cfg.width for your low resolutions?
> > 
> > I don't know if a 1920x1280 output is a low resolution, but the grid is
> > configured as:
> > - grid_cfg.width = 79
> > - grid_cfg.height = 24
> > - grid_cfg.block_width_log2 = 4
> > - grid_cfg.block_height_log2 = 6
> > 
> > Here is a full debug output of the AWB part in imgu_css_cfg_acc():
> > 
> > acc->stripe.down_scaled_stripes[0].width: 1280
> > acc->stripe.down_scaled_stripes[0].height: 1536
> > acc->stripe.down_scaled_stripes[0].offset: 0
> > acc->stripe.bds_out_stripes[0].width: 1280
> > acc->stripe.bds_out_stripes[0].height: 1536
> > acc->stripe.bds_out_stripes[0].offset: 0
> > acc->acc->awb.stripes[0].grid.width: 79
> > acc->awb.stripes[0].grid.block_width_log2: 4
> > acc->acc->awb.stripes[0].grid.height: 24
> > acc->awb.stripes[0].grid.block_height_log2: 6
> > acc->awb.stripes[0].grid.x_start: 0
> > acc->awb.stripes[0].grid.x_end: 1263
> > acc->awb.stripes[0].grid.y_start: 0
> > acc->awb.stripes[0].grid.y_end: 1535
> > acc->stripe.down_scaled_stripes[1].width: 1280
> > acc->stripe.down_scaled_stripes[1].height: 1536
> > acc->stripe.down_scaled_stripes[1].offset: 1024
> > acc->stripe.bds_out_stripes[1].width: 1280
> > acc->stripe.bds_out_stripes[1].height: 1536
> > acc->stripe.bds_out_stripes[1].offset: 1024
> > acc->acc->awb.stripes[1].grid.width: 79
> > acc->awb.stripes[1].grid.block_width_log2: 4
> > acc->acc->awb.stripes[1].grid.height: 24
> > acc->awb.stripes[1].grid.block_height_log2: 6
> > acc->awb.stripes[1].grid.x_start: 0
> > acc->awb.stripes[1].grid.x_end: 1263
> > acc->awb.stripes[1].grid.y_start: 0
> > acc->awb.stripes[1].grid.y_end: 1535
> > 
> > This has been outputted with: https://paste.debian.net/1212791/
> > 
> > The examples I gave before were 1280x720 output and not 1920x1080, here
> > are they:
> > - without the patch: https://pasteboard.co/hHo4QkVUSk8e.png
> > - with the patch: https://pasteboard.co/YUGUvS5tD0bo.png
> > 
> > As you can see we have the same behaviour.
> > 
> > > On Tuesday, September 21, 2021 10:34 PM, Laurent Pinchart wrote:
> > >> On Tue, Sep 21, 2021 at 03:04:37PM +0200, Jean-Michel Hautbois wrote:
> > >>> Hi Sakari, and Tomasz as I have a remark/question for you :-)
> > >>>
> > >>> On 21/09/2021 13:07, Sakari Ailus wrote:
> > >>>> Hi Jean-Michel --- and Bingbu and Tianshu,
> > >>>>
> > >>>> On Thu, Sep 16, 2021 at 07:25:04PM +0200, Jean-Michel Hautbois wrote:
> > >>>>> While playing with low resolutions for the grid, it appeared that
> > >>>>> height_per_slice is not initialised if we are not using both
> > >>>>> stripes for the calculations. This pattern occurs three times:
> > >>>>> - for the awb_fr processing block
> > >>>>> - for the af processing block
> > >>>>> - for the awb processing block
> > >>>>>
> > >>>>> The idea of this small portion of code is to reduce complexity in
> > >>>>> loading the statistics, it could be done also when only one stripe
> > >>>>> is used. Fix it by getting this initialisation code outside of the
> > >>>>> else() test case.
> > >>>>>
> > >>>>> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
> > >>>>> ---
> > >>>>>  drivers/staging/media/ipu3/ipu3-css-params.c | 44 ++++++++++----------
> > >>>>>  1 file changed, 22 insertions(+), 22 deletions(-)
> > >>>>>
> > >>>>> diff --git a/drivers/staging/media/ipu3/ipu3-css-params.c b/drivers/staging/media/ipu3/ipu3-css-params.c
> > >>>>> index e9d6bd9e9332..05da7dbdca78 100644
> > >>>>> --- a/drivers/staging/media/ipu3/ipu3-css-params.c
> > >>>>> +++ b/drivers/staging/media/ipu3/ipu3-css-params.c
> > >>>>> @@ -2428,16 +2428,16 @@ int imgu_css_cfg_acc(struct imgu_css *css, unsigned int pipe,
> > >>>>>  					acc->awb_fr.stripes[1].grid_cfg.width,
> > >>>>>  					b_w_log2);
> > >>>>>  		acc->awb_fr.stripes[1].grid_cfg.x_end = end;
> > >>>>> -
> > >>>>> -		/*
> > >>>>> -		 * To reduce complexity of debubbling and loading
> > >>>>> -		 * statistics fix grid_height_per_slice to 1 for both
> > >>>>> -		 * stripes.
> > >>>>> -		 */
> > >>>>> -		for (i = 0; i < stripes; i++)
> > >>>>> -			acc->awb_fr.stripes[i].grid_cfg.height_per_slice = 1;
> > >>>>>  	}
> > >>>>>
> > >>>>> +	/*
> > >>>>> +	 * To reduce complexity of debubbling and loading
> > >>>>> +	 * statistics fix grid_height_per_slice to 1 for both
> > >>>>> +	 * stripes.
> > >>>>> +	 */
> > >>>>> +	for (i = 0; i < stripes; i++)
> > >>>>> +		acc->awb_fr.stripes[i].grid_cfg.height_per_slice = 1;
> > >>>>> +
> > >>>>>  	if (imgu_css_awb_fr_ops_calc(css, pipe, &acc->awb_fr))
> > >>>>>  		return -EINVAL;
> > >>>>>
> > >>>>> @@ -2591,15 +2591,15 @@ int imgu_css_cfg_acc(struct imgu_css *css, unsigned int pipe,
> > >>>>>  			imgu_css_grid_end(acc->af.stripes[1].grid_cfg.x_start,
> > >>>>>  					  acc->af.stripes[1].grid_cfg.width,
> > >>>>>  					  b_w_log2);
> > >>>>> -
> > >>>>> -		/*
> > >>>>> -		 * To reduce complexity of debubbling and loading statistics
> > >>>>> -		 * fix grid_height_per_slice to 1 for both stripes
> > >>>>> -		 */
> > >>>>> -		for (i = 0; i < stripes; i++)
> > >>>>> -			acc->af.stripes[i].grid_cfg.height_per_slice = 1;
> > >>>>>  	}
> > >>>>>
> > >>>>> +	/*
> > >>>>> +	 * To reduce complexity of debubbling and loading statistics
> > >>>>> +	 * fix grid_height_per_slice to 1 for both stripes
> > >>>>> +	 */
> > >>>>> +	for (i = 0; i < stripes; i++)
> > >>>>> +		acc->af.stripes[i].grid_cfg.height_per_slice = 1;
> > >>>>> +
> > >>>>>  	if (imgu_css_af_ops_calc(css, pipe, &acc->af))
> > >>>>>  		return -EINVAL;
> > >>>>>
> > >>>>> @@ -2660,15 +2660,15 @@ int imgu_css_cfg_acc(struct imgu_css *css, unsigned int pipe,
> > >>>>>  			imgu_css_grid_end(acc->awb.stripes[1].grid.x_start,
> > >>>>>  					  acc->awb.stripes[1].grid.width,
> > >>>>>  					  b_w_log2);
> > >>>>> -
> > >>>>> -		/*
> > >>>>> -		 * To reduce complexity of debubbling and loading statistics
> > >>>>> -		 * fix grid_height_per_slice to 1 for both stripes
> > >>>>> -		 */
> > >>>>> -		for (i = 0; i < stripes; i++)
> > >>>>> -			acc->awb.stripes[i].grid.height_per_slice = 1;
> > >>>>>  	}
> > >>>>>
> > >>>>> +	/*
> > >>>>> +	 * To reduce complexity of debubbling and loading statistics
> > >>>>> +	 * fix grid_height_per_slice to 1 for both stripes
> > >>>>> +	 */
> > >>>>> +	for (i = 0; i < stripes; i++)
> > >>>>> +		acc->awb.stripes[i].grid.height_per_slice = 1;
> > >>>>> +
> > >>>>>  	if (imgu_css_awb_ops_calc(css, pipe, &acc->awb))
> > >>>>>  		return -EINVAL;
> > >>>>>
> > >>>>
> > >>>> While it seems like a sensible idea to initialise arguments to
> > >>>> firmware, does this have an effect on the statistics format? If so,
> > >>>> can the existing user space cope with that?
> > >>>
> > >>> To try and figure that out, we have tested several grid
> > >>> configurations and inspected the captured statistics. We have
> > >>> converted the statistics in an image, rendering each cell as a pixel
> > >>> whose red, green and blue components are the cell's red, green and blue averages.
> > >>> This turned out to be a very effectice tool to quickly visualize AWB
> > >> statistics.
> > >>> We have made a lot of tests with different output resolutions, from
> > >>> a small one up to the full-scale one.
> > >>>
> > >>> Here is one example of a statistics output with a ViewFinder
> > >>> configured as 1920x1280, with a BDS output configuration set to
> > >>> 2304x1536 (sensor is 2592x1944).
> > >>>
> > >>> Without the patch, configuring a 79x45 grid of 16x16 cells we obtain
> > >>> the
> > >>> image: https://pasteboard.co/g4nC4fHjbVER.png.
> > >>> We can notice a weird padding every two lines and it seems to be
> > >>> missing half of the frame.
> > >>>
> > >>> With the patch applied, the same configuration gives us the image:
> > >>> https://pasteboard.co/rzap6axIvVdu.png
> > >>>
> > >>> We can clearly see the one padding pixel on the right, and the frame
> > >>> is all there, as expected.
> > >>>
> > >>> Tomasz: We're concerned that this patch may have an impact on the
> > >>> ChromeOS Intel Camera HAL with the IPU3. Is it possible for someone
> > >>> to review and test this please?
> > >>
> > >> As shown by the images above, this is a real fix. It only affects
> > >> grid configurations that use a single stripe (left or right), so
> > >> either "small" resolutions (less than 1280 pixels at the BDS output
> > >> if I recall correctly), or grid configurations that span the left
> > >> part of the image with higher resolutions. The latter is probably
> > >> unlikely. For the former, it may affect the binary library,
> > >> especially if it includes a workaround for the bug.
> > >>
> > >> Still, this change is good I believe, so it should be upstreamed.

-- 
Regards,

Laurent Pinchart
