Return-Path: <linux-media+bounces-48522-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B44E7CB18A9
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 01:46:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0AC03310D893
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 00:41:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 322F01DEFF5;
	Wed, 10 Dec 2025 00:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lJcYUaNH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YUneziLh"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10ABA1D63E4
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 00:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765327272; cv=none; b=H0bGzrui/ZIpBJufThZTV7YAgg1XgEFwSqzYFJEsulB7vXb7UORY9N3gzk87Kb/Wtu6Fmx/KySYAuAeng2ueIAHKbAAAmyG/EEcLVMdRmvqn1NpfXDKTDZ47BA6HGHKoFswSCjeIaRWvw5N5Nl+2JTf/m/2rG1jL4gYNE7fLJiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765327272; c=relaxed/simple;
	bh=xeqmfOlgG0sEuAL8rXNZb1QB7cLX7cGRP7Z8oixjCd8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l3BF35kuQF0Kz0oxIoE4iTKqotB2hejO3iF1qxd0EPx/KdHqxXy6MNa0ZBFlyhWpKH9j84uKwKLIvSTTq9Dk6lGAwZljvEF18BpoL8MH7dqYy4hB6iha8kIAT1svge9oakk6X6HlS/AvkXz0hsVck6LS6T3hrPOLgP4lP2AJF7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lJcYUaNH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YUneziLh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA0OOPo1438189
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 00:41:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KpHq8e+rzOblWR1Otj2Bnub2ZRaMCmLn7qEYw0+NqfI=; b=lJcYUaNHMpXGV9uJ
	iqSnlbqMOxYZ+uUXpws0jbHRxVme7edc1HiqY71jDbb2fKsgRf3IDWb2Wco572FO
	iQFPc8NqU+dKSJCH3wp3gSAHKIEPHZdpx4+9Yy4q5qGkrpRGOs0VkBtUQ/rr4gcK
	aXjnxwCYvg6BWANbgk+SeTjsAe7ycKJxor/UH68SBRP90vqnZzl73Eif7/2IsjnR
	yB1eI470OW9FNAHhQYBZu0gzblmMQMnkhTHKbFk2Q3pGujNsu1RfTgSSRbCXZLdS
	C15Nc6fHQrpY9hbFbTYRS8Prv8X3yiL9fNEieeTq2hcISC7DqnFQa/JE3Zj0szvv
	/hexfw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axm9ca41w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 00:41:09 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7aa5e7452bcso1886355b3a.3
        for <linux-media@vger.kernel.org>; Tue, 09 Dec 2025 16:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765327269; x=1765932069; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KpHq8e+rzOblWR1Otj2Bnub2ZRaMCmLn7qEYw0+NqfI=;
        b=YUneziLh73lBYsKn4+KwuaPeOMzuwiZLT/1LBrK7scxGD1eUFR4T42O8sclJIiUSNb
         cj4uQ3zd5OZg1CBeVL4e3T5ioePbwbY0c/4/qzK2iyJrwoh6LgbRmMEyh4gqDWY9QA80
         /6JaPShy2S/dHOBx3kWQ03wAK2G8+5A0wgOXIEGbij5k+mdyiAPw069o4u0a0xOW+INx
         M9qqOSFMM1R2J9Ys1W3lLpyXmVwGiYKqVn/XKImgNbNNRd6bIupSnCTrV77kVAnBbI5o
         nUbUDgF8QBvxET4MvqRcHcjsUkBbRJiMhOnANrZ5Pbn8h8xC0xwMM3B9fEyO9g9z8HZ3
         oP+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765327269; x=1765932069;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KpHq8e+rzOblWR1Otj2Bnub2ZRaMCmLn7qEYw0+NqfI=;
        b=h+jX52wA84T8MRgZl+I1gWT8i2fNnMwygqpr3/Oc5R18RXk73/sV0uw/Q2aoKDOrtx
         ix9zNKYzMpmaLXh091ohSIJqqjeQTCu6pETSKbc25gt3R0U/K/EZkS+ABeSOmUTeE2Q0
         umDaWhU/Ai1TGFpKaI7yUARD/c+QugU5Gy7+csRsRkB+y6bmCDvnSmfKim2/j7SiC76o
         G7QRafHnJeUTRLLDX0Uw1kkPLitdPuFbJMXVBlVsqijF4KG8d6DRTkv1nOP9oIXp2Xz0
         BHen3Qy+YgiLMnBGzDP/dIxHoYX9Z6CYLRMKdpT40hunMmubMbWYIE7AvyXYqjMvq/jU
         9H3g==
X-Gm-Message-State: AOJu0Yxtr+dik26v9VLMHwcMMODT5roeJMaPgvV9b5W5/wlLz3ooJKso
	dW8aao4iSwCyGhedyhxxIzIgWdx/1nPgsabM2oFr2tqc2nNljZIy4gfeRLw4XPem0MLocOtD2e7
	bFki6WF73J+f9IHuTvrBj3IBwQ2lQ5jamaSttoVvg+cqzu4NYJE4PaQqlzH+MCiDieg==
X-Gm-Gg: ASbGncsdp3S9dxsW1rUzjYQ/c35B0Lo5mILEEkrZtyIq0odyliKVgjtNNFKrkqVtNK4
	PDqncg01+k4Dmh1oqhO5dUotDQINIfE2QsirP+CSe0U1mv2aqA9jZdC33ejnFSJw7hOWLrcouZW
	icR1aoKnUWnZ4pk9FAdvLrWFKlASaICaNNhP13MGO96ouZQntszFa2inqgfggP5XH1ZAENV2iEn
	We2lKSJt7e7+wRftz7GjQVCevNa4waAv5Su8CDDOgmVF+IxLVfCsxjGWRTbuB+hByflfAvZrduj
	6gHJLSuFANIGrnYgz0hF5Nv0fgpq5JBSdbOfTXGL4DqtqcOmy2xs2RyzLxY0CulFoULWykvbvWp
	ytRTde8W4XV3ixtJbC1VKA4QEE5rnS7xcGilwcuR/EKDPl6d+ZZ4794o8DUYNZPjfyFZ6NcJG
X-Received: by 2002:a05:7022:4412:b0:119:e56a:4ffb with SMTP id a92af1059eb24-11f295e928emr284360c88.0.1765327268567;
        Tue, 09 Dec 2025 16:41:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEHN4NydTdOkt6aEZALk1kr37wzVOrYv3cSNMyVW304DCl4uPSSkxNcUAUgk1KT3J7WVzfR6g==
X-Received: by 2002:a05:7022:4412:b0:119:e56a:4ffb with SMTP id a92af1059eb24-11f295e928emr284334c88.0.1765327267967;
        Tue, 09 Dec 2025 16:41:07 -0800 (PST)
Received: from [10.110.63.171] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f283d4733sm3886402c88.17.2025.12.09.16.41.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Dec 2025 16:41:07 -0800 (PST)
Message-ID: <410718de-560e-447e-9fb7-4fec522965ed@oss.qualcomm.com>
Date: Tue, 9 Dec 2025 16:41:06 -0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/5] media: iris: Define AV1-specific platform
 capabilities and properties
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20251202-av1d_stateful_v3-v8-0-2f74a81773b4@oss.qualcomm.com>
 <20251202-av1d_stateful_v3-v8-4-2f74a81773b4@oss.qualcomm.com>
 <161da76e-b05f-4267-a4b8-bf290b74f85e@oss.qualcomm.com>
Content-Language: en-US
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
In-Reply-To: <161da76e-b05f-4267-a4b8-bf290b74f85e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDAwNCBTYWx0ZWRfX2/G5wGToBF6q
 eOXC3qWldhcLPmgxYFCzOeMCzLGQe502y76zUWQbCrWrU1lkxs3Icfgdw96rPhPryRymGCY49mK
 bHLiJkQTuq/HC0/CH83eSxW60JeAZ6IbZcqHeCOluqT373DEvfHHPXODtyXKL+eVLc/S45E2mfj
 cz/gX9FuBIzfNCE+toEdM3DB1NlnCnuVQZHMpnUZI2qiaNm6z1dPg9c6DVWRm8XLJhDKWiPdICn
 WHPlmAE52D5Z43XpQdUFPH+94rM56eN6WO6MC3syy9XPGqZkUAl8tuC+pIzXvGyglLEy2Bu9s02
 kaEmnB4g2eHY2Fje/L3VahFHIk1Ah/WHOTPX4psqaGnop75CjWOzGEJUbuthkbR2m/ifvtt/BbK
 cL2XyaXk8SQsZLMbSx54+KGbJlFYlQ==
X-Proofpoint-ORIG-GUID: E6UelghJUEN20QpUL5lqq6y_FheIwK6M
X-Authority-Analysis: v=2.4 cv=Vcj6/Vp9 c=1 sm=1 tr=0 ts=6938c1a5 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gZTZSuL91KSOT9wTGzIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: E6UelghJUEN20QpUL5lqq6y_FheIwK6M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 suspectscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100004


On 12/8/2025 2:54 AM, Wangao Wang wrote:
>
>
> On 2025/12/3 7:03, Deepa Guthyappa Madivalara wrote:
>> @@ -805,11 +909,14 @@ const struct iris_platform_data sm8550_data = {
>>           sm8550_vdec_input_config_param_vp9,
>>       .dec_input_config_params_vp9_size =
>>           ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
>> +    .dec_input_config_params_av1 =
>> +        sm8550_vdec_input_config_param_av1,
>> +    .dec_input_config_params_av1_size =
>> +        ARRAY_SIZE(sm8550_vdec_input_config_param_av1),
>>       .dec_output_config_params =
>>           sm8550_vdec_output_config_params,
>>       .dec_output_config_params_size =
>>           ARRAY_SIZE(sm8550_vdec_output_config_params),
>> -
>>       .enc_input_config_params =
>>           sm8550_venc_input_config_params,
>>       .enc_input_config_params_size =
>> @@ -830,6 +937,9 @@ const struct iris_platform_data sm8550_data = {
>>       .dec_output_prop_vp9 = 
>> sm8550_vdec_subscribe_output_properties_vp9,
>>       .dec_output_prop_vp9_size =
>> ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
>> +    .dec_output_prop_av1 = sm8550_vdec_subscribe_output_properties_av1,
>> +    .dec_output_prop_av1_size =
>> + ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_av1),
>>         .dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
>>       .dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
>> @@ -899,6 +1009,10 @@ const struct iris_platform_data sm8650_data = {
>>           sm8550_vdec_input_config_param_vp9,
>>       .dec_input_config_params_vp9_size =
>>           ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
>> +    .dec_input_config_params_av1 =
>> +        sm8550_vdec_input_config_param_av1,
>> +    .dec_input_config_params_av1_size =
>> +        ARRAY_SIZE(sm8550_vdec_input_config_param_av1),
>>       .dec_output_config_params =
>>           sm8550_vdec_output_config_params,
>>       .dec_output_config_params_size =
>> @@ -924,6 +1038,9 @@ const struct iris_platform_data sm8650_data = {
>>       .dec_output_prop_vp9 = 
>> sm8550_vdec_subscribe_output_properties_vp9,
>>       .dec_output_prop_vp9_size =
>> ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
>> +    .dec_output_prop_av1 = sm8550_vdec_subscribe_output_properties_av1,
>> +    .dec_output_prop_av1_size =
>> + ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_av1),
>>         .dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
>>       .dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
>
> dec_input_config_params_av1 also needs to be added for other platforms 
> if they support AV1.
Done.

