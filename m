Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9D523B9D1B
	for <lists+linux-media@lfdr.de>; Fri,  2 Jul 2021 09:49:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230170AbhGBHwM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jul 2021 03:52:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbhGBHwL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Jul 2021 03:52:11 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A6AFC061762
        for <linux-media@vger.kernel.org>; Fri,  2 Jul 2021 00:49:39 -0700 (PDT)
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 65BFE4AB;
        Fri,  2 Jul 2021 09:49:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1625212176;
        bh=GK1QspjTVJZWWhtIbLHiRTBuQd/F52jCq80srPSa1eM=;
        h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=EGFRlAOVYZr2GIFN1vMhUiuAxvDFlYSjrka7FEa6ds+l7ukAHs/XvoIYPCGsWD3H/
         BU8bCtVasSoz8BzF3ccqclfENJ8XfwUfm3Cil/5jvOOAkxvnVtNzKVh02wOAdp9aK4
         BcWI3pBqE6GH/TM/uGqcvjIW3vN08aRbxKY+qjoY=
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
References: <20210524104408.599645-1-tomi.valkeinen@ideasonboard.com>
 <20210524104408.599645-21-tomi.valkeinen@ideasonboard.com>
 <YLv+Za5F/0wiD5cZ@pendragon.ideasonboard.com>
 <YLv+1yqN90T2Rxhd@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v7 20/27] v4l: subdev: add V4L2_SUBDEV_ROUTE_FL_SOURCE
Message-ID: <385db9a9-d2b9-64f6-6ba2-fe9ffa2d83f7@ideasonboard.com>
Date:   Fri, 2 Jul 2021 10:49:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YLv+1yqN90T2Rxhd@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 06/06/2021 01:46, Laurent Pinchart wrote:
> Hi Tomi,
> 
> On Sun, Jun 06, 2021 at 01:44:54AM +0300, Laurent Pinchart wrote:
>> On Mon, May 24, 2021 at 01:44:01PM +0300, Tomi Valkeinen wrote:
>>> Add route flag to indicate that the route is a source route. This means
>>> that the route does not lead anywhere, and the sink_pad and sink_stream
>>> should not be used.
>>
>> I don't like this much. It's not a route if it doesn't lead anywhere, so
>> this flag seems like a hack. If we need a way to discover streams on a
>> source, I'd rather have an explicit operation to do so. Can't the get
>> frame descriptor operation be used for this ?

If the "route" word is the problem, perhaps we can rename it to... 
"streams"?

If the sensor has one source pad with one or two streams, the userspace 
needs to be able to 1) configure if we have one or two streams 2) 
configure the stream IDs 3) configure the stream format. This is exactly 
the same as when configuring routes for a bridge, the only difference is 
that the sensor's streams come from inside the sensor, not from an 
external source.

Somewhat related, I was wondering if the whole routing table should be 
dropped. Now that the stream endpoints each have a configuration, 
similar to pads in current drivers, perhaps the routing information 
could be just part of the stream endpoints configuration.

So, stream 0 in pad 0 could have a config field that has the destination 
pad+stream tuple. The destination should, of course, have a matching but 
inverse destination configuration. The pad+stream tuples would be 
validated in the normal subdev validation step.

I haven't looked at this closely, so I'm not sure if this would help or not.

>> If the need is to find out that we're reaching the end of a pipeline
>> while going through links and routes, I'd rather have a pad flag to
>> indicate that the pad is an endpoint.

A pad could have both source streams and "routed" streams.

> Also, I can't see where this is being used, so maybe we can just drop it
> :-)

True, I seem to have dropped the use when I dropped my metadata hacks 
from the test sensor driver. But I think the flag, or something similar, 
is needed if this information is in the routing data (or whatever we 
rename it to).

  Tomi
