Return-Path: <linux-media+bounces-33562-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C45B8AC75E3
	for <lists+linux-media@lfdr.de>; Thu, 29 May 2025 04:30:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 862FC7A7709
	for <lists+linux-media@lfdr.de>; Thu, 29 May 2025 02:28:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4122F242D84;
	Thu, 29 May 2025 02:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PDw4smir"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED3521D3F3;
	Thu, 29 May 2025 02:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748485802; cv=none; b=sZrw4pe4Fsf+94qM/bLI1kV5RC9JZCPxWPSIML6iABGE2ffREExKGGwFqln/U3u02nhkkxPP9oB9g8Um5+YvSmBcD93WA/KQLlf0PFCByO3WGu001pN3Hwv3jVsBcBlNVK040Ns6Ke6f8zPzAq/5FIR9rh3t4xUjdW4ds1qc6jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748485802; c=relaxed/simple;
	bh=nc7Zgu+9HC46wrrWpEd66HQANMzoDCKegcVwT+u+TaA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fbmLf76CGDTfXvgAGODqXWzAiEwp0PIQw0sBxsuIQPwFNLXOsTUT6BXpv+lsgFdj70F3dnUf1/06aBuS1HneKToCn57ozSmSItX6p0CF5GvtiMBqSTNAKfqTPuKKEg2QrROMYf+x73RznPu2xiUr051BO/lkpj6/fTSafjl5q9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PDw4smir; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SKVUav009425;
	Thu, 29 May 2025 02:29:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JZ/ZRDn+Zg/4lj2cp56US1wfYcod9Gxb5vhiGBTda0o=; b=PDw4smirwZJn5mcH
	5cFcXFvWeBXO/vIcEYEGuglQ91TUambl0+fs+/Sa3eBIXHmRrqO6lO+1tqzWQeOf
	JkE26WqqC99Dty/7KSpw3egCUWkjprc1rED/9fwgxM2go6mX/yRmoTcVRE0hDqfp
	AZ/OIuCuI+MA5ra8WQ6fI2uMl1oZtQ8fJl8c+UKVhTMo1cVbj6TYvWYq5e+frj1f
	czFlJnNWa45YRef3DiwD2xqO3Kyns4xEijzCeZ0VaBWsQl0s0RucA2T6Feqk/18S
	ap4up/AZZ51yR92Vk5+7EUna7StuToukZSTKIjo2Fn+SjpRc49Ky4v4fD+XEamWo
	ubN4MQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46x03mtd3k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 May 2025 02:29:55 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54T2Tsi7007083
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 May 2025 02:29:54 GMT
Received: from [10.231.216.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 28 May
 2025 19:29:49 -0700
Message-ID: <43e1f8db-5ab1-44ce-97c8-50910704788f@quicinc.com>
Date: Thu, 29 May 2025 10:29:46 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/3] arm64: dts: qcom: qcs615: add venus node to
 devicetree
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20250527-add-venus-for-qcs615-v7-0-cca26e2768e3@quicinc.com>
 <20250527-add-venus-for-qcs615-v7-2-cca26e2768e3@quicinc.com>
 <429b4c99-b312-4015-8678-0371eac86de4@oss.qualcomm.com>
 <6a9e7daf-c0df-42db-b02d-96d9893afcde@quicinc.com>
 <idc4476ibh4geraklzpas5536jnwvbp6xhjjaajcdcwxicorrf@myh7kyz77rxy>
Content-Language: en-US
From: Renjiang Han <quic_renjiang@quicinc.com>
In-Reply-To: <idc4476ibh4geraklzpas5536jnwvbp6xhjjaajcdcwxicorrf@myh7kyz77rxy>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: CihJsZNEKJdnKN01PqBb-qMEY0oY3up2
X-Authority-Analysis: v=2.4 cv=FuAF/3rq c=1 sm=1 tr=0 ts=6837c6a3 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=WSKx2BTsENJZuoY6WiUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: CihJsZNEKJdnKN01PqBb-qMEY0oY3up2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDAyMyBTYWx0ZWRfX+QaNpsx+lcNK
 EMUFcW4IcFPmXTqpQW7/oXsmz5XJBT5sp+Ow+vRAkHdUNb3ifzPlFI+hUGFv2vyH/ccmRVHpWrQ
 LHy5UxsatPKnnZ1bLEIDkdqo/xrenBISbBIsdCpGLK1pgTuxvKCVtXf282zKzBBTHGQRfbwOLnB
 qiTPzzxweAFnGJ/smwF9ZiLtOuzp6leImIzkj342xDLP6oDtevpRQV2IpR3w69LVpfgYClyX0cK
 Uu7fn2P02qIy2/ToC5Chn+hftRxdjV7QDQW2lIse3h6PPCTi7lbWUBMBXyITytL+rIAdybKI8Ii
 hJEzbZf8jEUSXPos1TeuOK/63hwoji+pANhxs+F2QsPGOcqQ5lbw5rIbm/8DTESYZw/cVEsAobB
 41I+DaSvaMMRgDlW6rpzPeF9sVtPouCQeXmwiiHMhFKbmkNgNk2qwyRv7jAkOchqsAziA7Ay
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_01,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 mlxlogscore=870 mlxscore=0 impostorscore=0
 bulkscore=0 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505290023


On 5/28/2025 7:04 PM, Dmitry Baryshkov wrote:
> On Wed, May 28, 2025 at 05:13:06PM +0800, Renjiang Han wrote:
>> On 5/27/2025 9:57 PM, Konrad Dybcio wrote:
>>> On 5/27/25 5:32 AM, Renjiang Han wrote:
>>>> Add the venus node to the devicetree for the qcs615 platform to enable
>>>> video functionality. The qcs615 platform currently lacks video
>>>> functionality due to the absence of the venus node. Fallback to sc7180 due
>>>> to the same video core.
>>>>
>>>> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
>>>> ---
>>> [...]
>>>
>>>> +			interconnect-names = "video-mem",
>>>> +					     "cpu-cfg";
>>>> +
>>>> +			iommus = <&apps_smmu 0xe40 0x20>;
>>> fwiw docs mention 0xe60 0x20 (which result in the exact same resulting sid)
>> OK. Will update it with next version.
> How would you update this?
Thanks for your comments. I'll update it like this.
iommus = <&apps_smmu 0xe60 0x20>;

This 0xe40 SID was based on a previous project. However, after rechecking
the documentation yesterday and confirming with colleagues, the correct
SID value should be 0xe60. I’ve also validated it on local device, it
works as expected. The reason 0xe40 seemed to work earlier is due to the
mask value being 0x20, which causes the effective SID derived from 0xe40
to be the same as 0xe60.
>
-- 
Best Regards,
Renjiang


