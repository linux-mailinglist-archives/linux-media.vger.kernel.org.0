Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE8CA18844C
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2020 13:33:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726902AbgCQMdR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Mar 2020 08:33:17 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:52622 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726550AbgCQMdM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Mar 2020 08:33:12 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C1A1A504;
        Tue, 17 Mar 2020 13:33:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584448390;
        bh=ChaPSA5GV8Hr5aNJGgWAOdC3my92xcXCev0HTwhdU+k=;
        h=Subject:To:Cc:References:Reply-To:From:Date:In-Reply-To:From;
        b=LP0fPdkxDvVOiOHieYbxAfphgo9NTAMpUPJWzbdkpGX3J0xI/VNJPjvVy54h/jzMr
         xLH7dB54n3oWRvymGY7B6/FXVoripLTNhsBdcei0rHF+P3Iny/uNAkGiG0vBbNUH83
         dKD5N6NTXpAHlwEuCdCcRlW/3kljY26aztQgsuWQ=
Subject: Re: [PATCH] media: v4l2-async: Accept endpoints and devices for
 fwnode matching
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Lad Prabhakar <prabhakar.csengg@gmail.com>
References: <20200315102724.26850-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200315125511.25756-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200316214012.GB2324872@oden.dyn.berto.se>
 <20200316214727.GX4732@pendragon.ideasonboard.com>
Reply-To: kieran.bingham+renesas@ideasonboard.com
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <b647c536-98cb-9ecc-d6b3-14954da78868@ideasonboard.com>
Date:   Tue, 17 Mar 2020 12:33:07 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200316214727.GX4732@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 16/03/2020 21:47, Laurent Pinchart wrote:
> Hi Niklas,
> 
> On Mon, Mar 16, 2020 at 10:40:12PM +0100, Niklas Söderlund wrote:
>> On 2020-03-15 14:55:11 +0200, Laurent Pinchart wrote:
>>> fwnode matching was designed to match on nodes corresponding to a
>>> device. Some drivers, however, needed to match on endpoints, and have
>>> passed endpoint fwnodes to v4l2-async. This works when both the subdev
>>> and the notifier use the same fwnode types (endpoint or device), but
>>> makes drivers that use different types incompatible.
>>>
>>> Fix this by extending the fwnode match to handle fwnodes of different
>>> types. When the types (deduced from the node name) are different,
>>> retrieve the device fwnode for the side that provides an endpoint
>>> fwnode, and compare it with the device fwnode provided by the other
>>> side. This allows interoperability between all drivers, regardless of
>>> which type of fwnode they use for matching.
>>>
>>> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>>
>> I tested this on R-Car CSI-2 and ADV748x without any regressions. As 
>> Jacopo already pointed out it's similar to what have been tried before 

This was the patch that I had believed was accepted, but ended up stuck
in Sakari's tree:

https://git.linuxtv.org/sailus/media_tree.git/commit/?h=fwnode-const&id=35c32d99b2c3f5086b911ec817926de9b7bc3b41

(it's already a little bit-rotted though)


>> and have the potential problem for new transmitters registering multiple 
>> endpoints (like ADV748x) being used together with older receivers who 
>> register a single device node in v4l-async. But this do not introduce 

So if an 'old' receiver wants to use the 'new' features, it must upgrade
to endpoint matching.

I think that's fine.

>> any regressions and is a good first step to move everything to endpoint 
>> matching.
>>
>> Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
>>
>> Maybe a info message should be logged if a match is made between 
>> endpoint and node? It would make it easy to spot if one needs to debug a 
>> miss match and would be a clear message one driver should be moved to 
>> endpoint matching. Maybe adding such a log message would count as a 
>> regression for some.
> 
> WARN("FIX YOUR DRIVER TO USE ENDPOINT MATCHING") ? :-)

Indeed, a notification that they need to update their matching would be
useful in that scenario.

I believe we need to move forward with this somehow, as we have Xilinx
trying to use MAX9286 with Xilinx drivers, (endpoint matching subdev
with dev node matching receiver) and Renesas trying to use non-endpoint
subdevices against an endpoint matched RCar-VIN ...?


> Jokes aside, something a bit less harsh such as "Matching endpoint with
> device node, consider fixing driver %s to use endpoints" wouldn't be a
> bad idea.

Yes, Is there anything else we can do? Even if we 'started' converting
other receivers to match on endpoints, it would take time - so I think
an intermediate stage like this is still very useful.

Of course this patch also lets us push the updates back to those who
care about those drivers too ...

>>> ---
>>> This has been compile-tested only. Prabhakar, could you check if it
>>> fixes your issue ?
>>>
>>>  drivers/media/v4l2-core/v4l2-async.c | 42 +++++++++++++++++++++++++++-
>>>  1 file changed, 41 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
>>> index 8bde33c21ce4..995e5464cba7 100644
>>> --- a/drivers/media/v4l2-core/v4l2-async.c
>>> +++ b/drivers/media/v4l2-core/v4l2-async.c
>>> @@ -71,7 +71,47 @@ static bool match_devname(struct v4l2_subdev *sd,
>>>  
>>>  static bool match_fwnode(struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
>>>  {
>>> -	return sd->fwnode == asd->match.fwnode;
>>> +	struct fwnode_handle *other_fwnode;
>>> +	struct fwnode_handle *dev_fwnode;
>>> +	bool asd_fwnode_is_ep;
>>> +	bool sd_fwnode_is_ep;
>>> +	const char *name;
>>> +
>>> +	/*
>>> +	 * Both the subdev and the async subdev can provide either an endpoint
>>> +	 * fwnode or a device fwnode. Start with the simple case of direct
>>> +	 * fwnode matching.
>>> +	 */
>>> +	if (sd->fwnode == asd->match.fwnode)
>>> +		return true;
>>> +
>>> +	/*
>>> +	 * Otherwise, check if the sd fwnode and the asd fwnode refer to an
>>> +	 * endpoint or a device. If they're of the same type, there's no match.
>>> +	 */
>>> +	name = fwnode_get_name(sd->fwnode);
>>> +	sd_fwnode_is_ep = name && strstarts(name, "endpoint");
>>> +	name = fwnode_get_name(asd->match.fwnode);
>>> +	asd_fwnode_is_ep = name && strstarts(name, "endpoint");
>>> +
>>> +	if (sd_fwnode_is_ep == asd_fwnode_is_ep)
>>> +		return false;

Ok, so this looks like a good safety check for edge cases which would
potentially have got through in my version.

>>> +
>>> +	/*
>>> +	 * The sd and asd fwnodes are of different types. Get the device fwnode
>>> +	 * parent of the endpoint fwnode, and compare it with the other fwnode.
>>> +	 */
>>> +	if (sd_fwnode_is_ep) {
>>> +		dev_fwnode = fwnode_graph_get_port_parent(sd->fwnode);
>>> +		other_fwnode = asd->match.fwnode;
>>> +	} else {
>>> +		dev_fwnode = fwnode_graph_get_port_parent(asd->match.fwnode);
>>> +		other_fwnode = sd->fwnode;
>>> +	}
>>> +
>>> +	fwnode_handle_put(dev_fwnode);

It seems in my implementation these got leaked too :-)

I'm sold. This one is better than the old version I had.

Hopefully we can get this moving so that we can progress towards
endpoint matching throughout next.

(Ideally with a warning to convert non-endpoint matching drivers...)

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


>>> +
>>> +	return dev_fwnode == other_fwnode;
>>>  }
>>>  
>>>  static bool match_custom(struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
> 

