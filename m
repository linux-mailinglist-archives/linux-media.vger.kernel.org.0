Return-Path: <linux-media+bounces-44687-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 18473BE20D5
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 09:57:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2C27D4EF706
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 07:56:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C08F52FA0DB;
	Thu, 16 Oct 2025 07:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F6bmnbrS"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF2B281370
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 07:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760601404; cv=none; b=oyAsFDkTpX3x3Z54RGUqkc4TN6UHALEK6crk0b2I/bpPezAvjbZHvyYkcP9XpWAcVYjWE/ATUiLHHcfMZDWxTfIUdj68jKsbq/MYXgp3ybuFWt4GV8r8lTSugCn5vIz0Ir8wmaVchWXIRoXQMy1sVdWlcWAkAoSGGhhY6VkXmts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760601404; c=relaxed/simple;
	bh=Jh1z2qwS+DdEu4z545f3xi+xVgiwgZciXQlB+qgqp6E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QsYIdpMP/i5pXwghILk6vI1TgDM/MrukONBNDT6swmQcvkDT879M9hw0NlwyTu+inVCITU/M/chnsfU/8Kx4+nEDm6VbmmfBlEmGMDh/O2AvU+MZyhmnUIukPWRprUT+xKGthfDM4NYOX3LKERfjP6opMk3Td3AYnNufFGPfd+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F6bmnbrS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59G7f62W003457
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 07:56:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u4HgNC7aJrqDGVyNBmRY6dlyNS/Fi4BfzYUKhOJfqN0=; b=F6bmnbrSrzGPZ0Tf
	Dp1aRK2t/IlRZOCD9IFw7m5t1ia7V3sdnJpne5pfBMgyHE1e+SwRZEpPntd+OZA4
	1QDGc7OtFosRWbe5dV1ZKMQZdt00Ix0+qTQKl1aitCb5RmM4n3MDfbcI9rF/sKTk
	QwFhT+64/cjG4HPcJtkJelCWeX+sgUtsYVKbF4SID29AAeJ+YjDJTsDS4KYZKj/G
	m4kKjpVLCEUI2E1JNtzXPnh35eR4J+RxsrzcYqd7ofopnMt6NemwhzESrUVshhQI
	9klBz0BKLsSqE1Dp5jIkbZ7TcmS4jkLYWIxPggoMUW+MKDJZEglkwIHdXGfxPL//
	itzVlA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfa8fh7q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 07:56:41 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-850553dfef2so1919436d6.0
        for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 00:56:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760601401; x=1761206201;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u4HgNC7aJrqDGVyNBmRY6dlyNS/Fi4BfzYUKhOJfqN0=;
        b=j8Yc2s01sS2UEZSYaU0Rp+XU4YQu3ZK/JA68CoONSe7ljlSIg6pSMdA0Mj+Ofztnq7
         n+iadyO/s/s0u77SINnSPd7f3ChXOdT6kCpMQmksz/n5SbDRMRZNtSO5GgzfJx2wBKlA
         QopSm+PuJcWwY6Y/T51rjgJnkipfmDTUizODbpUFOpA2S5JkLWeMxIa9HR60K8fQj/li
         h8M+k2qVE2xLCpXz1WoX8ErfBWzoPP6D5ziFP1vapDUR36/27EbDx63SGIZWyRaUqcZy
         3l/yvfBLufSBFb5mPnRZ5ucGvGpZOKFlrcloA0FIJoI3IObyRXaBuQRgiw6QQOLqag/f
         1aUA==
X-Forwarded-Encrypted: i=1; AJvYcCWif0rTIh/JAKvyTv4WWZFCsPrFtA6ExL70kLmDP839sMc2lfJYFyhWCyNPM8vSr4njgWJptky49b0j7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYYDY58mwjFvatUm9ZvbZEPPqkHKseFFuocbL2tTOwm9p+Xqu6
	4sKkghmic/WQ5WplSM3rukK7OzIDnNNY6kjF9W1Mh7yzN9tKo938tWrP17+trWttzXpoNXsSoxu
	N3kJor/uqub282gBn0tJXaIzzwXXovWQ/qi8srIkHd6HUwjyFg3sZbTYBH6wa6jrXcQ==
X-Gm-Gg: ASbGncvu7F68bmrfdKqVDh34hJrXeB8PPVkYtVEPG1UBWP0r/x2d/l0VMuMg8aS9424
	8sajDvQhCkGZcBXEAmHJ1BYx4JQ7/tWbmAs37w5IA4Cl1x+cgJdhZtZKmXjyhwQdXEq3pDfCxCZ
	pZMj5LLtKTR5ce7qMuRDxn//Vfbl8sYMzVhRYlYGVz4IOHifKV6GEgEOT83qeVdH+BNqfWh20kl
	bqQsKC7IpBlfdiQ2XWaEy708sf6Kyy2RwZnWt8CRg2yoxCpXtme+5DW6BylCxf4dUitCvUccisV
	bRJ+/060KFNNKOYygrksxGOTwtonAsPifPAkFLZk9LTBmVbPLxiM7sxJ9JkSEo4PkInKjcUbQlW
	CvSpuGCwgrEJ+uB8cKAeRQHBt+UjXSLnH+AbwG7UHjTm93u8h03xl/cJV
X-Received: by 2002:ac8:5f14:0:b0:4ce:8b2e:feaa with SMTP id d75a77b69052e-4e6eacc8772mr273177411cf.6.1760601400661;
        Thu, 16 Oct 2025 00:56:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVX7ZQEtzFyJmnhIE9yt6cHr2wIqLsibKBKtjRREvjjvyyBcO5SEJwCNH5bR44oCWeIBhpyQ==
X-Received: by 2002:ac8:5f14:0:b0:4ce:8b2e:feaa with SMTP id d75a77b69052e-4e6eacc8772mr273177161cf.6.1760601400213;
        Thu, 16 Oct 2025 00:56:40 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63be969163csm4142038a12.13.2025.10.16.00.56.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 00:56:39 -0700 (PDT)
Message-ID: <abc9d825-1e98-4838-9e9c-ca18ba191e11@oss.qualcomm.com>
Date: Thu, 16 Oct 2025 09:56:36 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: i2c: qcom-cci: Document Kaanapali
 compatible
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251014-add-support-for-camss-on-kaanapali-v2-0-f5745ba2dff9@oss.qualcomm.com>
 <20251014-add-support-for-camss-on-kaanapali-v2-1-f5745ba2dff9@oss.qualcomm.com>
 <e2c43a8c-a9cc-46a1-9ddd-5d6dfc7e917b@linaro.org>
 <49eaf7ec-ac71-4bf3-9a4e-25fa633d815e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <49eaf7ec-ac71-4bf3-9a4e-25fa633d815e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: hwx7A07M-zbGbV6lcmJSRKY-dLSIx418
X-Proofpoint-ORIG-GUID: hwx7A07M-zbGbV6lcmJSRKY-dLSIx418
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNyBTYWx0ZWRfX6v+AjccEitN0
 FRtQMVnYeZo/V9uIxQy6r89S06ClYnf+hkK2/fXJ+86xODYgpgDd+QyhD6orkAV7XqqGVXjJf2I
 L8FMys+PNjKQdy/hQcOCHJ2eAiX05j51HXIAfShIBXVfylIypIQVaa02h/t87DwjHlk8ndlnm9J
 7G54vp2AHMVp00SuYFmIZ5NEXJpAT9m2kx41SEicK3/2YrCRIiIGSM6SXgiBnXa3L4qKUneDWML
 maDnHA7x2yJFBevBiuxP80Bc2YIGhjd2QQPZFfPt2iZc8lM8Pmjpi33oa/ZhEFGHEzkSHlyE653
 rXuLz3Hjry6WUd3/yARJhnviqvzKbUFmEAttVznpB3wu2l6EPzKAHR41SqA4UEHjV2xvyKFSiX7
 0k5JMuL1EWeekjeeB98/QoVX6bP5/Q==
X-Authority-Analysis: v=2.4 cv=JLw2csKb c=1 sm=1 tr=0 ts=68f0a539 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=UKwaH1GiQmKLMY0bYhoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110017

On 10/16/25 3:56 AM, Hangxiang Ma wrote:
> On 10/16/2025 3:30 AM, Vladimir Zapolskiy wrote:
> 
>> On 10/15/25 05:56, Hangxiang Ma wrote:
>>> Add Kaanapali compatible consistent with CAMSS CCI interfaces. The list
>>> of clocks for Kaanapali requires its own compat string 'cam_top_ahb',
>>> aggregated into 'qcom,qcm2290-cci' node.
>>>
>>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>>> ---
>>>   Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 6 +++++-
>>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>>> index 9bc99d736343..0140c423f6f4 100644
>>> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>>> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>>> @@ -25,6 +25,7 @@ properties:
>>>         - items:
>>>             - enum:
>>> +              - qcom,kaanapali-cci
>>>                 - qcom,qcm2290-cci
>>>                 - qcom,sa8775p-cci
>>>                 - qcom,sc7280-cci
>>> @@ -128,6 +129,7 @@ allOf:
>>>           compatible:
>>>             contains:
>>>               enum:
>>> +              - qcom,kaanapali-cci
>>>                 - qcom,qcm2290-cci
>>>       then:
>>>         properties:
>>> @@ -136,7 +138,9 @@ allOf:
>>>             maxItems: 2
>>>           clock-names:
>>>             items:
>>> -            - const: ahb
>>> +            - enum:
>>> +                - ahb
>>> +                - cam_top_ahb
>>
>> Why is not to give the clock "ahb" name like on QCM2290?
>>
>> On QCM2290 the macro in front of the vlaue is GCC_CAMSS_TOP_AHB_CLK,
>> and name "ahb" is good for both, I believe.
>>
>>>               - const: cci
>>>     - if:
>>>
>>
> 
> On Kaanapali the macro has been changed to CAM_CC_CAM_TOP_AHB_CLK. GCC clock domain doesn't manage the AHB clock but CAMCC does. I think it's better to create a new and more complete clock name to denote the differences between them.

Are there any other "AHB" clocks going to this block?

If not, then this is more confusing instead

Konrad

