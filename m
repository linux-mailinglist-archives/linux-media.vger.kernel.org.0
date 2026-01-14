Return-Path: <linux-media+bounces-50666-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B10AD1DA9A
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 10:44:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC322301458F
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 09:43:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12DB1389DEE;
	Wed, 14 Jan 2026 09:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n6abAncv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KZB0RzWc"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A94318BBC
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 09:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768383817; cv=none; b=OPcjIAIm2g/n/dIT8OfVlMY5/nJdjW7ZAsOco9gYMTbeAVFpwMYib85EaF7HSpuTPw5jxTxKGomh7/DucEZUGdW/bH/JebW68PCQ8FFGq88OUIw05qdHJylDLRfYnBc5N8ahWoMn1GbzrmQKxo5t/cT6b6virjfBRtdgwcUe6ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768383817; c=relaxed/simple;
	bh=HHD3SzlXWlyeQJZP+G/46O9PY+zpRJ+xkI9tFVBkWxk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jsVdelI6vLNZ2PE7xJCT3mc3TkQg4ajR6FgLFm3xL7riYw5J4brKpHmuG3wWAd3DrvUJCwpJFnKadzSrekx5YI0Jy6TyHwLiifzD6wDW8TjWEDFLlcXiJA132jL05Maq+2DFqvElERj/cj0vY3dk6WLYc70R0dSUN5TJO38jOlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n6abAncv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KZB0RzWc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E7jFjp2841431
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 09:43:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UP+XwvQl12po0rGZZ8ZsvMNO1Sg8dVAdvVxDQucbPUA=; b=n6abAncvHwzy1gys
	cof8ylvcbrbzz4lc2tRxByfN6J3faPbfnIBYyDVxWujaegS7BjlmUcPvs2r8aLNP
	GXKFmKeeXrEyo0EtIu+Z+m1xuCQjMLFVm1vernVI9lspBmKK+MM3MLsBrj1YTMXh
	J1orbLlN/qt3/SuslICe2+YKDN9FY7syW13uODjtM7ay8E545o3jtQwD5OKyFfGj
	upjYj/NCZ0zfAdeJnZcgCiJBMG2U2t/3a1Eb1UjZKSb6XlDS3om3i/im5a53anV+
	OY4n+s/r9S1VuZXwtZy7iD6FgVmRiwmOb50gTv2inVIr1YCe8DGOy0gShZDXx35z
	nMxYUQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnuk92s08-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 09:43:34 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8893be16bf2so19697756d6.0
        for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 01:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768383814; x=1768988614; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UP+XwvQl12po0rGZZ8ZsvMNO1Sg8dVAdvVxDQucbPUA=;
        b=KZB0RzWcq4TrL81tKQ960JS/7NbkG9pM5yXpThSYfzpvYfkdZ6wb6Nz0s/w1jT6Ov2
         MWdTeCdpkp+mkyy8gDRn2ocP15wZFlgigbGgIg92djhzISxYrhTFkOVpgPUW/HhzaQ2r
         xKFi+E4gSafDBm5Sbcwgajt5tLBlOAj959oVFK1Fib5WOtVWudFOr7nunIuM/diFJTJe
         mb/OwLWsGchvr5B2R4HDJv/VzKTgt1vCb5YbWtlAD68JIX+OgtfyUDGYqQbOj67X7Crg
         1W7axb0ylKF4k3J0YJcmvgKZX7ut+2/ij/J15IbcoA3CPvLjrnmM6td8m0vcUNHfDjcP
         mliA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768383814; x=1768988614;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UP+XwvQl12po0rGZZ8ZsvMNO1Sg8dVAdvVxDQucbPUA=;
        b=Kku0rUEFaFzkyDg7c25vy726OFl1KOID8kBbajoAlsElFYA6a1ghOh2z0+/Uj975Ye
         9k5k27+NpxLUFrJ8vKog314f15JmWGdUTsTMrVmLSZxVilgjTKgd9z0nEofmGi4H1LNk
         Rcevu0V8OiXQlLI/L6p6Kwnb6fy1nYt/9tJs0N3ejSjhSCKuZoh/ucxlZLkgCeIsYJ2i
         wpJIpSIScppe5cyMwlPxqTAn/fg2UYQJdAgCZ1K8XcBiZHk9xhcqpVdiQif3Q5nbl8uA
         snPx04U1cvYDZ7KUL/z8xsGoXfSJaVlum61oOxZ7dpaF2bBAOk6DEY4RI5b5ez/wf/Gt
         XgkA==
X-Forwarded-Encrypted: i=1; AJvYcCUwcUwWkBn+FQqlVZtAToB84KmvRkxVdSe9KM2qIwLR/8FiyY4Ugp1fwWPmMoBsmikpU9rrOilvjgo5hg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw07WWZBbulJS80rxCj7OeZWQHjPrsPRJ59cyn7qfDRlfHCDoo/
	xwDXCQd0x8cZsNILM4stnujoTMiLNFi4Zs6Ido4se/wYMDZnNMtPspzbTbSpiAaICAd7+tOAGMu
	nhh5VPqAxbe4TgjEzRAR35m/irgCn2EKoyg47eK2V863/1/jkXQqSrzJ9s9C5Y0u8XQ==
X-Gm-Gg: AY/fxX6dQOccPiVutrjci1TlUGzMuAVgh8oHsSEWuegvC7DniEIU7RtKyOXfXALJRiC
	BvfqZ+N6QLGmdSLx9GcnYQ1S+5jcfYKo06I/04vozl977ShiVE5HxQTAHMBQ5ZriDF722QuXYCv
	iPZpSVzjxeLEN/4nARzLbuq2tKlcNGFVA/eXjbuJLd75lVZ2VucNwrdmev1lhj9w1cbPJcwSAlH
	3hI1bM69t/3R2d8DETe6LwXTWHbcPxiJepVXPLqvBjIolMGj53Za6yRjPqPbBPzf04JCu9Hw+4d
	3jiF2H1PRuf1rtOOlkuFR8NX3k2NMQUcoUNSXfLyNyQXpfHsetmBEFtwQYOS9Q2OLpqXqAbSh5o
	EN72DrOgeNTcEXIhaff84EbaRh9QuUFwAvTHIsYVhbnYvx4H1ipQ+3r37ECr1ak/Pbmk=
X-Received: by 2002:a05:622a:11d6:b0:501:4767:a72 with SMTP id d75a77b69052e-5014823507dmr23131751cf.1.1768383814155;
        Wed, 14 Jan 2026 01:43:34 -0800 (PST)
X-Received: by 2002:a05:622a:11d6:b0:501:4767:a72 with SMTP id d75a77b69052e-5014823507dmr23131581cf.1.1768383813669;
        Wed, 14 Jan 2026 01:43:33 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507be655aesm22536130a12.17.2026.01.14.01.43.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 01:43:33 -0800 (PST)
Message-ID: <d45ae8a5-6890-4263-8aea-62575f71b3f2@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 10:43:31 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/3] media: qcom: camss: Add common TPG support
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260113-camss_tpg-v8-0-fa2cb186a018@oss.qualcomm.com>
 <20260113-camss_tpg-v8-1-fa2cb186a018@oss.qualcomm.com>
 <87a31d4e-b604-4b9a-92e9-75fd2748489a@linaro.org>
 <98a26638-675b-4654-a940-898ba9e1af9c@oss.qualcomm.com>
 <e1907273-3d14-41ee-9a22-a963f2b83d20@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e1907273-3d14-41ee-9a22-a963f2b83d20@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ebQwvrEH c=1 sm=1 tr=0 ts=69676546 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=eMJ58_vy7G6fnsrVVIUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: mBcLafJ_NnTEkQ45rTwfYzUQbOrlifhl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA3OCBTYWx0ZWRfX0a/BYSpINHTs
 mpgUX7R2gEQRexjI47cG2TU4yMW6qgdPxeUaXNHFLG8TjDMxZsx94aCvPKcl+p/HIVoLfECL1OC
 Jfvyn8t2ebcgAW0TW6ybPBps+exL+ABnKuQy0cir6EnYLI2WgeDZzSXNCxWAvgHo/bB1dquAcZE
 5E2/AO9MEXISyWEMka0m4p4MRZ7Aue7JB9yIymBetBnG/fdWX11cwpykF+dol/m2kNUjN4Thy/D
 fsoB45Z+mKN/YsuTylqFCNXbiPs+qU9RITWAz1EdcdTyM0/OkZogg4yws9z+swc+u0NBPeGP/M6
 ykerWPu+JVRcex9oTS5gTak8A6UdEGwOszOVGcIpAkD1dv+t/kZbUngTnYyzkjF3gsmZOZZV8HO
 l70R7RF6JaMHbNeGqhvC7iUaX8R5iKhStyKlhieQApPVcfPvwU8tj6zqiFFCEORyvoS2l/LRAe0
 9Ytn+jG6q/jvsN3ICbQ==
X-Proofpoint-GUID: mBcLafJ_NnTEkQ45rTwfYzUQbOrlifhl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601140078

On 1/14/26 6:05 AM, Vladimir Zapolskiy wrote:
> Hi Wenmeng.
> 
> On 1/14/26 05:04, Wenmeng Liu wrote:
>> Hi Vladimir,

[...]

>>>> +const char * const testgen_payload_modes[] = {
>>>> +    "Disabled",
>>>> +    "Incrementing",
>>>> +    "Alternating 0x55/0xAA",
>>>> +    "Reserved",
>>>> +    "Reserved",
>>>> +    "Pseudo-random Data",
>>>> +    "User Specified",
>>>> +    "Reserved",
>>>> +    "Reserved",
>>>> +    "Color bars",
>>>> +    "Reserved"
>>>
>>> It makes little sense to mention the unsupported values, and then
>>> introduce enum tpg_testgen_mode to list the supported ones.
>>>
>> This is for ctrl menu, will do as follow:
>> static const char * const testgen_payload_modes[] = {
>>       [TPG_PAYLOAD_MODE_DISABLED]          = "Disabled",
>>       [TPG_PAYLOAD_MODE_INCREMENTING]      = "Incrementing",
>>       [TPG_PAYLOAD_MODE_ALTERNATING_55_AA]       = "Alternating 0x55/0xAA",
>>       [TPG_PAYLOAD_MODE_RANDOM]      = "Pseudo-random Data",
>>       [TPG_PAYLOAD_MODE_USER_SPECIFIED]    = "User Specified",
>>       [TPG_PAYLOAD_MODE_COLOR_BARS]        = "Color bars",
>> };
>>
> 
> This is also not perfect, still userspace is misinformed about a number
> of possible TPG modes vs. a number of actually supported TPG modes.

If the values are really reserved (i.e. don't do anything (useful) today),
let's just throw an -EOPNOTSUPP if selected

Konrad

