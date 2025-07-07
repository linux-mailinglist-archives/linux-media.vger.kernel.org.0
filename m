Return-Path: <linux-media+bounces-36967-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9DCAFAF81
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 11:19:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 45A1016CB78
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 09:19:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 753C228DEE0;
	Mon,  7 Jul 2025 09:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rm45DgSY"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4122328BAA6
	for <linux-media@vger.kernel.org>; Mon,  7 Jul 2025 09:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751879981; cv=none; b=K1zWUQObp+wg/snUZD3NPQJlHgpkFtwtg2td2nFncsraPz/evI+yAWMvzTaSdhTNo1or4GddLs7MWtuisnVzOE17bjUZMnalglf+sI42IOEoRFzQfB2Ow35L31NuOJVmVPdTZYhDSOuNZqZ27cPUliTDXCEhjz8U3yN/u4GlqD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751879981; c=relaxed/simple;
	bh=ljuEX21Jibul/BV1/uZPiIOWGalCwwuUymdQtWRaO2I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WJNjxmM0p/X3580sEZBx1X8W5eJ1g1tzT5GHw++POSF9Sy0f3X0krRmgn8Yx8ZV2ZF67RVocvtH7ciRTXrnuM0L9RCN6U1Dii3ZEfXhxU49syQphlkDLC7gW030RwcDdRcAWLVwertSSvN1RUGMBm7SabYY71EuZ8cEOYQMC/sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rm45DgSY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56792eRA016790
	for <linux-media@vger.kernel.org>; Mon, 7 Jul 2025 09:19:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7VOMNRIdPe5++kYgsqfJ8vCXc2F2M2dCa0BteZPuPU8=; b=Rm45DgSYnQerxl79
	0X4MW1I5IcYlbWtSLDtYyuPlwVTtgHL5NatR8gmftZ74YKU1wrFJGB/AgbAL73fg
	LH8X8QB1r2y8CU8p2qljLvPqq4VZ8zogAmc1kAKY9I91ZACh5+fEkKJl8uRC5J26
	cRlyaH3JkD+9w9IP/vzsWUX+bUS29tmhF/MCnVzrA8UYkl/+26BQsvINbnipSTdp
	Mf9XBAkKAdRmQq4ChTSekzYsjaEjUFk/dwheyG9tQz1dliewkqm/75ARaQwjo3BK
	pR1+c4mwjwzwSGQ28sWTQKJvMKlwbDu/JU7gDr8BK69j0sLf4/NtvLgkLfY2+kDZ
	GqzQcA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pucmkycq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 07 Jul 2025 09:19:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a43924a1bcso4858161cf.2
        for <linux-media@vger.kernel.org>; Mon, 07 Jul 2025 02:19:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751879977; x=1752484777;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7VOMNRIdPe5++kYgsqfJ8vCXc2F2M2dCa0BteZPuPU8=;
        b=nTy3TV/CMnrI2A+WmpMCmKwbKsxqiuhHmdg/BDC5nju3taqxq3dM0gEu3fVa+CubAu
         +QQ4pslkVKqg4gPPmSh6UdOca2p7PSVR6ABg6SQogmxdWsmHa2wFgiP532n0oCavMnQW
         X007/g9xe/LFOvCmqHXDJaqvTsBaGMdjBZy9R6xoTJMbvz8qh/dYVdEq3xIHx9wVwh2a
         p7/q9I2/icK9/+DX6WEolUbz8BgGvfmuwTA+7AuHYBVEiH/M8zOyCMlGUA84cBKQVzJY
         DWevseevVoHSXkXusKFf2w0e0xwCnKzml7e09FO0rq74+rABQsb9UNoAD41FefpQ31S4
         xV8A==
X-Forwarded-Encrypted: i=1; AJvYcCXAcm7GcVOX5Cbv1lQvTk65jopzGsVzhBHjsZHKi8LT1sU4LPldo6ru4RvKhYQwEKuXFng1Jfj8E7X89g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7J1UOcvOpawHYn+ccs+r0rto5oirE5vIF47IQ++kDYLM3h6om
	OS0LpW/v4BrxALsRZVODnG+qzCQ8hoRB+vVQeXj039HxNuIWA1fkV+ioSIqBPdWbxVNUk9bP1rp
	l6aLqc1rPgCZno3F9dVEVba5c+RQ/8UT6MCwjAXP9BBaqu1XUhrxvUE4ovZWN7jPygA==
X-Gm-Gg: ASbGncvs2WVq35FuebnCyNr/fNF4rtY6ZsDHa0RAIxPhiaa1hG3qWVTyx0tttSyz+6j
	Tyf6kbFmlbIZ02R1igz2zeWAU4IApxzrGn99ygd3zDmo5b8q75ntZf/pWdV4wiU69nqH67kDeCU
	tn7hXTkZ70yy6QT6xtKh6j6aA7Ve8Rh3UdfOPPcIbD78I/Rt26adSqzNHpJitYjHYfgR/nXcMVM
	wTDOfQUD8gdHExcq8I6x2boq5jVZ7n7ZFlwCVUPoZHDKsH5WInrdKU6OF9ohrvXzKW/jjMjL92T
	s6hH5pnkZeapBMkkpmLyZgoFmFGRsza/xEA6fvPhtp+wetdDMP6VrYnqVd+Gbc82HlcLKWhfskl
	MMKI=
X-Received: by 2002:a05:622a:a90b:b0:472:4c8:64c6 with SMTP id d75a77b69052e-4a9a01330c0mr49003731cf.9.1751879977075;
        Mon, 07 Jul 2025 02:19:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8zQl/VV82jUJ16IKGzuIQK2MD0Ay6nJSmgRfvnHnWiCJMb9E44wM/hVre6rQPyF4QKYG6bg==
X-Received: by 2002:a05:622a:a90b:b0:472:4c8:64c6 with SMTP id d75a77b69052e-4a9a01330c0mr49003631cf.9.1751879976627;
        Mon, 07 Jul 2025 02:19:36 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6bb1418sm663547866b.183.2025.07.07.02.19.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 02:19:36 -0700 (PDT)
Message-ID: <30cf5c9f-6c9c-4cae-adec-81fa090a3eb5@oss.qualcomm.com>
Date: Mon, 7 Jul 2025 11:19:33 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] media: venus: core: Add qcm2290 DT compatible and
 resource data
To: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: krzk+dt@kernel.org, bryan.odonoghue@linaro.org, quic_vgarodia@quicinc.com,
        mchehab@kernel.org, robh@kernel.org, conor+dt@kernel.org,
        konradybcio@kernel.org, andersson@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
 <20250626135931.700937-5-jorge.ramirez@oss.qualcomm.com>
 <ded874b1-715d-a7a7-fd0d-3b98fd5fd029@quicinc.com> <aGuOzdCu5UmKDF94@trex>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aGuOzdCu5UmKDF94@trex>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GdQXnRXL c=1 sm=1 tr=0 ts=686b912a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=xq3W2uTSAAAA:8 a=EUspDBNiAAAA:8
 a=iOyF40SCRJJOIr8PYD4A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=P5L7wpMTXyg1GfFA3Gwx:22
X-Proofpoint-GUID: BgIxrkdvR1T3CAW4kkkXg7rWXbNruTQ3
X-Proofpoint-ORIG-GUID: BgIxrkdvR1T3CAW4kkkXg7rWXbNruTQ3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA1MyBTYWx0ZWRfX8FIkB821aVsw
 GUnx83FxOFTOw45039TurtslZ8b65aDPFY+1MYKyYtWMG8gmTgYek3n0ghKhdlmdidz2043AGxY
 YXqaAABFNCxCL+8oiHRpSiOYevYY5KHitqwmLfO2/GG9dfCtQYO0sfUr61ZFfGUp0ZY+cyvJGVW
 krjlhHzodA6lzTmHSMNsVm8eudo7arj6H65X7MKnljCq3uvZwJG3wmXQEKgqDJEfM0sfy9v2w6R
 Z/qc/bC8i0UWtyYN+PtUM1RalMWv3FEC0zrijX2LL7Q45KehflLd+j2m6cJ9vWW0yS9L9wJUUQ4
 PN/y27tJVP+5WldW+QHT7Dici1MikqQnHHyElFfD8aVeGegKSAsBFM5jpN7dV5R3pq7aGMyZFx+
 asbgG51CKXFpHAmpi+/+oGcmf9cSEuwwPCb7S7Uv/h3WXehrq+og7C4ROO/zmbHkBeATPBD7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_01,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 malwarescore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507070053

On 7/7/25 11:09 AM, Jorge Ramirez wrote:
> On 27/06/25 18:46:10, Dikshita Agarwal wrote:
>>
>>
>> On 6/26/2025 7:29 PM, Jorge Ramirez-Ortiz wrote:
>>> Add a qcm2290 compatible binding to the venus core.
>>>
>>> Video encoding support is not exposed until the relevant hardware
>>> capabilities are enabled.
>>>
>>> Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
>>> ---
>>>  drivers/media/platform/qcom/venus/core.c | 39 ++++++++++++++++++++++++
>>>  1 file changed, 39 insertions(+)
>>>
>>> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
>>> index 736ef53d988d..f1f211ca1ce2 100644
>>> --- a/drivers/media/platform/qcom/venus/core.c
>>> +++ b/drivers/media/platform/qcom/venus/core.c
>>> @@ -1062,6 +1062,44 @@ static const struct venus_resources sc7280_res = {
>>>  	.enc_nodename = "video-encoder",
>>>  };
>>>  
>>> +static const struct freq_tbl qcm2290_freq_table[] = {
>>> +	{ 352800, 240000000 },	/* 1920x1088 @ 30 + 1280x720 @ 30 */
>>> +	{ 244800, 133000000 },	/* 1920x1088 @ 30 */
>>> +};
>>> +
>> fix this corner.
> 
> ok, will wait for Vikash to confirm the other ones.

Actually you can get rid of it now, I think:

https://git.linuxtv.org/media.git/commit/?id=b179234b5e59013f8772da17b273f463f9720bdd

Konrad

