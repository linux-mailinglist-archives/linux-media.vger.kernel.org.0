Return-Path: <linux-media+bounces-22975-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D125B9EA53A
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 03:38:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1CD112851B7
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 02:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3F0119FA64;
	Tue, 10 Dec 2024 02:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="U+w3bmb0"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3437082B;
	Tue, 10 Dec 2024 02:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733798284; cv=none; b=a56pPdXAwb7R0mLEQdbqfgczgovqoEv17iUJCE1ThSjwGixejaEXAE02A0OZLthd6LLMafP6SgGoWOC+NgiQ+CYYHgfdNXN1NW9fL6m6CTOxikH5jv2eA4CHzYWNNZzYqr9EMwHccaD7P/wcEtipcnlEf+FnkWObXSSsEUeetz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733798284; c=relaxed/simple;
	bh=IGKdE0OfiyS1U2dYlWNi53Kec8gX52AzHCqyOy0qiYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lFjoAD96O3pmEU+s3WFD9ZAI4v4wTg/V8j4KcPY/usnYuoYtbFSrazi1gRjMDCU2KlUbD8wEM74b1wAIrfxIRKV6fB1k0AEDmRiKgJl0olDrATB0NXjAnWGFF8xuyLcZ+eN0fz2Bj+/P5BgfGuINH6jbpKc7zdHS18gzomHfJKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=U+w3bmb0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9FdCJq014037;
	Tue, 10 Dec 2024 02:37:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GXzvNzx05NSvSGxrZei66rwZlGrKkS52BmFkcznQQ5E=; b=U+w3bmb0UkMr9obN
	b8O67aSOCCkfJLONzlAP4zkJb4k03ebTzWVcwGYVlUobC2OSI1x5gnIJf+05hmMS
	qVGyUpWxY+V2AXe2fpc+8w5WItvWhFs9fK4Bd30AAlIJ5dRigUQJEzwHy74GYoQJ
	h3TZr/HsOiWVxDWsh7mTU6MADO4X3uSd4FaIT8mP/WkFREJe30aPVCGfO/sdDArw
	CbokgMAtvaV/7cK9ar+N3zYAy7soKDS9L204Z7geKxU/GX5ZlSIlLFE6nP6eUYWX
	fkfyxuBC9yNyDXTcoRmFu5rBKD7SrTlFXBUpC5+FM+RwsM0/STdcLPKE7ZlDogF3
	Y4Ng1A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43dvyak1rv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 02:37:52 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BA2bpCG012407
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 02:37:51 GMT
Received: from [10.231.194.79] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 9 Dec 2024
 18:37:46 -0800
Message-ID: <fd8dd19a-a15b-48a3-ab14-9c63e617ed10@quicinc.com>
Date: Tue, 10 Dec 2024 10:37:44 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: qcs615: add WiFi/BT nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC: <agross@kernel.org>, <ath11k@lists.infradead.org>,
        <dmitry.baryshkov@linaro.org>, <konradybcio@kernel.org>,
        <kvalo@kernel.org>, <linux-media@vger.kernel.org>,
        <mchehab@kernel.org>, <quic_jjohnson@quicinc.com>,
        <quic_miaoqing@quicinc.com>, <quic_vgarodia@quicinc.com>,
        <stanimir.k.varbanov@gmail.com>, <quic_jiaymao@quicinc.com>
References: <20241203060318.1750927-1-quic_yuzha@quicinc.com>
 <1ca062dd-8910-4caf-a133-0e5717b43540@oss.qualcomm.com>
 <649dc6c0-f0e1-4dca-8f93-d0f81803cd70@quicinc.com>
 <7107275e-1ccf-4f09-ada3-e082833d9364@oss.qualcomm.com>
Content-Language: en-US
From: "Yu Zhang (Yuriy)" <quic_yuzha@quicinc.com>
In-Reply-To: <7107275e-1ccf-4f09-ada3-e082833d9364@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: tYWoVYZk6l9OiMLMSvoq3Jpo26fiH5zt
X-Proofpoint-ORIG-GUID: tYWoVYZk6l9OiMLMSvoq3Jpo26fiH5zt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 mlxlogscore=821 mlxscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412100017



On 12/6/2024 8:16 PM, Konrad Dybcio wrote:
> On 6.12.2024 4:22 AM, Yu Zhang (Yuriy) wrote:
>>
>>
>> On 12/6/2024 1:14 AM, Konrad Dybcio wrote:
>>> On 3.12.2024 7:03 AM, Yu Zhang(Yuriy) wrote:
>>>> Add a node for the PMU module of the WCN6855 present on the qcs615
>>>> board. Assign its LDO power outputs to the existing WiFi/BT module.
>>>>
>>>
>>> subject:
>>>
>>> arm64: dts: qcom: qcs615-ride: ....
>>>
>>> [...]
>>>
>>>> +
>>>> +    vreg_conn_1p8: vreg_conn_1p8 {
>>>> +        compatible = "regulator-fixed";
>>>> +        regulator-name = "vreg_conn_1p8";
>>>> +        startup-delay-us = <4000>;
>>>> +        enable-active-high;
>>>> +        gpio = <&pm8150_gpios 1 GPIO_ACTIVE_HIGH>;
>>>> +    };
>>>> +
>>>> +    vreg_conn_pa: vreg_conn_pa {
>>>> +        compatible = "regulator-fixed";
>>>> +        regulator-name = "vreg_conn_pa";
>>>> +        startup-delay-us = <4000>;
>>>> +        enable-active-high;
>>>> +        gpio = <&pm8150_gpios 6 GPIO_ACTIVE_HIGH>;
>>>> +    };
>>>
>>> Are any of these boot-on?
>>>
>> Yes, these are used wcn6855-pmu：
>>       vddio-supply = <&vreg_conn_pa>;
>>       vddpmu-supply = <&vreg_conn_1p8>;
> 
> What i meant is, whether these regulators are enabled at boot
> time (i.e. without software intervention). If that's the case,
> `regulator-boot-on;` should be added
> 
No need regulator-boot-on, it was triggered by the 
software(pci_pwrctl_pwrseq_driver).
> Konrad
Yu

