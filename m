Return-Path: <linux-media+bounces-22802-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A909E7015
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 15:32:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6E291691CB
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 14:32:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D593514AD29;
	Fri,  6 Dec 2024 14:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WELdmpke"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE36E38384;
	Fri,  6 Dec 2024 14:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733495568; cv=none; b=pBKB90TXdKApuTP3IZv9HvZqwf3uuOb0ajvL29cyvbHJYxZJ+z4xl6e0nntkE+ez+WILTjs9Z1AVRatcRVmkGvUf6Q9J3fzFZQWDyDO4N30GsvcNAuhfEn/ZJCn4R4ep9O0Phpq3QdfnCz/EYjHfFIRLjshCMn8mgCmbD3IEFNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733495568; c=relaxed/simple;
	bh=x1x5lZTfbcN/UYiBOy/j8SpdkEQ/Y4TzF8UlXN0Ddu4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XpzhdhKPsySwqsZoIME4WrFu/DemFecPmBPQd1XN0XSnqFBZClCJs4KTJGqY72YWPWZupa1qgejWOCiH+Dp2ijcwTVQCIpGdvz1Y8ojGMdv4Py1nIafCCU08N9WeXsQX6T88DlOV7CP2KDyHLieLYx2sSRTFYsSmfiidl5y8UWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WELdmpke; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B6CF4Ij003155;
	Fri, 6 Dec 2024 14:32:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KPDZlNBlfWl08rL8S2G09TciFQAjveDqfFO68tbpYHU=; b=WELdmpkeEaK0npgH
	GxjtdA1yDixZTduVJxoRCmQ+rBnMOfeNdWuko4eT17jTISYmPG9NPZHHr6KL/dol
	yGW3CyhPPZ2d/Bd39HmUl062XN6WVYsMaDcDzFjbFUabCmQqFY44VPxaE5KNZIJF
	aa/DUStK412KboG1FFYfeQ6nuwjd3+eDQHD+aw/wLG96CfO2eBVKTgL74yfvT0Re
	WjJF8bGRJ/u/pDVW1wk2jTVrA58tRqi5lCHGpep8nVejmFxg8IT3ylaCfhExVDW8
	4FEqEzB8fAjxFfvheKphzRMDawfzuqJQwkwE5GvydPmTCQrCDR8VOONa9BhYsWx+
	zc41tA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43brgp1tqn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 14:32:42 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B6EWflZ003869
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 14:32:41 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 6 Dec 2024
 06:32:35 -0800
Message-ID: <d5c52ecf-1606-4563-ba16-a88437c414da@quicinc.com>
Date: Fri, 6 Dec 2024 22:32:32 +0800
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
 <2515c9d8-0e9d-4e1e-b8ff-764b53ea3edb@quicinc.com>
 <e5f89ace-3a22-41a7-aafe-1365f2fd9bcd@linaro.org>
Content-Language: en-US
From: Depeng Shao <quic_depengs@quicinc.com>
In-Reply-To: <e5f89ace-3a22-41a7-aafe-1365f2fd9bcd@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 20zBSk_dzKd5RqAkkKwyp_bzp0nqBJ_W
X-Proofpoint-ORIG-GUID: 20zBSk_dzKd5RqAkkKwyp_bzp0nqBJ_W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 mlxscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 mlxlogscore=961
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060109

Hi Bryan,

On 12/6/2024 6:06 PM, Bryan O'Donoghue wrote:
> On 06/12/2024 02:18, Depeng Shao wrote:
>>
>> Since the camss driver just support ife, so I think only ife related 
>> iommus are needed, just like we don't add ipe,bps,jpeg related clk and 
>> register in the dt-binding.
>>
>>      msm_cam_smmu_ife {
>>
>>          compatible = "qcom,msm-cam-smmu-cb";
>>
>>          iommus = <&apps_smmu 0x800 0x20>;
>>          ......
>>      };
> 
> Upstream camss entries provide a long list of iommu entries, please 
> provide as complete a table as you can here.
> 

Do you mean also add jpeg, icp and cmd's iommu entries to here? Starting 
from SM8550, IFE just has one smmu entry, SM8650 and SM8750 are same.

Thanks,
Depeng


