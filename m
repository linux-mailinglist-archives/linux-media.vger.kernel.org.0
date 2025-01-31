Return-Path: <linux-media+bounces-25449-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF17A23AB6
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 09:35:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F3463A2B92
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 08:35:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB73B16D9C2;
	Fri, 31 Jan 2025 08:35:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935434683
	for <linux-media@vger.kernel.org>; Fri, 31 Jan 2025 08:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738312535; cv=none; b=YXRm8RODe9LQjNVoC5YYKDF+0IbMuKN1BlPJmqI1d2WgjAKvodNv186rP6A889Ni+lMLRWfg383YFQKepwN+PfA5pcgOol5lGB1ePQKAtIgDpgozUO7rJqwmMMlCZab3KLt9firykXreuJLNlXi6p776pWimuBi05JGpdXufrzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738312535; c=relaxed/simple;
	bh=crHRz8muvam7DGcTCFqY58/pKPDHv+P1YPykzmuIpPk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ZHI8yfOl0PQEVEbhPleulWyE4TxnmVZ5IZVijsk/mLkyYMzDAfXkv2DxDdJ0aqRpW4Z5bzLgZDWbw1anp1LAl9oHI3DaU3HnH9hVF1lF2HJiUz8h/A2KRadpBoV7OWrQwYZ8enDrJJkTnSulS+3HaqMAwP26vc5/dE4Mg+8CiRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 574ACC4CED1;
	Fri, 31 Jan 2025 08:35:33 +0000 (UTC)
Message-ID: <2b745a6f-b177-4590-94f5-0aa2145d5c3d@xs4all.nl>
Date: Fri, 31 Jan 2025 09:35:31 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu: drm_dp_cec: fix broken CEC adapter properties check
From: Hans Verkuil <hverkuil@xs4all.nl>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
 Farblos <farblos@vodafonemail.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <361bb03d-1691-4e23-84da-0861ead5dbdc@xs4all.nl>
 <4df44e18-68a0-4cfc-9641-1742d024faf3@xs4all.nl>
Content-Language: en-US, nl
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <4df44e18-68a0-4cfc-9641-1742d024faf3@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/01/2025 13:21, Hans Verkuil wrote:
> On 29/01/2025 10:51, Hans Verkuil wrote:
>> If the hotplug detect of a display is low for longer than one second
>> (configurable through drm_dp_cec_unregister_delay), then the CEC adapter
>> is unregistered since we assume the display was disconnected. If the
>> HPD went low for less than one second, then we check if the properties
>> of the CEC adapter have changed, since that indicates that we actually
>> switch to new hardware and we have to unregister the old CEC device and
>> register a new one.
>>
>> Unfortunately, the test for changed properties was written poorly, and
>> after a new CEC capability was added to the CEC core code the test always
>> returned true (i.e. the properties had changed).
>>
>> As a result the CEC device was unregistered and re-registered for every
>> HPD toggle. If the CEC remote controller integration was also enabled
>> (CONFIG_MEDIA_CEC_RC was set), then the corresponding input device was
>> also unregistered and re-registered. As a result the input device in
>> /sys would keep incrementing its number, e.g.:
>>
>> /sys/devices/pci0000:00/0000:00:08.1/0000:e7:00.0/rc/rc0/input20
>>
>> Since short HPD toggles are common, the number could over time get into
>> the thousands.
>>
>> While not a serious issue (i.e. nothing crashes), it is not intended
>> to work that way.
>>
>> This patch changes the test so that it only checks for the single CEC
>> capability that can actually change, and it ignores any other
>> capabilities, so this is now safe as well if new caps are added in
>> the future.
>>
>> With the changed test the bit under #ifndef CONFIG_MEDIA_CEC_RC can be
>> dropped as well, so that's a nice cleanup.
>>
>> Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
>> Reported-by: Farblos <farblos@vodafonemail.de>
> 
> Fixes: 2c6d1fffa1d9 ("drm: add support for DisplayPort CEC-Tunneling-over-AUX")

Cc: <stable@vger.kernel.org> # 6.12

While the bug has been present since the introduction of drm_dp_cec.c, it lay
dormant until a new CEC capability was introduced in 6.12. So this fix doesn't need
to be backported all the way, just from 6.12 onwards.

Dmitry, do you want to pick this up? I can do it as well, but it is quite some
time ago since I last worked with drm.

Regards,

	Hans

> 
> Regards,
> 
> 	Hans
> 
>> ---
>> Jens (aka Farblos), can you test this patch?
>> ---
>>  drivers/gpu/drm/display/drm_dp_cec.c | 14 +++-----------
>>  1 file changed, 3 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/display/drm_dp_cec.c b/drivers/gpu/drm/display/drm_dp_cec.c
>> index 007ceb281d00..56a4965e518c 100644
>> --- a/drivers/gpu/drm/display/drm_dp_cec.c
>> +++ b/drivers/gpu/drm/display/drm_dp_cec.c
>> @@ -311,16 +311,6 @@ void drm_dp_cec_attach(struct drm_dp_aux *aux, u16 source_physical_address)
>>  	if (!aux->transfer)
>>  		return;
>>
>> -#ifndef CONFIG_MEDIA_CEC_RC
>> -	/*
>> -	 * CEC_CAP_RC is part of CEC_CAP_DEFAULTS, but it is stripped by
>> -	 * cec_allocate_adapter() if CONFIG_MEDIA_CEC_RC is undefined.
>> -	 *
>> -	 * Do this here as well to ensure the tests against cec_caps are
>> -	 * correct.
>> -	 */
>> -	cec_caps &= ~CEC_CAP_RC;
>> -#endif
>>  	cancel_delayed_work_sync(&aux->cec.unregister_work);
>>
>>  	mutex_lock(&aux->cec.lock);
>> @@ -337,7 +327,9 @@ void drm_dp_cec_attach(struct drm_dp_aux *aux, u16 source_physical_address)
>>  		num_las = CEC_MAX_LOG_ADDRS;
>>
>>  	if (aux->cec.adap) {
>> -		if (aux->cec.adap->capabilities == cec_caps &&
>> +		/* Check if the adapter properties have changed */
>> +		if ((aux->cec.adap->capabilities & CEC_CAP_MONITOR_ALL) ==
>> +		    (cec_caps & CEC_CAP_MONITOR_ALL) &&
>>  		    aux->cec.adap->available_log_addrs == num_las) {
>>  			/* Unchanged, so just set the phys addr */
>>  			cec_s_phys_addr(aux->cec.adap, source_physical_address, false);
> 
> 


