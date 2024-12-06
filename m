Return-Path: <linux-media+bounces-22761-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 186F49E63FA
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 03:19:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBF06284739
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 02:19:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C527616D9AA;
	Fri,  6 Dec 2024 02:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="b2aY1Q/L"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A861428E3;
	Fri,  6 Dec 2024 02:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733451565; cv=none; b=OnXpOvpXOywBZfTRcdSOI1L+q+T5MyXOZFrBDoyl6hgCMvpB7H4eeFskWiEbq10a4KCqgNV15JTtPnXan1A9YfQlbZYraK+0pkzGQadxaJq0PbW+zjiOq4qO/x8qgLqNLlMDpd+BMMenxZOUg9CBEmm5ZecfyUTy6ilh9VuqAAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733451565; c=relaxed/simple;
	bh=gtEI/vSC3vn1ZJO8coR0WY55fHXA7wZp1KSOEqCOsGg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=uGuNJvofPQxtqX7gzNl0l7m7Nl3Q2ahI0m82hzOfq5pZMkmuaB9DK5Wn0PYX+GV8AMpDncZcPFbVi4AHfqcpNYPF+ML1OY1CdfMMI/7m+OPkcXcKi7CUIIkMJVRCOijY0mSN1LidvezcjKiX0gas7LqzAMnwUWLQWJoe0OMUh+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=b2aY1Q/L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5HaSc5004131;
	Fri, 6 Dec 2024 02:19:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G2D8rAoH16OqsWuf3RVlXZosO01WmKmlS16FYMONfhY=; b=b2aY1Q/LZQJywBvR
	7sdrlYIzHRE6FJrnMyLlU2iXhMM2Z82btWtpbHfSwAqNoj4UElvWbY6ewXastPHq
	KpkKHf03R4vp6DFuqzYfuX1Dunw72dABM8grsz+2b+OqH0DcNcnIExKtTksZZHFo
	Semezw0BrD/zkjNRf+neIyS8bXXizydle7awT6tyvn33nQlt5J9XcDtBe8YkKs0C
	E77aj/4ZmZMU/IJ293+MqoAYCV8jOVR0mGCRzgavDJn58+2bDhAt3DKgBphNRg4S
	6jUg+d5GZRaa0YkLfKN0JM2xjwu3mfJhWr7sU/NedZGyOowMcwpA+HDrxlJWKyLC
	aIQwTg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43bbqm2027-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 02:19:18 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B62JHuV018842
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 02:19:17 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Dec 2024
 18:19:11 -0800
Message-ID: <2515c9d8-0e9d-4e1e-b8ff-764b53ea3edb@quicinc.com>
Date: Fri, 6 Dec 2024 10:18:50 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/16] dt-bindings: media: camss: Add qcom,sm8550-camss
 binding
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <vladimir.zapolskiy@linaro.org>
CC: <quic_eberman@quicinc.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        Yongsheng Li
	<quic_yon@quicinc.com>
References: <20241205155538.250743-1-quic_depengs@quicinc.com>
 <20241205155538.250743-12-quic_depengs@quicinc.com>
 <0909a2b2-089d-41f3-82e6-f0e05682ce27@linaro.org>
Content-Language: en-US
From: Depeng Shao <quic_depengs@quicinc.com>
In-Reply-To: <0909a2b2-089d-41f3-82e6-f0e05682ce27@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: vIaesf_CUR5QiCPf8nZeMxVL4CnhD0Pi
X-Proofpoint-ORIG-GUID: vIaesf_CUR5QiCPf8nZeMxVL4CnhD0Pi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=821 spamscore=0 adultscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 impostorscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060016

Hi Bryan,

On 12/6/2024 12:11 AM, Bryan O'Donoghue wrote:
> On 05/12/2024 15:55, Depeng Shao wrote:
>> +            iommus = <&apps_smmu 0x800 0x20>;
> 
> This iommu list looks a bit spartan.
> 
> Here's what I have for X1E:
> 
> https://git.codelinaro.org/bryan.odonoghue/kernel/-/ 
> commit/9686eaf9557c386a2525d6668da6fe24ffd518c4#5b6ff684e5292a4c0b51f6a38631777fafae7561_4749_4874
> 
> Could you double check this list ?
> 

Since the camss driver just support ife, so I think only ife related 
iommus are needed, just like we don't add ipe,bps,jpeg related clk and 
register in the dt-binding.

	msm_cam_smmu_ife { 
  

		compatible = "qcom,msm-cam-smmu-cb"; 
  

		iommus = <&apps_smmu 0x800 0x20>;
		......
	};

> ---
> bod


Thanks,
Depeng


