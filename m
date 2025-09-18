Return-Path: <linux-media+bounces-41677-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DC9B4200C
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 14:53:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE6F5204C11
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 12:53:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BF3E30275C;
	Wed,  3 Sep 2025 12:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cSZvFLlp"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A023009E0
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 12:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756903880; cv=none; b=mQgFDTJzGDUnZL6jd5H26mUCecx3MqXlPXtxnqsElrUQRpGdnMhxLJakafU3ylYVfltIFpQnbC9vUnS7XI81jAL2VzrlWHvUsP6nei5eKSBKOWOFHYNr+kqLz12N6e6CcaA7TIII23cBN6uhwKBQTKDcX3c1oKq1PWQWUMt5x4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756903880; c=relaxed/simple;
	bh=w0Vi6tse421553kSLOPqnPHU9Gz2NkKJLRdSLu2Io70=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ZJVWbYWaMsDzpPQruFyWz7oeGGYMZE4PtyFojyPYnjppOrpn902EU4EuVYezQfg0yLfYxfYpKOVvOoSq8C6DdD0lNcyr29fRfo9kT/3yayNhyuGdDOaFx7c+s3ANaJAr6lHH9lN3gpGV425vCaksSgjPZlPfpZK6wrPDStolZRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cSZvFLlp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90F92C4CEF5;
	Wed,  3 Sep 2025 12:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756903879;
	bh=w0Vi6tse421553kSLOPqnPHU9Gz2NkKJLRdSLu2Io70=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=cSZvFLlpPOIiaTdYRStowPJBi/nerxs55BEYPBRQlN0a+i5zWtlyoTpXoB8lm91cw
	 qZROdKzFYLEMNLqnVjlmU8UiejjqABFVXyyhUeFfDDG1Y7cSIz31SPozJCAdPf+Rfs
	 s/RpuF83mjKC5J0SFl+5Wey/EcaVcGu1/LIZwFPq2ngxD9n+FEy5iDuRLEzqV06Nz0
	 xk/KXzSGTaXy2fxBV7TkZADB3VUOyUuq9afrZPU3+WRzoRZwU0Ca1s6fjrF45Dfoof
	 NrWf3nYZu0tgk37Z32/1x2496zqzFo5042SBynGKb6AbX0b/Vg9nrRBZw7unkL1W4f
	 xHw3CL4XTzGHA==
Message-ID: <8f84500b-8b9d-4ad3-a04c-fe8148b0a0bf@kernel.org>
Date: Wed, 3 Sep 2025 14:51:16 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] .mailmap: update Vikash Garodia's email addresses
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>, linux-media@vger.kernel.org
Cc: vikash.garodia@oss.qualcomm.com
References: <20250902152224.1150300-1-quic_vgarodia@quicinc.com>
 <de89f325-0e4c-4040-a7ae-fd36d3e4a177@kernel.org>
 <b60f364e-3aeb-7e01-d03e-b7ec8eed1a42@quicinc.com>
 <1a1320af-0cc1-411a-8242-9e065d37d56a@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <1a1320af-0cc1-411a-8242-9e065d37d56a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/09/2025 14:49, Krzysztof Kozlowski wrote:
> On 03/09/2025 14:24, Vikash Garodia wrote:
>>
>> On 9/3/2025 12:56 AM, Krzysztof Kozlowski wrote:
>>> On 02/09/2025 17:22, Vikash Garodia wrote:
>>>> Add vikash.garodia@oss.qualcomm.com as the main address for upstream
>>>> work.
>>>>
>>>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>>> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>>>
>>> That's the same person. SoB does not mean any rights to an email, but
>>> DCO. Please read submitting patches about meaning of SoB and drop the
>>> first fake SoB.
>>
>> I referred this [1], at the same time, i find your point valid given its
>> basically represents an identity, which remains same irrespective of multiple
>> email IDs.
> 
> I don't even know what this means... there is no identity here, no one
> checks identities, although even identities are the same - oss.qualcomm
> = quicinc, these are the same companies.
Anyway the patch should be NAKed for other reason - this email address
does not even work!

Diagnostic-Code: smtp; The email account that you tried to reach does
not exist. Please try double-checking the recipient's email address for
typos or unnecessary spaces. For more information, go to
https://support.google.com/mail/?p=NoSuchUser

Your message wasn't delivered to vikash.garodia@oss.qualcomm.com because
the address couldn't be found, or is unable to receive mail.

Best regards,
Krzysztof

