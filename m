Return-Path: <linux-media+bounces-44796-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F7BBE680B
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 07:55:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9DDFF356985
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 05:55:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5E9A30F555;
	Fri, 17 Oct 2025 05:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CedNOCEh"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5D71C84BC
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 05:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760680493; cv=none; b=rswV5NNAwv8jFYKOn8/nUTDnmzXRVUgBto7w9WmIrCVxIDVU4DgHp54EVJB5dD9pmyV4NGDc6Z1+i6LZpAikqCigpRa6O8WcUGA8vmV0bmSXCrqkT51bjbm4zNUzifsf98nzs+/Hgb6Er7F+BHsuhbAB0xDVTtcsUHdOBSUIx+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760680493; c=relaxed/simple;
	bh=SNmMw0sTgquEx0KNzWAeChkFRwGDfFp1CMVORD7GjL4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ory62VoMrfn1I5/MSmpza/okrsQHjMLLL9G//RVVpuDGrLpoiJ7qIYI5wAtI60f7zFNwK6StObvKrFOsv43eVjbyJsm5CO+vxOtSpjAYKB0CfCdd5UaibTfl+WrFfUoOvk6HRi8XOdY7LVB1muu84DC21K1vU5nldxh7H9rprXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CedNOCEh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GKLXgX016623
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 05:54:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VkqSu9s5dxWjR7I4tDBayWcEUvhFWsAikTkxnFFF10w=; b=CedNOCEhG5heA1Ze
	KebbOO8GsfEj6SNrJBu5xNiVfOS2i4XEfoF0cn/bOauvSah3QOgNG0c21Y8Pr6g9
	0DT/PGsurHsMhS+1uvtx20w/oKTiuwiugetgXvBnNMsLxrogNF4KT2CTS8mH6rpl
	KmbsoSf/630/Wqq5+wwfIEfLTub/+mzl2CrGJdgD/4egpsBUCaiG3SzTrkVwUG5u
	NUiZ8Rhc57eVhdGAuHBAhsJT8ySTxwrFLbnJSvB4dwmPH+HkoRhfUl7ikElVUcFv
	iEZYMufLap/+rA++dEE2d+vzrZin7E8cXW1g7wGgWbxkDBLJYPbH+INWu9YHnmjJ
	GlM74g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfm5u5tm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 05:54:50 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-27eca7298d9so34146345ad.0
        for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 22:54:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760680489; x=1761285289;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VkqSu9s5dxWjR7I4tDBayWcEUvhFWsAikTkxnFFF10w=;
        b=PMh3T/zg0OggSwZW70d48tiDLtybBWuisGid+cAQWIQR21s7/k70E0aBzgBshuKvlf
         ry4GAUNF7/7pBozuk7y+B4Gvuv41dB9puUTdnYsbCYCVbcO8H2EoTBv2oP/GIGkBhZQo
         R5K/QPqdOXeCIQp8PCxtZGhQvH0j1AuoOocKZDD854lNtvQJx/cFf/yF1hi+y1fhp0Dk
         7vJW5Ax84geZCDwx3iSaK+xt6m+RIXdztrZWz16dIuWRHKlPa63HvmLc4/KJIlJxlLg+
         HW4XEEl9K284xdTRhBv9Q61pJ/zWscqD1FyyoBJZ7BdAOEDMQ5OHevlgUb7DKc7vAJzS
         lFMA==
X-Gm-Message-State: AOJu0YzjJoD6y6y75WrebYWLNIPaYIhaAaPFzlhruycdZ9wPR5n53Qfk
	XFfhlEWGV3++gTQ1vIWC2VHZazdldIziWwTZAYW0bKGGOcEgSyWZGI/JnyUbjpFu+5BgMqe/8pP
	C/9ovWdhReMJT81ynrUOst/q9afRh4UXNUUYN/hGRkrXAd1TsfCPfJ4VCCBvN3sZPKQ==
X-Gm-Gg: ASbGncvW1gmXwXzp0Hqcpr7heEJweRlmWXJTLEmpUvPI/IC+DiRiKjNG4C7V4nCZlGL
	zS1Bi/dQxhE4NuSkqCalzm1XGtN/Ogs3QSED2pxVRfIySd6iicm+TZG6i5pISWxybzbQllEfrZx
	rJTQuQM2/taZoGCJ5wVMGs3xi2Rp1ubBFY0Ue3ziWHDQWfd4Vo7e5yZUuB2LmQvP8frxQp2ePhC
	hlkTHOAMb8qaTaDgVCEQQ87ktUwWZbffOev4GIrxF2nrZvxXlTSLvncnGG6NDkcJz16bmt/tnuo
	33woryyZH7sr/RdvJgxDocBW3nGd7LSXEwabhg2jwuHRWpS2T53OL1595BCWlgcAWykpPyZdfAn
	GZnaeq6JE3DbTHFXZ3YbksB9xlv2h6vu7XTgB+N8U6J9RuNIPQBwCVYj0AyLXK1tfdLLfSg==
X-Received: by 2002:a17:902:f693:b0:265:47:a7bd with SMTP id d9443c01a7336-290c9cf8efemr23014695ad.4.1760680489225;
        Thu, 16 Oct 2025 22:54:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHd8a0IlV6YWKUfG9MbGZ0cIY2N4OtBfpsKGv/NleymxB5I+xnN9bB5sCluTNXsZQxkWj93rg==
X-Received: by 2002:a17:902:f693:b0:265:47:a7bd with SMTP id d9443c01a7336-290c9cf8efemr23014535ad.4.1760680488823;
        Thu, 16 Oct 2025 22:54:48 -0700 (PDT)
Received: from [10.249.28.124] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099a7b4a2sm50581445ad.67.2025.10.16.22.54.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 22:54:48 -0700 (PDT)
Message-ID: <c18043c0-253a-4681-8ade-659b8652a90e@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 13:54:41 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] media: qcom: iris: Add rotation support for
 encoder
To: Bryan O'Donoghue <bod@kernel.org>, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, abhinav.kumar@linux.dev,
        mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_qiweil@quicinc.com,
        quic_renjiang@quicinc.com, Wangao Wang <wangao.wang@oss.qualcomm.com>
References: <20251015092708.3703-1-wangao.wang@oss.qualcomm.com>
 <VvDBI2gT4oH7ZFT0ooUS3sR8qVBmREmQCBoO6TyzK-3QbZzvQP6xByAlET8sWzpVPkJEeoa8pOCgjIHmayqBug==@protonmail.internalid>
 <20251015092708.3703-3-wangao.wang@oss.qualcomm.com>
 <437c380e-885e-4458-9913-788ece5a4ecc@kernel.org>
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <437c380e-885e-4458-9913-788ece5a4ecc@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: kUcyUvgkXFEJ7gIuHwDp7KALfHjZBh1G
X-Proofpoint-ORIG-GUID: kUcyUvgkXFEJ7gIuHwDp7KALfHjZBh1G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMCBTYWx0ZWRfX/zlsaQAFrbmr
 s5pBIxy13bfzswUFQQI4epcSO2EY7StXLe6hkxvKMynQlLcxoBRcwy1USFkLkFTRn1L9ez8sZ4L
 X51zZQ7O4QAMiUTUD1fz6J/khUSjc1eo8+2agHVPzjVs94EGwR9IjI9jtGYEHXEbLVOE+P6NTVe
 /vC5DrU8TM+hvJSd9ZQ0p3wIi4gKJkyiS5yTIR1QLK9tKC0MXnbKIkWvq+5QrN5IRvbTeE67zZV
 KBYrtyFzObsawIp8+mT1eurnTpLvFrdAbEcaLvn2bulJcT7p3Pv3iL5LHjDwR5VbupxIwvX7dGG
 MkhBEJTfxWJrq/UhCsrkd74RjmdWAHTdL/3OJODDAeIm3gaAkNnlUJzVaSDO621pOAtqUiF/W7R
 Oh90mr9N6TSDOUtJP7VL5yuxjgGqEA==
X-Authority-Analysis: v=2.4 cv=V71wEOni c=1 sm=1 tr=0 ts=68f1da2a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=sT30tPJYCz54KknbIz8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110020

On 10/16/2025 12:08 AM, Bryan O'Donoghue wrote:
>> iris_hfi_gen2_set_bitstream_resolution(struct iris_inst *inst, u32 pl
>>           payload_type = HFI_PAYLOAD_U32;
>>       } else {
>>           codec_align = inst->codec == V4L2_PIX_FMT_HEVC ? 32 : 16;
>> -        resolution = ALIGN(inst->enc_bitstream_width, codec_align) << 
>> 16 |
>> -            ALIGN(inst->enc_bitstream_height, codec_align);
>> +        if (is_rotation_90_or_270(inst))
>> +            resolution = ALIGN(inst->enc_bitstream_height, 
>> codec_align) << 16 |
>> +                ALIGN(inst->enc_bitstream_width, codec_align);
>> +        else
>> +            resolution = ALIGN(inst->enc_bitstream_width, 
>> codec_align) << 16 |
>> +                ALIGN(inst->enc_bitstream_height, codec_align);
> 
> That complex assignement can be expressed as a macro, static inline or 
> just a regular method instead of copy/paste the same code with one 
> variable changed.
> 
You're right, this code is reused in several places. I will address it 
in v2.>>   inline bool is_scaling_enabled(struct iris_inst *inst)
>>   {
>> -    return inst->crop.left != inst->compose.left ||
>> -        inst->crop.top != inst->compose.top ||
>> -        inst->crop.width != inst->compose.width ||
>> -        inst->crop.height != inst->compose.height;
>> +    return inst->fmt_dst->fmt.pix_mp.width != inst->fmt_src- 
>> >fmt.pix_mp.width ||
>> +        inst->fmt_dst->fmt.pix_mp.height != inst->fmt_src- 
>> >fmt.pix_mp.height;
> 
> These long chains of indirection make the code not very readable
> 
> Please take pointers to &fmt_dts->fmt and &fmt_src->fmt and reduce this 
> clause.
> 
Sure, will update in v2.

-- 
Best Regards,
Wangao


