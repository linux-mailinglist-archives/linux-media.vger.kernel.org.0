Return-Path: <linux-media+bounces-8489-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 99EAE89692C
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 10:44:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD5911C24E88
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 08:44:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E387E7640E;
	Wed,  3 Apr 2024 08:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Wg0IJFfU"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30F46F067
	for <linux-media@vger.kernel.org>; Wed,  3 Apr 2024 08:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712133787; cv=none; b=tCbsrX2485Kuu+VSnwTJhHFZWewR2W5x3FWw8gVxgY1CsakGxYS3WTE/S/pH4AE4eIkmta2NuwmuGOq44KqIQiTlS6TpA8s50YJjIVY+LRjPScjDjcMJl60RrLkeOwlNQ67q1NEacAZAGLT4jhoY1J6XfWTcaQ6kbMi4TmuoEDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712133787; c=relaxed/simple;
	bh=iFcgk4lxs4lIYw2yohtOps4xdpiyTl6l3gWquzmAlOk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jIR56IMdr9iIfSPeljA5D0roTWcxISqxLmq6rhpPHb3WbxZHOHuiqloulHX0VQgMVwvGnkdW2EfbzcMSyodMoUdsBgzVkfjlkNNyDBOK9SJRuUMeVlzvveQdMiMAAUFqhP9OPWl3nrAagWRCKzfa7omFaMy0vu9HcTo8wSo2OK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Wg0IJFfU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-154-34-181.elisa-laajakaista.fi [91.154.34.181])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 035A8674;
	Wed,  3 Apr 2024 10:42:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712133747;
	bh=iFcgk4lxs4lIYw2yohtOps4xdpiyTl6l3gWquzmAlOk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Wg0IJFfU9GD1SK7LWnp7yxy+obju5PbSNFioeHuR/y0M5IHDr/h5niS34KsY8H4Ed
	 Sg+jfTctQTQsmAij2fy539vHvf86mzWXSuPoUJXVWsNZk9Y79Y73nq3I0qVucK7/RS
	 QeJJ+xvSsV7rItNw5LZh8lhC2EBFBAPA/ZaDncMc=
Message-ID: <129d17fc-a26d-4b79-adef-f76b0e457c00@ideasonboard.com>
Date: Wed, 3 Apr 2024 11:43:01 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v4l-utils] [PATCH 1/8] utils: media-ctl: Print MUST_CONNECT pad
 flags
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Gregor Jasny
 <gjasny@googlemail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20240402000033.4007-1-laurent.pinchart@ideasonboard.com>
 <20240402000033.4007-2-laurent.pinchart@ideasonboard.com>
 <20240403084034.GA4168@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20240403084034.GA4168@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/04/2024 11:40, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Tue, Apr 02, 2024 at 03:00:26AM +0300, Laurent Pinchart wrote:
>> From: Sakari Ailus <sakari.ailus@linux.intel.com>
>>
>> Print the MUST_CONNECT pad flag for each pad.
>>
>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>> ---
>>   utils/media-ctl/media-ctl.c | 50 +++++++++++++++++++++----------------
>>   1 file changed, 28 insertions(+), 22 deletions(-)
>>
>> diff --git a/utils/media-ctl/media-ctl.c b/utils/media-ctl/media-ctl.c
>> index 2081f111f2db..1b40552253f1 100644
>> --- a/utils/media-ctl/media-ctl.c
>> +++ b/utils/media-ctl/media-ctl.c
>> @@ -368,26 +368,6 @@ static const char *media_entity_subtype_to_string(unsigned type)
>>   	}
>>   }
>>   
>> -static const char *media_pad_type_to_string(unsigned flag)
>> -{
>> -	static const struct {
>> -		__u32 flag;
>> -		const char *name;
>> -	} flags[] = {
>> -		{ MEDIA_PAD_FL_SINK, "Sink" },
>> -		{ MEDIA_PAD_FL_SOURCE, "Source" },
>> -	};
>> -
>> -	unsigned int i;
>> -
>> -	for (i = 0; i < ARRAY_SIZE(flags); i++) {
>> -		if (flags[i].flag & flag)
>> -			return flags[i].name;
>> -	}
>> -
>> -	return "Unknown";
>> -}
>> -
>>   static void media_print_topology_dot(struct media_device *media)
>>   {
>>   	unsigned int nents = media_get_entities_count(media);
>> @@ -525,6 +505,25 @@ static void media_print_pad_text(struct media_entity *entity,
>>   		v4l2_subdev_print_subdev_dv(entity);
>>   }
>>   
>> +static unsigned int weight(uint32_t word)
>> +{
>> +	unsigned int w = 0, i;
>> +
>> +	for (i = 0; i < sizeof(word) << 3; i++, word >>= 1)
>> +		w += word & 1U;
>> +
>> +	return w;
>> +}
>> +
>> +static const char *comma(uint32_t flag, uint32_t prev_flags, uint32_t flags)
>> +{
>> +	static const char *empty = "", *comma = ", ";
>> +	if (!(flag & flags))
>> +		return empty;
>> +
>> +	return weight(prev_flags & flags) ? comma : empty;
> 
> Unless I'm mistaken, we can write this
> 
> 	return prev_flags & flags ? comma : empty;
> 
> and drop the weight function.
> 
>> +}
>> +
>>   static void media_print_topology_text_entity(struct media_device *media,
>>   					     struct media_entity *entity)
>>   {
>> @@ -567,8 +566,15 @@ static void media_print_topology_text_entity(struct media_device *media,
>>   	for (j = 0; j < info->pads; j++) {
>>   		const struct media_pad *pad = media_entity_get_pad(entity, j);
>>   
>> -		printf("\tpad%u: %s\n", j, media_pad_type_to_string(pad->flags));
>> -
>> +		printf("\tpad%u: %s%s%s%s%s\n", j,
>> +		       pad->flags & MEDIA_PAD_FL_SINK ? "Sink" : "",
>> +		       comma(MEDIA_PAD_FL_SOURCE, MEDIA_PAD_FL_SINK,
>> +			     pad->flags),
>> +		       pad->flags & MEDIA_PAD_FL_SOURCE ? "Source" : "",
>> +		       comma(MEDIA_PAD_FL_MUST_CONNECT,
>> +			     MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE,
>> +			     pad->flags),
>> +		       pad->flags & MEDIA_PAD_FL_MUST_CONNECT ? "Must connect" : "");
> 
> To be honest, this looks overly complicated. How about printing the
> flags with a loop ?

I was just about to reply that this looks a bit too "smart" to me... I'd 
prefer just a simple loop here for readability's and maintainability's 
sake, even if it's not as optimal.

  Tomi


