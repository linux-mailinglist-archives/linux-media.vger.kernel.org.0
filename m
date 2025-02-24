Return-Path: <linux-media+bounces-26867-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 872EFA42C8E
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 20:17:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79B22174BEC
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 19:17:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ED6D1FC7D1;
	Mon, 24 Feb 2025 19:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="dTskuR9F"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-22.smtpout.orange.fr [80.12.242.22])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB879126F0A;
	Mon, 24 Feb 2025 19:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740424666; cv=none; b=p11l7sG1p/O6Rmw6DjMi42MVLVaPbTWppvryEJV53vka7oX4OMqk20HCeWG7xsVGBKsIY8YN/eIdmjxDAeFvdUmaoaBmER7tIVpeuYIwOnb8kUv9IeJ6ZG/ZR96BJa6z6hpXFzKKFxLTGk1bLXMXISkmvaNDi9KKRKwlejCzDNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740424666; c=relaxed/simple;
	bh=PUeRntGvwXImYDS+7i7O0aN6qpNF8PoicxIEo5iasdk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ma47mx7HsOY1jFqr7rCtSEu2MJY7UxELfzMSlPmeNlZWy7fM7sWgWiksHKRzDCUBE8eEQNMXcezgcxyl5mR6OJ0gncPCpLt6niDEo/u9GAEUMih/VKl8Wsm72zIYa/sMkXBRRcVUzhszuqCIsZdorGRc17EcSBrepfdIhV9HddM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=dTskuR9F; arc=none smtp.client-ip=80.12.242.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id mdwGt5kjyKyVdmdwJtBcWJ; Mon, 24 Feb 2025 20:16:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1740424592;
	bh=9VPOLtQg+zqSMxeSCbo0v5e5C1uKf8cqE57WkcwIzms=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=dTskuR9FK1/IIcaRaov8nY9R+bPoGTkJfSWtdVzr5DCQ8GSXiMe/Gv9j9AT7jhyh+
	 eb9hTyQgiyd+gD6n71R/H4jdu4XUEgCIlAvIl9DJQacjP2ZKQkqDGjA/WaeqHI0cSm
	 LYGu20syygD+cGHkgL1Rp1xzSxL0SoWRFTJyfj2Fpse7037OyX36ZSs4LjmvFLOHMZ
	 va7D587KDqw4oLdn7xT+anZF5p2g309POA4ayVMIZhrBZVDkxZPHAicGKJ8M5kT1gO
	 e4gesxROvoK73rdErzscHvUIhecucjaw4piH5UHPQTwNGQGtYT3IdYwcPjhB98Y5UP
	 F+Q6bArp1jsMw==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Mon, 24 Feb 2025 20:16:32 +0100
X-ME-IP: 90.11.132.44
Message-ID: <29687c3c-d983-4d1f-8cde-fde82df84e0e@wanadoo.fr>
Date: Mon, 24 Feb 2025 20:16:23 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/6] media: platform: synopsys: Add support for HDMI
 input driver
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Shreeya Patel <shreeya.patel@collabora.com>, Heiko Stuebner
 <heiko@sntech.de>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, jose.abreu@synopsys.com, nelson.costa@synopsys.com,
 shawn.wen@rock-chips.com, nicolas.dufresne@collabora.com,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: kernel@collabora.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Tim Surber <me@timsurber.de>
References: <20250223173019.303518-1-dmitry.osipenko@collabora.com>
 <20250223173019.303518-5-dmitry.osipenko@collabora.com>
 <88b02c37-6741-459b-b966-d6d58d1f9b6f@wanadoo.fr>
 <c30a291b-c81b-4da1-a0ae-270d323b28e3@collabora.com>
 <bc1f5334-b0fb-4e81-979d-feb17886ac40@wanadoo.fr>
 <d13f13ac-1501-4427-b6d3-ee161eeb932a@collabora.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <d13f13ac-1501-4427-b6d3-ee161eeb932a@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 24/02/2025 à 05:19, Dmitry Osipenko a écrit :
> On 2/24/25 00:11, Christophe JAILLET wrote:
>>>>
>>>>> +    ret = cec_register_adapter(cec->adap, cec->dev);
>>>>> +    if (ret < 0) {
>>>>> +        dev_err(cec->dev, "cec register adapter failed\n");
>>>>> +        cec_unregister_adapter(cec->adap);
>>>>
>>>> Is it needed to call cec_unregister_adapter() when
>>>> cec_register_adapter() fails?
>>>
>>> Yes, it's confusing, but unregister is needed to free the adapter
>>> properly, it's prepared to do it. Thanks for the review.
>>>
>>
>> I don't know this API, so you'll get the last word, but
>> cec_unregister_adapter() does not seem to do that many things in such a
>> case, unless I miss something. See [1].
>>
>> CJ
>>
>> [1]: https://elixir.bootlin.com/linux/v6.14-rc3/source/drivers/media/
>> cec/core/cec-core.c#L370
> 
> On a second look, apparently you're right and
> cec_notifier_cec_adap_unregister() should be used there.
> 

So, maybe in the .remove() function as well?

CJ

