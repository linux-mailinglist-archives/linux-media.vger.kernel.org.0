Return-Path: <linux-media+bounces-18519-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E424D9849F1
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 18:45:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20D7C1C227FE
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 16:45:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ABDF1ABEDA;
	Tue, 24 Sep 2024 16:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="OsInmcF9"
X-Original-To: linux-media@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FFE1AC442;
	Tue, 24 Sep 2024 16:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727196326; cv=none; b=gfKUrbjOezhaZZgTJ9n2LQoLUUgdevXE4+wxwRRd6gzlnwoQkVH9HJmID1wBsrpmHGz+H4qNZ2UJYRlYbmht+rCKndSxw1YtEIWb+T4Pm4Shtz3C63Tr3eddIjwbFoOUUTtR/QV3GZURXtJt+tcrRW5dGi9unUyLnpiJ+TE80fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727196326; c=relaxed/simple;
	bh=InCCWoG3adxGtYBl1KJ1A0wtIntYs6J8nTlU5jG90Yo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KP5vgGWw6BrPwCMXpZ6fp3yHcZJTClijpmIyL1pQUMgtMzL0OLZkKTuxp59bEapfy5ZX4Ahb/JLrRYJUHW0ikvkxkbX9jgBzmG6aPMlC4CZz/00GwWijTLx8wtVWa7XiWQzqcHoVPianYJ+YGqaugFGiyCbaIyP1dGF8cacZZtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=OsInmcF9; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id B6FFB88599;
	Tue, 24 Sep 2024 18:45:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1727196320;
	bh=bWwrE328F7Z+63CI6eWDJIHlvUQra1+8FULnnYG6ROQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OsInmcF9MnpWRstLF1yZsIScU3ErKXqFbp7byMIsYMHRpRDmP5qw9rVnNVStMkIf2
	 fKwGGuykws/4A6HnsPiZZQg4oUUm33udBmtt/BuG6bOMI7ajhVr4Bi+4w5NHkSZTsN
	 oi8VlUC+K12JOtnmdiRmAKHtq91v7TYcmEz+0FZt+BlR4KNK/QnKHGfe2SAn1Om427
	 AonOHwCV/HACE3csIk3ZRYqgvadLA5sVu+hDQ7Ntq1Mhf7c7mwdD06YyF7cWVFwEu4
	 6uTTrLXMHR3A8NrD5PB9VgGbf3dLk+q+xtrYzh6I0aGuTQfKMl82Mn0dWH3XIUWL8N
	 zk5rP6G14Z/eA==
Message-ID: <0db95012-3ff6-41bf-85c8-ab0cdffdfc74@denx.de>
Date: Tue, 24 Sep 2024 17:42:14 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] media: imx: vdic: Introduce mem2mem VDI
 deinterlacer driver
To: Nicolas Dufresne <nicolas@ndufresne.ca>, linux-media@vger.kernel.org
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller
 <deller@gmx.de>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Sascha Hauer
 <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Steve Longerbeam <slongerbeam@gmail.com>, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev
References: <20240724002044.112544-1-marex@denx.de>
 <20240724002044.112544-2-marex@denx.de>
 <5e5fba4fd6c3c0c9df23697bd328367e5fdfa923.camel@ndufresne.ca>
 <8aea6cc0-10bf-48b8-add9-eb3f1caa2d66@denx.de>
 <2229769f3a9baf58fbeeed93fa4b0373a02055e3.camel@ndufresne.ca>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <2229769f3a9baf58fbeeed93fa4b0373a02055e3.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 7/30/24 6:05 PM, Nicolas Dufresne wrote:

Hi,

sorry for the abysmal delay.

>>> Le mercredi 24 juillet 2024 à 02:19 +0200, Marek Vasut a écrit :
>>>> Introduce dedicated memory-to-memory IPUv3 VDI deinterlacer driver.
>>>> Currently the IPUv3 can operate VDI in DIRECT mode, from sensor to
>>>> memory. This only works for single stream, that is, one input from
>>>> one camera is deinterlaced on the fly with a helper buffer in DRAM
>>>> and the result is written into memory.
>>>>
>>>> The i.MX6Q/QP does support up to four analog cameras via two IPUv3
>>>> instances, each containing one VDI deinterlacer block. In order to
>>>> deinterlace all four streams from all four analog cameras live, it
>>>> is necessary to operate VDI in INDIRECT mode, where the interlaced
>>>> streams are written to buffers in memory, and then deinterlaced in
>>>> memory using VDI in INDIRECT memory-to-memory mode.
>>>
>>> Just a quick design question. Is it possible to chain the deinterlacer and the
>>> csc-scaler ?
>>
>> I think you could do that.
>>
>>> If so, it would be much more efficient if all this could be
>>> combined into the existing m2m driver, since you could save a memory rountrip
>>> when needing to deinterlace, change the colorspace and possibly scale too.
>>
>> The existing PRP/IC driver is similar to what this driver does, yes, but
>> it uses a different DMA path , I believe it is IDMAC->PRP->IC->IDMAC .
>> This driver uses IDMAC->VDI->IC->IDMAC . I am not convinced mixing the
>> two paths into a single driver would be beneficial, but I am reasonably
>> sure it would be very convoluted. Instead, this driver could be extended
>> to do deinterlacing and scaling using the IC if that was needed. I think
>> that would be the cleaner approach.
> 
> Not that I only meant to ask if there was a path to combine
> CSC/Scaling/Deinterlacing without a memory rountrip. If a rountrip is needed
> anyway, I would rather make separate video nodes, and leave it to userspace to
> deal with. Though, if we can avoid it, a combined driver should be highly
> beneficial.
The VDI mem2mem driver already uses the IC as an output path from the 
deinterlacer, IC is capable of scaling and it could be configured to do 
scaling. The IC configuration in the VDI mem2mem driver is some 10 lines 
of code (select input and output colorspace, and input and output image 
resolution), the rest of the VDI mem2mem driver is interaction with the 
VDI itself.

Since the IC configuration (i.e. color space conversion and scaling) is 
already well factored out, I think mixing the VDI and CSC drivers 
wouldn't bring any real benefit, it would only make the code more 
complicated.

[...]

