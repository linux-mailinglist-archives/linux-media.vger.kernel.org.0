Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2CDC55FFD6
	for <lists+linux-media@lfdr.de>; Wed, 29 Jun 2022 14:27:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230337AbiF2M1G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jun 2022 08:27:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229958AbiF2M1F (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jun 2022 08:27:05 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 337EA35DD5
        for <linux-media@vger.kernel.org>; Wed, 29 Jun 2022 05:27:04 -0700 (PDT)
Received: from [192.168.1.111] (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 282493D7;
        Wed, 29 Jun 2022 14:27:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656505622;
        bh=A5/tJq7TRRVHgSJatvICp0trnsHwClzbEHoUoITm5NQ=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=wlWeISi3UEZf0oByvolJvrkY3xRnQMCGr2zQpVqLj6rJRKn1bP5p/HopHW9kIdS7z
         YC9a88Mv2o4FzaN6AtdXm8hFstluRKawotfNsptYqFPLRQMrOV8M+2gm6pJH/GjadS
         9oxlZgXBiLScZvKaM7oquWg0RWWgkj5/32+yozPU=
Message-ID: <df7060aa-b201-3d39-72e9-fcb575e7b43e@ideasonboard.com>
Date:   Wed, 29 Jun 2022 15:26:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2] media: stm32: dcmi: Switch to
 __v4l2_subdev_state_alloc()
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, Marek Vasut <marex@denx.de>,
        linux-media@vger.kernel.org,
        Alain Volmat <alain.volmat@foss.st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Amelie DELAUNAY <amelie.delaunay@foss.st.com>,
        Hugues FRUCHET <hugues.fruchet@foss.st.com>,
        Philippe CORNU <philippe.cornu@foss.st.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20220627174156.66919-1-marex@denx.de>
 <3ef88906-188d-52a6-c3bf-647bc4e36732@xs4all.nl>
 <32f04271-4a9a-3291-cf36-ead0383db9ca@ideasonboard.com>
 <YrxDq5I3ZsEf8ruO@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <YrxDq5I3ZsEf8ruO@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 29/06/2022 15:20, Laurent Pinchart wrote:
> On Wed, Jun 29, 2022 at 03:14:54PM +0300, Tomi Valkeinen wrote:
>> On 29/06/2022 12:41, Hans Verkuil wrote:
>>> Hi Marek, Tomi, Laurent,
>>>
>>> On 27/06/2022 19:41, Marek Vasut wrote:
>>>> Any local subdev state should be allocated and free'd using
>>>> __v4l2_subdev_state_alloc()/__v4l2_subdev_state_free(), which
>>>> takes care of calling .init_cfg() subdev op. Without this,
>>>> subdev internal state might be uninitialized by the time
>>>> any other subdev op is called.
>>>>
>>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>>> Cc: Alain Volmat <alain.volmat@foss.st.com>
>>>> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
>>>> Cc: Amelie DELAUNAY <amelie.delaunay@foss.st.com>
>>>> Cc: Hugues FRUCHET <hugues.fruchet@foss.st.com>
>>>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>>> Cc: Philippe CORNU <philippe.cornu@foss.st.com>
>>>> Cc: linux-stm32@st-md-mailman.stormreply.com
>>>> Cc: linux-arm-kernel@lists.infradead.org
>>>> ---
>>>> V2: Add FIXME comment above __v4l2_subdev_state_alloc() calls
>>>> ---
>>>>    drivers/media/platform/st/stm32/stm32-dcmi.c | 59 ++++++++++++--------
>>>>    1 file changed, 37 insertions(+), 22 deletions(-)
>>>>
>>>> diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
>>>> index c604d672c2156..c68d32931b277 100644
>>>> --- a/drivers/media/platform/st/stm32/stm32-dcmi.c
>>>> +++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
>>>> @@ -996,22 +996,30 @@ static int dcmi_try_fmt(struct stm32_dcmi *dcmi, struct v4l2_format *f,
>>>>    			struct dcmi_framesize *sd_framesize)
>>>>    {
>>>>    	const struct dcmi_format *sd_fmt;
>>>> +	static struct lock_class_key key;
>>>>    	struct dcmi_framesize sd_fsize;
>>>>    	struct v4l2_pix_format *pix = &f->fmt.pix;
>>>> -	struct v4l2_subdev_pad_config pad_cfg;
>>>> -	struct v4l2_subdev_state pad_state = {
>>>> -		.pads = &pad_cfg
>>>> -		};
>>>> +	struct v4l2_subdev_state *sd_state;
>>>>    	struct v4l2_subdev_format format = {
>>>>    		.which = V4L2_SUBDEV_FORMAT_TRY,
>>>>    	};
>>>>    	bool do_crop;
>>>>    	int ret;
>>>>    
>>>> +	/*
>>>> +	 * FIXME: Drop this call, drivers are not supposed to use
>>>> +	 * __v4l2_subdev_state_alloc().
>>>> +	 */
>>>> +	sd_state = __v4l2_subdev_state_alloc(dcmi->source, "dcmi:state->lock", &key);
>>>> +	if (IS_ERR(sd_state))
>>>> +		return PTR_ERR(sd_state);
>>>> +
>>>
>>> I've been reading the discussion for the v1 patch, and I seriously do not like this.
>>
>> I don't like it either.
>>
>>> My comments are not specifically for this patch, but for all cases where
>>> __v4l2_subdev_state_alloc is called.
>>
>> Just to emphasize it: afaics this is not an issue with the subdev state.
>> This driver was already broken. Before the subdev state change the fix
>> would have been to call source subdev's init_cfg. Now
>> __v4l2_subdev_state_alloc handles calling init_cfg (along with a few
>> other inits).
>>
>>> It is now used in 4 drivers, so that's no longer a rare case, and the code isn't
>>> exactly trivial either.
>>
>> Counting this one? I found 3 cases in v5.18-rc4:
>>
>> 1) drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c:
>>
>> Allocates the state for v4l2_subdev_call, set_fmt, TRY.
>>
>> Here, a helper macro which does the alloc would be a solution.
>>
>> 2) drivers/media/platform/renesas/vsp1/vsp1_entity.c:
>>
>> Allocates the state for storing internal active state.
>>
>> Here, I think, the easiest fix is for the driver to use the subdev state
>> properly.
>>
>> 3) drivers/staging/media/tegra-video/vi.c:
>>
>> Allocates the state for v4l2_subdev_call, enum_frame_size and set_fmt,
>> TRY. Interestingly the code also calls get_selection but without passing
>> the state...
>>
>> This is a more interesting case as the source's subdev state is actually
>> modified by the driver. The driver calls enum_frame_size, then modifies
>> the state, then calls set_fmt. I'm not sure if that's really legal...
>> The driver directly modifies the state, instead of calling set_selection?
>>
>>> I think a helper function might be beneficial, but the real problem is with the
>>> comment: it does not explain why you shouldn't use it and what needs to be done
>>> to fix it.
>>
>> That is true. There's no single answer to that. I think instead of
>> trying to document that in the v4l2-subdev doc, we can enhance the
>> comments in those three call sites to explain how it needs to be fixed.
>>
>>> My suggestion would be to document that in the kerneldoc for this function in
>>> media/v4l2-subdev.h, and then refer to that from this comment (and similar comments
>>> in the other drivers that use this).
>>>
>>> And another question: are more drivers affected by this? Is it possible to
>>> find those and fix them all?
>>
>> I think any driver that calls a source subdev's subdev ops which a
>> subdev state as a parameter (the ones that used to take
>> v4l2_subdev_pad_config), and does not call init_cfg is broken in the
>> same way. With some grepping, I couldn't find anyone calling init_cfg.
>> Finding those drivers which do those calls is a bit more difficult, but
>> can be done with some efforts.
> 
> A quick check identified the following files:
> 
> atmel-isc-base.c
> atmel-isi.c
> cxusb-analog.c
> fimc-capture.c
> mcam-core.c
> pxa_camera.c
> renesas-ceu.c
> saa7134-empress.c
> via-camera.c
> 
> A few drivers with more complex call patterns may be missing.
> 
>> atmel-isc-base.c is one I found, and looks like it's doing something a
>> bit similar to the 3) case above.
>>
>> Perhaps the best way to solve this is just to remove the underscores
>> from __v4l2_subdev_state_alloc, and change all the drivers which create
>> temporary v4l2_subdev_states to use that (and the free) functions. And
>> also create the helper macro which can be used in those cases where the
>> call is simple (the state is not modified or accessed by the caller).
> 
> As long as we prevent any new driver from using that API, that's fine
> with me.

An alternative would be to keep the v4l2_subdev_state as a local 
variable (allocated in the stack), and add a new function, 
v4l2_subdev_state_local_init() or such. The function would initialize 
the given state, expecting the allocatable fields to be already 
allocated (state->pads, which in the above cases points to another local 
variable, i.e. stack).

This would prevent the need of a free call, which, while not complex as 
such, might cause a bigger amount of changes in some cases to handle the 
error paths correctly.

Of course, if the above-mentioned macro works, then that's the easiest 
solution. But that won't work for all drivers.

  Tomi
