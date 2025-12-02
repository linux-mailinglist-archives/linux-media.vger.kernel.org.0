Return-Path: <linux-media+bounces-48015-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8840EC9A690
	for <lists+linux-media@lfdr.de>; Tue, 02 Dec 2025 08:18:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8E85B4E2B00
	for <lists+linux-media@lfdr.de>; Tue,  2 Dec 2025 07:18:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1542245019;
	Tue,  2 Dec 2025 07:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pQLLNBYr"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C40235BE2
	for <linux-media@vger.kernel.org>; Tue,  2 Dec 2025 07:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764659883; cv=none; b=JBYSiJeo4FORnJ3c73/Vj/i250Hwcd2suvhPLK3tkFMspz8gHiifzA3jmZrmSb08OMa+2u801LLBI5NzjGXdM+1bKFRoRnfCqYPivARHkwlJEsXqKIJ0LPEbGcOsA5pES3NbKQhUmYzImptS2nflunrguvPHiQ1gvO6JEUge/hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764659883; c=relaxed/simple;
	bh=UtS+3zQqgh81RgonVH9si/Isd5ikI25m4qfxeoySlG8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=XaUhc/dtxyCJg2+arePDsilg6NteEnVFVDTazbjbbS6gi73VSlsfLhM/DENSi12G/lmPYQSAKGHlZF+rZEgyGr6NcgYr2iEtnnJMBExpEOWnP2P2DXeqxASATppe4s7mgiBSfODulxiPDLUMKuQRpcvY+oqsVFpx3tXKTfw4j00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pQLLNBYr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10F28C4CEF1;
	Tue,  2 Dec 2025 07:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764659882;
	bh=UtS+3zQqgh81RgonVH9si/Isd5ikI25m4qfxeoySlG8=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=pQLLNBYrAa11RhZWMZvvvdNvd0WXftHZHAG98pOSld+7pGDqmanGdKAxflNfsSldN
	 Z/ehQcDFEYe7NafAJ5EYExSpddCCpu8n2KsFx4kIKDYMqhqJIM2D4aIyQm6+YyB8r+
	 pfbX8pgt1ruWt3x1NV3eztPukOss6NfV6Unzm74r6XwyNvviDUtzy/aRxNTu7W2Dmc
	 jOM6zw3/f3T67AdW7iQFqcJwh3RKOq4zvEXsrsgPjzKop+egwFPK01svWKXbbklnQW
	 y8JZBd/vC9sPiMQzzMOh/1rsh9aq/fDRTFJRtc2mBpT9r10auRxepC3Jlr2GDjQijC
	 YZT4+OAFgVNIg==
Message-ID: <ed7dda8f-e0a5-4edb-aec1-b2d2f3f787d5@kernel.org>
Date: Tue, 2 Dec 2025 08:18:00 +0100
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
 <ed704af1-3ec9-45a9-ac5b-c33fe9975822@kernel.org>
 <aS3FukU32gxMKuwt@kekkonen.localdomain>
Content-Language: en-US, nl
In-Reply-To: <aS3FukU32gxMKuwt@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/12/2025 17:43, Sakari Ailus wrote:
> Hi Hans,
> 
> On Mon, Dec 01, 2025 at 04:35:23PM +0100, Hans Verkuil wrote:
>> On 01/12/2025 13:56, Sakari Ailus wrote:
>>> On Mon, Dec 01, 2025 at 12:22:12PM +0200, Sakari Ailus wrote:
>>>> Hi Hans,
>>>>
>>>> On Mon, Dec 01, 2025 at 09:27:55AM +0100, Hans Verkuil wrote:
>>>>> Hi Sakari,
>>>>>
>>>>> On 22/10/2025 09:48, Sakari Ailus wrote:
>>>>>> Hi Hans,
>>>>>>
>>>>>> Thanks for the set.
>>>>>>
>>>>>> On Fri, Oct 17, 2025 at 03:26:40PM +0200, Hans Verkuil wrote:
>>>>>>> The isp_video_mbus_to_pix/pix_to_mbus functions did not take
>>>>>>> the last empty entry { 0, } of the formats array into account.
>>>>>>>
>>>>>>> As a result, isp_video_mbus_to_pix would accept code 0 and
>>>>>>> isp_video_pix_to_mbus would select code 0 if no match was found.
>>>>>>>
>>>>>>> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
>>>>>>> ---
>>>>>>>  drivers/media/platform/ti/omap3isp/ispvideo.c | 6 +++---
>>>>>>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/media/platform/ti/omap3isp/ispvideo.c b/drivers/media/platform/ti/omap3isp/ispvideo.c
>>>>>>> index 46609045e2c8..864d38140b87 100644
>>>>>>> --- a/drivers/media/platform/ti/omap3isp/ispvideo.c
>>>>>>> +++ b/drivers/media/platform/ti/omap3isp/ispvideo.c
>>>>>>> @@ -148,12 +148,12 @@ static unsigned int isp_video_mbus_to_pix(const struct isp_video *video,
>>>>>>>  	pix->width = mbus->width;
>>>>>>>  	pix->height = mbus->height;
>>>>>>>  
>>>>>>> -	for (i = 0; i < ARRAY_SIZE(formats); ++i) {
>>>>>>> +	for (i = 0; i < ARRAY_SIZE(formats) - 1; ++i) {
>>>>>>
>>>>>> As it seems all users of the formats array depend on the size of the array
>>>>>> and not its contents, could we remove the sentinel entry from the array
>>>>>> instead?
>>>>>
>>>>> Probably, but see this comment just before the sentinel in the array:
>>>>>
>>>>>         /* Empty entry to catch the unsupported pixel code (0) used by the CCDC
>>>>>          * module and avoid NULL pointer dereferences.
>>>>>          */
>>>>>         { 0, }
>>>>>
>>>>> Now, I wonder if this comment is out of date, since I don't see code 0 being used
>>>>> by CDDC. If you can confirm that that's indeed the case, then I can drop the sentinel.
>>>>
>>>> Yes, please!
>>>
>>> Actually it's omap3isp_video_format_info() I understand ispccdc.c relies
>>> not to return NULL. I might add a separate variable for that, to get rid of
>>> this obscure arrangement.
>>
>> So ispccdc.c can call omap3isp_video_format_info with a code value of 0?
>> Can you give an example where that happens? If true, then this feels very
>> fragile.
> 
> It is fragile, yes. I can't point to a place where this happens but the
> driver relies on every mbus code ever used to be on that table, and this
> not holding will result in NULL dereference. In other words, it's not easy
> at all to figure out it won't happen.
> 

I think I prefer to stick to my original patch, keeping the sentinel.

I don't want to spend too much time on this, it was just a bunch of patches
that I accumulated while working on the vb2 wait_prepare/finish callback
removal. There are a lot more issues that v4l2-compliance found that I
never spend time on.

I'll put the sentinel back and post a new v2 series later this week.

Regards,

	Hans

