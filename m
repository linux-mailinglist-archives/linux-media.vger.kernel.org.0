Return-Path: <linux-media+bounces-20614-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B8A9B6FBD
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 23:13:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F4151F221D5
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 22:13:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7335A21745A;
	Wed, 30 Oct 2024 22:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CP14lJEz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87DE32141A3
	for <linux-media@vger.kernel.org>; Wed, 30 Oct 2024 22:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730326418; cv=none; b=gAITf1tdvvzzAnkKruivHzaa7l6LU1l2c1vOHup3ye0hLLBzxBYhNUZbKTyGrpLTEvpagQLi7F7dCIKwF4hsitBJdeyb4E8aSsYFVWid2k1/wMB7XyFQPkAChUi/5blN9VjgkuSPXsUqMHbyCay1Ek1Ul4T2yRQkWuxlnjpW/io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730326418; c=relaxed/simple;
	bh=fgwT0gHbh6JwWE2o92EklteS0EY8RyEo/1yUmC9seSo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JzLJl2Puid57nV6ttJyQiIF48r5Tk2GLWuDjH9P+SLhWPr0cI/4FJIArdTCsnSRlOGrbOSTR0YQ+FiLJyPWiMJQIjd8vAmYgsr3u/qbIn6UjvIE9xDlhAm4hWU/P+XOLe4uPtvvIkP5dyiRm558NHfd2RDK4Pj5udjGq4Dl4Z34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CP14lJEz; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-539e4824917so34366e87.3
        for <linux-media@vger.kernel.org>; Wed, 30 Oct 2024 15:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730326415; x=1730931215; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rIOWGLPyHAbnmQC+s1hOIONGH2xKi9gafSnREwwOXk0=;
        b=CP14lJEzZtHwrzQP1eWoWKeb6427e9BJYb3L4qb2Dv9bTtdmK5xehry+ckShi3J5to
         E1e8BFjPq+bjlw8e5hXxlpRI0xBCjLWHf2NOdPBDy4SqIBuYBUec5c9kWLlr7XY7pXVK
         zAeqkgFkNt48S9YQ4evdIX0Sm0NGOj2GyeeHLrzoZ/7YL0M2ByxB0GEM6g2+bO4JuzQ7
         XDnw8suxR4Ftq5GMLu6RaRYGgegqhjXKwubWQCiULhRbN4FyStqdf+R0LQgM6Y0F/CK2
         Ssrl0VB/NATistxYEhs5QynssZoHvbfiwMofgKeJZNVC1xqucqqZkuzsR8QXMJ0uzOsI
         MHgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730326415; x=1730931215;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rIOWGLPyHAbnmQC+s1hOIONGH2xKi9gafSnREwwOXk0=;
        b=eOHfUFtt9bgEUTaiV6rlCE6VgtQP73a5JJ7DFAQgU/EXOEXQ6RHqvdKJAQuZDjtyUt
         fi813wOuKBOFGVyAJHmOEig2r3Dd8sCF+bnGVW47TeuPFGzrf4vEdOt8naAp/w5+PrBQ
         TeHDVd6KYQ5h2rpBuWYsQDoAFlvZUoan6bLGA0rtnYZF5oByPzCMGx2czjnMiJFixgLq
         lN+0aYXpfYcD60VTrbel117k7WElSvOoJEqGPeGvkCfrXVtXF+Zgiz2NAAih6RkiayRL
         zMwje/iLq0uzsWb8aW+Bq50I2BL8UGB0E3L5sjJw39P6i7ZCwnnmvH+ZkUKgqt8Nkb5x
         4qdA==
X-Forwarded-Encrypted: i=1; AJvYcCWKhogjJd3ziITpT1/u83CYMrhStfYTD+LIlsS0JT5al1wMwII0FCb0C02jtUqPIjQf4uw2qFkUHntP4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpYdQ9HTjllDPU1OsxpQ11KhVPdnJvWXeJnDfzmwCsE3947l02
	SFH0xqQFG55ijwNbtPRJjtNaCQWR4duZ1IFIky1S4FoYdKfQ5rcoZeXgmFgVJjY=
X-Google-Smtp-Source: AGHT+IE6WL5Y9y4VUvgC3PerluD3HeORJgxPkd3sHB908ZvUW+AUqyE/4Nteboj+F28dC19tVwr78A==
X-Received: by 2002:a05:6512:b1c:b0:52f:413:30de with SMTP id 2adb3069b0e04-53b3491ccefmr2686948e87.7.1730326414540;
        Wed, 30 Oct 2024 15:13:34 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bdcc1cbsm16753e87.229.2024.10.30.15.13.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 15:13:34 -0700 (PDT)
Message-ID: <b9a467bd-ad2f-4b6b-a0c3-0d60960023c6@linaro.org>
Date: Thu, 31 Oct 2024 00:13:33 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] dt-bindings: media: camss: Add qcom,sdm670-camss
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Richard Acayan <mailingradian@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-media@vger.kernel.org
References: <20241011023724.614584-7-mailingradian@gmail.com>
 <20241011023724.614584-9-mailingradian@gmail.com>
 <785c82d5-549d-454b-86bf-a00a39e6f521@linaro.org>
 <a230de8f-a11d-41c1-9bc6-7e06e850b51d@linaro.org>
 <20241011144129.GA2295617-robh@kernel.org>
 <ca89bbae-193b-4636-b1a6-ff0c9cecae58@linaro.org>
 <CAL_JsqKwaT4q-VHqfLXAabdGtKvRtnh7SFiELpyXDGVRRpOoYQ@mail.gmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <CAL_JsqKwaT4q-VHqfLXAabdGtKvRtnh7SFiELpyXDGVRRpOoYQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/30/24 23:06, Rob Herring wrote:
> On Wed, Oct 30, 2024 at 9:20 AM Vladimir Zapolskiy
> <vladimir.zapolskiy@linaro.org> wrote:
>>
>> Hi Rob.
>>
>> On 10/11/24 17:41, Rob Herring wrote:
>>> On Fri, Oct 11, 2024 at 09:31:06AM +0100, Bryan O'Donoghue wrote:
>>>> On 11/10/2024 08:14, Vladimir Zapolskiy wrote:
>>>>>
>>>>> Two most recently added CAMSS IP descriptions (qcom,sm8250-camss.yaml and
>>>>> qcom,sc8280xp-camss.yaml) do implement sorting by reg values, I believe
>>>>> from now on
>>>>> it should be assumed that all subsequently added CAMSS IP descriptions
>>>>> to follow
>>>>> the same established policy.
>>>>
>>>> My preference is sort by address not sort by name => we sort the device
>>>> nodes themselves by address so it seems more consistent to sort by address
>>>> inside of the devices too.
>>>
>>> Strictly speaking, the values of addresses are unknown to the binding,
>>> so you can't sort by address. However, if something is truly a single
>>> block, then the offsets are probably fixed in order by offset makes
>>> sense. But when a block is changed, any rule on sorting may go out
>>> the window since we add new regions on the end.
>>
>> Exactly, and this is an argument why the sorting is a subject to a device
>> driver policy, kind of any sorting order is equally bad. Sorting 'reg'
>> values by addresses helps to avoid a notorious problem with unit addresses.
> 
> What notorious problem?
> 

Here the problem I reference to is the problem of an incorrespondence between
device tree node unit address and the address of the first value of 'reg'
values.

Having a sorting by addresses allows to grasp IO ranges easily, and setting
device tree node unit addresses to some almost arbitrary chosen value from
the middle of IP's IO range is suspicious and confusing in my opinion.

>>
>>> This one in particular I have to wonder why csiphy is not a separate
>>> node.
>>
>> There were dicussions about it in the past, and kind of enforced outcome of
>> the discussions is to keep all CAMSS IP components together under one huge
>> plain device tree node. I personally dislike this approach, but obedience
>> is the way to get things merged.
> 
> Who are you saying would be in the way to get things merged? DT
> maintainers? I feel certain I would have pushed for separate blocks,
> but I'll defer to people that know the h/w. I can't learn the details
> of everyone's h/w. If they get it wrong, it's their problem not mine.

I had this discussion with Qualcomm/CAMSS maintainers long time ago, it
may be restarted, if there is a necessity.

>>>> Which means sorting reg by address and irq too.
>>>
>>> IRQs make little sense to sort IMO.
>>
>> For all non-reg properties with a present *-names property the sorting
>> order should be done by *-names property. Only 'reg' is very special.
> 
> No. If you had 'main' and 'error', I'd put 'main' first. If they are
> somewhat equal (e.g. rx, tx), then sure, sort them however you like
> (assuming no existing binding). The only real rules here are how new
> entries should be added (on the end). Otherwise, there is no policy.
> 

Here in the proposed terms the start of an IO region is 'main', while
some value in the middle of it (the first one in alphabetical sorting)
is too secondary to dictate the device tree node unit address, I believe.

--
Best wishes,
Vladimir

