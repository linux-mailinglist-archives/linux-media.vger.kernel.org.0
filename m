Return-Path: <linux-media+bounces-10888-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D568BD072
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 16:39:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 239A31F23E16
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 14:39:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BB5D153504;
	Mon,  6 May 2024 14:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Ka6OY6yZ"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129731534E8;
	Mon,  6 May 2024 14:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715006337; cv=none; b=Waef2V6j3D4Hn9s1H8sNpdDzVRVZJ7ukpj/NZqMUPnBgGy0NQ/VWXVYc5m4EBRSXMPLFmeS120drqBBPfJIaeY4xKvgd7ASjRJ2pYLPFvr9ugZluHLaOGpPpE9L6dzeYFDoGbCBNNfVePzy0/R0RISsUOKfwpUZ+k4n1/LUvHw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715006337; c=relaxed/simple;
	bh=27tHSW1zl7ehj6fVxvf4O5x37/NDiU0iDr5TcXznQAQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=KH7aLKf4WdRjhDh6EBQoQqqLWrNa4qRr0ZTZell0cQAMLttraIR4N+EhUY4tul0kYja9kvG9XW+48ASUYBiMifEEV28KA3xmkiCP0tTgbJt1FWFEGxWhnLs1zF7J4etnXJgPCmzQzxtBZHAiLIKkZbB0Vtemd847nlHffLPjQyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Ka6OY6yZ; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1715006334;
	bh=27tHSW1zl7ehj6fVxvf4O5x37/NDiU0iDr5TcXznQAQ=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=Ka6OY6yZfrHN6wP/B4YWxipAoFoi4Gv2tqTmEd/8d+1NsD0nmxJS9fg566Yje1GWu
	 Ov6JBpMQ6fIf+G1MtReBJd+Yisz9KbLOUplNZX6oa8ATXWh1DQxmCKyslvXX8xYBuX
	 f0yVrQUcqvtEK1waV2VSjhhsvyqcRZhxu6j3vJxXdEFTSt3BEON7TTN250+4gdW2j2
	 ZGbNtR/J0mMe7HZFeYYZZaDTWJ5wRQuR3OxdAWV6Igx9Gk2v1UetPWZG/svFB+TIq8
	 +O6SExrzXZFBwYs32v5f4ZlRlZCgul90qSSsZXG8Ubxk2JkJ7oHqyIL+Xz77oGpywA
	 MgQEiWHCdS+0A==
Received: from [100.93.89.217] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E804E3781107;
	Mon,  6 May 2024 14:38:53 +0000 (UTC)
Message-ID: <c747a5e6-e3f2-4bea-87e2-92b71501db9a@collabora.com>
Date: Mon, 6 May 2024 16:38:53 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: verisilicon: AV1: Be more fexible on postproc
 capabilities
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>, ezequiel@vanguardiasur.com.ar,
 p.zabel@pengutronix.de, mchehab@kernel.org, heiko@sntech.de
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
References: <20240328093439.18712-1-benjamin.gaignard@collabora.com>
 <e4d01c27aa976c44e0b7122e39111be062a4deb4.camel@ndufresne.ca>
 <ebbe249f-bce6-4e81-969f-c63ab4b063f3@collabora.com>
Content-Language: en-US
In-Reply-To: <ebbe249f-bce6-4e81-969f-c63ab4b063f3@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 05/04/2024 à 10:17, Benjamin Gaignard a écrit :
>
> Le 04/04/2024 à 19:59, Nicolas Dufresne a écrit :
>> Hi,
>>
>> Le jeudi 28 mars 2024 à 10:34 +0100, Benjamin Gaignard a écrit :
>>> RK3588 post-processor block is able to convert 10 bits streams
>>> into 8 bits pixels format.
>> Does it come with any HDR to SDR capabilities ? cause stripping off 2 
>> bits means
>> that tone mapping will cause a lot of banding as it won't have the 
>> expected
>> precision. I'm simply trying to make up the big portrait so we don't 
>> just offer
>> yet another foot gun. But perhaps its fine to offer this, its just 
>> that we don't
>> have a mechanism to report which pixel format in the selection will 
>> cause data
>> lost.
>
> No it just to enable post-processor capabilities like we have already 
> for G2/HEVC.
> Since it is a post-processor pixel format it will be enumerated after 
> V4L2_PIX_FMT_NV15_4L4
> so it will update to userland to decide to use it or not.

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
>>> Fixes: 003afda97c65 ("media: verisilicon: Enable AV1 decoder on 
>>> rk3588")
>>> ---
>>>   drivers/media/platform/verisilicon/rockchip_vpu_hw.c | 1 -
>>>   1 file changed, 1 deletion(-)
>>>
>>> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c 
>>> b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
>>> index f97527670783..964122e7c355 100644
>>> --- a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
>>> +++ b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
>>> @@ -82,7 +82,6 @@ static const struct hantro_fmt 
>>> rockchip_vpu981_postproc_fmts[] = {
>>>       {
>>>           .fourcc = V4L2_PIX_FMT_NV12,
>>>           .codec_mode = HANTRO_MODE_NONE,
>>> -        .match_depth = true,
>>>           .postprocessed = true,
>>>           .frmsize = {
>>>               .min_width = ROCKCHIP_VPU981_MIN_SIZE,
>>

