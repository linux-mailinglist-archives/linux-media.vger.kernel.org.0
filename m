Return-Path: <linux-media+bounces-49222-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 480ACCD2A27
	for <lists+linux-media@lfdr.de>; Sat, 20 Dec 2025 09:21:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4A2D3018F74
	for <lists+linux-media@lfdr.de>; Sat, 20 Dec 2025 08:21:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2877F2F690D;
	Sat, 20 Dec 2025 08:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZGJHdIoi"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AE422423A;
	Sat, 20 Dec 2025 08:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766218879; cv=none; b=T86mWLNdbtWmbBtOH8zM+xgr6lA+RY5S57Jquwbxs1BseemgVePHkiVuMY16vexvU41MGRtONylfga9io+cIbbbGaZKBBrUxDuRZVUXriEr4eA7gxyxx8XK3IDqPVWsIQm3G4oir6PWhj7OEcubyVA08QR9tYHnrZh6nrCOjs2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766218879; c=relaxed/simple;
	bh=pv+2YFkvzJC1LYSuun6Keow+Q8M+cNCIxbRUe8gETb0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ds9JjmKjhy6zH953znOCAJBGKsoFc0bTJ7Ehoo2udD6yvH7MqGlVUrVE9rKOm0YFuCoiz7w4vJVhPb+gAzCyzGSf8jFGokSPy2Ueku/h3IvsfobuMEkb9LCflMjC/Tp+uQTn0XZP0XqQaNgzkxwEH2AEMR6bpuKxdf/JKadcxl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZGJHdIoi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8090C4CEF5;
	Sat, 20 Dec 2025 08:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766218878;
	bh=pv+2YFkvzJC1LYSuun6Keow+Q8M+cNCIxbRUe8gETb0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZGJHdIoi77DFoMm8+ZdknWUH3TnJpjtUsCTYx6g6Tyv6V69Rtrt0TF9olHYNAdqvi
	 D1GSEPV2c9+HoP91fim5M61fnUXC2ZzfCJIxddao1DY56iKhEgwMsDJr5nuCtR8fA2
	 qM8TgrUY0XrAfm+jyhSoAzCCvl01UoBWqc0xoO9dua7WJvxrdmv+3+FEd2n3QfPNog
	 CHPM9J70gomNQcg9CvByAKYc2JCki6N95PaCGtYxuT/YOTtQQP90kGL4tu/1PqAJHH
	 X0mPQHyetYoGXC0pvkvUcJJ9LFv6RNBZXOpBnMLjLVeihUeqMBTihL86tG1MFLw5Ls
	 N6f9MiZ/OfaMw==
Message-ID: <91523e97-95df-464a-9658-d29cdc54f3ae@kernel.org>
Date: Sat, 20 Dec 2025 09:21:03 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] dt-bindings: media: i2c: Add os05b10 sensor
To: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>,
 "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
Cc: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>,
 Hans de Goede <hansg@kernel.org>, Mehdi Djait <mehdi.djait@linux.intel.com>,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dongcheng Yan <dongcheng.yan@intel.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
 Jingjing Xiong <jingjing.xiong@intel.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20251219084526.22841-1-himanshu.bhavani@siliconsignals.io>
 <20251219084526.22841-2-himanshu.bhavani@siliconsignals.io>
 <970b20e1-a98d-43cf-980c-325dc514b997@kernel.org>
 <PN0P287MB2019D9CDB7D2E29A933CDE529AB6A@PN0P287MB2019.INDP287.PROD.OUTLOOK.COM>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <PN0P287MB2019D9CDB7D2E29A933CDE529AB6A@PN0P287MB2019.INDP287.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/12/2025 07:37, Himanshu Bhavani wrote:
> Hi Krzysztof,
>  
>> On 19/12/2025 09:45, Himanshu Bhavani wrote:
>>> From: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
>>>
>>> Add bindings for Omnivision OS05B10 sensor.
>>>
>>> Add MAINTAINERS entry for Omnivision OS05B10 binding documentation
>>>
>>> Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
>>> Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
>>> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>> ---
>>
>>
>> Nothing improved and you did not bother to respond to my comment.
>  
>  
> In v5, you pointed out that the driver and bindings were mismatched with 
> respect to the reset GPIO.
>  
> Based on that feedback, I corrected the driver by making the reset GPIO 
> optional. I also reviewed a previous patch series discussion, as suggested 
> here:
> https://lore.kernel.org/linux-media/20250710210532.GE22436@pendragon.ideasonboard.com/
>  
> In that thread, Laurent suggested that GPIOs should be made optional in the 
> driver, which is what I followed in this version.
>  
> If I have still missed something or misunderstood the feedback, please let me
> know and I will address it.

I expected reply or change in the binding. None was there, so that's why
you got questions.

Best regards,
Krzysztof

