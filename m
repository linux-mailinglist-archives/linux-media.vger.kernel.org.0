Return-Path: <linux-media+bounces-30919-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9268FA9A729
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 10:58:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DECDD164ECE
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 08:57:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27DFC22424C;
	Thu, 24 Apr 2025 08:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="h7W8cXSD"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8E32222D5;
	Thu, 24 Apr 2025 08:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745484854; cv=none; b=Wl5DErQ6g9vLk5yIYo5tGeog/XgcCCBAGKMozs61GCpDmWFSYodlN1b1hp3+yc01ka/K2eG4Wg2xGfPE0wetfS+9nPgwSPK+jqhQDakbJ+BjKg8rteTodlVvgoWltKyS/iUI6SvoeUo6DU7KYGNzK5xuVpkX5Y3UPrnXnd4FE9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745484854; c=relaxed/simple;
	bh=wGDFD9zJe7KzUguhrDRaAxXmamzUcDV0trDJav1Dxj8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=khBJHPq7zV77t9sOtxSVKsvuL27JHQZOyAqELOaVr6qBzHosZwZVtVf1h7tFRH1/RGD1Q/QttNSbUyOiopVdAGhRClx+qvQIEPj02SB0s8fXKon3hTLy5Cq4OC0tJWhQHkvFuS8LqO61HSSE5xUQunsykEJeQ8xS1e+RrYjZODI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=h7W8cXSD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F9Mw031013;
	Thu, 24 Apr 2025 08:54:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0/DcslFiTMnEAel9tKXyzhbpkoNYUd2Fcf8Xc+Vbdg4=; b=h7W8cXSDoDOUQ7AS
	CxSA92YPgpvKaEXgH5wTgfag7ChNrMXYuts7fAsY+Tjj+OaOalnAOYwUSwNZ8Vdu
	ap5nNCRu60m6/+BM9AdWrxpLfcK490XlgIGHAcC6xyYrDLPU4hYKAWopBrOy1NHO
	ZKzjhwEEJUHFXZ3t3UkxrdnQbg6ZIQyp/sGz/Mqb7YxC7S+elP850jrakWbaDB/q
	cugdAP3MsHAkNRC6QYpN1UBWhefal3VoVK2z5KH2MnXB/qVqNvF0boCQxzWRImx/
	YgJ9vWZNCsXA2FY2jhO8nZo9nOSxkxC47RjOi4wFUaaDExSmg0GmoEI0+XALKMFu
	uN/HHA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh5cvh8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 08:54:09 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53O8s8hq016038
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 08:54:08 GMT
Received: from [10.216.12.43] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 24 Apr
 2025 01:54:04 -0700
Message-ID: <43fb1be8-ca7d-7481-1e31-b3457e76518d@quicinc.com>
Date: Thu, 24 Apr 2025 14:24:01 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 3/5] media: iris: add qcs8300 platform data
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250424-qcs8300_iris-v4-0-6e66ed4f6b71@quicinc.com>
 <20250424-qcs8300_iris-v4-3-6e66ed4f6b71@quicinc.com>
 <0e1030b2-0bf1-4fb7-8588-4019d7dfeedf@linaro.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <0e1030b2-0bf1-4fb7-8588-4019d7dfeedf@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA1OCBTYWx0ZWRfX6OdCFeCLWknb B01stuDU+fEMdIOTgNP7fATD4XyXw6zqbT3ZFtySfPRaNH6UyTYT359yBHFc+cuNtRkjTKBoYg6 6Wb5cPoAFKQLaKssKVUCXCLsLuVtvWhHQ5rdgy3Ywaa7O0n8VDMC5DbYDEtWAjkR/OExOOivbd7
 OZ6SktA6DSTl3DSo5d5rwIyh8F4HPz2mNLuTkdLRsHXJ4wvIgRAsEH1L8CLXMWLGcXkPIoV9TGW er0UE9byKfRKtCcEMYm5d+sk4u8ELXnzbnnYUDfo9KUIPG2ZCE5KMUsoDHlNAI/KCIGG+TRfvdn XdCD/7vWwMn+GgCm4ujT6tdViuOt0L3NvJ/JEe+FP6FaVVzbK4uoVGjEllgeNr8KQ7RUdliwlmo
 YB4yu9vy5lqe/EUcdKIKiuamgnd1w4cltuUV1Ng5WVSMgt69f9DboKhd8BUxTRA0MW41CpK3
X-Proofpoint-GUID: FU4YmYxxW1VVszuLTmWlK7_fjSrEKZtW
X-Authority-Analysis: v=2.4 cv=B/S50PtM c=1 sm=1 tr=0 ts=6809fc31 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=FQAQLTzl-ImsQm_QpX8A:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: FU4YmYxxW1VVszuLTmWlK7_fjSrEKZtW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=970
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240058


On 4/24/2025 3:06 AM, Bryan O'Donoghue wrote:
> On 23/04/2025 20:33, Vikash Garodia wrote:
>> Add platform data for QCS8300, which has different capabilities compared
>> to SM8550. Introduce a QCS8300 header that defines these capabilities
>> and fix the order of compat strings.
> 
> I'll drop the "and fix the order of compat strings" no need to resend.
Fixed it and sent v5, there was another comment to address.

Regards,
Vikash
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

