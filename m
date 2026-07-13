Return-Path: <linux-media+bounces-67462-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8EMtGPS7VGopqQMAu9opvQ
	(envelope-from <linux-media+bounces-67462-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 12:20:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B073749B84
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 12:20:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=zohomail header.b=EbxSN6TK;
	dmarc=pass (policy=none) header.from=collabora.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67462-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67462-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 393F9304C97C
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 10:18:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E6533E7174;
	Mon, 13 Jul 2026 10:18:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6473DDDBB;
	Mon, 13 Jul 2026 10:18:06 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783937887; cv=pass; b=kYnJW1b4hIQKTlnOkeYYbpbWrsOw7Ce+F2tYSCDVsjdbqpk0Gfx2piw0Uu1sYQ9ZhfGZDcWovauJMp2a30+uigphKpFaZLOGS7TEDwHo4fXzdYsWINawGAXsvX0a2UG8ta/QxiLiu8nlquUOU+9iv5rP3OMuYD5MkhGgkWXFdxU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783937887; c=relaxed/simple;
	bh=YPX8hd8KIAx0/C9XG75LBK4pnYerRFIzFoJcR6AOJSU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FC/sncJ5cmlC6IL3cBsTrJ2EjTcdUz7rsLxONmvCxQ/FmCIStm0vUcDzQ8C2prInSW4yLQXYS/JC5a3oHYQJ/qiu223vSQl/VxkxMvX6bk0uwfbes9zAQIQnoVlh757NAWMx+Bdf7XK42hRB6z9m1gF0bi5eHbBsgVegxxrZtKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=robert.mader@collabora.com header.b=EbxSN6TK; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal: i=1; a=rsa-sha256; t=1783937877; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Bnbl8tTJoTfaGvyRZh19eYasH4GlvD7TOPy1Jz+1oKPn5sLTI4gDwsn0skyhDADEhq3dAZwuX4rJimB/zjA+rthcUcVcGbekaNMXBgjh+zAFRYLaho2N/WG3d6b7CUgAhhxoLFqt3QgmJTQccMGqoTgv3gfSChiuI3HCtozcPek=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1783937877; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=eF/PXcf5sIdDIk+5d8YuZl+bijPIvKV3sjgnL2+qmBQ=; 
	b=i3w83ygpTmlBL/bKPlDv745OLrYadG1ksIx19btlL+fnAacW6RHqF/XosREGy06EtpfqHFhKlZDZ0US2h06Kjrv5riHStqv/iX8GXlAJpxD1zHPeOOtyvY+9S1JhPSi6qSahgOS/CBTL3x+NMCVvId+7MGrSqzo+GeyW3Pnsldo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=robert.mader@collabora.com;
	dmarc=pass header.from=<robert.mader@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1783937877;
	s=zohomail; d=collabora.com; i=robert.mader@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=eF/PXcf5sIdDIk+5d8YuZl+bijPIvKV3sjgnL2+qmBQ=;
	b=EbxSN6TKUlA5zMtHfxad/oc9MbDccq+wPYy2CoD2wp5bQzEs/DyRZFMdvYFt52iw
	1Bk9QRKUWxvh7MUPucZ8pFFqypg/l9cGWbAhEvzlu0N5Be1skzztRhOaDJFrCdNe0O+
	6dzegfpYMxr4aDQXJ849ry3YGXKDfy8bjqFFyD1Q=
Received: by mx.zohomail.com with SMTPS id 1783937875341589.3965950125053;
	Mon, 13 Jul 2026 03:17:55 -0700 (PDT)
Message-ID: <8b0d0180-09ef-42c7-b111-db51d5ddacca@collabora.com>
Date: Mon, 13 Jul 2026 12:17:51 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/2] dma-buf/udmabuf: Introduce
 CONFIG_UDMABUF_SIZE_LIMIT_MBYTES
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Cc: Sumit Semwal <sumit.semwal@linaro.org>, Gerd Hoffmann
 <kraxel@redhat.com>, Vivek Kasireddy <vivek.kasireddy@intel.com>,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
References: <20260711144814.8205-1-robert.mader@collabora.com>
 <6764ca6f-b4d8-4baa-9d27-2ca867ac2d41@amd.com>
Content-Language: en-US, de-DE, en-GB
From: Robert Mader <robert.mader@collabora.com>
In-Reply-To: <6764ca6f-b4d8-4baa-9d27-2ca867ac2d41@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67462-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[robert.mader@collabora.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:dri-devel@lists.freedesktop.org,m:sumit.semwal@linaro.org,m:kraxel@redhat.com,m:vivek.kasireddy@intel.com,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robert.mader@collabora.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,collabora.com:from_mime,collabora.com:email,collabora.com:mid,collabora.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9B073749B84

Hi,

On 13.07.26 11:12, Christian König wrote:
> On 7/11/26 16:48, Robert Mader wrote:
>> As udmabuf increasingly enjoys popularity - being used in projects like
>> libcamera, Gstreamer, Mesa and KWin - users more frequently encounter
>> cases where the current default size limit of 64MB is too low. Examples
>> include allocating video buffers at a 8K resolution - and even 4K is
>> affected when using non-subsampled video formats or high bit depths.
>>
>> While the limit can already be changed via the kernel command line,
>> exposing it as a kernel config makes that easier and more discoverable
>> for distros. Thus let's do that.
> Well config options are usually only useful if the value can't be changed on runtime through a module parameter, but that is clearly not the case here.
>
> On the other hand I do see your problem. I would just vote to disable the limit by default, there is nothing preventing userspace from allocating multiple uDMA-bufs so it doesn't seem to prevent any security issue or similar.

I fully agree and would prefer that as well. If there is no resistance / 
concerns from anybody I'll send a corresponding patch at the end of the 
week.

Thanks,

Robert

>
> Regards,
> Christian.
>
>
>> Signed-off-by: Robert Mader <robert.mader@collabora.com>
>> ---
>>   drivers/dma-buf/Kconfig   | 6 ++++++
>>   drivers/dma-buf/udmabuf.c | 4 ++++
>>   2 files changed, 10 insertions(+)
>>
>> diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
>> index 7efc0f0d0712..35f0779cdc80 100644
>> --- a/drivers/dma-buf/Kconfig
>> +++ b/drivers/dma-buf/Kconfig
>> @@ -40,6 +40,12 @@ config UDMABUF
>>            A driver to let userspace turn memfd regions into dma-bufs.
>>            Qemu can use this to create host dmabufs for guest framebuffers.
>>
>> +config UDMABUF_SIZE_LIMIT_MBYTES
>> +       int "Size limit in Mega Bytes"
>> +       default 64
>> +       help
>> +         Maximum size of a udmabuf, in megabytes. Default is 64.
>> +
>>   config DMABUF_DEBUG
>>          bool "DMA-BUF debug checks"
>>          depends on DMA_SHARED_BUFFER
>> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
>> index bced421c0d65..a83153326362 100644
>> --- a/drivers/dma-buf/udmabuf.c
>> +++ b/drivers/dma-buf/udmabuf.c
>> @@ -20,7 +20,11 @@ static int list_limit = 1024;
>>   module_param(list_limit, int, 0644);
>>   MODULE_PARM_DESC(list_limit, "udmabuf_create_list->count limit. Default is 1024.");
>>
>> +#ifdef CONFIG_UDMABUF_SIZE_LIMIT_MBYTES
>> +static int size_limit_mb = CONFIG_UDMABUF_SIZE_LIMIT_MBYTES;
>> +#else
>>   static int size_limit_mb = 64;
>> +#endif
>>   module_param(size_limit_mb, int, 0644);
>>   MODULE_PARM_DESC(size_limit_mb, "Max size of a dmabuf, in megabytes. Default is 64.");
>>
>> --
>> 2.55.0
>>

