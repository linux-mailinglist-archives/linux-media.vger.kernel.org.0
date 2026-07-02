Return-Path: <linux-media+bounces-66403-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5GHTDhWoRmp5bAsAu9opvQ
	(envelope-from <linux-media+bounces-66403-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 20:04:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D040E6FBD14
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 20:04:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=II1oN4rZ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66403-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-66403-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E78CD3077536
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 18:01:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 980B23A544E;
	Thu,  2 Jul 2026 18:01:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D44309F1B;
	Thu,  2 Jul 2026 18:01:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783015267; cv=none; b=pE5RNvC4W1qiCUfnr/6kK2V+dGk/qqa2xWB3M1q9D+jCf068NlxyWw2UjfaiBJkZE70iKgcpk/8mFpB51oYT9wLtCK8hqNyIgZ6Jz2fp0mKIyRwdaA3kzq/2bHYMcdm9Ylt5kmXH3YdP/c6jYgzYGNMPwRKcR8jlfj7encC+r24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783015267; c=relaxed/simple;
	bh=VtyDJbLbTiQeYmoeYP3TyFHBRcK1ulyIGM5vRJttk2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NBV0c+aISs5HMHsh7BAm+jd0+XePx/kNEpCD33CxsCKlR9CgobjPM6NQ+UO+Sea9vRwZAJvqdRLBh9bF7Nd32YQ9Qga3eSzAAskQDRfVRTvp5GskSdxHfMjoWfyNsGoWu1kcaplTDH0qRISzIxDee/7qBzWM4DnNHuo5pyTiAj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=II1oN4rZ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F5721F000E9;
	Thu,  2 Jul 2026 18:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783015265;
	bh=WaK4fZmAKTrP8LMWAebdOHxCUUufUTOfK3/teLKpIzs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=II1oN4rZYTFQ2wW7+ZuxxhRpY4lY4No1EoyqBkKehFkKViRoKiMT3+cXL7340mn4p
	 8TtzaCqBAnHFybGtQSan8o90OCpcKj/EfDZDTTer0QRa4lVqY/C+HDXoHiYxELExgJ
	 ZE4KgrR0cFT41/gW+NZ4x5Mq5Yd01gpi9WWyURaEnZPfDoklCOmCste7CAC18J5t4Z
	 +VDNCR9YXsg6rJtux4txetyE3tp9ucyKGeIze6P0PseziMfQVekaYLHWCOSvtUyozQ
	 PoiWr7CjKi+ajF7PD5jjR1PC8YD1W3Gn0KBNJWUdHZI6iRTqsjlIN0cEDLJ46pESrv
	 V/Vbwi0TrI4Dg==
Message-ID: <7486b9fa-e49a-4723-b00c-755aa6ed5b14@kernel.org>
Date: Thu, 2 Jul 2026 20:01:01 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] platform: int3472: discrete: con_id vana for Sony
 IMX471 as power enable
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tarang Raval <tarang.raval@siliconsignals.io>, Kate Hsuan
 <hpa@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>, Serin Yeh <serin.yeh@intel.com>,
 Damjan Georgievski <gdamjan@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, computman <anis@talbi.fr>,
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
 <c7634571-4682-41d5-aa9d-8b965d641d51@kernel.org>
 <akT2CSCbaR0a3BMA@kekkonen.localdomain>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <akT2CSCbaR0a3BMA@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66403-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:tarang.raval@siliconsignals.io,m:hpa@redhat.com,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:serin.yeh@intel.com,m:gdamjan@gmail.com,m:kieran.bingham@ideasonboard.com,m:anis@talbi.fr,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dan.scally@ideasonboard.com,m:ilpo.jarvinen@linux.intel.com,m:platform-driver-x86@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[hansg@kernel.org,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[siliconsignals.io,redhat.com,kernel.org,intel.com,gmail.com,ideasonboard.com,talbi.fr,vger.kernel.org,linux.intel.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hansg@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D040E6FBD14

Hi,

On 1-Jul-26 13:12, Sakari Ailus wrote:
> Hi Hans,
> 
> On Wed, Jul 01, 2026 at 01:01:58PM +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 1-Jul-26 08:19, Tarang Raval wrote:
>>> Hi Hans,                                                                       
>>>                                                                                
>>>> On 30-Jun-26 09:32, Tarang Raval wrote:                                      
>>>>> Hi Kate,                                                                   
>>>>>                                                                            
>>>>>> Update the con_id for the Sony IMX471 sensor to "vana" to serve as the    
>>>>>> power enable. Additionally, the HID values SONY471A and TBE20A0, both     
>>>>>> associated with the IMX471 image sensor, have been identified on Lenovo   
>>>>>> laptops.                                                                  
>>>>>>                                                                           
>>>>>> Signed-off-by: Kate Hsuan <hpa@redhat.com>                                
>>>>>                                                                            
>>>>> Thanks, looks good.                                                        
>>>>>                                                                            
>>>>> Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>                 
>>>>                                                                              
>>>> Hmm, the imx471 driver is still pending upstream:                            
>>>>                                                                              
>>>> https://lore.kernel.org/linux-media/20260629074026.35490-5-hpa@redhat.com/   
>>>>                                                                              
>>>> As part of this series.                                                      
>>>>                                                                              
>>>> Please just use the standardized "avdd" in that driver instead               
>>>> of "vana" (which also seems to refer to the analog supply vdd,               
>>>> which is what avdd stands for).                                              
>>>>                                                                              
>>>> Then this whole patch is unnecessary and can be dropped from                 
>>>> this series.                                                                 
>>>                                                                                
>>> The regulator name "vana" comes directly from the Sony IMX471 sensor           
>>> datasheet, which typically refers to the analog supply voltage. Using the      
>>> datasheet name helps keep the driver consistent with the hardware              
>>> documentation and makes it easier to cross-reference.                          
>>>                                                                                
>>> as per my understanding, the more standardized way is to use the regulator     
>>> name as per the sensor datasheet. Therefore, I respectfully disagree with 
>>> your suggestion.                                                           
>>
>> As shown by the need for this patch on x86 at least because there
>> is no devicetree it greatly helps if all Linux sensor drivers use
>> standardized names for their regulators rather then using the exact name
>> from the datasheet which often is not very consistent.
>>
>> And "avdd" is the name we've standardized on for this, so lets use that:
>>
>> hans@shalem:~/projects/linux$ grep -l '"vana"' drivers/media/i2c/*.c | wc -l
>> 4
>> hans@shalem:~/projects/linux$ grep -l '"avdd"' drivers/media/i2c/*.c | wc -l
>> 36
>>
>> The alternative is needing to add more and more quirks as different
>> sensors are used, which is not great.
> 
> I do agree that having a constant name for the regulators would be
> beneficial for the int3472 driver. Still, if, and presumably, when that
> sensor gets DT support, the bindings will use the regulator name from the
> datasheet.
> 
> Let's just use the datasheet name now and add the few lines needed to the
> int3472 driver and avoid the churn in the future. There's a limited number
> of sensor drivers that need this after all.

Ok, if your happy with using "vana" + an int3472 quirk, that works
for me.

Regards,

Hans




