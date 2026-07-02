Return-Path: <linux-media+bounces-66404-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vaBXNqOoRmq7bAsAu9opvQ
	(envelope-from <linux-media+bounces-66404-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 20:06:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF776FBD69
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 20:06:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=RpsT4Vr9;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66404-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66404-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 19A1C3071E64
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 18:05:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 263073A5438;
	Thu,  2 Jul 2026 18:05:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE0D39DBD4;
	Thu,  2 Jul 2026 18:05:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783015530; cv=none; b=sEN2/LjKnvu7DvaYrHrjTJ81sETq215fPT6hcAXsQefb1vYPWR9dcNNTe0TZwfaeuW6sYTdf7tj/4Vyr+pNvIbJ5c7M588NE8pPpAYsxRgqgGX+6w3B2Qjir7lFcu6oZ1cB9J17K09E/ewBGd5hyWdIHWrbmpRxd1J59IPmRLyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783015530; c=relaxed/simple;
	bh=0dVNCTm51DdK5VWtlEP7rb79qihsr0VCN1qu719df8w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RFBIdQDjS0Tx3qsOs8isqv0PaZ7leM7bV3ZMN8kQadaUjT/jhXYMMsu8iDrLROwFnmpNQT80VJToagN5H4gkMyeUdojspBqUP1naYOOBvpJH/xv2dKAVbqWky/jCebBcDmbFpdD1QdCqJxaP8v9eAQE5z4Dd97dCKdtCRrARmW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RpsT4Vr9; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96B111F000E9;
	Thu,  2 Jul 2026 18:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783015529;
	bh=4YdgxBQuf7BVv5lkRPcTKn7mihP6VUcURlQnZnrJw1U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=RpsT4Vr9aW5tFGH0rg38tZQPFisIQsNBnRlBOKHWODvdeHsdyNAHgavaHfCbIneVc
	 rCWkYV3WGXsQnWPeWANZhrYZTl7z0Aio34b+16r58W7oGwNim0Rzzu/lWIUTBZamVX
	 LU/xnAUZa3mkYqZFjAxF2f6GeRbSYxGIxImcErlkA9dPSAIG/BgrFiA7deodGzEKGt
	 W1iZJko5+BMAtgqT4/bIhuRZlL7yQBMyR5GOfQ5SjbP8EG5sCp3G0MuPSfzkDlmYKO
	 LcYf8vM1gYO3kl/js2yoacryGKhEo7gHZbzPW3Ab3aZfjKrD8+BjJHG3zqZHXDkbvD
	 q5fqomCvhP4OA==
Message-ID: <d59e796b-fe53-4103-a94b-5ffba53246b9@kernel.org>
Date: Thu, 2 Jul 2026 20:05:25 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] platform: int3472: discrete: con_id vana for Sony
 IMX471 as power enable
To: Tarang Raval <tarang.raval@siliconsignals.io>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Kate Hsuan <hpa@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
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
 <PN3P287MB18296E80E1786B05F5ACF37E8BF62@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <PN3P287MB18296E80E1786B05F5ACF37E8BF62@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66404-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:tarang.raval@siliconsignals.io,m:sakari.ailus@linux.intel.com,m:hpa@redhat.com,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:serin.yeh@intel.com,m:gdamjan@gmail.com,m:kieran.bingham@ideasonboard.com,m:anis@talbi.fr,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dan.scally@ideasonboard.com,m:ilpo.jarvinen@linux.intel.com,m:platform-driver-x86@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[hansg@kernel.org,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[redhat.com,kernel.org,intel.com,gmail.com,ideasonboard.com,talbi.fr,vger.kernel.org,linux.intel.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hansg@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,siliconsignals.io:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4FF776FBD69

Hi,

On 1-Jul-26 14:33, Tarang Raval wrote:
> Hi Hans, Sakari
> 
>> On Wed, Jul 01, 2026 at 01:01:58PM +0200, Hans de Goede wrote:
>>> Hi,
>>>
>>> On 1-Jul-26 08:19, Tarang Raval wrote:
>>>> Hi Hans,
>>>>
>>>>> On 30-Jun-26 09:32, Tarang Raval wrote:
>>>>>> Hi Kate,
>>>>>>
>>>>>>> Update the con_id for the Sony IMX471 sensor to "vana" to serve as the
>>>>>>> power enable. Additionally, the HID values SONY471A and TBE20A0, both
>>>>>>> associated with the IMX471 image sensor, have been identified on Lenovo
>>>>>>> laptops.
>>>>>>>
>>>>>>> Signed-off-by: Kate Hsuan <hpa@redhat.com>
>>>>>>
>>>>>> Thanks, looks good.
>>>>>>
>>>>>> Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>
>>>>>
>>>>> Hmm, the imx471 driver is still pending upstream:
>>>>>
>>>>> https://lore.kernel.org/linux-media/20260629074026.35490-5-hpa@redhat.com/
>>>>>
>>>>> As part of this series.
>>>>>
>>>>> Please just use the standardized "avdd" in that driver instead
>>>>> of "vana" (which also seems to refer to the analog supply vdd,
>>>>> which is what avdd stands for).
>>>>>
>>>>> Then this whole patch is unnecessary and can be dropped from
>>>>> this series.
>>>>
>>>> The regulator name "vana" comes directly from the Sony IMX471 sensor
>>>> datasheet, which typically refers to the analog supply voltage. Using the
>>>> datasheet name helps keep the driver consistent with the hardware
>>>> documentation and makes it easier to cross-reference.
>>>>
>>>> as per my understanding, the more standardized way is to use the regulator
>>>> name as per the sensor datasheet. Therefore, I respectfully disagree with
>>>> your suggestion.
>>>
>>> As shown by the need for this patch on x86 at least because there
>>> is no devicetree it greatly helps if all Linux sensor drivers use
>>> standardized names for their regulators rather then using the exact name
>>> from the datasheet which often is not very consistent.
>>>
>>> And "avdd" is the name we've standardized on for this, so lets use that:
>>>
>>> hans@shalem:~/projects/linux$ grep -l '"vana"' drivers/media/i2c/*.c | wc -l
>>> 4
>>> hans@shalem:~/projects/linux$ grep -l '"avdd"' drivers/media/i2c/*.c | wc -l
>>> 36
>>>
>>> The alternative is needing to add more and more quirks as different
>>> sensors are used, which is not great.
>>
>> I do agree that having a constant name for the regulators would be
>> beneficial for the int3472 driver. Still, if, and presumably, when that
>> sensor gets DT support, the bindings will use the regulator name from the
>> datasheet.
>>
>> Let's just use the datasheet name now and add the few lines needed to the
>> int3472 driver and avoid the churn in the future. There's a limited number
>> of sensor drivers that need this after all.
>>
>> I'd be more concerned of what's going on in tps68470_board_data.c for
>> instance.
> 
> I went through the INT3472 driver and would like to propose a generic     
> approach that satisfies both sides without per-HID quirks or sensor driver
> changes.                                                                  
>                                                                           
> The problem is:                                                      
>  - INT3472 standardizes on "avdd" internally                             
>  - Sony IMX sensor drivers use "vana" per datasheet, and all existing    
>    Sony DT bindings (imx219, imx290, imx415) already use vana-supply     
>  - Changing imx471 to "avdd" now will create inconsistency with those    
>    bindings, or require a rename later

Ack, as mentioned in my reply to Sakari from 1 minute ago I'm ok
with sticking with vana for the imx* case,
                                  
> Instead of fixing this per-sensor (either by changing the driver or adding
> a per-HID entry to int3472_gpio_map), we can add a small vendor alias     
> table inside skl_int3472_register_regulator().                            
>                                                                           
> Currently that function registers two consumer supply entries per sensor: 
> lowercase ("avdd") and uppercase ("AVDD"). We can extend it to also       
> register vendor datasheet aliases from a static table, e.g.:              
>                                                                           
>   avdd -> vana   (Sony IMX series: imx219, imx290, imx415, imx471, ...)   
>                                                                           
> This way, when a sensor driver requests "vana", the regulator framework   
> finds it in the supply map without any extra quirks.                      

Interesting proposal. For now I think just going with the quirk from
this patch is fine. But if we get more Sony sensors doing what you
suggests might make sense.

IIRC currently all regulators get an upper-cased alias to avoid needing
quirks just for the case where drivers only differ in case.

Special casing avdd is going to require adding special code to the generic
bits. Or maybe just an alt_name parameter ? Either way I think for just
the one sensor the quirk is fine. But if we get more (which is somewhat
likely) then your suggestion is probably a good idea.

Regards,

Hans



