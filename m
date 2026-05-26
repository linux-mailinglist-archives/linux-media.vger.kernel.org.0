Return-Path: <linux-media+bounces-62781-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHZYAq+DFWoSWQcAu9opvQ
	(envelope-from <linux-media+bounces-62781-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 13:27:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC2A5D4DC2
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 13:27:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 07F0F304ED6C
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 11:22:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A251D3E0235;
	Tue, 26 May 2026 11:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jabu0NMZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jU8T4/ws"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FED3E0738
	for <linux-media@vger.kernel.org>; Tue, 26 May 2026 11:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779794528; cv=none; b=VRwOAPO4Ngnd2sIN42khpVs4FBe5r4DdtrKp7OyECYyQ1AQ+ne2EfwxVm/FeD2MJcrAd2YdlG+wnAQJErxR4enz/3H/Qq27UMLnyJ28wyDXyAleRDSVsFf/7cQwe160ambhpm3k8JmLQ023LBCnmWnud30esu5gX1HYUyH+JJvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779794528; c=relaxed/simple;
	bh=/yncQd0Zxa9MLAxggJJqjRbvynz4dgJeU0MwQFRRgFU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=gWGh3q44G6qOx/1SGdEkJvofamIUFjAnZ7bfCTyW8RyFN59MvMWMsa1lyOCKcLoN9nWH9F02KfzIDVvOurS1mf5/cVdhfBdwIU0jiVSqnWncZ5zvtIlLsMZDYoKN5iXcx0wEDwtn82mP7pNz64eQRwqWPJ+XYOj9dzHmNDulhRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jabu0NMZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jU8T4/ws; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q96Rga3658071
	for <linux-media@vger.kernel.org>; Tue, 26 May 2026 11:22:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GWbWB92mAfm/LTqQavnqSGY4yqIRpAm3OrnreoW4Vi8=; b=jabu0NMZ+jzinQ7I
	5LihflWkF84CDpwdIY6vJOr5M4kPRlHP7f1lO5qbXX6qX1kM4lncicddI49dhxVy
	bAKdit1sWHIeBP9RypXHZ7uo+nXDF99C6bGBDABxvW+jn1M9jRdBrQhHRlvPJb+S
	w2w0y5bGPXrEsdPS38KAP0t0CWzaETGrad4+BT4fZ2fL/8kdN4Nf/+TRUIAYGaUh
	2uf/uQsdSpg7qdz1mRQ5lXQVgA0lvHgVkSkjzMdzpLI5nM1K5dTB9bQCjXeqxqkx
	hnG8Dm8z/Fjrp/6uxk7GthG4XVeSHcSWzgreDyL2oUCgKuleWXgy20vIwzmbPWm9
	qVRw+w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecqynbhw7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 26 May 2026 11:22:04 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ba115ab6bbso114400225ad.3
        for <linux-media@vger.kernel.org>; Tue, 26 May 2026 04:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779794524; x=1780399324; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GWbWB92mAfm/LTqQavnqSGY4yqIRpAm3OrnreoW4Vi8=;
        b=jU8T4/wsu1LTO72SFsWqQXZ9YZw4gvNWa3suIEnaXSM50Bk8Q+zXbBl75UKcShE0zH
         tvVHVeCHYgx2LtlaTlAW3jKm4MoYy7NexZl0HSLfavjhGX10w7qR5mH36+OxgdbJXwJe
         gklfdwB+xWuGZeI9zWJl4iPMPxyChQp4BSrqIn+WSnDphqf4unzjA8llqj9MRo5jTx6X
         QomgfTJzQ0zvSzkRh5OLmrOzMZ2bAuOxEI/Ik+3qV9CGi9qaJ4xn1hYPH5FzcrRIaYV7
         vVpFVPldVnrSRq5o/C17SWszVA+126QfgZ3qlEABhPdDPoeyeApXLAhS8w9oznYJRgHX
         GbOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779794524; x=1780399324;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GWbWB92mAfm/LTqQavnqSGY4yqIRpAm3OrnreoW4Vi8=;
        b=TcjuX/rRNIWk64m+kqcH31dqU7e++uJ1N4jbG0L+QFM18Fqrzx7pvNlV3+7D193ESh
         UMbDZQuPG8FoLhKy49ApLLBcMHJgxwdL/8GaVcB5Ew3e4W4Vof2IS+6nisK3623pXAj9
         jxvMfyClruA7wcPXEU0uJhfuQWqMQyZTOfdCNn+L8rTbia0AylOYA5dpqDOBjaXGNn9U
         JtTdy8Ga4RKh7BjUEkehLUqxFmxYEo3Puldq8odcXMUWuEZUVrfLwtg72o/B0hJZtnmK
         BaHtr4r80tydJ/6o2vBXjM5VCZRP/lRH814ZLww3OwUbQlDJ3jEYwf5DxjhzLf0clqC4
         /cbw==
X-Forwarded-Encrypted: i=1; AFNElJ85PlDeicgLcn7OAtJTqpOwCv/26Dk2Qozh+OxX2wOlRTdWEBX2mCZ18tuV1S+MWZe6flcZtULBKwUqIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqubKyTH8GSDnbMIE7wytrd7alOkOOu+XpizW7VyS1dmfhZNPj
	ssbFrhIDSSoMsacWUNH22Fj6syGPHRt9TJTRewcU8qQp55VYp7kB3CSpKDV85R2EBve1QkDsP35
	XG8WRMf1V5CmqQ9pKIZIQbpOSnqjB04PBnMf+5JW8MfV3tkM2LVnQkYI7EhwuZ6eY6g==
X-Gm-Gg: Acq92OGDaIVODxcYX7Hxxn98emYUDHNBIZo+CFURM+8Ro7NC2BgiDok8+O1HpQ6aLjY
	yesIyO/kLwuzLkIVt1CxXx7edS9gmekXVugzmpNlG54CC7JhalfBvFHFJZmmR5AA+UqrY8l1iXM
	hcy/wn3fzz/t0jgu176ugoz4lzmBKi42FKEuJ6aoqyYc9Tl4WTlwNrhCPI8qxgHWAdbzPLmq4oF
	AH5a9A2ljA/O0CCpIJvnxRC0zoAevvZy7/6QCAuNnIIQjPctlz52YodtUxncCx+ui60WYaaco2U
	L5+A/0FLPM2lGzoQWv7t/OvhNe0IW7K8TYBwqxrokm+05bSMd0Wl7rCLtDogr2O7jZQZ6oR1z4v
	EmuO2v5wps0t+ysdeyxmCJDFfDhOiM5/0nUF5Evrg+HVUW1zYYK+tmg==
X-Received: by 2002:a17:903:f8b:b0:2b2:5503:1b8c with SMTP id d9443c01a7336-2beb06c4f36mr191751875ad.11.1779794523809;
        Tue, 26 May 2026 04:22:03 -0700 (PDT)
X-Received: by 2002:a17:903:f8b:b0:2b2:5503:1b8c with SMTP id d9443c01a7336-2beb06c4f36mr191751495ad.11.1779794523240;
        Tue, 26 May 2026 04:22:03 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56b5886sm109627245ad.20.2026.05.26.04.21.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 04:22:02 -0700 (PDT)
Message-ID: <c05c27ff-033a-6b38-5d51-a712d8a515f4@oss.qualcomm.com>
Date: Tue, 26 May 2026 16:51:54 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v6 10/14] media: iris: Add power sequence for Glymur
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
References: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
 <20260515-glymur-v6-10-f6a99cb43a24@oss.qualcomm.com>
 <u4twzqwgu75ermwdi5miw7r4gkjw4iaok35jcm6o4ecgpst4rz@a63dq3cihmes>
Content-Language: en-US
In-Reply-To: <u4twzqwgu75ermwdi5miw7r4gkjw4iaok35jcm6o4ecgpst4rz@a63dq3cihmes>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Wpwb99fv c=1 sm=1 tr=0 ts=6a15825c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Ewolc4YIVSBHiCPDOKEA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: m3VFWOAVnXwVCUKgMEswvActnhCYUukP
X-Proofpoint-ORIG-GUID: m3VFWOAVnXwVCUKgMEswvActnhCYUukP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA5OSBTYWx0ZWRfX7L/+FssdFx1A
 +c97GOgUX8sIlKLCYsUAVXsJ/0EiHuKcEGqxuPA/6Sgb3nZcwkrYtszOC72hnYd4iPI3xf89Ajf
 OxuA2J7MNBqiKFNkMHMy1Jp3WYq0/HcgB88icmn4tUuM6cDMzi4+P2QWfx5IZXzhl+Jh3LZOeSV
 RcY91xBhd0dK8YOr/uZJ1Vr6e/cy+COpBEHM0O6Ttx+EqvElFWjbWu495Vwfkf9IYqYF0eiw+LJ
 C84zOM6o55E3PSyAeAL0Oa6oXB4FKiffGpb0Vbrbo8r0VMuEVMsMG/EC7v8Al1TyfIWxst4F8xG
 mIf+WyYV2xKB1xvNsjD9MuOMfIa5zQpyMS/9yOfuK2QydTHDdiMZs/YchSNS4XOyvM1FN86XBCZ
 CvMSaeavaQWespRYN8qV5ocSQnOaV305fvyMe8hD/bXrQ4i1Q7t5up9ToHjEUD+Dbcj02h8pwFR
 TCmpQ6v4Ln5gTPISW9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260099
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,linaro.org,gmail.com,vger.kernel.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62781-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6CC2A5D4DC2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 5/17/2026 11:39 PM, Dmitry Baryshkov wrote:
> On Fri, May 15, 2026 at 04:51:25PM +0530, Vishnu Reddy wrote:
>> The Glymur platform has two video codec cores: vcodec0 and vcodec1.
>>
>> Both cores share a common clock source (video_cc_mvs0_clk_src) and the
>> same power rails. The clock dividers between the source and the branch
>> clocks are fixed. So when both cores are running, the source clock always
>> runs at the highest frequency requested by either core.
>>
>> Since both cores share the same power rails, the power corner cannot be
>> voted independently. Scaling one core's power corner up or down would
>> directly affect the other, leading to under or over-voting.
>>
>> For these reasons, both cores should voted the clock and power rail must
>> be based on the workload of both cores.
>>
>> Reuse the existing code wherever possible and add power sequence for
>> vcodec1.
>>
>> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> ---
>>  .../platform/qcom/iris/iris_platform_common.h      |   4 +
>>  drivers/media/platform/qcom/iris/iris_vpu3x.c      | 137 ++++++++++++++++++++-
>>  drivers/media/platform/qcom/iris/iris_vpu_common.h |   1 +
>>  .../platform/qcom/iris/iris_vpu_register_defines.h |  10 ++
>>  4 files changed, 147 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> index 1d757cb8e9e1..366e499dec53 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> @@ -63,6 +63,9 @@ enum platform_clk_type {
>>  	IRIS_VCODEC_VPP0_CLK,
>>  	IRIS_VCODEC_VPP1_CLK,
>>  	IRIS_APV_HW_CLK,
>> +	IRIS_AXI_VCODEC1_CLK,
>> +	IRIS_VCODEC1_CLK,
>> +	IRIS_VCODEC1_FREERUN_CLK,
>>  };
>>  
>>  struct platform_clk_data {
>> @@ -208,6 +211,7 @@ enum platform_pm_domain_type {
>>  	IRIS_VCODEC_VPP0_POWER_DOMAIN,
>>  	IRIS_VCODEC_VPP1_POWER_DOMAIN,
>>  	IRIS_APV_HW_POWER_DOMAIN,
>> +	IRIS_VCODEC1_POWER_DOMAIN,
>>  };
>>  
>>  struct iris_firmware_data {
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
>> index 39e9c78c3a69..68a4997af23f 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
>> @@ -17,14 +17,14 @@
>>  #define NOC_HALT				BIT(0)
>>  #define AON_WRAPPER_SPARE			(AON_BASE_OFFS + 0x28)
>>  
>> -static bool iris_vpu3x_hw_power_collapsed(struct iris_core *core)
>> +static bool iris_vpu3x_hw_power_collapsed(struct iris_core *core, u32 pwr_status_bit)
>>  {
>>  	u32 value, pwr_status;
>>  
>>  	value = readl(core->reg_base + WRAPPER_CORE_POWER_STATUS);
>> -	pwr_status = value & BIT(1);
>> +	pwr_status = value & pwr_status_bit;
>>  
>> -	return pwr_status ? false : true;
>> +	return !pwr_status;
>>  }
>>  
>>  static void iris_vpu3_power_off_hardware(struct iris_core *core)
>> @@ -32,7 +32,7 @@ static void iris_vpu3_power_off_hardware(struct iris_core *core)
>>  	u32 reg_val = 0, value, i;
>>  	int ret;
>>  
>> -	if (iris_vpu3x_hw_power_collapsed(core))
>> +	if (iris_vpu3x_hw_power_collapsed(core, VCODEC0_POWER_STATUS))
>>  		goto disable_power;
>>  
>>  	dev_err(core->dev, "video hw is power on\n");
>> @@ -78,7 +78,7 @@ static void iris_vpu33_power_off_hardware(struct iris_core *core)
>>  	u32 count = 0;
>>  	int ret;
>>  
>> -	if (iris_vpu3x_hw_power_collapsed(core))
>> +	if (iris_vpu3x_hw_power_collapsed(core, VCODEC0_POWER_STATUS))
>>  		goto disable_power;
>>  
>>  	dev_err(core->dev, "video hw is power on\n");
>> @@ -254,6 +254,124 @@ static void iris_vpu35_power_off_hw(struct iris_core *core)
>>  	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC_CLK);
>>  }
>>  
>> +static int iris_vpu36_power_on_hw1(struct iris_core *core)
>> +{
>> +	int ret;
>> +
>> +	ret = iris_enable_power_domains(core, IRIS_VCODEC1_POWER_DOMAIN);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = iris_prepare_enable_clock(core, IRIS_AXI_VCODEC1_CLK);
>> +	if (ret)
>> +		goto err_disable_hw1_power;
>> +
>> +	ret = iris_prepare_enable_clock(core, IRIS_VCODEC1_FREERUN_CLK);
>> +	if (ret)
>> +		goto err_disable_axi1_clk;
>> +
>> +	ret = iris_prepare_enable_clock(core, IRIS_VCODEC1_CLK);
>> +	if (ret)
>> +		goto err_disable_hw1_free_clk;
> And this is what I'm talking about for the indirection. To bring up the
> vcodec core, you need to enable several power domains and then power on
> several clocks. Here you list them all one by one.
>
> Compare this to:
>
> struct iris_vcodec {
> 	struct device *dev;
> 	struct device* pd;
> 	struct clk_bulk_data *clocks;
> 	unsigned int num_clocks;
> };
>
> int iris_vcodec_power_on(struct iris_core *core, struct iris_vcodec *vc)
> {
> 	int ret;
>
> 	ret = iris_opp_set_rate(vc->dev, ULONG_MAX);
> 	if (ret)
> 		return ret;
>
> 	ret = pm_runtime_get_sync(vc->pd);
> 	if (ret < 0)
> 		return ret;
>
> 	ret = clk_bulk_prepare_enable(vc->num_clocks, vc->clocks);
> 	if (ret)
> 		pm_runtime_put_sync(vc->pd);
>
> 	return ret;
> }
>
> This is the generic code, handling vcodec enablement on any platform,
> including Glymur. Most platforms will have one vcodec instance, Glymur
> will have two (or it can be an array of those). The only difference
> would be in the platform code, filling the fields of that structure.

Thanks for the suggestion, I'll work on this and post the updated changes in
the next revision.

>> +
>> +	return 0;
>> +
>> +err_disable_hw1_free_clk:
>> +	iris_disable_unprepare_clock(core, IRIS_VCODEC1_FREERUN_CLK);
>> +err_disable_axi1_clk:
>> +	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC1_CLK);
>> +err_disable_hw1_power:
>> +	iris_disable_power_domains(core, IRIS_VCODEC1_POWER_DOMAIN);
>> +
>> +	return ret;
>> +}
>> +
>> +static int iris_vpu36_power_on_hw(struct iris_core *core)
>> +{
>> +	int ret;
>> +
>> +	ret = iris_vpu35_power_on_hw(core);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = iris_vpu36_power_on_hw1(core);
>> +	if (ret)
>> +		goto err_power_off_hw;
> static int iris_vpu_power_on_vcodecs(struct iris_core *core)
> {
> 	int i, ret;
>
> 	for (i = 0; i < core->num_vcodec; i++) {
> 		ret = iris_vcodec_power_on(core, core->vc[i]);
> 		if (ret)
> 			goto err;
> 	}
>
> 	return 0;
>
> err:
> 	for (; i >= 0; i--)
> 		iris_vcodec_power_off(core, core->vc[i]);
>
> 	return ret;
> }
>
> Similar abstraction for powering on the whole core, calling
> iris_vpu_power_on_vcodecs() inside.
>
>
>> +
>> +	return 0;
>> +
>> +err_power_off_hw:
>> +	iris_vpu35_power_off_hw(core);
>> +
>> +	return ret;
>> +}
>> +
>> +static void iris_vpu36_power_off_hw1(struct iris_core *core)
>> +{
>> +	u32 value, i;
>> +	int ret;
>> +
>> +	if (iris_vpu3x_hw_power_collapsed(core, VCODEC1_POWER_STATUS))
>> +		goto disable_power;
>> +
>> +	value = readl(core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
>> +	if (value)
>> +		writel(CORE_CLK_RUN, core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
>> +
>> +	for (i = 0; i < core->iris_platform_data->num_vpp_pipe; i++) {
>> +		ret = readl_poll_timeout(core->reg_base + VCODEC1_SS_IDLE_STATUSN + 4 * i,
>> +					 value, value & DMA_NOC_IDLE, 2000, 20000);
>> +		if (ret)
>> +			goto disable_power;
>> +	}
>> +
>> +	writel(REQ_VCODEC1_POWER_DOWN_PREP, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
>> +	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS,
>> +				 value, value & NOC_LPI_VCODEC1_STATUS_DONE, 2000, 20000);
>> +	if (ret)
>> +		goto disable_power;
>> +
>> +	writel(0, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
>> +
>> +	writel(VCODEC1_BRIDGE_SW_RESET | VCODEC1_BRIDGE_HW_RESET_DISABLE, core->reg_base +
>> +	       CPU_CS_AHB_BRIDGE_SYNC_RESET);
>> +	writel(VCODEC1_BRIDGE_HW_RESET_DISABLE, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
>> +	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
>> +
>> +disable_power:
>> +	iris_genpd_set_hwmode(core, IRIS_VCODEC1_POWER_DOMAIN, false);
>> +	iris_disable_unprepare_clock(core, IRIS_VCODEC1_CLK);
>> +	iris_disable_unprepare_clock(core, IRIS_VCODEC1_FREERUN_CLK);
>> +	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC1_CLK);
>> +	iris_disable_power_domains(core, IRIS_VCODEC1_POWER_DOMAIN);
>> +}
>> +
>> +static void iris_vpu36_power_off_hw(struct iris_core *core)
>> +{
>> +	iris_vpu35_power_off_hw(core);
>> +	iris_vpu36_power_off_hw1(core);
>> +}
>> +
>> +static int iris_vpu36_set_hwmode(struct iris_core *core)
>> +{
>> +	int ret;
>> +
>> +	ret = iris_genpd_set_hwmode(core, IRIS_VCODEC_POWER_DOMAIN, true);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = iris_genpd_set_hwmode(core, IRIS_VCODEC1_POWER_DOMAIN, true);
>> +	if (ret)
>> +		goto error_disable_vcodec_hwmode;
>> +
>> +	return 0;
>> +
>> +error_disable_vcodec_hwmode:
>> +	iris_genpd_set_hwmode(core, IRIS_VCODEC_POWER_DOMAIN, false);
>> +
>> +	return ret;
>> +}
>> +
>>  const struct vpu_ops iris_vpu3_ops = {
>>  	.power_off_hw = iris_vpu3_power_off_hardware,
>>  	.power_on_hw = iris_vpu_power_on_hw,
>> @@ -281,3 +399,12 @@ const struct vpu_ops iris_vpu35_ops = {
>>  	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
>>  	.set_hwmode = iris_vpu_set_hwmode,
>>  };
>> +
>> +const struct vpu_ops iris_vpu36_ops = {
>> +	.power_off_hw = iris_vpu36_power_off_hw,
>> +	.power_on_hw = iris_vpu36_power_on_hw,
>> +	.power_off_controller = iris_vpu35_vpu4x_power_off_controller,
>> +	.power_on_controller = iris_vpu35_vpu4x_power_on_controller,
>> +	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
>> +	.set_hwmode = iris_vpu36_set_hwmode,
>> +};
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
>> index 09799a375c14..63bf0cec58e2 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
>> @@ -12,6 +12,7 @@ extern const struct vpu_ops iris_vpu2_ops;
>>  extern const struct vpu_ops iris_vpu3_ops;
>>  extern const struct vpu_ops iris_vpu33_ops;
>>  extern const struct vpu_ops iris_vpu35_ops;
>> +extern const struct vpu_ops iris_vpu36_ops;
>>  extern const struct vpu_ops iris_vpu4x_ops;
>>  
>>  struct vpu_ops {
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
>> index 72168b9ffa73..e67d98b8c91e 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
>> @@ -7,6 +7,7 @@
>>  #define __IRIS_VPU_REGISTER_DEFINES_H__
>>  
>>  #define VCODEC_BASE_OFFS			0x00000000
>> +#define VCODEC1_BASE_OFFS			0x00040000
>>  #define AON_MVP_NOC_RESET			0x0001F000
>>  #define CPU_BASE_OFFS				0x000A0000
>>  #define WRAPPER_BASE_OFFS			0x000B0000
>> @@ -14,6 +15,8 @@
>>  #define AON_BASE_OFFS				0x000E0000
>>  
>>  #define VCODEC_SS_IDLE_STATUSN			(VCODEC_BASE_OFFS + 0x70)
>> +#define VCODEC1_SS_IDLE_STATUSN			(VCODEC1_BASE_OFFS + 0x70)
>> +#define DMA_NOC_IDLE				BIT(22)
>>  
>>  #define AON_WRAPPER_MVP_NOC_RESET_REQ		(AON_MVP_NOC_RESET + 0x000)
>>  #define VIDEO_NOC_RESET_REQ			(BIT(0) | BIT(1))
>> @@ -35,6 +38,8 @@
>>  #define CPU_CS_AHB_BRIDGE_SYNC_RESET		(CPU_CS_BASE_OFFS + 0x160)
>>  #define CORE_BRIDGE_SW_RESET			BIT(0)
>>  #define CORE_BRIDGE_HW_RESET_DISABLE		BIT(1)
>> +#define VCODEC1_BRIDGE_SW_RESET			BIT(2)
>> +#define VCODEC1_BRIDGE_HW_RESET_DISABLE		BIT(3)
>>  
>>  #define CPU_CS_X2RPMH				(CPU_CS_BASE_OFFS + 0x168)
>>  #define MSK_SIGNAL_FROM_TENSILICA		BIT(0)
>> @@ -52,14 +57,19 @@
>>  #define WRAPPER_DEBUG_BRIDGE_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x58)
>>  #define WRAPPER_IRIS_CPU_NOC_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x5C)
>>  #define REQ_POWER_DOWN_PREP			BIT(0)
>> +#define REQ_VCODEC1_POWER_DOWN_PREP		BIT(1)
>>  
>>  #define WRAPPER_IRIS_CPU_NOC_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x60)
>>  #define NOC_LPI_STATUS_DONE			BIT(0) /* Indicates the NOC handshake is complete */
>>  #define NOC_LPI_STATUS_DENY			BIT(1) /* Indicates the NOC handshake is denied */
>>  #define NOC_LPI_STATUS_ACTIVE			BIT(2) /* Indicates the NOC is active */
>> +#define NOC_LPI_VCODEC1_STATUS_DONE		BIT(8)
>>  
>>  #define WRAPPER_IRIS_VCODEC_VPU_WRAPPER_SPARE_0	(WRAPPER_BASE_OFFS + 0x78)
>>  #define WRAPPER_CORE_POWER_STATUS		(WRAPPER_BASE_OFFS + 0x80)
>> +#define VCODEC0_POWER_STATUS			BIT(1)
>> +#define VCODEC1_POWER_STATUS			BIT(4)
>> +
>>  #define WRAPPER_CORE_CLOCK_CONFIG		(WRAPPER_BASE_OFFS + 0x88)
>>  #define CORE_CLK_RUN				0x0
>>  
>>
>> -- 
>> 2.34.1
>>

