Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91D27366B61
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 14:57:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237669AbhDUM5p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Apr 2021 08:57:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235456AbhDUM5p (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 08:57:45 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58DA3C06174A
        for <linux-media@vger.kernel.org>; Wed, 21 Apr 2021 05:57:12 -0700 (PDT)
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A951C4AE;
        Wed, 21 Apr 2021 14:57:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1619009829;
        bh=S7NWasTFWpqRrIzkGTRcPUN7RMvl7aazOZ/Zc9ef5vI=;
        h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=ftYLgFUwKqtELqHbvbks0S/2sLLPDhejEBuUBIjVFi1MN0fyzI5o+NhUiB19csBk6
         52uQBdXwtJfm5Wlzm6F+G7Zus8yb+OBsRi2e2ZP/3WTj2zDfVp1PNHGp7WAd864ZdM
         AOOkP4oV9aELATJLxt8QF6FyQanJH3TIXJwHVTpI=
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20210415130450.421168-1-tomi.valkeinen@ideasonboard.com>
 <YHxtL6CM+AaV9+AG@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v5 00/24] v4l: subdev internal routing
Message-ID: <c3a6de40-e99a-7f4e-f36f-1b161d3be6df@ideasonboard.com>
Date:   Wed, 21 Apr 2021 15:57:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YHxtL6CM+AaV9+AG@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 18/04/2021 20:32, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Nice to see a v5 of this plagued patch series :-)
> 
> On Thu, Apr 15, 2021 at 04:04:26PM +0300, Tomi Valkeinen wrote:
>> Hi,
>>
>> This is an RFC for subdev internal routing which is needed for
>> multiplexed streams support. I believe this is essentially a v5 of the
>> series, the v4 posted here:
>>
>> https://lore.kernel.org/linux-media/20190328200608.9463-1-jacopo+renesas@jmondi.org/
>>
>> Most of the patches are not changed (aside from fixing rebase issues
>> etc). The major changes in this version are:
>>
>> 1) Added 'which' field to the routing structs. It is currently not used,
>> as implementing it is not trivial. However, I think it's good to add it
>> to the uAPI now, and require the field to be set to
>> V4L2_SUBDEV_FORMAT_ACTIVE for now. See this RFC for an idea how this
>> could be implemented:
>>
>> https://lore.kernel.org/linux-media/20210409133659.389544-1-tomi.valkeinen@ideasonboard.com/
> 
> I've reviewed that, and I like it, but it's not straightforward to
> understand from that patch how you envision TRY to be implemented.

To be honest I don't have much at all experience with TRY. But, afaics, 
if we have means to store the TRY routes, and that is passed to the 
relevant ioctls in the subdev's, isn't that enough? It's up to the 
driver to implement the TRY functionality.

Although currently the S_ROUTING won't return anything to the userspace, 
it's supposed to either accept the routing table or return an error, 
whereas the S_FMT will do it's best to come up with a working setup and 
return it.

>> 2) No hardcoded maximum number of routes. Defining a maximum is not
>> possible, as there can be an arbitrary amount of routes per pad, and
>> there can be an arbitrary amount of pads per subdev. This series
>> allocates space for the routing table dynamically, which unfortunately
>> leads to not-just-a-few allocs and frees.
>>
>> 3) When searching for a format for a stream, the v4 looked for a
>> non-multiplexed pad only as far as the "other" side of the subdev. It
>> wouldn't work for a subdev which has multiplexed sink and source pads.
>> This series implements a "deep" get-format (v4l2_subdev_get_format_dir)
>> which follows a stream either towards the original source or the final
>> sink, while looking for a non-multiplexed pad with a format.
>>
>> Some thoughts:
>>
>> 1) Link validation and v4l2_subdev_get_format_dir need to look at the
>> routing, and this leads to multiple allocs to get a copy of the routing
>> table. There might be a possibility here to keep a table allocated and
>> re-use it in consecutive get_routing calls.
>>
>> Or even better, perhaps the kAPI could be changed so that allocs are not
>> needed. I thought about a kAPI where the subdev just returns a pointer
>> to its routing table, but then we hit the life-cycle problem: how to
>> ensure the table won't be freed or changed until the caller is done.
> 
> Storing the routing table in the v4l2_subdev_config (or
> v4l2_subdev_state) would be one way to do so, and I'd like to explore
> that direction. State lifetime is indeed an issue, and one simple option
> would be to just take the graph lock to modify the routing.
> 
>> 2) The routing uAPI is a bit vague. There is no way for the userspace to
>> figure out what kind of routing is allowed. Also, the existence of a
>> route in the routing table already indicates that the route is active,
>> but we also have V4L2_SUBDEV_ROUTE_FL_ACTIVE. I decided to keep
>> V4L2_SUBDEV_ROUTE_FL_ACTIVE for now, even if it doesn't really provide
>> any feature.
> 
> We can't report all possible routes if we take streams into account, but
> maybe we could report all possible routes between pads ? This could go
> through a separate ioctl.

That should be doable, but I wonder how much it helps. We should also 
somehow indicate if, say, routes from two source pads can go to the same 
sink pads, or can two streams from a single source pad go to separate 
sink pads, and so on. Is it better just to document what the driver 
supports for a specific hardware, than try to come up with a machine 
readable representation of the possible routings.

  Tomi
