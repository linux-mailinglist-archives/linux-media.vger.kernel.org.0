Return-Path: <linux-media+bounces-27008-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 139D4A45A11
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 10:26:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1451F3AC7EF
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 09:25:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABE60226CF2;
	Wed, 26 Feb 2025 09:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="Au9uBnob"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879092135C8;
	Wed, 26 Feb 2025 09:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740561951; cv=pass; b=H7WFLtjNzvZ5pnfCD4DAgUBSyM+n9jwkB5vb6o8D7Cj0TtUwiQ2opdmBpoWjhaNGJl7S2HrkMaarwiaD0VrYWmu5NkL0esh+pi19l8Nvwu7cql9qCaRYeiILFFtZdAHbS8XZ1hNeQYNePcvRxh68ShlqwFG9dEQyGeBvd4Rd2zI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740561951; c=relaxed/simple;
	bh=1pMf73z2aCoj+FMzFwoTCiqJuDrSFSA0D44yHK/qnbg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VpUdqlVu+GCvybfcJnu+HqzUyQNAeb9Og5iNucU3DtzMz6GDHf65BlJe9bjCGSxsHhjPVnijF4xp9lI4i9bwklMP22Q8A6BhhNY470ALADqz8IvGzSSJWeO94YfLafCcDZK6ZSK6KnkMSguBRoYR6ze1ItRSriRteo6lTd1LXCI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=Au9uBnob; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1740561900; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=h6jMGyNquMYiuM227g9wPaaTmMMKGJl/CrNRqyizQVbr6EknV/fyQAPekngWO1X5DsQiIN4Js07AvuA+Yvk+tA8YKpEnm+jJvSfZd4c/6RlL2gvjiJDPVD2Depq9PWH5jzQUb0wqj97LHwHb2pxfSG2DBxFlDJF5yvv7RpJIGpU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1740561900; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=HQxcDlER3epDHU7gCY5nogKiIBVZBqXqRS/yzoOYA5k=; 
	b=KFvC/X8oxjJwlCK1JL1gZcfnb5+ihTbDGSkh/1Qrd7ttMlK3NvjXPhEsLNmaVoEebd6mG++JJ/JNEyzzbexl4UlThEILnJAotKcUlScrBWvv+7w2XBj8CJ/ItsnL4clyYYuvqr+w3VpLUaEdtZ14Lpw9ao35d65S5qpPt7eMe38=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740561900;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=HQxcDlER3epDHU7gCY5nogKiIBVZBqXqRS/yzoOYA5k=;
	b=Au9uBnobaAWWqJREgg7BOma+yPXfVIT6l631Hzgb7RW6BAG9xkt93duVe1DLGcmp
	Pamusoh7vhtjBw+3MG5I25cw4tg4DFFATJnt1pTWiLVp2Dc68pPeXxcry/tdDmft7jU
	+q38mpOg8or6lUhfgw31FPIewfOwmR4XVBxD1c1M=
Received: by mx.zohomail.com with SMTPS id 1740561898306593.375047630114;
	Wed, 26 Feb 2025 01:24:58 -0800 (PST)
Message-ID: <860e30df-ba7e-4df3-b42a-ad41c3922b0f@collabora.com>
Date: Wed, 26 Feb 2025 12:24:51 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/6] MAINTAINERS: Add entry for Synopsys DesignWare
 HDMI RX Driver
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Shreeya Patel <shreeya.patel@collabora.com>, Heiko Stuebner
 <heiko@sntech.de>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, jose.abreu@synopsys.com, nelson.costa@synopsys.com,
 shawn.wen@rock-chips.com, nicolas.dufresne@collabora.com,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: kernel@collabora.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Tim Surber <me@timsurber.de>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
References: <20250225183058.607047-1-dmitry.osipenko@collabora.com>
 <20250225183058.607047-2-dmitry.osipenko@collabora.com>
 <7763884d-d259-4e52-aac8-73bca5b2ed61@kernel.org>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <7763884d-d259-4e52-aac8-73bca5b2ed61@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 2/26/25 11:44, Krzysztof Kozlowski wrote:
>> +SYNOPSYS DESIGNWARE HDMI RX CONTROLLER DRIVER
>> +M:	Shreeya Patel <shreeya.patel@collabora.com>
> 
> You are sending someone else's patches, which sometimes indicate the
> owner moved on. Nothing in cover letter explains that here so we can
> keep guessing. Anyway if that's the case, this does not look up to date
> anymore, so this either needs fixing or clarifications in at least cover
> letter.

Will re-iterate on the v11 cover letter that Shreeya is currently busy.
Thanks for paying attention.

-- 
Best regards,
Dmitry

