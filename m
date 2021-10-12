Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F09F429CF1
	for <lists+linux-media@lfdr.de>; Tue, 12 Oct 2021 07:09:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231880AbhJLFLu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Oct 2021 01:11:50 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:47378 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229593AbhJLFLt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Oct 2021 01:11:49 -0400
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7EF67F1;
        Tue, 12 Oct 2021 07:09:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1634015385;
        bh=SuYfYSMkLjb6raUzzPYQXK9H38bTSfXGqoOlXHbyU9A=;
        h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=TVsPWcJCGN4hOgQ/4ydKHdUOg5It3ZceOSvLYfiiFss/1PAUQGgEg+NxiEe8T1hjE
         mzWB60JsoPwe1+oLgYBQ2+UgJQE0Yd23sObLr6sqPEWibtjmMyYdpvPy/wDlFxIK85
         WIvfe8yFFVHM3brezL87DYdlpK6vXebV9+RzpFX0=
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
References: <20211005085750.138151-1-tomi.valkeinen@ideasonboard.com>
 <20211005085750.138151-30-tomi.valkeinen@ideasonboard.com>
 <YWK+meG0VMWSeouu@pendragon.ideasonboard.com>
 <148b62b8-5c08-2799-052c-882aa49648f8@ideasonboard.com>
 <YWSnUI9/n0IEBOGy@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v9 29/36] media: subdev: add v4l2_subdev_set_routing
 helper()
Message-ID: <fb775cd2-7378-e8f8-d9ac-4d0452ba3dfa@ideasonboard.com>
Date:   Tue, 12 Oct 2021 08:09:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YWSnUI9/n0IEBOGy@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/10/2021 00:06, Laurent Pinchart wrote:
> Hi Tomi,
> 
> On Mon, Oct 11, 2021 at 11:13:40AM +0300, Tomi Valkeinen wrote:
>> On 10/10/2021 13:21, Laurent Pinchart wrote:
>>> On Tue, Oct 05, 2021 at 11:57:43AM +0300, Tomi Valkeinen wrote:
>>>> Add a helper function to set the subdev routing. The helper can be used
>>>> from subdev driver's set_routing op to store the routing table.
>>>>
>>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>>> ---
>>>>    drivers/media/v4l2-core/v4l2-subdev.c | 28 +++++++++++++++++++++++++++
>>>>    include/media/v4l2-subdev.h           | 16 +++++++++++++++
>>>>    2 files changed, 44 insertions(+)
>>>>
>>>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
>>>> index 14b8282fe45b..af53f827ec27 100644
>>>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
>>>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
>>>> @@ -1151,3 +1151,31 @@ void v4l2_subdev_unlock_state(struct v4l2_subdev_state *state)
>>>>    	mutex_unlock(&state->lock);
>>>>    }
>>>>    EXPORT_SYMBOL_GPL(v4l2_subdev_unlock_state);
>>>> +
>>>> +int v4l2_subdev_set_routing(struct v4l2_subdev *sd,
>>>> +			    struct v4l2_subdev_state *state,
>>>> +			    struct v4l2_subdev_krouting *routing)
>>>> +{
>>>> +	struct v4l2_subdev_krouting *dst = &state->routing;
>>>> +	const struct v4l2_subdev_krouting *src = routing;
>>>> +
>>>> +	lockdep_assert_held(&state->lock);
>>>
>>> Calling this function doesn't make much sense if the subdev doesn't have
>>> the V4L2_SUBDEV_FL_MULTIPLEXED set, right ? If that's correct, should
>>> this be documented below, and/or possibly checked here ?
>>>
>>> 	if (WARN_ON(!(sd->flags & V4L2_SUBDEV_FL_MULTIPLEXED)))
>>> 		return -E???;
>>
>> That is true, but it's true for all the functions introduced in the
>> series. Do we want to add the check everywhere? In many cases this
>> should be quite obvious: if you haven't ported the subdev driver to the
>> new API, you don't have routing table, and can't sensibly call this
>> function. Or you don't have stream ID, so you can't sensibly call
>> functions that take a stream number.
> 
> That's right. I was mostly concern about driver conversion, it's likely
> easy to forget to add V4L2_SUBDEV_FL_MULTIPLEXED and then spend time
> debugging issues.
> 
> I'm fine either way for the WARN_ON, but would still like to capture
> this in the documentation.

There are perhaps two easy things to miss, adding 
V4L2_SUBDEV_FL_MULTIPLEXED and calling v4l2_subdev_init_finalize(). 
Maybe I can add some checks to catch these two.

>>>> +
>>>> +	kvfree(dst->routes);
>>>> +	dst->routes = NULL;
>>>> +	dst->num_routes = 0;
>>>> +
>>>> +	if (src->num_routes > 0) {
>>>> +		dst->routes = kvmalloc_array(src->num_routes,
>>>> +					     sizeof(*src->routes), GFP_KERNEL);
>>>
>>> How many routes do we typically expect, is it worth a vmalloc ? If not,
>>
>> I have to say I have no clue if it's worth it. vmalloc is used for the
>> pads, and was used in the original routing patches. I did wonder about
>> this but just went with what's already there.
>>
>> It's not easy to guess the expected number of routes. I'd say... 4 pads
>> on each side and 8 streams per pad-pair sounds kind of a lot but still
>> sounds feasible. That would be 32 routes. But that would be on the
>> maximum side. On average, I guess we'll have... 1 or 2 routes? That's
>> wha the sensors will have.
>>
>>> kmemdup() could be a candidate (as I think by the time we get here,
>>> num_routes should have been validated to not overflow, but please tell
>>> me if I got this part wrong).
>>
>> I'm not sure what you mean here. We are allocating (enough) new memory,
>> it will never overflow.
> 
> I mean an integer overflow in the size * nelems calculation. The array
> allocation functions pay special attention to this.

check_array_args() gives an error if there are more than 256 routes. It 
also does a copy of the userspace's routing table to a kvmalloc'd buffer 
(which is the source here), which, in case of overflow, would then 
already be broken. But the limit of 256 feels safe enough even if in the 
future the struct v4l2_subdev_route would grow a bit.

  Tomi
