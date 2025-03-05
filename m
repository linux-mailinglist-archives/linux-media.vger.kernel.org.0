Return-Path: <linux-media+bounces-27564-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3C1A4F991
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 10:11:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA00B16D371
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 09:11:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E858E202F92;
	Wed,  5 Mar 2025 09:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="j9t931as"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978211FF7D0;
	Wed,  5 Mar 2025 09:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741165854; cv=pass; b=LUrmadZDXJzyX6z2LkcnpMY0OystsA0+pDOPr4tTuI7xR9YVTMKbS3wm8TO6l+KEUSE83m2bLjuHvnz7GhdxcqRVvXuau351CGoaCUHTfaR7f+hSS1Xm3x3jeprsVtrnMNGViD9F7GXRQVeIcg75tzCNDOtIklGEH9yR3C3HrNI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741165854; c=relaxed/simple;
	bh=ZeMII2LobHBV1+VzxJg5e13dRyeAlEuXhOfHz5/iCtg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=n0xkzLBiTJ4BeMBkj1V5dSHf4nNdb5XNXj6uodPOUGWPGQmh3aDV9OVYZ1KBaZ8vxmKx6tHWs16yCYpKyKPjElwRYXhzokQbm+ee7OzpWi19VwaCpmV5G0SlYTAzNTxKf4rUmrQOGFutXYmZK0g+5w6lbyXkAPdlPUejiqwqtPA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=j9t931as; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1741165793; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QWP26Zpf/2Y+YVxGNVy/zpxg0I2XvqbYey5trGNSVdlRyLXwepeuPjShJ3nCnd2tmlfh7Q2kroKcmovCNY9Bk8ct3c1DOP2V1PFHDWZgJ/w/LY9MQt5+Rz1+jFWXtq2uN0O01Sy6xZ78TnB4CYRUUl9v/9KmvVP3rZqoeX5mtH0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741165793; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=nGcLm1aJv735AsMkQ8JaZt50lGTZiMqT3vbnxNVHSH8=; 
	b=gIjw8o1KIYq6oNnf4mx7VnLqhxuUbKJ5D9MxhHX4kwjLgdVRTyDzMI39j59J3BonK0XpGsoHaoyXeyx7XZ77jjRk+V/BvBltMr59O80pwYaOaWa3VNRmIq4PWqvYLgmT5NiZ0NYka10y/dPBdgoWCPH9xjbunhzdyCzs76HfUcw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741165793;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:From:From:To:To:Cc:Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=nGcLm1aJv735AsMkQ8JaZt50lGTZiMqT3vbnxNVHSH8=;
	b=j9t931asQs/qeJBusUKhbqaxDfuHXS94Cmip6FYpoFe55OGi/y1Gt3IzCEV1rmei
	G0CNqOD6nTVXbeuK0skt6c/tB8FLei5A3G1Uz0PkxletcU1ufcJ3oTwinV53tlYn2Y0
	lPoJws3maivbNTXYc5rixt5bKqm/d/J7Ph1Bitog=
Received: by mx.zohomail.com with SMTPS id 1741165792142676.5079231064726;
	Wed, 5 Mar 2025 01:09:52 -0800 (PST)
Message-ID: <47e022f4-1c1b-43c4-8f6c-bc1ff23ad39f@collabora.com>
Date: Wed, 5 Mar 2025 12:09:46 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 0/6] Add Synopsys DesignWare HDMI RX Controller
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Hans Verkuil <hverkuil@xs4all.nl>, Tim Surber <me@timsurber.de>,
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
Content-Language: en-US
In-Reply-To: <88054acf-3051-414c-aef7-4c0f085d5182@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 3/5/25 12:03, Dmitry Osipenko wrote:
> On 3/5/25 11:10, Hans Verkuil wrote:
>> On 05/03/2025 01:59, Tim Surber wrote:
>>> Hi Dmitry,
>>>
>>> I did some more testing. That the Apple TV did not work was a bit 
>>> misleading.
>>>
>>> It was just, that the Apple TV defaulted to 4:4:4 Chroma which does not 
>>> work at all for me. (The same happens using the vendor driver).
>>>
>>> When I changed the EDID to match the vendor driver the HDMI handshake 
>>> happened with 4:2:0 chroma, where I could verify even 4k60fps using your 
>>> driver, nice!
>>>
>>> So the remaining problems I see are:
>>> - 4:4:4 chroma not working in any resolution
>>> - 4:2:2 and RGB not working in 4k60fps (is this a hardware limitation?)
>>>
>>> A possible workaround could be to disable these non supported formats in 
>>> the default EDID.
>> I would like to merge this driver this week, since otherwise it will likely
>> slip to v6.16. So if there is a working EDID, perhaps it can be used for now,
>> and later on it can be patched if there is a better EDID.
>>
>> Would this EDID work? Tim, can you try this?
>>
>> v4l2-ctl --set-edid type=hdmi-4k-600mhz,ycbcr444,ycbcr422
>>
>> Alternatively, if there is indeed a HW limitation that prevents 4kp60 to work,
>> try this:
>>
>> v4l2-ctl --set-edid type=hdmi-4k-300mhz,ycbcr444,ycbcr422
>>
>> Whichever of the two works is what we can use as default EDID.
> 
> Disabling 444 and 422 is an option. Though, they work on my setup at
> 4k@60p.
> 
> In general, it often a challenge to get 4k@60p properly with any of
> these small board devices. 4k@60p works only using a short HDMI cable
> for me. Also, not everyone aware that the micro HDMI adapter needs to be
> compliant with HDMI 2.0 for 4k@60, that's why 300MHz is the default.
> 
> Will be nice to have the good EDID enabled by default in the defconfig.
> Dealing with problems like that will be a headache for majority of
> people, IMO.

BTW, I don't see it as a blocker. Driver works in general, new issues
can be resolved with additional patches.

-- 
Best regards,
Dmitry

