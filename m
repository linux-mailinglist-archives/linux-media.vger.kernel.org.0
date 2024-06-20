Return-Path: <linux-media+bounces-13772-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C9390FD3C
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 09:02:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 832E01C21021
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 07:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A56E442078;
	Thu, 20 Jun 2024 07:02:16 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B849383A1;
	Thu, 20 Jun 2024 07:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718866936; cv=none; b=q9RAxa1C1MxqDlSYibt/p6iJl5yOnPcP5L6MTm2uxOBqE7Ir0Djz6nRx45HwvNI7sxz6oVqciCeHlBq0DRRtic5wKfXSrCoDja2N8G9oSWPOLNXQrjnF8KqElr+B1YyyZbmB13gRjwAa+G5l2rwg5gtBV+DbQMMOHS1wSKJiYGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718866936; c=relaxed/simple;
	bh=AealPBdcZaSiVB9cv/AKFY4jv0XcBgPimgYhrBI83sM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fwrrQ2Dcv1JkkLf0iHPYK6pVTelgFeQmweTITVboO1sfh7HqO9J++0f2Z6HH9dhupvSA1274NCwLKL0UX2nzVK5McXKjqGiFnSoX7rCC6xQVt0WZOmMposH8MOV3KA5IW6ymRbTkygYYePxhr5sY2ffC40aU+ua6UYjfBu5qMco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2636CC32781;
	Thu, 20 Jun 2024 07:02:11 +0000 (UTC)
Message-ID: <904289bb-96a0-4a0d-9046-96acd8843b98@xs4all.nl>
Date: Thu, 20 Jun 2024 09:02:10 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 03/13] media: v4l2-jpeg: Export reference quantization
 and huffman tables
To: Devarsh Thakkar <devarsht@ti.com>, mchehab@kernel.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.gaignard@collabora.com, sebastian.fricke@collabora.com
Cc: laurent.pinchart@ideasonboard.com, praneeth@ti.com, nm@ti.com,
 vigneshr@ti.com, a-bhatia1@ti.com, j-luthra@ti.com, b-brnich@ti.com,
 detheridge@ti.com, p-mantena@ti.com, vijayp@ti.com, andrzej.p@collabora.com,
 nicolas@ndufresne.ca, Markus Elfring <Markus.Elfring@web.de>
References: <20240607131900.3535250-1-devarsht@ti.com>
 <20240607132831.3551333-1-devarsht@ti.com>
 <59866428-342b-4ba4-a7c7-2df1477aa7e6@xs4all.nl>
 <e948cea7-d5c7-a7e6-d921-ad7c2f93cd5a@ti.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <e948cea7-d5c7-a7e6-d921-ad7c2f93cd5a@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/06/2024 16:19, Devarsh Thakkar wrote:
> Hi Hans, Sebastian,
> 
> Thanks for the review Hans.
> 
> On 13/06/24 15:38, Hans Verkuil wrote:
>> Hi Devarsh,
> 
> [..]
>>
>> Why make this so complicated?
>>
>> Just do this:
>>
>> const u8 v4l2_jpeg_table_luma_qt[V4L2_JPEG_PIXELS_IN_BLOCK] = {
>> 	16, 11, 10, 16,  24,  40,  51,  61,
>> 	12, 12, 14, 19,  26,  58,  60,  55,
>> 	14, 13, 16, 24,  40,  57,  69,  56,
>> 	14, 17, 22, 29,  51,  87,  80,  62,
>> 	18, 22, 37, 56,  68, 109, 103,  77,
>> 	24, 35, 55, 64,  81, 104, 113,  92,
>> 	49, 64, 78, 87, 103, 121, 120, 101,
>> 	72, 92, 95, 98, 112, 100, 103,  99
>> };
>> EXPORT_SYMBOL_GPL(v4l2_jpeg_table_luma_qt);
>>
>> and in the header add:
>>
>> extern const u8 v4l2_jpeg_table_luma_qt[V4L2_JPEG_PIXELS_IN_BLOCK];
>>
>> Same for the other tables.
>>
>> And in the header add:
>>
>> extern const u8 v4l2_jpeg_table_luma_qt[V4L2_JPEG_PIXELS_IN_BLOCK];
>>
>> It's similar to e.g. 'const u8 v4l2_vp9_kf_y_mode_prob[10][10][9];'
>> in v4l2-vp9.c/h.
>>
>> It also ensures that the compiler knows the size of each array,
>> so it can detect out-of-bounds errors. And you can drop the accessor
>> functions, as there is no longer any need for that.
>>
>> I really want this out-of-bounds detection, the code as it is now is too
>> risky. So please make a v14.
>>
> 
> Yes agreed, initially I had a similar thought to use extern declared variables
> but somehow couldn't find any good examples as you shared so thought to have
> wrapper functions but anyways have fixed this in v14.
>  >> +
>>> +static const u8 chroma_qt[] = {
>>
>> Just to make it clear: don't use [] here, use the actual define for the
>> array size. That way you get a compiler warning if you missed an entry
>> in the initialization.
>>
>> Apologies for the late review, I only noticed this when I checked the
>> pull request.
>>
> 
> No worries for the delay, these are good comments and I have fixed them in v14
> [1] appreciate if it's possible to have a quick review and if it looks good
> possible to pull it in this week's RC cycle ? This will help me plan to send
> math.h and rounding related patches (patch 7/13 to patch 12/13) from v13 [2]
> as separate series more quickly as aligned. Also there was a new suggestion
> [3] to use guard(mutex) in remove method, I was thinking to evaluate that and
> pull that in as a separate patchset after this series gets merged and include
> as part of next set of patches involving math.h and rounding macros discussed
> above so that I can test them all together all at once since I am running a
> bunch of manual and automated tests so wanted to reduce the cycles, will that
> be fine ?

I've reviewed v14 3/6, so Sebastian when Sebastian posts a new PR I can process
it.

Ignore any reviews by Markus Elfring, he's a troll.

Regards,

	Hans

