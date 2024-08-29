Return-Path: <linux-media+bounces-17092-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 296AA963C48
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 09:11:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B8EA1C22187
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 07:11:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEF1E16D306;
	Thu, 29 Aug 2024 07:11:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC1543154;
	Thu, 29 Aug 2024 07:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724915501; cv=none; b=JoORjtgebSk1WSiYvnk5Jc4CI0i9SLOR5SvmoO4oKn/yALYP50Ru9Xxws290vuGjzqId/3+osHdcWQ5oKvjO/y8RclQep45NLT/VJIXmBk9kF7gsSL9U+r1AZywylYmfbuS9kh1b5WksKUaeQrmdFSl0t61F497rFTToMAvbwxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724915501; c=relaxed/simple;
	bh=saaDAnL6YavX7QE+2A7ETfUYLF59g0dLsgdN8ahzGZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fKLJDq6oDLjbMFvS4B+PsdKMZFbjmicz1pRpgDjDz6y+lyO4FHHhp8Fu92JWwYrf9r7e8qkc5suLhe7A3abN5NirRw4vwDu0oQVCUU8roynZ263SSCd4iVhJRHEHZR1/QJ9Evwk2f7Pq40RByDsS7BWE8PQpWz4ahjzdpw6aILU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A4BBC4CEC1;
	Thu, 29 Aug 2024 07:11:40 +0000 (UTC)
Message-ID: <d78f8808-2583-4a73-952a-8dfdcdf9b6e0@xs4all.nl>
Date: Thu, 29 Aug 2024 09:11:38 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] media: videodev2.h: add V4L2_CAP_EDID
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: linux-media@vger.kernel.org, linux-input@vger.kernel.org,
 Erling Ljunggren <hljunggr@cisco.com>
References: <cover.1723190258.git.hverkuil-cisco@xs4all.nl>
 <485324508040defc0ba0fb211a6596dc65f2d994.1723190258.git.hverkuil-cisco@xs4all.nl>
 <CAPybu_2UFq6Rnyi+wPEGtXYLW5gF9a6yKiOBZwN95XymAxkxjQ@mail.gmail.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <CAPybu_2UFq6Rnyi+wPEGtXYLW5gF9a6yKiOBZwN95XymAxkxjQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/08/2024 14:51, Ricardo Ribalda Delgado wrote:
> Hi Hans
> 
> On Fri, Aug 9, 2024 at 10:14 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>
>> From: Erling Ljunggren <hljunggr@cisco.com>
>>
>> Add capability flag to indicate that the device is an EDID-only device.
>>
>> Signed-off-by: Erling Ljunggren <hljunggr@cisco.com>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> ---
>>  include/uapi/linux/videodev2.h | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>> index 4e91362da6da..987c821aed79 100644
>> --- a/include/uapi/linux/videodev2.h
>> +++ b/include/uapi/linux/videodev2.h
>> @@ -502,6 +502,7 @@ struct v4l2_capability {
>>  #define V4L2_CAP_META_CAPTURE          0x00800000  /* Is a metadata capture device */
>>
>>  #define V4L2_CAP_READWRITE              0x01000000  /* read/write systemcalls */
>> +#define V4L2_CAP_EDID                  0x02000000  /* Is an EDID-only device */
> 
> Would it make sense to add a check for "EDID-only", I mean, if the
> driver sets this cap, then it should not set V4L2_CAP_STREAMING or others.
> 
> The test could be in the core or even in v4l2-compliance.

Good point. It is easy to add this to v4l2-compliance.

I noticed that the v4l2 core doesn't check for invalid caps combinations. It is
left to v4l2-compliance to check that. So I think I'll keep the check there.

Regards,

	Hans

> 
> Regards!
> 
> 
>>  #define V4L2_CAP_STREAMING              0x04000000  /* streaming I/O ioctls */
>>  #define V4L2_CAP_META_OUTPUT           0x08000000  /* Is a metadata output device */
>>
>> --
>> 2.43.0
>>
>>
> 
> 
> --
> Ricardo Ribalda
> 


