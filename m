Return-Path: <linux-media+bounces-47206-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF38C63976
	for <lists+linux-media@lfdr.de>; Mon, 17 Nov 2025 11:39:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 09DBF4EA692
	for <lists+linux-media@lfdr.de>; Mon, 17 Nov 2025 10:33:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6596A2D77E3;
	Mon, 17 Nov 2025 10:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="COkaG7Vm"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B4630C639;
	Mon, 17 Nov 2025 10:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763375620; cv=none; b=ZQL99Vl6V/MNwgq9TjHPcYM+beQNWgvnogsbMccCHHGHvn7zz//yvBad0FCvXM/GDYC1+L7lurP9l0p2vAkuQaWzwZOM3fn4Ixrer/mvAw8RcQWR+AQ9g27HjgZ3BJtoXl99wHlrf7IQyGKyAH0BKmZSSy/M7zcI6YIxnD9/GYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763375620; c=relaxed/simple;
	bh=vaSfU4t7U2cn5yAxDTxbnW+J0huTZf3ya2jZVqfUJ5c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ip2UfBDT7n09ymTYU6KpkFsMhDs2yBiC0pjPIBwR/fK61tn1FB7TVsohzMIskUTnG26kxsG1w+syAj/LgS4kWfyOoKVv9GMWERaYqvsroDPedEpxZM7S4kLY6+QWNMTBqxGFqdCc7rxx9cJNB0C27z+/7m6oUhwcK+y7kyCXG7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=COkaG7Vm; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1763375616;
	bh=vaSfU4t7U2cn5yAxDTxbnW+J0huTZf3ya2jZVqfUJ5c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=COkaG7VmhHg/B+JsDdIRn4dBT/f7lVnRuUxnysgGSkvevwgEpz9ngD2uburz9WSRF
	 HzJVUP4XvqSJntwn2TBSpcOwAtgaqrp2zHgPsE366aGrLFGM4/SBOsNycsFJXjkv07
	 2Lr/ynQHaNeECStBuhsxAnLbJWaaKfrNosYTWgt8RUsw1OOPN6f50K+scftlMnAHw8
	 DIwR4TspiH6dw4b7b0h2lShWkbbmDjVUM7Gy0zWpKf/tsWFCNc6cOoDhnaxGsntkfg
	 IfTacoGWi7xA3ljHPrX2F9eVgOIbeYvXcr71bAfGSIdkXpDaTMPJMW/sRBNOjAlRJF
	 bz/Awcmswlk+A==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9310F17E10F3;
	Mon, 17 Nov 2025 11:33:35 +0100 (CET)
Message-ID: <2a7a0978-0e7c-4c2b-a51e-8056f9ed1d3f@collabora.com>
Date: Mon, 17 Nov 2025 11:33:34 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: dt-bindings: add rockchip mipi csi-2 receiver
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans Verkuil <hverkuil@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Collabora Kernel Team <kernel@collabora.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
References: <20251114-rockchip-mipi-receiver-v1-0-d13086e810dd@collabora.com>
 <20251114-rockchip-mipi-receiver-v1-1-d13086e810dd@collabora.com>
 <7c37017a-0769-4db3-be7f-af5837d4d102@kernel.org>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <7c37017a-0769-4db3-be7f-af5837d4d102@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Krzysztof,

On 11/17/25 11:06, Krzysztof Kozlowski wrote:
> On 17/11/2025 11:01, Michael Riesch via B4 Relay wrote:
>> From: Michael Riesch <michael.riesch@collabora.com>
>>
>> Add documentation for the Rockchip MIPI CSI-2 Receiver.
>>
>> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
>> Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> 
> Please keep only one tag per person.

Oops, OK.

> That's a v1 so I don't get how could you get these above and I could not
> find answer in the cover letter either.

Quote cover letter:

    "These changes have been discussed and reviewed thoroughly (see [0]
    and predecessors).

    [...]

    [0]
https://lore.kernel.org/r/20240220-rk3568-vicap-v14-0-b38b6da0fc80@collabora.com"

That's how I got them.

> 
> Best regards,
> Krzysztof

Thanks and best regards,
Michael


