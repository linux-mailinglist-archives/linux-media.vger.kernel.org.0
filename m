Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE8443C28FC
	for <lists+linux-media@lfdr.de>; Fri,  9 Jul 2021 20:26:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229546AbhGIS2w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Jul 2021 14:28:52 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:46440 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbhGIS2w (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Jul 2021 14:28:52 -0400
Received: from [192.168.1.136] (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 950B7E7;
        Fri,  9 Jul 2021 20:26:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1625855167;
        bh=3UWC6QRjC/V9po3UsFog9fzW1K0lBXUKVl8tAp7mkOY=;
        h=From:To:Cc:References:Subject:Date:In-Reply-To:From;
        b=sE1racV8yI5TEQhDz6pvOGqNDo4l2p9gA1uSM1TmqW62ncMuL0yo9uM9BPg+/62hr
         A7isYeYbzd8rpujEN9nHrb4pxNmEByWuwoY+vRbcHkDhD0gYNbf33oQnva9XPdYirl
         x+vS7PTNk2neOTfB/glrmHmhw8+emRIP2XCY8M2k=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
References: <20210524104408.599645-1-tomi.valkeinen@ideasonboard.com>
 <YLwReuwLm7S/4hgz@pendragon.ideasonboard.com>
 <20210709151821.ogra3s2ulnsvkyqa@uno.localdomain>
Subject: Re: [PATCH v7 00/27] v4l: subdev internal routing and streams
Message-ID: <9b6ce019-8e38-886a-0c61-6f437ca9a915@ideasonboard.com>
Date:   Fri, 9 Jul 2021 21:26:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210709151821.ogra3s2ulnsvkyqa@uno.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On 09/07/2021 18:18, Jacopo Mondi wrote:
> Hi Tomi, Laurent,
> 
> On Sun, Jun 06, 2021 at 03:06:18AM +0300, Laurent Pinchart wrote:
>> Hi Hans, Sakari,
>>
>> We need your feedback on this series, at least on the general approach.
>> There are quite a few issues to be addressed, and it makes no sense to
>> invest time in this if you don't think this is a good direction.
>>
>> If anyone else wants to give feedback, speak now or forever hold your
>> peace :-)
> 
> Since you ask...
> 
> Having been involved a bit as the n-th person that tried to bring this
> to completion I spent a bit of time trying to recollect how the
> previous approach worked and how it compares to this one. Sorry if
> this goes in length.
> 
> I share Tomi's concern on one part of the previous version:
> 
> - The resulting device topology gets complicated in a non-trivial way.
> 
>    The typical example of having to model one image sensor that sends
>    embedded data and images with three sub-devices speaks for itself, I
>    presume.
> 
>    However in one way, I feel like this is somehow correct and provides
>    a more accurate representation of the actual sensor architecture.
>    Splitting a sensor into components would allow to better handle
>    devices which supports multiple buses (typically CSI-2 and
>    parallel) through the internal routing tables, and allows
>    better control of the components of the image sensor. [1]

I'm not sure what kind of setup you mean, but nothing prevents you from 
splitting devices into multiple subdevs with the new approach if it 
makes sense on your HW.

I have a parallel sensor that provides metadata on a line before the 
actual frame. I have hard time understanding why that should be split 
into 3 subdevs.

> - Multiplexed source pads do not accept a format or any other configuration
>    like crop/composing. Again this might seem odd, and it might be
>    worth considering if those pads shouldn't be made 'special' somehow,
>    but I again think it models a multiplexed bus quite accurately,
>    doesn't it ? It's weird that the format of, in example, a CSI-2
>    receiver source pad has to be propagated from the image sensor
>    entity sink pad, crossing two entities, two routes and one
>    media link. This makes rather complex to automate format propagation along
>    pipelines, not only when done by abusing media-ctl like most people do,
>    but also when done programmatically the task is not easy (I know I'm
>    contradicting my [1] point here :)

Hmm, but is it easy in the kernel side, then? I didn't feel so with the 
previous version. The kernel needed to travel the graph back and forth 
"all the time", just to figure out what's going on and where.

If the userspace understands the HW topology (as it more or less must), 
and it configures the routes (as it has to), and sets the formats on 
certain subdevs, then I don't see that it would have any issues in 
propagating the formats.

>    Also link validation is of course a bit more complex as shown by
>    731facccc987 ("v4l: subdev: Take routing information into account in link validation")
>    which was part of the previous series, but it's totally up to the
>    core..
> 
> Moving everything to the pads by adding a 'stream' field basically
> makes all pads potentially multiplexed, reducing the problem of format
> configuration/validation to a 1-to-1 {pad, stream} pair validation
> which allows to collapse the topology and maintain the current one.

Yes. I think I have problem understanding the counter arguments as I 
don't really see a difference with a) two subdevs, each with two 
non-multiplexed pads, linked 1-to-1 and b) two subdevs, each with one 
multiplexed pad, with two routes.

There is one particular issue I had with the previous version, which I 
think is a big reason I like the new approach:

I'm using TI CAL driver, which already exists in upstreams and supports 
both non-MC and MC-without-streams. Adding support for streams, i.e 
supporting non-MC, MC-without-streams and MC-with-streams made the 
driver an unholy mess (including a new module parameter to enable 
streams). With the new approach, the changes were relatively minor, as 
MC with and without streams are really the same thing.

With the previous approach you couldn't e.g. have a CSI2-RX bridge 
driver that would support both old, non-multiplexed CSI2 sensor drivers 
and multiplexed CSI2 sensor drivers. Unless you had something like the 
module parameter mentioned above. Or perhaps a DT property to define 
which mode the pad is in.

Also, one problem is that I really only have a single multiplexed HW 
setup, which limits my testing and the way I see multiplexed streams. 
That setup is "luckily" not the simplest one:

SoC CSI-2 RX <-> FPDLink Deserializer <-> FPDLink Serializer <-> Sensor

4 serializer+sensor cameras can be connected to the deserializer. Each 
sensor provides 2 streams (pixel and metadata). So I have 8 streams 
coming in to the SoC.

> Apart from the concerns expressed by Laurent (which I share but only
> partially understand, as the implications of bulk moving the
> v4l2-subdev configuration API to be stream-aware are not totally clear
> to me yet) what I'm not convinced of is that now cross-entities
> "routes" (or "streams") on a multiplexed bus do require a format
> assigned, effectively exposing them to userspace, with the consequence
> that the format configuration influences the routes setup up to the
> point the two have to be kept consistent. The concept
> could even be extended to inter-entities routes, as you suggested the
> routing tables could even be dropped completely in this case, but I
> feel mixing routing and format setup is a bit a layer violation and
> forbids, in example, routing two streams to the same endpoint, which I
> feel will be required to perform DT multiplexing on the same virtual
> channel. The previous version had the multiplexed link configuration
> completely hidden from userspace and controlled solely by the routing API,
> which seems a tad more linear and offers more flexibility for drivers.
> 
> I'm not strongly pushing for one solution over the other, the only use
> case I can reason on at the moment is a simple single-stream VC
> multiplexing and both solutions works equally fine for that. This one
> is certainly simpler regarding the required device topology.
> 
> Btw Tomi, do you have examples of drivers ported to your new proposal ?

Yes. They're a bit messy, but I can share them with the next version. 
I'm currently fixing a lot of things, and making full use of the new 
v4l2_subdev_state.

   Tomi


