Return-Path: <linux-media+bounces-38171-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E72BDB0C3DE
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 14:11:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1ABFE16E712
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 12:11:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBBFC2BEC45;
	Mon, 21 Jul 2025 12:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qezWnXNP"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A952BE7C3;
	Mon, 21 Jul 2025 12:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753099871; cv=none; b=pvsQ6/IixQXnlR95M8y0G9HaTLevmJCYzfgb4KHafTY9ZhPM4aL3J1CKO7JUJXmtZiAU8dhOvRYojs+ygsuGelknIHWKzvBnfKOIq469cW2zHX64NePaipYKBb1g9tb8rNzKOhNqQgJjb3KHwRKkI812OwsyYe+tePKEw9EIDFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753099871; c=relaxed/simple;
	bh=s1T9AgxxIkLbemmLilwtit2Ge3Ig7i5TVJhOYobr2XE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ecC1PzVfboJc9YN/SaXi8aLc8PBarsAOc2Jp1PxQ9SaaNNez2mKugakYdj78HxTG+NF4EoTKqPxEG7U0as+PlrUKFqUSiv/grvmOhm45MDpFDvFgtqoM3HFXxNiQ2c7DHZG8DhvN+JhMNRIUAjqy07JgHP9piUjOFejEPRPRXGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qezWnXNP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99CA4C4CEED;
	Mon, 21 Jul 2025 12:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753099870;
	bh=s1T9AgxxIkLbemmLilwtit2Ge3Ig7i5TVJhOYobr2XE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qezWnXNPcVcbIz6RFEg0AXMgsiOK3BOSZN8eEMFF+wAEW6FuVVXhNdvHA+L9mmMkR
	 gx7Gh5KZj5JeY3gfZAZpWY4tVJYRtlZL5CxfaLUNqxjZdtzbdzQbxgIRIVhig6EBA1
	 aT9iv5MVhcSkNNVetaz068vbQl154Wknz9fIzcyZSAKYN4uULeRZ+byXujp8ajZA6E
	 ebKjCc378XbLPtIwKO4NsPN1WXlqmCASyLkJ7znOnaXNHc+IXGakJX3sg8gg/sI+7K
	 bfb98BCCFSZ9IqPekVtjS6wVYwr5QNUjxjHHkWMy6ApEFBjfyszb/1z96eqgaFDcin
	 hE9bh5PbD3g6A==
Message-ID: <cd399cfa-92b6-427c-a4fb-e11364ae57dc@kernel.org>
Date: Mon, 21 Jul 2025 14:11:07 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] media: uvcvideo: avoid variable shadowing in
 uvc_ctrl_cleanup_fh
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Desnes Nunes <desnesn@redhat.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@kernel.org
References: <20250708144628.273384-1-desnesn@redhat.com>
 <20250708164358.GB23181@pendragon.ideasonboard.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250708164358.GB23181@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 8-Jul-25 6:43 PM, Laurent Pinchart wrote:
> Hi Desnes,
> 
> Thank you for the patch.
> 
> On Tue, Jul 08, 2025 at 11:46:28AM -0300, Desnes Nunes wrote:
>> This avoids a variable loop shadowing occurring between the local loop
>> iterating through the uvc_entity's controls and the global one going
>> through the pending async controls of the file handle
> 
> s/handle/handle./
> 
> (easily handled when applying the patch, no need to resend)
> 
>> Cc: stable@kernel.org
>> Fixes: 10acb9101355 ("media: uvcvideo: Increase/decrease the PM counter per IOCTL")
> 
> I think CI will ask for Cc to go after Fixes. If so that can also be
> handled when applying.
> 
>> Signed-off-by: Desnes Nunes <desnesn@redhat.com>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thank you both for the patch and review. I've amended the commit
message while applying as suggested by Laurent and I have merged
this into:

https://gitlab.freedesktop.org/linux-media/users/uvc/-/commits/for-next/

Regards,

Hans





>> ---
>>  drivers/media/usb/uvc/uvc_ctrl.c | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
>> index 303b7509ec47..6b9486749c3f 100644
>> --- a/drivers/media/usb/uvc/uvc_ctrl.c
>> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
>> @@ -3299,7 +3299,6 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
>>  void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
>>  {
>>  	struct uvc_entity *entity;
>> -	int i;
>>  
>>  	guard(mutex)(&handle->chain->ctrl_mutex);
>>  
>> @@ -3317,7 +3316,7 @@ void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
>>  	if (!WARN_ON(handle->pending_async_ctrls))
>>  		return;
>>  
>> -	for (i = 0; i < handle->pending_async_ctrls; i++)
>> +	for (unsigned int i = 0; i < handle->pending_async_ctrls; i++)
>>  		uvc_pm_put(handle->stream->dev);
>>  }
>>  
> 


