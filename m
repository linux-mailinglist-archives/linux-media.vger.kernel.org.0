Return-Path: <linux-media+bounces-62211-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNk7EcpfDWquwgUAu9opvQ
	(envelope-from <linux-media+bounces-62211-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 09:16:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E3F588C7D
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 09:16:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0C5D6302AF0B
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 07:16:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 232CB34DCC8;
	Wed, 20 May 2026 07:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TvncxCcN"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCE113777E
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 07:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779261382; cv=none; b=UdKTH9qIaGm1opNDO4KO4zWobOeB0gwiYf6ZRgthHLaPoJQKyEXn8Bwb6JycGkJavIuk3J70vOSTOXILY3VzQ9mzkW9d5DqCbRFZ8gw8thq8yfCGmDwc7BARRQOV3q05LpLfMRlMvIB+3rJSHcH2D9ZZB3PLJkZfcA9H2lNDNDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779261382; c=relaxed/simple;
	bh=aXIpYnmIklnJ6y/0F06PWvC/OCIsYxKVYILFDJAUrhc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=Idat1z8Z5shy5lvGFZvnQII/Y9bldw23e1jcyWSE4t34WA1rFEOoIWedXW4u9DpCoykYsBQMnDIl+ZUIuBjkS+C/aqkgXq5tOy6YsE16ibnpMB90gQ+56AcNMSK6nFCeWTKlswWZHsEbYmAYgwKhft8oscEaw7O5BAiDjeqjFLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TvncxCcN; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADF131F00893;
	Wed, 20 May 2026 07:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779261381;
	bh=oMsbNQba6LD+22arCv2rJjJbwdLAtaK8L0ICNDcBGZ4=;
	h=Date:From:Subject:To:References:In-Reply-To;
	b=TvncxCcNoYzFcD6fXdlr9iZ0F9mJnoYtrwM/OJw+3TfQtWj4rRKmoGAi7AYHTWoQ8
	 A/JqbSzK43c1uxIfqwU/GvEdJ94vZmmJXeRabs/Yy69XV6dzRvE9S/TdxhCCYaqONh
	 iHlbvkpI4lVIpst2Erk5LTlibAjDdZIYr0RjPmrO+ILDkvsl69CbynytfKEH6nbFVy
	 yyPKYIsKprYS+l35D+kPt0dCz+/y07n9sSlIyfWOjldwavaCTWM0CPOCIZLk3Dkz7B
	 gpGDFllDee+43TLiMhBr/T9e6pOUjUbsTOZfHrVlCKY58rhqSmBkkU7Oex41Ule3Ct
	 nK836P+pulbNQ==
Message-ID: <d5a34e40-2570-44d7-80e8-0646f6f0fe68@kernel.org>
Date: Wed, 20 May 2026 09:16:18 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [v1] media: Use named initializers for arrays of i2c_device_data
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>, linux-media@vger.kernel.org
References: <20260515161528.465621-2-u.kleine-koenig@baylibre.com>
 <6a0764e6.ec7b09a3.350c1e.ff87@mx.google.com> <aggG2S-KG9aOTjsX@monoceros>
Content-Language: en-US, nl
In-Reply-To: <aggG2S-KG9aOTjsX@monoceros>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62211-lists,linux-media=lfdr.de,cisco];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: B0E3F588C7D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 16/05/2026 08:26, Uwe Kleine-König (The Capable Hub) wrote:
> Hello,
> 
> On Fri, May 15, 2026 at 11:24:38AM -0700, Patchwork Integration wrote:
>> Thanks for your patches! Unfortunately the Media CI robot detected some
>> issues:
> 
> I wonder about the Media CI robot testing iio and hwmon patches. What is
> their source? (Hmm, I guess that's because I forgot to remove the
> prerequisite-patch-id lines from the patch.)

Yes, that's weird. Note that you also forgot to add a second '---'
line before the 'drivers/media/cec/i2c/tda9950.c               |  2 +-' line.

When I tried to apply your patch with 'git am' it thought the include/linux/mod_devicetable.h
diff was part of the patch because of that missing line.

Anyway, just ignore this output.

I'll apply this patch.

Regards,

	Hans

> 
>> # Test checkpatch:./0001-scsi-mvsas-Don-t-emit-__LINE__-in-debug-messages.patch checkpatch
>> WARNING: Prefer [subsystem eg: netdev]_dbg([subsystem]dev, ... then dev_dbg(dev, ... then pr_debug(...  to printk(KERN_DEBUG ...
>> #36: FILE: drivers/scsi/mvsas/mv_sas.h:38:
>> +printk(KERN_DEBUG "%s: " fmt, __func__, ## arg)
> 
> This issue was present already before, but yes, that could be addressed
> in a separate patch set.
> 
>> total: 0 errors, 1 warnings, 0 checks, 13 lines checked
>>
>> # Test checkpatch:./0007-iio-Initialize-i2c_device_id-arrays-using-member-nam.patch checkpatch
>> WARNING: line length of 102 exceeds 100 columns
>> #573: FILE: drivers/iio/chemical/atlas-ezo-sensor.c:189:
>> +{ .name = "atlas-co2-ezo", .driver_data = (kernel_ulong_t)&atlas_ezo_devices[ATLAS_CO2_EZO] },
>>
>> WARNING: line length of 102 exceeds 100 columns
>> #575: FILE: drivers/iio/chemical/atlas-ezo-sensor.c:191:
>> +{ .name = "atlas-hum-ezo", .driver_data = (kernel_ulong_t)&atlas_ezo_devices[ATLAS_HUM_EZO] },
> 
> Yeah, these are unfortunate, but I don't want to add line breaks to the
> array. Once i2c_device_id got the union that I want to add to it, I will
> do
> 
> -	{ .name = "atlas-hum-ezo", .driver_data = (kernel_ulong_t)&atlas_ezo_devices[ATLAS_HUM_EZO] },
> +	{ .name = "atlas-hum-ezo", .driver_data_ptr = &atlas_ezo_devices[ATLAS_HUM_EZO] },
> 
> shorten the line again below the 100 char limit.
> 
>> total: 0 errors, 2 warnings, 0 checks, 1372 lines checked
>>
>> # Test checkpatch:./0009-hwmon-pmbus-mp2869-Drop-unjustified-__maybe_unused.patch checkpatch
>> ERROR: missing sentinel in ID array
>> #27: FILE: drivers/hwmon/pmbus/mp2869.c:643:
>> +static const struct of_device_id mp2869_of_match[] = {
>>  { .compatible = "XXXXXXXXXX" },
>>  { .compatible = "XXXXXXXXXXX" },
>>  { .compatible = "XXXXXXXXXXX" },
> 
> This is a false positive, the sentinel is missing in the context of the
> patch, but it's there in the source file.
> 
>> total: 1 errors, 0 warnings, 0 checks, 8 lines checked
>>
>> # Test checkpatch:./0012-ASoC-Use-named-initializers-for-arrays-of-i2c_device.patch checkpatch
>> WARNING: please, no spaces at the start of a line
>> #1251: FILE: sound/soc/codecs/max98088.c:1725:
>> +       { .name = "max98088", .driver_data = MAX98088 },$
>>
>> WARNING: please, no spaces at the start of a line
>> #1252: FILE: sound/soc/codecs/max98088.c:1726:
>> +       { .name = "max98089", .driver_data = MAX98089 },$
> 
> Huh, indeed, that needs fixing (though my patch didn't introduce the
> issue). I already forwarded that info to the thread where this patch is
> discussed.
> 
>> total: 0 errors, 2 warnings, 0 checks, 1982 lines checked
>>
>> # Test checkpatch:./0013-mfd-Use-named-initializers-for-arrays-of-i2c_device_.patch checkpatch
>> WARNING: please, no spaces at the start of a line
>> #1005: FILE: drivers/mfd/tps65910.c:521:
>> +       { .name = "tps65910", .driver_data = TPS65910 },$
>>
>> WARNING: please, no spaces at the start of a line
>> #1006: FILE: drivers/mfd/tps65910.c:522:
>> +       { .name = "tps65911", .driver_data = TPS65911 },$
>>
>> WARNING: line length of 101 exceeds 100 columns
>> #1046: FILE: drivers/mfd/twl-core.c:933:
>> +{ .name = "tps65930", .driver_data = TPS_SUBSET },/* fewer LDOs and DACs; no charger */
>>
>> WARNING: line length of 101 exceeds 100 columns
>> #1047: FILE: drivers/mfd/twl-core.c:934:
>> +{ .name = "tps65920", .driver_data = TPS_SUBSET },/* fewer LDOs; no codec or charger */
> 
> ditto
> 
>> WARNING: Block comments use * on subsequent lines
>> #1049: FILE: drivers/mfd/twl-core.c:936:
>> +{ .name = "tps65921", .driver_data = TPS_SUBSET },/* fewer LDOs; no codec, no LED
>> +   and vibrator. Charger in USB module*/
>>
>> WARNING: Block comments use a trailing */ on a separate line
>> #1049: FILE: drivers/mfd/twl-core.c:936:
>> +   and vibrator. Charger in USB module*/
> 
> I don't know how to fix that (it wasn't introduced in my patch), would
> require a complete reformatting I guess, not sure I want to make that
> part of my quest.
>  
>> [...]
> 
> the remaining issues are similar and addressed in the same way.
> 
> Thanks
> Uwe


