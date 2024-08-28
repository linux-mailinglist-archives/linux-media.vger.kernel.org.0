Return-Path: <linux-media+bounces-16997-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9205E9623D1
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 11:42:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C4E111C2353A
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 09:42:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0E88166F36;
	Wed, 28 Aug 2024 09:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=julien.massot@collabora.com header.b="kOjnqEjt"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7852D647;
	Wed, 28 Aug 2024 09:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724838129; cv=pass; b=RqltUu62hewaPG2yoDlv5VGU7J1v8aYXjD2pT380an6ifKIqMEoGiLVCvH0qHiw4MN3K8yFQs7KW6H6PelKnL5jGDqaXEsWLxJ5GbMR5P+0LpgVug8fnMyyGVc+P2JE/4wxtz5RDb6dw0K49Or1KkT247/ZcZ67+gq+ZrNETCaA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724838129; c=relaxed/simple;
	bh=BXFveLFy7EE4XptvQH5zXUr9kMlBfPsZ1de5Au1Pc18=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=spJpQz04iKu6o9k5AVjwHWx4a6XcpM5QFBY4k4FFfpNZdFjUfeqx6ba7YCCMLPwioIWXC4SABiiCu3jlZE23QvEYpG6po8CAfeepd52azd7mA7Wtvx/GJEJaWM6gUySresZFam0gVkD0b0JEI0xKixzSuAeZ9cz05+kLzqXGgSE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=julien.massot@collabora.com header.b=kOjnqEjt; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724838116; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZDihHRl1qYNkg+26/kxNxFZ97dilCXT449rQhJCP9H1+PLf1ChDEuVkWVBX4/HnGqSEH42ecjUv1OHAnuuvZVnuVpfAhfWA5GW9F39u/2+JQ5bMGkY1Qt9Ahy7zdvZxmTuSaQJS7kcbDTGSvtUfYk8GM4C3kXClFsybrTdZL83g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1724838116; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=M3ipHdSVH2GTfAAKY7VvXF1dDp14wZPeMTzn8mH/MUw=; 
	b=GO7IWTxksjQs8iFJh08frr6pRMuVLKoKxpM50NRF5oKR6NXlbQyuGGQ2cLF0wTWL3Ljh2k/fhXWg3BVPcuPfTO1BCrMBuQIWgDVA7t7RLwSbAoWJXeGCI8ydR7+RgzJtEJpAcpKvnM0QkSPLqDlRW87kTz/hdCdKioMybT9MyeQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=julien.massot@collabora.com;
	dmarc=pass header.from=<julien.massot@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724838116;
	s=zohomail; d=collabora.com; i=julien.massot@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=M3ipHdSVH2GTfAAKY7VvXF1dDp14wZPeMTzn8mH/MUw=;
	b=kOjnqEjtXIpOHd+9ob18Q/Mio7wfsX76NlE3v9NsbyJF3DlfAHTHYfuMrUymKPAQ
	zD+PfrRVD7xbPZfUGXpqkdP+XjHaASpyOnqUjqczHYvku02mXkQuZUbgu9iFFXUUZyt
	fJtronXTBCx0yea6v2cLtfmeDXMkdjdp7QSuki+w=
Received: by mx.zohomail.com with SMTPS id 1724838115424884.5008707516188;
	Wed, 28 Aug 2024 02:41:55 -0700 (PDT)
Message-ID: <d3bb906b-9182-4b3a-b8d7-f54de4a4893d@collabora.com>
Date: Wed, 28 Aug 2024 11:41:51 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] media: staging: max96712: Add support for MAX96724
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-staging@lists.linux.dev
Cc: linux-renesas-soc@vger.kernel.org
References: <20240827131841.629920-1-niklas.soderlund+renesas@ragnatech.se>
 <20240827131841.629920-3-niklas.soderlund+renesas@ragnatech.se>
Content-Language: en-US
From: Julien Massot <julien.massot@collabora.com>
In-Reply-To: <20240827131841.629920-3-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Hi Niklas,

On 8/27/24 3:18 PM, Niklas Söderlund wrote:
> The MAX96724 is almost identical to the MAX96712 and can be supported by
> the same driver, add support for it.
> 
> For the staging driver which only supports patter generation the big
> difference is that the datasheet (rev 4) for MAX96724 do not describe
> the DEBUG_EXTRA register, which is at offset 0x0009 on MAX96712. It's
> not clear if this register is removed or moved to a different offset.
> What is known is writing to register 0x0009 have no effect on MAX96724.
> 
> This makes it impossible to increase the test pattern clock frequency
> from 25 MHz to 75Mhz on MAX96724. To be able to get a stable test
> pattern the DPLL frequency have to be increase instead to compensate for
> this. The frequency selected is found by experimentation as the MAX96724
> datasheet is much sparser then what's available for MAX96712.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
> * Changes since v1
> - Group in series together with binding.
> ---
>   drivers/staging/media/max96712/max96712.c | 26 ++++++++++++++++++-----
>   1 file changed, 21 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
> index 6bdbccbee05a..6bd02276c413 100644
> --- a/drivers/staging/media/max96712/max96712.c
> +++ b/drivers/staging/media/max96712/max96712.c
> @@ -17,8 +17,10 @@
>   #include <media/v4l2-subdev.h>
>   
>   #define MAX96712_ID 0x20
> +#define MAX96724_ID 0xA7
I sent some comments on the first serie about the device revision register.

https://patchwork.kernel.org/project/linux-media/patch/20240527133410.1690169-1-niklas.soderlund+renesas@ragnatech.se/

Can you fix them in your next patch version ?

Regards,
-- 
Julien

