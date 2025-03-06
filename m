Return-Path: <linux-media+bounces-27746-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 770A6A550C0
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 17:27:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 448583B3AA5
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 16:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78A9E21518A;
	Thu,  6 Mar 2025 16:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="BhRt9yrL"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D83C212FAA;
	Thu,  6 Mar 2025 16:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741278333; cv=pass; b=mvUl7iiAJF74IGPQ3P3RIMpM0VwzEoN6AFWiUTKwLGwyDn4Eq2O6sawtKEl0+09z+HP7TcN48nN8SfHw04O9UxLs4K3BdDb5QyDzWDAGt64G8gfkosvsoER+NTfp71yQuut+IzGR8I12UMxlyZpxXoLYW+RWxp8AL1z8DRv5L+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741278333; c=relaxed/simple;
	bh=vr5DAy9ceHLtnLRH99uBpmG5TcbFiqRbRoBO2QRpjzE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tN/P1iJ9yIQiuDVfOVhIHBu8dC8Ut4sI5r4t30K7CnXLJOitt4FCQDdkHiH4uJruxlyEyDG+/OYyc95aAdiEZV4+IMtRp9fbLeaQNRAfM9xH2WiwT4eII+yWSH/Cf0x65m09RKboEEhbW9KWqppLLEz7mR5iYvFYBnuEVbVVjoA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=BhRt9yrL; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1741278274; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fYWr6dlfBopZYtEVg2WVCTt+2CnpilKMolUDQGbPbDpEYZTppAkCSPLfOjrGzbrCIZKbgEyVJKd5KGiOc03qCFzUu7aprWjKuYTu0nZ6Fsc3fk3vlHQ+ONm6OQRCMZTRZhVOLkxJiIG5bQwQb5o3r+WNi5/VExmRlDjJihB2vhM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741278274; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=xvxYduVFYl3X9Opku3Ljw9Ut8BVpYJ9gpFoUg4cVVaE=; 
	b=SKXmVvEbNZ0LLv1Pppb6Tozb8NfacNKGwR5elYlWEC4tUPaFpTa9h+B+NwDaqFLO1ZJFqXknvgtScjXR0TwYlnQTrd9Xb51JEmy7wuRMu/lIkdbTiHB8LWdh5O7ffn2MP2fIWlvH9STdC59jgNOkXJqpqLamwS6GMBrrdtd0Dlo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741278274;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=xvxYduVFYl3X9Opku3Ljw9Ut8BVpYJ9gpFoUg4cVVaE=;
	b=BhRt9yrLqCObz9my61SnB8MefVOuVkWvay600WprbHm6cP5+dDDdTlnMNaPAWKAh
	0Up6eKd/PwW5il+HBFTI5j6ir5z588cjGfh2P+NQ7PBe+hxIUP/6NoNjHfwfcm+hCNc
	p1yebKmAtrkLg5kSk1LzzDFIP+sVtbazDH5xcb/s=
Received: by mx.zohomail.com with SMTPS id 1741278271741820.4467682880896;
	Thu, 6 Mar 2025 08:24:31 -0800 (PST)
Message-ID: <3f5da931-081a-4859-8833-655a5b5a3b9d@collabora.com>
Date: Thu, 6 Mar 2025 19:24:25 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 1/3] arm64: dts: rockchip: Add device tree support for
 HDMI RX Controller
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Shreeya Patel <shreeya.patel@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, jose.abreu@synopsys.com, nelson.costa@synopsys.com,
 shawn.wen@rock-chips.com, nicolas.dufresne@collabora.com,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: kernel@collabora.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Tim Surber <me@timsurber.de>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Diederik de Haas <didi.debian@cknow.org>
References: <20250306072842.287142-1-dmitry.osipenko@collabora.com>
 <9489391.T7Z3S40VBb@diego>
 <f5f3dd36-0f90-47dd-bc12-1e2f0207fe7d@collabora.com>
 <3216426.Mh6RI2rZIc@diego>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <3216426.Mh6RI2rZIc@diego>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 3/6/25 19:16, Heiko Stübner wrote:
>>>> +		pinctrl-0 = <&hdmim1_rx>;
>>>> +		pinctrl-names = "default";
>>> hmm, this might be better living in the board dts?
>> HDMI RX controller is a part of the SoC, it's not specific to a
>> particular board. If you meaning move it into rock5b.dts, then we
>> definitely shouldn't do it. It's like moving PCIe controller node into a
>> board DT 🙂
> sorry, should've been clearer. I meant the pinctrl.
> There are two sets of pins hdmim0-rx and hdmim1-rx which one is used is
> board specific.
> 
> Can you check if "most" boards use the M1 variant?
> 
> Rationale being, that if we know that most boards use the same set of
> pins, it's likely ok to just have the minority boards override it.

Will check, thanks for the clarification!

-- 
Best regards,
Dmitry

