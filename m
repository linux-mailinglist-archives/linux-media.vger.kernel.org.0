Return-Path: <linux-media+bounces-37416-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5824B00B37
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 20:19:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6EAF178C69
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 18:19:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A69F526A0F4;
	Thu, 10 Jul 2025 18:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pkh1zhwK"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8122F0C54;
	Thu, 10 Jul 2025 18:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752171537; cv=none; b=ornqjdIeADG9TFtV8pasd8/b+zZf/6j492mVpf4Tk9hkoqQTXJncU7vTkvO3pPN7n2dHCezyA2epqGykA2hB+oywFXKb9cJlb251UabCfVzbQDGCV8mL0NNJnbDXap9swhSTt10jMZckAfhrUzhX9jtPe1IKWoihMcZTRYPPjhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752171537; c=relaxed/simple;
	bh=/PoKgN7L/oEDs9WP4ITeQXy+0FOs46ud96/JHlIiRUk=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=QiB5lXzz6Yw8luhCzTqEMC/G8Qvy4glGNhVTiwRbBsyKE8aIk9K6+SD4NkgMVRCFuXKeS4ZAVkrNAJJZASRl+Mzf5ulGL3A44qKI22vqPkZ9vGx92J1tkvqyj2PP20D9Uv/FVMDiXK6LCbO3WSTFucH48xu/zNSM9+JaOXGPokM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pkh1zhwK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56AIEWmt012568;
	Thu, 10 Jul 2025 18:18:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	78QUllCMI4AMJSRsHmpiPNn8A+Q9bzfePHc6Gm7/eWI=; b=pkh1zhwKF+IDL40F
	lA81yL2RGtQ2DmCOBWUZverVSYPROhZIGLghUIZ4B/QZFj7L+mEPxIA8uSVL+IFu
	1syj7+KgfG6ZVhDBpFKBYqW6suPaBMaPslTFpu0iCjYS1VdAsbJAzdsZF+hZT3FN
	3KWlzi9+NuWVXjtSEPE+94yDxGPzRg5jfC+a7YELvGfeRF9sW8GT4d0tKzKZtKEj
	jCqVqpUAjQPwvP/Uy6iJWjN1KXTaxi8UE2jDLgvpMVUsadJpAJUB2tqHUW3mM7JH
	G6+JhlpKc/hI/3QxMnKlQd+Y4jKE54y7rmJbQuUALTdEAcJn118W85L5fCQp7Yka
	pWcmxQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pucn9f5u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 18:18:42 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56AIIfHs017308
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 18:18:41 GMT
Received: from [10.216.56.238] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 10 Jul
 2025 11:18:36 -0700
Subject: Re: [PATCH v3 0/5] Introduce "non-pixel" sub node within iris video
 node
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski
	<krzk@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        "Dikshita
 Agarwal" <quic_dikshita@quicinc.com>,
        Abhinav Kumar
	<abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <7b6db4fa-2f73-376d-4eb3-64c1c7e6cda3@quicinc.com>
 <f5ebf0d6-2f0b-45cc-b99a-b786e5df9edc@linaro.org>
 <5qsgbqml367yq6g5vb4lotrzulojqhi5zlwwribze373a63qrn@rxi4kwyt66m2>
 <4f38058d-a2f1-4ac5-b234-228cfb2e85ff@kernel.org>
 <1ad2ca1e-1d57-4ad8-a057-ab0d804f1d49@oss.qualcomm.com>
 <7da769b4-88e9-401f-bb21-0ff123818b9c@kernel.org>
 <6840d462-8269-4359-a6e5-d154842b62db@oss.qualcomm.com>
 <af0da28c-3ca0-41dc-aaa4-572723ea74bf@linaro.org>
 <klhvgzizub33f46buqsog54wqksqp24a5tijwyv355l2ao2imo@wdkojfebc6s2>
 <e1a6e75a-2a5d-44a2-8bbc-140eb86d1806@linaro.org>
 <2hh3zkdwgqbdurpr4tibr3gjat6arwl3dd3gxakdaagafwjdrm@aj5em4tbsjen>
 <6c6f6bc9-7c34-4961-8b5e-e6d02c4b2f6d@linaro.org>
From: Prakash Gupta <quic_guptap@quicinc.com>
Message-ID: <25c64712-960a-50b4-e7fa-398e4bf809ef@quicinc.com>
Date: Thu, 10 Jul 2025 23:48:30 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <6c6f6bc9-7c34-4961-8b5e-e6d02c4b2f6d@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=GdQXnRXL c=1 sm=1 tr=0 ts=68700402 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=17tGKeYD8DI9GCXtSyEA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: emuYZrLTj78SJd_U-lw-XG0ibRMxMzKh
X-Proofpoint-ORIG-GUID: emuYZrLTj78SJd_U-lw-XG0ibRMxMzKh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDE1NSBTYWx0ZWRfX4TnoPNuzq2UP
 dZw0fQWu4yx5CZPTSWz1HUiAcQgAXyFBSyI4ct87BbURNfpmNhwp9nW9aeBJXeF01zRkeYb4A0K
 zrnat24h1X24f7PU9Z3vwWxUcJjZn1x3GLVzaaq/1Os7e4t0urmgWMXxumiADYjdpLkuuC3xYBq
 /Aat+QkLM/+zrGSMVa4Po2TPe0oJ6zU8iRPVlmB1TENFP3Zc3xN2s3Fb8Pqtq5m8IeZACKL2esz
 BaEDCSZ6pLnwKg5vpA2y6ZS139GWVQzp8yj4t85yrHXQPUYKu4Zeysn2IgbJmxJADfLAlWyZD0H
 7OLZKQqrsvz58DAVaZvtcnQIIdDe69Oxys5FLrreh4RWjDtRxY7GUmdcw2vKFs4ptDKkjI2O+xa
 FkeXQraACQ1qV9Bn9PsMyCmuMwQE7v82V6+ZKq2tdszRHR4n2Y5aJaCEzW5Py9h0iG4RAHkf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_04,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1011
 spamscore=0 suspectscore=0 mlxlogscore=875 priorityscore=1501 impostorscore=0
 malwarescore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507100155



On 7/5/2025 4:14 AM, Bryan O'Donoghue wrote:
> On 04/07/2025 17:45, Dmitry Baryshkov wrote:
>> What about instead:
>>
>> - keep IOMMU entries as is
> ack
> 
>> - Add iommu-maps, mapping the non-pixel SID
>> - In future expand iommu-maps, describing the secure contexts?
> 
> Interesting, we are _adding_ so that's not an ABI break and if I'm
> reading the documentation right, there's no hard rule on what iommu-map
> defines i.e. nothing to preclude us from encoding the information we
> want here.
> 
> This might work.
> 
> drivers/pci/controller/dwc/pcie-qcom.c::qcom_pcie_config_sid_1_9_0()
> 
> You can register your platform device to the SID map you parse.

I see few limitations with using iommu-map here, some of these are
listed in [1]

1. We can't specify SMR mask with iommu-map.
2. We can't specify different iommu-addresses range for specific contexts.
3. The secure CB support [2] would require vmid information associated
with per context. I think this can't be provided with iommu-map.

[1]
https://lore.kernel.org/all/85137a8e-45be-3bb2-d094-79754fa2a8be@quicinc.com/
[2]
https://lore.kernel.org/all/20231101071144.16309-2-quic_gkohli@quicinc.com/

Thanks,
Prakash

