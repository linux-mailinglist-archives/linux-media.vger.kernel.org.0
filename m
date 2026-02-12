Return-Path: <linux-media+bounces-52658-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHqXOyfQjWnw7QAAu9opvQ
	(envelope-from <linux-media+bounces-52658-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 14:05:44 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9401412DB74
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 14:05:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9FD73307C4A4
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 13:05:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91A3335B64B;
	Thu, 12 Feb 2026 13:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Phn6Ul8b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dy9EEjH1"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FA9191F84
	for <linux-media@vger.kernel.org>; Thu, 12 Feb 2026 13:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770901528; cv=none; b=b2bKtrPX5tf2Qs2i71bh2zAOQG2vo0NmCpCDrxfKs+Vutms5o7QIy1UWT8uO0nhaMnwwLysb+y6s9z5XTqfiarWDCzB7URmJlLHMxNAL2sSqAfQfGhOuPC2jmrlw+d7ebeBh3ayLT/rWONtP5SZpZZax1Du/+QAjYWk+wEjqew4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770901528; c=relaxed/simple;
	bh=a3G5yws0G5Q5A5x8eF4TVEDtnRBjeCcYcF9sRVwvv18=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F99fekrtsn7gMGzxVRlP0VVckfFyePtCbbeaqTmFs+DrUuYJNyjegkfmjd0Gq1XrXNxWHHjIAPl5iL1pqWehSuvxSv0reUW4jRHBmHQy4FSVaPRbeRp6c3u3zjohMyzrRrF3FReQ4Evw9mrA/uMnrvtc/7S0xoTgfoNCOwcDbJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Phn6Ul8b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dy9EEjH1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CAIHp3657753
	for <linux-media@vger.kernel.org>; Thu, 12 Feb 2026 13:05:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gh6NSeWutFEmj42OJ5qvtSwCS60I9Bqn+t9+J1s015c=; b=Phn6Ul8bVUtPv4Nv
	9RqNjn4T9oNv1NcrnqMn2fSlDGqa+TpkdeBLPow4gycDHrZZyN7fyLzk63XFT767
	L5Tc1F3lza2R4c9CeEjBtsUl8r21gIbzos627I4s6FNAQCbgii5JEHDU3Pgt31lb
	pLqTM+hSZHdZ0ktWs8Aq9zznzLsGnsE6/7dUTI1nyJXUI2NQ8EMldiX9B0491Us3
	lraFb4PDKBr2rRKQoCHiB3qXoE1DYGUaWYh/pAQJpA6tNn6Y4qrvfSkRWWWneWsX
	t6PzjD6Vu8NxOhNjKkkyA/XajGuWVyUXppxyp3+Nb0VGBrsxPfC7kOeJwoIj0sfk
	lu+NIA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9d09gfwe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 12 Feb 2026 13:05:25 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a75ed2f89dso70694195ad.1
        for <linux-media@vger.kernel.org>; Thu, 12 Feb 2026 05:05:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770901525; x=1771506325; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gh6NSeWutFEmj42OJ5qvtSwCS60I9Bqn+t9+J1s015c=;
        b=dy9EEjH1lW1bad1quOSk7q2yVZg9LYIIlYxk2XF4wKeS4KjfMRRpmWIqdcGKhaLcqh
         rPZLV/pBaKDW6Ts07rV56h2iHl/g6R6h7CiicCpzmb2t0XkCSWBwO08a+T89gutPEDYx
         YmosqTcLifdLtuXF0RQgDs9CRCONUAuZ709oYGa8ZRSf9tXW6LeTRl46WWhDaZgtLZaP
         W+RZ4xayTSPC9Eaa2xbjSl3i3G8dYPUlvtPHGQ9Zure8RfYeuG5/m+2vorz1CIkQcbIt
         oPFccqLO35Yx1CbDJp4adyFaOi2fwiGNI0poGT4A4VuVKH6SJBC4egdk7Ob+40UFCPYe
         HPCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770901525; x=1771506325;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gh6NSeWutFEmj42OJ5qvtSwCS60I9Bqn+t9+J1s015c=;
        b=tvPLlSncYhVIe4rNrENSp9QPqX0xDp4vgr8iBY4R+d3tckKX7FRkfJRn7XIjQuXvtj
         sngH1dhgpE0ao4duPvRbxWWhAmDV3knSDYOQYwksUqw7V1DknGJRjoDIAITttXqwXMWC
         0pIQvP88x0ipr7o9VgtlVpWK8ClzJAKHKWFJnhgbcANAD20V2wWmZGtJrxE/Rysw1G3v
         vHDmOQsEOXJq0QrDqfQURJl/WnVQpw15Wjt/mKMLkFug0fEorPBOsrAF4ElfiG39aF9w
         UVX2d9K3fSkydK7czqHfKM75LR+tc6W/4vF/pdbEtT4e3bNCPLhMoq7qTi5H7zK8E9Bh
         AYJQ==
X-Forwarded-Encrypted: i=1; AJvYcCU87mfZ+jvEF+Lc32YlRcjRAC3LTXaJt785DIqa6M/BvGICRZhLa4U7TqGAGeAGwIpxwjLkzCXEz6TMjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmWIfS4UNVi56FGXpA/op2tyhOdaT0t1FFjEgU2lhn/L5SG1UH
	V/AstpjW3kr5zZ/sGnHT2uGVRIgXwpF1gmv5iSBqhY+oIndWxqG15pAdCDSkubf5GUHh9HqLW80
	8mu1woUnyGCGEuY4NcGxXnfrwNb6uu6E/2yC09i57HcXhYEEfe9nuP2Lu+uTm+K8NLw==
X-Gm-Gg: AZuq6aJ7ebl1jYtlM7R/49QNyuX9FJDjzad1Mp98uSQW/XFx6xODzPfMuKZyw1gKkX4
	pD9PUC0zR2vG015OlnDV1HqJcXoo/E5qHp8hTApnL1ZCfQiMIxliliME0JakjotdO1R4ecndceJ
	TFFTZh87k7c1z+I8WlDPuPn4XAYv/118ESBzesm4qmQZS51x1lN0I2HU3vQL9NX697xEHxqwvwH
	iXdhXVo2oGdqgYaSMIRGV2656nR+mGV90W3Fcd25C//Ot6tFNtx67vp5Pq/zHWFg9Ifo2Xn0n7a
	zvdZB1c+dtNIUx4dzZXiMW1AA++E+vyXwTuC1L8oZpToOWsjUE8F5F27eMPhWghMuVaKR/N2C1q
	D8FyY8oXDIemq1Ap0Flzdu9ccTB3Z1EwHpvDjkzvJHLiDqNNCBgJC8Q==
X-Received: by 2002:a17:903:3204:b0:2aa:ecec:a43d with SMTP id d9443c01a7336-2ab399a6779mr28425255ad.21.1770901524654;
        Thu, 12 Feb 2026 05:05:24 -0800 (PST)
X-Received: by 2002:a17:903:3204:b0:2aa:ecec:a43d with SMTP id d9443c01a7336-2ab399a6779mr28424825ad.21.1770901524119;
        Thu, 12 Feb 2026 05:05:24 -0800 (PST)
Received: from [10.0.0.3] ([106.222.229.190])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ab2997b6d0sm53628715ad.73.2026.02.12.05.05.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 05:05:23 -0800 (PST)
Message-ID: <b759fb04-22b7-cd5c-9e53-f4ffe9f37dc5@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 18:35:19 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 2/2] media: iris: Enable Gen2 HFI on SC7280
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260209-iris_sc7280_gen2_support-v1-0-390000a4fa39@oss.qualcomm.com>
 <20260209-iris_sc7280_gen2_support-v1-2-390000a4fa39@oss.qualcomm.com>
 <0da582a6-5bba-4450-99ec-cf57b67915e6@oss.qualcomm.com>
 <0a324898-092b-3e44-c35c-15de20b50f40@oss.qualcomm.com>
 <2uih6xdzarkwnvhlhv5kznmdwo4jorqvsrb7xxrxgr6vprx3ey@4kx45k5i3c4y>
 <6b9042c8-767e-0fdb-9012-f3790899509e@oss.qualcomm.com>
 <f9f40ac7-e6fe-41eb-92e4-311913567ef0@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <f9f40ac7-e6fe-41eb-92e4-311913567ef0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDA5NyBTYWx0ZWRfX4tHg1bEsyN1P
 dJHsN7O9iABngW0b/FjQAICsSP4fhILGa9s5gNrYkApTTxzCLId77Zhf8iG89ZNP5MkEqKc+VWv
 pMjcmTXVRyiQ9O482WGWARLPaksHNt/lG1RIdN1njNllqkT0FWWedLUYW0Ysb7Od+B7u9QxwJ58
 oJf9t8Ugo+mAcoqPDVVGkJynrsG5gM4r3CZBHqiHZqquyc+oNT3IhdbGVA8HBmRSmfUfjmsyLaM
 +cYo7iFSzcww6IXO0PIM1z/QOjE/wj3VoTvqS6nvZgRhWH0Od6sO1wdt9ctkBHC2YSbd2c8cWbJ
 3T2omDRnppJkOTiu1UzH+gaQTgMVVPT+eKTsTHuxy9EF7cjAAo9JD+IreEvME3g0sn27M5470tT
 72V5XM5NKB1GgaylAN6uNSbOvB6J4xSxyjiqj606ZnEmYmfOHIy5AY6JkAwyhRr7f4UQN0b98Z5
 dgsaXA0zYd+rOyt80uA==
X-Proofpoint-GUID: QQzOpmcZXOHNJ2_A5ZgOk331tSmByn8g
X-Authority-Analysis: v=2.4 cv=Y6j1cxeN c=1 sm=1 tr=0 ts=698dd015 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=VDDfqcjMpRzOalc4LhIaOQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=zkfBPpEoM8Yg5YbrLrkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: QQzOpmcZXOHNJ2_A5ZgOk331tSmByn8g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_04,2026-02-12_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602120097
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-52658-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9401412DB74
X-Rspamd-Action: no action



On 2/12/2026 5:13 PM, Konrad Dybcio wrote:
> On 2/12/26 12:16 PM, Dikshita Agarwal wrote:
>>
>>
>> On 2/9/2026 6:05 PM, Dmitry Baryshkov wrote:
>>> On Mon, Feb 09, 2026 at 05:04:48PM +0530, Dikshita Agarwal wrote:
>>>>
>>>>
>>>> On 2/9/2026 3:32 PM, Konrad Dybcio wrote:
>>>>> On 2/9/26 10:45 AM, Dikshita Agarwal wrote:
>>>>>> SC7280 supports both Gen1 and Gen2 HFI firmware. The driver continues to
>>>>>> use Gen1 by default, but boards that intend to use Gen2 firmware can
>>>>>> opt‑in by specifying a Gen2 image through the Device Tree
>>>>>> 'firmware-name' property.
>>>>>>
>>>>>> Based on this property and the availability of the referenced
>>>>>> firmware binary, the driver selects the appropriate HFI generation and
>>>>>> updates its platform data accordingly. Boards that do not
>>>>>> specify a Gen2 firmware, or where the firmware is not present,
>>>>>> automatically fall back to Gen1.
>>>>>>
>>>>>> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>>>>>> ---
> 
> [...]
> 
>>>> To avoid accidental matches, I can switch to an exact filename match
>>>> instead. That way, only the specific Gen2 image (for example
>>>> "qcom/vpu/vpu20_p1_gen2.mbn") will trigger the Gen2 path, and boards that
>>>
>>> How do you detect that for the OEM-signed firmware, which can have
>>> random name?
>>>
>>>> want to use Gen2 can opt in by naming the firmware accordingly.
>>
>> I Explored on suggested alternative approaches and seeing some limitation
>> with the both of them:
>>
>> 1. Detecting Gen1/Gen2 by scanning the firmware blob (fw->data)
>> It is possible to parse QC_IMAGE_VERSION_STRING from the .mbn and  extract
>> the version string. The issues with this approach :
>>
>> - the version string has no explicit marker that identifies Gen1 vs Gen2.
>>
>> - This prefix is not a formal ABI, and it is not consistent across SoCs.
>> Each SoC family uses different naming patterns in the version string.
>>
>> Example : For SC7280 Gen1 we currently see:
>> QC_IMAGE_VERSION_STRING=video-firmware.1.0-<hash> while SM8250 has
>> QC_IMAGE_VERSION_STRING=VIDEO.VPU.1.0-00119-<>
>>
>> So the driver would need SoC‑specific string‑matching rules, which is hard
>> to maintain if we are looking for a design to address all available SOCs.
> 
> The only SoC with such distinction today is kodiak. So we can simply check:
> 
> if (kodiak && strstr(fw->data, "VIDEO.VPU.1.0.")
> 	hfi = gen2;

Agree, this works for Kodiak. However, Dmitry was also referring to other
SoCs that may support both Gen1 and Gen2, and at the moment there isn’t a
generic way to handle that check.

Also, please note that the Kodiak Gen1 firmware uses the string
video-firmware.1.0, whereas Gen2 uses VIDEO.VPU.3.4.

> 
> 
> Can we agree that VIDEO.VPU.x firmwares are hfigen2? If so, problem also
> solved for <=8450
> 

Nope. that's not true for all, SM8250 uses VIDEO.VPU.1.0 which is gen1.

Thanks,
Dikshita

> Konrad

