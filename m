Return-Path: <linux-media+bounces-43033-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E475B99459
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 11:58:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 246A93BDD19
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 09:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5B652DA76B;
	Wed, 24 Sep 2025 09:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EcCKm7Hm"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39EF126CE0C;
	Wed, 24 Sep 2025 09:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758707922; cv=none; b=Wlwmer6v/7qWMVYa0J+gcOOJYRY5sTzJWhDnaZs23PKKoHYRXNIUXe+FgEGOcQDujWEFV53Wvh4E9cj2kRa/0w6JKfubowlZHo1AY+QxqZaeDv0rkR2XD0ZwuFHQ4VCTe8cFl07jEU2j1i60DdEW5HLx2DhH31VaNYLWlB2s9U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758707922; c=relaxed/simple;
	bh=4JNpX7ipAAyzfck8qOKM5Oy850CeJ1rWhvibdlb4jf8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CU+T59oC+nMxyLx4HozL6hDwAxsQXVCxE5XhjAqhCFeyK5XUgKMDsUnczKyxyPdZFf07UR4FxRP16qGZKAbU6KK1mc4+grr19WIp9vHa4IUl9GuO+l9HyBO+CktCJYP0kf4/KZJOJywzD5DHHpx40duuTBE7hvIq/F00qes3km4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EcCKm7Hm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 510C0C113CF;
	Wed, 24 Sep 2025 09:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758707921;
	bh=4JNpX7ipAAyzfck8qOKM5Oy850CeJ1rWhvibdlb4jf8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EcCKm7HmiSEVjw4so/O8Xs6sF+bMcnN4MidKHFsVokDcDMJuX5cnWLwpiBNyEK0zh
	 FAxy+SVaGPgm96Zxuc6vJkIbk6Qd+kbAUEWV2/1vMEQhm76I4hugTaFcZABOtgTCKT
	 VnxQMBdWDXBYFxBMRC3S8Dr2cnDtzqLSKvmAR/ROeCdjDqE+K+Mbe22BRufMdwWSD5
	 qf9ihS64WHpI700qsyAmMD/93ONXb7Rm9U9pFMSR6ZvOpRV9VFEBqfkTSedMkQyhfM
	 nLrJYMk8m6Dx64jFGVvMR3hEk9GKe0UqedL1xgiLUGVxDLitoS7fBoDmTFlBk/RrOx
	 UzxDPfQ5srWkw==
Message-ID: <97ebc9ec-1087-400c-9453-947c414937c3@kernel.org>
Date: Wed, 24 Sep 2025 11:58:38 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] media: v4l2-subdev / pdx86: int3472: Use "privacy"
 as con_id for the privacy LED
To: Aleksandrs Vinarskis <alex@vinarskis.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Andy Shevchenko <andy@kernel.org>, platform-driver-x86@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
References: <20250910104702.7470-1-hansg@kernel.org>
 <20250910104702.7470-2-hansg@kernel.org>
 <ccdf3f79-b1ad-a7cd-5e40-0fb8f70d05d4@linux.intel.com>
 <qWUcwd3SUhjavnDhfi9XGxQGsawpzg7ULgHBZllrjxgmELw17JPeZYZuN4bc_VvmoVzd73AmdyZfOcWyFzTvdYUNOG_ORuJhlzPgkxdyN-A=@vinarskis.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <qWUcwd3SUhjavnDhfi9XGxQGsawpzg7ULgHBZllrjxgmELw17JPeZYZuN4bc_VvmoVzd73AmdyZfOcWyFzTvdYUNOG_ORuJhlzPgkxdyN-A=@vinarskis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi All,

On 24-Sep-25 9:06 AM, Aleksandrs Vinarskis wrote:
> 
> On Wednesday, September 10th, 2025 at 12:51, Ilpo Järvinen <ilpo.jarvinen@linux.intel.com> wrote:
> 
>>
>>
>> On Wed, 10 Sep 2025, Hans de Goede wrote:
>>
>>> During DT-binding review for extending the V4L2 camera sensor privacy LED
>>> support to systems using devicetree, it has come up that having a "-led"
>>> suffix for the LED name / con_id is undesirable since it already is clear
>>> that it is a LED.
>>>
>>> Drop the "-led" suffix from the con_id in both the lookup table in
>>> the int3472 code, as well as from the con_id led_get() argument in
>>> the v4l2-subdev code.
>>>
>>> Signed-off-by: Hans de Goede hansg@kernel.org
>>> ---
>>> drivers/media/v4l2-core/v4l2-subdev.c | 2 +-
>>> drivers/platform/x86/intel/int3472/led.c | 2 +-
>>> 2 files changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
>>> index 113eb74eb7c1..babcc1120354 100644
>>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
>>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
>>> @@ -2602,7 +2602,7 @@ EXPORT_SYMBOL_GPL(v4l2_subdev_is_streaming);
>>> int v4l2_subdev_get_privacy_led(struct v4l2_subdev *sd)
>>> {
>>> #if IS_REACHABLE(CONFIG_LEDS_CLASS)
>>> - sd->privacy_led = led_get(sd->dev, "privacy-led");
>>> + sd->privacy_led = led_get(sd->dev, "privacy");
>>> if (IS_ERR(sd->privacy_led) && PTR_ERR(sd->privacy_led) != -ENOENT)
>>> return dev_err_probe(sd->dev, PTR_ERR(sd->privacy_led),
>>> "getting privacy LED\n");
>>> diff --git a/drivers/platform/x86/intel/int3472/led.c b/drivers/platform/x86/intel/int3472/led.c
>>> index f1d6d7b0cb75..b1d84b968112 100644
>>> --- a/drivers/platform/x86/intel/int3472/led.c
>>> +++ b/drivers/platform/x86/intel/int3472/led.c
>>> @@ -43,7 +43,7 @@ int skl_int3472_register_pled(struct int3472_discrete_device *int3472, struct gp
>>>
>>> int3472->pled.lookup.provider = int3472->pled.name;
>>> int3472->pled.lookup.dev_id = int3472->sensor_name;
>>> - int3472->pled.lookup.con_id = "privacy-led";
>>> + int3472->pled.lookup.con_id = "privacy";
>>> led_add_lookup(&int3472->pled.lookup);
>>>
>>> return 0;
>>
>>
>> Acked-by: Ilpo Järvinen ilpo.jarvinen@linux.intel.com
>>
> 
> Hi all,
> 
> Anything still pending before this patch can land? As DT-binding change that requires this [1] is already in linux-next it would be nice to land this in the same cycle.

Hmm, I was under the impression this was already merged but I do not see it in:

https://gitlab.freedesktop.org/linux-media/media-committers/

Sakari, can you pick this one up please, preferably for
6.18 ?

Regards,

Hans


> [1] https://lore.kernel.org/all/20250910-leds-v5-0-bb90a0f897d5@vinarskis.com/



