Return-Path: <linux-media+bounces-24273-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1371BA0243B
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 12:23:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 042AA1642BA
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 11:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56EF11DC993;
	Mon,  6 Jan 2025 11:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="YGe46b57"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3639CA936;
	Mon,  6 Jan 2025 11:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736162591; cv=pass; b=RtzqADSTFk+eK5inU30DhX3Lm7fKHtXGhlh/NE4FGtaJX/8kbMA/n4VWGmIKWDQF27TC2ZefZpHplexfiHpXLp6DHPIZz0oH6gghurTY5F+CxZBgMfQnizJ7CZIRexQyq8BP5kykKgLBgAlymjt9CC5YT4SJyRh1yn6FniJKJFw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736162591; c=relaxed/simple;
	bh=x1aKJnC5PD7h2dvz0lvkNeHlbBDfj+iet+OLx8Dl8Kw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZNhXp2FeJoOPpKpXhQxPO/S79419E0z+0JIdEhFbfdfXoWrm+3XJevpIBaIx90ieby3AJ9qnBKA0FJ0O0yTDNECJ7efRWORgOIqzTZwxac0VaBwBB75T9IoS0f8tlO5KIzmXfWneAFIgDqBn4UVAxCfA5yswX/r/dIAaFFdUnPU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=YGe46b57; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1736162538; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Fd4GPL7WAp5LG34Vk++s+97YODkquIiSHLE8seNW2x5mg9HCDyEpxYvkBWWKVUtzHftMbUaMbUpYDkQTyGftpE///5AjmVCjAyKNZb69ayywWf783VnZKvhU8EBNprey2Idgqz//f1lOec9M4Rs32NP3B5qbfxX/VkJhjlBmjYM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1736162538; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=tmyr51wBaWMVsQf9Gd5l3648NBOuHaUG4V2slFrV+uY=; 
	b=XoI4KlcZlFWaeYBZIN21DJfdtZTf58mh+VqV+aDjjfknaU0CBJAT3YYBz/KFUaKZ2Bw7E5BN9swbGR7nlPJWpV0iMrMLTv1U/q23AziYYc8b+bXJzKJs3KyuWYNEb5KvUjW/8QIUzvQbOfsjdKvCk/eblkwiwMtgyZcMfHjEKMs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736162538;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=tmyr51wBaWMVsQf9Gd5l3648NBOuHaUG4V2slFrV+uY=;
	b=YGe46b57Y9XwcTg4kGMv9YEn4OWqmTlaA/ibgGfzK88oHWDHviao6wuX+jwHo0vr
	SaId5uLmSrnVIyWk447c8hmxAgnSuY/dUuztJIKk2x6/JJZfyev07jJII/xyhTWnI2m
	3BsV3pRwaj7QjL59CIdWlJGI0woiCNn9QqLRW7W8=
Received: by mx.zohomail.com with SMTPS id 1736162536761759.2420010727011;
	Mon, 6 Jan 2025 03:22:16 -0800 (PST)
Message-ID: <925d7571-48e4-437d-b55c-3f7bbad8af1d@collabora.com>
Date: Mon, 6 Jan 2025 14:22:09 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v5 0/4] Add Synopsys DesignWare HDMI RX Controller
To: Tim Surber <me@timsurber.de>, Shreeya Patel
 <shreeya.patel@collabora.com>, heiko@sntech.de, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
 jose.abreu@synopsys.com, nelson.costa@synopsys.com,
 shawn.wen@rock-chips.com, nicolas.dufresne@collabora.com,
 hverkuil@xs4all.nl, hverkuil-cisco@xs4all.nl
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20241210193904.883225-1-shreeya.patel@collabora.com>
 <acb91a34-c0f8-4f03-8945-755b4e42dcf3@timsurber.de>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <acb91a34-c0f8-4f03-8945-755b4e42dcf3@timsurber.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Hi,

On 1/6/25 03:16, Tim Surber wrote:
> I applied your patch to rockchip/next on an FriendlyElec CM3588 device with arm- 
> trusted-firmware 2.12. This is the same hardware/cable/sources I used previously
> Sadly I could not get it to work at all.
> 
> After connection to a HDMI source I get the following error with all devices and 
> resolutions I tested
> # dmesg
> snps_hdmirx fdee0000.hdmi_receiver: hdmirx_controller_init wait timer base lock 
> failed
> snps_hdmirx fdee0000.hdmi_receiver: hdmirx_phy_register_write wait cr write done 
> failed (repeating multiple times)

Sounds like interrupt may be not working for you. Interrupt won't work
using downstream version of AT-F, though I assume you're using vanilla
version of the AT-F. Could you please show output of `cat
/proc/interrupts | grep rk_hdmirx` after plugging the HDMI cable.

-- 
Best regards,
Dmitry

