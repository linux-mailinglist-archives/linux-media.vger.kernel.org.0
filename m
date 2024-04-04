Return-Path: <linux-media+bounces-8637-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E078E8984FB
	for <lists+linux-media@lfdr.de>; Thu,  4 Apr 2024 12:29:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 16B871C21947
	for <lists+linux-media@lfdr.de>; Thu,  4 Apr 2024 10:29:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E093F763F7;
	Thu,  4 Apr 2024 10:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IW4b4LuP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCF07602F
	for <linux-media@vger.kernel.org>; Thu,  4 Apr 2024 10:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712226568; cv=none; b=k7mNKzzbhZQYpxZGOXzGCN7teJpvJfaSQa6DTnrXafQXRx9vqLUQoQbGM8/D5pDnlAu5Bh/YoE7q3bXO2g05fjm//gGhCKBYbuxrE7P0DnjpOjQkZ9EAGHE5z0u/1a3WhMBQDKKW6nkiFmCLgsM+hbP6L7AfPl1ano+C6oOkxlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712226568; c=relaxed/simple;
	bh=Vn94OqTE/sUKdiKF3DyH793uHWHC37sG+iD4HkNwlKM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ofi8xIxaagLpJkpB4NofTkMEXW9ViXXC50dYeVwcIlVnRNP2qEhpOIpZS3cJa89Qli6Ad51QWWPmY0a+iKBSOiA28JDZsTLpN+JHAbYQAjBoItLxdY+uXrIRyCR4ZqOYyxyfrF1fs3l/MhiDt7q4zpKXyDzfBBU0b96kWBtOVv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IW4b4LuP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-154-34-181.elisa-laajakaista.fi [91.154.34.181])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9E1741A2;
	Thu,  4 Apr 2024 12:28:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712226526;
	bh=Vn94OqTE/sUKdiKF3DyH793uHWHC37sG+iD4HkNwlKM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IW4b4LuPOmOCpIwxWmZIxjnvyUvc/iS3yBJXIAxLuw4gPO10RvrIB36bYBdfOjLmk
	 tGhfF1Ozg14zzIy0k82i17np8vxBK1fClBfJkaqUflDMgFdBwBsxwSQa2tTpmL069u
	 YItH3x28Lv3BRBNbR9axEi464LyfpjP+Bx+TknHY=
Message-ID: <c3136ff6-93fe-42b0-8f16-0afe3e638d71@ideasonboard.com>
Date: Thu, 4 Apr 2024 13:29:20 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 03/15] media: i2c: imx219: Report internal routes to
 userspace
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, Dave Stevenson
 <dave.stevenson@raspberrypi.com>,
 David Plowman <david.plowman@raspberrypi.com>,
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Naushir Patuck <naush@raspberrypi.com>, kernel-list@raspberrypi.com,
 linux-rpi-kernel@lists.infradead.org,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com
References: <20240324220854.15010-1-laurent.pinchart@ideasonboard.com>
 <20240324220854.15010-4-laurent.pinchart@ideasonboard.com>
 <b0a698f5-9c5c-456c-8e3d-1a3cd1628dc3@ideasonboard.com>
 <Zg5k8Ont0rf5D7xy@kekkonen.localdomain>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <Zg5k8Ont0rf5D7xy@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/04/2024 11:29, Sakari Ailus wrote:
> Moi,
> 
> On Thu, Apr 04, 2024 at 11:19:22AM +0300, Tomi Valkeinen wrote:
>> Hi,
>>
>> On 25/03/2024 00:08, Laurent Pinchart wrote:
>>> Usage of internal pads creates a route internal to the subdev, and the
>>> V4L2 camera sensor API requires such routes to be reported to userspace.
>>> Create the route in the .init_state() operation.
>>>
>>> Internal routing support requires stream support, so set the
>>> V4L2_SUBDEV_FL_HAS_STREAMS flag and switch formats and selection
>>
>> It's V4L2_SUBDEV_FL_STREAMS (not sure why, as the other flags have _HAS_).
> 
> Didn't you write the patch to add the flag? :-)

Se joka vanhoja muistelee, on ite se.

> In any case, I think the flat is used for a very similar purpose than the
> rest, I'd add "HAS_" here, too. I can write a patch.
> 
>>
>>> rectangles access from pads to streams. As the route is immutable,
>>> there's no need to implement the .set_routing() operation, and we can
>>> hardcode the sink and source stream IDs to 0.
>>
>> This doesn't implement .enable/disable_streams(), but continues using
>> .s_stream(). My understanding was that streams support requires
>> .enable/disable_streams(), but obviously the framework doesn't require this
>> at the moment.
>>
>> I encountered this while working on improving the
>> v4l2_subdev_enable/disable_streams(), and my code assumed that only
>> implementing .s_stream() means no streams support.
>>
>> So, how is it?
>>
>> I would say that .s_stream() is legacy, and streams enabled subdevices
>> should not implement (only) it. Streams enabled subdevices can use
>> v4l2_subdev_s_stream_helper for .s_stream, in addition to implementing
>> .enable/disable_streams().
> 
> I agree, if the driver supports streams, then it needs to implement the
> appropriate callbacks (i.e. not s_stream).

I've created a patch to check this. I'll send it shortly.

  Tomi

> 
>>
>>   Tomi
>>
>>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>>> ---
>>> Changes since v6:
>>>
>>> - Drop change to get format API in imx219_set_ctrl()
>>> - Fix function name in commit message
>>> - Set V4L2_SUBDEV_ROUTE_FL_IMMUTABLE flag on route
>>> ---
>>>    drivers/media/i2c/imx219.c | 24 +++++++++++++++++++++++-
>>>    1 file changed, 23 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
>>> index 817bf192e4d9..6602250834be 100644
>>> --- a/drivers/media/i2c/imx219.c
>>> +++ b/drivers/media/i2c/imx219.c
>>> @@ -993,15 +993,36 @@ static int imx219_get_selection(struct v4l2_subdev *sd,
>>>    static int imx219_init_state(struct v4l2_subdev *sd,
>>>    			     struct v4l2_subdev_state *state)
>>>    {
>>> +	struct v4l2_subdev_route routes[1] = {
>>> +		{
>>> +			.sink_pad = IMX219_PAD_IMAGE,
>>> +			.sink_stream = 0,
>>> +			.source_pad = IMX219_PAD_SOURCE,
>>> +			.source_stream = 0,
>>> +			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE |
>>> +				 V4L2_SUBDEV_ROUTE_FL_IMMUTABLE,
>>> +		},
>>> +	};
>>> +	struct v4l2_subdev_krouting routing = {
>>> +		.len_routes = ARRAY_SIZE(routes),
>>> +		.num_routes = ARRAY_SIZE(routes),
>>> +		.routes = routes,
>>> +	};
>>>    	struct v4l2_subdev_format fmt = {
>>>    		.which = V4L2_SUBDEV_FORMAT_TRY,
>>>    		.pad = IMX219_PAD_SOURCE,
>>> +		.stream = 0,
>>>    		.format = {
>>>    			.code = MEDIA_BUS_FMT_SRGGB10_1X10,
>>>    			.width = supported_modes[0].width,
>>>    			.height = supported_modes[0].height,
>>>    		},
>>>    	};
>>> +	int ret;
>>> +
>>> +	ret = v4l2_subdev_set_routing(sd, state, &routing);
>>> +	if (ret)
>>> +		return ret;
>>>    	imx219_set_pad_format(sd, state, &fmt);
>>> @@ -1260,7 +1281,8 @@ static int imx219_probe(struct i2c_client *client)
>>>    	/* Initialize subdev */
>>>    	imx219->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
>>> -			    V4L2_SUBDEV_FL_HAS_EVENTS;
>>> +			    V4L2_SUBDEV_FL_HAS_EVENTS |
>>> +			    V4L2_SUBDEV_FL_STREAMS;
>>>    	imx219->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
>>>    	/*
>>
> 


