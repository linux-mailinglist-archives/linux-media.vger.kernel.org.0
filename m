Return-Path: <linux-media+bounces-10887-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0DF8BD06F
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 16:38:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 71B511F23411
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 14:38:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4060615350F;
	Mon,  6 May 2024 14:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="FLCl/YV3"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254B5152E19;
	Mon,  6 May 2024 14:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715006319; cv=none; b=e/kw+f2x7kZQUUkkvxIfsOnvjndCITSCg5GmU5QEI/ezqVwgvm6IcVDUEFWzjpBeeCrjoG2COhnZ7O31Xl/GAbutWlfxMZCrLPnyfozmCqTKxGk+TzU28MdRUkePrjuh40yvnPnoeW7GH/c4bMrYpXcTLfOCWL/f8z2ENVeQMz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715006319; c=relaxed/simple;
	bh=KGPDfZwI4ubFEcvrrWnuUTNMJQCXV8Ilj2eLN3CMFYk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=TRjnL7VxohJLzfq+VCQtLiPi/rrPYtrVERfXWFD3xz8Wa70KdyLoS4caPsR3NwESPwFE146389cCe+UeKKQyjp53zlms3448G8eBeRi/acLFShmgzHJSOy+8jtLzatejeidalMGZYz3pXrJvQjtWTes19ZcIssnsM1nyABPigL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=FLCl/YV3; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1715006316;
	bh=KGPDfZwI4ubFEcvrrWnuUTNMJQCXV8Ilj2eLN3CMFYk=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=FLCl/YV3TJSICHUDZL5pxebArkcfqWznV0LA/FTCX5sNREJSSLO+gHG07AcCkfvdT
	 0gmBg4LSzEFFoKzCVkPbvoqQhCn0x4nwpYtW5jUET+ib7no9Lfb8ZBjosbe08r+Z9P
	 u2jBplgHw9tqT8Rv2O6HpGlmrrbRHqt/cYnnBlBtvqCgegZsH+JbqvYhW2icaAS+nh
	 bS3YheixnaWj3WY1SGzkuoR6ZN0VchuaBnY3VWEIXJtP1pCbyPUUWFjNFM37cZsLHl
	 szq8g7lx9zv3fJdwBjJsg7AUyEj9BhB/mWbaoi1r9QUUgcNvnX6FhZSwEszzRVjgpk
	 3Wa9VzavpqEVw==
Received: from [100.93.89.217] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id BC0FA3781107;
	Mon,  6 May 2024 14:38:35 +0000 (UTC)
Message-ID: <3dde932a-1b62-4824-a9e0-722f82faaaa6@collabora.com>
Date: Mon, 6 May 2024 16:38:35 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: verisilicon: Fix auxiliary buffers allocation size
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>, ezequiel@vanguardiasur.com.ar,
 p.zabel@pengutronix.de, mchehab@kernel.org, heiko@sntech.de
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
References: <20240328093439.18712-1-benjamin.gaignard@collabora.com>
 <20240328093439.18712-2-benjamin.gaignard@collabora.com>
 <c8de69fc6cb6029e96f3e6b6c1eeb1de9304ccff.camel@ndufresne.ca>
 <2a3b897a-71f7-4a94-a13c-1aa8b2d96e78@collabora.com>
Content-Language: en-US
In-Reply-To: <2a3b897a-71f7-4a94-a13c-1aa8b2d96e78@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 05/04/2024 à 10:13, Benjamin Gaignard a écrit :
>
> Le 04/04/2024 à 20:00, Nicolas Dufresne a écrit :
>> Hi,
>>
>> Le jeudi 28 mars 2024 à 10:34 +0100, Benjamin Gaignard a écrit :
>>> Use v4l2_av1_tile_info->tile_cols to know the number of colons
>>> in the frame. This made auxiliary buffers meory size computation
>>> more accurate.
>> Seems like this is potentially going to impact some conformance 
>> tests. Anything
>> to report from fluster results ?
>
> Flusters AV1 score is the same.
> Maybe we have been lucky when allocating memory until now.
> That said the test stream have 8 tile columns which is unusual but 
> admitted by AV1 specifications.

Gentle ping,
Regards,
Benjamin

>
> Benjamin
>
>>
>> Nicolas
>>
>>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>>> Fixes: 727a400686a2 ("media: verisilicon: Add Rockchip AV1 decoder")
>>> ---
>>> .../media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c | 3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git 
>>> a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c 
>>> b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
>>> index cc4483857489..65e8f2d07400 100644
>>> --- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
>>> +++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
>>> @@ -257,7 +257,8 @@ static int 
>>> rockchip_vpu981_av1_dec_tiles_reallocate(struct hantro_ctx *ctx)
>>>       struct hantro_dev *vpu = ctx->dev;
>>>       struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
>>>       struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
>>> -    unsigned int num_tile_cols = 1 << 
>>> ctrls->tile_group_entry->tile_col;
>>> +    const struct v4l2_av1_tile_info *tile_info = 
>>> &ctrls->frame->tile_info;
>>> +    unsigned int num_tile_cols = tile_info->tile_cols;
>>>       unsigned int height = ALIGN(ctrls->frame->frame_height_minus_1 
>>> + 1, 64);
>>>       unsigned int height_in_sb = height / 64;
>>>       unsigned int stripe_num = ((height + 8) + 63) / 64;
>>

