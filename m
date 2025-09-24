Return-Path: <linux-media+bounces-43070-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E03CAB9A77E
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 17:08:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2491E1619B5
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 15:06:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C06A030AABE;
	Wed, 24 Sep 2025 15:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="I08/LofM"
X-Original-To: linux-media@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB658462;
	Wed, 24 Sep 2025 15:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758726399; cv=none; b=EqfIz9iWG+S8zmYHvpEDYjQxXbu4PmO3vCMw6+6uzvTZlaav+uuN7WUXg3LDUCo8Oxm7RgvZzHFeR5nQwhvZWwgO0GO9TyIL9AsmnewqVgtr0+TPFOhExtLNs0Q4/RK+koFEoFrpLlm8IB6GSGUvhQwVj56MUYadQkHAlpZy57I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758726399; c=relaxed/simple;
	bh=lTo0mxD7UgzpTGzWkwz+NQb+tgBlMPnQN8ycWHq9SLI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=OVJZwc0Ri7Ck3TSMV+LU19ATDP3CmnsITYL8bo/P5XQ1y9KolKsx0ZXIcbgmKPTdoFk3CXPFEJdeNaiSx9m+4xRzx95FtrTUZ71rnoKg6tti2AO2uNsOPGxGw9/yqiy2UuAG7GBAKQDPa/ASeLWIlQcnRKCiOCRtGRSafZYpQTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=I08/LofM; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58OF6PtQ1723564;
	Wed, 24 Sep 2025 10:06:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758726385;
	bh=C12jodyvOYQRYMZFpqYTb+c/4y9abagksNSdTyo4T44=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=I08/LofMj2RI/rOoDeTKdx4rSNujCNumeQYa3+g+1ITPPWqSZB7t6qNhnq8u4v0f3
	 Y5H3Lg0h3Sp2xiNKlv3iIeSklhbwmfjLBmqMtmTr3fTIhd/1y5g+aa5c3yS/svqRRg
	 6toQp4zOnV8xl6MJJaDVlkIQhUZpH0VJRewWNK7c=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58OF6PxL2521207
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 24 Sep 2025 10:06:25 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 24
 Sep 2025 10:06:25 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 24 Sep 2025 10:06:25 -0500
Received: from [10.250.32.49] ([10.250.32.49])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58OF6O2G2203485;
	Wed, 24 Sep 2025 10:06:24 -0500
Message-ID: <76e12732-9a39-409d-aa60-44622fe42ec5@ti.com>
Date: Wed, 24 Sep 2025 10:06:24 -0500
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] media: chips-media: wave5: Improve performance of
 decoder
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        "jackson.lee"
	<jackson.lee@chipsnmedia.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        "bob.beckett@collabora.com" <bob.beckett@collabora.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "lafley.kim"
	<lafley.kim@chipsnmedia.com>,
        "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
        Nas
 Chung <nas.chung@chipsnmedia.com>
References: <20250922055255.116-1-jackson.lee@chipsnmedia.com>
 <20250922055255.116-5-jackson.lee@chipsnmedia.com>
 <1f59f00d-eff7-4c65-a504-227df0de75d2@ti.com>
 <d4b7cc51f1bd7fcf88066e8510f950ec90cfb5aa.camel@collabora.com>
 <PU4P216MB114923D47D5AD77D5D32D56FED1CA@PU4P216MB1149.KORP216.PROD.OUTLOOK.COM>
 <6eed102e2aa739e5026ee545a38ddacf09058bbb.camel@collabora.com>
Content-Language: en-US
From: Brandon Brnich <b-brnich@ti.com>
In-Reply-To: <6eed102e2aa739e5026ee545a38ddacf09058bbb.camel@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Nicolas and Jackson,

On 9/24/2025 8:20 AM, Nicolas Dufresne wrote:
> Hi Jackson,
> 
> Le mercredi 24 septembre 2025 à 01:14 +0000, jackson.lee a écrit :
>> Hi Nicolas
>>
>>> -----Original Message-----
>>> From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>>> Sent: Tuesday, September 23, 2025 3:00 AM
>>> To: Brandon Brnich <b-brnich@ti.com>; jackson.lee
>>> <jackson.lee@chipsnmedia.com>; mchehab@kernel.org; hverkuil-
>>> cisco@xs4all.nl; bob.beckett@collabora.com
>>> Cc: linux-media@vger.kernel.org; linux-kernel@vger.kernel.org; lafley.kim
>>> <lafley.kim@chipsnmedia.com>; hverkuil@xs4all.nl; Nas Chung
>>> <nas.chung@chipsnmedia.com>
>>> Subject: Re: [PATCH v5 4/4] media: chips-media: wave5: Improve performance
>>> of decoder
>>>
>>> Hi Brandon,
>>>
>>> Le lundi 22 septembre 2025 à 12:32 -0500, Brandon Brnich a écrit :
>>>>> -	/*
>>>>> -	 * During a resolution change and while draining, the firmware
>>>>> may
>>>>> flush
>>>>> -	 * the reorder queue regardless of having a matching decoding
>>>>> operation
>>>>> -	 * pending. Only terminate the job if there are no more IRQ
>>>>> coming.
>>>>> -	 */
>>>>> -	wave5_vpu_dec_give_command(inst, DEC_GET_QUEUE_STATUS,
>>>>> &q_status);
>>>>> -	if (q_status.report_queue_count == 0 &&
>>>>> -	    (q_status.instance_queue_count == 0 ||
>>>>> dec_info.sequence_changed)) {
>>>>> -		dev_dbg(inst->dev->dev, "%s: finishing job.\n",
>>>>> __func__);
>>>>> -		pm_runtime_mark_last_busy(inst->dev->dev);
>>>>
>>>> Patch is failing to apply here to linux-next because these redundant
>>>> calls have already been removed[0].
>>>
>>> Which have not been merged back from the RC into media-committers/next,
>>> forcing to skip a cycle. Jackson, feel free to rebase on linux-next like
>>> Brandon suggest.
>>
>> Then should I make v6 patch series based on Linux-next ?
> 
> I've asked advises from the other maintainers, and the answer is no. Basing it
> on our next branch for linux-media submission is the correct thing to do. Its
> too late for this cycle, but be reassured we will improve our process in future
> iterations to reduce the risk of this happening.
> 
> Feel free to send a rebased patch to Brandon, having more testing is always
> good.

Sorry for the confusion here, I was unaware that the patches weren't 
present in -next on linux-media tree. Typically I just do all my testing 
on the linux-next branch. I will make sure to use linux-media in the future.

No need to share the patch with me, I already rebased it to build and 
start my own testing.

Thanks,
Brandon

> 
> cheers,
> Nicolas
> 
>>
>> Thanks
>> Jackson
>>
>>>
>>> regards,
>>
>>> Nicolas


