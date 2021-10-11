Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3BFC4288A1
	for <lists+linux-media@lfdr.de>; Mon, 11 Oct 2021 10:21:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235066AbhJKIXY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Oct 2021 04:23:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234996AbhJKIXS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Oct 2021 04:23:18 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7BA0C061570
        for <linux-media@vger.kernel.org>; Mon, 11 Oct 2021 01:21:18 -0700 (PDT)
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BAF0B2BD;
        Mon, 11 Oct 2021 10:21:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1633940477;
        bh=V3MBNtS1YiI68zu81M4Jy/tWwJJciQWTJz45TsmX15A=;
        h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=Y/vLqGqEyurBNfqbJ8NBxGbcwy98WcSa0Akz1yNc222v7YuGyYbAQzV0KUk2hTBdh
         CJbVy1e4iu5cbzVynJrRE6UkgxwBbHbtvSQqXqWI74KSBh8o0tF2DlQcVnppUP3AaC
         sSwFt3Q7poNGScGADTEcfI9Qv4oqnDGvnxdeX2LI=
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
References: <20211005085750.138151-1-tomi.valkeinen@ideasonboard.com>
 <20211005085750.138151-34-tomi.valkeinen@ideasonboard.com>
 <YWL1cTmobr+RI/01@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v9 33/36] media: subdev: add "opposite" stream helper
 funcs
Message-ID: <0756f120-260a-cb56-fd7f-f707148bc3db@ideasonboard.com>
Date:   Mon, 11 Oct 2021 11:21:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YWL1cTmobr+RI/01@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/10/2021 17:15, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Tue, Oct 05, 2021 at 11:57:47AM +0300, Tomi Valkeinen wrote:
>> Add two helper functions to make dealing with streams easier:
>>
>> v4l2_state_find_opposite_end - given a routing table and a pad + stream,
>> return the pad + stream on the opposite side of the subdev.
>>
>> v4l2_state_get_opposite_stream_format - return a pointer to the format
>> on the pad + stream on the opposite side from the given pad + stream.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   drivers/media/v4l2-core/v4l2-subdev.c | 42 +++++++++++++++++++++++++++
>>   include/media/v4l2-subdev.h           | 32 ++++++++++++++++++++
>>   2 files changed, 74 insertions(+)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
>> index 37e2e1f907fc..9eeadad997c8 100644
>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
>> @@ -1484,3 +1484,45 @@ v4l2_state_get_stream_format(struct v4l2_subdev_state *state, unsigned int pad,
>>   	return NULL;
>>   }
>>   EXPORT_SYMBOL_GPL(v4l2_state_get_stream_format);
>> +
>> +int v4l2_state_find_opposite_end(struct v4l2_subdev_krouting *routing, u32 pad,
>> +				 u32 stream, u32 *other_pad, u32 *other_stream)
> 
> This function should take a state pointer given its name. I would also
> rename it to v4l2_subdev_state_find_opposite_end(). Same for
> v4l2_state_get_opposite_stream_format() which should be
> v4l2_subdev_state_get_opposite_stream_format().

It doesn't need the state. I think it's better to rename this to 
v4l2_routing_find_opposite_end(). Or 
v4l2_subdev_routing_find_opposite_end() if you want the "subdev" to be 
there.

>> +{
>> +	unsigned int i;
>> +
>> +	for (i = 0; i < routing->num_routes; ++i) {
>> +		struct v4l2_subdev_route *route = &routing->routes[i];
>> +
>> +		if (route->source_pad == pad &&
>> +		    route->source_stream == stream) {
>> +			*other_pad = route->sink_pad;
>> +			*other_stream = route->sink_stream;
> 
> Can we support other_stream being NULL ? When the subdev implements the
> routing API without multiplexed streams, the other_stream number will
> always be 0 and it would be nice if the caller didn't have to declare a
> placeholder variable.
> 
> There are less use cases for other_pad being NULL, but maybe we could
> also allow that for consistency reasons ? Up to you.

Sure. But are you sure the ignored stream is 0? Should the function 
verify that the stream is indeed 0 if other_stream is NULL?

For the pad, I don't know when it would be used, so it's perhaps better 
not to add that (as we can't have similar validation as for the stream).

  Tomi
