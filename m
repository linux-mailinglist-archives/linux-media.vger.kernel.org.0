Return-Path: <linux-media+bounces-45935-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DDAF4C19EA8
	for <lists+linux-media@lfdr.de>; Wed, 29 Oct 2025 12:02:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9C4BA4E7BE8
	for <lists+linux-media@lfdr.de>; Wed, 29 Oct 2025 11:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 215102E5402;
	Wed, 29 Oct 2025 11:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="npceiVXa"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3952D8395;
	Wed, 29 Oct 2025 11:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761735642; cv=none; b=aVLU4/0i0mjluE3cEWO3Qm4SytFzJB+4jHVwLt5+Jc03LwBXVoP+It8DFNpSccgY5z2cOnthkYcYLa9KAdi4miuRHQ62mol9hHIyr0PawFJU6y7I5K8VPCZx6E16zCIbaWDqJAtJA8s19qp3KUErO4EF19XW22gJgbYVoW2+Vf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761735642; c=relaxed/simple;
	bh=AUNH3u8bUF8JoMehOHg6y00+85aYv43ceW1GQNK7K5s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PUZgcGIGTDN946eHZVLlN6K0ag/9JH0fhug9r1k7NRxVsRbfegTmG3oOPlg3v6msCloIij9/Z/7DODwxxCKtzYZvKpvCd4yc95A9WXThVHqkJ7PrYIjVXtwXa3iVf2DcKpV8WQOuJ0g1WaioXPQaTVCYl72U/yoC4DzJMU9+Mb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=npceiVXa; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761735638;
	bh=AUNH3u8bUF8JoMehOHg6y00+85aYv43ceW1GQNK7K5s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=npceiVXaTi0bcWltz/elJ2izmVPaJxNQfRfpfBaK8UTFwuPZdfN3zVBRtpkCMNsv+
	 VQv3/j0SmSX/99v/AW5H1pWEDf0vkB9r/lV0LO4QobLJRMsNRZNwS43Reo8yNycTcn
	 WM+Q4H/vwPN9z/KMwq3zUsN1+RfSDJgcObSW3cDv7A5vUMjiSBcsMGVXRvAZkuAkOI
	 O/ZD+mPnlwq4Lath0eWq88jkRiNiMPqjy5lm/bgw7DBt6/HwoXCllw9tKBkSYWYbfe
	 B8WahyXgtqjdfqet3rV+cGrq7VeXN5JSJdWdZ7WW/svX6AiMCzkh6LfI/J7cQhWkJT
	 GREuVRg4QKMig==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 293B417E00A6;
	Wed, 29 Oct 2025 12:00:37 +0100 (CET)
Message-ID: <ef7fa25a-d8bc-4b57-8b96-c676ae7f9cb7@collabora.com>
Date: Wed, 29 Oct 2025 12:00:36 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 10/20] soc: mediatek: mtk-cmdq: Extend cmdq_pkt_write
 API for SoCs without subsys ID
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 =?UTF-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
 =?UTF-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?UTF-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
 <Xiandong.Wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "nicolas@ndufresne.ca" <nicolas@ndufresne.ca>,
 =?UTF-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "fshao@chromium.org" <fshao@chromium.org>,
 =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "wenst@chromium.org" <wenst@chromium.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
References: <20251017065028.1676930-1-jason-jh.lin@mediatek.com>
 <20251017065028.1676930-11-jason-jh.lin@mediatek.com>
 <24b74989-4e31-49e3-8652-c2439f368b26@collabora.com>
 <1f1377ebec26f767a4af9a0c542817be7cfaeddc.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <1f1377ebec26f767a4af9a0c542817be7cfaeddc.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 23/10/25 06:03, Jason-JH Lin (林睿祥) ha scritto:
> On Mon, 2025-10-20 at 12:04 +0200, AngeloGioacchino Del Regno wrote:
>>
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>
>>
>> Il 17/10/25 08:44, Jason-JH Lin ha scritto:
>>> This patch extends the cmdq_pkt_write API to support SoCs that do
>>> not
>>> have subsys ID mapping by introducing new register write APIs:
>>> - cmdq_pkt_write_pa() and cmdq_pkt_write_subsys() replace
>>>     cmdq_pkt_write()
>>> - cmdq_pkt_write_mask_pa() and cmdq_pkt_write_mask_subsys() replace
>>>     cmdq_pkt_write_mask()
>>>
>>> To ensure consistent function pointer interfaces, both
>>> cmdq_pkt_write_pa() and cmdq_pkt_write_subsys() provide subsys and
>>> pa_base parameters. This unifies how register writes are invoked,
>>> regardless of whether subsys ID is supported by the device.
>>>
>>> All GCEs support writing registers by PA (with mask) without
>>> subsys,
>>> but this requires extra GCE instructions to convert the PA into a
>>> GCE
>>> readable format, reducing performance compared to using subsys
>>> directly.
>>> Therefore, subsys is preferred for register writes when available.
>>>
>>> API documentation and function pointer declarations in
>>> cmdq_client_reg
>>> have been updated. The original write APIs will be removed after
>>> all
>>> CMDQ users transition to the new interfaces.
>>>
>>> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
>>> ---
>>>    drivers/soc/mediatek/mtk-cmdq-helper.c | 54 +++++++++++++++++
>>>    include/linux/soc/mediatek/mtk-cmdq.h  | 83
>>> ++++++++++++++++++++++++++
>>>    2 files changed, 137 insertions(+)
>>>
>>
>>> diff --git a/include/linux/soc/mediatek/mtk-cmdq.h
>>> b/include/linux/soc/mediatek/mtk-cmdq.h
>>> index 154d0511a0ad..f6dc43c036bd 100644
>>> --- a/include/linux/soc/mediatek/mtk-cmdq.h
>>> +++ b/include/linux/soc/mediatek/mtk-cmdq.h
>>> @@ -57,6 +57,10 @@ struct cmdq_client_reg {
>>>        phys_addr_t pa_base;
>>>        u16 offset;
>>>        u16 size;
>>> +     int (*reg_write)(struct cmdq_pkt *pkt, u8 subsys, u32
>>> pa_base,
>>> +                      u16 offset, u32 value);
>>
>> (*pkt_write)
>>
>>> +     int (*reg_write_mask)(struct cmdq_pkt *pkt, u8 subsys, u32
>>> pa_base,
>>> +                           u16 offset, u32 value, u32 mask);
>>
>> (*pkt_write_mask)
>>
>> those names make a lot more sense.
>>
> Hi Angelo,
> 
> The reason why I use reg_write/reg_write_mask is to imply these APIs
> only provide writing HW register address function, not writing DRAM
> address.
> So we don't need to care about mminfra_offset in these APIs.

Sure I understand that we don't need to care about mminfra_offset - but those
function pointers are effectively replacing the "(xyz)pkt_write" functions.

Changing the name to reg_write will create a lot of confusion.

> 
> I can add comment for this.
> 
> What do you think?
> Or should I change its name to pkt_write/pkt_write_amsk?

Please change the name to pkt_write/pkt_write_mask and if you think it's useful
also add a comment saying that those functions are already accounting for the
mminfra_offset internally.

Cheers,
Angelo

> 
> Regards,
> Jason-JH Lin
> 
>> After applying the requested changes,
>>
>> Reviewed-by: AngeloGioacchino Del Regno
>> <angelogioacchino.delregno@collabora.com>
>>
>>>    };
> 


