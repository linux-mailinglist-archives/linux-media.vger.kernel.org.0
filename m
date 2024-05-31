Return-Path: <linux-media+bounces-12344-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A65938D62CA
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2024 15:18:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A1E91F27055
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2024 13:18:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE329158A18;
	Fri, 31 May 2024 13:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="PZNOBgYk"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A221576026;
	Fri, 31 May 2024 13:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717161511; cv=none; b=Uet26mrl+tbv4LQ9x5zPannIz+HiFqhLoqqKQt6hZZGN4NXKKuUV8f59AIgyqcKHnWBGpgd4M+Ac3Bw+ZAl4jxT50CrGjJYzgB1u+HdSeiQTV+OepNy2JUy12M5/uiMi5JQPNSzbLUyQYN17fSh/EcZ+J7Ykb76l2DTXfXj4IUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717161511; c=relaxed/simple;
	bh=9ToqhLdDm3Lv0unVgp4q54GDEy3+ECfVo4HpKZgOrRQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CaOOqBxFiN+DIkUfsJP+QHCvi88pJjFZz1dlyrZ5pc9Kx1sXjZOjC4iAb7du8miX5vHXRhzAu5lidypJyvn0BZoDAM6f2xdAPQf9N3InuPJEPIjDtCdrB7tBTDil23EKz8LnbRK+p2V5mM6+I1ySatMk92gLj8CJA5dsVRqTRXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=PZNOBgYk; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717161507;
	bh=9ToqhLdDm3Lv0unVgp4q54GDEy3+ECfVo4HpKZgOrRQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PZNOBgYkdqyr3Lb1pE/AdvqcNXREPFrbF7bhy229EcaDkSd7AAVW1crTb4aR3Wtaj
	 S31A1+wrDZXu4hWRrEDyxHFVcbXt+4ump++cmKipREdMYTuvkozUJ928NHtmpTFdyB
	 6h1VJySrKmJQD+smVESRu47hziL0BX2umw9xAPcVT2TlIt5lmPHwVH8hGZv8w6uvu1
	 mWWVYHB8TcgXC/Ipv9NttCqJbBvBJgwqrh8jWsyRCWfQUl5D7DbTYvH0/dj6fhhTw3
	 boXzGEcvz4+SbybenUhJJiXWMj1FWw3ayuMFu9g/mD+7QU7eJcXXhkVklCL4MtUmyY
	 ZY5mh+M+2AgTg==
Received: from [100.93.89.217] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 77D1D37821B7;
	Fri, 31 May 2024 13:18:27 +0000 (UTC)
Message-ID: <293f67d6-649c-40c1-9204-f17f59374b4a@collabora.com>
Date: Fri, 31 May 2024 15:18:26 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: verisilicon: AV1: Correct some registers fields
 size or position
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de, mchehab@kernel.org,
 heiko@sntech.de
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
References: <20240521152603.120723-1-benjamin.gaignard@collabora.com>
 <d11d92e48321e8c1a429a878917e7c6a6211ea4b.camel@collabora.com>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <d11d92e48321e8c1a429a878917e7c6a6211ea4b.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 31/05/2024 à 14:48, Nicolas Dufresne a écrit :
> Le mardi 21 mai 2024 à 17:26 +0200, Benjamin Gaignard a écrit :
>> Some fields aren't well positionned or with incorrect size inside the
>> hardware registers. Fix them.
>>
>> That doesn't impact Fluster score test.
> Does it impact any known streams though ? (just for a sake of documentation, not
> really a problem with your change).

I have see no impact with the files we currently use or test with fluster.

>
>> Fixes: 727a400686a2 ("media: verisilicon: Add Rockchip AV1 decoder")
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>
>> ---
>>   .../media/platform/verisilicon/rockchip_vpu981_regs.h  | 10 +++++-----
>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_regs.h b/drivers/media/platform/verisilicon/rockchip_vpu981_regs.h
>> index 182e6c830ff6..990f8e69524a 100644
>> --- a/drivers/media/platform/verisilicon/rockchip_vpu981_regs.h
>> +++ b/drivers/media/platform/verisilicon/rockchip_vpu981_regs.h
>> @@ -327,7 +327,7 @@
>>   
>>   #define av1_apf_threshold		AV1_DEC_REG(55, 0, 0xffff)
>>   #define av1_apf_single_pu_mode		AV1_DEC_REG(55, 30, 0x1)
>> -#define av1_apf_disable			AV1_DEC_REG(55, 30, 0x1)
>> +#define av1_apf_disable			AV1_DEC_REG(55, 31, 0x1)
>>   
>>   #define av1_dec_max_burst		AV1_DEC_REG(58, 0, 0xff)
>>   #define av1_dec_buswidth		AV1_DEC_REG(58, 8, 0x7)
>> @@ -337,10 +337,10 @@
>>   #define av1_dec_mc_polltime		AV1_DEC_REG(58, 17, 0x3ff)
>>   #define av1_dec_mc_pollmode		AV1_DEC_REG(58,	27, 0x3)
>>   
>> -#define av1_filt_ref_adj_3		AV1_DEC_REG(59, 0, 0x3f)
>> -#define av1_filt_ref_adj_2		AV1_DEC_REG(59, 7, 0x3f)
>> -#define av1_filt_ref_adj_1		AV1_DEC_REG(59, 14, 0x3f)
>> -#define av1_filt_ref_adj_0		AV1_DEC_REG(59, 21, 0x3f)
>> +#define av1_filt_ref_adj_3		AV1_DEC_REG(59, 0, 0x7f)
>> +#define av1_filt_ref_adj_2		AV1_DEC_REG(59, 7, 0x7f)
>> +#define av1_filt_ref_adj_1		AV1_DEC_REG(59, 14, 0x7f)
>> +#define av1_filt_ref_adj_0		AV1_DEC_REG(59, 21, 0x7f)
>>   #define av1_ref0_sign_bias		AV1_DEC_REG(59, 28, 0x1)
>>   #define av1_ref1_sign_bias		AV1_DEC_REG(59, 29, 0x1)
>>   #define av1_ref2_sign_bias		AV1_DEC_REG(59, 30, 0x1)
>

