Return-Path: <linux-media+bounces-45294-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D622BBFD7C4
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 19:11:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A195D3B46B3
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 16:41:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D749359F8B;
	Wed, 22 Oct 2025 16:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h9KLTRuS"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB812FD695;
	Wed, 22 Oct 2025 16:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761150515; cv=none; b=WG4cKIEYHNIQtkLGYcgyfJ5nb+J35BrVtP/3uuQQOGNdC6PzxJq6LwEUWX45IbAwYYcy3kBnyvDQIppmFWbnM3B7Mo+USBgWkyZ0Pab8Usdsdq+bOxksuO+Dr+iPNN2+gnHg5jXLmbaJTTlpELTAyIZmJ0CqWtDFPRghWfPIS4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761150515; c=relaxed/simple;
	bh=p1sLKMZ0jGL9ZLMO912t8vRHTjFShqnftiduvMFAS/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kkYKgxhQlrDW33EXrJqjWpArBke/IuXZ4vVXMf4uZ2Ao9EFjzyB22qQjtyYPqQVlPkUFtcnQvJzmTWHoF4rlWR7ao4/HP+ulHJ+gnrMKndE7VDJtYXAk9hzSnaIui2LXFOK/tkHgkBMGALmB8q4oyY1go3p/OkEa+0ngNmS6ECc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h9KLTRuS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EEF2C4CEE7;
	Wed, 22 Oct 2025 16:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761150515;
	bh=p1sLKMZ0jGL9ZLMO912t8vRHTjFShqnftiduvMFAS/A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=h9KLTRuSovJw3Gn1Frm0Q8fzc0ADTLQ8pdzeAj+xU9ABJsxN/u0YIpYeQxcVsSKya
	 bxmD/sU8uTmQsghshT9/HQApsykyPRogC/bqQPi/FIrZDB+JS1z81E0Xuf4etofqFl
	 Ap7mDg1itOZaBmjmtdXsSGjAxJgNinPE8GNf+ohcF8ARsqsgb+1aUgMgMQoqRm7eIo
	 c3Cl8FIo8yPf/lQK5jG0wEm+ORXswYexJSqpKzKhKuR5pfTmTYoqXeiKlS98D0yVP8
	 zBUuxL5GhxjX35qlF26qHti5lVW/G9Oc2FS5hMPTYi7TjbujuXnHl6L8POp7ZIBOha
	 1Ydop88qqm1hw==
Message-ID: <24719933-d81f-41cb-aabc-e28f018b156c@kernel.org>
Date: Wed, 22 Oct 2025 18:28:29 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] media: dt-bindings: qcom-kaanapali-iris: Add
 kaanapali video codec binding
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vishnu Reddy <quic_bvisredd@quicinc.com>
References: <20251017-knp_video-v2-0-f568ce1a4be3@oss.qualcomm.com>
 <20251017-knp_video-v2-1-f568ce1a4be3@oss.qualcomm.com>
 <c9d8f76a-513f-4a09-bba4-cb8f0df1d2fe@kernel.org>
 <034bf6f4-0a49-4973-8536-28526b3409d1@oss.qualcomm.com>
 <9c920cdf-1985-4656-bee2-8bfacc15bfa9@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <9c920cdf-1985-4656-bee2-8bfacc15bfa9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/10/2025 17:36, Konrad Dybcio wrote:
>>
>> [    1.361157] pc : qcom_smmu_write_s2cr+0x64/0xa4
>> [    1.361165] lr : arm_smmu_write_s2cr+0x2c/0xbc
>> [    1.361168] sp : ffff80008005b8f0
>> [    1.361169] x29: ffff80008005b8f0 x28: 0000000000000000 x27: ffffc7f252f45320
>> ....
>> [    1.361195] x2 : ffff800081200c48 x1 : 0000000000000048 x0 : ffff800081200000
>> [    1.361198] Call trace:
>> [    1.361199]  qcom_smmu_write_s2cr+0x64/0xa4 (P)
>> [    1.361203]  arm_smmu_master_install_s2crs+0x7c/0xac
>> [    1.361207]  arm_smmu_attach_dev+0xb0/0x1d4
>>
>> Could you please suggest on listing the iommu items ? I did not find the
>> relevant references in other bindings where flexible iommus is being listed.
> 
> Krzysztof would probably like to see what I believe someone else somewhere
> sometime suggested in the iommus discussions (sorry it's not possible to
> keep track of it all), where the DT can list every possible required iommu
> sid, but the driver ensures only the ones that are necessary are utilized.
> 
> This will require big changes to the iommu framework though, I'm afraid
> 
>>> I already asked this.
>>>
>>>> +
>>>> +  memory-region:
>>>> +    minItems: 1
>>>> +    maxItems: 2
>>>
>>> Same comment. I already asked this about iommus.
>>
>> Same here, there aren't any bindings which lists for flexible memory-region.
>> Please suggest if there are any such references.
> 
> Similarly, we can define the additional memory region that's necessary
> for $reasons and leave it unused in the driver (actually I don't know
> why there may be two, but let's assume it's a QTEE/noQTEE detail), because
> for the hw to operate, it must be set up by some entity in the system
> either way (i.e. the memory is reserved even if it's not done by Linux)


Another point is pretty obvious: if one claims that
iommus/memory-regions list is flexible - some elements are optional -
then clearly there is a distinction which elements are mandatory and
which are optional. So there is difference between elements of the
array. If there is a difference, they all must be explicitly listed,
like every other list (clocks, resets etc) property. Writing bindings
doc also defines this rule.

Best regards,
Krzysztof

