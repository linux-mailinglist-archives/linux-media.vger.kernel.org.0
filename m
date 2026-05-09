Return-Path: <linux-media+bounces-60992-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEmtI/oJ/2mv1QAAu9opvQ
	(envelope-from <linux-media+bounces-60992-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 09 May 2026 12:18:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 091C34FF304
	for <lists+linux-media@lfdr.de>; Sat, 09 May 2026 12:18:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D5B330086DF
	for <lists+linux-media@lfdr.de>; Sat,  9 May 2026 10:17:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 337C73A1E7B;
	Sat,  9 May 2026 10:17:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C702F8E97;
	Sat,  9 May 2026 10:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778321838; cv=none; b=gaPtccJgO3AoJzD/UVgtZwlIQzKkH+TRFMeraLe6UmwjnHMS+xmfi+l25L6bYlioMDyZm15F2ew17QmBagVWvIDqXUXIAZvR9AaN3C54iKbBHWcyJtTfw4eg6un1DNVMjb+uk7cJ0oCSGAsUXyRIs4/QIrhMHyKT2jcNnAOr9l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778321838; c=relaxed/simple;
	bh=OMyY6EIN0uYFyyXk3dI0sS4NBaaUT7qzp1bucwRMzOU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l2WanAYZAsdCHh1ktFvXD4wQGvSEy39fpHxn1hG7hG4Ws2k5vVQY9bta3nMD29ra/rNCCZvY6KqG5Zb0lftgxt87AwdTaDpwVAY1iJ4eyI2UV2GHvZWbWrhQdfVGyRDluyYPOZJtSWM0pHZXzbdni5FCaiNqdr/l0cIHssbCGGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: esmtpsz18t1778321792t460a2d05
X-QQ-Originating-IP: zjkOROJYI4ZbQ+7Ufdl7ieLzq4bCCEXbPMMJo2dR4Dw=
Received: from [127.0.0.1] ( [116.234.74.217])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 09 May 2026 18:16:29 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7643366966760275687
Message-ID: <FE38EFC340D52748+8a9351df-df99-48d1-8d59-8c72b7153ef0@radxa.com>
Date: Sat, 9 May 2026 18:16:27 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] media: iris: introduce SM8350 and SC8280XP support
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Bjorn Andersson <andersson@kernel.org>, David Heidelberg <david@ixit.cz>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Johan Hovold <johan+linaro@kernel.org>
References: <20260125-iris-sc8280xp-v3-0-d21861a9ea33@oss.qualcomm.com>
 <20260125-iris-sc8280xp-v3-2-d21861a9ea33@oss.qualcomm.com>
 <8c5cd9ff-e549-00ab-60c6-814b52f50949@oss.qualcomm.com>
 <rhsmmvbxjzb4ylxryo3n6j6wf52tjpxxon6fww6tsfhxttc2g7@xfsnyfkqh3ke>
 <ec4348fc-b27c-9b56-2967-222e4e280c8a@oss.qualcomm.com>
 <d67faniik7jrlnq2a2wsyku3agpezh5qj4g4rip3j6pbeagmkj@xax6nuginypu>
 <a71e3bc2-23dc-fa02-0dbf-0a9d779dca76@oss.qualcomm.com>
Content-Language: en-US
From: Xilin Wu <sophon@radxa.com>
In-Reply-To: <a71e3bc2-23dc-fa02-0dbf-0a9d779dca76@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: OFWsfmE1GYcuJSFOBi1vsp9uZeMEGHAkiR9Qgvpl8Ig6hTMFeGKrL+AD
	3XXYnlsNU+BD8/oGmThmewZnAA/kd7qWIEfykFBjFZAitY7gzeHTfD45aRRDSpldESlLn/O
	uv5O/Q60ajvgs3z4DRGJ6WHBad4bKXC3qwZvKMSWa7BzrT6/z5j4tQ+eBO5i++Qh4WpiyT5
	jF777zSXkj/dcLW+wKJZrtdgp0GB3kBbuheL3b25zqV8uaEnt4jyRD0ukctHo/FjjW+lXLA
	tpXAVRIFVBH1iqWrzeJEO2tmNBWyZmjbuwH9GkWY+1RicTFE+I7JVF+c0pGo1s9XZzO2dMw
	iBFbtmK2W94acGJL2SlLv0x/YgI1J33dFnJf5Pnt+m1rtG1UknDR41al9vQ1ADThM9FsUrt
	9/r94k9RnYn1wcSd7+0UVly0xxhZ5GS1desFjjHwGODHA/75gC0icFPtwCGKufsfe89y1T5
	+pCH2ZeWMv4pNmp8a2gaO39rAE0zyLkdE5EAKk6zpWIgrFTTbeJZEBRzfp2iAPyyF3bq5SE
	DmjcXL3Fi/yt+Ix7rHCE9euIDinJJRuGFwzY5zKgS0lbR3esBdjldfDJtymlXalS1iMHFWm
	Kt9xo0psSb/EID3OVIQOUWJbCY/DYJcDz19n+RjE5NnWX5dE+eYecDOVKBPCj/l8p1YW4Qi
	0ismzV/liPSkFx8mi1oYlXlznq6vawU50Vovy6KqTiNVC751JO2U3LneOUIjyc91cHNXeCN
	Y+uuAOiRFtnOG8B/2G5f1VgvGdSQHabnhWGu/xIiAClNX1F74mzp6Kfpky6+bE4POAqEp9B
	XwpcX/0SF6uEUDIZHqBvkk/2sI+ocqPSKe/thwSx9smU+oHPozQjF7zPb1lTvrFJFR71V0B
	OavWxPb9LqFnmVXj/xB1hfV4cjMdlbsy07XnARCiVc1kHaREcRgHHQuoiJS9TtS+mDXgefa
	gzTxV83dQ56jO0xmIEK47K4fMb2Q7hsJKSLAsKrqpr6FBshU4vxnS07IQwvEyvPDyHArW80
	pTZkzluKb6omcmvZUi
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
X-Rspamd-Queue-Id: 091C34FF304
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[radxa.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60992-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FORGED_MUA_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sophon@radxa.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,linaro];
	DBL_BLOCKED_OPENRESOLVER(0.00)[radxa.com:email,radxa.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On 2/10/2026 1:35 PM, Dikshita Agarwal wrote:
> 
> 
> On 2/5/2026 4:24 PM, Dmitry Baryshkov wrote:
>> On Thu, Feb 05, 2026 at 02:40:39PM +0530, Dikshita Agarwal wrote:
>>>
>>>
>>> On 1/31/2026 12:58 PM, Dmitry Baryshkov wrote:
>>>> On Fri, Jan 30, 2026 at 06:46:04PM +0530, Dikshita Agarwal wrote:
>>>>>
>>>>>
>>>>> On 1/25/2026 9:02 PM, Dmitry Baryshkov wrote:
>>>>>> SM8350 and SC8280XP have an updated version of the Iris2 core also
>>>>>> present on the SM8250 and SC7280 platforms. Add necessary platform data
>>>>>> to utilize the core on those two platforms.
>>>>>>
>>>>>> The iris_platform_gen1.c is now compiled unconditionally, even if Venus
>>>>>> driver is enabled, but SM8250 and SC7280 are still disabled in
>>>>>> iris_dt_match.
>>>>>>
>>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>>>> ---
>>>>>>   drivers/media/platform/qcom/iris/Makefile          |   5 +-
>>>>>>   .../platform/qcom/iris/iris_platform_common.h      |   2 +
>>>>>>   .../media/platform/qcom/iris/iris_platform_gen1.c  | 111 +++++++++++++++++++++
>>>>>>   .../platform/qcom/iris/iris_platform_sm8350.h      |  20 ++++
>>>>>>   drivers/media/platform/qcom/iris/iris_probe.c      |  10 ++
>>>>>>   5 files changed, 144 insertions(+), 4 deletions(-)
>>>>>>
>>>>>> @@ -392,6 +393,61 @@ const struct iris_platform_data sm8250_data = {
>>>>>>   	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_enc_ip_int_buf_tbl),
>>>>>>   };
>>>>>>   
>>>>>> +const struct iris_platform_data sm8350_data = {
>>>>>> +	.get_instance = iris_hfi_gen1_get_instance,
>>>>>> +	.init_hfi_command_ops = &iris_hfi_gen1_command_ops_init,
>>>>>> +	.init_hfi_response_ops = iris_hfi_gen1_response_ops_init,
>>>>>> +	.get_vpu_buffer_size = iris_vpu_buf_size,
>>>>>> +	.vpu_ops = &iris_vpu2_ops,
>>>>>> +	.set_preset_registers = iris_set_sm8350_preset_registers,
>>>>>> +	.icc_tbl = sm8250_icc_table,
>>>>>> +	.icc_tbl_size = ARRAY_SIZE(sm8250_icc_table),
>>>>>> +	.clk_rst_tbl = sm8350_clk_reset_table,
>>>>>> +	.clk_rst_tbl_size = ARRAY_SIZE(sm8350_clk_reset_table),
>>>>>> +	.bw_tbl_dec = sm8250_bw_table_dec,
>>>>>> +	.bw_tbl_dec_size = ARRAY_SIZE(sm8250_bw_table_dec),
>>>>>> +	.pmdomain_tbl = sm8250_pmdomain_table,
>>>>>> +	.pmdomain_tbl_size = ARRAY_SIZE(sm8250_pmdomain_table),
>>>>>> +	.opp_pd_tbl = sm8250_opp_pd_table,
>>>>>> +	.opp_pd_tbl_size = ARRAY_SIZE(sm8250_opp_pd_table),
>>>>>> +	.clk_tbl = sm8250_clk_table,
>>>>>> +	.clk_tbl_size = ARRAY_SIZE(sm8250_clk_table),
>>>>>> +	.opp_clk_tbl = sm8250_opp_clk_table,
>>>>>> +	/* Upper bound of DMA address range */
>>>>>> +	.dma_mask = 0xe0000000 - 1,
>>>>>> +	.fwname = "qcom/vpu/vpu20_p4.mbn",
>>>>>
>>>>> This firmware is not compatible with SM8350.
>>>>> SM8350 firmware is not released to linux-firmware yet.
>>>>
>>>> What would be the name for the firmware? The downstream uses vpu20_4v
>>>> here, so, I guess, in upstream we should be using vpu20_p4, but a newer
>>>> version?
>>>>
>>>
>>> Using a newer version won't work as the firmware for SM8250 and SM8350 are
>>> different binaries generated from different firmware source branch.
>>> You can give it a try, but AFAIK it won't work.
>>
>> Ugh...
>>
>>>>>> +	.fwname = "qcom/vpu/vpu20_p2.mbn",
>>>>>
>>>>> this firmware doesn't exist on linux-firmware.
>>>>
>>>> It was based on the assumption of having 2 pipes. If Iris here has 2
>>>> pipes, then probably we should still point to vpu20_p4.mbn?
>>>>
>>>
>>> SC8280XP also uses the Iris2 4‑pipe configuration, though its firmware
>>> comes from a different source branch compared to SM8250 and SM8350. This
>>> means we have multiple firmwares with identical VPU and pipe configurations
>>> but different origins. Could you propose a suitable naming scheme that can
>>> differentiate such firmware?
>>
>> Can we have a single binary that works on all Iris2 4-pipe cores?
> 
> That is not possible as it is older VPU.
> For newer ones, the plan is have single source branch for same VPU to avoid
> such issues in future.
> 
>> Or are there any differences between Iris2 on SM8250 / SM8350 /
>> SC8280XP? Are they stil vpu20_something or should we use different VPU
>> versions in the firmware name?
> 
> I think we can keep vpu20_4p_* with some way to different among SM8250,
> SM8350, SC8280XP.
> 

Hi Dikshita,

We have some upcoming products based on SC8280XP that mainly run Linux. 
I was wondering whether Qualcomm still plans to submit the latest 
SC8280XP Iris firmware to linux-firmware.

If not, would it be acceptable for us OEM to submit it under the name 
vpu20_4p_sc8280xp.mbn?

>>
>>>>>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8350.h b/drivers/media/platform/qcom/iris/iris_platform_sm8350.h
>>>>>> new file mode 100644
>>>>>> index 000000000000..74cf5ea2359a
>>>>>> --- /dev/null
>>>>>> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8350.h
>>>>>> @@ -0,0 +1,20 @@
>>>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>>>> +/*
>>>>>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>>>>> + */
>>>>>> +
>>>>>> +#ifndef __IRIS_PLATFORM_SM8350_H__
>>>>>> +#define __IRIS_PLATFORM_SM8350_H__
>>>>>> +
>>>>>> +static void iris_set_sm8350_preset_registers(struct iris_core *core)
>>>>>> +{
>>>>>> +	u32 val;
>>>>>> +
>>>>>> +	val = readl(core->reg_base + 0xb0088);
>>>>>> +	val &= ~0x11;
>>>>>> +	writel(val, core->reg_base + 0xb0088);
>>>>>> +}
>>>>>
>>>>> you can reuse this from SM8250. That would work.
>>>>
>>>> Hmm, downstream driver was explicit about clearing only these two bits.
>>>> Is it really fine to clear all the bits?
>>>>
>>>
>>> Yes it is. We are doing the same for other SOCs as well.
>>
>> Wouldn't this also ungate / start the second core?
>>


-- 
Best regards,
Xilin Wu <sophon@radxa.com>


