Return-Path: <linux-media+bounces-66192-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NY7uM9n0RGr93woAu9opvQ
	(envelope-from <linux-media+bounces-66192-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 13:07:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6876EC8F1
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 13:07:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=TK5agZAt;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66192-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66192-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D6B5D30A6680
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 11:02:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3BEE43D50C;
	Wed,  1 Jul 2026 11:02:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF8A439006;
	Wed,  1 Jul 2026 11:02:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782903724; cv=none; b=ExsGmqVTEvyZZ3oTr1O24I/OWNzpqYqSA5hM6/hDQbGCxgCD/d8Qk/qFOAgi6xqv/X2b0PdKAZehubmS/5e748cmSlIdALKdBaoh4exZ4N4Vp+KqOYrFxRdeSubtGFzOnEBqLrDsh58SLjdvjFQCDEqhMCx4/sY8821OvSCiIEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782903724; c=relaxed/simple;
	bh=gPauPI/9fhjKIv+zHh4InusR8yG4d8qr+Y3ucsd24m4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pxz+60but4bM6/9FUpHMzNlNkyZfh7evyyjevJcfd2S4cL+9FNDddoCrtHGIkpP5M3h5GbvJo9EYk+RpvkmAvjVFyRUNewFWtdGWzR0xzeTTVqvVUQmMNSCOZGTf7YbbivkUXbNFNqw8UVMZvS5LVJ6+grG7DF/Ej1x84s734xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TK5agZAt; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85E8A1F000E9;
	Wed,  1 Jul 2026 11:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782903723;
	bh=YykEavimjxgypRXCeyiKw76UjGkQVu2lKItLt5Z0LKg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=TK5agZAtNpG68duqFSm/sqXzBv8eAKmTUVmJHy6Os4m7zEavHpJJxgptE/0CnC9dk
	 RujUhNe3tHfkBhRfi4Q5Y4UikruNO45bpkXRosSpJYecgFhPGrPV57nteTIk+yfeCJ
	 Jdn7PXA+rQoNTRBSTne/cULuL4zYhXBZBdeNu6fWhgiP+5ftGXkB+47zTts3uPJnMN
	 ThW9AJ3zsc+KF7wHkR+bTc9K+NmH3agnRBf7ZLTaaKwoaEy4Nde8o9flgl8q9jwsHh
	 YvsEXCn7LSw1vI5znqEz2Qd7k59Q+DxSQei6ucwILoGHsFz10hvfMjJY+DIa5BDSJG
	 6DDtYOKb4CmoA==
Message-ID: <c7634571-4682-41d5-aa9d-8b965d641d51@kernel.org>
Date: Wed, 1 Jul 2026 13:01:58 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] platform: int3472: discrete: con_id vana for Sony
 IMX471 as power enable
To: Tarang Raval <tarang.raval@siliconsignals.io>, Kate Hsuan
 <hpa@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Serin Yeh
 <serin.yeh@intel.com>, Damjan Georgievski <gdamjan@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: computman <anis@talbi.fr>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
References: <20260629074026.35490-1-hpa@redhat.com>
 <20260629074026.35490-4-hpa@redhat.com>
 <PN3P287MB18292C819793395D643D426A8BF72@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <49257d09-a2fd-4a9d-9479-4d2b5e0fb8a6@kernel.org>
 <PN3P287MB182945B5747452110940BEA08BF62@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <PN3P287MB182945B5747452110940BEA08BF62@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66192-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[siliconsignals.io,redhat.com,kernel.org,linux.intel.com,intel.com,gmail.com,ideasonboard.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:tarang.raval@siliconsignals.io,m:hpa@redhat.com,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:sakari.ailus@linux.intel.com,m:serin.yeh@intel.com,m:gdamjan@gmail.com,m:kieran.bingham@ideasonboard.com,m:anis@talbi.fr,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dan.scally@ideasonboard.com,m:ilpo.jarvinen@linux.intel.com,m:platform-driver-x86@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[hansg@kernel.org,linux-media@vger.kernel.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hansg@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3D6876EC8F1

Hi,

On 1-Jul-26 08:19, Tarang Raval wrote:
> Hi Hans,                                                                       
>                                                                                
>> On 30-Jun-26 09:32, Tarang Raval wrote:                                      
>>> Hi Kate,                                                                   
>>>                                                                            
>>>> Update the con_id for the Sony IMX471 sensor to "vana" to serve as the    
>>>> power enable. Additionally, the HID values SONY471A and TBE20A0, both     
>>>> associated with the IMX471 image sensor, have been identified on Lenovo   
>>>> laptops.                                                                  
>>>>                                                                           
>>>> Signed-off-by: Kate Hsuan <hpa@redhat.com>                                
>>>                                                                            
>>> Thanks, looks good.                                                        
>>>                                                                            
>>> Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>                 
>>                                                                              
>> Hmm, the imx471 driver is still pending upstream:                            
>>                                                                              
>> https://lore.kernel.org/linux-media/20260629074026.35490-5-hpa@redhat.com/   
>>                                                                              
>> As part of this series.                                                      
>>                                                                              
>> Please just use the standardized "avdd" in that driver instead               
>> of "vana" (which also seems to refer to the analog supply vdd,               
>> which is what avdd stands for).                                              
>>                                                                              
>> Then this whole patch is unnecessary and can be dropped from                 
>> this series.                                                                 
>                                                                                
> The regulator name "vana" comes directly from the Sony IMX471 sensor           
> datasheet, which typically refers to the analog supply voltage. Using the      
> datasheet name helps keep the driver consistent with the hardware              
> documentation and makes it easier to cross-reference.                          
>                                                                                
> as per my understanding, the more standardized way is to use the regulator     
> name as per the sensor datasheet. Therefore, I respectfully disagree with 
> your suggestion.                                                           

As shown by the need for this patch on x86 at least because there
is no devicetree it greatly helps if all Linux sensor drivers use
standardized names for their regulators rather then using the exact name
from the datasheet which often is not very consistent.

And "avdd" is the name we've standardized on for this, so lets use that:

hans@shalem:~/projects/linux$ grep -l '"vana"' drivers/media/i2c/*.c | wc -l
4
hans@shalem:~/projects/linux$ grep -l '"avdd"' drivers/media/i2c/*.c | wc -l
36

The alternative is needing to add more and more quirks as different
sensors are used, which is not great.

Regards,

Hans



