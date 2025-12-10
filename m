Return-Path: <linux-media+bounces-48523-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B7572CB1873
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 01:41:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AE2BD3021681
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 00:41:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29E891E47A3;
	Wed, 10 Dec 2025 00:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hR/GBNn1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R0111pe4"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31AB814A4F9
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 00:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765327299; cv=none; b=exPQBjoTmEAswJdvZZKo81d7W69ZLnz5t839wyvnnsfoRU5HBhLQA/antLrCqKSm3oSKPHYmE7Zo0FSzE+jVOXQFdErUukusHSRFq2uyrz/nxHqRNZXLiwgx1LOokdSR36kqF9pNRUMFC82lg3fWcVXp/fMSl9vXb04vCJM5/TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765327299; c=relaxed/simple;
	bh=yxhXDHKpMjytC0WGZIKE8maQb0/RAzqx3eDyTm+mfjg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qsIPxDB9GE1jb6GzPCMvT30vyjm4yjQMdfrHSQjxBVatbI4TNrXyRBuUfS6sTjfw3VDUkQROaZfyK4L22brcNF3woLDBOeH0ldhqljO5/kTpOxhFe1ZtszY9gwJUWjRsGJWbab/9OocseXflCVWF17tgpqS/Tw2YSWxF66F/onM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hR/GBNn1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R0111pe4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA0OLaj1613113
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 00:41:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yxhXDHKpMjytC0WGZIKE8maQb0/RAzqx3eDyTm+mfjg=; b=hR/GBNn1He2JVOQl
	GlEh6OZh1sY99F/+cbs/bTP4Ar0HTtCQtazagzEpSdrVo7mQQGwwNqroVvRDC3uj
	IklNm0g0/KYKZ7VCeIhF6Kv43HbfoUgSPlwbU3as8IYUnWdJNmAnyoA/QiZo3Zo9
	eW5785yhBGTrxrZWPfLDHZxt8SCaVBJlNnGvwkrrcgi79rt2zqOZ/dTgnZxAvw92
	ojWkghSUUygtLkLj/BteTvyFie7mxfT1wEzF8pqRYApSselz5C00EpmKXIKqPiiP
	Tb/jCEjXGuuhlf502AjFzXqfYSn1aZRMtJn1kXrbGsFuPJnFUQx6lafh8cKrXf1j
	17KxBQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axvn4gb8q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 00:41:37 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7b95355cb06so1406456b3a.0
        for <linux-media@vger.kernel.org>; Tue, 09 Dec 2025 16:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765327296; x=1765932096; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yxhXDHKpMjytC0WGZIKE8maQb0/RAzqx3eDyTm+mfjg=;
        b=R0111pe4CS+wmH0sB3Nl30w8tQps1Wwacep16ZzuPmVD1neTiijJmXgIHCBLvWFUVR
         J9/F6dSAp7+h3YqcYo1zATwfHyqZIhzBMua7s5kSk3ypLyDg9x58JUILCNtKU7bSn6H0
         2wXkG+BEuRERaMBec6ab3QAPTR0+UJUqF7Pkgvw1wOtbUbDUxlNEAFnHbWvcqcx3MfGe
         wMCbrxkAX6ub0oS52+CrgIkl3q+9niX7iRBXvH3MAbQbkPfrefj5IA11dI4a0fX9/DpL
         uk9g1kzZsUTCWeG6kb7HE90uJWjejuNuuRVXG+gzX1Jf0HSy7KPWw81wGCTBk7s8DpY5
         KxPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765327296; x=1765932096;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yxhXDHKpMjytC0WGZIKE8maQb0/RAzqx3eDyTm+mfjg=;
        b=iu+SXe9Emz8ZzC+rdPmlHYZy5fXu1rP867oOsZiBMI612dKSEC4HosB5oxReuHCFsr
         eb+m9FATkL3p+k+PoGmHm0jz/4lxWHVmM/9qPQbmRluJUX/blwV3++jJxyMl3zGQN/nt
         6ozpdQb/Jq6vYpwNuRltSyLZ7PMUpYd5qUBnFF2VM1R94HUEoIEKsCMi298/CccxlMRu
         pPj3I5bNF6bwri91yGuIOe6u9VxcQk0igHTJpjH8ur2xnAFNN00kAdHRbQzf8fMY8t0+
         PBreJoqESgK8KL1Ear1vJvsJ6IcoRoGe1WIFjFYbFJ8J+Mq06lFA2mAfr3ISFJf+UrW5
         NjIQ==
X-Gm-Message-State: AOJu0YwNbFERBu5dFpJMffpwF1C5ELM9HO761pr18TkiRX/b15W9G51p
	Rc7qVl+MeYuwfF+SL5PEJmx6MplSxdWNnj7vymXYEl7i3RxrphPECpdj84Eoql8J0wpJQpkn8Yr
	y3VjmVBXJ/SAluapgFF1+l/HakUFAWwEVMCyD3VXps88mc+LfypTa1chKVsXIRdqdxg==
X-Gm-Gg: ASbGncsvFrWqYKLqvXQ5SqoDfCfGXuJmv4QU4yIhuMfuF/hSFh0G5M0rEDUtCEuxmGk
	YTy75VincPWQ6b4N6N8VyEesm9QJ6ra16O/pGSpgKFc/f96FmIrrDRNqsuXhVdkg2xaFjKE2JLJ
	mpb9UhNAt0W7YzRhv4bbjB/5kyOGEOrMIJ7v4yywu5JTICU0+mKORffwjGYUqc5wY/MR3OyJQ1h
	Cjjr35Rud47b+90kVulrDub58V7eAZ3Mctcy372HnPq2raGpvLOu8VWQ8vVgQov3yKGZPkdEyRw
	nPv1KjTA4CbVSrCs3WXoNzWLfJSAr0YHWJJXw51b8muFIrPcXRgJexqcrR2MsvqQTM7xDDUOMNp
	VlVaSUT/5uqT3XbnGXJ6Dc7QsKDShzAvgtrCIFsM5gKMYEZOuoPkjBLTv81ikhU/iQy74cTqW
X-Received: by 2002:a05:7022:45a5:b0:119:e56b:46b6 with SMTP id a92af1059eb24-11f295e9734mr244401c88.0.1765327295571;
        Tue, 09 Dec 2025 16:41:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFjbK6H2LR0Eg2xR5CKo0RsaF8+emf7lWY2up65AJbe4FEd8or8hNbHhM7LZTaTc7EAMSpWbA==
X-Received: by 2002:a05:7022:45a5:b0:119:e56b:46b6 with SMTP id a92af1059eb24-11f295e9734mr244378c88.0.1765327295036;
        Tue, 09 Dec 2025 16:41:35 -0800 (PST)
Received: from [10.110.63.171] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11df7552defsm76082570c88.2.2025.12.09.16.41.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Dec 2025 16:41:34 -0800 (PST)
Message-ID: <797f93b5-e31c-4ee8-96fd-4d974daa0b3c@oss.qualcomm.com>
Date: Tue, 9 Dec 2025 16:41:33 -0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/5] media: iris: Define AV1-specific platform
 capabilities and properties
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20251110-av1d_stateful_v3-v7-0-9913a15339ce@oss.qualcomm.com>
 <20251110-av1d_stateful_v3-v7-4-9913a15339ce@oss.qualcomm.com>
 <422cf96b-9f5e-4497-b151-7050f4f11924@linaro.org>
Content-Language: en-US
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
In-Reply-To: <422cf96b-9f5e-4497-b151-7050f4f11924@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDAwNCBTYWx0ZWRfX4kU+G2/hH2lH
 5GdTs2Z54yuhWld4sUGQ7x8R07NSQeuCpDFXXyKexZy7d4bPzIUEIvMsFzB3JER6QMsZiPtHllE
 lkwug31x2YtINt0ZDKbMJMUxyxJvd4jgGecFqw31mZQcIjOUt0AiRIvq/04Kx/AFgSsvPpdeAtL
 FNXcYA/uxQZ107HXC/76Ch9epZ1qJ56H1Pf/6X7X7XWImtCDRDmw/JLx2DT1lCxB7Z1XzbStbi8
 jjZJ0m6wppg+ANMqPCXBe8uH4+mWi5dEMV6ZUdnovcStKorQPUFN3+xBGSlk2PVJhjbScgKhMz4
 7O6hgdEwUMLfN0dSUndMa+8vKpTZr0ZpV2m0l1nlA9doKtjaXIyszIaw+3Tl4Js0If2rmkZp0Ok
 5+i4hLr7C5xYCAHF1PHaLKIxBsPbyg==
X-Proofpoint-GUID: AKFNvLqxMNm9cg5TIiAjPNl31u8nEf-s
X-Authority-Analysis: v=2.4 cv=EarFgfmC c=1 sm=1 tr=0 ts=6938c1c1 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=ukZIlUgswIJF011o_R4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: AKFNvLqxMNm9cg5TIiAjPNl31u8nEf-s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0 impostorscore=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100004


On 12/6/2025 3:36 PM, Bryan O'Donoghue wrote:
> On 10/11/2025 17:21, Deepa Guthyappa Madivalara wrote:
>>   #define HFI_PROP_BUFFER_MARK 0x0300016c
>> +#define HFI_PROP_WORST_COMPRESSION_RATIO    0x03000174
>> +#define HFI_PROP_WORST_COMPLEXITY_FACTOR    0x03000175
>>   #define HFI_PROP_RAW_RESOLUTION        0x03000178
>>   #define HFI_PROP_TOTAL_PEAK_BITRATE        0x0300017C
>> -#define HFI_PROP_OPB_ENABLE            0x03000184
>> +#define HFI_PROP_AV1_FILM_GRAIN_PRESENT        0x03000180
>> +#define HFI_PROP_AV1_SUPER_BLOCK_ENABLED    0x03000181
>> +#define HFI_PROP_AV1_OP_POINT                0x03000182
>> +#define HFI_PROP_OPB_ENABLE                 0x03000184
>> +#define HFI_PROP_AV1_TILE_ROWS_COLUMNS      0x03000187
>> +#define HFI_PROP_AV1_DRAP_CONFIG            0x03000189
>>   #define HFI_PROP_COMV_BUFFER_COUNT        0x03000193
>> +#define HFI_PROP_AV1_UNIFORM_TILE_SPACING    0x03000197
>
> I'll fix this for you because I'm infinitely sound BUT
>
> #define HFI_PROP_AV1_FILM_GRAIN_PRESENT         0x03000180
> #define HFI_PROP_AV1_SUPER_BLOCK_ENABLED        0x03000181
> #define HFI_PROP_AV1_OP_POINT                           0x03000182
> #define HFI_PROP_OPB_ENABLE                 0x03000184
> #define HFI_PROP_AV1_TILE_ROWS_COLUMNS      0x03000187
> #define HFI_PROP_AV1_DRAP_CONFIG            0x03000189
>
> please stop using whitespace for tabs !
>
> ---
> bod
Sorry, updated to tabs in v9.
>

