Return-Path: <linux-media+bounces-36033-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C3879AEA54D
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 20:24:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 765357A45EC
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 18:23:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8C052ED878;
	Thu, 26 Jun 2025 18:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hSBjJ3DU"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5624339A8
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 18:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750962257; cv=none; b=Ap9o42P58SbaGa1eA2ABd/eVYi+ZfT+J5Zqt3Wy3s0EFBv8yKhrOjtDc48Ry98DccuLWKu17aKCI3/jimJ44HyuOgK6HIhZ+/UHmdxuLfVJosAXytWJjY1QOf5bUWv9hSzcutO3PcLgp/w1iYe2Y/4jUh+3Ngbe7gvHQ43lpqWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750962257; c=relaxed/simple;
	bh=SEb7ufgzEXj8edBJyUUGHHko48ljKtRxkyisUqsSCAk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vAi78Ib3AlX5a39oCbc5UMxdo/aJsyytPFN3Eqr/B9kAb0H7n0AisDN/Wo6ZnEJWPuwqoFu0hH74M4KSnuAfppGx46Ej/ET/ep27OUr3gUshIVRMEpq5YyJrE2156g7SSh/UAzyD0EJatlrtqkSJ4CVC+NxnN4QFMTOwfxn5aG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hSBjJ3DU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q9lWL1008318
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 18:24:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SqrHJ7cfWfnQcM3hQMJMXiBTqi4dPan6flRx03S8nPI=; b=hSBjJ3DUYGlbVw4q
	HFPnYfSqIRfncb3Fig25cbaMZSncGiPtDRaGmUOl6GRBzXszLU8wrv8Fg7FciVsY
	7Q9gcgcAGGv28Vbud85ERBmTOrdWomtM/Zpib5Wk/gr8xkHBW7giZ544LOKmcwtr
	TwFrX1UnCNLcGhDo005G8fUxjGhmUQEEb8rhqkoNa2O6XDtLNx5FP+8vONUNS4+M
	aWkqi4kt/eo1BHM9uUtCcZWF0zpWi9pkEpCHzpetqo/pgl2FgAy23j3Mv4Vi3F49
	zqa2x1swjQ66q8Ov+ecjzqEfyXfmq+kUE8fib15jLS49k/FYFh2O2xt7bKVEmBbU
	AGiPBw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbhqtqm3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 18:24:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d3ea727700so17384085a.3
        for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 11:24:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750962254; x=1751567054;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SqrHJ7cfWfnQcM3hQMJMXiBTqi4dPan6flRx03S8nPI=;
        b=JaG/xslI0LxurhHwsezy63/Q6cC8/Xk6ylgEv9/qr/F0Jn8g7mi8ZqUTTWAsbiiWG9
         29XCLlBe+H9alcLSVJAQcYerldHXiKka7q7Thyp+rWGV320kGecqcIF9iZ3GMKrbm2lV
         fhuzmdaJbQOk5EbGtHgxsLxQ3iY9AcHNQOy0TWKZhqE0jwz5RvQPvr3mkeqblav4C0vQ
         J5HvxUpi4MvLrjzyDVEL7MV6IT/vtQ8J5ztYGHXIcFW9FcKrKiQeK6QTV8W7UaPa37x8
         8Z2sT+Q21uSnunj7BjpThvuEkTBQacokbwGF/IeHqIY/TByq1q1eck1+IIfOOIK5bUsZ
         FBcA==
X-Forwarded-Encrypted: i=1; AJvYcCXWNXQFXwDzDpvj55pSKCcnFSnDZ/gdj5C6suA00syytYKcd1d39hVS6dXSvnGIg3QGAwERpcOz2M6/iA==@vger.kernel.org
X-Gm-Message-State: AOJu0YymaZy3H1EI4LAh3V6HKizKEiTN1Aka5GyYK/iXWPidDtEZU/Gm
	vGTzwsN1I2/ZtTGsKlMRAHZqyslhs1cHDfloSCdjaF7SN1Pqg/EN40c5+bx0ZO/1Emk0miKts9X
	RGfl+rihLnFWzD0vpa4nRyNahLH0nYI2rG0RLDoGPzmAsrHmGa6ttymySAl8gVpFE6A==
X-Gm-Gg: ASbGnctqMIIE3KUSx+9+gkQVHoIpm3o6HCxKJYilTl78y5r65ZXAE3zQJIIhf8rYnn1
	88eBq4Bw+M4rBhCSF6Znww3c10RrmMbclTMnenBs09C0oqBN6Rd4oSQBFuqFKQ0JOpPGjTxnKa+
	QN6ni+da0GvEvZhn/mFEaDsQXUcxerxcn3w4h9E6BptZiKb8fTMHzffx1xtTv+BwVEs9uBCnW8h
	G0i9kdJr93eHJJCZvyMdhC8F7ZvxJSMPKcMhF1GpQ5oC1oFL7VrrZ0ZCPJ6Am7h3Iw+kfXIvkJ7
	/FXd3LCpzeEa4er8VYFwbh0KMsTMMvFMWHn9mW0NQO1snpmU8Retb4a7SC5qp9C+oIBfuUBDMKU
	8qMg=
X-Received: by 2002:a05:620a:28c4:b0:7c5:79e8:412a with SMTP id af79cd13be357-7d44390daa2mr30490485a.2.1750962253607;
        Thu, 26 Jun 2025 11:24:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeXgRbD/zpz06rGqRZPcG9OMXst6AVLMv8E1zNjKgi9yDWIHZ6FRqknPqbMJXd0Mnx0ebTew==
X-Received: by 2002:a05:620a:28c4:b0:7c5:79e8:412a with SMTP id af79cd13be357-7d44390daa2mr30487285a.2.1750962252950;
        Thu, 26 Jun 2025 11:24:12 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c8290e37csm323341a12.31.2025.06.26.11.24.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 11:24:11 -0700 (PDT)
Message-ID: <8680b702-7890-4abc-a4c0-49bce5a11177@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 20:24:09 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] arm64: dts: qcom: qcm2290: Add venus video node
To: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: krzk+dt@kernel.org, bryan.odonoghue@linaro.org, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, mchehab@kernel.org, robh@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, andersson@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
 <20250626135931.700937-6-jorge.ramirez@oss.qualcomm.com>
 <08e3c707-3b39-4b67-ae9d-f9fe65ad210e@kernel.org> <aF1YTmxF0pAVDFYe@trex>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aF1YTmxF0pAVDFYe@trex>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: OK4VRSRpfEL5wQ059kOkCQjH08Xysxjq
X-Authority-Analysis: v=2.4 cv=Id+HWXqa c=1 sm=1 tr=0 ts=685d904e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=kIY5E4sY9iMOqdOJmHYA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: OK4VRSRpfEL5wQ059kOkCQjH08Xysxjq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDE1NiBTYWx0ZWRfXyMHk/67rTbGP
 P5xgn0oAncJrfc2QT9g+rpomK2TUbleq9Y3hO6IqcPSAAeCkdGsIdiys2OrXrTy/NEwwMfNWKfH
 aKE92bPVXYUi03XTXIZKhMDfETl5WwhhBI7CpPdc5B3UDmXqQ0vSh2rnZd+0dg0INi+/9Epz801
 W0p94s+Q1OZAPa6OXLALBxfHlJ1vIuL986nP0HJY0tlaDhVrIOCKw9KiXvLvOxHWybblYH/IjaJ
 RbUnty3wPaj5pp77RxC4lRSl3F+jVmLa/iXXxfGlunuwHnbSeTkAUQNJ+ZWjg1vqYb0aZFJ4PiH
 r7TKB9VqZRU9DTcM7eySK2f0XNiOhTZDp144r88UACa4MwoNWY8TIvQQKpx0/PjCA6BPmCDm9Bg
 e+XWrbf7IPdV9B9XqdrvJYsdo00GpUYE4yrYA6awgNYQ9XgMbZTc5FlagZ9mrpp9zXGA6yVh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 mlxlogscore=845 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506260156

On 6/26/25 4:25 PM, Jorge Ramirez wrote:
> On 26/06/25 16:05:00, Krzysztof Kozlowski wrote:
>> On 26/06/2025 15:59, Jorge Ramirez-Ortiz wrote:
>>> +
>>> +			interconnects = <&mmnrt_virt MASTER_VIDEO_P0 RPM_ALWAYS_TAG
>>> +					 &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
>>> +					<&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
>>> +					 &config_noc SLAVE_VENUS_CFG RPM_ACTIVE_TAG>;
>>> +			interconnect-names = "video-mem",
>>> +					     "cpu-cfg";
>>> +
>>> +			status = "okay";
>>
>> Drop, unless you override existing node, but then this should follow
>> standard override-label/phandle syntax.
>>
> 
> yep

With that taken care of:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

