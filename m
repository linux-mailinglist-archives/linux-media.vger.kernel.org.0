Return-Path: <linux-media+bounces-43049-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 83632B996FD
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 12:33:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B853A19C51BA
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 10:34:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D8B12DF6F7;
	Wed, 24 Sep 2025 10:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pE0QfGh4"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B9A2DF15C;
	Wed, 24 Sep 2025 10:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758710023; cv=none; b=QnVSzaTDLw55C8GiceeqLsLZtVc61Tk0mqF2VM6T4nA5m4lSkU1ijBNZ1JvWhOXZCDl2mYLCuuGw9bkI6NbprjZE8s5mhNZPSqDJU/M2bG5l6LRwzO03ib8vLpxnWUyguyrtaeTcCGksTWNYItKNzk6/HeTI9lDscqTo130c7xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758710023; c=relaxed/simple;
	bh=vIsRFfXRk6eHeIFChcYn4PT3lR4Gty2QHws78ubywA0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bLz0qHoEUhTN2hv0/I0fYLV2EzvzUTuQJp+Jqe671g4nWN0ySxTOfkLcLHTsLoP2wpP9lo4JWaE2KlEuSgdvkBZUqUmv6Dw6/s6fRlwTXP9vzl6Q0Yys+2qijzkaTHJBK+QtKYsPCvWRvR9WHv8OZfd2utU0CcLR6KWSjbAWs0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pE0QfGh4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5E8DC116B1;
	Wed, 24 Sep 2025 10:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758710022;
	bh=vIsRFfXRk6eHeIFChcYn4PT3lR4Gty2QHws78ubywA0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pE0QfGh46QwtVHyardiTfPNWRqkkN+SmZDSdrg4BBfKeGy9/FIDFST3141PLYgBTD
	 7AXxYSF/XncwXM65lWgTPoG5FYqCr4KEn0EirnJY5QGQ5W0jyVrOyq/PYdzDWESved
	 wjnvBVxqGGPYC+zAeVZfz10klJOrQF0dVvDXlPCL5mpjZBuGCyXhf4GtVR8rEneNIg
	 wgNmsQ9oS/OhjRGLMKI2nK/NoTYzQwxiZ8IX2JXf63nJkb07bqsCd9xIFguTFLsT2l
	 V7o/HMtqZ8aPBvOzYwpu8WcLfQNY/noGZS3xpD1lY+vVtoKtMiVOTWXy1N0jdMIxNd
	 U70t5TT5ElETw==
Message-ID: <58e4a3a2-ede5-4121-99da-03a78b6d1481@kernel.org>
Date: Wed, 24 Sep 2025 12:33:38 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] media: v4l2-subdev / pdx86: int3472: Use "privacy"
 as con_id for the privacy LED
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Aleksandrs Vinarskis <alex@vinarskis.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, platform-driver-x86@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
References: <20250910104702.7470-1-hansg@kernel.org>
 <20250910104702.7470-2-hansg@kernel.org>
 <ccdf3f79-b1ad-a7cd-5e40-0fb8f70d05d4@linux.intel.com>
 <qWUcwd3SUhjavnDhfi9XGxQGsawpzg7ULgHBZllrjxgmELw17JPeZYZuN4bc_VvmoVzd73AmdyZfOcWyFzTvdYUNOG_ORuJhlzPgkxdyN-A=@vinarskis.com>
 <97ebc9ec-1087-400c-9453-947c414937c3@kernel.org>
 <aNPHwKQ2fJVgvVTI@kekkonen.localdomain>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <aNPHwKQ2fJVgvVTI@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Sakari,

On 24-Sep-25 12:28 PM, Sakari Ailus wrote:
> Hi Hans, Aleksandrs,
> 
> On Wed, Sep 24, 2025 at 11:58:38AM +0200, Hans de Goede wrote:
>> Hi All,
>>
>> On 24-Sep-25 9:06 AM, Aleksandrs Vinarskis wrote:
>>>
>>> On Wednesday, September 10th, 2025 at 12:51, Ilpo Järvinen <ilpo.jarvinen@linux.intel.com> wrote:
>>>
>>>>
>>>>
>>>> On Wed, 10 Sep 2025, Hans de Goede wrote:
>>>>
>>>>> During DT-binding review for extending the V4L2 camera sensor privacy LED
>>>>> support to systems using devicetree, it has come up that having a "-led"
>>>>> suffix for the LED name / con_id is undesirable since it already is clear
>>>>> that it is a LED.
>>>>>
>>>>> Drop the "-led" suffix from the con_id in both the lookup table in
>>>>> the int3472 code, as well as from the con_id led_get() argument in
>>>>> the v4l2-subdev code.
>>>>>
>>>>> Signed-off-by: Hans de Goede hansg@kernel.org
>>>>> ---
>>>>> drivers/media/v4l2-core/v4l2-subdev.c | 2 +-
>>>>> drivers/platform/x86/intel/int3472/led.c | 2 +-
>>>>> 2 files changed, 2 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
>>>>> index 113eb74eb7c1..babcc1120354 100644
>>>>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
>>>>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
>>>>> @@ -2602,7 +2602,7 @@ EXPORT_SYMBOL_GPL(v4l2_subdev_is_streaming);
>>>>> int v4l2_subdev_get_privacy_led(struct v4l2_subdev *sd)
>>>>> {
>>>>> #if IS_REACHABLE(CONFIG_LEDS_CLASS)
>>>>> - sd->privacy_led = led_get(sd->dev, "privacy-led");
>>>>> + sd->privacy_led = led_get(sd->dev, "privacy");
>>>>> if (IS_ERR(sd->privacy_led) && PTR_ERR(sd->privacy_led) != -ENOENT)
>>>>> return dev_err_probe(sd->dev, PTR_ERR(sd->privacy_led),
>>>>> "getting privacy LED\n");
>>>>> diff --git a/drivers/platform/x86/intel/int3472/led.c b/drivers/platform/x86/intel/int3472/led.c
>>>>> index f1d6d7b0cb75..b1d84b968112 100644
>>>>> --- a/drivers/platform/x86/intel/int3472/led.c
>>>>> +++ b/drivers/platform/x86/intel/int3472/led.c
>>>>> @@ -43,7 +43,7 @@ int skl_int3472_register_pled(struct int3472_discrete_device *int3472, struct gp
>>>>>
>>>>> int3472->pled.lookup.provider = int3472->pled.name;
>>>>> int3472->pled.lookup.dev_id = int3472->sensor_name;
>>>>> - int3472->pled.lookup.con_id = "privacy-led";
>>>>> + int3472->pled.lookup.con_id = "privacy";
>>>>> led_add_lookup(&int3472->pled.lookup);
>>>>>
>>>>> return 0;
>>>>
>>>>
>>>> Acked-by: Ilpo Järvinen ilpo.jarvinen@linux.intel.com
>>>>
>>>
>>> Hi all,
>>>
>>> Anything still pending before this patch can land? As DT-binding change that requires this [1] is already in linux-next it would be nice to land this in the same cycle.
>>
>> Hmm, I was under the impression this was already merged but I do not see it in:
>>
>> https://gitlab.freedesktop.org/linux-media/media-committers/
>>
>> Sakari, can you pick this one up please, preferably for
>> 6.18 ?
> 
> Is the related DT binding change going to be merged for v6.18?

Just be clear / make sure we are on the same page 6.18 will be what
is in -next now, so my request to merge this for 6.18 is a request
to get this into -next before the merge-window which will open next
Monday (or in the first fixes pull-req after the merge-window).

> I had this queued for v6.19 but I don't see a problem with
> merging it as a fix for v6.18 either.

Again just to be clear, 6.19 is -next-next. Where as the DT
changes are in the current next:

https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git/log/?h=for-leds-next

Regards,

Hans





