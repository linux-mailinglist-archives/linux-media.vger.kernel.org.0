Return-Path: <linux-media+bounces-27651-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9528DA50697
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 18:41:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF4D11728A5
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 17:41:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EF9A2528FB;
	Wed,  5 Mar 2025 17:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="RLXmrKGX"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50ABC19F436;
	Wed,  5 Mar 2025 17:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741196437; cv=none; b=cd15y0TfKid7iIFIzI/gkl0M9HRqCbdINaa+OcVCNIo/3kIVEEE/temjP+iOOUtnaOR1GrKitsTHUGzDVRV45RWrvLmMgFS4ozuU7RxPaZ1e7m2Rw5Yq4cuuMdCrOyWgq9GHivvDYnLUF4rYCXx+cYrIGFIRPDor3CHbMGEg938=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741196437; c=relaxed/simple;
	bh=xeU6W8dr+Xx44tYwHCvYEUZQm+N4fX/QzQxV0VbFOsk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t2Yjz/e6ua1l444uCNI0buXtHdch05sRViA3BboBtiKcGJqfJvov7FJUyJc8aCSusXKk4fjDtSVdZr3yghEDKAZoim8GSO981+f2zOPu9EzHbcbxw4BJPOAzNBnwYpbP6LvudJq6ggtRdXl5Rw8JCd4iuoFwvXcrF6L6MFb1rQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=RLXmrKGX; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741196433;
	bh=xeU6W8dr+Xx44tYwHCvYEUZQm+N4fX/QzQxV0VbFOsk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RLXmrKGXAheI/WPSgzRwEz2WzIRFcgBxYpDBX74aJUqV1KexEyqvFt/sZmqmk1zXm
	 l9rrps+gwi0tDOkPcX23wGNh91SuAoNVFUATwSBCT31Wy5ftA4ioHN0punSnOyQ0Yq
	 NGnn1cemoH48NiNr2OZA1DdiKD+uz7kY7AJoGTGA+YFWISYFPmZS1WCYjroDOjkTWj
	 IJDFG3Dac5hktsfbV51IFrBrn9gqmJOHJHeInrHif7XXzVK0C3QWfWOuW5ELyYyrgf
	 AjjPN69aKvN7JXQKKbjx4DOgqqlvq7hgZOtsRm6bCPoP+c5H2jSJBNKXQB4iqSR0kw
	 NeE/Ee80U3o8w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3831917E0880;
	Wed,  5 Mar 2025 18:40:32 +0100 (CET)
Message-ID: <0d929810-1189-41ce-8f8a-3b7230c3b2a9@collabora.com>
Date: Wed, 5 Mar 2025 18:40:31 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/8] soc: mediatek: mtk-cmdq: Add pa_base parsing for
 unsupported subsys ID hardware
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 =?UTF-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?UTF-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
 <Xiandong.Wang@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?UTF-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "fshao@chromium.org" <fshao@chromium.org>,
 =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?B?WGF2aWVyIENoYW5nICjlvLXnjbvmlocp?= <Xavier.Chang@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "treapking@chromium.org" <treapking@chromium.org>
References: <20250218054405.2017918-1-jason-jh.lin@mediatek.com>
 <20250218054405.2017918-5-jason-jh.lin@mediatek.com>
 <581fc075-25d8-4104-a4ee-8c97e1a017e6@collabora.com>
 <03c523e66fd56442f49c38456476cf18be59e8fb.camel@mediatek.com>
 <8203317e-7f99-4ea5-bda0-fcd791602a9f@collabora.com>
 <c27653233ed2ee2ee6eb0d40ad2167721a2b1476.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <c27653233ed2ee2ee6eb0d40ad2167721a2b1476.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 05/03/25 16:58, Jason-JH Lin (林睿祥) ha scritto:
> On Wed, 2025-03-05 at 12:03 +0100, AngeloGioacchino Del Regno wrote:
>>
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>
>>
>> Il 05/03/25 10:46, Jason-JH Lin (林睿祥) ha scritto:
>>> On Tue, 2025-03-04 at 10:35 +0100, AngeloGioacchino Del Regno
>>> wrote:
>>>>
>>>> External email : Please do not click links or open attachments
>>>> until
>>>> you have verified the sender or the content.
>>>>
>>>>
>>>> Il 18/02/25 06:41, Jason-JH Lin ha scritto:
>>>>> When GCE executes instructions, the corresponding hardware
>>>>> register
>>>>> can be found through the subsys ID. For hardware that does not
>>>>> support
>>>>> subsys ID, its subsys ID will be set to invalid value and its
>>>>> physical
>>>>> address needs to be used to generate GCE instructions.
>>>>>
>>>>> This commit adds a pa_base parsing flow to the cmdq_client_reg
>>>>> structure
>>>>> for these unsupported subsys ID hardware.
>>>>>
>>>>
>>>> Does this work only for the MMINFRA located GCEs, or does this
>>>> work
>>>> also for
>>>> the legacy ones in MT8173/83/88/92/95 // MT6795/6893/etc?
>>>>
>>>> In order to actually review and decide, I do need to know :-)
>>>>
>>>
>>> Yes, it's for the SoCs without subsys ID, it's not related to the
>>> MMINFRA.
>>>
>>> This can also work on MT8173/83/92/95 // MT6795/6893/etc.
>>> You can remove the `mediatek,gce-client-reg` properties in their
>>> dtsi
>>> and cherry-pick this series to verify it. :-)
>>>
>>
>> This is curious - and that brings more questions to the table (for
>> curiosity
>> more than anything else at this point).
>>
>> Since this is a way to make use of the CMDQ for address ranges that
>> are not tied
>> to any subsys id (hence no gce-client-reg and just physical address
>> parsing for
>> generating instructions), do you know what are the performance
>> implications of
>> using this, instead of subsys IDs on SoCs that do support them?
>>
> 
> The main advantage of using subsys ID is to reduce the number of
> instruction.
> Without subsy ID, you will need one more `ASSIGN` instruction to assign
> the high bytes of the physical address.
> 
> E,g. In mt8195-gce.h: #define SUBSYS_1c00XXXX 3
> 
> If you want GCE to write the value 0x0000000f to 0x1c00_002c.
> 
> With subsys ID, you can use only one instruction to achieve it:
> 1. WRITE value: 0x000000f to subsys: 0x3 + offset: 0x0002c
> - OP code: WRTIE = 0x90
> - subsys ID: 0x1c00XXXX = 0x03
> - offset: 0x002c
> - value: 0x0000000f
> 
> Without subsys ID, you will need 2 instructions to achieve it:
> 1. ASSIGN address high bytes: 0x1c00 to GCE temp register: SPR0
> - OP code: LOGIC = 0xa0
> - arg_type: register, value, value = (0x8)
> - sub OP: ASSIGN = 0x0
> - register index to store the assign value: SPR0 = 0x0
> - value to assign: 0x1c00
> 2. WRITE value: 0x0000000f to temp register: SPR0 + offset:0x002c
> - OP code: WRITE = 0x90
> - sub OP(temp register index): SPR0 = 0x0
> - offset for temp register: 0x002c
> - value: 0x0000000f
> 
>> Being clear: if we were to migrate a SoC like MT8195 to using this
>> globally
>> instead of using subsys ids, would the performance be degraded?
>> And if yes, do you know by how much?
>>
> 
> E,g. If the inst number with subsys ID is N.
> 1. If CMDQ is implement like this, then inst number will be (N * 2):
> assign SPR0 = 0x1c00
> write A to SPR0 + offset: 0x2c
> assign SPR0 = 0x1c00
> write B to SPR0 + offset: 0x3c
> assign SPR0 = 0x1c00
> write C to SPR0 + offset: 0x4c
> ...
> 
> 2. If CMDQ is implement like this, the inst number will be (N + 1 * n):
> assign SPR0 = 0x1c00
> write A to SPR0 + offset: 0x2c
> write B to SPR0 + offset: 0x3c
> write C to SPR0 + offset: 0x4c
> ...
> 
> When the same cmd buffer changes the base address for n times:
> assign SPR0 = 0x1c00
> write A to SPR0 + offset: 0x2c
> assign SPR0 = 0x1c01
> write B to SPR0 + offset: 0x2c
> assign SPR0 = 0x1c02
> write C to SPR0 + offset: 0x2c
> assign SPR0 = 0x1c00
> write D to SPR0 + offset: 0x3c
> ...
> 
> So you can imagine the performance will increase, but maybe not too
> much if we use it in the right way...
> Except the old SoC that didn't support SPR and CPR. The reason will be
> addressed in the next paragraph.
> 
>> What you're proposing almost looks like being too good to be true -
>> and makes
>> me wonder, at this point, why the subsys id was used in the first
>> place :-)
>>
> 
> That's because of the old GCE version in the old SoC only support GPR,
> it didn't support SPR and CPR.
> 
> GPR:
> All 32 GCE threads share the same GPR0~GPR15, GPR will be affected by
> other GCE threads if they use it at the same time.
> 
> SPR:
> Each GCE thread has 4 SPR, SPR won't be affected by another GCE thread.
> 
> CPR:
> All 32 GCE threads share the same CPR, there are over 1000 CPR can be
> used. It need to be managed properly to avoid the resource conflicting.
> 
> Due to the GPR resource restriction in the old GCE version, the usage
> of subsys ID can avoid GPR conflicting issues when multiple GCE threads
> are using GPR to physical assign high bytes all the time.
> 
> 
> I have simplified some complicate instruction rules, so the description
> above may not be 100% matched to the CMDQ helper driver code.
> But I think the main concept is correct.
> Hope these explanation can help well :-)
> 

Jason, that's simply wonderful. Thanks a lot for this precious description.

Yes, this has clarified even more than I was asking for, and besides,
yeah I know that there are some rules to follow, some of which I know,
some of which I imagine - and describing all of that would need lots
and lots of text - again, I know, and no worries about that! :-D

Thanks again!
Angelo

> Regards,
> Jason-JH Lin
> 
>> Cheers!
>> Angelo
>>
>>> Regards,
>>> Jason-JH Lin
>>>
>>>> Thanks,
>>>> Angelo
>>>>
>>>>
>>>
>>
>>
>>
> 


