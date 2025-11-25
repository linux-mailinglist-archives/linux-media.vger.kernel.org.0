Return-Path: <linux-media+bounces-47677-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BDFC83313
	for <lists+linux-media@lfdr.de>; Tue, 25 Nov 2025 04:14:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1E9F04E3709
	for <lists+linux-media@lfdr.de>; Tue, 25 Nov 2025 03:14:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D2951E7C12;
	Tue, 25 Nov 2025 03:14:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99FA19F48D;
	Tue, 25 Nov 2025 03:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764040482; cv=none; b=cJhbaB2y/SXoPGCqFFAsjnnBw15KFQRJf4ealxNM+CCWJwveP6SjZiRA9JdNSGkEncAvwl2/V4ZpTSNAYJNQSnBZ5YPhapLQsfVHhJNTChbsm1/nG/1fIwFnrfQlR5qvvI7Y5uU3BT4Ju+wAQRBT9pJjnL3Ph998PlSitfY1zOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764040482; c=relaxed/simple;
	bh=WwXc+QH58IucC7aZwu4vmsooK/FSSVJNrq8gwGgfcTQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Iq3GAtBjoPRr/9L47kxbgQXEHJrwqB9ZPpotVd2jzPI+0ocsUnTkqKrFrY9mA5swuyuEvQgloikV0F1Ldg5V3gud3Be3nKTPYB22VNrGmoBWCl/qyj0QNKJmFnFxRMi4j6dkHMZbQ2OzCVPmW4WfZEXNLgOEcoJnOFFjnqDGlT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: d9b56548c9ac11f0a38c85956e01ac42-20251125
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:a2180c76-8899-4eae-9a2d-91af8265ad1b,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:287404b727a2f85146b203c892622f54,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|898,TC:nil,Content:0|15|
	52,EDM:-3,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d9b56548c9ac11f0a38c85956e01ac42-20251125
X-User: dengjie03@kylinos.cn
Received: from [10.42.12.246] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <dengjie03@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1249544746; Tue, 25 Nov 2025 11:14:27 +0800
Message-ID: <5ebb9c9b-ed8a-4872-80b6-a0da815ad77b@kylinos.cn>
Date: Tue, 25 Nov 2025 11:14:24 +0800
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
From: Jie Deng <dengjie03@kylinos.cn>
In-Reply-To: <CANiDSCtNuYbxH9JH1=1NisDQy+b+SahpvGw3BjyvT4PXX=FO_w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Ricardo

Thank you for your reply

在 2025/11/24 17:06, Ricardo Ribalda 写道:
> Hi Jie
>
>
>
> On Mon, 24 Nov 2025 at 04:08, Jie Deng <dengjie03@kylinos.cn> wrote:
>> Hi Ricardo
>>
>> Thank you for your reply
>>
>> 在 2025/11/22 16:17, Ricardo Ribalda 写道:
>>> Hi Jie
>>>
>>> On Sat, 22 Nov 2025 at 08:26, Jie Deng <dengjie03@kylinos.cn> wrote:
>>>> Add safety checks to prevent kernel panic during the race window in
>>>> USB device disconnection.
>>> Can you share the kernel version that you are using?
>> The kernel version I'm using is 5.4.18
>>> This patch
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c93d73c9c2cfa7658f7100d201a47c4856746222
>>> Should prevent the race that you are describing.
>>>
>>>
>>> In your trace you have a reference to uvc_queue_streamoff that was
>>> deleted by that patch
>> This patch may indeed eliminate the problem I described.
>>
>> The 5.4 longterm version should not have synchronized this patch？
> Seems that the patch that fixed the issue:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/media/usb/uvc/uvc_driver.c?id=c9ec6f1736363b2b2bb4e266997389740f628441
1. What this patch does:

Problem scenario: When a USB device is disconnected, the kernel 
initiates the

unregistration process, but the device might still be in a streaming state.


2. The issue fixed by my patch submission:
1）Problem scenario: When userspace actively stops streaming, the USB 
device gets

disconnected during the stopping process.

2）Fix method: In the stream stopping function, check whether the USB 
device is still

connected to avoid accessing structures of already disconnected devices. 
This is fixed

by adding null pointer checks.

The patch I submitted addresses a different race condition.


Thanks,

Jie Deng

>
> Was only backported until 5.10
>
> 5.4 is EOL this December. So it is probably not worth doing anything more.
>
> Regards!
>
>>
>> Thanks,
>>
>> Jie Deng
>>
>

