Return-Path: <linux-media+bounces-34479-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 838CCAD4461
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 23:05:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 102C0189C00B
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 21:05:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32252267715;
	Tue, 10 Jun 2025 21:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MiheBHYp"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB4412D758
	for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 21:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749589497; cv=none; b=SLO7/ua1exJd+uCitWvKLZz4B4FuFlSnb6j5ajv/wNOhBgYucv3f6yqD02Szla1+OFsH7+e+Qo438rhBlEsltKDYqHiGEbi9+u7nZ5SnljEe9PTptIQH1oyMGW1sfeAWAiGtSPsXuPrJ/6fPyn/9NAqh+KPbI+m1UjJ7bAF5nLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749589497; c=relaxed/simple;
	bh=kE+lkbDW2fkjWOPf0p+Xh9to5hHkH73htFiGsWeZSEU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tIWf0eZSlen3h1DTJ563FdgjErdSNHZXK2MpqQTf6I8lZCGtzAMTXcN1mixGpEw+22o3XJTBRiJR+nhI5yRaJ/b6OJhiGaYc46WY1nlszKVumOomRktzuIB5WVQ1hU5PkWUlzPXX55ORnVvFDxbT4us7R2ryBOWhr6KIu90gooA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MiheBHYp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AIPqIp023670
	for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 21:04:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1g1rTZa3ADy4dw2FlA/nSkUedBUIBJbaSuUbI/8Z9Xk=; b=MiheBHYpuxVWeC1y
	i9RMldHzII+b9U5HWguHfcYiwWJDg9CO6nAkIVTDPsUhlw24nSTlzUT4gUN/fBPF
	iTBvZoVHzUpUmTGFbOHf0FS5vBg3/ga1K0v/5K53Qxl5KFXJwk3ogHNcKocNnyYC
	XNoaN8keTOsteV5wrPtGBL/xjTUpS7tjdQqYXZGx1iP9BKC/OBJd9QC0UE8KpT2W
	r5ZQlAwafYNmycRjTCP5lE74vzDCxkKZ+v6C2sP1/Tfd++G2RAxuGP9w8wasbwlo
	cdWeqGbk1gLFHV5dQsuo4C/w5bw1VlMM8Pf+ZTFYM+MIqpTfNQZ+riQhtQFFkm4M
	dLP5jQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474eqcjryw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 21:04:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d094e04aa4so118970585a.1
        for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 14:04:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749589494; x=1750194294;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1g1rTZa3ADy4dw2FlA/nSkUedBUIBJbaSuUbI/8Z9Xk=;
        b=exGE9z0qccaxKN9cmKubCC8OkSDbD3erQFqhjajU9ybSR8gA7stPaJHiJf1+um/Jt/
         Iw333XmqBKPxqaYgbGwcqFQIcXj+nDtgMRbj+h87gh8X98AUH8YLXhdmAN9l0nk9kkwY
         Lk8Bug7fQw1TXlaUf5px2wFgNYEr7MNHMbxu7KnRwnfhepEMSooJbYJXXYjoJ4yqCvob
         eB1admDOs3QN9zg1f9DAywMqIeGodApzVLPqyobaPRPKNqcdcamGQGRLo27Z7njKNCSh
         t/zqk8+v4xc7AUJIjKK5hLIxeDC/41dd/jWqBZ1c2sJcjc0BR1qlOU4juh0B4eem272Z
         JMbA==
X-Forwarded-Encrypted: i=1; AJvYcCUWR9/xcd7qm6oIfU3uT1oX/mOGv5OCtYOfhevzS2/fFTC8s+mGJN8yE5KevGKcsExjnN+eX+afLjTszQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOsXKJh5VDNcWLetIe4vEfyXt4Y7Jfu7Jtjmeg9Ayu0TWjOsx+
	uEFs6hdbHrZvWuR9NBOqc0cAA7V+TQlgnC+o5Qr6TOVvuBAKy5w02mpZdQEhomwVTxnQclwP2qA
	BC8rCEnTkuUMmy2vCX7jfgWb4dkb3dU30tW9vn4BoUyS2xnM6dOxT2rG0gwgDFJxqzQ==
X-Gm-Gg: ASbGncsjNGYEwCSN3deJiqNp5nmvtn/WK7XbLyyfAx4uXg5qM6iTS+f1Fij4SvuqPTR
	PGiV3gi7eozuZEz4mM7RDOgXbRMKevIsFZ6PUdsp9wFDSRQ07XT6oaj34Ei8J17s4pdMwMANuQR
	PdoM0nsxS1oFsPBN1L8ljXKVHE+3oE0vOV5clzcezoBI/HFbpgTTdhDlQRFVViJFzYwb6D9Gbw0
	WR3IqvNhSMwQYFcjE8/pVnPMcwwbJRaC0QUVMwLWZ34SqK5M5aTj7uOEsvThClAETtTp32Vtq05
	cMEUtVddiW6rnLKR3JCJIhDmNE1Ay6/czZB3y8i0lqKq49ZRBFd9VaAZr6DrXM0IJo33ebeDIbi
	0Zoc=
X-Received: by 2002:a05:620a:1d0d:b0:7c5:9ab7:3012 with SMTP id af79cd13be357-7d3a882c6b4mr39699185a.11.1749589493851;
        Tue, 10 Jun 2025 14:04:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZfc7T9tNgx+yBsZQ9oxjOn+p/Z6msmA25Rm7iZVLz1xrwLf9jLrAJFTWkr3OPcdsW2xSWnQ==
X-Received: by 2002:a05:620a:1d0d:b0:7c5:9ab7:3012 with SMTP id af79cd13be357-7d3a882c6b4mr39697685a.11.1749589493347;
        Tue, 10 Jun 2025 14:04:53 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-607783c0528sm6771458a12.43.2025.06.10.14.04.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 14:04:52 -0700 (PDT)
Message-ID: <6bbd526c-3193-40c7-91be-e629949dca8a@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 23:04:50 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] arm64: dts: qcom: sm8550: Add support for camss
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Wenmeng Liu <quic_wenmliu@quicinc.com>, rfoss@kernel.org,
        todor.too@gmail.com, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        quic_depengs@quicinc.com
References: <20250516072707.388332-1-quic_wenmliu@quicinc.com>
 <0367d5bd-a42e-4b6c-b841-ba20190b3127@linaro.org>
 <dc4720a8-2f15-44aa-9a52-8440c7518328@linaro.org>
 <739bad1b-f26d-44a6-9cc1-eee28023474f@linaro.org>
 <dc82457e-de2b-43ec-a50c-08f7d8bdeff1@linaro.org>
 <1883d9d7-26d4-40b1-9848-ae0477cf95c7@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <1883d9d7-26d4-40b1-9848-ae0477cf95c7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDE3MiBTYWx0ZWRfX0pQsGeGuTx7B
 e/fVXHwQzLbfLPHpyL5dH5DeIBJnz5QrW2NzaBEA8qnfBrC6jOIPfqQLhNZxFZ3SqgDreTDuivM
 9s1Il8dv/Hyy8+vcNP8GRC1/NVJscIPewdXr/FhVQo0JAjbTf//JX33ef+XSNJX4oRR8hTshV0Z
 vBLu/3bHKjZX4T2EmWYLrEsukhk8xf17mZOuXdHl+gyAnMwd9csGKGHhxfslURvdsm/uc7L8Lsn
 PdVTdpcxvaYiYpkWjIro++VY7/GvtG52pTAie9g4lq9mcm6MRX/2/yzhZoFy/dYwnCxKz2F9mGq
 qubRpZlbUZCLzALgfT0lPnOUe7xGnuou38GX9m5YbV1AY0eAUrIVPOBbABFLDyqfZ4pYkIAIYF6
 J9y7CvMpzFUHx0iY5ELnDesX0hiQjqpyPB6rw6zjTUfT8jsBQhCjt3qLUfpLcqH7sYgyAZIL
X-Authority-Analysis: v=2.4 cv=Q7TS452a c=1 sm=1 tr=0 ts=68489df7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=BAsi0iANeLLsmxwWO0gA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: HaGMtyB0V2bRBG0XFFFwW9oRnL-p7way
X-Proofpoint-ORIG-GUID: HaGMtyB0V2bRBG0XFFFwW9oRnL-p7way
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_10,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=930
 bulkscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100172

On 6/10/25 11:02 PM, Vladimir Zapolskiy wrote:
> On 6/10/25 22:02, Bryan O'Donoghue wrote:
>> On 10/06/2025 13:49, Vladimir Zapolskiy wrote:
>>>>
>>>> List feedback from DT people is isp@ is the correct prefix.
>>>>
>>>
>>> My bad, but I don't understand this comment, it seems irrelevant...
>>>
>>> The expressed concern is about the novel label name.
>>
>> I mean to say the feedback from Krzysztof was that we should use isp@
>> not camss@ and I agree.
>>
> 
> Let me repeat it thrice, it's okay...
> 
> I don't object against the properly selected device tree node name "isp",
> here I object against a never used and very questionable label name "isp".
> 
> Please feel free to ask more questions, if you still find it confusing.
> 
> Again, I may missed a discussion about the need to get and use a novel
> label name, then please share a link to it, it'll be very much appreciated.

To hopefully help out:

label: node-name@unit-address {
	property = value;
};

Konrad

