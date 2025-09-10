Return-Path: <linux-media+bounces-42158-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D8109B50FCA
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 09:42:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6BC2516F0B6
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 07:42:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3054930C373;
	Wed, 10 Sep 2025 07:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vAJUqusD"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6FC30BB81;
	Wed, 10 Sep 2025 07:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757490167; cv=none; b=Xgs/XGh1/8vaxCJj3TLt5WInHZDODU0fWHZcogbPoL1+mnASrAC/OAX2JmgzyZ3mPCkjzO8pCG4Pi74ONfeAKnMD/hi/is3/xn80LjRzqSSuwN62gUZKYRjbKtSk47psO56qQKjWSUwq8Gum9xAoCHtjlqqUPNBtmsrwTmPKMH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757490167; c=relaxed/simple;
	bh=+4M6tsS1noq3CdhW7Sll0jWiqizEr50fsdQiGPuss64=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZXqoaNWTK/SCM1Q6u1HMrLK78FEIGw8EVW8Cio78A3R4jCPUYvtuecbblD8cjougSnoEP871pWDCwN9ZEn5+gbXzJydqP9YgEyOQeTeIbbk9ZWtvokxwsuVq7SDXDXceg1dknAFSRFbpcIzHgrgxpDNlHu5ed5wbcnkz2xSXbWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vAJUqusD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55FF1C4CEF0;
	Wed, 10 Sep 2025 07:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757490166;
	bh=+4M6tsS1noq3CdhW7Sll0jWiqizEr50fsdQiGPuss64=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vAJUqusDyMsHxoK8/VpNOPxDfF73Vsb5zgcHKHvT1CcG3cK5iVZnu8lkO/Qa2YuH3
	 NWn8HkwuCZZ2hJZ3wVIFuJ5kaPKNWOITD8oZyeeU0kShMhymQngMwsN6coIH9ZoEYP
	 is6HvqnlJrCFcbUUdYeqdOcADhFeGv/8eVljf7nJ8Mb+vDzmOrASFHLcToG2jK6bNE
	 w94+SBOG+jH8E7QBQeTtHF1QQUQB3DeEZLfdL/0DOUQgc9tsDSfhHzmbuXL/9QBcwy
	 5JdHI1DUdQtUzGcAMq9fwGR+D3AeWkZ28a9K/OuhTDezF9E86ioO8jsDQyWjo3dbKR
	 rLBOzcWnlZNbA==
Message-ID: <8c1163ad-6e65-450b-ae44-c9a71a045333@kernel.org>
Date: Wed, 10 Sep 2025 09:42:40 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] media: dt-bindings: Add qcom,qcs8300-camss
 compatible
To: Vikram Sharma <quic_vikramsa@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, rfoss@kernel.org,
 todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250813053724.232494-1-quic_vikramsa@quicinc.com>
 <20250813053724.232494-2-quic_vikramsa@quicinc.com>
 <f1e3c3a9-9929-477a-b1ad-e485c059cbc2@linaro.org>
 <d16d40ab-8a35-4886-b11f-2eee15849e1c@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <d16d40ab-8a35-4886-b11f-2eee15849e1c@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/09/2025 09:26, Vikram Sharma wrote:
> 
> On 9/10/2025 12:35 PM, Krzysztof Kozlowski wrote:
>> On 13/08/2025 07:37, Vikram Sharma wrote:
>>> Add the compatible string "qcom,qcs8300-camss" to support the
>>> Camera Subsystem (CAMSS) on the Qualcomm QCS8300 platform.
>>>
>>> The QCS8300 platform provides:
>>> - 2 x VFE (version 690), each with 3 RDI
>>> - 5 x VFE Lite (version 690), each with 6 RDI
>>> - 2 x CSID (version 690)
>>> - 5 x CSID Lite (version 690)
>>> - 3 x CSIPHY (version 690)
>>> - 3 x TPG
>>>
>>> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> ---
>>>   .../bindings/media/qcom,qcs8300-camss.yaml    | 336 ++++++++++++++++++
>>>   1 file changed, 336 insertions(+)
>> So it turns out this code is wrong and you already sent fixes for it.
> 
> Hi Krzysztof,
> Thanks for your comments. These bindings are tested with TPG (Test Pattern Generator), As camera sensor testing was not possible at that point.

You cannot test bindings with TPG. It's impossible.

> This is because Monaco-evk kit was not ready which can be used to enable sensor.
> 
> These Bindings are complete in its own, If someone want to use TPG.

No. You do not understand - they are not complete if you add new
properties to them!

How bindings could be complete if you add now supplies!?!?

> 
> My latest update in these bindings are for camera sensor enablement which needs supplies too.
> 
> Please let me know if this justification works to accept these bindings it its current form and add supplies as a separate patch.

NAK. Read writing bindings doc. Or internal docs.

Best regards,
Krzysztof

