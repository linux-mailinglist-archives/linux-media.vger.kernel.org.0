Return-Path: <linux-media+bounces-43595-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 449CCBB3764
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 11:35:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB8B7189E40C
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 09:36:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A9EB2FBE1C;
	Thu,  2 Oct 2025 09:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b9loSckW"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4A12F0C79
	for <linux-media@vger.kernel.org>; Thu,  2 Oct 2025 09:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759397741; cv=none; b=q3ERf1mQZHcjQqRqGbWNTty9VGjvnRkIorTtgrd2YXCo/ZfDJlmDqcBnbsIcuwN035o8eWHBWzj8cxoSk251i2B88M0VQVOUfQmBZ8s5Ms/YUMNBBSW7BVUCYaYlNT3YdPOCrP+3eOnD8CQTPCs0ZsZn5rb5Xosc6qkvt8Tkxzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759397741; c=relaxed/simple;
	bh=gquL8oJDS2qFfBrJhZFm5Nd4V2FEnYQdeixhavh1kxc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SRCbswJBNLg/X9+6UDJgJl7ESGfEqwgsYwLPD5ssijOnnq7tVgKPcndLhJTPIYlWWUAkuyS7pcJVb41kWM966tbePgo6nu6jVKgKQwr/7QW8OmM5Y5YgOfJWRY8jFmgSprnNsExiEDlvyYhZ7yc/VThi6nDm9jpb5aGC1mdT95E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b9loSckW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5929Vlt8018009
	for <linux-media@vger.kernel.org>; Thu, 2 Oct 2025 09:35:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iXCeCzOyszl1VAgljz9D6QG5m7XLiun3jSNKMsVM03E=; b=b9loSckWVIAmnYFk
	SMUe7uXkOrmfkLCVkvPu0PWCpYBoRxh8BEoVQCMxGX/HGj8jYPuoM4LO++T7ThVm
	ywu8gBXCAf2b/f/VXq7lNWrK5u4CfI/YOBpeXaaj8UpGTOMbyxjyTpYtGaN7A8Pc
	zksyxijuielQA74kAjoJh6pr2t/FmHhqTS9Z/aQq74Ogm5l3cb4KFeW+pvAw3r0z
	z+ymNx8YIsIaVEmJYXTI4i+4CH1oHiJsEsKooCGWAwWQHfd5aW1Gt11J/Z6ErbwM
	N8HrzJg/jaKwtsMNGFVwHEd4pnKJP8fDgtRiumqcRcPMyoh73cum9+IUoWw319wU
	4nAeww==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49fyrf8wvt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 02 Oct 2025 09:35:38 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-32eb864fe90so1293252a91.3
        for <linux-media@vger.kernel.org>; Thu, 02 Oct 2025 02:35:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759397737; x=1760002537;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iXCeCzOyszl1VAgljz9D6QG5m7XLiun3jSNKMsVM03E=;
        b=NmuhpzJfjWtlT9wh4oqohpxBRRWvPTmzlaQKsC1fIlwva7uouM7cItbJIK3WGXnr3A
         KHC8NVux7LwsCwFxh+KFiC2NeoKahP8RKEoHk/TjMLFBaeFmubrm1cW+32I43sX741wc
         wiGveCGqoEkjGm+FwNAjF9uG16rKUfKDls/GcDyLrxDeFindS2slYtJ2DH88EzFM5ROK
         phhRFeyRu7vkw7PjlY/hrM7VXRCYdnYP5PAtAs0JltPrl+Z6MOer+VF4CuWF0bUtoCsN
         PKH/546Zrp0PuJhWEE2Fd5uan81btJhrzDYKdS4Y+xuHIAByASydZgmOBYDC94wdjfWI
         sBzA==
X-Forwarded-Encrypted: i=1; AJvYcCXXhfYBoeHoEmrW/Zd7ySj0Xc1Kxl0UIwGNUfUiMGdVRHKiKcipbC07Hg77txKyNw8gbRZrT45KpH1VoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYtrwGLVAidK9981mXUIP11HV4DIShm7We3OBr3yXNNhty/E+f
	NDRRgmvIdH0xPCBXmBl2yGHan3RvHefYfeCbMKGAB4RvEGUKtoHRukcpKPyX3fQdSkoc9Uwd3/j
	ak2K7u1QNmve+fvVcZsViDbuSU2TnRU9OZVE8RzBlIU66zeA2+f0fFDC/kNge7WwlNQ==
X-Gm-Gg: ASbGncvZcqDK6ykl6Nss8uF2AYqfOrEE45FZiTM7KfcUH9sJJzzw/zqzZvdBH4Qx7sw
	eoLm/tbnQJ/p4KjBK04wKjk+TW8uF1ZIClIImixzbCOm9jSi//GQf6FFc/3+34dk7CWwIWTNP1i
	CQKVOm9+O3WdGE01kkJPAF6d6z8pwB9Iqrfj1iVyLJZIAG4FKSY2NCdcyEN20tppGekwxr7HX/q
	2QaqgTUaKetvUBjogpH9Wi6GEEyYqm/hVKBhXP7ozmyXnmRYF1u4LAVBZSUhUttb1Mvrba12ToL
	KGBLX7SsVOFGCreG6B728H/03Qdup8XkszxanFlpaIZ/opwHPnWQh2GqvPdnNuBtGGAqjFeuQIe
	ooC0=
X-Received: by 2002:a17:90b:4a87:b0:32b:623d:ee91 with SMTP id 98e67ed59e1d1-339a6f36e19mr7456605a91.27.1759397737498;
        Thu, 02 Oct 2025 02:35:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUdKY/s60So/cK9CP2fZSoDUz/GJTA6OYSgtEOsSuT0tjAiYtF/JKWQr4BbsZy/WrKkHirUQ==
X-Received: by 2002:a17:90b:4a87:b0:32b:623d:ee91 with SMTP id 98e67ed59e1d1-339a6f36e19mr7456584a91.27.1759397737057;
        Thu, 02 Oct 2025 02:35:37 -0700 (PDT)
Received: from [10.204.101.186] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339a6ff0d4esm4593006a91.17.2025.10.02.02.35.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Oct 2025 02:35:35 -0700 (PDT)
Message-ID: <404e40cf-8c51-d12c-d39c-6cc83779e3ca@oss.qualcomm.com>
Date: Thu, 2 Oct 2025 15:05:29 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 5/8] media: iris: Move vpu register defines to common
 header file
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <quic_bvisredd@quicinc.com>
References: <20250925-knp_video-v1-0-e323c0b3c0cd@oss.qualcomm.com>
 <20250925-knp_video-v1-5-e323c0b3c0cd@oss.qualcomm.com>
 <ab28a715-6b5e-4adc-8889-f47ee2e18d5c@oss.qualcomm.com>
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <ab28a715-6b5e-4adc-8889-f47ee2e18d5c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: PV1GgbCRtMGu7ceUyE8hA7SKkVnt58jU
X-Proofpoint-GUID: PV1GgbCRtMGu7ceUyE8hA7SKkVnt58jU
X-Authority-Analysis: v=2.4 cv=etzSD4pX c=1 sm=1 tr=0 ts=68de476a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=xrcbAuTPtFrA5IWV9RAA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDE3NSBTYWx0ZWRfXyzZ9UCjC3Pez
 tCzY7YbzTwCzbIxupEfRRb/6EEXl5bKhPy0IANAGW+ZSuY+/9NH7cMBmPFG1hXM+CeJeezuKzTh
 Pja1+HhGuvoFpSTmfv6qtUNABovbcL7OGFnVrU5TSK1wUME8NOcxi5y1rdVuj8isi5EHElNsagp
 wWtToINScr6da9gGZWkAZAcw+w/hfKV9JralsU8uhLd6KprUKh+Ja6dW6H6ruodPcRpDTwvNk5g
 eqzKzxtB/t6ll2w1k5K8TEFvbztC+crMMHxEOi+qoR0aQ3AH2M9M4INC0aGmKjIDH1d9PRgOVXc
 LQZXLtpjEsK2dlh0q+F3fU94pcHqOJqA4BxcJzRT5ZKroxIArB8hFEYhWOtIHTHDHVU4HOmGvik
 jqd6XIf0c/lrWxYqv6upsqzEf7giQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_03,2025-10-02_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509290175


On 9/25/2025 2:40 PM, Konrad Dybcio wrote:
> On 9/25/25 1:14 AM, Vikash Garodia wrote:
>> Some of vpu4 register defines are common with vpu3x. Move those into the
>> common register defines header. This is done to reuse the defines for
>> vpu4 in subsequent patch which enables the power sequence for vpu4.
>>
>> Co-developed-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
>> Signed-off-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> ---
>>  drivers/media/platform/qcom/iris/iris_vpu3x.c      | 36 ----------------------
>>  drivers/media/platform/qcom/iris/iris_vpu_common.c | 23 --------------
>>  .../platform/qcom/iris/iris_vpu_register_defines.h | 29 +++++++++++++++++
> 
> This is a slippery slope. I think it's better if you explicitly say
> the header file contains the register map of VPU3 instead, as let's say
> VPU5 may add a random register in the middle (pushing some existing ones
> +0x4 down). Such changes are annoying to debug, and we've unfortunately
> been there on Adreno..
> 
> Because you're using this for a single common function that is both acting
> upon the same registers and performing the same operations on them across
> VPU35 and VPU4, it's okay to de-static-ize the function from iris_vpu3.c and
> refer to it from vpu4 ops, keeping the register map private to the former
> file which I think will end up less error-prone for the future.

Appreciate your thoughts on this and trying to bring the design issues faced in
adreno. I peeked into vpu5 register map, and it follows the offsets from vpu4
and should reuse them from "iris_vpu_register_defines.h". IMO, we should be good
in reusing them for vpu4 and atleast for next generation.

Regards,
Vikash

