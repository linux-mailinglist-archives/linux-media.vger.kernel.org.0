Return-Path: <linux-media+bounces-52659-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eF9xJXLVjWlj7wAAu9opvQ
	(envelope-from <linux-media+bounces-52659-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 14:28:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE5912DD07
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 14:28:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 955133061CD1
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 13:27:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEAA635BDCB;
	Thu, 12 Feb 2026 13:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S5/xre3l"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E1235B628;
	Thu, 12 Feb 2026 13:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770902840; cv=none; b=Gc1IcWCVOxtOXk37RXeuSyEjJDxmcebew0x0YV2yjQPnExUFnVpp3A/wHPzLSVwhya21o3Klf+pyBgs0BQqDUlhtFUrRSz5J3zDwodr+5o6wCq1+3DqBWR4Uw2Yifou7ZJiQYZq2uqjh1B3R4rhsI0ZUWqBkP6/kGZMT50PCvMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770902840; c=relaxed/simple;
	bh=fPUQGJcRTjudsqh0NMKeZfEb7SaRsIeAOMUpOYfszRQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o+9CHTM1ZD9vNrygHKu41p54M2GDBkuuIWL6OlqabBHP8Jgbcfl5llpdZy446OSoqsjpCX98WAiuRLJtpLypb+8PJVZ/Aq0W30S2diFrKtQOQn303cBjv0wnG+fnp3fGD8QZ6n9zBckhle77Ikhwdw2kyfp3RBz9AnGz4kfGz+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S5/xre3l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1B9FC16AAE;
	Thu, 12 Feb 2026 13:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770902839;
	bh=fPUQGJcRTjudsqh0NMKeZfEb7SaRsIeAOMUpOYfszRQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=S5/xre3lE/m+ujgf6R3JG/iOkDeYt7ot33JgvnIIpfe72ZeQqyfguURi5JuGY1cQF
	 TPqOSS+hBLDOYyvsY3RogmAeYaKlJXLI1KzjImv9oL4tgW8/eDHBYydzhja7htYVTO
	 9PGRABFaLPp5WjYPFI9juyXA3ZB3P9szk5N/2ZXEX9GFalT3Li/pTQag9jNTEStArh
	 G3e2kDkPNKiihfu3sr/L3EzapJuR6Xlp086Tq+yKfFfTy9jCpLALTyO5oNeaeh14xx
	 BvomdlWH9Z6TpmCcHl/xgn2VKzHh5Lz9QfhO68AfnTAd3U8UNFDHPXASeabHG/wG0w
	 dmzW9HRMtGk4A==
Message-ID: <5ec260fd-b8ae-4c54-863f-de9e684bc543@kernel.org>
Date: Thu, 12 Feb 2026 13:27:15 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: iris: Enable Gen2 HFI on SC7280
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260209-iris_sc7280_gen2_support-v1-0-390000a4fa39@oss.qualcomm.com>
 <20260209-iris_sc7280_gen2_support-v1-2-390000a4fa39@oss.qualcomm.com>
 <0da582a6-5bba-4450-99ec-cf57b67915e6@oss.qualcomm.com>
 <0a324898-092b-3e44-c35c-15de20b50f40@oss.qualcomm.com>
 <2uih6xdzarkwnvhlhv5kznmdwo4jorqvsrb7xxrxgr6vprx3ey@4kx45k5i3c4y>
 <6b9042c8-767e-0fdb-9012-f3790899509e@oss.qualcomm.com>
 <f9f40ac7-e6fe-41eb-92e4-311913567ef0@oss.qualcomm.com>
 <FaJyQ2c9oLW2a2qKHDI_zfRx4G_Ee4rzdjImb7o3bKnZAo7AzRDgokOBewYZCNdqexEEPhB6nmPEjkmS72Kalg==@protonmail.internalid>
 <b759fb04-22b7-cd5c-9e53-f4ffe9f37dc5@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <b759fb04-22b7-cd5c-9e53-f4ffe9f37dc5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52659-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0EE5912DD07
X-Rspamd-Action: no action

On 12/02/2026 13:05, Dikshita Agarwal wrote:
> 
> 
> On 2/12/2026 5:13 PM, Konrad Dybcio wrote:
>> On 2/12/26 12:16 PM, Dikshita Agarwal wrote:
>>>
>>>
>>> On 2/9/2026 6:05 PM, Dmitry Baryshkov wrote:
>>>> On Mon, Feb 09, 2026 at 05:04:48PM +0530, Dikshita Agarwal wrote:
>>>>>
>>>>>
>>>>> On 2/9/2026 3:32 PM, Konrad Dybcio wrote:
>>>>>> On 2/9/26 10:45 AM, Dikshita Agarwal wrote:
>>>>>>> SC7280 supports both Gen1 and Gen2 HFI firmware. The driver continues to
>>>>>>> use Gen1 by default, but boards that intend to use Gen2 firmware can
>>>>>>> opt‑in by specifying a Gen2 image through the Device Tree
>>>>>>> 'firmware-name' property.
>>>>>>>
>>>>>>> Based on this property and the availability of the referenced
>>>>>>> firmware binary, the driver selects the appropriate HFI generation and
>>>>>>> updates its platform data accordingly. Boards that do not
>>>>>>> specify a Gen2 firmware, or where the firmware is not present,
>>>>>>> automatically fall back to Gen1.
>>>>>>>
>>>>>>> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>>>>>>> ---
>>
>> [...]
>>
>>>>> To avoid accidental matches, I can switch to an exact filename match
>>>>> instead. That way, only the specific Gen2 image (for example
>>>>> "qcom/vpu/vpu20_p1_gen2.mbn") will trigger the Gen2 path, and boards that
>>>>
>>>> How do you detect that for the OEM-signed firmware, which can have
>>>> random name?
>>>>
>>>>> want to use Gen2 can opt in by naming the firmware accordingly.
>>>
>>> I Explored on suggested alternative approaches and seeing some limitation
>>> with the both of them:
>>>
>>> 1. Detecting Gen1/Gen2 by scanning the firmware blob (fw->data)
>>> It is possible to parse QC_IMAGE_VERSION_STRING from the .mbn and  extract
>>> the version string. The issues with this approach :
>>>
>>> - the version string has no explicit marker that identifies Gen1 vs Gen2.
>>>
>>> - This prefix is not a formal ABI, and it is not consistent across SoCs.
>>> Each SoC family uses different naming patterns in the version string.
>>>
>>> Example : For SC7280 Gen1 we currently see:
>>> QC_IMAGE_VERSION_STRING=video-firmware.1.0-<hash> while SM8250 has
>>> QC_IMAGE_VERSION_STRING=VIDEO.VPU.1.0-00119-<>
>>>
>>> So the driver would need SoC‑specific string‑matching rules, which is hard
>>> to maintain if we are looking for a design to address all available SOCs.
>>
>> The only SoC with such distinction today is kodiak. So we can simply check:
>>
>> if (kodiak && strstr(fw->data, "VIDEO.VPU.1.0.")
>> 	hfi = gen2;
> 
> Agree, this works for Kodiak. However, Dmitry was also referring to other
> SoCs that may support both Gen1 and Gen2, and at the moment there isn’t a
> generic way to handle that check.
> 
> Also, please note that the Kodiak Gen1 firmware uses the string
> video-firmware.1.0, whereas Gen2 uses VIDEO.VPU.3.4.
> 
>>
>>
>> Can we agree that VIDEO.VPU.x firmwares are hfigen2? If so, problem also
>> solved for <=8450
>>
> 
> Nope. that's not true for all, SM8250 uses VIDEO.VPU.1.0 which is gen1.
> 
> Thanks,
> Dikshita
> 
>> Konrad

I really don't see what the problem with Dikshita's proposal here is 
after all she literally controls the firmware name that goes to 
linux-firmware.

Presumably you can attest to the naming format you have-sent and 
will-send in future.

---
bod

