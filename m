Return-Path: <linux-media+bounces-44402-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 903BABD90BD
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 13:32:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 369A34EB907
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 11:32:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FE5130DEB7;
	Tue, 14 Oct 2025 11:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="nnBFVhMU"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869922E3B03;
	Tue, 14 Oct 2025 11:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760441545; cv=none; b=K1yyMwhAzVCG4I4bmsVKhhoAlpkZHCjEABYsdyh50kOqa/WsvmsdLA5PWsdLqK01vYLtl6Y87TPapNzAgqBICTMsK7DdmlMPTZDrbvfKylT2vniRfLPzkH1VjuPUSpqZU+EiVHPaEYEjG+uXOJDDpvb1guBbCQfVGJRtBLnjOxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760441545; c=relaxed/simple;
	bh=8juqZChkhVdJOJOqCmRgkPRBnkr1y8NTqdNQbKSKwVM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SktZFBKWt2BhmCdhZmQCKre7FMiN+FPJgyQfVJFej7MVKuhPZFoTT9gE27KRelVNjcwBGOn2ufAMnnuepYlgAQydH5m4VHAqbrSFQleYOg95YI2L/pSLgXP2PwcF43zmOW7GEox6bvOEZzty1Gk72q0ugT9yW/imda8YYBkTIm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=nnBFVhMU; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760441541;
	bh=8juqZChkhVdJOJOqCmRgkPRBnkr1y8NTqdNQbKSKwVM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nnBFVhMUh/1GaQxtOa7WgGzBInvLUnfBP0ZJ5exU29pIvQPutfuF6d55LhieayC9S
	 l7wVqv9cR+57AUhZyHQUAGTmHtMQ422yyfQGUxKKhVWVAzrBb7j9RcuzO3IVE5PLWR
	 b1Jpg72ulzl2e4LCz6NHabdLV3QrZcRhBfLq437V5Ww5+Gx2kfh0y08rUNeNx2QEb3
	 Ng/U4TIXz7za7kOR9lnK/kRAtD6MBcMIMp83Q75easNYWXalVYVvWj8KSeABQ0uyIk
	 ezJ0BGUtTbRcp7i/KvzO8BXHOD+uBPk3Zryq9vVtNLnsREVPIjWlMbc6JeQIx0RyIa
	 oHXqlalgkD+ag==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 05DF517E1292;
	Tue, 14 Oct 2025 13:32:20 +0200 (CEST)
Message-ID: <87489f92-7bc0-4494-8532-f8f2d220bd27@collabora.com>
Date: Tue, 14 Oct 2025 13:32:20 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/20] soc: mediatek: mtk-cmdq: Add new APIs to replace
 cmdq_pkt_write() and cmdq_pkt_write_mask()
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, =?UTF-8?B?Q0sgSHUgKOiDoeS/ig==?=
 =?UTF-8?B?5YWJKQ==?= <ck.hu@mediatek.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 =?UTF-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
 =?UTF-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
 =?UTF-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
 <Xiandong.Wang@mediatek.com>, "nicolas@ndufresne.ca" <nicolas@ndufresne.ca>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "fshao@chromium.org" <fshao@chromium.org>,
 =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "wenst@chromium.org" <wenst@chromium.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
References: <20250827114006.3310175-1-jason-jh.lin@mediatek.com>
 <20250827114006.3310175-11-jason-jh.lin@mediatek.com>
 <b2335fd9296bc6f3511f8139870f0c34db1be62a.camel@mediatek.com>
 <fa46fec3f7ca25532c39e6e864ea692e19b7f5bb.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <fa46fec3f7ca25532c39e6e864ea692e19b7f5bb.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 13/10/25 11:50, Jason-JH Lin (林睿祥) ha scritto:
> On Fri, 2025-09-05 at 09:41 +0000, CK Hu (胡俊光) wrote:
>> On Wed, 2025-08-27 at 19:37 +0800, Jason-JH Lin wrote:
>>> To support generating GCE write instructions using both pa_base and
>>> subsys, the original cmdq_pkt_write() and cmdq_pkt_write_mask()
>>> have
>>> been expanded into four new APIs:
>>> - Replaced cmdq_pkt_write() to cmdq_pkt_write_pa() and
>>>    cmdq_pkt_write_subsys().
>>> - Replaced cmdq_pkt_write_mask() to cmdq_pkt_write_mask_pa() and
>>>    cmdq_pkt_write_mask_subsys().
>>>
>>> The original cmdq_pkt_write() and cmdq_pkt_write_mask() will be
>>> removed
>>> after all CMDQ users have migrated to the new APIs.
>>>
>>> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
>>> ---
>>>   drivers/soc/mediatek/mtk-cmdq-helper.c | 41 +++++++++++++
>>>   include/linux/soc/mediatek/mtk-cmdq.h  | 79
>>> ++++++++++++++++++++++++++
>>>   2 files changed, 120 insertions(+)
>>>
>>> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c
>>> b/drivers/soc/mediatek/mtk-cmdq-helper.c
>>> index 41e1997cdd53..7e86299213d8 100644
>>> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
>>> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
>>> @@ -213,6 +213,26 @@ int cmdq_pkt_write(struct cmdq_pkt *pkt, u8
>>> subsys, u16 offset, u32 value)
>>>   }
>>>   EXPORT_SYMBOL(cmdq_pkt_write);
>>>   
>>> +int cmdq_pkt_write_pa(struct cmdq_pkt *pkt, u8 subsys /*unused*/,
>>> u32 pa_base,
>>> +		      u16 offset, u32 value)
>>
>> subsys is useless. Drop it.
>>
>>> +{
>>> +	int err;
>>> +
>>> +	err = cmdq_pkt_assign(pkt, CMDQ_THR_SPR_IDX0,
>>> CMDQ_ADDR_HIGH(pa_base));
>>> +	if (err < 0)
>>> +		return err;
>>> +
>>> +	return cmdq_pkt_write_s_value(pkt, CMDQ_THR_SPR_IDX0,
>>> CMDQ_ADDR_LOW(offset), value);
>>> +}
>>> +EXPORT_SYMBOL(cmdq_pkt_write_pa);
>>> +
>>> +int cmdq_pkt_write_subsys(struct cmdq_pkt *pkt, u8 subsys, u32
>>> pa_base /*unused*/,
>>> +			  u16 offset, u32 value)
>>
>> pa_base is useless. Drop it.
>>
>>> +{
>>> +	return cmdq_pkt_write(pkt, subsys, offset, value);
>>> +}
>>> +EXPORT_SYMBOL(cmdq_pkt_write_subsys);
>>> +
>>>   int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys,
>>>   			u16 offset, u32 value, u32 mask)
>>>   {
>>> @@ -230,6 +250,27 @@ int cmdq_pkt_write_mask(struct cmdq_pkt *pkt,
>>> u8 subsys,
>>>   }
>>>   EXPORT_SYMBOL(cmdq_pkt_write_mask);
>>>   
>>> +int cmdq_pkt_write_mask_pa(struct cmdq_pkt *pkt, u8 subsys
>>> /*unused*/, u32 pa_base,
>>> +			   u16 offset, u32 value, u32 mask)
>>
>> subsys is useless. Drop it.
>>
>>> +{
>>> +	int err;
>>> +
>>> +	err = cmdq_pkt_assign(pkt, CMDQ_THR_SPR_IDX0,
>>> CMDQ_ADDR_HIGH(pa_base));
>>> +	if (err < 0)
>>> +		return err;
>>> +
>>> +	return cmdq_pkt_write_s_mask_value(pkt, CMDQ_THR_SPR_IDX0,
>>> +					   CMDQ_ADDR_LOW(offset),
>>> value, mask);
>>> +}
>>> +EXPORT_SYMBOL(cmdq_pkt_write_mask_pa);
>>> +
>>> +int cmdq_pkt_write_mask_subsys(struct cmdq_pkt *pkt, u8 subsys,
>>> u32 pa_base /*unused*/,
>>> +			       u16 offset, u32 value, u32 mask)
>>
>> pa_base is useless. Drop it.
>>
>>> +{
>>> +	return cmdq_pkt_write_mask(pkt, subsys, offset, value,
>>> mask);
>>> +}
>>> +EXPORT_SYMBOL(cmdq_pkt_write_mask_subsys);
>>> +
> 
> Hi CK,
> 
> I'll drop the unused parameters.
> Thanks for the reviews.

It's unused, but if we want to use function pointers we do need those.

Unless you want to use one variable for both things, which then becomes
kind of janky and unreadable.

Cheers,
Angelo

> 
> Regards,
> Jason-JH Lin


