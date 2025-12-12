Return-Path: <linux-media+bounces-48693-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E431CB7D88
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 05:16:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D4CCB3030FD3
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 04:16:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEBAC29BDBB;
	Fri, 12 Dec 2025 04:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U65uVlwE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qj34J4XE"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0166282EB
	for <linux-media@vger.kernel.org>; Fri, 12 Dec 2025 04:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765512992; cv=none; b=LyYIAe4zMKg5XVaspGbYYQ4Akw2maw1YMZ9MnAh5sD0nKzTX8HU/grT5J/0euKoyuyYS0qyIpW5WkBIHRuNAz1ZJvKZRUsFdS3vPh3vsvaJwn5z7TjXH4AYFFqXetwhKAZGIIzayF/TrReM4KQgxhqahvSKflG8+K3BgG8gbTeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765512992; c=relaxed/simple;
	bh=xWIFQqIxMumrVX7ZZvMeE96zUwRwQLLXppHqbSwC+Js=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bi+LD24otgI6zd/6jiNgAsr0ozUTHMFRjSacRZtmydToAHPWbONQeIyzXhKPshXvbfpWmGiaCxrZ4z2Vwqbk71zAinVtao6mjCsVSJKm7S5DXw+RGH34oulbwK6OQOcyNKYzDlYYW8Fd3vDGRg8JuEi6Rigub++m2xmluZzke90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U65uVlwE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qj34J4XE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BBKRqcb1952855
	for <linux-media@vger.kernel.org>; Fri, 12 Dec 2025 04:16:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8H7l4dMATXmn+Ign2HivCF9nu4t/RGn8au+x0IyH66k=; b=U65uVlwEmwWoDuv0
	X7Cs2GoEkpke+VoRijDqgpn8xfCI6UISQCCzlp8AaGkyntEyP8BblMUGst1jwGcS
	K36wMlTvrYxXKhBu/d1TKIcCEfbxErKknnJFenRlHgETDHj9z2dus0hccs+lAyid
	XeNuvFQnsdZzRAf2/CJDGaWVp81Fd1VrenB6/UqRAH3ys0zLCpx9eXipj8QM2PzA
	5G1P9esSY65+7/n9e3zzhsdOB3pC2wLIpg4mgnIqRxhvNsDqO+1hPSytlOAFqLYQ
	A2UThqXA3PKFTYk7ClK8l0v0pWgN50EKBkZh0EKJrrQdRy+4XikfZU9M1gqn7h6F
	A2SvHA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b0510rxmw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 12 Dec 2025 04:16:29 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3437f0760daso1622888a91.1
        for <linux-media@vger.kernel.org>; Thu, 11 Dec 2025 20:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765512989; x=1766117789; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8H7l4dMATXmn+Ign2HivCF9nu4t/RGn8au+x0IyH66k=;
        b=Qj34J4XE4F2aOQPMmC2T5uQ+ckXOhhObP1GbZChhoGHP5nD1NHhOK3pLJNQSRriVCH
         hnQ8p5lOOQRjriVAWP4DqYFJW9Et/fufQtDPfWIpmyI3f2CA2fqv4a2rg+ggzy/ylcyx
         pJhdjaTgXKQ7KeSmJGSR9yO7WdmUV6o/RIgYURK5WsVphFM5HEL6Rz0FyViYZ9ul+Ofx
         plfWomh47Cf8856/YC1k19L6NL7QlX0EkULpLtv5jXU5+7K1rEltRvekdA7fX2J4e88y
         JxXHAsHIWHGs3lHV9n3Xhny4lrZPCH69dtaEQON1t4QsLCSLuMAx7wbBkePquf2l6LIp
         LYow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765512989; x=1766117789;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8H7l4dMATXmn+Ign2HivCF9nu4t/RGn8au+x0IyH66k=;
        b=a0Fw/OhfaMtbzohExlcNmXQz9I8ZL10J9fVw+PIIDeVItrTiOkFs3TsbRyq69szUDX
         YGUjy4dj8I1kwUtUR3Y8GVF21j8+Goe8QVXd2NiUM77u+qhL9R4IblsD4SUqVfqaRFgJ
         zF9WDM8FENvarADsJWbAi5YShlTsb5uWfs5FUJnek1Tcuojyd3kZDIk0vapVfdo76W9Z
         pnsyEMoupNFSOhyfCtnDKSo01+SuGxZveZr5+gWHQry4LGwhdrkJ6vv0s521P57lPxMq
         RR9LbHHDs+VwPMW6h3ND0n6e+plV1lnQv5tyqL6QbK6X8f4bNpssAScUgqQwBCxATRnh
         KgpA==
X-Gm-Message-State: AOJu0YynxNX4rQ2pbA+drojZfO/D2i3UyNpugAmiB5D/d/nKnIjVPR+B
	uI/zAzc/GX0KH8CE1vNI0+AbPIbmYGjcSOXyZiNjsFMzbVYElrjvjiCQRvJLD5aLtthH9YbwhK2
	QBaOAgzcpDB3pIjSxt54VGt/a6zbBwA0kHBXGd9u0tOTFZmSWQQmeDVQR/6wrnWbqyA==
X-Gm-Gg: AY/fxX5vKkD2EtEwibvmaIi0s/o9MoiatUXRHRxQ0pTE39vlwoXFPPWbdTOkH/Zrws+
	6+RIOD6vLv8iKSgc7xVrepyb4VZpgNs426ncoBs+1bKtP7NaLH4YUrxXYWG/kfujXpF0tXDaX0v
	yr6det/boCv8Gf/kseU/DI3krFISxIWnmGrFkXnYghrcwUygB3vJ06A3hpvRomNfi1Vn5cJbiwH
	QiMJxPfw+JdGJk8aZSncsC4BnB6lxsdzH3sFRSU+J9xkkWfg4cBVNnnPUXnsTYWRGOrXOT1N4r/
	6Tau0furNn2HIkgQjJECjG5Hbf+5HOSzUQMMVInnz3+6qGVybO6J+QL0Ic1pJAfdHMqIaOzzRqn
	vpWO0EHIh2dMTzCidw3q9FS5JMrFTjXV+ALMSUb98gryT
X-Received: by 2002:a17:90b:3912:b0:335:2eef:4ca8 with SMTP id 98e67ed59e1d1-34abd77fbbdmr863888a91.33.1765512988838;
        Thu, 11 Dec 2025 20:16:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF6+ZpVLE7EmjUp5GR7pVB1C+4LCPd1tpZ73cx+V9RyBoa0VhQ4D+R4YvqelK8mimG3RNxnpw==
X-Received: by 2002:a17:90b:3912:b0:335:2eef:4ca8 with SMTP id 98e67ed59e1d1-34abd77fbbdmr863863a91.33.1765512988342;
        Thu, 11 Dec 2025 20:16:28 -0800 (PST)
Received: from [192.168.0.171] ([49.205.251.140])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34abe218312sm484957a91.6.2025.12.11.20.16.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Dec 2025 20:16:27 -0800 (PST)
Message-ID: <9b952190-4862-42f6-8079-ab48e6ada786@oss.qualcomm.com>
Date: Fri, 12 Dec 2025 09:46:23 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] media: venus: vdec: fix error state assignment for
 zero bytesused
To: Bryan O'Donoghue <bod@kernel.org>,
        Renjiang Han <renjiang.han@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <ZnqX0ohHNwseFNet2fDemk0YpzeQraqTE3Qsd8r2HhjD-eG8CDMirTjuQ70kKtSs3NkgGOaPrxgChDdVu0wTpQ==@protonmail.internalid>
 <20251211-fix-error-state-v3-1-b429262d151c@oss.qualcomm.com>
 <784ded76-227c-4968-a9f2-eb97822404bf@kernel.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <784ded76-227c-4968-a9f2-eb97822404bf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: iDMCVDoIRA6LkfBC6waHUh_XNPa21tG8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEyMDAzMiBTYWx0ZWRfX38q9lnyRzyip
 uucFpLLL9hWXFVhbVdNMJD4+9vgIdlMPiUfowAongfP0xv7nQLq+t4Yt+EnjB7Y3EiVr/FWDr8D
 X5P6sMbNbcMz4N1JBczLXot74LVQyM1xOk1Zb+iVJeB6u90BFJ5VCfP6V5X5r3Utgx9isu7Rjll
 TpauLqc7OTkVSeYIfqS4/0BJniVmTAQL4Le3w6IzdA4OGf6upr9JJLOT0GP5bdsKkYuS7EnWHSI
 387ptSEcHGvXd234a2c+crYbdq4M62gPXuE9LJwAtxfJgbA9hByQs/FmrjvJTQh80Nfn9FNZVdh
 V7oGN5WjdFSI+dTRQ1L75Ogl5L5ozCShXD/ycKjTKD0A82Sx2qFsqqUqDQDPPL4Ej/LwjE95HGu
 R7bgKZUYhC5eD1yVpkrlngpIwcMh+g==
X-Authority-Analysis: v=2.4 cv=W9s1lBWk c=1 sm=1 tr=0 ts=693b971d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=oHgmLS9T6KHqMfKxrEeemw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=2f0GM3lUfm5oml4ENckA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: iDMCVDoIRA6LkfBC6waHUh_XNPa21tG8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-12_01,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512120032

Hi Bryan,

On 12/12/2025 7:45 AM, Bryan O'Donoghue wrote:
> On 11/12/2025 09:50, Renjiang Han wrote:
>> When hfi_session_flush is issued, all queued buffers are returned to
>> the V4L2 driver. Some of these buffers are not processed and have
>> bytesused = 0. Currently, the driver marks such buffers as error even
>> during drain operations, which can incorrectly flag EOS buffers.
>>
>> Only capture buffers with zero payload (and not EOS) should be marked
>> with VB2_BUF_STATE_ERROR. The check is performed inside the non-EOS
>> branch to ensure correct handling.
>>
>> Fixes: 51df3c81ba10b ("media: venus: vdec: Mark flushed buffers with 
>> error state")
>> Signed-off-by: Renjiang Han <renjiang.han@oss.qualcomm.com>
>> ---
>> The error state assignment in the Venus vdec driver for Qualcomm
>> platforms is updated to ensure that VB2_BUF_STATE_ERROR is applied
>> only to non-EOS capture buffers with zero bytesused. Ensures false
>> error reports do not occur during drain operations.
>> ---
>> Changes in v3:
>> - 1, Update commit message.
>> - 2, Move empty line between tags.
>> - 3, Update cover letter message.
>> - Link to v2: https://lore.kernel.org/r/20251208-fix-error-state- 
>> v2-1-255b62ee2eb6@oss.qualcomm.com
>>
>> Changes in v2:
>> - 1. Update commit message.
>> - 2. Add a Fixes tag.
>> - Link to v1: https://lore.kernel.org/r/20251126-fix-error-state- 
>> v1-1-34f943a8b165@oss.qualcomm.com
>> ---
>>   drivers/media/platform/qcom/venus/vdec.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/ 
>> platform/qcom/venus/vdec.c
>> index 
>> 4a6641fdffcf79705893be58c7ec5cf485e2fab9..d0bd2d86a31f9a18cb68b08ba66affdf8fc5092d 100644
>> --- a/drivers/media/platform/qcom/venus/vdec.c
>> +++ b/drivers/media/platform/qcom/venus/vdec.c
>> @@ -1440,10 +1440,10 @@ static void vdec_buf_done(struct venus_inst 
>> *inst, unsigned int buf_type,
>>                   inst->drain_active = false;
>>                   inst->codec_state = VENUS_DEC_STATE_STOPPED;
>>               }
>> +        } else {
>> +            if (!bytesused)
>> +                state = VB2_BUF_STATE_ERROR;
>>           }
>> -
>> -        if (!bytesused)
>> -            state = VB2_BUF_STATE_ERROR;
>>       } else {
>>           vbuf->sequence = inst->sequence_out++;
>>       }
>>
>> ---
>> base-commit: 663d0d1af3faefe673cabf4b6b077149a87ad71f
>> change-id: 20251126-fix-error-state-24183a8538cd
>>
>> Best regards,
>> -- 
>> Renjiang Han <renjiang.han@oss.qualcomm.com>
>>
> 
> Dikshita, Vikash.
> 
> This change makes sense to me. If you are NAKing please do so now.
> 

This is good to go.

Regards,
Vikash

