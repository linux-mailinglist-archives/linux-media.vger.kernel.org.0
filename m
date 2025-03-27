Return-Path: <linux-media+bounces-28859-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FE2A7355C
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 16:08:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6674170B0A
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 15:07:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADEB017A315;
	Thu, 27 Mar 2025 15:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iSXbMLBE"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B88F1531E1;
	Thu, 27 Mar 2025 15:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743088031; cv=none; b=ZijesDbApHxpvCVxR4ugOkPYEczyFDrdAVrtOsrpUSPTFKtWsSE8CpI6QVIqmrJ/p5g55DvdCtMKqgzbuZGnTALZ2qjO2gmmjuWy7GId+H/S1+qBsdpItx+fS9qmUfhAqv55DQrhBpHTPRvcnhFNtJyzDypfriGIBKhbI3rMIKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743088031; c=relaxed/simple;
	bh=51uq9eze4L0yb3fWEg/O1lotH1bGxuQ1g1XhMDNXqSc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pxGJk3KKuvop/TzLQbXDDQAqFIYGzgwYyjsELuMaUgwZg68m/dGKGGZN1lXol0xtvo7WAreKoGqM3dNXUFH0LFfTJq7UbwyeBGQnyGqMr7+rgoCMQRx6es5T/c/cfJr6l0i7N1X2krpioYAKvAc/3wtUEpMs+URfte2dlFWbCLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iSXbMLBE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF6A7C4CEDD;
	Thu, 27 Mar 2025 15:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743088030;
	bh=51uq9eze4L0yb3fWEg/O1lotH1bGxuQ1g1XhMDNXqSc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iSXbMLBEnWqyo1w44382sB69tdotdy4QPKzL8c7TL8er/utSyeNBKrHmd5bmRwZJH
	 F2jKk2s16JcCQCnA/NS7G+E/8Y+HlcM4vUMdOIWemTmbYSaEYtK0IdYHrNayGR84EC
	 Q9STaO5pERCBsvVy/4sxbnQDidBN0CIENtQVs/e69kZOSNjxYzAA26u41uRskmQ1b3
	 /ZCy+oH6IXexwtGK0+VIDTtBigNaAyaCcwT9PWQJd4hr2nFZGpGK6nC1kw3MoYy08t
	 LcXHwu+z6sCUAxp2KKxxjBDaI8hgFyD3dmfC/bzGnIyarg1k9NoeTgXjV08eOgUvXW
	 rEVt3HMgy865A==
Message-ID: <9ad5d838-19d5-4557-b028-0ad88be60b8b@kernel.org>
Date: Thu, 27 Mar 2025 15:07:05 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: dt-bindings: Add OmniVision OV02C10
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, robh@kernel.org,
 hdegoede@redhat.com, mchehab@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, sakari.ailus@linux.intel.com, hverkuil@xs4all.nl
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250324171508.GA668235-robh@kernel.org>
 <20250326150114.71401-1-bryan.odonoghue@linaro.org>
 <W8_0Ch2J0PWJ5pKHojZjFbM8huvxWlaWajtl_uhQF3UszGH_O8WTRZdQxh_eHs2JzLOx7CCxx01UZDHPQqAyCA==@protonmail.internalid>
 <1dd46a9e-e97d-415a-9e33-67ee234c4bac@kernel.org>
 <0de575dc-5afb-40fb-be30-99906d0e493b@linaro.org>
 <c1959f95-9ee1-4597-b6ec-fbedc8a872db@kernel.org>
 <afae182f-b264-4b57-acd7-2c2cf090e1ad@linaro.org>
 <JdPoQXJoHcHuLJ-32TBarKN302TbQtmjhY6VC-GEBWlERJj-eDKKj7QdAPl22deMA1SFCSnN-3AfPoLreqANFw==@protonmail.internalid>
 <da93bf6c-b4bc-4c4f-9373-583fbd0c031c@kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <da93bf6c-b4bc-4c4f-9373-583fbd0c031c@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/03/2025 07:09, Krzysztof Kozlowski wrote:
> On 26/03/2025 18:34, Bryan O'Donoghue wrote:
>>>
>>> I meant bindings are exactly the same, unless I missed something.
>>> Devices are similar enough as well.
>>>
>>>> Seems simpler to me to have two separate files ?
>>>
>>> Not really, more files to maintain, more trivialities to fix if we
>>> decide to change something in all bindings (e.g. style).
>>>
>>> Best regards,
>>> Krzysztof
>>
>> Hmm, so we have two in-flight series and one yaml file.
>>
>> OK, I'll drop this patch and add ov02c10 to the ov02e10 yaml as you suggest.
>>
>> So long as the yaml file goes in first, the order of application of the
>> ov02c10/ov02e10 drivers won't matter and can be fixed with a cherry-pick.
> You can combine the series or add here a dependency.
> 
> Best regards,
> Krzysztof

So just in terms of sequencing, are you happy for us to merge ovo2c10 
and then do ov02e10 ?

Since I have a bunch of driver work to do on ov02e10 I think this would 
make sense.

---
bod

