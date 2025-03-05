Return-Path: <linux-media+bounces-27603-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13ED6A4FCDC
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 11:55:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 53C591885646
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 10:55:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E3D8221F0B;
	Wed,  5 Mar 2025 10:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="NER7FOob"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371A8219310;
	Wed,  5 Mar 2025 10:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741172120; cv=pass; b=BYR8T2tkjoDi6/Q4yCEYe1oLN7lqS/vOENT6y6/WP/BPakBfebKhp2lkHk8oOg6UsgD4/9RSDQt9U6pAX0aF0lTiRiSbW+B//+43P8tZ/XkIjjKc12oSoHo2WrW8unEtXbv5F3B/YTdDDADTypoFkX/omt1z/zE8toZQkXFAB9s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741172120; c=relaxed/simple;
	bh=GYN5w2MzWMmFwGQEgpnu8NbUznqwQSMrIGSbADvQp/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aYrLhPGNBGLRuv7zkJMkeog2uynFqnnla+bLswhQN74veGtC5SW2q0g+nk+nub/3gZvUbcOnrTXbdurEuWVZIG6MR5CgyMyD5jde/T8oL4uVYBy9cCKOY8zLydTe3QTj8jA9Jf2a8VWkQWg2r6PPNb7rWplh0LvtJy/MsEmDit0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=NER7FOob; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1741172021; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BiJghRD32/9FYVLs2P+J6fdCaN/zWK2c6LsW9GDhkmnrTrn1F8t+JSlVmTEu5YcwX+0dg5OkcD8GstwF2BLIHiCLWE90e6j2x8ntlKYRPLd6iHeY+EIvfdTBwlkRkM2LbFa1oHEBhZQNlVrvEuknvYR27ChTUxB+c2iJRA6s1qM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741172021; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=dRMz26do/txZBi10Mcoz5fXmESW0PSVQ9DKG49HFVjY=; 
	b=dC4JJlkhKTXyRwbwtv3Gvyx0h1v3ETJftoZo6tjE2HwirDOxjj2U6uInf1BfNELhHaTpgYaw4ME+GSG3mg3GYASzUFJuk2SNH3WN/hWlfXhhq+joPk2QFVP9+Qr7Evcf9xh3JD5TFWlr6tzuHk1YaxJAEX52zqcCUEkz5fNpQY0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741172021;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=dRMz26do/txZBi10Mcoz5fXmESW0PSVQ9DKG49HFVjY=;
	b=NER7FOobCE625v+5FstETaN/ynlDtm8YWSnCb1UekBY6fC6tzgxYHiZE4muEc6xC
	KAar5OSGfLCjt1BOtWqzI9ENXU2A1Y5/n54JIsxY4RjWhkWwagN0jDzC7z0ecxgvEmm
	nzuYnJZMkz4j2YRWFcFab0lOoGOg6eXYz9MLZzL8=
Received: by mx.zohomail.com with SMTPS id 1741172020269320.1572108278864;
	Wed, 5 Mar 2025 02:53:40 -0800 (PST)
Message-ID: <077b7bbb-8ef9-4dcd-9b91-90af4653851b@collabora.com>
Date: Wed, 5 Mar 2025 13:53:34 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 0/6] Add Synopsys DesignWare HDMI RX Controller
To: Tim Surber <me@timsurber.de>, Hans Verkuil <hverkuil@xs4all.nl>,
 Shreeya Patel <shreeya.patel@collabora.com>, Heiko Stuebner
 <heiko@sntech.de>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, jose.abreu@synopsys.com,
 nelson.costa@synopsys.com, shawn.wen@rock-chips.com,
 nicolas.dufresne@collabora.com,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: kernel@collabora.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Diederik de Haas <didi.debian@cknow.org>
References: <20250304085819.108067-1-dmitry.osipenko@collabora.com>
 <78ff36f6-01a7-4df4-b653-c4509fb93af4@timsurber.de>
 <1039aca7-89b9-44ef-9775-e7852e956362@timsurber.de>
 <9b4b1e65-127d-422b-a359-a1d8e25652f9@xs4all.nl>
 <88054acf-3051-414c-aef7-4c0f085d5182@collabora.com>
 <47e022f4-1c1b-43c4-8f6c-bc1ff23ad39f@collabora.com>
 <e0e144be-5cf9-4a79-a602-2ab2b7cd9aa1@timsurber.de>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <e0e144be-5cf9-4a79-a602-2ab2b7cd9aa1@timsurber.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 3/5/25 13:41, Tim Surber wrote:
> Hi,
> 
> so the 4:4:4 issue was just a gstreamer bug and it worked when I applied
> an experimental fix [1].
> 
> So everything works for me using the default EDID now.
> 
> Tested-by: Tim Surber <me@timsurber.de>
> 
> [1]: https://gitlab.freedesktop.org/gstreamer/gstreamer/-/
> merge_requests/8534

Awesome! Glad this has been resolved, thanks for the testing.

-- 
Best regards,
Dmitry

