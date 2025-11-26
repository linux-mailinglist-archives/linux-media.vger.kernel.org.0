Return-Path: <linux-media+bounces-47733-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1408C884E2
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 07:44:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8275C3AA521
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 06:44:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37A96315D4E;
	Wed, 26 Nov 2025 06:44:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016041E49F;
	Wed, 26 Nov 2025 06:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764139451; cv=none; b=bWiIFS/X2UO+FduXQmpdAtYM1YfcaoAa1G/dayDHmaDT58zc5/Z1JbbbZQ2XrY7aGmKQb1b6Hwh8BQEBqJ9LYnDxVM+5Vl9bsxhSDG5QwIus6QmJb4QOtB30Lh8GPsHmFcj12Pvc2+5GskpoDzT4sF7AaoUS0Vfl6uoWgDD8/Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764139451; c=relaxed/simple;
	bh=UiPvJROLzLibReK5zuFzhX5ExRjj/5w3uVUubpH21e8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y0vixMSp6PT0ZJgAMGLfISgm2D2bJwBmXroYDS+ridWRHvhOTHceEdNs/fGOw/qwRZTv+hPLElYUYV9qcgAVUgZmj6nB9gdihMo00o5hPKYEbtZCHtX037/lTRyiEj25A+kgUyy/TGopLiZl2ZhPpmlmEP6D2GdQtPAEuFrJ65E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 46b82220ca9311f0a38c85956e01ac42-20251126
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:3558539c-333a-4f29-a0d0-35fd183da0cc,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:5287c8469b42ebd3089eb99a2324a166,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|898,TC:nil,Content:0|15|
	52,EDM:-3,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 46b82220ca9311f0a38c85956e01ac42-20251126
X-User: dengjie03@kylinos.cn
Received: from [10.42.12.246] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <dengjie03@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1418164439; Wed, 26 Nov 2025 14:43:54 +0800
Message-ID: <51841aa1-686e-4ae3-9397-c4dadd389b27@kylinos.cn>
Date: Wed, 26 Nov 2025 14:43:51 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: usb: uvc: Fix NULL pointer dereference during
 USB device hot-unplug
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: laurent.pinchart@ideasonboard.com, hansg@kernel.org, mchehab@kernel.org,
 kieran.bingham@ideasonboard.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251122072558.2604753-1-dengjie03@kylinos.cn>
 <CANiDSCuJZU9di2T_zQbk7NVr0--JyPUZkXGur11HKZF8qe3N2Q@mail.gmail.com>
 <65a0e74c-a9ee-4237-b8c9-9863e4de64b5@kylinos.cn>
 <CANiDSCtNuYbxH9JH1=1NisDQy+b+SahpvGw3BjyvT4PXX=FO_w@mail.gmail.com>
 <5ebb9c9b-ed8a-4872-80b6-a0da815ad77b@kylinos.cn>
 <CANiDSCtmU=7fGnKE1U-=Xnv70rVR8SzknPLZHFcPTg5QDVE-Qw@mail.gmail.com>
From: Jie Deng <dengjie03@kylinos.cn>
In-Reply-To: <CANiDSCtmU=7fGnKE1U-=Xnv70rVR8SzknPLZHFcPTg5QDVE-Qw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2025/11/25 16:29, Ricardo Ribalda 写道:
> Hi Jie
>
>
> On Tue, 25 Nov 2025 at 04:14, Jie Deng <dengjie03@kylinos.cn> wrote:
>> Hi Ricardo
>>
>> Thank you for your reply
>>
>> 在 2025/11/24 17:06, Ricardo Ribalda 写道:
>>> Hi Jie
>>>
>>>
>>>
>>> On Mon, 24 Nov 2025 at 04:08, Jie Deng <dengjie03@kylinos.cn> wrote:
>>>> Hi Ricardo
>>>>
>>>> Thank you for your reply
>>>>
>>>> 在 2025/11/22 16:17, Ricardo Ribalda 写道:
>>>>> Hi Jie
>>>>>
>>>>> On Sat, 22 Nov 2025 at 08:26, Jie Deng <dengjie03@kylinos.cn> wrote:
>>>>>> Add safety checks to prevent kernel panic during the race window in
>>>>>> USB device disconnection.
>>>>> Can you share the kernel version that you are using?
>>>> The kernel version I'm using is 5.4.18
>>>>> This patch
>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c93d73c9c2cfa7658f7100d201a47c4856746222
>>>>> Should prevent the race that you are describing.
>>>>>
>>>>>
>>>>> In your trace you have a reference to uvc_queue_streamoff that was
>>>>> deleted by that patch
>>>> This patch may indeed eliminate the problem I described.
>>>>
>>>> The 5.4 longterm version should not have synchronized this patch？
>>> Seems that the patch that fixed the issue:
>>>
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/media/usb/uvc/uvc_driver.c?id=c9ec6f1736363b2b2bb4e266997389740f628441
>> 1. What this patch does:
>>
>> Problem scenario: When a USB device is disconnected, the kernel
>> initiates the
>>
>> unregistration process, but the device might still be in a streaming state.
>>
>>
>> 2. The issue fixed by my patch submission:
>> 1）Problem scenario: When userspace actively stops streaming, the USB
>> device gets
>>
>> disconnected during the stopping process.
>>
>> 2）Fix method: In the stream stopping function, check whether the USB
>> device is still
>>
>> connected to avoid accessing structures of already disconnected devices.
>> This is fixed
>>
>> by adding null pointer checks.
> Your patch only reduces the window for the race condition, but does
> not solve it.
>
> If the device is disconnected between the NULL check and the structure
> use, there will still be a kernel panic.
>
> The proper way to fix it is with:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c93d73c9c2cfa7658f7100d201a47c4856746222
> or
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c9ec6f1736363b2b2bb4e266997389740f628441
>
> Those patches were not backported to 5.4, only to 5.10. 5.4 will be
> EOL in 5 days
>
> Please move your product to a newer kernel (ideally the latest
> released by Linus)
>
> Regards!
>
>> The patch I submitted addresses a different race condition.
>>
>>
>> Thanks,
>>
>> Jie Deng
>>
>>> Was only backported until 5.10
>>>
>>> 5.4 is EOL this December. So it is probably not worth doing anything more.
>>>
>>> Regards!

Ok. Thank you for your guidance.

Jie Deng

>>>
>>>> Thanks,
>>>>
>>>> Jie Deng
>>>>
>
>

