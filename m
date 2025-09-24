Return-Path: <linux-media+bounces-43057-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D2708B99D76
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 14:30:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EAC5C3A469C
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 12:30:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66F6F2EC095;
	Wed, 24 Sep 2025 12:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aEltAJSp"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E422E7199
	for <linux-media@vger.kernel.org>; Wed, 24 Sep 2025 12:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758717009; cv=none; b=cB+3Fkjrbfyy3Xdi8adeDeSHNvFCNjVe9Bgq4zF1kF1XiEVGdwRw9h1P1NFaKE9pV+VrxBiHYSRPwEqvWGezULUPshpL0Mb8pone25H6nhUVEK87OFUyO+RkPlAkvtk7gQyWwrFO7/HNxvVSEMF1ZuHsKbqQ7o1Gn63hDAgngTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758717009; c=relaxed/simple;
	bh=H7sHV1P9JX+WrJIzcQCzTrTuVqJo+6m0nB4Ks3vkkJs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=n1OEl/YscAZ32MpxGeW9DaqTzERsrSB2XPYe6w42FcrBHET8KppgR1jm8x0r4UUyH4aDzQjjnhLVm14Eg73Za/RZlizsYTek2v7y6yV9fKHmv6iTF6H2hAiVJyZGVOqI8Nz24sHTOlMctA0QpAe9ASafgm+D7psR7saiId6pV5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aEltAJSp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C61A8C4CEE7;
	Wed, 24 Sep 2025 12:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758717009;
	bh=H7sHV1P9JX+WrJIzcQCzTrTuVqJo+6m0nB4Ks3vkkJs=;
	h=Date:From:Subject:To:References:In-Reply-To:From;
	b=aEltAJSpVmxEtapX6g7Kq2NDcMmwqDXmrBfyfiDT/B8sCLlLNKSC59pMb6XZxkd+Z
	 pQYGPjl5kF+4fSJzhC1y4Y54ChbTsLCuYRNvgd8MLABeQCY4f6eiiDzLVIwSEzJJoC
	 Pfg+mZy3FC+C3QyFy+c0Qm39BwqPsFnvAaSyiQtFFNX88+4UChXqKVobOwF/OgriLV
	 dKQCQNV+yCOECtu5tWuKyuFEBwbfSqe8Znp4PyMnced/IwwZHh6NVwAa94WL+D7YiN
	 pdDg3zTRT3OGgwfKb7oBjDKwakOjsYYKHzH12UmnHY9/tK+i0zcFIb3suJ8Yrhsu/2
	 saX51TL+xM9rg==
Message-ID: <63ffc682-10e2-46ef-bccf-f5b047aae688@kernel.org>
Date: Wed, 24 Sep 2025 14:30:07 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [GIT PULL FOR 6.18-fixes] Please pull
 platform-qcom-fixes-for-6.18
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, bod@kernel.org,
 linux-media@vger.kernel.org
References: <20250924104419.7248-1-bod@kernel.org>
 <582bd5a7-fece-4cb9-b76c-73e536f78475@kernel.org>
 <2568439c-3d0d-4f6e-a4ee-3d1123237ce2@linaro.org>
Content-Language: en-US, nl
In-Reply-To: <2568439c-3d0d-4f6e-a4ee-3d1123237ce2@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/09/2025 13:45, Bryan O'Donoghue wrote:
> On 24/09/2025 12:22, Hans Verkuil wrote:
>> On 24/09/2025 12:43, bod@kernel.org wrote:
>>> From: Bryan O'Donoghue <bod@kernel.org>
>>>
>>> The following changes since commit 40b7a19f321e65789612ebaca966472055dab48c:
>>>
>>>    media: tuner: xc5000: Fix use-after-free in xc5000_release (2025-09-17 12:15:35 +0200)
>>>
>>> are available in the Git repository at:
>>>
>>>    https://gitlab.freedesktop.org/linux-media/users/bodonoghue.git tags/platform-qcom-fixes-for-6.18
>>>
>>> for you to fetch changes up to 22d0fa7f9507d8e20db956aab5d2eecd55084db6:
>>>
>>>    dt-bindings: media: camss: Add qcs8300 supplies binding (2025-09-23 00:13:39 +0100)
>>>
>>> ----------------------------------------------------------------
>>> This tag contains three fixes for 6.18
>>>
>>> - An alignment issue Loic identified in -next for QCM2290
>>> - A fix for Venus when OPP tables are missing
>>> - A fix for the QCS8300 CAMSS binding.
>>>    https://lore.kernel.org/linux-media/61b562ad-eb67-4917-a449-f5556c43ceef@linaro.org
>>>    https://lore.kernel.org/linux-media/e72800d4-cb65-443b-be7e-0966a60fa5a9@linaro.org
>>>
>>> ----------------------------------------------------------------
>>> Loic Poulain (1):
>>>        media: qcom: camss: vfe: Fix BPL alignment for QCM2290
>>>
>>> Nihal Kumar Gupta (1):
>>>        dt-bindings: media: camss: Add qcs8300 supplies binding
>>
>> I am unhappy with this bindings patch: it's missing Acks from the device-tree devs,
>> and the commit log is vague:
> 
> A revised version of the whole yaml with the supplies has the Ack, 
> second link.
> 
> I'm not exactly sure what is the right thing to do with a file in -next 
> other than rebase swapping the old commit with the new.

??? We apply the fix to our media-committers/next tree and linux-next pulls from that
(actually it pulls from the mirror on linuxtv.org, but they are the same). I don't see
what linux-next has to do with this.

The only concern is that it is really close to the new merge window, and I'm
uncomfortable dealing with somewhat messy patches like this so late in the cycle.

> 
> i.e. the whole yaml in the second link has the ACK but the yaml minus 
> the supplies is already in linux-next.
> 
>> "This commit adds in the missing vdda-phy and vdda-pll supplies from
>> qcs8300-camss.yaml."
>>
>> Did you mean "to" instead of "from"?
>>
>> Also mention why they were missing, I assume because it was simply forgotten? Shouldn't
>> there be a Fixes tag?
> 
> Since its in -next only the Fixes: sha would not work, AFAIU.

Why not? It's merged from our tree, and it's the same sha.

> 
>>
>> Since this is also a fix for a newly introduced file (hence the lack of Acks), I think it
>> is better to handle this as a post-v6.18-rc1 fix. That way the file that is fixed is
>> available for the devicetree maintainers, you can add a Fixes tag and update the commit
>> message.
> 
> That's fine too, so long as no DTS is applied against it until we fixup.

Let's do that.

Regards,

	Hans

> 
> ---
> bod
> 


