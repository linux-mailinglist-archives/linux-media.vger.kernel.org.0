Return-Path: <linux-media+bounces-40713-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E6EB30D94
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 06:28:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D4DC3B14CA
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 04:27:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3E9928C5D3;
	Fri, 22 Aug 2025 04:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NKbw90Mw"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F8F21FF45;
	Fri, 22 Aug 2025 04:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755836831; cv=none; b=rfeMRaEXwyDqM/ZaA+fLhTRjVyiu+OtASWOe2gplgtbJEa0Rhz6yjWyA2ZnRKhAFn56mGQulqfj/FrWHISnrqlvxRgzBvpT1VEsMB7GZhYa5zFzyeuFJt7VVmLZxF4P6+8tAeHDQrJNXfqYDoMzCMS51ROuDaqHPegqtqt+ohTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755836831; c=relaxed/simple;
	bh=u3rIIq5pQs4g+Mh0sxvuIiJ/t38nJY9LoL19Zj769PE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=QIj7F/LrIFd436DsBl55pmnJONV2EDOLa1o4wrlZSi5wZsK10LcjR7Th+PfqLuf1J1Ebzlba3S35KIxzriDm9SwaBTmAyszh8gYRz98IYlN5iJEF3LFSy0M+nbv/+ZAjOCf1lHAdUVS/mRXeNud/f+1Gyd/Il2iRsXHbcQwnfZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NKbw90Mw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57LI962t003032;
	Fri, 22 Aug 2025 04:26:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/G46m8Tt/tbXToD1mhgusm0gLIWij1itXlNuTIKYcM8=; b=NKbw90MwjXuGakHf
	+RyPjwJWFSxTHCsdOciPB0XkZoQqAcmRbqiIDSPtPIRB3JUISrXqpuzP6UqnlTHX
	oWOJISzbEK/bMbZYNkZFgHnzRlF31O1ARFLWWscQiETsp0S8ZDQcCUz3uNQP563t
	ICk25ISrurVJ35mv2bSXVndz5lqCCMJLNw1IvLRf99kDIrf+bReRLpEmS9gUifua
	NkjgOmwWggj/vGxJPW96betNLtDitIvbkEUb4bROFtU4doUBGshdHETd4agRxrr3
	d9Bvfffc2ZQkpxyykOouEKoA5t8zGHj7Bcjjs4QX8KvynBcRCJmMSEuIn9zBg3OF
	A4sfQw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5297sqn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Aug 2025 04:26:56 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57M4Qt9U020964
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Aug 2025 04:26:55 GMT
Received: from [10.204.101.215] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 21 Aug
 2025 21:26:52 -0700
Message-ID: <f25b6cb4-666d-e3e1-0540-b2d7fad86407@quicinc.com>
Date: Fri, 22 Aug 2025 09:56:49 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 11/11] media: iris: Enable Secure PAS support with
 IOMMU managed by Linux
Content-Language: en-US
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Dikshita
 Agarwal" <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        "Abhinav
 Kumar" <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <20250819165447.4149674-12-mukesh.ojha@oss.qualcomm.com>
 <aKWLZwYVPJBABhRI@linaro.org>
 <20250820115659.kkngraove46wemxv@hu-mojha-hyd.qualcomm.com>
 <aKXQAoXZyR6SRPAA@linaro.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <aKXQAoXZyR6SRPAA@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Kw5VZfdXaHZHvL6g2iirzVKGemY-VCiG
X-Proofpoint-ORIG-GUID: Kw5VZfdXaHZHvL6g2iirzVKGemY-VCiG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX9ogflvnWNS75
 I7ydp3IRVMy57UTKXHtAeY0znBYQMNmhSk7BN2hFKl4gt7ZY/X6HWp6zJ9VK0R+/OtrPsEHSLwf
 3VYGa/qH5dr8iJ8GIzTA+Rv0CF4GtH8i+Pg20yRm57aE+ATBttbVr1cVRIeac1b9oD3oxqQmUET
 TyBjHVw168gY+jrZdjMd7nN3BWp5nZRmjRg/NZZnh1bwM/sJHJzi2yhHJ1C2sJp8GRjlAiUW6Zi
 YWwOmeIrS07P4FL3LCpx4arA+aJnIQAJq9xcgA4NnxtvBPBeqFO3iVFjZc9/y/JMPYjWfbu2ALK
 b24Mu0d6YvCcOvSOwHsvwfkXZFNJgN6qkihC7ZBk0qb90gAvUSRfVOdTNTMdOl3BFcUqJZ/o6Tv
 oRLAmQS7SXCKzgI7icN8U7TG/Gv/dw==
X-Authority-Analysis: v=2.4 cv=SPkblOvH c=1 sm=1 tr=0 ts=68a7f190 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=P-IC7800AAAA:8
 a=6T37wFGgcxAVjjbwX-wA:9 a=QEXdDO2ut3YA:10 a=d3PnA9EDa4IxuAV0gXij:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_01,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013


On 8/20/2025 7:09 PM, Stephan Gerhold wrote:
>>>> +int iris_fw_init(struct iris_core *core)
>>>> +{
>>>> +	struct platform_device_info info;
>>>> +	struct iommu_domain *iommu_dom;
>>>> +	struct platform_device *pdev;
>>>> +	struct device_node *np;
>>>> +	int ret;
>>>> +
>>>> +	np = of_get_child_by_name(core->dev->of_node, "video-firmware");
>>>> +	if (!np)
>>>> +		return 0;
>>> You need a dt-bindings change for this as well. This is documented only
>>> for Venus.
>> You are right, wanted to send device tree and binding support separately.
>> But if required, will add with the series in the next version.
>>
> You can send device tree changes separately, but dt-binding changes
> always need to come before the driver changes.

Do you mean to update the examples section[1] with the firmware subnode,
something similar to venus schema[2] ?

Regards,
Vikash

[1]
https://elixir.bootlin.com/linux/v6.17-rc2/source/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml#L109

[2]
https://elixir.bootlin.com/linux/v6.17-rc2/source/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml#L128

