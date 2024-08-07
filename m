Return-Path: <linux-media+bounces-15888-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1D9949F91
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 08:04:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9BACB1C21800
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 06:04:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB717198E9F;
	Wed,  7 Aug 2024 06:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BFShzZMc"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7405C198E78;
	Wed,  7 Aug 2024 06:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723010652; cv=none; b=dGneq4mtfKBei6mnmVCezwKnz+waG+wQsxXSEehN50tl9MCcPwb4KzcDDTvZXIlHU3OkiuYncimIlRAynF/xev3NcYJYr/Vh8tlsQ59C0p9uHjnrbL7PqlsIad054/Mnjp5SvueFSmdWe2zJhz9gWcROttpZER5qfNvTcYe+YUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723010652; c=relaxed/simple;
	bh=jNT1Y6lkQc4Itm2Teu1Kw6JqtRSBVkYw1kHk30Bs1Bs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NKuwjBS7lIN8Wh+cixkvUQNk3xE+mPF4/rh6/TkuwnsJZxnRClPVgHMnub2gAT8sHx1IcT3LdUv7R5KQRE+ZOZFYBihqVinyBocUmrx+3bwSe2O/DwTiocCuUmDEWSLK1EMc8MyYLFyoKWPj+WUxViXBUctpG7COy7F1UgS/q88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BFShzZMc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 476H6Ph2026262;
	Wed, 7 Aug 2024 06:04:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vOubQWXsTtp8bu2FyujNtbnj+HXnWyPU6bPLihb7ccA=; b=BFShzZMc2Pp/Dnki
	xP/9yZgCzGaNUX1rZqJI9Ki0oSKmMBddcNe48hzpAA5MbhdIWx+Ms32B8D1CRw7U
	fqyads6z47RbNgXjI9YKhrmua4al/U3hfMDMpDxF0bvBSEv7LO3oe0jATiHah20a
	wJSc3YRWvhkKNlmRnMB8+33Ro7QSVd7XXVxTr2SkRO3aM6+v7MuREG0VUMcFBdWj
	ke99HVpW35hGldGg8s6gGfJM3szQ7YJrG6Icdr7FhCaUqmd9bIUPqjZB85qqow+U
	s7KmGGoiDbyW8FfLUG8n7WVl9j+SpgOMNVREFRw0bCE0NBo6ZlRIlWLaYEsD2sg6
	saOcTQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40tuhvxbxu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Aug 2024 06:04:05 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 477644kW002816
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 Aug 2024 06:04:04 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 6 Aug 2024
 23:03:58 -0700
Message-ID: <dcac7a86-0f58-4882-bd3c-b139cccd18f7@quicinc.com>
Date: Wed, 7 Aug 2024 14:03:55 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: media: camss: Add qcom,sm8550-camss
 binding
To: Krzysztof Kozlowski <krzk@kernel.org>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <andersson@kernel.org>, <konrad.dybcio@linaro.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>, Yongsheng Li <quic_yon@quicinc.com>
References: <20240807053400.1916581-1-quic_depengs@quicinc.com>
 <20240807053400.1916581-2-quic_depengs@quicinc.com>
 <8bd860af-02dd-44fd-b5fc-dc37ef4b79eb@kernel.org>
Content-Language: en-US
From: Depeng Shao <quic_depengs@quicinc.com>
In-Reply-To: <8bd860af-02dd-44fd-b5fc-dc37ef4b79eb@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: rHxM5muz5pirKzPu2u5BYmeYiWuZOZMX
X-Proofpoint-GUID: rHxM5muz5pirKzPu2u5BYmeYiWuZOZMX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-07_03,2024-08-06_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 mlxlogscore=913 phishscore=0 clxscore=1015
 suspectscore=0 adultscore=0 mlxscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408070039



On 8/7/2024 1:52 PM, Krzysztof Kozlowski wrote:
> On 07/08/2024 07:33, Depeng Shao wrote:
>> Add bindings for qcom,sm8550-camss in order to support the camera
>> subsystem for sm8550.
>>
>> Co-developed-by: Yongsheng Li <quic_yon@quicinc.com>
>> Signed-off-by: Yongsheng Li <quic_yon@quicinc.com>
>> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
> 
> Why are you duplicating the bindings? This was already sent and was
> reviewed. Asking us to review the same thing twice is WASTE of time.
> 

Hi Krzysztof,

I refer to the patches for sc8280xp, since I see the drivers and dtsi 
patches both have bindings, so I do the same, will resend the patch to 
drop the bindings in this change.

https://lore.kernel.org/all/20240222-b4-camss-sc8280xp-v6-0-0e0e6a2f8962@linaro.org/

https://lore.kernel.org/all/20240109-linux-next-24-01-02-sc8280xp-camss-core-dtsi-v3-0-b8e3a74a6e6a@linaro.org/


And, I also made a mistake when sending this series, I lost a 'l' for 
linux-media@vger.kernel.org, and also need to remove 
konrad.dybcio@linaro.ory, since I got a mail which said "Konrad Dybcio 
no longer works for Linaro".


Thanks,
Depeng

