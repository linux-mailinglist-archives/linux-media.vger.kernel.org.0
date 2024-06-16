Return-Path: <linux-media+bounces-13324-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B025909D29
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2024 13:55:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D09391C209E3
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2024 11:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 175DD187358;
	Sun, 16 Jun 2024 11:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="lp8NiBCn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A8616DED7;
	Sun, 16 Jun 2024 11:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.91.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718538933; cv=none; b=DpANXl9AV3b1XLQiI4JLeQMYWVkA/LlQ1zp2EwOJa33TjG1jGB+WPJrwCILexrltG0M7awvlz6x2bSDT2K/qaSKtYMI1cCi2eTbM7bvynCBgpMx60PYoBUNdnDqdEOQv6/3+PAGofHk9wYxMEPwLRiT8VZDK856L7ztcLWzE5VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718538933; c=relaxed/simple;
	bh=FvTVuelNwNx9cbWw7NNoHn9o1aAt7UuF/J0KxqWgJt8=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=UOxPx0Z2rURAROj+u3ieBzyeWaoemzs9tq9Dvip/6WLyl7A7Eln6mv7DUqAJ8PnEo51eqxSzy/n7aMHk9PS7PHnwNNokIxtbY83gi/+INAzcr1bXN2APTCr7NgU/W7OFHOoC8MFQB6zQ1BMq4sDbn0BfUoOpGrYgyLxgvY8857g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org; spf=pass smtp.mailfrom=manjaro.org; dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b=lp8NiBCn; arc=none smtp.client-ip=116.203.91.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manjaro.org
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1718538921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o/mVBey1pUUAnezlicmXpXgXj8Qwj9yoReY/ospObPs=;
	b=lp8NiBCnAttf4fU8LXw3j5OaeEoGWaQYQsnjPLe/cvcoGDXEQvIKZkK9oyjD352fcL9zhl
	R4ihgLmZMENLAFKITuFMnXgPHWKmTwmRodzzs8ciZnOGUD5OuQHvH+ShL+6z/qW6nOH0Jt
	hydAKz4ELF8p5g+r2u8aDTZQk/O46NG5IyxGIIPdMhuXa4/naOcq9MTkPj/5++TwoOwqOd
	VsOBszOE3gkpAq37w1+vJ3CWsR9PsH2UCBpDlIDcGj5egvKjv7uCXolPHYy3WUDq6NESro
	IExMsXqfAZz3U1dW/VohVUj6Zny5g9m1DotU38/6yBgyP2gQun9o9FCebHRsig==
Date: Sun, 16 Jun 2024 13:55:19 +0200
From: Dragan Simic <dsimic@manjaro.org>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Detlev Casanova <detlev.casanova@collabora.com>,
 linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Sebastian Reichel
 <sebastian.reichel@collabora.com>, Alexey Charkov <alchark@gmail.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Diederik de Haas
 <didi.debian@cknow.org>, Andy Yan <andy.yan@rock-chips.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Add rkvdec2 Video Decoder on
 rk3588(s)
In-Reply-To: <f4c140a3-2b11-405c-bfd4-32e50180f6b7@kwiboo.se>
References: <20240615015734.1612108-1-detlev.casanova@collabora.com>
 <20240615015734.1612108-4-detlev.casanova@collabora.com>
 <944c4296-8dd2-4ffd-b430-1839ff3a3ed2@kwiboo.se> <3666279.iZASKD2KPV@arisu>
 <f4c140a3-2b11-405c-bfd4-32e50180f6b7@kwiboo.se>
Message-ID: <7f649d79666a175da7c9d9fd9377a687@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org

Hello all,

On 2024-06-16 11:17, Jonas Karlman wrote:
> On 2024-06-15 21:55, Detlev Casanova wrote:
>> On Saturday, June 15, 2024 4:25:27 A.M. EDT Jonas Karlman wrote:
>>> On 2024-06-15 03:56, Detlev Casanova wrote:
>>>> Add the rkvdec2 Video Decoder to the RK3588s devicetree.
>>>> 
>>>> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
>>>> ---
>>>> 
>>>>  .../boot/dts/rockchip/rk3588-rock-5b.dts      |  4 ++++
>>>>  .../boot/dts/rockchip/rk3588s-orangepi-5.dts  |  4 ++++
>>>>  arch/arm64/boot/dts/rockchip/rk3588s.dtsi     | 19 
>>>> +++++++++++++++++++
>>>>  3 files changed, 27 insertions(+)
>>>> 
>>>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
>>>> b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts index
>>>> c551b676860c..965322c24a65 100644
>>>> --- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
>>>> +++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
>>>> @@ -503,6 +503,10 @@ &pwm1 {
>>>> 
>>>>  	status = "okay";
>>>> 
>>>>  };
>>>> 
>>>> +&rkvdec0 {
>>>> +	status = "okay";
>>>> +};
>>> 
>>> Enable of rkvdec0 should probably be split out from the patch that 
>>> adds
>>> the rkvdec0 node to soc dtsi.
>> 
>> Ack
>> 
>>> Also why is rkvdec0 only enabled on rock-5b and orangepi-5?
>> 
>> I only could test on those two but I can enable it on all rk3588 
>> devices.
> 
> Because the decoder is an integrated part of the SoC the default should
> probably be that the IP is enabled, i.e. no status prop required for 
> the
> vdec and related mmu nodes in rk3588s.dtsi.

Agreed, the decoder is a SoC feature.  As such, it should be enabled on
the SoC level, instead of having it enabled on the board level.

