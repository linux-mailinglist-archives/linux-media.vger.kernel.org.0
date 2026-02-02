Return-Path: <linux-media+bounces-52010-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KA8JBp2SgGkj/gIAu9opvQ
	(envelope-from <linux-media+bounces-52010-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 13:03:41 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A5ACC154
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 13:03:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EA0143002917
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 12:01:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B54DF3659EC;
	Mon,  2 Feb 2026 12:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YjDvOiRu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AlfU0hZn"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E118365A0C
	for <linux-media@vger.kernel.org>; Mon,  2 Feb 2026 12:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770033657; cv=none; b=kmgWbbFby2LJDVH+yr1EZfsgfK71hziOOBGBDx8m5CvOXdKS0fNkvzbkIeORvTPefU7H0tjiU7Wp/jybkwXPKoUuHLjXS84OvGaB3zvubaqY9sA+T8BIA2J6hy43ySIjSAAlH/ZyhKzmoEOxRqDFP5S1SfdCZMHxr6BDGeqJaR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770033657; c=relaxed/simple;
	bh=qA+QitnzbLE/kSSBV3KG8t7nRKD750eX4GqJ/cBqYGs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eX/3e/EUvKyZMqyZ3zlOC6hZ1KHtEpHJGbueGz9u/AaUS4NX5yY9PI8+9qZPP7NyIuFzp2XfW9nHS7fWJJEvihxtes7IRABzWzExaBeeBXR3B6NY/bpHeoB2yFBKp5aeI3wt+BZb/18kISun4JlL2NoA1c4GW3K9sO7rsbMZoG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YjDvOiRu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AlfU0hZn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61285b6t582712
	for <linux-media@vger.kernel.org>; Mon, 2 Feb 2026 12:00:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s5bjwTruAGT4usAWtLVsTQrDjs5AyqKQr8KVA8EJfRI=; b=YjDvOiRu4X38E5XJ
	q/k3vxN8oA9LwMiQeoNepcuulBK2lx9I+r7P7A086KCEtm7aIT5xA+9QQ2zI78UE
	fXeQ4XhXM6ZckWTrcb0YPSgqtGtXJxOzRjUJF6WhjOkAUGjXAX5H4o7G8irJE6vN
	YcxI3YKjKH4NpEsHe0RQn7J6q77LHiiPzfRkZlPfQ/AmzwrAFlmiwiH1Qufv29B4
	+Q4oV+3Xtxyz0eefnuxFf6NWe8oA7R+htapfEimiP42ihmbfeLZ6J+ObJ/rENXIr
	q0xud4fetn699bGN+jXzaV9k0anlD8WlQVEwkVKBh0UePmusr0N3aCM6CVn/XlHc
	Ebm8HA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1ared7xk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Feb 2026 12:00:54 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-354601967f6so967725a91.1
        for <linux-media@vger.kernel.org>; Mon, 02 Feb 2026 04:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770033653; x=1770638453; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s5bjwTruAGT4usAWtLVsTQrDjs5AyqKQr8KVA8EJfRI=;
        b=AlfU0hZn0FG3ecJntq6Ix63Bif0OwF6rVBv6eiy3KFksqeYJz0mAivuLXJDRiuzZud
         C7eyAD1MfGPyAdCEmnqSNVgUdzVWqY+Wmy16hhHFC+mx8Fgs107uYoTPXlh1UI4CUOYj
         2RXQLytZN+TAu3NXYeTiLDqCK5Yih0fVLJGTJzPS1WbeJjIY+LJiOYv0o4uaHv5kf8kP
         SM8YUZhgnnY4CafZDXzpITQMRrdiYabjHdml0qu4vXTUb5OQeDiTS0WiU8VPe8qV6oSd
         GBw9kTO3xmlQyz/SQtBrXZIE3ym3GM2HJie4CmOYR0h43+acebDRQ9CfrluWzer07hqs
         5loQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770033653; x=1770638453;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s5bjwTruAGT4usAWtLVsTQrDjs5AyqKQr8KVA8EJfRI=;
        b=ULEB7O91GRZ83A57k7suvdHgn5QaAmpaw8W9bp3t0EOWX4DB+XCruP9jKxXo0IMY+w
         Vs3BIaP9G2CbdXxxJn8K4jXI+5L/1aymkSQ1IjzniKmnNw5+EWsXakNp17Pd3JpZ+mQW
         fI4aibfjAdOLoALFNfqEF/jMwSdbbScsc/zT+bmpTm9R0Luan9Kac+McE8xZBqsbIZWb
         VKVBuW/zRwk292wxPD9CX0GoFFWTLpqFF4Qod/m1CnY4gtR87lmWJUzYy+64FTmJdh9h
         vKEmIXLjx24o6hpFQVg3kCWcEB/lBCmDJM5N5uAAFCMI5ueFgf7T72kvhBR+5Irg9ANr
         1hxQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2JSbjlQlPrt3XfK1ccebCWzSxWfrWATdv05DdWO7Er+KQj9JZJqndFrgf1qLmkpNDqVwUzEr1WyOifA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl3HzCRSHEM3BM3+YXXuQh6sDNY1DRhdlj38uOMp6KVoDoqimg
	ENSqXl+nz94jff/Ss4QWbWB8Brtg9Ac9/r8NKYfsnpSleEHrpIg8hsjr1LvsbpDg0DA1y+oy4zy
	j1wRVc3HKoHg6HIdOwGol9kXYNYUUf/TH3iVZlRV/Vus53yzQ+F+CAxH/c8AaFvbx9Q==
X-Gm-Gg: AZuq6aJF9d/WNVG0gTrJNTUyx28EV290pvcDFIGS2mFsg6VGG01+Sqt2C+VlkTr72Cw
	tJwtuF5hfQQY+AAKDSPw55tfrHbK1LmNnAeBt4ByD3ffZlA8azTjP2Z/aML8LObQCW7820MG0b7
	CEVJ40B9JXx7tevlwJp94+3BDGSWxVwConxQYXZ/8b0jhh5xIFmlO0/GzmqM0c3maUbwIH8jpAL
	n2n1wRQpAnCyvUUVLX+S1Ka9ywKJxCVGWrqRUB53C2q5ZgNzMlTHkOzVlh5hZkDvzgqx8NvcXzm
	jZJJSQo1+5C9NyXF37Wte9vTSPesJNXetFECW5ZC1uVK9HEkUDLiNawvFOLJxI2fe7fZUbL6mEa
	3ywsufGRU0dfrCOEfYFXdAEqEjVCzu8sKTMuHe3C44Q==
X-Received: by 2002:a17:90b:268b:b0:34a:8e4b:5b52 with SMTP id 98e67ed59e1d1-3543b2e003fmr9436109a91.8.1770033652504;
        Mon, 02 Feb 2026 04:00:52 -0800 (PST)
X-Received: by 2002:a17:90b:268b:b0:34a:8e4b:5b52 with SMTP id 98e67ed59e1d1-3543b2e003fmr9436072a91.8.1770033651918;
        Mon, 02 Feb 2026 04:00:51 -0800 (PST)
Received: from [10.204.100.98] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3540f2f24ccsm20194527a91.8.2026.02.02.04.00.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 04:00:51 -0800 (PST)
Message-ID: <74150529-9ace-443a-aa00-2490b0897574@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 17:30:43 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] media: iris: add context bank devices using iommu-map
To: Robin Murphy <robin.murphy@arm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260126-kaanapali-iris-v1-0-e2646246bfc1@oss.qualcomm.com>
 <20260126-kaanapali-iris-v1-5-e2646246bfc1@oss.qualcomm.com>
 <02b3d0f5-f94c-43cd-93af-97cfcf7751b1@arm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <02b3d0f5-f94c-43cd-93af-97cfcf7751b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NNfYOk6g c=1 sm=1 tr=0 ts=698091f6 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=8ZOrhM5FIgLh972jGGIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 1BLtgXUlePRK1f9Qc27_ju2dj9clGIvN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA5MyBTYWx0ZWRfX/D7bcaFzWmFU
 tF5rlr/eGwPxRxZ/xMDNkxmZY33z0aew6PaRi8wnaZfkTDSfD9WEe+/jQcB6FXVTpMeVebB/3Wq
 j2ed68gVLAdTRYzGGccUAgpzutppRHTHajbcg8JghDu+/BBA5DEQoXZYu1/AYMCAwRTgq5ZljH3
 IU4I7fY/VEYak1A/yD8XRss9Cxrk5p5nW70PLtEFcg2pKeV235q1yZ7cShtwbgZdXHvHGvMeKyu
 uAzaPM+lBf62mjy4kmdLUTi2E2ZIN5XjFIkjItRpEdxjf7L8+54fHrF+lVJlhZpxUwH3YQvi5gw
 E9L787iB3gv5FQofVS/8PcZSiGimq+ZfIHf6p5zkRxc053ItWI5eZP4FBMc37FsuIhntRjwDX2n
 weRuvQXn73lkBFwnLIiFJ23mP38WxC3SgzkPh4lkmB9kyk741diTGi0J+HL7OAFWid0lxBJCh+L
 8suqz9EkpwwtAdJ15+w==
X-Proofpoint-ORIG-GUID: 1BLtgXUlePRK1f9Qc27_ju2dj9clGIvN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020093
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52010-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 41A5ACC154
X-Rspamd-Action: no action



On 1/27/2026 8:19 PM, Robin Murphy wrote:
> On 2026-01-26 12:25 pm, Vikash Garodia wrote:
>> Introduce different context banks(CB) and the associated buffer region.
>> Different stream IDs from VPU would be associated to one of these CB.
>> The patch ensures to handle CBs which are described as iommu-map in DT.
>> Multiple CBs are needed to increase the IOVA for the video usecases like
>> higher concurrent sessions.
>>
>> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> ---
>>   .../platform/qcom/iris/iris_platform_common.h      | 29 ++++++++++++
>>   drivers/media/platform/qcom/iris/iris_probe.c      | 55 ++++++++++++ 
>> ++++++++--
>>   drivers/media/platform/qcom/iris/iris_resources.c  | 35 ++++++++++++++
>>   drivers/media/platform/qcom/iris/iris_resources.h  |  1 +
>>   4 files changed, 116 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h 
>> b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> index 
>> 5a489917580eb10022fdcb52f7321a915e8b239d..d2d7c898fc8ef0de1b16aebd72681ea3c5b736ae 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> @@ -204,6 +204,33 @@ struct icc_vote_data {
>>       u32 fps;
>>   };
>> +enum iris_iommu_map_function_id {
>> +    IRIS_CB_NON_SECURE_NON_PIXEL    = 0x100,
>> +    IRIS_CB_NON_SECURE_PIXEL    = 0x101,
>> +    IRIS_CB_NON_SECURE_BITSTREAM    = 0x102,
>> +    IRIS_CB_SECURE_NON_PIXEL    = 0x200,
>> +    IRIS_CB_SECURE_PIXEL        = 0x201,
>> +    IRIS_CB_SECURE_BITSTREAM    = 0x202,
>> +    IRIS_CB_FIRMWARE        = 0x300,
>> +};
>> +
>> +enum iris_buffer_region {
>> +    IRIS_NON_SECURE_NON_PIXEL    = BIT(0),
>> +    IRIS_NON_SECURE_PIXEL        = BIT(1),
>> +    IRIS_NON_SECURE_BITSTREAM    = BIT(2),
>> +    IRIS_SECURE_NON_PIXEL        = BIT(3),
>> +    IRIS_SECURE_PIXEL        = BIT(4),
>> +    IRIS_SECURE_BITSTREAM        = BIT(5),
>> +};
>> +
>> +struct iris_context_bank {
>> +    struct device *dev;
>> +    const char *name;
>> +    const enum iris_iommu_map_function_id f_id;
>> +    const enum iris_buffer_region region;
>> +    const u64 dma_mask;
>> +};
>> +
>>   enum platform_pm_domain_type {
>>       IRIS_CTRL_POWER_DOMAIN,
>>       IRIS_HW_POWER_DOMAIN,
>> @@ -246,6 +273,8 @@ struct iris_platform_data {
>>       u32 inst_fw_caps_enc_size;
>>       const struct tz_cp_config *tz_cp_config_data;
>>       u32 tz_cp_config_data_size;
>> +    struct iris_context_bank *cb_data;
>> +    u32 cb_data_size;
>>       u32 core_arch;
>>       u32 hw_response_timeout;
>>       struct ubwc_config_data *ubwc_config;
>> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/ 
>> media/platform/qcom/iris/iris_probe.c
>> index 
>> ddaacda523ecb9990af0dd0640196223fbcc2cab..c1a6aac5a3d65d980c5a34ba5fa1c1dbcf790ec5 100644
>> --- a/drivers/media/platform/qcom/iris/iris_probe.c
>> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
>> @@ -123,6 +123,37 @@ static int iris_init_resets(struct iris_core *core)
>>                        core->iris_platform_data- 
>> >controller_rst_tbl_size);
>>   }
>> +static int iris_init_context_bank_devices(struct iris_core *core)
>> +{
>> +    struct iris_context_bank *cb;
>> +    const __be32 *map_data;
>> +    int tupple_size = 5;
>> +    int i, j, ret, len;
>> +    u32 fid;
>> +
>> +    map_data = of_get_property(core->dev->of_node, "iommu-map", &len);
> 
> If despite proposing all this hackery in the common OF code you're then 
> _still_ going to open-code your own parsing of the property, with hard- 
> coded assumptions to boot, then clearly this is not the appropriate 
> approach at all...
> 

Ack, we should avoid parsing this in video driver.


>> +    if (!map_data)
>> +        return 0;
>> +
>> +    len /= sizeof(__be32);
>> +
>> +    for (i = 0; i < len; i += tupple_size) {
>> +        fid = be32_to_cpu(map_data[i]);
>> +
>> +        for (j = 0; j < core->iris_platform_data->cb_data_size; j++) {
>> +            cb = &core->iris_platform_data->cb_data[j];
>> +
>> +            if (fid == cb->f_id && !cb->dev) {
>> +                ret = iris_create_child_device_and_map(core, cb);
>> +                if (ret)
>> +                    return ret;
>> +            }
>> +        }
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>   static int iris_init_resources(struct iris_core *core)
>>   {
>>       int ret;
>> @@ -139,7 +170,11 @@ static int iris_init_resources(struct iris_core 
>> *core)
>>       if (ret)
>>           return ret;
>> -    return iris_init_resets(core);
>> +    ret = iris_init_resets(core);
>> +    if (ret)
>> +        return ret;
>> +
>> +    return iris_init_context_bank_devices(core);
>>   }
>>   static int iris_register_video_device(struct iris_core *core, enum 
>> domain_type type)
>> @@ -187,6 +222,8 @@ static int iris_register_video_device(struct 
>> iris_core *core, enum domain_type t
>>   static void iris_remove(struct platform_device *pdev)
>>   {
>>       struct iris_core *core;
>> +    struct device *dev;
>> +    int i;
>>       core = platform_get_drvdata(pdev);
>>       if (!core)
>> @@ -194,6 +231,14 @@ static void iris_remove(struct platform_device 
>> *pdev)
>>       iris_core_deinit(core);
>> +    for (i = 0; i < core->iris_platform_data->cb_data_size; i++) {
>> +        dev = core->iris_platform_data->cb_data[i].dev;
>> +        if (dev) {
>> +            platform_device_unregister(to_platform_device(dev));
>> +            core->iris_platform_data->cb_data[i].dev = NULL;
>> +        }
>> +    }
>> +
>>       video_unregister_device(core->vdev_dec);
>>       video_unregister_device(core->vdev_enc);
>> @@ -277,9 +322,11 @@ static int iris_probe(struct platform_device *pdev)
>>       dma_mask = core->iris_platform_data->dma_mask;
>> -    ret = dma_set_mask_and_coherent(dev, dma_mask);
>> -    if (ret)
>> -        goto err_vdev_unreg_enc;
>> +    if (device_iommu_mapped(core->dev)) {
>> +        ret = dma_set_mask_and_coherent(core->dev, dma_mask);
> 
> Huh? Why would this be conditional? If it's a DMA device then it's a DMA 
> device, regardless of whether an IOMMU driver happens to be present or not.

added to support existing DTS which have iommus property. For parent 
node, not having the iommus property and dma_set_mask_and_coherent is 
called for parent device, it errors.

> 
>> +        if (ret)
>> +            goto err_vdev_unreg_enc;
>> +    }
>>       dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
>>       dma_set_seg_boundary(&pdev->dev, DMA_BIT_MASK(32));
>> diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/ 
>> drivers/media/platform/qcom/iris/iris_resources.c
>> index 
>> 773f6548370a257b8ae7332242544266cbbd61a9..647f6760f2b7a6bab8a585a13eb03cf60a9c047e 100644
>> --- a/drivers/media/platform/qcom/iris/iris_resources.c
>> +++ b/drivers/media/platform/qcom/iris/iris_resources.c
>> @@ -6,6 +6,7 @@
>>   #include <linux/clk.h>
>>   #include <linux/devfreq.h>
>>   #include <linux/interconnect.h>
>> +#include <linux/of_device.h>
>>   #include <linux/pm_domain.h>
>>   #include <linux/pm_opp.h>
>>   #include <linux/pm_runtime.h>
>> @@ -141,3 +142,37 @@ int iris_disable_unprepare_clock(struct iris_core 
>> *core, enum platform_clk_type
>>       return 0;
>>   }
>> +
>> +int iris_create_child_device_and_map(struct iris_core *core, struct 
>> iris_context_bank *cb)
>> +{
>> +    struct platform_device *pdev;
>> +    int ret;
>> +
>> +    pdev = platform_device_alloc(cb->name, 0);
>> +    if (!pdev)
>> +        return -ENOMEM;
>> +
>> +    ret = platform_device_add(pdev);
>> +    if (ret) {
>> +        platform_device_put(pdev);
>> +        return ret;
>> +    }
>> +
>> +    ret = of_dma_configure_id(&pdev->dev, core->dev->of_node, true,
>> +                  (const u32 *)&cb->f_id);
> 
> No. As I already said before, of_dma_configure() is for bus drivers; if 
> you want to act like a bus, implement a proper bus_type with 
> a .dma_configure callback. If you don't want to do that then describe 
> the individual functional blocks of the codec appropriately as distinct 
> devices with distinct hardware properties so the platform bus code can 
> handle them correctly. It is not reasonable to advertise physical 
> hardware to Linux as a single monolithic device, but then have a driver 
> try to pull a "well actually..." by abusing all the internal 
> abstractions. The fact that you might happen to avoid the warning from 
> iommu_probe_device() because you're not binding drivers to these fake 
> platform devices doesn't make this design any less wrong.
>

VPU would have _only_ distinct stream-ids for distinct hardware sub 
blocks, would that classify them as distinct devices with distinct 
hardware properties so as to use platform bus ?

Here is what i posted earlier with "iris_non_pixel" as one of sub-block,

https://lore.kernel.org/linux-media/20250627-video_cb-v3-1-51e18c0ffbce@quicinc.com/

Regards,
Vikash

> Thanks,
> Robin.
> 
>> +    if (ret)
>> +        goto error_unregister;
>> +
>> +    ret = dma_set_mask_and_coherent(&pdev->dev, cb->dma_mask);
>> +    if (ret)
>> +        goto error_unregister;
>> +
>> +    cb->dev = &pdev->dev;
>> +
>> +    return 0;
>> +
>> +error_unregister:
>> +    platform_device_unregister(to_platform_device(&pdev->dev));
>> +
>> +    return ret;
>> +}
>> diff --git a/drivers/media/platform/qcom/iris/iris_resources.h b/ 
>> drivers/media/platform/qcom/iris/iris_resources.h
>> index 
>> 6bfbd2dc6db095ec05e53c894e048285f82446c6..b7efe15facb203eea9ae13d5f0abdcc2ea718b4d 100644
>> --- a/drivers/media/platform/qcom/iris/iris_resources.h
>> +++ b/drivers/media/platform/qcom/iris/iris_resources.h
>> @@ -15,5 +15,6 @@ int iris_unset_icc_bw(struct iris_core *core);
>>   int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw);
>>   int iris_disable_unprepare_clock(struct iris_core *core, enum 
>> platform_clk_type clk_type);
>>   int iris_prepare_enable_clock(struct iris_core *core, enum 
>> platform_clk_type clk_type);
>> +int iris_create_child_device_and_map(struct iris_core *core, struct 
>> iris_context_bank *cb);
>>   #endif
>>
> 


