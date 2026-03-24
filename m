Return-Path: <linux-media+bounces-56799-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MIcxId0awmlfZgQAu9opvQ
	(envelope-from <linux-media+bounces-56799-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 06:02:21 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B673021BC
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 06:02:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 793F3304CB8A
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 05:02:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84864291C10;
	Tue, 24 Mar 2026 05:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PjK32kiW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NuA4SSRL"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1135282F35
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 05:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774328517; cv=none; b=sRw2A/5CUgwfn55Z3+iiqdX4Syn7Q1obUsk3+FAxe8gWcMugsfCubpToNw080Ym7orp7U7Tr2UWzZltJYKX1CmRI0sa9yaTThPQvce5nVLSFEw3MRnpea0piFlxctV3EzcPAoQMjDsfzpgAKr5KttWj5hqBB+IPUy7l63aq2+tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774328517; c=relaxed/simple;
	bh=ON1WCZHZ2G7BgfB/9L8oIsXRjOT/5zbtb0UXz8MKYrE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DrvLYqiz9dURXxCdp75P1Z1ny3bUvzSMrP1HvHbRrHA20oG2QcTgEnljZb5cMMixvfeZZddHiXwGcVI4VrFId3zc9ZCTdaPFG26xZXzZPexu7yfF3hnW+21QdE0DseZO5yT7mp2Bu1tYBND8r4Ylu4gIoOEiNJ1lwnCnHS8lPx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PjK32kiW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NuA4SSRL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O3EYR53934901
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 05:01:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IiTPDR5t0I+R3q9k9yGaksyznOthlU1LBxPz3F1H0W4=; b=PjK32kiWeHqS4BII
	k/SGkETKjKL9qCYGym56pBMYm/2/2tF7pbm+eYs24eScHV/gHxzQPaw+zAgPln/I
	tapak1sOiNt7IOTryKzFHdOigQPA5E3044f/EhCy1cGxCs9zuULKp7vRlX95YaC9
	9ZnEFkhfSoZkAoJlgvqqZoeosstHNbaNSYQwqfZsL2hDGpznT6Jun9M3MX4/0Blq
	0MqMCQKYrR1uA1Jl0t5poQvl3CFClNjki/hFciKLNCtDMxpwqTGPF/fq8D8oAWf0
	ZbCj/yeJitIldZlAZcr0NZew0Iv0mNiPyWJ9TCXKHiaYsYRiJmFqjY7f9Hm4xdVZ
	EoFCwQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d37a0jr7b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 05:01:54 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c7381a95fffso2828070a12.0
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 22:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774328514; x=1774933314; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IiTPDR5t0I+R3q9k9yGaksyznOthlU1LBxPz3F1H0W4=;
        b=NuA4SSRLVyewfuWpteT+0oxW7snENsK4JqvFGfDWjMdIE1S3ZLUOntZIZJToim4P0r
         5cDlJINZBsB9LomhutLzIR+ZgEKGm0YZh1oT/cdBkV6bIW98s+qJlCXwjWYDsM6WQxpc
         6Jv0r81LR9G2KD16PWC5FkApTvnortP6Gpno+SaQ4XdXbSLzof/uL/8vEtXAAJLckzm2
         +6nQds+4GLX/uXWzsPiHX7mx8/2lXJ9ilBSq8ms6BJ91yivGsQmbdkIljRynJtf6bY6T
         C8VJjD0dcR9ed44u8iiQZGyk105BVc3ob936pvmRO+7BD6e2qwBSMt6yQADYRkNXmoYq
         O5Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774328514; x=1774933314;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IiTPDR5t0I+R3q9k9yGaksyznOthlU1LBxPz3F1H0W4=;
        b=ZaLBM315q9so8iMTP6fqxL4UQsIUR+ej2Th3AUDfza79sN7B5jruhy9JScRHMRRTeX
         6uMo6Ut4BObcNFdjsNSH20JPpuChczA0bvMk92gQKwyZfL6fFinQQiaV9OxElEcNhHRi
         GHA5bMvWkBEFH4pWsMapxqBD5MpKuO4g7LAY7gR7wVekPZvPqujdPUHcOGezQ0TPQMuj
         KPBdIcrTV8n6uAQ7wTLs+7wSF4DpEqCP2QwXbxYOsPLwD8W7vMRndbuvUyAhB2OD41la
         JPsVVaMQtJo+wzQWlNzipm5PpVsOt/gMYJljFInnhjtFHVxaKn97w5OVmjF73YVbB8ai
         ytFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUi2Vk7mrdAmG/OElQn++sA7TPm0RsxBIZce5Uov+jAnCYmSnx2tvoECbmbBYd3WG+/c2IB3szYmE6hmg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxT2CxayZkUtNGTXJWks6Q7czDqImIGPB4ITRWfyCIrRUYrbQbR
	jd3r1LSp/bIA274j7fZdBsUPwkVzboPnTWAFh5DgDkV7EFOQ07UznPSkJo1739JvuIcv+qfPMa9
	zQdlo4sK7/xVCLUqKu7Gys0JvbEcwp2by3Vh2n1MOHaK5qqWhsORamt1cPH+fnKYn5A==
X-Gm-Gg: ATEYQzxvf122vklEEOejOShdPydqelDLX+BBFayOxBRSeQVWd/9rnbonOB0RUiJPZN3
	De94M0soNoUTUSdZyn6oPiDSo0hxftUfNNkWZIzzug4RiRZWeZ9UU+Q4zmwK0IkdVwz/uCwKqD3
	2MG8I88Dk403D3Zbt6YlrbEMi/qdvfvkUAgxhNtxky++gWAOqmOBYHkp7GSZ7GhsXnIavCU0sbl
	myFA9VAFFQI3Z5n4XCLbl+sLFMpaw2K5C/a520YkvLfifCW5RiEWa3ZrTxRElR0w5KI5EOP04Vk
	Rqne5goHUQKzQTf/5K1tsYXbO3TAaqQ/cOh79wPb5bOdN1hW1n4jQg3hQ72pu1lv5+nK6JZQ+Zg
	UjGuWoBMQJ0GPPS2L+s1ClQIHYKD+/vkFRJFSQOP+ggeX4KMdUzQOmQ==
X-Received: by 2002:a17:903:b8f:b0:2b0:7a50:886f with SMTP id d9443c01a7336-2b08281fce8mr115607935ad.51.1774328514223;
        Mon, 23 Mar 2026 22:01:54 -0700 (PDT)
X-Received: by 2002:a17:903:b8f:b0:2b0:7a50:886f with SMTP id d9443c01a7336-2b08281fce8mr115607665ad.51.1774328513704;
        Mon, 23 Mar 2026 22:01:53 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.233.113])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08352aea8sm165992675ad.21.2026.03.23.22.01.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 22:01:53 -0700 (PDT)
Message-ID: <435aac26-ca29-299c-f054-9e91d474c267@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 10:31:46 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v8 11/11] media: qcom: iris: extract firmware description
 data
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260319-iris-platform-data-v8-0-55a9566ebf60@oss.qualcomm.com>
 <20260319-iris-platform-data-v8-11-55a9566ebf60@oss.qualcomm.com>
 <14610f07-52c2-465c-d407-fff1974429ea@oss.qualcomm.com>
 <3wp2puizxtd65wdskfzmkst3ju6erk7tv73qhwyl2pmfbbnvz4@3ixjc3a2nvxo>
Content-Language: en-US
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <3wp2puizxtd65wdskfzmkst3ju6erk7tv73qhwyl2pmfbbnvz4@3ixjc3a2nvxo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GIIF0+NK c=1 sm=1 tr=0 ts=69c21ac2 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=hbzS8gabZINpAvasuVNEhA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=OfUp0foXwAuGwpNaDJQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDAzOSBTYWx0ZWRfX5g48j0Etw+rS
 c/W1dloLcfVa9Tfd75ONYscaSlAw5KK9MNOU3bezlClvpswtdxV+GMx8tPY/SZh3l6L2yRXOjdV
 PVvIrph8sGTwe35rG54zRjsOrMjrx63r+SYGWblNIEJ+D1THsk8PFPP8CoyTnegv7cN9nleuVQm
 b1iHlgorL1w4cb0/87p52/TnUURYPN2A8ad+Z9ZqVnDG02QmgpYpL87K9Q1R1OP70ijQeKZ9ivc
 sO3+xZmUJtP4KDa8oJv/kYtkytFXs2QVtDvAv6p/vWCNFm2yZqbSdLbwjMAq67MfXHOtrm5VglN
 Lt3ds+E59lpkV5n8XZ+65AviQQTYLJGEhZZTBbfjALowCVVaLK2aaL9vkdrm3vqPah4H12KZfd9
 L5su94Q2HzRyblra5lsKZ/iuHSfKhjpphZZei1R+u3eYalIgKRo9T0b6ql6UYyxBdvTdPWIhaSj
 tdQDgLRsKzAokpyu7dQ==
X-Proofpoint-GUID: QcLVTk56c9IcaU0r7wvl35EiyNtN5wFE
X-Proofpoint-ORIG-GUID: QcLVTk56c9IcaU0r7wvl35EiyNtN5wFE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_01,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240039
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56799-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 00B673021BC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/23/2026 1:03 PM, Dmitry Baryshkov wrote:
> On Mon, Mar 23, 2026 at 12:50:32PM +0530, Dikshita Agarwal wrote:
>>
>>
>> On 3/19/2026 11:29 AM, Dmitry Baryshkov wrote:
>>> In preparation to adding support for several firmware revisions to be
>>> used for a platform, extract the firmware description data. It
>>> incorporates firmware name, HFI ops and buffer requirements of the
>>> particular firmware build.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>>  drivers/media/platform/qcom/iris/iris_buffer.c     |  2 +-
>>>  drivers/media/platform/qcom/iris/iris_core.h       |  1 +
>>>  drivers/media/platform/qcom/iris/iris_firmware.c   |  2 +-
>>>  .../platform/qcom/iris/iris_hfi_gen1_command.c     |  2 +-
>>>  .../platform/qcom/iris/iris_platform_common.h      | 15 ++++----
>>>  .../media/platform/qcom/iris/iris_platform_vpu2.c  | 20 +++++++----
>>>  .../media/platform/qcom/iris/iris_platform_vpu3x.c | 41 +++++++++++++++-------
>>>  drivers/media/platform/qcom/iris/iris_probe.c      |  3 +-
>>>  8 files changed, 57 insertions(+), 29 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
>>> index fbe136360aa1..ef7f6f931557 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
>>> @@ -295,7 +295,7 @@ static void iris_fill_internal_buf_info(struct iris_inst *inst,
>>>  {
>>>  	struct iris_buffers *buffers = &inst->buffers[buffer_type];
>>>  
>>> -	buffers->size = inst->core->iris_platform_data->get_vpu_buffer_size(inst, buffer_type);
>>> +	buffers->size = inst->core->iris_firmware_desc->get_vpu_buffer_size(inst, buffer_type);
>>>  	buffers->min_count = iris_vpu_buf_count(inst, buffer_type);
>>>  }
>>>  
>>> diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
>>> index e0ca245c8c63..7f36eb65dcbf 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_core.h
>>> +++ b/drivers/media/platform/qcom/iris/iris_core.h
>>> @@ -99,6 +99,7 @@ struct iris_core {
>>>  	struct reset_control_bulk_data		*controller_resets;
>>>  	const struct iris_platform_data		*iris_platform_data;
>>>  	const struct iris_firmware_data		*iris_firmware_data;
>>> +	const struct iris_firmware_desc		*iris_firmware_desc;
>>
>> Missing documentation.
> 
> Will fix in v10.
> 
>>
>>>  	const struct qcom_ubwc_cfg_data		*ubwc_cfg;
>>>  	enum iris_core_state			state;
>>>  	dma_addr_t				iface_q_table_daddr;
>>
>> <snip>
>>
>>> index dd87504c2e67..d36f0c0e785b 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_probe.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
>>> @@ -251,7 +251,8 @@ static int iris_probe(struct platform_device *pdev)
>>>  		return core->irq;
>>>  
>>>  	core->iris_platform_data = of_device_get_match_data(core->dev);
>>> -	core->iris_firmware_data = core->iris_platform_data->firmware_data;
>>> +	core->iris_firmware_desc = core->iris_platform_data->firmware_desc;
>>
>> How will iris_firmware_desc be selected once a SoC supports both Gen1 and
>> Gen2 firmware?
>> Today it’s fixed in platform_data, but eventually probe would need to
>> choose between firmware_desc_gen1 / firmware_desc_gen2 based on the generation.
> 
> Yes. Looking at the past firmware releases, we might need to implement
> more than one "description", e.g. when upgrading between firmware
> branches would also cause extra side effects (additional codecs, changes
> to the buffer sizes, etc.).  But... I'd really prefer to do that in
> steps and only when required.
> 
> I'd leave concurrent gen1 / gen2 support that to be implemented in your
> series, if you consider this interface to be worthwhile. Currently every
> platform supports only one firmware "description".

Ack, Thanks.

Regards,
Dikshita
> 

