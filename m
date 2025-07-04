Return-Path: <linux-media+bounces-36869-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF491AF9B14
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 21:15:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C7731C27D95
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 19:15:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07DA7219319;
	Fri,  4 Jul 2025 19:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LrmbKJUr"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B232E36F8;
	Fri,  4 Jul 2025 19:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751656526; cv=none; b=rNs4fQfwbYXqjvcJCdy9617yefoncdIpJqcioDo/e6NfmfZ9gr6nR3yFsEYdrYRYFBUWxULa3gJ16zoYdLYgDseo57BiNILMqBLc39GsS8n8s30N8Oa1ZVQEHBFD6sOvbT3S5jhilAZEA7cmDMJ8aD/OUATwCrSgijTJzD4Hiq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751656526; c=relaxed/simple;
	bh=mNnH1t+vegTyZzbkqwsJDZyZJhr/Yet+MLUe6KAnQjE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=YMZ+QmdQkmKBUCwnK1wubmXqK7YLenNd0Aad2nHFbhq8iDDh0LsX/1aSOtk47Y4gAGLknmsBGe9I/jfUSM70zT+CRKCxMNvlJ4u1NPvHCquapVp5+luoTCHhSWJKfnWzeIr8/Al6LvSwMr0EkoOC0t1oXPdGxUNmaUhFrODZO04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LrmbKJUr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564CmcUg032540;
	Fri, 4 Jul 2025 19:15:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eJkrtxquGm4nc96jYiWoWgXyryysi13MMYybC16+QMA=; b=LrmbKJUryRh+YYKK
	hkAD9QCC3fE/XvUNis+sXPyqb4lIygsHM1g33farSUTR1RsCMiUlDFoeA8u6gyQB
	x1mgWfnChRzAlpWA+6V3gdUl2md3g9LeavmXm7dGYTx8Zn0uEBExRYZfV761C4j8
	U2If71X6hBBUCvmvf/pkLS6KPsgTUgFMGIrBvL6mB/A7h5Bw1QH2d+TCIy37musQ
	UqLErGzdqNtXZWwHrA12Qz3LJ/7wFr0tsPYcI0TS5aKkogkIGs0A1w7mU468Mh+A
	lHsE/VfL/xmcL9c6mFsKc8ZGFKmDVvoF7fYD26hbshvE0UewTXkkaitiZlTngzqx
	bI+psg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63kn3ft-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 19:15:18 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 564JFHbA017747
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Jul 2025 19:15:17 GMT
Received: from [10.50.43.109] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 4 Jul
 2025 12:15:13 -0700
Message-ID: <85f62a4b-cec8-48a1-a232-7f904371e390@quicinc.com>
Date: Sat, 5 Jul 2025 00:45:10 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 0/5] Introduce "non-pixel" sub node within iris video
 node
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski
	<krzk@kernel.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        "Abhinav
 Kumar" <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <eab8d79f-7188-9537-9176-3e4d22f0978a@quicinc.com>
 <5ad418d9-8199-43c9-a477-1e3b939c054c@kernel.org>
 <7b6db4fa-2f73-376d-4eb3-64c1c7e6cda3@quicinc.com>
 <f5ebf0d6-2f0b-45cc-b99a-b786e5df9edc@linaro.org>
 <5qsgbqml367yq6g5vb4lotrzulojqhi5zlwwribze373a63qrn@rxi4kwyt66m2>
 <4f38058d-a2f1-4ac5-b234-228cfb2e85ff@kernel.org>
 <1ad2ca1e-1d57-4ad8-a057-ab0d804f1d49@oss.qualcomm.com>
 <7da769b4-88e9-401f-bb21-0ff123818b9c@kernel.org>
 <6840d462-8269-4359-a6e5-d154842b62db@oss.qualcomm.com>
 <af0da28c-3ca0-41dc-aaa4-572723ea74bf@linaro.org>
 <klhvgzizub33f46buqsog54wqksqp24a5tijwyv355l2ao2imo@wdkojfebc6s2>
 <e1a6e75a-2a5d-44a2-8bbc-140eb86d1806@linaro.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <e1a6e75a-2a5d-44a2-8bbc-140eb86d1806@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=68682846 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=P-IC7800AAAA:8
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=DVKtXGnjxsSMy4abO9MA:9 a=QEXdDO2ut3YA:10
 a=d3PnA9EDa4IxuAV0gXij:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDE0NSBTYWx0ZWRfXwmZZKf64Rrvb
 HEQ8QN4TuRHzs3LDk7rRRHtcesx1zr9Ev1E7nZ8cW9CWdZWuQwvy4MmCE//+VCsKYtUiAW11kar
 fW0kVDD1j7HoVCsKbm6DHt0XTv8m7GrLAOeoNW05q2pdMkrssH6froKR2UrBaS44Y2TXt+Evopu
 9LkaYCmJXxYIWP/WAqowesDCWf5btkG4efqXPU16i3mhX0c0PIPLBJm6a+AarRb9vIZjBYeD9n9
 SXludwYOSaMQudTB5epdn3vkUZcu9P91bZnW/H8DWVxr91kJRoMHgYOZWTBgD754MmMLEe6L3Dl
 dMvYWxEvL/iSsWSR843InbQ6W1qwjTeTshurlDB4zegab0aYTPcndhcXRgorNugv8Y9lNI940oH
 FpWQt3O/XPduxONPaI4AUHgrqgHTd/He4clRLPvhC4cnZwCa0E7f7YL9wXpfGNyRCbKHgDr8
X-Proofpoint-ORIG-GUID: QjYc8W1nElrbh5xRxxnddHjy0raO8AD8
X-Proofpoint-GUID: QjYc8W1nElrbh5xRxxnddHjy0raO8AD8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_06,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040145


On 7/4/2025 1:53 PM, Bryan O'Donoghue wrote:
> On 03/07/2025 22:23, Dmitry Baryshkov wrote:
>>> I still give my RB for the series.
>>>
>>> To me the only question is should it be applied to sm8550 or to new SoCs
>>> from now on, sa8775p, x1e and derivatives.
>> I think we need to apply it to_all_ SoCs, maybe starting from MSM8x26
>> and MSM8x16. Likewise, we need to think bout secure buffers usecase. And
>> once we do that, we will realize that it also changes the ABI for all
>> SoCs that support either Venus or Iris.
> 
> I think a dts change is a non-starter as its an ABI break.
> 
> So if ABI break is out and reworking future dts to allow for a new device is
> out, then some API change is needed to allow the driver to stop the kernel
> automatically setting up the IOMMUs, create the new device as a platform device
> not dependent on DT change and have the probe() of the relevant drivers setup
> their own IOMMU extents based on - probably indexes we have in the driver
> configuration parameters.

The concept of sub device is nothing new, it has been there for firmware iommus
on venus bindings [1] and i am just extending it for non-pixel on iris. So
instead of complicating the driver, pls relook into the existing solution which
looks much simpler.

The proposal to dis-associate from DT would certainly bite us in future when we
have more and more iommu configurations, lets say "qcom,iommu-vmid" [2], comes
in for managing secure stream-ids.

[1]
https://elixir.bootlin.com/linux/v6.16-rc4/source/Documentation/devicetree/bindings/media/qcom,venus-common.yaml#L50

[2] https://lore.kernel.org/all/20231101071144.16309-2-quic_gkohli@quicinc.com/

