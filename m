Return-Path: <linux-media+bounces-36551-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AC915AF1494
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 13:52:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F0283ADD76
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 11:52:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3E32267AED;
	Wed,  2 Jul 2025 11:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mLEOr6Z5"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2564263F22;
	Wed,  2 Jul 2025 11:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751457148; cv=none; b=cqXSo1up5Ecc5WvsD+4Sh9JMFLJAOYAjGAHck3uanyQaFf7PsPwiXoEIMKURYBWvpXtpty1BqsgkVskpUAZRr0Cc9ikliwy6nIIxgr+8+fTm/sClCTie/IMNwj5A5jpyG62oUFB6kjLFCZiFZr/TmIiv22NJi0lk5JPk9FegP7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751457148; c=relaxed/simple;
	bh=Q6FBmj3URmpZCBhCjeD2ZiHzR3DBwUjx+XG7OR8HJGk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O3lOtVur6Eas+VRmqr18os2frNRyGUefwo+RvEMvA33F7uwDpDsTyQENJGmTHZNtkGYFizqLqitxyHJp7BxiPO2tellcjXjafNJxiiRWgOuc8MUvco+SYfwC/9PZQdv6UhAIM9N2hJIvzVyYibusyityroWWUVMiwzviNMlaH78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mLEOr6Z5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62A6FC4CEED;
	Wed,  2 Jul 2025 11:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751457147;
	bh=Q6FBmj3URmpZCBhCjeD2ZiHzR3DBwUjx+XG7OR8HJGk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mLEOr6Z5dKaFH5FWtLH77WS6LT7mE5lZILLPL71qW152ID183/QwYuy6laaYIQpl9
	 hYGOh/VlT+c+eZs+KSrmmtYfiG0zVqzw8TjBKXr0mHpcYk7I2wT0UW/zdrnQHRMIkF
	 pYTjrHJVSPnZdsONCS6GGScNHt+NeJThIWg8OcpHDV6oUw03y7oiNkL03ivJFzDBpO
	 uY6NY1rknsqVlNz5ZNS/EcdtcGwFGBRKfllN+zeTIJDN7oLlRMSyrETWsIku8spa21
	 kNq3oVmuPotr6tQp7LiAZHi6GrtW50PVjZnpOQXuvxFxghjgS4kH5WlfPDuZtL2k6i
	 pabR9AOH8ggOQ==
Message-ID: <5ad418d9-8199-43c9-a477-1e3b939c054c@kernel.org>
Date: Wed, 2 Jul 2025 13:52:22 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] Introduce "non-pixel" sub node within iris video
 node
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com>
 <5f90547d-945a-4e26-b36c-75f2d8a1af97@kernel.org>
 <eab8d79f-7188-9537-9176-3e4d22f0978a@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <eab8d79f-7188-9537-9176-3e4d22f0978a@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/07/2025 13:37, Vikash Garodia wrote:
> 
> On 7/2/2025 4:48 PM, Krzysztof Kozlowski wrote:
>> On 27/06/2025 17:48, Vikash Garodia wrote:
>>> This series introduces a sub node "non-pixel" within iris video node.
>>> Video driver registers this sub node as a platform device and configure 
>>> it for DMA operations. All non pixel buffers, i.e bitstream, HFI queues 
>>> and internal buffers related to bitstream processing, would be managed 
>>> by this non_pixel device.
>>>
>>> Purpose to add this sub-node:
>>> Iris device limits the IOVA to an addressable range of 4GiB, and even 
>>> within that range, some of the space is used by IO registers, thereby 
>>> limiting the available IOVA to even lesser. For certain video usecase, 
>>> this limited range in not sufficient enough, hence it brings the need to 
>>> extend the possibility of higher IOVA range.
>>>
>>> Video hardware is designed to emit different stream-ID for pixel and 
>>> non-pixel buffers, thereby introduce a non-pixel sub node to handle 
>>> non-pixel stream-ID into a separate platform device.
>>> With this, both iris and non-pixel device can have IOVA range of 
>>> approximately 0-4GiB individually for each device, thereby doubling the 
>>> range of addressable IOVA.
>>>
>>> Tested on SM8550 and SA8775p hardwares.
>>>
>>> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>>> ---
>>> Changes in v3:
>>> - Add info about change in iommus binding (Thanks Krzysztof)
>>
>> Nothing improved in commit msg. You are changing existing device and the
>> reason for that change is not communicated at all.
>>
>> There was big feedback from qualcomm saying that some commit in the past
>> received review, so future commits can repeat the same stuff. If qcom
>> approaches that way, sorry, no you need to come with proper commit
>> description.
>>
>> Please align internally how to solve it, because my response that past
>> imperfect review is not justification for whatever future issues was not
>> enough.
> Sure, lets take this as an example and you can suggest to provide a better
> commit message for this case, it would help me to compare where is the gap. I
> have tried my best to capture and explain the limitations and how the changes
> address those limitations. If that is not sufficient, we might have the perfect
> message from you and compare to find the gaps and improve, I am sorry, but thats

It is not question to me: I did not want imperfectness. Qualcomm
engineer used issues in existing commits or imperfect commit in
discussion, so that's my solution. I don't need that perfect commit, but
it seems if I agree to that, then I will have to defend it later. Well,
no, I don't want it.

> how i feel at the moment.
Sure, I feel confused now as well.

Anyway, in other messages I explained what is missing. You are changing
existing hardware and you clearly must explain how existing hardware is
affected, how can we reproduce it, how users are affected.

All these answers.

Best regards,
Krzysztof

