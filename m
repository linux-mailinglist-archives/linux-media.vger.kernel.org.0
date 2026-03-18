Return-Path: <linux-media+bounces-56236-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECW9JlT9umlHeAIAu9opvQ
	(envelope-from <linux-media+bounces-56236-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 20:30:28 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 454842C206C
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 20:30:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5FFE2301F681
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 19:30:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 442C13F20F8;
	Wed, 18 Mar 2026 19:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="lTn6OW5L"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862933F0A82
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 19:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773862224; cv=pass; b=XQRWRzHBYzbTnqUgsOYeLS3J4ns6NAu7VVDdtUClSp/W7ZAwFu9ViwDMFJ88QkfRieiWrwv5E04QjP3gjHYNsx4E9vAfIJNvd1T9KWd/U6rUFMj1uSRaZ99qGjUx6LOFiyo9OuamGL763xgYGsoxEil0wPh+D9xVGKlaVJvWgYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773862224; c=relaxed/simple;
	bh=iUFINcJ3hbWwtfrqnrtHf3oLu/5T9UQL2QvX7nd+Rv0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=fxfE6Z9HVZLgPf79MxtVwBvQXyyg1tPBEzUEYbPPPRIRuNHSxG5UgnuqUR+RdalgW2vjFcAoVN2WpAr3yO+jEIgvRFPiy2rdYsaBXtAVuMbnuPbhlPNwnWfvCWCCG/f3FCHK8XTBVUdgIOuaUNNaU1BXQ1bN5Z0PH+ZPXlf7Mzc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=lTn6OW5L; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1773862212; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cNcdhXgkyPAGZHAW9rMHvUva+G1af9eWvZykYLY2gQqVwxJfib3A1YeC2JLq3yUbJI1g0Hc55wrjlIPK0K2dgnmb7/l+SsmEqaNnyPl86HoRZ6pW4lPrLmS5dnpns9flxEOOlroKpVtnfvZRiFdkJPtnYzqW5ipTpDfKEiJZSII=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773862212; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=AoHyond7xNgQSW9EJSh2IxOLr5RUuJoKHFWAxfuSNEc=; 
	b=OtKilQGSfADbe/1dFepbWOd5EWgA+lAXGUUKNfnRiFoVxqv2K7iVyd4dFczie89who0fJojnyzjWQBp6CbZ64CRmLXmKdC/g/uTWy8BZDP1bOnR7nToSnCjIA/asH4TVJpaq7cc7rYohaH872oO5n5x8DlXJ2gZjzAEJqaQqAg0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773862212;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:From:From:To:To:Cc:Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=AoHyond7xNgQSW9EJSh2IxOLr5RUuJoKHFWAxfuSNEc=;
	b=lTn6OW5LosCLZKFxGF7loosMjYiuFz33Xeb3mavomlA9F2ScUuou+Z/JC05zoLF/
	AuYftLYOGAS/5iWXvqcEskyc2hHqt92f4GOmZY6sLOZlMQRnR+kRDAHXVp5I9r97p5J
	/nvKprGQEaq/abtpbkJ91vm3WPaeNZxdudsvpDp4=
Received: by mx.zohomail.com with SMTPS id 1773862210582440.3353042997378;
	Wed, 18 Mar 2026 12:30:10 -0700 (PDT)
Message-ID: <18888de2-d294-41f3-b37f-e74b34209728@collabora.com>
Date: Wed, 18 Mar 2026 22:30:07 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: hdmirx: snps, rk: Fix EDID injection with proper
 HPD toggle on RK3588
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Ross Cawston <ross@r-sc.ca>, linux-media@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org, hans.verkuil@cisco.com,
 ezequiel@collabora.com, benjamin.gaignard@collabora.com
References: <20260209061654.54757-1-ross@r-sc.ca>
 <476df663-2391-46ef-a5ae-2000bb418d73@collabora.com>
Content-Language: en-US
In-Reply-To: <476df663-2391-46ef-a5ae-2000bb418d73@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56236-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.osipenko@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[r-sc.ca:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,collabora.com:dkim,collabora.com:mid]
X-Rspamd-Queue-Id: 454842C206C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2/13/26 15:46, Dmitry Osipenko wrote:
> On 2/9/26 09:16, Ross Cawston wrote:
>> The existing VIDIOC_S_EDID implementation writes EDID data but does not
>> properly trigger source renegotiation on RK3588 boards. This results in
>> no visible change to the source device despite the ioctl succeeding.
>>
>> Even re-plugging the HDMI cable does not trigger renegotiation on previous
>> versions of the driver. This version reliably triggers renegotiation on
>> EDID injection on tested hardware.
>>
>> Fix by mirroring the vendor BSP behavior:
>> - Disable HDMI and DMA IRQs to avoid races.
>> - Simulate plugout if 5V power is present.
>> - Toggle HPD low before write.
>> - Schedule a delayed hotplug workqueue (1000ms) to re-enable HPD and
>>   force renegotiation.
>>
>> Bump WAIT_SIGNAL_LOCK_TIME from 300ms to 600ms to ensure lock.
>>
>> This ensures custom EDIDs take effect reliably, allowing userspace to
>> force specific resolutions/timings.
>>
>> Tested on Orange Pi 5 Ultra and Radxa Rock 5B — sources now correctly
>> re-detect and lock to the new EDID modes.
>>
>> Signed-off-by: Ross Cawston <ross@r-sc.ca>
>>
>> ---
>>  drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c | 43 +++++++++++++++++------
>>  1 file changed, 37 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
>> index abc123..def456 100644
>> --- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
>> +++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
>> @@ -88,6 +88,10 @@
>>  	HDMIRX_NUM_RST,
>>  };
> 
> Hello Ross,
> 
> I was able to reproduce the problem and confirm that this patch fixes
> it. Will need more time to understand what's going on as pretty sure
> EDID was working properly last time I was testing it, will get back to
> you after.
> 
> BTW, kernel's source code has ./scripts/get_maintainer.pl that you
> should use before sending patch to ML to find relevant email recipients
> of the patch, otherwise it may stay unnoticed for a long time.
> 

Hi, Ross. Please give a test to [1], it fixes EDID problem with my testing.

[1]
https://lore.kernel.org/linux-media/20260318192619.3910060-1-dmitry.osipenko@collabora.com/T/#u

-- 
Best regards,
Dmitry

