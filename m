Return-Path: <linux-media+bounces-39944-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BB0B270D3
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 23:28:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52098587E5C
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 21:26:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F157278772;
	Thu, 14 Aug 2025 21:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KtzwqwI9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F6226CE3B;
	Thu, 14 Aug 2025 21:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755206763; cv=none; b=oL6KwoTqHf5pyz9H9NGWhPxgno/J9wiCnP0BFAmU4IiarOOkrHuy3pPXvZauS58nWpM5/6v5RWt8HUnVcg+tyIF7UhnVRyBCAymI21jbQ0k2UuhqW/MJGq/Baqj1tSL98cp3zxNPXPWtufrePZGUMoOU0Sy0v0naLqvv4Pn/5gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755206763; c=relaxed/simple;
	bh=z5QOGpyUA1TCTWcqxoa5hcJTooYG8d4ZOicta7ZQhqE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PVHhK3Ame/KBGq5fOwSUuA/ug9euU758+yZsT7L2fTP1HsziyydNSOnjgOr75rNFaoCGw6fBSinb8xUFdxpo3Yux0idNNU/RavPoDltIoR5tkuthHOmYVmLlP30zeIltbwNt+7mJ/T0Zvw/wfjBmaME1u5Y+cSInjeYUPlzVx3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KtzwqwI9; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6188b5ae1e8so1521743a12.0;
        Thu, 14 Aug 2025 14:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755206760; x=1755811560; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=patX2vIVx2VZdtOMO344MhTz8iIxU1BCXzaQwd8zvfA=;
        b=KtzwqwI9TQiHoyxzu2UBgFsyBUcUcqoMsXzyv9kvbkpiQYt6n1JG2PmBFbmlGFmMzS
         ypvw1rO9bwwkj67jZDSjgWwLzYN8zagD6g9WTqW8R/X/WG5exwlP/7LdpT2FvFbYNCn2
         z7gGz/2R3mEaxljr+Lbf9FOx/hQH4tzeP0rGnS/uHl4QEOJXJ0egZ1ptaYEttn3GQNZ5
         yFsFn84YSOCWD4VE1U9lubI0vH7x1M5WqEs0lZwQzoBPEhxup+pCFF45as8qfCYjChr8
         /oNJYgTGu1mqjzmCUJvmswjHXDxQvKzsfo0ze/5OAKfoF3W6/IGndQ1NnrYhCT+zAMRV
         t5Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755206760; x=1755811560;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=patX2vIVx2VZdtOMO344MhTz8iIxU1BCXzaQwd8zvfA=;
        b=pkSklxrN06vu0FtUzxGwPSjp76ERG/mn8K7pAjJ+S4wkZFTzurs+Y+QPAZqnTF6Ozz
         FMAGIe7x3Y8+YVzVH9+kspBXvmfR61MRp8dx5UKYvjbkOUWH9mwPDRZCXb/nZSeLh3io
         eFo2XvPG38oOxoHmIodFEyBTVPAw+KzJB8xds1ABc80TZROQ6hTMYW6n2z5WT3Fb07ue
         gPVBzZPUxbJAUsqRqesBQDXd8MfiOfZuHPliJCKBiI8Q5mipYRzMbNqMjmd2X194NBLd
         LnYt2PFUWjgftIg2/dgYBnDOEKF+a/aTxi7z66gp76ckur48wTsanX3esunaRruN5wXM
         s6Wg==
X-Forwarded-Encrypted: i=1; AJvYcCU57JBkm8QBsvDlbQm2DY8tx4A50s+aeR4ah/cRM8Q7zBIeeTvoZuxRO9nqUSr2hzlkjJMp8NrBX7F6cGva@vger.kernel.org, AJvYcCX9JVrWmys8G4W91fCTuQ3pttTFL7H40rYoT6lL61dj+wQ+duVkwAIpyEMV9Yl5Qu2uWicKKhjKuZek@vger.kernel.org
X-Gm-Message-State: AOJu0Yzza8Q/beBno1SwGJ9keylspCPOJd0oesGcPHh+trQPG2fLFNwv
	LqQINnqERP4USf1VHoJVbmUJZfDXzCKQYstDTRuf2FzPS0h/uqOVGZs=
X-Gm-Gg: ASbGnctM9Q7iDKVxKSGsgK9gUQRQihO3vTgi5yP5NhcQthn3dNeZDTl0AYO54v2TGns
	dDvGmd7W9itapRdTdTc7gZzjglmf6izuvttuWIO7laXWOF8h9/2n9g6tqK/YlopVvLn6ruZLS0M
	HagyaSOkVUKiiLWZ9iKEny1mZhU2DFMgniKA61I3nENjxCiw8EGL2J4fhJ4J1RXoNs2GiYRy/QN
	HRojs0lXD7vzEjrDuc+86r5hcf333sFjb3xd+37HgN+KIUks06w7X/Y8XSV3fKfRqx4JPS4RkeW
	QBy8iyeDrb4OxWEpcPvrVSfWqL3bRCosF6ikO5q5tmX/CiW7nhk7vGALj7e5ddZua9DQDGw1GRu
	7cmyK+kCAJySvkDA3vaKxhl9/m/Jh4VElWf6kXu+YgpFSIa4nTI0TFxkW3o1UmIq4vGUw
X-Google-Smtp-Source: AGHT+IGQBAOe9+pUmD246MgUsug2rRdBSlXKtIWuZA7wf0KueWL/EGJK62RMc4Ud1fidFL3HR4xItw==
X-Received: by 2002:a17:907:3ea6:b0:aec:5a33:1549 with SMTP id a640c23a62f3a-afcb98a1765mr452734666b.40.1755206759611;
        Thu, 14 Aug 2025 14:25:59 -0700 (PDT)
Received: from ?IPV6:2a02:810b:f13:8500:a367:e001:3d74:b64a? ([2a02:810b:f13:8500:a367:e001:3d74:b64a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0763d8sm2680294866b.2.2025.08.14.14.25.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 14:25:58 -0700 (PDT)
Message-ID: <09030afe-553d-46d7-bf85-d1c1fa73c352@gmail.com>
Date: Thu, 14 Aug 2025 23:25:57 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] media: rkvdec: Add HEVC backend
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Diederik de Haas <didi.debian@cknow.org>, Jonas Karlman <jonas@kwiboo.se>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250810212454.3237486-1-jonas@kwiboo.se>
 <DC0FTXJNW0KB.3I8DLNHJVL21O@cknow.org> <DC0GRKB9V014.1J7A2PO1B7U8H@cknow.org>
 <816fa42715e8bc4bf538371975f97b6d102a74f5.camel@collabora.com>
Content-Language: en-US
From: Alex Bee <knaerzche@gmail.com>
In-Reply-To: <816fa42715e8bc4bf538371975f97b6d102a74f5.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 12.08.25 um 15:27 schrieb Nicolas Dufresne:
> Le mardi 12 août 2025 à 14:55 +0200, Diederik de Haas a écrit :
>> Hi again,
>>
>> On Tue Aug 12, 2025 at 2:11 PM CEST, Diederik de Haas wrote:
>>> On Sun Aug 10, 2025 at 11:24 PM CEST, Jonas Karlman wrote:
>>>> This series add a HEVC backend to the Rockchip Video Decoder driver.
>>>>
>>>> Patch 1 add the new HEVC backend.
>>>> Patch 2-3 add variants support to the driver.
>>>> Patch 4 add support for a rk3288 variant.
>>>> Patch 5 add a rk3328 variant to work around hw quirks.
>>>> Patch 6-7 add device tree node for rk3288.
>>>
>>> It looks like I had a previous version of linuxtv-rkvdec-hevc-v2 branch
>>> locally and that also had this commit:
>>> - media: rkvdec: Keep decoder clocks gated
>>>
>>> Is that one no longer needed/useful/etc ?
>>>
>>> And 'chewitt' also had a commit to fix 8/10-bit selection:
>>> https://github.com/chewitt/linux/commit/4b93b05d2ca608bc23f1d52bcc32df926d435c7c
>>> "WIP: media: rkvdec: fix 8-bit/10-bit format selection"
>>>
>>> I haven't tried that one (yet), but did  try an other variant with
>>> changing the ordering in rkvdec_hevc_decoded_fmts but that didn't work
>>> in my tests. (Can ofc be PEBKAC)
>>>
>>> Would that be useful? I do/did have consistent problems with playing
>>> 10-bit encoded video files.
>>
>> nvm about the 10-bit problem. It exists, but it's not restricted to HEVC
>> as it also exists with with H.264 files.
> 
> The referred patch is against some out-dated kernel. In mainline linux with
> have:
> 
> 	if (sps->bit_depth_luma_minus8 == 0) {
> 		if (sps->chroma_format_idc == 2)
> 			return RKVDEC_IMG_FMT_422_8BIT;
> 		else
> 			return RKVDEC_IMG_FMT_420_8BIT;
> 	} else if (sps->bit_depth_luma_minus8 == 2) {
> 		if (sps->chroma_format_idc == 2)
> 			return RKVDEC_IMG_FMT_422_10BIT;
> 		else
> 			return RKVDEC_IMG_FMT_420_10BIT;
> 	}
> 
> Which covers all cases supporte by the hardware. Chewitt seem to add a
> previously missing 10bit case, and forcing downconversion from 422 to 420. A
> downconversion is something to be chosen and applied by userspace, the kernel
> should pick a non-destructive format by default.

Please note that this patch is completely unrelated to this series, as it
is for Detlev's WIP rkvdec2 driver [0] and for H.265 codec only - rkvdec2
similar to rkvdec(1) only supports NV12 and NV15 for H.265 codec and
perfectly matches what is defined at [1].

[0] 
https://gitlab.collabora.com/detlev/linux/-/tree/add-vdpu381-and-383-to-rkvdec-v2
[1] 
https://gitlab.collabora.com/detlev/linux/-/blob/15352e295a0d38bd0450f608e7bbcbf16dfefd6b/drivers/media/platform/rockchip/rkvdec/rkvdec.c#L333

> Nicolas
> 
>>
>> Cheers,
>>    Diederik
>>
>> _______________________________________________
>> Linux-rockchip mailing list
>> Linux-rockchip@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-rockchip


