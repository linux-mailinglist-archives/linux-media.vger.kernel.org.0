Return-Path: <linux-media+bounces-22036-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CE78B9D8C35
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 19:29:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 78765B24D89
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 18:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB6AD1B87F4;
	Mon, 25 Nov 2024 18:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O//fre4U"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592771B3943;
	Mon, 25 Nov 2024 18:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732559333; cv=none; b=B/azp2eDvkwNBap4RaZ7I/t1BfkEfY2cS5Bcm+IfwKH27Ww36KbYt9yo41bPBa3J79nf77BmXwhyoAD8/yLj9yvXG3nMnG7ewWPnqbMUIEYC4LS13HaFc+G8ErNS1rtINsLTd4/5lfDZ1TjCl5Dtgwub+ivDWlYzbtR5WNWHfnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732559333; c=relaxed/simple;
	bh=D8laCktWSzUlXhABkG7jKvUcmD7Be2rQ6+5JNtMNhSc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mxeJAD4ha8pBzPDUhLvc2cRLF1ExIlNakbwL03EqAFJULOEoHP6DijTlGjJuWuXNYCeHlR7+zJUn57C+pOqJR8h7IoLUJBTEt2YWVqfJpGS2h8rbQCqLdVNTJpksmZ1s1IdpiN7kekOGtu5jo9a2kc5vqwem5ZnTaNsDKej4sGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O//fre4U; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43162cf1eaaso60169615e9.0;
        Mon, 25 Nov 2024 10:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732559330; x=1733164130; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZyqdLHVZPxJDxwmJq7647HK+yLv6I3aLhcKHensnyPM=;
        b=O//fre4U5pFG1mER2vI2c+djY1i1zPZ0Hf8IlXXMOY2EDJscGOO2iWNboCO6XxRxLk
         6tqRcHra2liCOgY0ksCRsOMI5KGHjZ/mYZqJ3/7vMASC/5WJx6Ws8hV8kT04+3+TLrNp
         4JixD7+5s1s6H07nQGJ/pDGYmLyp9nn4TcJZvwjq7zTeaxTFV5kTrhxXwfeDP/mCTjEq
         WgAX7B7wKfa2jccAN99ADmvpLuyCcYfZrvI7jGY3kPX4P4fsXRB0lX6E97ZYuW4t3sT3
         5Nqr/eXmvL86jRdvui7tpxzAEQMw8PxbJN+ElsJ3mPyoEntW5nMGKI+bykz9pODOTo34
         zLYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732559330; x=1733164130;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZyqdLHVZPxJDxwmJq7647HK+yLv6I3aLhcKHensnyPM=;
        b=YwLjD30+4lz/HkF1nkZnG/0rpu3HXKfvtjzsKVKGXkuL0uOCqn4zIYBOCT59Z7ObdO
         FKdTMD/9C05kGDsvJ2mUoP54zYAaResz3ERByL8Xll+6YLAkIXBTvcx25VE6y5aaLBDD
         asNmygUebrsEZlUjYPSGjtZrFJRyKSPXIwNmAYYTz4jruWvt4Pcf3a5wA5zcPDU0D7nh
         b1gfe6TpNcbtxCrkZBZaT1Np3GVSm+9CAlJ2xLUENKsXBO3U6ZVKRTmMN54gfOl0/enz
         nRDOsjZNiboAM+elnCPXzbQxT6hJbnmPDRAsLpyBhonS7QKV6ivLh2v0oKWr49aOkbrE
         J1Hw==
X-Forwarded-Encrypted: i=1; AJvYcCUfyaDsLtAiuloSIPMb1x566ZBSYuamxerHnJU7TbbOReRx88K2B9FwwXrwgydxjQGE6biK85XvRSRRaA4=@vger.kernel.org, AJvYcCVVoIhOGsK8uDvrDSa0anPrddamfm0VM5syoVTfw+zuAIU6DRAdbsKN0NasFzUhshRNFgDySLRGCM+dhUc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZdiXdvxomDb+OG+Ci6BY24f5aT4E3ZFnBF/WOyx4WxCj6IJED
	pryDtLckrKsR1jq9v0zufbOf+RuByN/fhAdLXuq5BuzRK0dFOkrl
X-Gm-Gg: ASbGncvwjh7v/vLZVYDEGZiXYb5K0Uoyd0QBo9SJiAW8AObw51CitozkjWWbxb8FW+d
	qSWSKmOCvtFCbvMbwEcswaPPT5dYTN8K4tdBIOkY8jWpgkgZXDAWhnhYL7PLbJAU1bEN1FM1P1h
	Shh2z51ZiOg3JsXHfeitBn0l8ZMxZQLtSUJ5DHaTZ3uC80L0zr6CalUjp4jdwjfj0i8A+I0QVw+
	+4Lk/AFysLDxcsmz3W5c5eke3ZVlV5X9lprv4nLjIdrUw/Nu4c91oHW
X-Google-Smtp-Source: AGHT+IHSYDPM5gQJiCauc766rZd/ZvCZCpFfW6kx0MpEDo8T2UHbJ0ttiRqCdLS2Ut/Ssd1X6dus9g==
X-Received: by 2002:a05:600c:1909:b0:431:9a26:3cf6 with SMTP id 5b1f17b1804b1-433ce41047fmr150455505e9.4.1732559329502;
        Mon, 25 Nov 2024 10:28:49 -0800 (PST)
Received: from [192.168.0.100] ([188.24.69.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4349b70aa23sm77962825e9.14.2024.11.25.10.28.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 10:28:49 -0800 (PST)
Message-ID: <456ed6cb-dbcb-41da-b906-671f4e9255b9@gmail.com>
Date: Mon, 25 Nov 2024 20:28:49 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: v4l: subdev: Prevent NULL routes access
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 =?UTF-8?Q?Pawe=C5=82_Anikiel?= <panikiel@google.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241122143717.173344-1-demonsingur@gmail.com>
 <20241124064929.GE19381@pendragon.ideasonboard.com>
From: Cosmin Tanislav <demonsingur@gmail.com>
Content-Language: en-US
In-Reply-To: <20241124064929.GE19381@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/24/24 8:49 AM, Laurent Pinchart wrote:
> On Fri, Nov 22, 2024 at 04:37:12PM +0200, Cosmin Tanislav wrote:
>> When using v4l2_subdev_set_routing to set a subdev's routing, and the
>> passed routing.num_routes is 0, kmemdup is not called to populate the
>> routes of the new routing (which is fine, since we wouldn't want to pass
>> a possible NULL value to kmemdup).
>>
>> This results in subdev's routing.routes to be NULL.
>>
>> routing.routes is further used in some places without being guarded by
>> the same num_routes non-zero condition.
> 
> What other places is that ? Have you experienced a crash anywhere ?
> 

The other places are exactly the ones being fixed in this patch. I can
probably reword it if it's unclear.

>>
>> Fix it.
>>
> 
> A Fixes: tag would be good to help backporting.
> 
>> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
>> ---
>>   drivers/media/v4l2-core/v4l2-subdev.c | 46 +++++++++++++--------------
>>   1 file changed, 23 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
>> index cde1774c9098d..4f0eecd7fd66f 100644
>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
>> @@ -605,6 +605,23 @@ subdev_ioctl_get_state(struct v4l2_subdev *sd, struct v4l2_subdev_fh *subdev_fh,
>>   			     v4l2_subdev_get_unlocked_active_state(sd);
>>   }
>>   
>> +static void subdev_copy_krouting(struct v4l2_subdev_routing *routing,
>> +				 struct v4l2_subdev_krouting *krouting)
> 
> The second argument should be const.
> 

Will do for V2.

>> +{
>> +	memset(routing->reserved, 0, sizeof(routing->reserved));
>> +
>> +	if (!krouting->routes) {
>> +		routing->num_routes = 0;
>> +		return;
>> +	}
>> +
>> +	memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
>> +	       krouting->routes,
>> +	       min(krouting->num_routes, routing->len_routes) *
>> +	       sizeof(*krouting->routes));
>> +	routing->num_routes = krouting->num_routes;
>> +}
>> +
>>   static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>>   			    struct v4l2_subdev_state *state)
>>   {
>> @@ -976,7 +993,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>>   
>>   	case VIDIOC_SUBDEV_G_ROUTING: {
>>   		struct v4l2_subdev_routing *routing = arg;
>> -		struct v4l2_subdev_krouting *krouting;
>>   
>>   		if (!v4l2_subdev_enable_streams_api)
>>   			return -ENOIOCTLCMD;
>> @@ -984,15 +1000,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>>   		if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS))
>>   			return -ENOIOCTLCMD;
>>   
>> -		memset(routing->reserved, 0, sizeof(routing->reserved));
>> -
>> -		krouting = &state->routing;
>> -
>> -		memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
>> -		       krouting->routes,
>> -		       min(krouting->num_routes, routing->len_routes) *
>> -		       sizeof(*krouting->routes));
>> -		routing->num_routes = krouting->num_routes;
>> +		subdev_copy_krouting(routing, &state->routing);
>>   
>>   		return 0;
>>   	}
>> @@ -1016,8 +1024,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>>   		if (routing->num_routes > routing->len_routes)
>>   			return -EINVAL;
>>   
>> -		memset(routing->reserved, 0, sizeof(routing->reserved));
>> -
>>   		for (i = 0; i < routing->num_routes; ++i) {
>>   			const struct v4l2_subdev_route *route = &routes[i];
>>   			const struct media_pad *pads = sd->entity.pads;
>> @@ -1046,12 +1052,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>>   		 * the routing table.
>>   		 */
>>   		if (!v4l2_subdev_has_op(sd, pad, set_routing)) {
>> -			memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
>> -			       state->routing.routes,
>> -			       min(state->routing.num_routes, routing->len_routes) *
>> -			       sizeof(*state->routing.routes));
>> -			routing->num_routes = state->routing.num_routes;
>> -
>> +			subdev_copy_krouting(routing, &state->routing);
>>   			return 0;
>>   		}
>>   
>> @@ -1064,11 +1065,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>>   		if (rval < 0)
>>   			return rval;
>>   
>> -		memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
>> -		       state->routing.routes,
>> -		       min(state->routing.num_routes, routing->len_routes) *
>> -		       sizeof(*state->routing.routes));
>> -		routing->num_routes = state->routing.num_routes;
>> +		subdev_copy_krouting(routing, &state->routing);
>>   
>>   		return 0;
>>   	}
>> @@ -1956,6 +1953,9 @@ struct v4l2_subdev_route *
>>   __v4l2_subdev_next_active_route(const struct v4l2_subdev_krouting *routing,
>>   				struct v4l2_subdev_route *route)
>>   {
>> +	if (!routing->routes)
>> +		return NULL;
>> +
>>   	if (route)
>>   		++route;
>>   	else
> 


