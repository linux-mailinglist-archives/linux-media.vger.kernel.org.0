Return-Path: <linux-media+bounces-34129-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 58871ACEFA8
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 14:55:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5BAF1894991
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 12:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D78C22331C;
	Thu,  5 Jun 2025 12:55:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42DE2202F83
	for <linux-media@vger.kernel.org>; Thu,  5 Jun 2025 12:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749128115; cv=none; b=CoUYKmYMqK/zesIm7PkrM09veTzUohk81ZgPL5amCtXGUvv7RcwM6EY6uF4U+IAt83IBKjsqaoN7n/ylrkIU0MIPCYlRe9zC2bMfvj3ohcWEpFJCKm3FPqdQNzFH20jy1GdxH3RqDRgY/EPaQ3SmeHD37CVkLOhDE9O4GPHIu0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749128115; c=relaxed/simple;
	bh=LOb9r/Jj9riUcwpqeBrXN2Nq4ofbZLwsYRp+ofhGEes=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eVCQvx9tbOlvWeO/J0CqYoDF+bVWdEkmCk/pbR+n+JNI1wiVIKX1qDbczeNexF8O2vJCd4tZ8buW9pcQGfohElMslHdGb5OgyNrM+GgP2ItZsKiPRTtYeYjpmVuQxepB3vpFqDS6yK6N7PoJ4dBU3MbkqafXLYEC/SC4KmLxm8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 073D8C4CEE7;
	Thu,  5 Jun 2025 12:55:13 +0000 (UTC)
Message-ID: <72f7c5e2-32b2-4c62-8274-cff50336043b@xs4all.nl>
Date: Thu, 5 Jun 2025 14:55:12 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] libdvbv5/dvb-v5-std.c: add DTV_BANDWIDTH_HZ where
 possible
Content-Language: en-US
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>
References: <cover.1749121112.git.hverkuil@xs4all.nl>
 <f3226f83c3e8cf9f71dc53d435abc381f88e08b0.1749121112.git.hverkuil@xs4all.nl>
 <20250605141853.1f2a6616@foz.lan>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20250605141853.1f2a6616@foz.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/5/25 14:18, Mauro Carvalho Chehab wrote:
> Em Thu,  5 Jun 2025 12:58:29 +0200
> Hans Verkuil <hverkuil@xs4all.nl> escreveu:
> 
>> Several systems support DTV_BANDWIDTH_HZ, add it.
>>
>> This fixes a dvbv5-scan error message about missing support for
>> DTV_BANDWIDTH_HZ.
>>
>> Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
>> ---
>>  lib/libdvbv5/dvb-v5-std.c | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/lib/libdvbv5/dvb-v5-std.c b/lib/libdvbv5/dvb-v5-std.c
>> index c0a14175..74e2e4fe 100644
>> --- a/lib/libdvbv5/dvb-v5-std.c
>> +++ b/lib/libdvbv5/dvb-v5-std.c
>> @@ -81,6 +81,7 @@ const unsigned int sys_isdbt_props[] = {
>>  const unsigned int sys_atsc_props[] = {
>>  	DTV_FREQUENCY,
>>  	DTV_MODULATION,
>> +	DTV_BANDWIDTH_HZ,
>>  	0
>>  };
> 
> Indeed, ISDB-T could have a bandwidth. In the beginning, only
> Japan and Brazil were using it, with a 6MHz bandwidth. As far as
> I remember, all drivers we currently have are for devices with
> such limit. Yet, the spec allows other bandwidths as well. Not sure
> if any Country is using a different bandwidth in practice, though.
> 
>> @@ -111,12 +112,14 @@ const unsigned int sys_dvbc_annex_ac_props[] = {
>>  	DTV_INVERSION,
>>  	DTV_SYMBOL_RATE,
>>  	DTV_INNER_FEC,
>> +	DTV_BANDWIDTH_HZ,
>>  	0
>>  };
>>  
>>  const unsigned int sys_dvbc_annex_b_props[] = {
>>  	DTV_FREQUENCY,
>>  	DTV_MODULATION,
>> +	DTV_BANDWIDTH_HZ,
>>  	0
>>  };
>>  
>> @@ -126,6 +129,7 @@ const unsigned int sys_dvbs_props[] = {
>>  	DTV_SYMBOL_RATE,
>>  	DTV_INNER_FEC,
>>  	DTV_POLARIZATION,
>> +	DTV_BANDWIDTH_HZ,
>>  	0
>>  };
>>  
>> @@ -139,6 +143,7 @@ const unsigned int sys_dvbs2_props[] = {
>>  	DTV_ROLLOFF,
>>  	DTV_POLARIZATION,
>>  	DTV_STREAM_ID,
>> +	DTV_BANDWIDTH_HZ,
>>  	0
>>  };
>>  
>> @@ -149,12 +154,14 @@ const unsigned int sys_turbo_props[] = {
>>  	DTV_INNER_FEC,
>>  	DTV_MODULATION,
>>  	DTV_POLARIZATION,
>> +	DTV_BANDWIDTH_HZ,
>>  	0
>>  };
>>  
>>  const unsigned int sys_isdbs_props[] = {
>>  	DTV_FREQUENCY,
>>  	DTV_STREAM_ID,
>> +	DTV_BANDWIDTH_HZ,
>>  	0
>>  };
> 
> The above are not right: Satellite and Cable don't use bandwidth.
> Instead, the bandwidth is indirectly calculated from the symbol
> rate and rolloff, using something like this:
> 
> 	float rolloff = 1.35;	/* DVB-S rolloff */
> 
> 	int bandwidth_hz = int(symbol_rate * rolloff);
> 
> 
> 
> For DVB-C Annex A and B, and for DVB-S (and, afaikt, for DVB-TURBO), the
> rolloff is fixed. DVB-S2 is the only one that supports different
> rolloff factors.
> 
> In any case, DVB core calculates it. See this code snippet:
> 
>         switch (c->delivery_system) {
>         case SYS_ATSC:
>         case SYS_DVBC_ANNEX_B:
>                 c->bandwidth_hz = 6000000;
>                 break;
>         case SYS_DVBC_ANNEX_A:
>                 rolloff = 115;
>                 break;
>         case SYS_DVBC_ANNEX_C:
>                 rolloff = 113;
>                 break;
>         case SYS_DSS:
>                 rolloff = 120;
>                 break;
>         case SYS_DVBS:
>         case SYS_TURBO:
>         case SYS_ISDBS:
>                 rolloff = 135;
>                 break;
>         case SYS_DVBS2:
>                 switch (c->rolloff) {
>                 case ROLLOFF_20:
>                         rolloff = 120;
>                         break;
>                 case ROLLOFF_25:
>                         rolloff = 125;
>                         break;
>                 default:
>                 case ROLLOFF_35:
>                         rolloff = 135;
>                 }
>                 break;
>         default:
>                 break;
>         }
>         if (rolloff)
>                 c->bandwidth_hz = mult_frac(c->symbol_rate, rolloff, 100);
> 
> The Kernel calculates the bandwidth and may return it, but the opposite
> is not true: any set operation for a TV standard that has DTV_SYMBOL_RATE
> will simply discard/ignore what is there at DTV_BANDWIDTH_HZ.
> 
> Currently, the logic inside libdvbv5 assumes that all parameters are
> read/write.

The issue I tried to fix is that dvbv5-scan complains about BANDWIDTH_HZ
being missing for DVB-C Annex A:

ERROR    command BANDWIDTH_HZ (5) not found during retrieve

Should this message just be suppressed in dvbv5-scan?

I'm not really sure what the best approach is, this isn't my area of
expertise...

Regards,

	Hans

> 
> Thanks,
> Mauro


