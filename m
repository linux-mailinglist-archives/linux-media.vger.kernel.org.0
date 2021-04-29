Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 937A136E8BD
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 12:28:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240376AbhD2K26 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Apr 2021 06:28:58 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48082 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232629AbhD2K25 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Apr 2021 06:28:57 -0400
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 779F5BC0;
        Thu, 29 Apr 2021 12:28:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1619692090;
        bh=CEToTHCOiuuzTtM61EY9ejqoMkSLy2X+nMEkQ/oaWdk=;
        h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=Drv4FKNOJjw9r3WKTjY56/dieexfgqU2OLW3Rxrt8U1FM9aFpU1lOQ86eAxRjT1Bl
         HKqPDt7kt7/VtPwGr8J7/pF0lWGKhHmPiDSdOJTN/D0KuLFG5/Oigr0nENphDvFZf+
         jRrE+cGXW9T61l8z1Lu9nVuIbSuZC2eTNEnbqq0I=
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20210427124523.990938-1-tomi.valkeinen@ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v6 00/24] v4l: subdev internal routing
Message-ID: <83d9ee08-0ff7-88b5-e633-4785a4220c9d@ideasonboard.com>
Date:   Thu, 29 Apr 2021 13:28:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210427124523.990938-1-tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 27/04/2021 15:44, Tomi Valkeinen wrote:
> Hi,
> 
> This is v6 of the series. Previous one can be found from:
> 
> https://lore.kernel.org/linux-media/20210415130450.421168-1-tomi.valkeinen@ideasonboard.com/
> 
> Changes to v5:
> - Dropped "v4l: mc: Add an S_ROUTING helper function for power state changes" as discussed
> - Added MEDIA_PAD_FL_MULTIPLEXED flag to indicate that a pad works in multiplexed mode
> - Documentation improvements
> - Renamed struct v4l2_mbus_frame_desc_entry_csi2 fields
> - Fixed setting routing->num_routes in G_ROUTING
> - Many smaller cosmetic changes as per comments
> 
> One bigger topic I didn't change is the in-kernel API for get/set routing.
> Currently the link validation needs to get the routing tables multiple times,
> each leading to memory allocations (and frees). A different API would allow the
> link validation to peek at the routing without any allocations, but I haven't
> solved that yet.
> 
> A simple solution would be to require a lock to be held when accessing the
> routing table, and making get_routing return a pointer to the driver's routing
> table. But this kind of API would be quite different than, say, get_fmt.
> 
> Another would be to keep the API, but have a state object during link
> validation, which would hold preallocated routing tables, so that link
> validation wouldn't need to allocate new ones for each get_routing call.
> 
> Anything we do here is a kernel internal change, so it's not super critical to
> solve it right away.

I decided to test the other approach: changing subdev format ioctls to 
work on a pad+stream tuple, instead of just on a pad. So essentially 
adding a 'stream' field (taking one u32 from the reserved area) to 
v4l2_subdev_format, v4l2_subdev_mbus_code_enum, and others. The current 
userspace sets the field to 0, to it makes sense even if with older 
userspace.

My branch is still quite messy, but this approach does give us some nice 
benefits:

- I was able to drop the whole "follow-the-stream-to-get-format" code. 
Link validation feels simpler.

- A sensor that provides pixel and metadata can be implemented in a 
single subdev, with a single source pad.

- It makes the configuration of subdevs self-contained.

- A subdev can do operations (like, say, scaling) with a stream, instead 
of having to split the subdev into multiple subdevs to get the 
non-multiplexed pads.

- I don't need the cal_streams_api parameter (introduced in another 
series for TI CAL driver), nor do I need the MEDIA_PAD_FL_MULTIPLEXED flag

- I can easily support a case where the subdev driver on one side of the 
link supports multiplexed streams and the other driver doesn't (as long 
as the multiplexed streams subdev's pad is configured for a single 
stream). Well, this would probably be possible with the previous 
approach also, but at last here it came kind of naturally.

Downsides:

- Need dynamic allocation for storing formats. It doesn't feel too bad, 
though, and it, of course, only affects the drivers that support routing 
and multiplexed streams. I do the reallocation in set_routing.

- TRY doesn't work, as there's no place to store the formats for 
streams. This needs the proposed change to pass subdev state, instead of 
just subdev pad state, to the various format ops.

- Possibly plenty of tooling changes to add support for streams

And I should perhaps add a subdev flag to indicate that a subdev 
supports multiple streams. This could at least be used in the ioctl 
handlers, rejecting stream field > 0 if the subdev does not support streams.

I'll continue working on this a bit to see how it goes, but I wanted to 
share this now to hear if there are any clear NACKs for the approach.

  Tomi
