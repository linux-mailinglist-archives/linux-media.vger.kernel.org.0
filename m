Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 199854785CF
	for <lists+linux-media@lfdr.de>; Fri, 17 Dec 2021 09:00:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232994AbhLQIAY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Dec 2021 03:00:24 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:49078 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbhLQIAX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Dec 2021 03:00:23 -0500
Received: from [192.168.1.111] (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AAAF792A;
        Fri, 17 Dec 2021 09:00:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1639728022;
        bh=N5IB5m0HbvOHfiTcN2bgRLJdS6E0JkqlQG/JEPahBeY=;
        h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=paZzYS8cuMPYe2XuUmS72jveiyZG/5InAJRlnIz+jVzg4xAVHGUA5wePLxlXyGakh
         Fv6RDsl98wbFytAEUi+NVFr/RZqU6/HXk16Pd15aM/tI9j7viBva0okn/n4PXwnzvB
         U44K4GUR42cl2VoUjV2DBvU+R5RHfFOj3CHb0xo4=
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
References: <20211130141536.891878-1-tomi.valkeinen@ideasonboard.com>
 <20211130141536.891878-3-tomi.valkeinen@ideasonboard.com>
 <20211213213033.sr3isjmxvyl47qgl@uno.localdomain>
 <89881e00-e632-2aea-0db4-1dc50195254a@ideasonboard.com>
 <20211215093843.phwp5srphkbooeq2@uno.localdomain>
 <b10e92f4-75a3-4cc4-8e37-fbdd249a0d17@ideasonboard.com>
 <20211215162512.k6snhw2dg4dn5jft@uno.localdomain>
 <YbtJ3O4JXr1WahH+@pendragon.ideasonboard.com>
 <YbtQHDGp0uDlbiZE@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v10 02/38] media: subdev: add active state to struct
 v4l2_subdev
Message-ID: <a1ae9dfd-15d3-53a7-39a5-bc37d3df24a3@ideasonboard.com>
Date:   Fri, 17 Dec 2021 10:00:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YbtQHDGp0uDlbiZE@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16/12/2021 16:41, Laurent Pinchart wrote:

>>>>>>> 5) is currently unused and it still feels a bit ill-defined. If the state
>>>>>>> passed in as parameter is NULL then deflect it to sd->state, so I
>>>>>>> guess it assumes that the user is a state-aware subdev driver which
>>>>>>> needs to protect against in-kernel callers that do no pass in a valid state to
>>>>>>
>>>>>> Correct.
>>>>>>
>>>>>>> the operation call. This implies that if the caller passes in a NULL
>>>>>>> state for the TRY format, this gets deflected to the subdev's active
>>>>>>> state, something which should not happen, right ? I would be tempted
>>>>>>
>>>>>> Yes. That's an illegal call, isn't it? Or does it happen and we need to
>>>>>> protect against it?
>>>>>>
>>>>>>> to just fail loud if !state and assume if you're moving your subdev to
>>>>>>> use state you should be able to fix the caller as well.
>>>>>>
>>>>>> That would be nice, but I think it's not realistic. If you convert a sensor
>>>>>> driver to multiplexed streams, are you going to fix (convert to multiplexed
>>>>>> streams) all the bridges and SoC drivers that may use that sensor? How do
>>>>>> you even find all those bridges and SoCs...
>>>>>
>>>>> Of course no. You fix the one you're using. You're converting a sensor
>>>>> driver, you can fix the top driver too. Other users of the sensor
>>>>> driver will probably scream when moving to the next driver release
>>>>> that has been made state aware, so they'll hopefully fix their top driver
>>>>> too. After all, this applies equally to downstrems as well and
>>>>
>>>> Well, I'm not a maintainer in linux-media, but I would nack that approach
>>>> =). We can't just go breaking other platforms, and hoping other devs will
>>>> fix them.
>>
>> I'd love to agree with Jacopo here and break things all the time to get
>> other people to fix them, but I doubt that I'd make many friends while
>> doing so :-)
>>
>> This being said, the more we can push for conversions to happen quickly,
>> the better. For instance, new sensor drivers should rely on the active
>> state being passed to all subdev operations, so that any existing host
>> driver that wants to use them will need to be converted.
>> v4l2_subdev_lock_and_return_state() in subdev drivers should only be
>> used as a transition tool.
>>
>> Similarly, a way to enforce that new host drivers only work with sensor
>> drivers that have been converted would be good.
>>
>> We should aim for the removal of v4l2_subdev_lock_and_return_state(). A
>> WARN_ON() there will be useful at some point, but it's of course too
>> early. A bit of yak shaving may also help, by asking maintainers and
>> contributors to sensor and host drivers to migrate to the new API.
>>
>>>>> providing an helper to work around issues is not the best idea in my
>>>>> opinion. Also the helper should be used in the subdev driver in place
>>>>> of the regular v4l2_subdev_lock_state() to protect just in case
>>>>> against legacy callers. When will they be moved to use the regular
>>>>> v4l2_subdev_lock_state() ?
>>>>
>>>> Note that this is needed only when porting an existing and presumably in-use
>>>> subdev driver. You don't need this if you write a new driver.
>>>>
>>>> The users of v4l2_subdev_lock_and_return_state are easy to find and easy to
>>>> change to v4l2_subdev_lock_state when we decide a particular driver doesn't
>>>> need to support legacy subdevs.
>>>
>>> I'm just concerned that as long as we offer an helper to work this
>>> around (and the helper might introduce subtle issues like mixing
>>> try/active context) once we
>>> s/v4l2_subdev_lock_and_return_state/v4l2_subdev_lock_state we'll be
>>> anyway breaking users.
>>>
>>>> I don't like this at all but, afaics, we can't break the existing platforms.
>>>> This function is a very simple work-around for the time being, and easy to
>>>> drop later.
>>>>
>>>>> Once a subdev driver has been moved to be state aware callers that
>>>>> passes in a NULL state should be fixed. As we can't fix them all,
>>>>> screaming loud and clearly say what has to be done to move forward is
>>>>> in my opinion better than introducing a temporary function that
>>>>> replaces the regular API and that subdev should decide to use just in
>>>>> case (and which can lead to subtle errors like using the active state
>>>>> in a TRY context).
>>>>>
>>>>> If you want to protect against broken callers then what about
>>>>> doing the "state = state ? : sd->active_state;" dance in
>>>>> v4l2_subdev_lock_state() with a WARN_ONCE(!state) so that
>>>>> subdev drivers can use the regular API from day 0 ?
>>>>
>>>> Hmm, I think that is an option. I didn't implement "state = state ? :
>>>> sd->active_state;" in the v4l2_subdev_lock_state() as I didn't want
>>>> v4l2_subdev_lock_state() to hide an invalid NULL parameter. But adding
>>>> WARN_ONCE() would warn about it.
>>
>> As we can't WARN() unconditionally yet when encountering a driver that
>> hasn't been converted, we need to keep v4l2_subdev_lock_and_return_state()
>> as an alternative that won't WARN. Do I understand that adding
>> "state = state ? : sd->active_state;" + WARN_ON in
>> v4l2_subdev_lock_state() would then be used only to catch invalid
>> combinations with a warning instead of a crash ? What would it help with
>> ?
>>
>>>> I'm still undecided, though. The WARN_ONCE would come only once for the
>>>> whole kernel, per boot, wouldn't it? We could have a macro for
>>>> v4l2_subdev_lock_state, but then we'd get lots of warnings. And a full WARN
>>>> just because a driver hasn't been updated is a bit harsh. Maybe we can start
>>>> with just a normal warning print.
>>>
>>> There is a precendet I can think of: async matching on device or
>>> endpoints. Initially all async subdevs where matched on the remote end
>>> device node. For more complex setups this didn't scale, as the same
>>> remote can have multiple endpoints, and matching on the device node
>>> would have created false positives. So v4l2-async was moved to match on
>>> endpoints with some legacy compatibility code
>>>
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/v4l2-core/v4l2-async.c#n69
>>>
>>> 	if (dev && dev->driver) {
>>> 		if (sd_fwnode_is_ep)
>>> 			dev_warn(dev, "Driver %s uses device fwnode, incorrect match may occur\n",
>>> 				 dev->driver->name);
>>> 		dev_notice(dev, "Consider updating driver %s to match on endpoints\n",
>>> 			   dev->driver->name);
>>> 	}
>>>
>>> Can't we have something like this in v4l2_subdev_lock_state() ?
>>
>> I think we need to start by being silent first, then move to dev_warn(),
>> then to WARN(), and finally drop the option. This can be done with
>> v4l2_subdev_lock_and_return_state() I believe, which would be used by
>> driver that have been converted but still need to support legacy
>> combinations. Drivers that don't want to support legacy combinations
>> would use v4l2_subdev_lock_state(). Usage of
>> v4l2_subdev_lock_and_return_state() in a driver would indicate more work
>> is needed, and would be a useful indication of how far we are in our
>> conversion effort.
> 
> I've discussed this a bit further with Jacopo on IRC. I understand his
> concern that silently using the active state when the state is NULL may
> cause issues that could be hard to debug. However, I believe we need a
> way to handle the transition, without being too harsh (otherwise the
> mob will call for a revert, with pitchforks) or too lenient (otherwise
> nothing will happen).
> 
> One option would be to keep both v4l2_subdev_lock_state() and
> v4l2_subdev_lock_and_return_state(), with both functions replacing a
> NULL state with subdev->active_state. The former would WARN(), and the
> latter would dev_warn(). This would allow a gradual transition from
> v4l2_subdev_lock_and_return_state() to v4l2_subdev_lock_state() when
> we're confident enough that it should be OK for a particular driver. In
> the occasional case where the WARN() would trigger, we could either
> revert and fix, or just fix directly (the latter would be my preferred
> option, as the incentive for the reporter of the issue to write a fix
> would be higher).
> 
> I however don't oppose returning NULL from v4l2_subdev_lock_state() when
> state is NULL (with a WARN_ON()). The caller would likely crash, but
> that's an issue in the caller :-)

Note that v4l2_subdev_lock_state() doesn't return a value. We can't use 
that function to pick up the active state for the caller if the passed 
state is NULL.

We could change v4l2_subdev_lock_state() to return a value, or we could 
change v4l2_subdev_lock_state() to a macro and do magics there, but I 
think both options are very bad.

I think v4l2_subdev_lock_and_return_state() is the best way forward.

I can add a dev_warn there, though.

  Tomi
