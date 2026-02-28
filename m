Return-Path: <linux-media+bounces-53835-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIHGH4S8omkS5QQAu9opvQ
	(envelope-from <linux-media+bounces-53835-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 10:59:32 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F3A1C1D90
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 10:59:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E5756307D627
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 09:58:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1867F36D500;
	Sat, 28 Feb 2026 09:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T3Dp89SJ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770A340FDA9;
	Sat, 28 Feb 2026 09:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772272720; cv=none; b=r5qxhkW8Yo8s9tCrZ1CK83KSAEk7xaLXPmGk+0r7DvvFj4aAiKPUXDItkM4XezVH2nrgXkSH1lXV2SECzNjPfd2rISfYKG57ZDsc+jDK6YntVELwooe+lxPsuf1icZjslOYIloCLdjEEofRDLhJFtaueTpcHwupRlZaaXU/DXoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772272720; c=relaxed/simple;
	bh=M1ZVXAgdI+k2ver4Oogh4cCDb9JUYzaaPcG1HU2vtUU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=G3wsZunrUHgYWah3/eFbKuJG+W3lf1YOyyEJlbMvNkcfvKnDzkumJgEgDCCfom8/ll4ImQT0iBi/uqXFs/4a+gNWigC4NdDKKFVvEKAPLE4o315BJ6a8qS0upx8ul5g/D96Qw9bXV1ktKr5FgpKP26jwyIfotiA3TCSwOpNnJh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T3Dp89SJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6576DC116D0;
	Sat, 28 Feb 2026 09:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772272720;
	bh=M1ZVXAgdI+k2ver4Oogh4cCDb9JUYzaaPcG1HU2vtUU=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=T3Dp89SJj0XANR2+ltQcNAKjCca/I83gUhAUzfSr+JGlTWrsuJ1H3pdbKWueDJiWK
	 rkc3keGVQFygcL4LNmcUN02q4M/qNtgPTUmPxDfmLFwmpobNV2jNnFudMToJgz6U6J
	 YgEov3D2Ar4L56aVbPPzyK0Zyn3LodINo2uvWbJGwHx1Npcu3xpzwjw8rkx3Nmv8KW
	 KCMFBpeBPjpmDoj8P/nQgjpdXd+p4MjL57I2SVimUfQLCItVKtfBFT+PQE686GTAc0
	 4zw96YkelQWqkOrvXbvr3fxFkOLelPhlQRqBzI01XvoYo/OHMmWlKf+tEY6So+ycY6
	 rbf7YyLDJctpQ==
Message-ID: <59b442c8-da2a-40a8-b9db-1609a8eee744@kernel.org>
Date: Sat, 28 Feb 2026 10:58:34 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] media: dt-bindings: rockchip,vdec: Add alternative
 reg-names order for RK35{76,88}
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil@kernel.org>, kernel@collabora.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>, linux-media@vger.kernel.org
References: <20260226-vdec-reg-order-rk3576-v4-0-b8d72dc75250@collabora.com>
 <20260226-vdec-reg-order-rk3576-v4-1-b8d72dc75250@collabora.com>
 <20260227-observant-roaring-ara-ef7eb0@quoll>
 <adbbdbb1-b126-4807-821c-c9850befd695@collabora.com>
 <20260227-omission-stoic-417d7109ad4d@spud>
 <3ab4f91e-37d0-4950-af88-01920705d31a@collabora.com>
 <1fe5529f-cd9f-4960-b6dd-96a2d02b8d86@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <1fe5529f-cd9f-4960-b6dd-96a2d02b8d86@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53835-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 17F3A1C1D90
X-Rspamd-Action: no action

On 28/02/2026 10:54, Krzysztof Kozlowski wrote:
> On 27/02/2026 18:42, Cristian Ciocaltea wrote:
>> On 2/27/26 7:13 PM, Conor Dooley wrote:
>>> On Fri, Feb 27, 2026 at 01:37:17PM +0200, Cristian Ciocaltea wrote:
>>>> Hi Krzysztof, Conor,
>>>>
>>>> On 2/27/26 9:46 AM, Krzysztof Kozlowski wrote:
>>>>> On Thu, Feb 26, 2026 at 12:46:53PM +0200, Cristian Ciocaltea wrote:
>>>>>> With the introduction of the RK3588 SoC, and RK3576 afterwards, two more
>>>>>> register blocks have been provided for the video decoder unit.
>>>>>>
>>>>>> However, the binding does not properly describe the new hardware layout,
>>>>>
>>>>> As you shown me last time with excerpt of address spaces from
>>>>> datasheet/manual, the binding correctly describes the hardware and above
>>>>> sentence is not true.
>>>>>
>>>>>> as it breaks the convention expecting the unit address to indicate the
>>>>>> start of the first register range, i.e. 'function' block is listed
>>>>>
>>>>> Imprecise wording. "start of the main or primary register range"
>>>>>
>>>>> (if you have 0x1000 with one reg and 0x20000000 with everything, the
>>>>> unit address will be 0x20000000).
>>>>>
>>>>>> before 'link' instead of the opposite.
>>>>>>
>>>>>> Since the binding changes have been already released and a fix would
>>>>>> bring up an ABI break, mark the current 'reg-names' ordering as
>>>>>> deprecated and introduce an alternative 'link,function,cache' listing
>>>>>> which follows the address-based ordering according to the TRM.
>>>>>>
>>>>>> Additionally, drop the 'reg' description items as the order is not fixed
>>>>>> anymore, while the information they offer is not very relevant anyway.
>>>>>
>>>>> This is fine for me.
>>>>
>>>> Thanks for the additional feedback!
>>>>
>>>> If I'm not mistaken (please correct me), the only remaining (hard)
>>>> blocker for the series would be to improve this commit message.
>>>
>>> No, you also need to fix the problem I pointed out about reg-names being
>>> optional on the devices you're relying on reg-names for. 
>>
>> My only concern is that by marking reg-names as required we would break the ABI,
> 
> You are ALREADY BREAKING the ABI. Really, for absolutely non-important
> cosmetic change in unit address, where I asked you repeatedly to fix the
> unit address, you change the ABI affecting kernel and DTS users.
> 
> This is barely acceptable, but I am just annoyed already explain it to
> you multiple times.
> 
> But now you claim, you can break ABI for cosmetic unimportant change,
> but actually doing something meaningful is a no-go?
> 
> At least use correct arguments if you want to discuss.

And I double checked now with Conor - your binding and drivers are
broken here and THIS you must fix. Not the unit address you are so
focused about.

Best regards,
Krzysztof

