Return-Path: <linux-media+bounces-63442-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KCTjKTFKH2qhjgAAu9opvQ
	(envelope-from <linux-media+bounces-63442-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 23:25:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0612D632116
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 23:25:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=N1Jopuuh;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63442-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63442-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 61F383040959
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 21:22:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF50539D6E8;
	Tue,  2 Jun 2026 21:22:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DFD2236E0;
	Tue,  2 Jun 2026 21:22:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780435358; cv=none; b=sxdSBv1THt7VGwxHuIPhy99+p0v5DrZdMySgEqQRkT3uUMszU7yuCTq7l13NfQUuA26HWN2PU21x2WmJP2B+iGnLZBliYhDTg+zvU6ZWlnHCZlPqptMBOjtFzSwIUZ7+OM4C9POggTKedx3BdXu7qlMm67MW/20lIo0+bjJQftI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780435358; c=relaxed/simple;
	bh=dLQofESjHvi63IUYtOVmcINuJCrrc7RS72cm6ZzARWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jT0X1WKDwn7OFlom2hVHVmXdVvt6BC8o0SZt0Ssu7iTChOkk+04xW0THYsUkdUsBjnx0YJyPyzh3uhqUkjlzdGiok1ydH9pRowSK9Rjxj/gXKObxxcPO9qgEuOIBSOZi8ovxDKDcpMdAaWUE7oX8jQ786Ld4JqAm7UMpTojWMFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N1Jopuuh; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5404D1F00893;
	Tue,  2 Jun 2026 21:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780435356;
	bh=S+cFiRqq9o+qpbMGUFYlom4l2OVWuiw1Uju2cmfRXVE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=N1JopuuhgJOsa1eI49fw7C2AlZZ9SVetPD2vuHDGy4QD/LcLy5dc2C4rkFDGUstR/
	 YtXfHCAhhDW8LuXQBv/rCL0JeU25Bqcx/zHMplJg+7S08WLLmGctyr2OMcKXeKpmt5
	 DyGKuaw7MRJ4ZD8zmgOpPaAp/K8f0IByRHIlvLA2puxpET0LVnN9KCtNir34L8UNzj
	 c4AEA2KIOMnaAIAFcaMvaL/kfZDX5ydaE4vTQfVSj6zFh5PewfHptQF47ftZgrO+7a
	 c/2wmaiJ2sQ6VmsXPI21qn0zE/eukgU22TJmIo+G1GtdR5vgotiW6kLDeuOIo3lDHF
	 0LpName6WMCBw==
Message-ID: <21ee337e-e9f6-4d8e-840d-35c2bd12d208@kernel.org>
Date: Tue, 2 Jun 2026 22:22:34 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: iris: Fix FPS calculation and VPP FW overhead
To: sashiko-reviews@lists.linux.dev
Cc: linux-media@vger.kernel.org
References: <20260602-fixbranch-v1-1-b8eccaad6d17@kernel.org>
 <NawUTvMD-_ja7n6Bm5IaMQMPaMefhnfspwkNHtGtZJSbv1hqzuHPsMCa7E439vd9jYNAs5LcIrmcd3HEA6J8CQ==@protonmail.internalid>
 <20260602211551.61F1A1F00893@smtp.kernel.org>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <20260602211551.61F1A1F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63442-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS(0.00)[m:sashiko-reviews@lists.linux.dev,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sashiko.dev:url,intel.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0612D632116

On 02/06/2026 22:15, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] 32-bit integer overflow in `mult_frac` frequency calculation affects both 32-bit and 64-bit platforms.
> - [High] Critical 32-bit integer overflow when calculating `vsp_cycles` leads to severe VPU under-clocking on 32-bit platforms.
> --
> 
> commit 77f6f57aadf558885bf4697f0e3df01315999c7b
> Author: Bryan O'Donoghue <bod@kernel.org>
> 
> media: iris: Fix FPS calculation and VPP FW overhead
> 
> This commit replaces the mult_frac() macro with div_u64() for calculating
> vpp_cycles. This fixes a compilation issue on 32-bit systems lacking libgcc,
> where 64-bit operator division would otherwise fail.
> 
> Fixes: 5c66647a5c3e ("media: iris: add FPS calculation and VPP FW overhead in frequency formula")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202606030132.qnBXVDkM-lkp@intel.com/
> 
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
>> index 5a85568c5ee1c..37dbfe433a085 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
>> @@ -444,7 +444,7 @@ u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_siz
> 
> [Severity: High]
> This is a pre-existing issue, but can the call to mult_frac() for vpp_cycles
> earlier in this function overflow on both 32-bit and 64-bit platforms?
> 
> In iris_vpu3x_vpu4x_calculate_frequency():
>      vpp_cycles = mult_frac(mbs_per_second, caps->mb_cycles_vpp, ...);
> 
> Because mbs_per_second is a u32, the mult_frac() macro performs the internal
> multiplication in 32-bit arithmetic.
> 
> For high resolutions and framerates natively supported by the driver,
> mbs_per_second exceeds 21.4M. Multiplying this by caps->mb_cycles_vpp
> (e.g., 200) produces a value greater than 4.29 billion, wrapping around the
> maximum 32-bit unsigned limit.
> 
> Could this regression result in severely under-provisioning the hardware VPU
> clock and causing encoding or decoding failures?
> 
>>
>>   	/* 1.05 is VPP FW overhead */
>>   	if (inst->fw_caps[STAGE].value == STAGE_2)
>> -		vpp_cycles += mult_frac(vpp_cycles, 5, 100);
>> +		vpp_cycles += div_u64(vpp_cycles * 5, 100);
>>
>>   	vsp_cycles = fps * data_size * 8;
> 
> [Severity: High]
> This is a pre-existing issue, but does this calculation overflow on 32-bit
> platforms?
> 
> The variable fps is a u32, data_size is a size_t, and 8 is an int. On 32-bit
> architectures, this multiplication evaluates entirely in 32-bit arithmetic
> before being zero-extended and assigned to the 64-bit vsp_cycles variable.
> 
> For standard 4K 60fps encoding, an uncompressed data_size of around 12.4MB
> yields 60 * 12441600 * 8 = 5,971,968,000, which wraps around the maximum
> 32-bit limit.
> 
> Since this patch explicitly addresses 32-bit systems, will this regression
> cause the VSP to be severely under-clocked during common use cases on those
> platforms?
> 
>>   	vsp_cycles = div_u64(vsp_cycles, 2);
> 
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260602-fixbranch-v1-1-b8eccaad6d17@kernel.org?part=1

Yeah but no but yeah.

This driver only really runs on 64 bit systems so making it resilient 
for 32 bit is another day's pile of proverbial to shovel.

---
bod

