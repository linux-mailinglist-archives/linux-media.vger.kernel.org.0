Return-Path: <linux-media+bounces-52980-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIPSFqh3lGlmEAIAu9opvQ
	(envelope-from <linux-media+bounces-52980-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 15:14:00 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A0B14D0E8
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 15:13:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D06C3048B2A
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 14:11:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F310136C0B7;
	Tue, 17 Feb 2026 14:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hT+3rthc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Iho9SRKF"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D62436999D
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 14:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771337503; cv=none; b=l48oQP9eFBXLM1mDdTHWH8wFR1zzf6TtvY2DYv8XjwF1rbUUpzUEUsGyZE0RYK7CWi06fLGJ8ZYsmxTVFhYQSCquieEWhY6wAv68j+vUlKeBb3bG8nkdrcuLFfSUqcKLYPn6HwNPNtDWV6Ju6Hb1t2XpLRwUutwWesfKxa87RzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771337503; c=relaxed/simple;
	bh=jbgmdcTQxX7pyYFMINAL/5nT7jyyBScF9+NauEz/E6k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=izbuBjL9fQ6ftRIggTTCiHWzLxNp4aZQfZ+QndnTxFmxVbSjNyyksst5LNhVMamO5iqFWu5tfgeWiMEpha/ShgVGPaieebko6JVbVHg0E+c7dHbwZcGZfJ1ZpJuB51S2R2pTgaaCWV/fp8QncoVwCMirE7kI0K+Z7MozdBijvPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hT+3rthc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Iho9SRKF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H8lg221601370
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 14:11:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z1exp7vWAOAc8GFVwCy/aOu418CWdLbMRQ0dGRhuTVw=; b=hT+3rthckeAUkSf7
	Ik3aPKqd2Ytki8m6GCCFOkTg+oDsN4fmmSJ0Dy4aOj/g9wevAwrNglBHZWY27h53
	id4lXQenRM1ayaKrD04TONS4AmGImKcEP2Wo/DALoXp6aJT/c9fi9tmXhR04EGKg
	SO9yM5VuprjfgZ6+/YUMsMbt+BPRBN0ucrSQjdc0yQbIHUdnGmc8Zl9gSxZ0oQbT
	muJ80Qr3gvujp/DzyX4tPw7zwl9Hflq73kipJZjqXTudiyOD6N+6w4VdZ2zWIA2n
	0MVKxNC+wcEHrSWVzRH4q3+aYsMrvwtj3iX7cuFPu4PEs+uWEKsAIWHG+fGTU4wq
	6ZB64g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6tmagrt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 14:11:41 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8249ba7f6e8so1968795b3a.2
        for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 06:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771337500; x=1771942300; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z1exp7vWAOAc8GFVwCy/aOu418CWdLbMRQ0dGRhuTVw=;
        b=Iho9SRKFqz/CljpeBNOw82HEmX9wPGlbu5QWSJ96orkt53OVobwb2HJ0hS92kklQhH
         aDYZZie+UAfM4KCV/o7fzNuSrYRrbhk8W71TKQBLcRVU22FeCxQRwqFMxSh8iY98lVmW
         bE4vh5ojH7/pY0fcFsxWtUb2OBacZgITe2lv2mal/O7O/yhd92kUNM1E4CFEVLs4ilsS
         EuI7V/Ijl+tIwEKoQTo0u68OZe5Pi5ufUl+PXaM9gZHUv9ONXKSiIYyTUKlqIC3JeaBl
         jDdiJuN6MHGnT/nTUnGc0FGJLsW1PFgnh/VukvHgbtxXdcwi6A5/JzfdByWA9raEIzjK
         3M5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771337500; x=1771942300;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z1exp7vWAOAc8GFVwCy/aOu418CWdLbMRQ0dGRhuTVw=;
        b=S/fGxs5RgOMwIA7wiu3LOZYMTsOwKQT7bJ++nKv+GoMWAuEjB9F+f75GOLCTgSTIEd
         kEPRLnGt/eGPWaWCXkk8W1vl5sQmoMDrr/jgVtA0D+JFWTnA3Ch8txViTVTMfaLo/ziY
         VfMF0+esizv6WvAa+eOP7HuIJQd6tIeBtJuh5AzNbeQ94JONFmM3tO9VX2uB1HHsbThV
         S3UwYEma67BvcSMMU43bwqDkupC+l7ufFlh3NNgdJKWFXlLcYC8ycx2dMEFjHhhI27Pr
         PfYc9QENHhVXHo5lq/FW+zxcBeE353e05R5JXJwZRUsPEEbXGufQ87X6s3RUtLkcKWHG
         oUuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVy6t9i3Oiu4SjHIMfsbVOheIhVXpntRin6VIfKB7xhH3FdIJKS2PXfgGma/zoUENEojlKVdJtSnLGoOw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqZM9hz8wGNDn9B7IV9fuNAKb+6jdH3iZpF2VR1kHUia71/3S/
	lSVBxG5K+IDdszmLtJ//N3AncLrs7rUDwUolOXqynHxK+zcwJiO7I/mARh7IjyuW9XNVUxKAMGS
	iSH1ahGddWBZh8fXe0T7tPW6O3nuRzVDnLPv6ZcEiX00Tgfz6b9vhKzu9cRuHYBCshw==
X-Gm-Gg: AZuq6aJ5ZHRmCH75s0MBBLXbKsgHJ5UYtsz4h/v1kHGbrAOyW6/rTkZ1RcgRxg6utq1
	KhUzGVStM55YcfggyDijVvBHzMnZhTwpzdonfRfYnMKKIyE6e29/rEyIIGIJWQydhcxwiZHp9sp
	9b7xk0Yv9zUxb2avjyCkY7lslUFL2herSqFd3zoUE9Uhxi7qy3DlI/0XJyXHeoFmQxKYEN+kTjY
	qZXPwMxhebXCXPWxI1yJUnvtSqKWLd9WlUB4HnckUkYIEuWK7IvMyg//m4fIYoWDgadOKdBYXeh
	qpHxNEJyMNCe9trls4BdUruCMvnzEG4Qeu2kq8Os0YIZfMmrIQo2b+5fDJ6PQ8B+vD7qbQVn1Q1
	iglEHPt8NO5DR0grrjwozNnXhLAlcgEf/3OVczGE3jaweCEl/jJJlWg==
X-Received: by 2002:a05:6a00:928d:b0:821:8230:235d with SMTP id d2e1a72fcca58-824d95f6a41mr10187823b3a.39.1771337499946;
        Tue, 17 Feb 2026 06:11:39 -0800 (PST)
X-Received: by 2002:a05:6a00:928d:b0:821:8230:235d with SMTP id d2e1a72fcca58-824d95f6a41mr10187791b3a.39.1771337499420;
        Tue, 17 Feb 2026 06:11:39 -0800 (PST)
Received: from [10.204.100.45] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6b90b9fsm15414434b3a.46.2026.02.17.06.11.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 06:11:38 -0800 (PST)
Message-ID: <7161bb8b-f8e4-4efe-a136-40983678a84e@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 19:41:31 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] media: iris: Switch to hardware mode after firmware
 boot
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260126-kaanapali-iris-v1-0-e2646246bfc1@oss.qualcomm.com>
 <fLxe2FUgx2tsLsXWrEdDq_iHxUUnVhy0BT_zzO3t3rmpLau36zhbLaZFyH5tQZJRO-uLVcHm4RsG_x1PEVOnKw==@protonmail.internalid>
 <20260126-kaanapali-iris-v1-4-e2646246bfc1@oss.qualcomm.com>
 <dd36c365-cffb-4fac-bf11-40e4896cbab5@kernel.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <dd36c365-cffb-4fac-bf11-40e4896cbab5@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Zmoyb8TaUYAKTvCx8kXc9Zs9iQ2dO2f7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDExNCBTYWx0ZWRfX2h3m2+3LlSRo
 asN/idANQMkRJcXqahyPrfBM0uHp1/7wIkyZAH2fnil55NxG29Ykd51NqYA502SIEGx+nJKHCCx
 Pntsii6mOBJr7rjRPCkJtaVr67Vv8kJ1oWLGEpZSdmiUm5bY9+TtR+LQd9gt82WwI+H7xvUDqLg
 Pbt2kAURgbdNX8KY5PYHcy/TAAGlJu1y3s5RE/+W3/doBF19EpYSaapCTV53jv71rDGNQCptLl2
 nq8h+OJ/QaWu5kv/dsiseUSiKWV9UUQoDuOxuu1lWyq4Rej2PtMel9tMgjdnu6wy0wYK/WXIvvS
 KjffV1Enko8f2WQHf2zPHf5tCRYX4g2+no7y3vh1qnRLq4x7xukw6gu3SeKYHBEGL8LZ/RjafbQ
 ErB/VOBH0ATujZrSfOxnK2SQWtHKDuMc+FV0kpSZNRnSM+QGIog1V/SgKuG3maFBpa7VY4/SYKm
 o42TdNPDBxfVVzb87Xw==
X-Proofpoint-ORIG-GUID: Zmoyb8TaUYAKTvCx8kXc9Zs9iQ2dO2f7
X-Authority-Analysis: v=2.4 cv=IOoPywvG c=1 sm=1 tr=0 ts=6994771d cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=PsZjGXtKO3tw9YjmHZYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170114
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52980-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 94A0B14D0E8
X-Rspamd-Action: no action



On 2/2/2026 8:39 PM, Bryan O'Donoghue wrote:
> On 26/01/2026 12:25, Vikash Garodia wrote:
>> Currently the driver switches the vcodec GDSC to hardware (HW) mode
>> before firmware load and boot sequence. GDSC can be powered off,
>> keeping in hw mode, thereby the vcodec registers programmed in TrustZone
>> (TZ) carry default (reset) values.
>> Move the transition to HW mode after firmware load and boot sequence.
>>
>> The bug was exposed with driver configuring different stream ids to
>> different devices via iommu-map. With registers carrying reset values,
>> VPU would not generate desired stream-id, thereby leading to SMMU fault.
>>
>> Fixes: dde659d37036 ("media: iris: Introduce vpu ops for vpu4 with 
>> necessary hooks")
>> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/iris/iris_core.c       |  4 ++++
>>   drivers/media/platform/qcom/iris/iris_hfi_common.c |  4 ++++
>>   drivers/media/platform/qcom/iris/iris_vpu2.c       |  1 +
>>   drivers/media/platform/qcom/iris/iris_vpu3x.c      |  9 +++-----
>>   drivers/media/platform/qcom/iris/iris_vpu4x.c      | 24 +++++++++++ 
>> +----------
>>   drivers/media/platform/qcom/iris/iris_vpu_common.c | 16 +++++++++------
>>   drivers/media/platform/qcom/iris/iris_vpu_common.h |  3 +++
>>   7 files changed, 38 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/ 
>> media/platform/qcom/iris/iris_core.c
>> index 
>> 8406c48d635b6eba0879396ce9f9ae2292743f09..dbaac01eb15a0e622e85635fddd29c1f7fc18662 100644
>> --- a/drivers/media/platform/qcom/iris/iris_core.c
>> +++ b/drivers/media/platform/qcom/iris/iris_core.c
>> @@ -75,6 +75,10 @@ int iris_core_init(struct iris_core *core)
>>       if (ret)
>>           goto error_unload_fw;
>>
>> +    ret = iris_vpu_switch_to_hwmode(core);
>> +    if (ret)
>> +        goto error_unload_fw;
>> +
>>       ret = iris_hfi_core_init(core);
>>       if (ret)
>>           goto error_unload_fw;
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.c b/ 
>> drivers/media/platform/qcom/iris/iris_hfi_common.c
>> index 
>> 92112eb16c11048e28230a2926dfb46e3163aada..621c66593d88d47ef3438c98a07cb29421c4e375 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_common.c
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_common.c
>> @@ -159,6 +159,10 @@ int iris_hfi_pm_resume(struct iris_core *core)
>>       if (ret)
>>           goto err_suspend_hw;
>>
>> +    ret = iris_vpu_switch_to_hwmode(core);
>> +    if (ret)
>> +        goto err_suspend_hw;
>> +
>>       ret = ops->sys_interframe_powercollapse(core);
>>       if (ret)
>>           goto err_suspend_hw;
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu2.c b/drivers/ 
>> media/platform/qcom/iris/iris_vpu2.c
>> index 
>> 9c103a2e4e4eafee101a8a9b168fdc8ca76e277d..01ef40f3895743b3784464e2d5ba2de1aeca5a4a 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu2.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu2.c
>> @@ -44,4 +44,5 @@ const struct vpu_ops iris_vpu2_ops = {
>>       .power_off_controller = iris_vpu_power_off_controller,
>>       .power_on_controller = iris_vpu_power_on_controller,
>>       .calc_freq = iris_vpu2_calc_freq,
>> +    .set_hwmode = iris_vpu_set_hwmode,
>>   };
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/ 
>> media/platform/qcom/iris/iris_vpu3x.c
>> index 
>> fe4423b951b1e9e31d06dffc69d18071cc985731..3dad47be78b58f6cd5ed6f333b3376571a04dbf0 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
>> @@ -234,14 +234,8 @@ static int iris_vpu35_power_on_hw(struct 
>> iris_core *core)
>>       if (ret)
>>           goto err_disable_hw_free_clk;
>>
>> -    ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl- 
>> >pd_devs[IRIS_HW_POWER_DOMAIN], true);
>> -    if (ret)
>> -        goto err_disable_hw_clk;
>> -
>>       return 0;
>>
>> -err_disable_hw_clk:
>> -    iris_disable_unprepare_clock(core, IRIS_HW_CLK);
>>   err_disable_hw_free_clk:
>>       iris_disable_unprepare_clock(core, IRIS_HW_FREERUN_CLK);
>>   err_disable_axi_clk:
>> @@ -266,6 +260,7 @@ const struct vpu_ops iris_vpu3_ops = {
>>       .power_off_controller = iris_vpu_power_off_controller,
>>       .power_on_controller = iris_vpu_power_on_controller,
>>       .calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
>> +    .set_hwmode = iris_vpu_set_hwmode,
>>   };
>>
>>   const struct vpu_ops iris_vpu33_ops = {
>> @@ -274,6 +269,7 @@ const struct vpu_ops iris_vpu33_ops = {
>>       .power_off_controller = iris_vpu33_power_off_controller,
>>       .power_on_controller = iris_vpu_power_on_controller,
>>       .calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
>> +    .set_hwmode = iris_vpu_set_hwmode,
>>   };
>>
>>   const struct vpu_ops iris_vpu35_ops = {
>> @@ -283,4 +279,5 @@ const struct vpu_ops iris_vpu35_ops = {
>>       .power_on_controller = iris_vpu35_vpu4x_power_on_controller,
>>       .program_bootup_registers = 
>> iris_vpu35_vpu4x_program_bootup_registers,
>>       .calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
>> +    .set_hwmode = iris_vpu_set_hwmode,
>>   };
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu4x.c b/drivers/ 
>> media/platform/qcom/iris/iris_vpu4x.c
>> index 
>> a8db02ce5c5ec583c4027166b34ce51d3d683b4e..02e100a4045fced33d7a3545b632cc5f0955233f 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu4x.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu4x.c
>> @@ -252,21 +252,10 @@ static int iris_vpu4x_power_on_hardware(struct 
>> iris_core *core)
>>           ret = iris_vpu4x_power_on_apv(core);
>>           if (ret)
>>               goto disable_hw_clocks;
>> -
>> -        iris_vpu4x_ahb_sync_reset_apv(core);
>>       }
>>
>> -    iris_vpu4x_ahb_sync_reset_hardware(core);
>> -
>> -    ret = iris_vpu4x_genpd_set_hwmode(core, true, efuse_value);
>> -    if (ret)
>> -        goto disable_apv_power_domain;
>> -
>>       return 0;
>>
>> -disable_apv_power_domain:
>> -    if (!(efuse_value & DISABLE_VIDEO_APV_BIT))
>> -        iris_vpu4x_power_off_apv(core);
>>   disable_hw_clocks:
>>       iris_vpu4x_disable_hardware_clocks(core, efuse_value);
>>   disable_vpp1_power_domain:
>> @@ -359,6 +348,18 @@ static void iris_vpu4x_power_off_hardware(struct 
>> iris_core *core)
>>       iris_disable_power_domains(core, core->pmdomain_tbl- 
>> >pd_devs[IRIS_HW_POWER_DOMAIN]);
>>   }
>>
>> +static int iris_vpu4x_set_hwmode(struct iris_core *core)
>> +{
>> +    u32 efuse_value = readl(core->reg_base + WRAPPER_EFUSE_MONITOR);
>> +
>> +    if (!(efuse_value & DISABLE_VIDEO_APV_BIT))
>> +        iris_vpu4x_ahb_sync_reset_apv(core);
>> +
>> +    iris_vpu4x_ahb_sync_reset_hardware(core);
>> +
>> +    return iris_vpu4x_genpd_set_hwmode(core, true, efuse_value);
> I'd like to see something in the commit log about the efuse value. What 
> is it, why does it appear etc.
> 
> Because just to be difficult you are not doing a 1:1 switch to hw_mode 
> here, you're also introducing contingent logic.
> 

The reset was added _only_ on vpu4 switching to hw mode as there is an 
issue of register corruption if ahb reset is not performed before mode 
switch. Hence reset is made explicitly part of hw mode switch.
Its there in earlier code "iris_vpu4x_power_on_hardware" as well, while 
this patch is shifting the code to a vpu specific hw mode api.

fuse check is only to differentiate between apv and others, since apv 
reset sequence is different than others.

I can add these info in commit.

Regards,
Vikash

