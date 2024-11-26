Return-Path: <linux-media+bounces-22074-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD7E9D94FF
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 10:59:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32D3F283850
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 09:59:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D05EF1C0DF3;
	Tue, 26 Nov 2024 09:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MS8n1N6j"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8917D299;
	Tue, 26 Nov 2024 09:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732615143; cv=none; b=KvkTTJZQtHYVrilTk6cCID2t2a3/NJVTj7/eaq120sEk0hAD+DBDfij3PNoRNEcgM6Dz2Xe0F3NjLMxf8AyEVZbbvfriO8jpeplSzjcg1cHdAA2HxMDonj0/cV/Yej3T42Szp01GsdMcrUFvbZUO7Kwkwj0xHj8tbRa5GROes2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732615143; c=relaxed/simple;
	bh=rhzDH6KzLWPOhL4CFQV61M9KMJ4jZ3wyEtKUmIrvtRE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=dEU8IaoKCd+tcvIA7jXC2jcEScFsRDmUTaZvchRN8ySaITCGFiUnta/k8lmmbKpCtdYYrY2ibITnwfpzJs0adCGExtB6Vhs0IQhyUaLPYuuRx+Hf8+j0yYojG5UyRRgsl3YkrTwWO0qE10yiOhxkc0qX6YFOY1BpaTFObyg/Tto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MS8n1N6j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQ6UTvU014356;
	Tue, 26 Nov 2024 09:58:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pbeGuH3sV1nN8azGWqqLhRhIUbAbRBbO5DA3gsWzfDc=; b=MS8n1N6jWQmOyJjR
	MFcw7Icmh3HojVb/77/5kIibbYP4oeSzHYAUWE6dCBNTxpyze2K13sLbCAEnhU0D
	Q7Hm9EcOM3gsv7cOjB660eCkknnxLd+kO88MYlvJGWkWSq36GeI8vfBsNWsA4UqW
	tT5d+mwTPFyBMyzDCE0P+ogVxKeSq+fdcjQyEL4llA7ocTgY4/OSFnARAhuVk6wr
	E5Ja+CRDhDqcI2Ha/ZPTtgaWLNqeTQj/qRCmexS1nVB3AkW2rSgt0yXss/o5Au/R
	MuJ6fN73yLNigIlBkoTL/U7+h2zye/uDdwK64k9nvFbJ7PnkZtOzBGUpBovN+yW2
	wbRtQg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 434nyg3sp1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Nov 2024 09:58:57 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AQ9wukC027517
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Nov 2024 09:58:56 GMT
Received: from [10.231.216.103] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 26 Nov
 2024 01:58:53 -0800
Message-ID: <26353cfa-5c74-4b80-933d-f719b0d4f738@quicinc.com>
Date: Tue, 26 Nov 2024 17:58:50 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindings: qcom,qcs615-venus: add support for
 video hardware
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>
CC: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_qiweil@quicinc.com>
References: <20241125-add-venus-for-qcs615-v3-0-5a376b97a68e@quicinc.com>
 <20241125-add-venus-for-qcs615-v3-1-5a376b97a68e@quicinc.com>
 <kdyhkb3tt2lgfuopz7twxjwpfur6vuezaqlc7s7aozkz6ek2as@m2nvqcb5ww4u>
 <7df4fded-8c20-4562-9a18-2a122733dfae@quicinc.com>
 <d11866a7-0d43-4da6-8bee-d72b3e0649aa@kernel.org>
Content-Language: en-US
From: Renjiang Han <quic_renjiang@quicinc.com>
In-Reply-To: <d11866a7-0d43-4da6-8bee-d72b3e0649aa@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: qFnV917sCkiK4lB2Ff2IpqbF-J-ZVL6N
X-Proofpoint-ORIG-GUID: qFnV917sCkiK4lB2Ff2IpqbF-J-ZVL6N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 mlxlogscore=999 clxscore=1015 mlxscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411260079


On 11/26/2024 5:34 PM, Krzysztof Kozlowski wrote:
> On 26/11/2024 09:57, Renjiang Han wrote:
>>>> +description:
>>>> +  The Venus IP is a video encode and decode accelerator present
>>>> +  on Qualcomm platforms
>>>> +
>>>> +allOf:
>>>> +  - $ref: qcom,venus-common.yaml#
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: qcom,qcs615-venus
>>> Please extend sc7180-venus.yaml instead. No need to duplicate
>>> unnecessary things.
>> Thanks for your review. But I'm sorry I can't get it. The devicetree for
>>
>> qcs615-venus is in qcs615.dtsi. I'm not sure how to use sc7180-venus.yaml
>>
>> instead.
> DTSI is not relevant here to the bindings. I don't understand the
> problem, so not sure what you are asking here about.
The opp-table parameters are different in devicetree. Can we also use 
the same yaml file?
> Best regards,
> Krzysztof

-- 
Best Regards,
Renjiang


