Return-Path: <linux-media+bounces-23759-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA019F72F0
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 03:48:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8DC9A7A3147
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 02:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 829FE19D899;
	Thu, 19 Dec 2024 02:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EbaL2uBC"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB88185920;
	Thu, 19 Dec 2024 02:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734576347; cv=none; b=RHqTbXmqLtQ496KnegB4jZlrdHApNsaxJTYJQ+hTLJHQK6DeYXkIWIsH53UcKkqN+PlqrxtjQIIywrKVRvyOUKElBgg7GgzJzYCRVReKDoPIQ/swN3NrEe39/17O66wZZBL3dym47b9tbOUIC/EOnNz8Yx27/GPQuOkURNkn8/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734576347; c=relaxed/simple;
	bh=/g3m3PJnJ9ulnIe+WSa2ffKsD62/KhFXZ0yhtrun0uQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fvcPihZ4ygpFIDCuPdKF/jMJnS7ZK9Gxp9msU92BiX7lqUm8/Vqw3xRtEFgX+v69gYsXin8kJgkLsFmbWO5oRzym+HVRzrEsFGBAQZ1NeumtohjOrbdlk/tsmeaizTNVm2QAalA5YplvHHbE2V7GFYdpEQ3fXpKwHyAclCcR2+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EbaL2uBC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJ2BZPO010357;
	Thu, 19 Dec 2024 02:45:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DILAhV+oF8Bzm6SD9mNZqFTIxMkoBtQOV9v7ijn+6OA=; b=EbaL2uBCh6crS/f8
	U5o1qJnVC3mVudiuNJrAtLYmOdug+S17OwU22kssBfJaU59DfDuVVQ2JBJaQ/r60
	0pxgp2VULZ247mYsRbffHgUQ0J2Y4H3ZldDEbWFbbNl8Hltbpr/6dNvxID0lZquC
	Ne0hpWj+BMl53XloUDDeC94Vr3apXjrFzqzzrUqpWcmp+sg+VSwjiw2y4cP3RLuf
	UVDxTq+Or4YmJ+rqvEF+Qh3YQk8jPqaUoVAroE9hO7VVsOMV+U0Pc3J/DX6t6Oq5
	bX5Poe+wfsgdwzJGM2NFCb8RWFMUGFvKz1Cq8FiprFvL57Op6cMLGcoxOZAcHwD3
	WrDCtw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43mag4g1yx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 02:45:41 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BJ2jeSO002012
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 02:45:40 GMT
Received: from [10.231.216.103] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 18 Dec
 2024 18:45:35 -0800
Message-ID: <61c27010-c49f-48df-b6d3-029b15c71bd3@quicinc.com>
Date: Thu, 19 Dec 2024 10:45:34 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] media: dt-bindings: qcom-venus: Deprecate
 video-decoder and video-encoder where applicable
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Stanimir Varbanov
	<stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <quic_vnagar@quicinc.com>, <quic_dikshita@quicinc.com>,
        <konradybcio@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Stanimir Varbanov
	<stanimir.varbanov@linaro.org>
References: <20241209-media-staging-24-11-25-rb3-hw-compat-string-v5-0-ef7e5f85f302@linaro.org>
 <20241209-media-staging-24-11-25-rb3-hw-compat-string-v5-3-ef7e5f85f302@linaro.org>
 <283a54b2-6e00-4d3a-95a3-df4a06bc1292@quicinc.com>
 <0a265953-0c6a-4b8b-a972-a59ec4755474@linaro.org>
Content-Language: en-US
From: Renjiang Han <quic_renjiang@quicinc.com>
In-Reply-To: <0a265953-0c6a-4b8b-a972-a59ec4755474@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: lG9z2WaV1XokRf398CERCG6GRY21N-WS
X-Proofpoint-GUID: lG9z2WaV1XokRf398CERCG6GRY21N-WS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 mlxlogscore=973 phishscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412190017


On 12/18/2024 8:38 PM, Krzysztof Kozlowski wrote:
>>> @@ -132,12 +132,4 @@ examples:
>>>            resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
>>>                     <&videocc VIDEO_CC_MVS0C_CLK_ARES>;
>>>            reset-names = "bus", "core";
>>> -
>>> -        video-decoder {
>>> -            compatible = "venus-decoder";
>>> -        };
>>> -
>>> -        video-encoder {
>>> -            compatible = "venus-encoder";
>>> -        };
>>>        };
>> It is working fine on QCS615.
>> Tested-by: Renjiang Han<quic_renjiang@quicinc.com>
> How? How is it possible to test a binding on real hardware? To my
> knowledge it is impossible, so I really would like to see explanation of
> this tag.
  I used this binding and modified the driver to verify the video
  function, and the result was fine. Also, I used this binding to
  verify the dtb, and there was no related error, so I added
  Tested-by.

-- 
Best Regards,
Renjiang


