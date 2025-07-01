Return-Path: <linux-media+bounces-36415-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B08AEF7BF
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 14:05:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA4DE4A72D8
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 12:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF0082727FF;
	Tue,  1 Jul 2025 12:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fsstwGVy"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72D12144C7
	for <linux-media@vger.kernel.org>; Tue,  1 Jul 2025 12:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751371483; cv=none; b=kWMhbqedtajBLVDipeNU9v5v5/6B9aCL3qXOUTJixYANvBu8GVV556Y5XX937RZrbUUidTZOTA9X8DXgLh9MQJOASoelx30IG33RLUi8DTnL8fqsOBErzDQ+NWBTC4ANGS55DlftKxX4f8+K5TBEEvmfxrRiVO/QctTb7h1g4MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751371483; c=relaxed/simple;
	bh=1lbvkwmcN9+XPKXalOgA9l2vSu8vLVpKPb/SY3OyzR4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UXg8oMrxRjedMzkrqEbRDRG0uZlcjDTJOdZb1RpAQOMkc21/fUUdU1rzoIZRZQDvu57p0Rr9ASiWOv0hfY944wSnIFFfxaEHD5GhP8ZvSuhE1aBL9xSYb1EeC5zjLfgYy/XLGi6GtPyxlbGY+ZHSfsm6oKpm9d8TVpq+oJIo31o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fsstwGVy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561A0xw9018559
	for <linux-media@vger.kernel.org>; Tue, 1 Jul 2025 12:04:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8NHaWBJg+Ds90gbf6gIrNnGLkbKxLD7AC/sDGjFqo0Y=; b=fsstwGVyEgtyq39g
	I3qt8UYvjp80hCeAeu2Dmo+eU4zHnDDMIaTGO0RKueua50jsSOoWrL/Yme3lz3RS
	G3/D0BCyRUqcOA86qi4KkDHUz7iTU9YvY4bOP3DDsCvus6+n8CMGvKMjfqu50lWf
	WDlUkH2fluJltkZlpl+mSZR7jpG4mmiyaoyXyulDTcQfPgI1KwNSvqlDtKR3SaIX
	E+sfMhD/KSxl8SntvfYVUlXcPGw5iu3qHcOe1yydYwsSsTpxaQzg+j4n+9srw5do
	FpBOO/JjPs3/IOQF/wMByIsSonVwFMttvux/fboUlqBiJFRlH1UxMxoKRXPgyR0i
	UbKMlA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxguwb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 01 Jul 2025 12:04:40 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4a5832bdd8dso5770901cf.1
        for <linux-media@vger.kernel.org>; Tue, 01 Jul 2025 05:04:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751371480; x=1751976280;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8NHaWBJg+Ds90gbf6gIrNnGLkbKxLD7AC/sDGjFqo0Y=;
        b=MY/xZaiJZa+XArLXmOkFWZaRaRoSrIcsRkw4L3IwEhfpGxUq+UYH4NvMBalQNRfYdV
         8SX/DxvDQfYfWzXl/pjc8sjdtPRJmRcq1zvK+Y76ecmxwBT/6XtF2T4o/HmmSTM88vK8
         72PWpu99sIoHOynoEobWDNPW/F55dkW2A7NGNMf99azTo+GWLCcIUdDGHIWmvFQLy/se
         iEVlF62T9Hy5kdqdtniNKXIzVthq0i4BwrwzM/D8Y3TsdkxSdkcCi8eIut0qAc6Ud1X+
         PvZ3s7IErMtIhSwIvgSyuPlGHePfh9Sptp8c1D1YNazQMn9HrCTWpyOckNjPYt62mYQS
         dWXg==
X-Gm-Message-State: AOJu0Yx+4mTTolC04/Q6lN2jIeKMb9MWPICNKjYoZIjKsadQC4XCUjvC
	NGpGq8qUzU0nWF1zLnMRjJVra8l0i+5AoPgiPMdbTckwFimlXdP75NCiq8fVjWg3MLGMd3BFUjz
	OChCiII1bL+8tJzzJlT4ougk65mpe08jFy8zc6Cy1QtyUfYbhTu+bjwRVujmLT9M+9w==
X-Gm-Gg: ASbGncslqyFTDtN4JP++gbEX9nAfZpuWo5HTlulikpVnoQQozJOmwXSeHSHAWS2GS0B
	NfDO94azeY8ocvLIaCVDJEN11iwW4JO7jU6Dq03lQ9UwU270NHfCg7oQPhX2ED0j0zjeTYC523P
	DJlLFG6R/x4YfwRGMLX+AsHMl0A8sz4/A3pyqRYaxz2oVQB6HUhPVDWSSyccrNM0L63OHf+gD1F
	TnbXwD0KTbJNUu9xkTu4hp0+sZteo0URWnHIfyyRs1/iRPAVGQnLDA6/ggxaAsiYez/EUbq5mSB
	OgpX6bQIQkm+UcEr25t0TyxtGsAqAHHJgrHnd65gkeDLndMk/NV4W85JGEgjpomrTPqr4btGsUq
	TmrWovdo3
X-Received: by 2002:a05:620a:294a:b0:7c3:d798:e8ae with SMTP id af79cd13be357-7d4688a26d0mr124885785a.2.1751371479561;
        Tue, 01 Jul 2025 05:04:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8XZoEPSj7bokOOVZKz/UcTzyquGklqsan9ThQP9FrWzaAytiLBv4obM8TRklGr/BZUMuQwA==
X-Received: by 2002:a05:620a:294a:b0:7c3:d798:e8ae with SMTP id af79cd13be357-7d4688a26d0mr124876985a.2.1751371477590;
        Tue, 01 Jul 2025 05:04:37 -0700 (PDT)
Received: from [192.168.1.114] (83.9.29.190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353ca20a0sm866875566b.177.2025.07.01.05.04.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 05:04:36 -0700 (PDT)
Message-ID: <84861a4d-3016-4d67-b606-ef698ea10e7d@oss.qualcomm.com>
Date: Tue, 1 Jul 2025 14:04:34 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] media: iris: configure DMA device for vb2 queue on
 OUTPUT plane
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com>
 <20250627-video_cb-v3-5-51e18c0ffbce@quicinc.com>
 <d8a1fdd4-0056-480f-ade1-318a34d27204@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d8a1fdd4-0056-480f-ade1-318a34d27204@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA3NSBTYWx0ZWRfX6rCc9AzS0Pg4
 MfBAdnoJh7jRPfMOEZn/OlVwYGzH5bHLUl6tatYPa1zJ2vTXSUSzYzO1eDBnjaIIMaJQEVKtmJ7
 FsXFgi4Sdkv4Y7pSuThml+e4PsLS+MWVMb3ow4abPiB3bpD2OCepGNEyMHzYEAQRCU0vINSg9nw
 KKP9HHgCKuXJlHTnsCGJmnEkr8Yy/Mf6blhr1d6S/gNNOzUOX12SaXJ630r4gqSDnmC/1ttPPJk
 UNlRObfzX6pf5g/r/HYK0kK3ewQgZ4xoH4tPoFlCrIaPvUE3Unab0gNp2zlFlLyjNVAXJHTo1Gp
 H31HuvvjQ94hd8EG5Cqaaie3B4HyZoc8OWO7CZHRrrWFjniYqRPoqjW3kROUsgdknTUFaoXKq7X
 EhGpXDPYQbqciJfgDcVpEebfaOgPqXyS8ixWPxlMyXJF4MXn/ClJAiTbBuQTUTKWxALScWrk
X-Proofpoint-GUID: IkTszjeTIddCvwh8o_opNn0-Hw1uejcl
X-Proofpoint-ORIG-GUID: IkTszjeTIddCvwh8o_opNn0-Hw1uejcl
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=6863ced8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=fKQzr7EGRj+VoE0XNsDNvQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=QmyDNCatlCRWdA39UCgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010075



On 27-Jun-25 19:08, Bryan O'Donoghue wrote:
> On 27/06/2025 16:48, Vikash Garodia wrote:
>> While setting up the vb2 queues, assign "non_pixel" device to manage
>> OUTPUT plane buffers i.e bitstream buffers incase of decoder. It prefers
>> the non_pixel device(np_dev) when available, falling back to core->dev
>> otherwise.
>>
>> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>> ---
>>   drivers/media/platform/qcom/iris/iris_vb2.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
>> index cdf11feb590b5cb7804db3fcde7282fb1f9f1a1e..01cc337970400d48063c558c1ac039539dbcbaba 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vb2.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vb2.c
>> @@ -159,6 +159,10 @@ int iris_vb2_queue_setup(struct vb2_queue *q,
>>       *num_planes = 1;
>>       sizes[0] = f->fmt.pix_mp.plane_fmt[0].sizeimage;
>>   +    if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT ||
>> +        q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
>> +        q->dev = core->np_dev ? core->np_dev : core->dev;
>> +
>>   unlock:
>>       mutex_unlock(&inst->lock);
>>  
> 
> q->dev = core->dev;
> 
> if (thing || thing_else)
>     q->dev = core->np_dev;

q->dev = core->np_dev ?: core->dev;

Konrad

