Return-Path: <linux-media+bounces-27587-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2DAA4FC70
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 11:42:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 55B067A151F
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 10:41:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 385D220AF71;
	Wed,  5 Mar 2025 10:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=timsurber.de header.i=@timsurber.de header.b="WF+FIobE"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351D320A5EE;
	Wed,  5 Mar 2025 10:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741171332; cv=none; b=h34AXAa/5R1hsOpOhp2Gza5grNn1x3/+JpHvMF6gLih9Fh4JEu/WNcyP85d2Qs5LAkSCscdPWsxnQhTHXaTYrkxz7yXsWGz5o5b1qacc+1BxsA3ypADtpNkw85B7cscoWmMLTHVlfgaIB+QztOMsnDpy70VYAiIMgIq5QEgsgEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741171332; c=relaxed/simple;
	bh=eHLZnWrhATcm5AHiNd1STWhEnwQ9NvDjfqNPJZbDW4A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MVshCY+Wsc/VzvR5zFY2e3/wOh9jeDlyrDmwCL/TO5VYl4cw9kW5gGcmzjPPAf9oNc6mzJttRDCnLI8m/5ezD4K7KhwToejLI1SxS3ed97E7YFG6INdqAZocLgJuEC67VHvgzxAusItfASXcL1QCAvSPP/1EKFiUvWaXbTAOJNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=timsurber.de; spf=pass smtp.mailfrom=timsurber.de; dkim=pass (2048-bit key) header.d=timsurber.de header.i=@timsurber.de header.b=WF+FIobE; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=timsurber.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timsurber.de
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4Z78Hv66V4z9sDC;
	Wed,  5 Mar 2025 11:42:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=timsurber.de;
	s=MBO0001; t=1741171323;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9rOeGZ2uHJYNH5SGu5DmNFvlkAimADfypO0YBEqe3ok=;
	b=WF+FIobEkjFi0U0Qq/qweJfo/S7s8oCqnDdTMXUXXIHcQYlXjvIK3EpvkFPDQe3UPFoWk0
	ar+7B0eKWDZD7c4HBdB+kD2oyhlaZrqzQ129PQeenYzYu9Q5oNP0QE4yEyECA4ezBqYHnK
	3271dthcCvMN6wSO85m5/7/zEgxrAzWLjCfKjX35bV8Cpf0W3h11w4KosUeKq9wD4FaPEu
	3ShsoXrEGSprr2p9xboIz2RVYm0SRqip4p0FetKD/ahvhF/gmkUfARxWMiVhVBjXiY4Hqa
	FT3W1tMOMwDYCl7G9A4q0jmmAYpnT9wq5/3ihfTe6R4+bVeb4pLfaDVB3dpt+w==
Message-ID: <e0e144be-5cf9-4a79-a602-2ab2b7cd9aa1@timsurber.de>
Date: Wed, 5 Mar 2025 11:41:56 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v13 0/6] Add Synopsys DesignWare HDMI RX Controller
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Hans Verkuil <hverkuil@xs4all.nl>,
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
Content-Language: en-US
From: Tim Surber <me@timsurber.de>
In-Reply-To: <47e022f4-1c1b-43c4-8f6c-bc1ff23ad39f@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 4Z78Hv66V4z9sDC

Hi,

so the 4:4:4 issue was just a gstreamer bug and it worked when I applied 
an experimental fix [1].

So everything works for me using the default EDID now.

Tested-by: Tim Surber <me@timsurber.de>

[1]: 
https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8534

On 3/5/25 10:09, Dmitry Osipenko wrote:
> On 3/5/25 12:03, Dmitry Osipenko wrote:
>> On 3/5/25 11:10, Hans Verkuil wrote:
>>> On 05/03/2025 01:59, Tim Surber wrote:
>>>> Hi Dmitry,
>>>>
>>>> I did some more testing. That the Apple TV did not work was a bit
>>>> misleading.
>>>>
>>>> It was just, that the Apple TV defaulted to 4:4:4 Chroma which does not
>>>> work at all for me. (The same happens using the vendor driver).
>>>>
>>>> When I changed the EDID to match the vendor driver the HDMI handshake
>>>> happened with 4:2:0 chroma, where I could verify even 4k60fps using your
>>>> driver, nice!
>>>>
>>>> So the remaining problems I see are:
>>>> - 4:4:4 chroma not working in any resolution
>>>> - 4:2:2 and RGB not working in 4k60fps (is this a hardware limitation?)
>>>>
>>>> A possible workaround could be to disable these non supported formats in
>>>> the default EDID.
>>> I would like to merge this driver this week, since otherwise it will likely
>>> slip to v6.16. So if there is a working EDID, perhaps it can be used for now,
>>> and later on it can be patched if there is a better EDID.
>>>
>>> Would this EDID work? Tim, can you try this?
>>>
>>> v4l2-ctl --set-edid type=hdmi-4k-600mhz,ycbcr444,ycbcr422
>>>
>>> Alternatively, if there is indeed a HW limitation that prevents 4kp60 to work,
>>> try this:
>>>
>>> v4l2-ctl --set-edid type=hdmi-4k-300mhz,ycbcr444,ycbcr422
>>>
>>> Whichever of the two works is what we can use as default EDID.
>>
>> Disabling 444 and 422 is an option. Though, they work on my setup at
>> 4k@60p.
>>
>> In general, it often a challenge to get 4k@60p properly with any of
>> these small board devices. 4k@60p works only using a short HDMI cable
>> for me. Also, not everyone aware that the micro HDMI adapter needs to be
>> compliant with HDMI 2.0 for 4k@60, that's why 300MHz is the default.
>>
>> Will be nice to have the good EDID enabled by default in the defconfig.
>> Dealing with problems like that will be a headache for majority of
>> people, IMO.
> 
> BTW, I don't see it as a blocker. Driver works in general, new issues
> can be resolved with additional patches.
> 


