Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14FF677C618
	for <lists+linux-media@lfdr.de>; Tue, 15 Aug 2023 04:52:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233204AbjHOCvm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Aug 2023 22:51:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234358AbjHOCvZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Aug 2023 22:51:25 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21F3A114
        for <linux-media@vger.kernel.org>; Mon, 14 Aug 2023 19:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692067884; x=1723603884;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=VCU8vjvY9+DG8bH07X57r45Y5ddqno/qK/iEcZqO8jo=;
  b=lVp8dN0cH38kdIZWR9y7kE4XCFM0G31YH6c579jvwsi1qgGsPtG2AOr3
   fxZwyYR4QkNuT630tYZCv8eLWDQaQu3AoeoWbqT4hY7rsprpTpR7pj/GQ
   4RM0/G/RTDGecKOBLvW/W2unimIbS8aFoSBAZw8m/Q6MaILpCLAQgh4YR
   DvHnpRsQXe5FJPKF1FlWhDvAIFputFAaQFss08MGXAPxsWvHWAfLrFY1A
   IR4y+OToHYQp6g/Gbce3C3pD7gv0Y8C44M16gfoq+UDisEgBbq5kVRjp/
   ms/CEmC3HeDUqXW0Sc0oriC+xBfYBuRrM7pw9CSKrZWLL5GSjMVO6vdOE
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="458545804"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="458545804"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 19:51:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="763133449"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="763133449"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.139]) ([10.238.232.139])
  by orsmga008.jf.intel.com with ESMTP; 14 Aug 2023 19:51:20 -0700
Subject: Re: [PATCH] media: staging: ipu3-imgu: Initialise height_per_slice in
 the stripes
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
        "Cao, Bingbu" <bingbu.cao@intel.com>,
        Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
        "tfiga@google.com" <tfiga@google.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>
References: <DM8PR11MB5653D63F3F76CA1D9E80E01199A29@DM8PR11MB5653.namprd11.prod.outlook.com>
 <a8a0ee6f-e83c-7f99-6967-f017c549ff05@ideasonboard.com>
 <DM8PR11MB5653CFD59F01C2AB66508F8A99A39@DM8PR11MB5653.namprd11.prod.outlook.com>
 <YUxM18uOp0eamBPH@pendragon.ideasonboard.com>
 <SJ0PR11MB5664666D6D4C573D2D4A406D99A39@SJ0PR11MB5664.namprd11.prod.outlook.com>
 <YUxbrFDvdI68Te8q@pendragon.ideasonboard.com>
 <502ca584-0dd8-018b-14b1-6cf4658d9668@gmail.com>
 <DM8PR11MB5653363BCFD75A7CE82B150899B59@DM8PR11MB5653.namprd11.prod.outlook.com>
 <6da57396-800f-52bf-f8ec-934138d97729@ideasonboard.com>
 <aa92edf7-1b51-fbc9-4029-2af016ce6260@linux.intel.com>
 <20230814132820.GA20984@pendragon.ideasonboard.com>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <7a10ff8a-76b8-61fb-393a-b1acfa60b497@linux.intel.com>
Date:   Tue, 15 Aug 2023 10:48:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20230814132820.GA20984@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Hi Laurent and Jean-Michel,

Thanks for your reply.

On 8/14/23 9:28 PM, Laurent Pinchart wrote:
> Hi Bingbu,
> 
> On Wed, Aug 09, 2023 at 12:11:40PM +0800, Bingbu Cao wrote:
>> Jean-Michel,
>>
>> I remember you resolved the problem about awb in libcamhal, so is this
>> patch still necessary or valid for Imgu? :)
> 
> If I recall correctly, we don't trigger this issue on Soraka with the
> latest libcamera version (I'd need to retest though), but I think the
> patch is nonetheless a good bug fix. The current code passes an
> uninitialized value to the firmware, which is wrong.

Yes for af.strips[], it needs. But I am wondering why the code didn't
initialize the value.

	acc->awb_fr.config.grid_cfg.height_per_slice =
		IMGU_ABI_AWB_FR_MAX_CELLS_PER_SET /
		acc->awb_fr.config.grid_cfg.width;

	for (i = 0; i < stripes; i++)
		acc->awb_fr.stripes[i] = acc->awb_fr.config;

...
	acc->awb.config.grid.height_per_slice =
		IMGU_ABI_AWB_MAX_CELLS_PER_SET / acc->awb.config.grid.width,
	imgu_css_grid_end_calc(&acc->awb.config.grid);

	for (i = 0; i < stripes; i++)
		acc->awb.stripes[i] = acc->awb.config;

I think we need add missing initialization for af. Which incorrect
configuration did you meet before?

> 
>> On 10/14/21 2:57 PM, Jean-Michel Hautbois wrote:
>>> On 11/10/2021 04:42, Cao, Bingbu wrote:
>>>> On Thursday, September 30, 2021 5:31 PM, Jean-Michel Hautbois wrote:
>>>>> On 23/09/2021 12:49, Laurent Pinchart wrote:
>>>>>> On Thu, Sep 23, 2021 at 10:29:33AM +0000, Cao, Bingbu wrote:
>>>>>>> On Thursday, September 23, 2021 5:46 PM, Laurent Pinchart wrote:
>>>>>>>> On Thu, Sep 23, 2021 at 09:06:32AM +0000, Cao, Bingbu wrote:
>>>>>>>>> Jean-Michel,
>>>>>>>>>
>>>>>>>>> Firstly, the .height_per_slice could be 0 if your .grid.width
>>>>>>>>> larger than 32.
>>>>>>>>
>>>>>>>> Which .height_per_slice are you talking about ? A field of that name
>>>>>>>> exists in both ipu3_uapi_acc_param.awb.config.grid and struct
>>>>>>>> ipu3_uapi_grid_config and imgu_abi_awb_config.stripes.grid.
>>>>>>>>
>>>>>>>> They are both computed by the driver, in imgu_css_cfg_acc(). The
>>>>>>>> former is set to
>>>>>>>>
>>>>>>>> 	acc->awb.config.grid.height_per_slice =
>>>>>>>> 		IMGU_ABI_AWB_MAX_CELLS_PER_SET / acc->awb.config.grid.width,
>>>>>>>>
>>>>>>>> IMGU_ABI_AWB_MAX_CELLS_PER_SET is equal to 160, so it can only be 0
>>>>>>>> if grid.width > 160, which is invalid.
>>>>>>>
>>>>>>> For awb_fr and af, it could be 0 if the .config.grid_cfg.width > 32.
>>>>>>
>>>>>> Indeed, my bad. I was focussing on the AWB statistics.
>>>>>>
>>>>>> What are the implications of a height_per_slice value of 0 ?
>>>>>>
>>>>>> While we are on this topic, what is a "slice" ? Does it matter for the
>>>>>> user, as in does it have an impact on the statistics values, or on how
>>>>>> they're arranged in memory, or is it an implementation detail of the
>>>>>> firmware that has no consequence on what can be seen by the user ?
>>>>>> (The "user" here is the code that reads the statistics in userspace).
>>>>>
>>>>> Gentle ping on these specific questions from Laurent :-) ?
>>>>
>>>> I am not an expert on this statistics algo.
>>>>
>>>> My understanding:
>>>> height_per_slice means number of blocks in vertical axis per Metadata slice.
>>>> ImgU divide grid-based Metadata into slices, each slice refers to 
>>>> grid_width * height_per_slice blocks, if height_per_slice is 0, that means
>>>> the grid_width is too large to use. IOW, it is an invalid parameter, we
>>>> need check this invalid value instead of just setting to 1.
>>>
>>> Is it true only for awb_fr and af, or also for awb ?
>>> If it is not for awb, the patch could be only for awb, as it really
>>> solves an issue ?
>>>
>>> Tomasz, do you think it may introduce a regression in the binary library
>>> ? Would it be possible to test it ? I can send a v2 with only awb if it
>>> is needed.
>>>
>>>>>>>>> From your configuration, looks like something wrong in the stripe
>>>>>>>>> configuration cause not entering the 2 stripes branch.
>>>>>>>>
>>>>>>>> Why is that ? Isn't it valid for a grid configuration to use a
>>>>>>>> single stripe, if the image is small enough, or if the grid only
>>>>>>>> covers the left part of the image ?
>>>>>>>>
>>>>>>>>> On Wednesday, September 22, 2021 1:54 PM, Jean-Michel Hautbois wrote:
>>>>>>>>>> On 22/09/2021 06:33, Cao, Bingbu wrote:
>>>>>>>>>>> Jean-Michel,
>>>>>>>>>>>
>>>>>>>>>>> Thanks for you patch.
>>>>>>>>>>> What is the value of .config.grid_cfg.width for your low resolutions?
>>>>>>>>>>
>>>>>>>>>> I don't know if a 1920x1280 output is a low resolution, but the
>>>>>>>>>> grid is configured as:
>>>>>>>>>> - grid_cfg.width = 79
>>>>>>>>>> - grid_cfg.height = 24
>>>>>>>>>> - grid_cfg.block_width_log2 = 4
>>>>>>>>>> - grid_cfg.block_height_log2 = 6
>>>>>>>>>>
>>>>>>>>>> Here is a full debug output of the AWB part in imgu_css_cfg_acc():
>>>>>>>>>>
>>>>>>>>>> acc->stripe.down_scaled_stripes[0].width: 1280
>>>>>>>>>> acc->stripe.down_scaled_stripes[0].height: 1536
>>>>>>>>>> acc->stripe.down_scaled_stripes[0].offset: 0
>>>>>>>>>> acc->stripe.bds_out_stripes[0].width: 1280
>>>>>>>>>> acc->stripe.bds_out_stripes[0].height: 1536
>>>>>>>>>> acc->stripe.bds_out_stripes[0].offset: 0
>>>>>>>>>> acc->acc->awb.stripes[0].grid.width: 79
>>>>>>>>>> acc->awb.stripes[0].grid.block_width_log2: 4
>>>>>>>>>> acc->acc->awb.stripes[0].grid.height: 24
>>>>>>>>>> acc->awb.stripes[0].grid.block_height_log2: 6
>>>>>>>>>> acc->awb.stripes[0].grid.x_start: 0
>>>>>>>>>> acc->awb.stripes[0].grid.x_end: 1263
>>>>>>>>>> acc->awb.stripes[0].grid.y_start: 0
>>>>>>>>>> acc->awb.stripes[0].grid.y_end: 1535
>>>>>>>>>> acc->stripe.down_scaled_stripes[1].width: 1280
>>>>>>>>>> acc->stripe.down_scaled_stripes[1].height: 1536
>>>>>>>>>> acc->stripe.down_scaled_stripes[1].offset: 1024
>>>>>>>>>> acc->stripe.bds_out_stripes[1].width: 1280
>>>>>>>>>> acc->stripe.bds_out_stripes[1].height: 1536
>>>>>>>>>> acc->stripe.bds_out_stripes[1].offset: 1024
>>>>>>>>>> acc->acc->awb.stripes[1].grid.width: 79
>>>>>>>>>> acc->awb.stripes[1].grid.block_width_log2: 4
>>>>>>>>>> acc->acc->awb.stripes[1].grid.height: 24
>>>>>>>>>> acc->awb.stripes[1].grid.block_height_log2: 6
>>>>>>>>>> acc->awb.stripes[1].grid.x_start: 0
>>>>>>>>>> acc->awb.stripes[1].grid.x_end: 1263
>>>>>>>>>> acc->awb.stripes[1].grid.y_start: 0
>>>>>>>>>> acc->awb.stripes[1].grid.y_end: 1535
>>>>>>>
>>>>>>> Are these dumps from 1920x1280 output?
>>>>>>
>>>>>> Jean-Michel, could you comment on this ?
>>>>>>
>>>>>> Note that the grid is configured with 79 cells of 16 pixels, covering
>>>>>> 1264 pixels horizontally. That's not the full image for a 1920 pixels
>>>>>> output, and will probably not be done in practice, but there's nothing
>>>>>> preventing the grid from covering part of the image only.
>>>>>>
>>>>>>>>>> This has been outputted with: https://paste.debian.net/1212791/
>>>>>>>>>>
>>>>>>>>>> The examples I gave before were 1280x720 output and not 1920x1080,
>>>>>>>>>> here are they:
>>>>>>>>>> - without the patch: https://pasteboard.co/hHo4QkVUSk8e.png
>>>>>>>>>> - with the patch: https://pasteboard.co/YUGUvS5tD0bo.png
>>>>>>>>>>
>>>>>>>>>> As you can see we have the same behaviour.
>>>>>>>>>>
>>>>>>>>>>> On Tuesday, September 21, 2021 10:34 PM, Laurent Pinchart wrote:
>>>>>>>>>>>> On Tue, Sep 21, 2021 at 03:04:37PM +0200, Jean-Michel Hautbois wrote:
>>>>>>>>>>>>> On 21/09/2021 13:07, Sakari Ailus wrote:
>>>>>>>>>>>>>> On Thu, Sep 16, 2021 at 07:25:04PM +0200, Jean-Michel Hautbois wrote:
>>>>>>>>>>>>>>> While playing with low resolutions for the grid, it appeared
>>>>>>>>>>>>>>> that height_per_slice is not initialised if we are not using
>>>>>>>>>>>>>>> both stripes for the calculations. This pattern occurs three times:
>>>>>>>>>>>>>>> - for the awb_fr processing block
>>>>>>>>>>>>>>> - for the af processing block
>>>>>>>>>>>>>>> - for the awb processing block
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> The idea of this small portion of code is to reduce
>>>>>>>>>>>>>>> complexity in loading the statistics, it could be done also
>>>>>>>>>>>>>>> when only one stripe is used. Fix it by getting this
>>>>>>>>>>>>>>> initialisation code outside of the
>>>>>>>>>>>>>>> else() test case.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
>>>>>>>>>>>>>>> ---
>>>>>>>>>>>>>>>  drivers/staging/media/ipu3/ipu3-css-params.c | 44 ++++++++++----------
>>>>>>>>>>>>>>>  1 file changed, 22 insertions(+), 22 deletions(-)
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> diff --git a/drivers/staging/media/ipu3/ipu3-css-params.c
>>>>>>>>>>>>>>> b/drivers/staging/media/ipu3/ipu3-css-params.c
>>>>>>>>>>>>>>> index e9d6bd9e9332..05da7dbdca78 100644
>>>>>>>>>>>>>>> --- a/drivers/staging/media/ipu3/ipu3-css-params.c
>>>>>>>>>>>>>>> +++ b/drivers/staging/media/ipu3/ipu3-css-params.c
>>>>>>>>>>>>>>> @@ -2428,16 +2428,16 @@ int imgu_css_cfg_acc(struct imgu_css *css, unsigned int pipe,
>>>>>>>>>>>>>>>  					acc->awb_fr.stripes[1].grid_cfg.width,
>>>>>>>>>>>>>>>  					b_w_log2);
>>>>>>>>>>>>>>>  		acc->awb_fr.stripes[1].grid_cfg.x_end = end;
>>>>>>>>>>>>>>> -
>>>>>>>>>>>>>>> -		/*
>>>>>>>>>>>>>>> -		 * To reduce complexity of debubbling and loading
>>>>>>>>>>>>>>> -		 * statistics fix grid_height_per_slice to 1 for both
>>>>>>>>>>>>>>> -		 * stripes.
>>>>>>>>>>>>>>> -		 */
>>>>>>>>>>>>>>> -		for (i = 0; i < stripes; i++)
>>>>>>>>>>>>>>> -			acc->awb_fr.stripes[i].grid_cfg.height_per_slice = 1;
>>>>>>>>>>>>>>>  	}
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> +	/*
>>>>>>>>>>>>>>> +	 * To reduce complexity of debubbling and loading
>>>>>>>>>>>>>>> +	 * statistics fix grid_height_per_slice to 1 for both
>>>>>>>>>>>>>>> +	 * stripes.
>>>>>>>>>>>>>>> +	 */
>>>>>>>>>>>>>>> +	for (i = 0; i < stripes; i++)
>>>>>>>>>>>>>>> +		acc->awb_fr.stripes[i].grid_cfg.height_per_slice = 1;
>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>  	if (imgu_css_awb_fr_ops_calc(css, pipe, &acc->awb_fr))
>>>>>>>>>>>>>>>  		return -EINVAL;
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> @@ -2591,15 +2591,15 @@ int imgu_css_cfg_acc(struct imgu_css *css, unsigned int pipe,
>>>>>>>>>>>>>>>  			imgu_css_grid_end(acc->af.stripes[1].grid_cfg.x_start,
>>>>>>>>>>>>>>>  					  acc->af.stripes[1].grid_cfg.width,
>>>>>>>>>>>>>>>  					  b_w_log2);
>>>>>>>>>>>>>>> -
>>>>>>>>>>>>>>> -		/*
>>>>>>>>>>>>>>> -		 * To reduce complexity of debubbling and loading statistics
>>>>>>>>>>>>>>> -		 * fix grid_height_per_slice to 1 for both stripes
>>>>>>>>>>>>>>> -		 */
>>>>>>>>>>>>>>> -		for (i = 0; i < stripes; i++)
>>>>>>>>>>>>>>> -			acc->af.stripes[i].grid_cfg.height_per_slice = 1;
>>>>>>>>>>>>>>>  	}
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> +	/*
>>>>>>>>>>>>>>> +	 * To reduce complexity of debubbling and loading statistics
>>>>>>>>>>>>>>> +	 * fix grid_height_per_slice to 1 for both stripes
>>>>>>>>>>>>>>> +	 */
>>>>>>>>>>>>>>> +	for (i = 0; i < stripes; i++)
>>>>>>>>>>>>>>> +		acc->af.stripes[i].grid_cfg.height_per_slice = 1;
>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>  	if (imgu_css_af_ops_calc(css, pipe, &acc->af))
>>>>>>>>>>>>>>>  		return -EINVAL;
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> @@ -2660,15 +2660,15 @@ int imgu_css_cfg_acc(struct imgu_css *css, unsigned int pipe,
>>>>>>>>>>>>>>>  			imgu_css_grid_end(acc->awb.stripes[1].grid.x_start,
>>>>>>>>>>>>>>>  					  acc->awb.stripes[1].grid.width,
>>>>>>>>>>>>>>>  					  b_w_log2);
>>>>>>>>>>>>>>> -
>>>>>>>>>>>>>>> -		/*
>>>>>>>>>>>>>>> -		 * To reduce complexity of debubbling and loading statistics
>>>>>>>>>>>>>>> -		 * fix grid_height_per_slice to 1 for both stripes
>>>>>>>>>>>>>>> -		 */
>>>>>>>>>>>>>>> -		for (i = 0; i < stripes; i++)
>>>>>>>>>>>>>>> -			acc->awb.stripes[i].grid.height_per_slice = 1;
>>>>>>>>>>>>>>>  	}
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> +	/*
>>>>>>>>>>>>>>> +	 * To reduce complexity of debubbling and loading statistics
>>>>>>>>>>>>>>> +	 * fix grid_height_per_slice to 1 for both stripes
>>>>>>>>>>>>>>> +	 */
>>>>>>>>>>>>>>> +	for (i = 0; i < stripes; i++)
>>>>>>>>>>>>>>> +		acc->awb.stripes[i].grid.height_per_slice = 1;
>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>  	if (imgu_css_awb_ops_calc(css, pipe, &acc->awb))
>>>>>>>>>>>>>>>  		return -EINVAL;
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> While it seems like a sensible idea to initialise arguments to
>>>>>>>>>>>>>> firmware, does this have an effect on the statistics format?
>>>>>>>>>>>>>> If so, can the existing user space cope with that?
>>>>>>>>>>>>>
>>>>>>>>>>>>> To try and figure that out, we have tested several grid
>>>>>>>>>>>>> configurations and inspected the captured statistics. We have
>>>>>>>>>>>>> converted the statistics in an image, rendering each cell as a
>>>>>>>>>>>>> pixel whose red, green and blue components are the cell's
>>>>>>>>>>>>> red, green and blue averages.
>>>>>>>>>>>>> This turned out to be a very effectice tool to quickly
>>>>>>>>>>>>> visualize AWB statistics.
>>>>>>>>>>>>> We have made a lot of tests with different output resolutions,
>>>>>>>>>>>>> from a small one up to the full-scale one.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Here is one example of a statistics output with a ViewFinder
>>>>>>>>>>>>> configured as 1920x1280, with a BDS output configuration set to
>>>>>>>>>>>>> 2304x1536 (sensor is 2592x1944).
>>>>>>>>>>>>>
>>>>>>>>>>>>> Without the patch, configuring a 79x45 grid of 16x16 cells we
>>>>>>>>>>>>> obtain the
>>>>>>>>>>>>> image: https://pasteboard.co/g4nC4fHjbVER.png.
>>>>>>>>>>>>> We can notice a weird padding every two lines and it seems to
>>>>>>>>>>>>> be missing half of the frame.
>>>>>>>>>>>>>
>>>>>>>>>>>>> With the patch applied, the same configuration gives us the image:
>>>>>>>>>>>>> https://pasteboard.co/rzap6axIvVdu.png
>>>>>>>>>>>>>
>>>>>>>>>>>>> We can clearly see the one padding pixel on the right, and the
>>>>>>>>>>>>> frame is all there, as expected.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Tomasz: We're concerned that this patch may have an impact on
>>>>>>>>>>>>> the ChromeOS Intel Camera HAL with the IPU3. Is it possible for
>>>>>>>>>>>>> someone to review and test this please?
>>>>>>>>>>>>
>>>>>>>>>>>> As shown by the images above, this is a real fix. It only
>>>>>>>>>>>> affects grid configurations that use a single stripe (left or
>>>>>>>>>>>> right), so either "small" resolutions (less than 1280 pixels at
>>>>>>>>>>>> the BDS output if I recall correctly), or grid configurations
>>>>>>>>>>>> that span the left part of the image with higher resolutions.
>>>>>>>>>>>> The latter is probably unlikely. For the former, it may affect
>>>>>>>>>>>> the binary library, especially if it includes a workaround for the bug.
>>>>>>>>>>>>
>>>>>>>>>>>> Still, this change is good I believe, so it should be upstreamed.
> 

-- 
Best regards,
Bingbu Cao
