Return-Path: <linux-media+bounces-22060-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C02C9D91A8
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 07:07:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D679B166B21
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 06:07:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 140F51865EB;
	Tue, 26 Nov 2024 06:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="X9H8PKkD"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91C2B67A;
	Tue, 26 Nov 2024 06:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732601244; cv=none; b=pLrmbi8qZKxV+miPy/6ZrI1oI0+Uhlnyo3oripwcOsfWb68R/ZCYSjYfuwvh9/da8GDR7FerFOBQcBtzDd+sZSCt02Zkz6IAMmH8zgUIdrfgqWDwhw0LwnsBtMNbUzg195yYQLpriMLEBwGunyBwIqNLw3qIGumm5A9CZUsLnE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732601244; c=relaxed/simple;
	bh=+HWrRkTdbjhxXG0xXMS9wmlqvxmySwdEy/T9nnHsPmk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=k4DYukmeXb4DgJp2OXnbzUoCq1tU4rILjE6tXh6XP6XHitrnQbI1uaqD83dIO+iEvUEuaiR4gdhwqFnAXISoPeYWs1JHm4Gz7Kx6sYd2CW3vy2XSs1MRl3rwHyrBSzOaqL1IeCjQLbqAvqrWttrSxmTKjh7J7cz6K9eF9uL7Cek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=X9H8PKkD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4APF3THu010588;
	Tue, 26 Nov 2024 06:07:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SDRfD1QZZfOjdKgfjD6syC3clpJjQUFoRuZVkQlNyB8=; b=X9H8PKkDDllM1otl
	+p6OIvMOhiDG3KfqCRAaLZWEBFd3qEthGNvs7/2mPL7ZEvXU+HTpKlD2cPkwrOOT
	1q9FPKG9wsgb7XHzFe/IPA701u5t+l4kfj9NuGiL8HRV9dBQzF9nr+yzE+9JrmUV
	DW78f8ibPTicgwUzx+6HW17/4yWF2p7JK/JIuRro1Y7siLu6GLFMewE9UfXzuI5A
	vE2Y9ab9i996lHhaaw64aQqzCEJX7MuJj6rHJhZT0fPF8djwrVyYjkyUigi4d8eg
	lFGyh1GtXHCuql/HEfyRDCxXTJ8+9EJQCV4LPzOAejCHkIx41Qwyz058/1msgGXe
	hJpcaw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 434mx739wt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Nov 2024 06:07:17 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AQ67GCS011333
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Nov 2024 06:07:16 GMT
Received: from [10.231.216.103] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 25 Nov
 2024 22:07:12 -0800
Message-ID: <8c60696c-df14-4300-8a92-59eb134a96d2@quicinc.com>
Date: Tue, 26 Nov 2024 14:07:10 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindings: qcom,qcs615-venus: add support for
 video hardware
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        "Vikash Garodia (QUIC)"
	<quic_vgarodia@quicinc.com>,
        "bryan.odonoghue@linaro.org"
	<bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rob Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor Dooley" <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad Dybcio" <konradybcio@kernel.org>,
        "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        <quic_qiweil@quicinc.com>
References: <20241125-add-venus-for-qcs615-v3-0-5a376b97a68e@quicinc.com>
 <20241125-add-venus-for-qcs615-v3-1-5a376b97a68e@quicinc.com>
 <jovwobfcbc344eqrcgxeaxlz2mzgolxqaldvxzmvp5p3rxj3se@fudhzbx5hf2e>
 <18cc654b4377463e8783de0b4659a27d@quicinc.com>
 <474cef98-4644-4838-b07c-950ad7515b73@kernel.org>
Content-Language: en-US
From: Renjiang Han <quic_renjiang@quicinc.com>
In-Reply-To: <474cef98-4644-4838-b07c-950ad7515b73@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: TNsundR9O5LDhgsB0fZOALBLJ2OuwCdd
X-Proofpoint-ORIG-GUID: TNsundR9O5LDhgsB0fZOALBLJ2OuwCdd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 mlxlogscore=856 malwarescore=0 adultscore=0 spamscore=0 mlxscore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411260048


On 11/25/2024 11:55 PM, Krzysztof Kozlowski wrote:
> On 25/11/2024 16:49, Renjiang Han (QUIC) wrote:
>>>> +  video-decoder:
>>>> +    type: object
>>>> +
>>>> +    additionalProperties: false
>>>> +
>>>> +    properties:
>>>> +      compatible:
>>>> +        const: venus-decoder
>>>> +
>>>> +    required:
>>>> +      - compatible
>>>> +
>>>> +  video-encoder:
>>>> +    type: object
>>> Both nodes are useless - no resources here, nothing to control.
>>> Do not add nodes just to instantiate Linux drivers. Drop them.
>> Do you mean I should remove video-decoder and video-encoder from here?
> Yes, that's my suggestion.
>
>> If so, do I also need to remove these two nodes from the dtsi file and add
> Yes
>
>> them in the qcs615-ride.dts file?
> Well, no, how would it pass dtbs_check?
>
> Don't add nodes purely for Linux driver instantiation.
OK, I got it. I'll update like this. If video-decoder and video-encoder are

removed from dtsi file and not added to qcs615-ride.dts file, then the

video decoder and encoder functions will not be available on the qcs615

platform. So I think these two nodes should be added to the

qcs615-ride.dts file to ensure that the qcs615 platform can enable the

video decoder and encoder functions.
> Best regards,
> Krzysztof

-- 
Best Regards,
Renjiang


