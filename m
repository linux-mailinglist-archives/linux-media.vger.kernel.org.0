Return-Path: <linux-media+bounces-11169-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFB48C049C
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2024 20:49:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E87EF28A29F
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2024 18:49:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B90BB12AACE;
	Wed,  8 May 2024 18:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Cf/H2OS3"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D4684A34;
	Wed,  8 May 2024 18:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715194144; cv=none; b=J0m486dj0Pa2UUwd0mPJ2/6VuwRl4PYq70gLqWBzRSBpHxaUyu32QWuYIRtCK+w2P8KdG2CTwpWWeheEYsC/k7549Ib7RowBjaEdko5v5B9YMdHn5NksI2tU7+AZq9GTB5xmdJAj4NBYb3zFCSKJTymUuFR+lCE+o0lNDX90UCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715194144; c=relaxed/simple;
	bh=8nrCecbMc+yAEnEAG8Zpdmpyw4tPQwyujJIRNwKuABI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t7lrAOUuf/jFCpJAtNH7/cSiJGYxLlS4DNqSMwOrjBGzjbz/o0h5r9ldSU5dy/W1n3+N2L9XV8kV4UBYxyfMIGv/DjJULVNbQQlj7fD3B5qET8rkCJ8dW414RhNCKzSiOjVfPYe2uvswvohtcKOoKZi0BdluvxMLWJe9sbm4TVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Cf/H2OS3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-152-88-126.elisa-laajakaista.fi [91.152.88.126])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C30453D5;
	Wed,  8 May 2024 20:48:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715194130;
	bh=8nrCecbMc+yAEnEAG8Zpdmpyw4tPQwyujJIRNwKuABI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Cf/H2OS3XhftO52H6rAdVVOXh6jBRZCnjH5buzeSA6+iXYBPxjrt7+pBmbb9mJSSg
	 mxp0zDCYVXM1lEDuxZhnAVTkUb3db1suvLouqIOtOXIq79Ivfm6gFQ0KLJD2WGWdLk
	 SgYth/fnGTRRQI3ziQKBJzFZM2Acaix8EO2Ed/lk=
Message-ID: <40962834-c8a5-4675-b567-a1a245864d5c@ideasonboard.com>
Date: Wed, 8 May 2024 21:48:49 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] media: v4l2-subdev: Provide const-aware subdev
 state accessors
To: Sakari Ailus <sakari.ailus@iki.fi>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Dafna Hirschfeld <dafna@fastmail.com>, linux-rockchip@lists.infradead.org
References: <20240507161907.27747-1-laurent.pinchart+renesas@ideasonboard.com>
 <20240507161907.27747-2-laurent.pinchart+renesas@ideasonboard.com>
 <ZjvIGDaAAGK0WJo1@valkosipuli.retiisi.eu>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <ZjvIGDaAAGK0WJo1@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/05/2024 21:44, Sakari Ailus wrote:
> Hi Laurent,
> 
> Thanks for the update.
> 
> This is starting to look very nice. A few comments below...
> 
> On Tue, May 07, 2024 at 07:19:06PM +0300, Laurent Pinchart wrote:
>> It would be useful to mark instances of v4l2_subdev_state structures as
>> const when code needs to access them read-only. This isn't currently
>> possible, as the v4l2_subdev_state_get_*() accessor functions take a
>> non-const pointer to the state.
>>
>> Use _Generic() to provide two different versions of the accessors, for
>> const and non-const states respectively. The former returns a const
>> pointer to the requested format, rectangle or interval, implementing
>> const-correctness. The latter returns a non-const pointer, preserving
>> the current behaviour for drivers.
>>
>> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>> ---
>> Changes since v2:
>>
>> - Specify types explicitly in _Generic() expression
>> - Fix cast of value to const pointer
>>
>> Changes since v1:
>>
>> - Wrap the accessors with _Generic() using a single macro instead of
>>    adding a _Generic() statement in each of them.
>> ---
>>   include/media/v4l2-subdev.h | 40 +++++++++++++++++++++++++------------
>>   1 file changed, 27 insertions(+), 13 deletions(-)
>>
>> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
>> index e30c463d90e5..cd3e9e2ebe4d 100644
>> --- a/include/media/v4l2-subdev.h
>> +++ b/include/media/v4l2-subdev.h
>> @@ -1326,6 +1326,16 @@ void v4l2_subdev_cleanup(struct v4l2_subdev *sd);
>>   #define __v4l2_subdev_state_gen_call(NAME, _1, ARG, ...)	\
>>   	__v4l2_subdev_state_get_ ## NAME ## ARG
>>   
>> +/*
>> + * A macro to constify the return value of the state accessors when the state
>> + * parameter is const.
>> + */
>> +#define __v4l2_subdev_state_constify_call(state, value)				\
> 
> This function just changes the return value constness. How about calling it
> e.g. __v4l2_subdev_state_constify_ret instead?
> 
> Either way,
> 
> Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

I tested this today on my branches, but apparently forgot to send the 
R-b. So here's mine also:

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

>> +	_Generic(state,								\
>> +		const struct v4l2_subdev_state *: (const typeof(*(value)) *)(value), \
>> +		struct v4l2_subdev_state *: (value)				\
>> +	)
>> +
>>   /**
>>    * v4l2_subdev_state_get_format() - Get pointer to a stream format
>>    * @state: subdevice state
>> @@ -1340,16 +1350,17 @@ void v4l2_subdev_cleanup(struct v4l2_subdev *sd);
>>    */
>>   /*
>>    * Wrap v4l2_subdev_state_get_format(), allowing the function to be called with
>> - * two or three arguments. The purpose of the __v4l2_subdev_state_get_format()
>> + * two or three arguments. The purpose of the __v4l2_subdev_state_gen_call()
>>    * macro below is to come up with the name of the function or macro to call,
>>    * using the last two arguments (_stream and _pad). The selected function or
>>    * macro is then called using the arguments specified by the caller. A similar
>>    * arrangement is used for v4l2_subdev_state_crop() and
>>    * v4l2_subdev_state_compose() below.
> 
> These function names are missing _get after the prefix.
> 
> Could you also add the interval function here, too?
> 
> The would fit well for a separate patch.
> 
>>    */
>> -#define v4l2_subdev_state_get_format(state, pad, ...)			\
>> -	__v4l2_subdev_state_gen_call(format, ##__VA_ARGS__, , _pad)	\
>> -		(state, pad, ##__VA_ARGS__)
>> +#define v4l2_subdev_state_get_format(state, pad, ...)				\
>> +	__v4l2_subdev_state_constify_call(state,				\
>> +		__v4l2_subdev_state_gen_call(format, ##__VA_ARGS__, , _pad)	\
>> +			((struct v4l2_subdev_state *)state, pad, ##__VA_ARGS__))
>>   #define __v4l2_subdev_state_get_format_pad(state, pad)	\
>>   	__v4l2_subdev_state_get_format(state, pad, 0)
>>   struct v4l2_mbus_framefmt *
>> @@ -1368,9 +1379,10 @@ __v4l2_subdev_state_get_format(struct v4l2_subdev_state *state,
>>    * For stream-unaware drivers the crop rectangle for the corresponding pad is
>>    * returned. If the pad does not exist, NULL is returned.
>>    */
>> -#define v4l2_subdev_state_get_crop(state, pad, ...)			\
>> -	__v4l2_subdev_state_gen_call(crop, ##__VA_ARGS__, , _pad)	\
>> -		(state, pad, ##__VA_ARGS__)
>> +#define v4l2_subdev_state_get_crop(state, pad, ...)				\
>> +	__v4l2_subdev_state_constify_call(state,				\
>> +		__v4l2_subdev_state_gen_call(crop, ##__VA_ARGS__, , _pad)	\
>> +			((struct v4l2_subdev_state *)state, pad, ##__VA_ARGS__))
>>   #define __v4l2_subdev_state_get_crop_pad(state, pad)	\
>>   	__v4l2_subdev_state_get_crop(state, pad, 0)
>>   struct v4l2_rect *
>> @@ -1389,9 +1401,10 @@ __v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
>>    * For stream-unaware drivers the compose rectangle for the corresponding pad is
>>    * returned. If the pad does not exist, NULL is returned.
>>    */
>> -#define v4l2_subdev_state_get_compose(state, pad, ...)			\
>> -	__v4l2_subdev_state_gen_call(compose, ##__VA_ARGS__, , _pad)	\
>> -		(state, pad, ##__VA_ARGS__)
>> +#define v4l2_subdev_state_get_compose(state, pad, ...)				\
>> +	__v4l2_subdev_state_constify_call(state,				\
>> +		__v4l2_subdev_state_gen_call(compose, ##__VA_ARGS__, , _pad)	\
>> +			((struct v4l2_subdev_state *)state, pad, ##__VA_ARGS__))
>>   #define __v4l2_subdev_state_get_compose_pad(state, pad)	\
>>   	__v4l2_subdev_state_get_compose(state, pad, 0)
>>   struct v4l2_rect *
>> @@ -1410,9 +1423,10 @@ __v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state,
>>    * For stream-unaware drivers the frame interval for the corresponding pad is
>>    * returned. If the pad does not exist, NULL is returned.
>>    */
>> -#define v4l2_subdev_state_get_interval(state, pad, ...)			\
>> -	__v4l2_subdev_state_gen_call(interval, ##__VA_ARGS__, , _pad)	\
>> -		(state, pad, ##__VA_ARGS__)
>> +#define v4l2_subdev_state_get_interval(state, pad, ...)				\
>> +	__v4l2_subdev_state_constify_call(state,				\
>> +		__v4l2_subdev_state_gen_call(interval, ##__VA_ARGS__, , _pad)	\
>> +			((struct v4l2_subdev_state *)state, pad, ##__VA_ARGS__))
>>   #define __v4l2_subdev_state_get_interval_pad(state, pad)	\
>>   	__v4l2_subdev_state_get_interval(state, pad, 0)
>>   struct v4l2_fract *
> 


