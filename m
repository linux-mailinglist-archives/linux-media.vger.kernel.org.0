Return-Path: <linux-media+bounces-36996-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B926AFB3D3
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 15:02:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2A7B1AA4AC2
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 13:02:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BC5A29DB96;
	Mon,  7 Jul 2025 13:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GRpRqP7U"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF99229B21C;
	Mon,  7 Jul 2025 13:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751893298; cv=none; b=MUdwvUzfrlrrXBXazumUenInF+Ilz4Rj8nTHYyVxdGr4dLrkM3LBQeWX3ILnfkVXAXaS+o1ze5qv6tj13ie85+GJ8R6q268BRO6e6eNgiVJv+04/Wzgl7AurBhhDCUDPJuPCVSU91UjiU0T+ifhPPu3jqLzKqChILVSryGLKZaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751893298; c=relaxed/simple;
	bh=wJXCaxn9WklumXZYfIw9ExdkXBuXXrm+vZD0eBogR/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=swZhBBNc+o+W6fc/TivmlZBw8kJemhF6cyAuJ4w/QMHmQxuC+VifEqJSwCNhRSWI3ZzpHt9XQ8ycjy3RfLXUFl7yCqOL2biC4F85qIzz9zK/zNthHJc6BJmDeDsnXK0u2lcnBad15Zzjef/+erTDN3bDyDzhzNdOBlCcCSZ1lrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GRpRqP7U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4D9CC4CEF5;
	Mon,  7 Jul 2025 13:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751893297;
	bh=wJXCaxn9WklumXZYfIw9ExdkXBuXXrm+vZD0eBogR/s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GRpRqP7Uq4EN7ZMT0lM7eCigLt/rHIPN1L7MMz9u6GY/TYiQJroLbcZ3puvWbsMkR
	 V98PF3onyk7z/K1UrKdhSgr1B6T7TOAdJkzD5Fa0PHgxHOTnHBmxzrv/XCnBcN/021
	 zHsFnOrhIE4Ms6YsHY9ec+1Zd+ooHBB/8rx6JrSUQ11mMCNaZgZPs41jNJBnhHr9uz
	 m5+vcGlJAD1U5xH/kTMDHwcTBgluuoZIxf08c3Kfkbq20qPh0PUjBpBQLD4HAeKQSI
	 viFcIGRlFl4yEK3dAVXKM1R/BjTQS8/Al6OWks65bybPbgzXPHC3pTlVT0rK+08x/U
	 Xj2s9H+MEMzmw==
Message-ID: <5fb10c0d-eb85-40d1-97f2-9e36d4d1f62c@kernel.org>
Date: Mon, 7 Jul 2025 15:01:33 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: uvcvideo: avoid variable shadowing in
 uvc_ctrl_cleanup_fh
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Desnes Nunes <desnesn@redhat.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@kernel.org
References: <20250701172556.117872-1-desnesn@redhat.com>
 <45b69c6c-e8d5-4b71-9759-cd76eb1a7258@kernel.org>
 <20250707125028.GB12247@pendragon.ideasonboard.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250707125028.GB12247@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 7-Jul-25 14:50, Laurent Pinchart wrote:
> Hi Hans,
> 
> On Mon, Jul 07, 2025 at 02:43:09PM +0200, Hans de Goede wrote:
>> On 1-Jul-25 19:25, Desnes Nunes wrote:
>>> This avoids a variable loop shadowing occurring between the local loop
>>> iterating through the uvc_entity's controls and the global one going
>>> through the pending async controls of the file handle
>>>
>>> Cc: stable@kernel.org
>>> Fixes: 10acb9101355 ("media: uvcvideo: Increase/decrease the PM counter per IOCTL")
>>> Signed-off-by: Desnes Nunes <desnesn@redhat.com>
>>
>> Thank you for the new version.
>>
>> I've pushed this to uvc/for-next now:
>>
>> https://gitlab.freedesktop.org/linux-media/users/uvc/-/commits/for-next/
> 
> As mentioned during the review (see
> 20250701192928.GB16835@pendragon.ideasonboard.com), I still prefer local
> loop variables. Can we use that please ?

Ok, I'll drop this from for-next.

Desnes, can you prepare a v3 moving the toplevel declation
inside the other loop please ?

Regards,

Hans




>> Note I had to manually apply the patch because of it conflicting with:
>>
>> https://gitlab.freedesktop.org/linux-media/users/uvc/-/commit/2b1e8e9f7bb30204ddb42887c4e554c131f003c9
>>
>> So if you want this backported to stable you will need to send
>> the original version to stable your self.
>>
>> I plan to send a pull-request with the changes from for-next this Thursday.
>>
>>> ---
>>>  drivers/media/usb/uvc/uvc_ctrl.c | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
>>> index 44b6513c5264..532615d8484b 100644
>>> --- a/drivers/media/usb/uvc/uvc_ctrl.c
>>> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
>>> @@ -3260,7 +3260,7 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
>>>  void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
>>>  {
>>>  	struct uvc_entity *entity;
>>> -	int i;
>>> +	unsigned int i;
>>>  
>>>  	guard(mutex)(&handle->chain->ctrl_mutex);
>>>  
>>> @@ -3268,7 +3268,7 @@ void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
>>>  		return;
>>>  
>>>  	list_for_each_entry(entity, &handle->chain->dev->entities, list) {
>>> -		for (unsigned int i = 0; i < entity->ncontrols; ++i) {
>>> +		for (i = 0; i < entity->ncontrols; ++i) {
>>>  			if (entity->controls[i].handle != handle)
>>>  				continue;
>>>  			uvc_ctrl_set_handle(handle, &entity->controls[i], NULL);
>>
> 


