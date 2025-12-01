Return-Path: <linux-media+bounces-47978-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A56FC98107
	for <lists+linux-media@lfdr.de>; Mon, 01 Dec 2025 16:35:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2C1764E1AC4
	for <lists+linux-media@lfdr.de>; Mon,  1 Dec 2025 15:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14AA33321C2;
	Mon,  1 Dec 2025 15:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RkZn4UFK"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7374036D518
	for <linux-media@vger.kernel.org>; Mon,  1 Dec 2025 15:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764603327; cv=none; b=K03LISX6ew2sJe5gJAvsqJsfq47gWDfEPVeQBEiSE+r/+m5jToTSGR+f578Qo78BDmd17O/325U0n1tpYDaue2lN7w3jV/+FxkvUoGJRmumNf/O/yQOw5SZE8iAo34WiuxkYLra/rSW+Hd+P6DH2Yoy0c0F5udOD7VUzZWeCW7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764603327; c=relaxed/simple;
	bh=HaKKG9iJgbzxJE9ZVYc3azfI6gxwr+eXL6P0rxXSesk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=CvIQGxaoSlHjGALSZ0I/JkJlO7HJyAL0J3yW6KQ01sOSt63Y//sfJGQzqzUUVyWURtHycMj0ff+x2lxKxzhiR3ShZ8rGQXLFtgF+LX4ae2T/QnejBdixiEViFYby5kN1cyTuJlWX3Dh2yf1eG+KFiadcie5AmGiOaXVo54nczGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RkZn4UFK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E835C4CEF1;
	Mon,  1 Dec 2025 15:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764603326;
	bh=HaKKG9iJgbzxJE9ZVYc3azfI6gxwr+eXL6P0rxXSesk=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=RkZn4UFKurPUhRyK/NZZg6LH+87EneI6WjffDOUgUx7JScD65Ltwp9EbqSgUuJD9f
	 hJ/ZJ/aVMYJmtB+VwSeeRQjpzOBJlkuAKtfftQYEXhLOemEZiqcuIGOPvXLLYhwOcO
	 /Izs7k8LyosIpbIjFGovrCNZFwunnxVhYC72RRJETIxSKK+IIa3srbu9G8BkOdnudG
	 6dZs2K9rA37kPRDrQMkR0QC/INm0jYF08X8wmxacsWGITAi8+mNlasWayQHUrzxv8B
	 rbq7UJ0yoywqzGdkPvCVhSOAEXi3rI7WeRaQNOcY+cg2wB8lHjLkWpok3/TvFcqrQV
	 MBo/HHRsroTPA==
Message-ID: <ed704af1-3ec9-45a9-ac5b-c33fe9975822@kernel.org>
Date: Mon, 1 Dec 2025 16:35:23 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH 03/14] media: omap3isp: isp_video_mbus_to_pix/pix_to_mbus
 fixes
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
References: <cover.1760707611.git.hverkuil+cisco@kernel.org>
 <1e7330bdeb61565bef5254fa35717a260d9e4633.1760707611.git.hverkuil+cisco@kernel.org>
 <aPiMWDmqbYwBacpJ@kekkonen.localdomain>
 <4788af27-120e-4e01-b3d1-f30e466b4980@kernel.org>
 <aS1sVLJsj2iDk2qD@kekkonen.localdomain>
 <aS2QkaTtBq53AGeM@kekkonen.localdomain>
Content-Language: en-US, nl
In-Reply-To: <aS2QkaTtBq53AGeM@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/12/2025 13:56, Sakari Ailus wrote:
> On Mon, Dec 01, 2025 at 12:22:12PM +0200, Sakari Ailus wrote:
>> Hi Hans,
>>
>> On Mon, Dec 01, 2025 at 09:27:55AM +0100, Hans Verkuil wrote:
>>> Hi Sakari,
>>>
>>> On 22/10/2025 09:48, Sakari Ailus wrote:
>>>> Hi Hans,
>>>>
>>>> Thanks for the set.
>>>>
>>>> On Fri, Oct 17, 2025 at 03:26:40PM +0200, Hans Verkuil wrote:
>>>>> The isp_video_mbus_to_pix/pix_to_mbus functions did not take
>>>>> the last empty entry { 0, } of the formats array into account.
>>>>>
>>>>> As a result, isp_video_mbus_to_pix would accept code 0 and
>>>>> isp_video_pix_to_mbus would select code 0 if no match was found.
>>>>>
>>>>> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
>>>>> ---
>>>>>  drivers/media/platform/ti/omap3isp/ispvideo.c | 6 +++---
>>>>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/drivers/media/platform/ti/omap3isp/ispvideo.c b/drivers/media/platform/ti/omap3isp/ispvideo.c
>>>>> index 46609045e2c8..864d38140b87 100644
>>>>> --- a/drivers/media/platform/ti/omap3isp/ispvideo.c
>>>>> +++ b/drivers/media/platform/ti/omap3isp/ispvideo.c
>>>>> @@ -148,12 +148,12 @@ static unsigned int isp_video_mbus_to_pix(const struct isp_video *video,
>>>>>  	pix->width = mbus->width;
>>>>>  	pix->height = mbus->height;
>>>>>  
>>>>> -	for (i = 0; i < ARRAY_SIZE(formats); ++i) {
>>>>> +	for (i = 0; i < ARRAY_SIZE(formats) - 1; ++i) {
>>>>
>>>> As it seems all users of the formats array depend on the size of the array
>>>> and not its contents, could we remove the sentinel entry from the array
>>>> instead?
>>>
>>> Probably, but see this comment just before the sentinel in the array:
>>>
>>>         /* Empty entry to catch the unsupported pixel code (0) used by the CCDC
>>>          * module and avoid NULL pointer dereferences.
>>>          */
>>>         { 0, }
>>>
>>> Now, I wonder if this comment is out of date, since I don't see code 0 being used
>>> by CDDC. If you can confirm that that's indeed the case, then I can drop the sentinel.
>>
>> Yes, please!
> 
> Actually it's omap3isp_video_format_info() I understand ispccdc.c relies
> not to return NULL. I might add a separate variable for that, to get rid of
> this obscure arrangement.

So ispccdc.c can call omap3isp_video_format_info with a code value of 0?
Can you give an example where that happens? If true, then this feels very
fragile.

Regards,

	Hans

> 
> You could also add:
> 
> Fixes: c51364cafa26 ("[media] omap3isp: ccdc: Add YUV input formats support")
> 


