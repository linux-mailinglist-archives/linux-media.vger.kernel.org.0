Return-Path: <linux-media+bounces-15673-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 895379440E4
	for <lists+linux-media@lfdr.de>; Thu,  1 Aug 2024 04:21:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 00F531F27F23
	for <lists+linux-media@lfdr.de>; Thu,  1 Aug 2024 02:21:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9C1E3E467;
	Thu,  1 Aug 2024 01:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gKPPOgho"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EC51EB481;
	Thu,  1 Aug 2024 01:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722477212; cv=none; b=ud6zFxJ1fungcDBmyPkFQ0+rTGNc9Vzp1m9LN/XUZTYQYUezYNkN37vlLE7AGAp3cW3cGaFZYs4iwiJx+l69xm5fVF65NZHybAfQ6TAKO8ZTcGqRgPsRi2haOcJ+Dz/oQAiMrezET9d02pa9aANnHS/0ow1tNyw9JDT/jwYITf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722477212; c=relaxed/simple;
	bh=UQ9V6G6YvgbMQzkYH2Dccn5w29o7+DCl2JMf1pWwIJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lX51E6d+UEc2KL5mCXEKCTfx3cWuGm246yJJbkiHb3ppykTRgCmgKAJSR5ezTU8rQ+TqOPUx3Z6ApzBxL9zRj3zoh/9s1rjKAGJ1GRtfjsev7L04YxHYdBlX8YdGcyaulJFFbtPvQAy5ewh2je6vAASfgsHNcD3xnWefaz2I+Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gKPPOgho; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46VJUwRD011775;
	Thu, 1 Aug 2024 01:53:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QMQGHGQgU140SfEEIFKk2WOGgR8jjWSTdiIYe2/sfjw=; b=gKPPOgho5vXY3/DU
	09KzLJBymRbyRBOpTX4cutETGmfL7fVMzSfVfLvUu0LLFcJH+S54s/FEcqe0YJ52
	kjo+nBSupUCWfCj31bUyzElm1yG4kXZwa1R7rdu+i6CPyMNUFm0FDnvXbAJePe2s
	62b0M9s9fS8iST9ogSsE7AmEWENKBllzBnUPgJocd7cpdYD6tu8PBX7jkFcVrTRt
	c1y2AhDLXCNJSxQh7xca9bE95SFCnDnsv0r1PiPpZRye5ZnmyaikZLCQWcwKB/1D
	0nspfS9q3+gY+mFF4ndexVNjXjYwREsgyM/IpBsq5T9PYvRj8b/ty4hrGiZ/hrjA
	52YZ0g==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40qugagtk3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Aug 2024 01:53:26 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4711rOEx011016
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 1 Aug 2024 01:53:24 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 31 Jul
 2024 18:53:19 -0700
Message-ID: <30d56910-df7b-4459-b557-effc21ffa132@quicinc.com>
Date: Thu, 1 Aug 2024 09:53:16 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/13] media: qcom: camss: Add CSID Gen3 support for
 SM8550
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski
	<krzk@kernel.org>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <quic_eberman@quicinc.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        Yongsheng Li
	<quic_yon@quicinc.com>
References: <20240709160656.31146-1-quic_depengs@quicinc.com>
 <20240709160656.31146-10-quic_depengs@quicinc.com>
 <1da50dd1-b170-4775-94fc-19a10b7f9c47@kernel.org>
 <4c8095dd-4f96-4b0e-9282-8bdfb5badbc3@quicinc.com>
 <9255b3e4-874c-4919-b50a-919cf0f42f75@kernel.org>
 <3011c561-d39e-4ce5-a544-33f24ca7a67c@quicinc.com>
 <bd6f3613-5a96-438a-a2df-cb2728e30c29@linaro.org>
Content-Language: en-US
From: Depeng Shao <quic_depengs@quicinc.com>
In-Reply-To: <bd6f3613-5a96-438a-a2df-cb2728e30c29@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: VxdVmoKdjTn37BnJuEMLqdhBNhhZrjJu
X-Proofpoint-ORIG-GUID: VxdVmoKdjTn37BnJuEMLqdhBNhhZrjJu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-31_12,2024-07-31_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 impostorscore=0 mlxscore=0 spamscore=0 malwarescore=0 phishscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2408010010

Hi Bryan,

On 8/1/2024 12:12 AM, Bryan O'Donoghue wrote:
> On 31/07/2024 16:26, Depeng Shao wrote:
>> I'm preparing the next version patches, then I find it is hard to 
>> avoid such warning if only apply current patch, since this will be 
>> used in the below patch, it will be in structures csid_res_8550 -> 
>> sm8550_resources -> camss_dt_match, so I need to add all 
>> csid_res_8550, sm8550_resources, camss_dt_match into this patch if I 
>> want to avoid the compile warning,
>> then I also need to add compatible info for it to avoid 
>> sm8550_resources has unused variable warning, but the sm8550_resources 
>> structure also need to add other items to make it complete, then the 
>> driver will be incomplete but can be probed with this patch.
>>
>> { .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
>>
>> https://lore.kernel.org/all/20240709160656.31146-14-quic_depengs@quicinc.com/
> 
> Couldn't you just add the public structures at the same time they are 
> referenced in &sm8550_resources ?
> 
> That way your patchset would progressively apply with no warnings.
> 

Sorry, I don't get it, but in my understanding, but looks like the only 
way to avoid the compile warning is that adding compatible change in 
early patch set.

I can add the compatible change and structure sm8550_resources in the 
early patch, but the structure sm8550_resources will just have very few 
info in this patch. Then fill the other elements in sm8550_resources in 
the following patches, this can avoid the warning, but the issue is that 
the sm8550 can be probed once having patch set 1, but the 
sm8550_resources isn't complete in patch set 1.
Could you please common if this is fine?

patch set 1
+{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },


+static const struct camss_resources sm8550_resources = {
+	.version = CAMSS_8550,
+	.pd_name = "top",
+	.icc_res = icc_res_sm8550,
+	.icc_path_num = ARRAY_SIZE(icc_res_sm8550),
+	.link_entities = camss_link_entities
+};


patch set2 - Adding csiphy driver and csiphy res to sm8550_resources
static const struct camss_resources sm8550_resources = {
	.version = CAMSS_8550,
	.pd_name = "top",
+	.csiphy_res = csiphy_res_8550,
	.icc_res = icc_res_sm8550,
	.icc_path_num = ARRAY_SIZE(icc_res_sm8550),
+	.csiphy_num = ARRAY_SIZE(csiphy_res_8550),
	.link_entities = camss_link_entities
};


patch set 3 - Adding csid driver and csid res to sm8550_resources
static const struct camss_resources sm8550_resources = {
	.version = CAMSS_8550,
	.pd_name = "top",
	.csiphy_res = csiphy_res_8550,
+	.csid_res = csid_res_8550,
	.icc_res = icc_res_sm8550,
	.icc_path_num = ARRAY_SIZE(icc_res_sm8550),
	.csiphy_num = ARRAY_SIZE(csiphy_res_8550),
+	.csid_num = ARRAY_SIZE(csid_res_8550),
	.link_entities = camss_link_entities
};

> ---
> bod

Thanks,
Depeng

