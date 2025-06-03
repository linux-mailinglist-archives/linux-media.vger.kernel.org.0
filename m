Return-Path: <linux-media+bounces-34029-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EF2ACCB7B
	for <lists+linux-media@lfdr.de>; Tue,  3 Jun 2025 18:54:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED0D43A6B73
	for <lists+linux-media@lfdr.de>; Tue,  3 Jun 2025 16:53:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 731A81C3BEB;
	Tue,  3 Jun 2025 16:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="nInpFzyS"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14351C1F13
	for <linux-media@vger.kernel.org>; Tue,  3 Jun 2025 16:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748969642; cv=none; b=o6GIZZ/F56LDXOtb0vzeQnnuXcy82gnP17OHsDQwRa2pN04hTU6ZAYojKwwK8NqQJj5zOSG5yXpQLgoDxJQwscS/xuKNfoyT2UFk+8ZSaKudd3N9viV3dNczpmp8P4CtW2XfNILaRkAStfpjwq9yHXbI2uhmQsHkuYYf92qONT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748969642; c=relaxed/simple;
	bh=rD3HBlx1QvyNXJSLnyck1ZWOHcLwjDzHmYGxYcPlQCM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tpKI4tc4EvS81Zf6Ok9fzgthV6W2JQdyBZlMXuYa/8IrqRZvFuj9lJelVojwhBgiaa93QSVRQiEIBtEBxovXUMiaw5ebEy90P/vevciicRXHYndZQjfWGdgqO+iS64WTi72J1lrNhiDOKfRsRHFQx/tXsnmI/w1x/p86uxYJjiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=nInpFzyS; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=o00aR12jwm7c4BkPDVzJqD7kLtjvCsd4KPoJDLs9Mmo=; b=nInpFzySSgY7qAFG2beganEgry
	gNqcbIPbPBOuqOFjxE9PNLdbbxUyrg01v1JiZE1Ie/GSY67g0iqwiOmKDeuG+IfF0jObAsZUQ9qwa
	HSg+hjr6ja3HBSL2oYzoq+Z8K7sOOb31DxfxXYBQaNkNMQ9EmMnOsM/CWMI2YZFUzwCrVsquiglol
	7hdww/SKk3LapUxbS1KM3x0KngwwfkBPjdIe3mHo4GkF7Q9+agNeQlAlimTphzxWuZQN/qBSZ+Be4
	YEGSZPkxE1osfmO32irnUfu313BYL1WUgB+VnRfENNKcfnN7/H+A0S2JZJNgbFeAnsb7t+tkEQCmG
	LZaXJe0Q==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uMUtV-00GlU8-Lx; Tue, 03 Jun 2025 18:53:45 +0200
Message-ID: <6aa998eb-5991-472e-8e6a-08ebf3fe9876@igalia.com>
Date: Tue, 3 Jun 2025 17:53:44 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/9] dma-fence: Use a flag for 64-bit seqnos
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 kernel-dev@igalia.com
References: <20250515095004.28318-1-tvrtko.ursulin@igalia.com>
 <20250515095004.28318-3-tvrtko.ursulin@igalia.com>
 <c93c05be-b2c8-42a2-84d1-32b90743eb82@amd.com>
 <b59cadff-da9a-409f-a5ed-96aafdfe3f0b@igalia.com>
 <13c5edf6-ccad-4a06-85d4-dccf2afd0c62@amd.com>
 <20250603-outrageous-kakapo-of-felicity-6dc41a@houat>
 <e969d68a-aff3-4560-be28-de17498d7b6e@igalia.com>
 <d5bbe511-97ab-42aa-97c3-e669849ebc12@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <d5bbe511-97ab-42aa-97c3-e669849ebc12@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 03/06/2025 17:27, Christian König wrote:
> On 6/3/25 17:00, Tvrtko Ursulin wrote:
>>
>> On 03/06/2025 14:13, Maxime Ripard wrote:
>>> Hi,
>>>
>>> On Mon, Jun 02, 2025 at 04:42:27PM +0200, Christian König wrote:
>>>> On 6/2/25 15:05, Tvrtko Ursulin wrote:
>>>>> On 15/05/2025 14:15, Christian König wrote:
>>>>>> Hey drm-misc maintainers,
>>>>>>
>>>>>> can you guys please backmerge drm-next into drm-misc-next?
>>>>>>
>>>>>> I want to push this patch here but it depends on changes which are partially in drm-next and partially in drm-misc-next.
>>>>>
>>>>> Looks like the backmerge is still pending?
>>>>
>>>> Yes, @Maarten, @Maxime and @Thomas ping on this.
>>>
>>> It's done
>>
>> Thanks Maxime!
>>
>> Christian, I can merge 2-5 to take some load off you if you want?
> 
> Sure, go ahead.
> 
> Then I can call it a day for today :)

Pushed. Thanks for the reviews once more!

I will aim to respin the rest of the series ASAP but may be delayed a 
few days.

Regards,

Tvrtko


