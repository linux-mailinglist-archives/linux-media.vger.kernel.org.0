Return-Path: <linux-media+bounces-15137-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7679374FE
	for <lists+linux-media@lfdr.de>; Fri, 19 Jul 2024 10:26:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 349A51F21BFD
	for <lists+linux-media@lfdr.de>; Fri, 19 Jul 2024 08:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 139EC71747;
	Fri, 19 Jul 2024 08:26:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D08208BA
	for <linux-media@vger.kernel.org>; Fri, 19 Jul 2024 08:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721377566; cv=none; b=jpVHB3NVWQP1yfVTIP5yXbpB42vQRRX1Xf+e3hYQFunyI+GJDkn/WTu6MXdGUZfSOFonYdJKRlKOu5NILK3AJ9jomG701ztfqg3VQ5OzJxGzNRn4pdfshJELB8HS7KycX3Cb/Q8mY4M+mbJhhp5FAvln4KC+h4ekS5Z4nfVAUQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721377566; c=relaxed/simple;
	bh=2ogF1Ta3juDvvcxGH3LSoN35y4d7uoOJHy9UxTXYJ94=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=IDtqQJStKkCWIKjH4cB8C4ezU51nVBa9P5Ac0enMIq7nBtoVVasQZBVnxztjem0YouvRfE3ZLDR0Bl4x74++P2Qj6H6tNVDPfQzxohXLIrlEaXs8KwS/hKFbbq3hrWmsjX8wvcJThaRGEpsKNUuSY5rEAEa9kHSiWbTDbB4liDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD01EC32782;
	Fri, 19 Jul 2024 08:26:05 +0000 (UTC)
Message-ID: <6bf3acc7-aa08-4e80-840c-21c93ad25433@xs4all.nl>
Date: Fri, 19 Jul 2024 10:26:04 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] v4l-utils: fix potential crashing with 32-bit musl
From: Hans Verkuil <hverkuil@xs4all.nl>
To: Rosen Penev <rosenp@gmail.com>, linux-media@vger.kernel.org
References: <20240702193343.5742-1-rosenp@gmail.com>
 <20240702193343.5742-2-rosenp@gmail.com>
 <d44dffe8-0816-4a16-ad9f-578c2e481723@xs4all.nl>
Content-Language: en-US, nl
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <d44dffe8-0816-4a16-ad9f-578c2e481723@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/07/2024 09:25, Hans Verkuil wrote:
> Hi Rosen,
> 
> On 02/07/2024 21:33, Rosen Penev wrote:
>> Under musl, if a format string has an integer followed by %s, a mismatch
>> between types can cause the second half of the integer to be interpreted
>> by %s.
>>
>> Eg: printf("%d %s", 64bittype, string);
>>
>> will crash, especially on 32-bit big endian.
>>
>> The reason these are cast to __u64 is because time_t and suseconds_t
>> are 64-bit under musl, even on 32-bit platforms. __u64 helps avoid
>> any truncation issues that may or may not arise.
>>
>> Signed-off-by: Rosen Penev <rosenp@gmail.com>
>> ---
>>  utils/cec-follower/cec-follower.cpp | 2 +-
>>  utils/libv4l2util/v4l2_driver.c     | 6 +++---
>>  2 files changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/utils/cec-follower/cec-follower.cpp b/utils/cec-follower/cec-follower.cpp
>> index a7481aea..67e0d92b 100644
>> --- a/utils/cec-follower/cec-follower.cpp
>> +++ b/utils/cec-follower/cec-follower.cpp
>> @@ -354,7 +354,7 @@ void print_timers(struct node *node)
>>  			printf("source: %s, ", source.c_str());
>>  			if (t.recording_seq)
>>  				printf("rec-seq: 0x%x, ", t.recording_seq);
>> -			printf("needs: %ld %s\n", t.duration, "MB."); /* 1MB per second. */
>> +			printf("needs: %llu %s\n", (__u64)t.duration, "MB."); /* 1MB per second. */
>>  		}
>>  		printf("Total media space available for recording: ");
>>  		if (node->state.media_space_available >= 0)
> 
> I will drop this change, but I will keep the next change.
> 
> I'll explain more in my review of 4/4.

Actually, I decided to do this change differently by changing the
duration type to int instead of using time_t. There is no reason for
using time_t for this, since the duration is limited to 100*3600 seconds
anyway. So that solves this particular issue without the need for a cast.

I decided to accept 4/4 after all. I am a bit afraid that the same problem
will reoccur if new printf statements are added showing timestamps, since
this casting is quite fragile. But I don't really see a better approach.

Regards,

	Hans

> 
> Regards,
> 
> 	Hans
> 
>> diff --git a/utils/libv4l2util/v4l2_driver.c b/utils/libv4l2util/v4l2_driver.c
>> index 6b6366fa..51e97b61 100644
>> --- a/utils/libv4l2util/v4l2_driver.c
>> +++ b/utils/libv4l2util/v4l2_driver.c
>> @@ -174,13 +174,13 @@ static void prt_buf_info(char *name,struct v4l2_buffer *p)
>>  {
>>  	struct v4l2_timecode *tc=&p->timecode;
>>  
>> -	printf ("%s: %02ld:%02d:%02d.%08ld index=%d, type=%s, "
>> +	printf ("%s: %02llu:%02d:%02d.%08llu index=%d, type=%s, "
>>  		"bytesused=%d, flags=0x%08x, "
>>  		"field=%s, sequence=%d, memory=%s, offset=0x%08x, length=%d\n",
>> -		name, (p->timestamp.tv_sec/3600),
>> +		name, (__u64)(p->timestamp.tv_sec/3600),
>>  		(int)(p->timestamp.tv_sec/60)%60,
>>  		(int)(p->timestamp.tv_sec%60),
>> -		p->timestamp.tv_usec,
>> +		(__u64)p->timestamp.tv_usec,
>>  		p->index,
>>  		prt_names(p->type,v4l2_type_names),
>>  		p->bytesused,p->flags,
> 
> 


