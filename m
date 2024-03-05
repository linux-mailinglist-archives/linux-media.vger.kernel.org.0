Return-Path: <linux-media+bounces-6500-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F5387261B
	for <lists+linux-media@lfdr.de>; Tue,  5 Mar 2024 19:01:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 627FC1C24AEF
	for <lists+linux-media@lfdr.de>; Tue,  5 Mar 2024 18:01:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57AC217BCD;
	Tue,  5 Mar 2024 18:01:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail.rmail.be (mail.rmail.be [85.234.218.189])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A59416427
	for <linux-media@vger.kernel.org>; Tue,  5 Mar 2024 18:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.234.218.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709661663; cv=none; b=krmBAVgU8VfGYg3LFtf/+eHJskhNYBbEcNaXfIqks9/vaYHPTt4Rm1Bcut9tYVugWXBr0ZkoMKBIIc8fcxwTuUTMs07sOQ4fQu+bIyS7+h3ByT955hbmwy5AX2bTp+XFNL2RqvmcwJPaCKvi/X7F05siylKk4Q1AapvCLLR7H34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709661663; c=relaxed/simple;
	bh=anH0/+RhzMzfmy0RPDfbpHz+ykEmbx2U9eJWAcdQu64=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=jf0sg47rmzrhG20mlwGiH5J5tFpqXoHhzXMMfwNPiU/GR1GKNWcluB/i07BSEMgQ5nmzzfleU9wPGkELX+TG3xuAOc7Dt+R2LNYbTmOe27NjZVZrphrruutaiRy2iiQtILkBzB9HlPxlRJkz1QRHOVrR1hQ3nBnZG24B/T9Aevw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rmail.be; spf=pass smtp.mailfrom=rmail.be; arc=none smtp.client-ip=85.234.218.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rmail.be
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rmail.be
Received: from mail.rmail.be (domotica.rmail.be [10.238.9.4])
	by mail.rmail.be (Postfix) with ESMTP id 5C3404C6F3;
	Tue,  5 Mar 2024 19:00:51 +0100 (CET)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 05 Mar 2024 19:00:51 +0100
From: Maarten <maarten@rmail.be>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 linux-media@vger.kernel.org, Kieran Bingham <kbingham@kernel.org>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>, Umang Jain
 <umang.jain@ideasonboard.com>, Dave Stevenson
 <dave.stevenson@raspberrypi.org>
Subject: Re: [RFC PATCH 01/13] staging: mmal-vchiq: Avoid use of bool in
 structures
In-Reply-To: <4d24fc4c-5e55-48c7-874c-a5138b5d284f@collabora.com>
References: <20240303152635.2762696-1-maarten@rmail.be>
 <20240303152635.2762696-2-maarten@rmail.be>
 <4d24fc4c-5e55-48c7-874c-a5138b5d284f@collabora.com>
Message-ID: <b51baf410b45d7fb065fa176db1d8fde@rmail.be>
X-Sender: maarten@rmail.be
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

Andrzej Pietrasiewicz schreef op 2024-03-04 08:30:
> Hi Maarten,
> 
> W dniu 3.03.2024 o 16:09, Maarten Vanraes pisze:
>> From: Dave Stevenson <dave.stevenson@raspberrypi.org>
>> 
>> Fixes up a checkpatch error "Avoid using bool structure members
>> because of possible alignment issues".
>> 
> 
> This commit message might be confusing, because...
> 
>> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
>> Signed-off-by: Maarten Vanraes <maarten@rmail.be>
>> ---
>>   drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c 
>> b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
>> index 890669f874d9..2e616604943d 100644
>> --- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
>> +++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
>> @@ -1983,7 +1983,7 @@ int vchiq_mmal_component_enable(struct 
>> vchiq_mmal_instance *instance,
>>     	ret = enable_component(instance, component);
>>   	if (ret == 0)
>> -		component->enabled = true;
>> +		component->enabled = 1;
> 
> ... what the patch changes is not a structure member, it is the value
> assigned (with a potential implicit cast) to a structure member.
> 
> Regards,
> 
> Andrzej
> 
>>     	mutex_unlock(&instance->vchiq_mutex);
>> 

I guess it's due to the "checkpatch", but I'll adapt the message in v2.

Thanks!

