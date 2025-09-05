Return-Path: <linux-media+bounces-41803-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 664CAB44EC4
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 09:10:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8902418879D7
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 07:11:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C52912D4806;
	Fri,  5 Sep 2025 07:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FItSiSn+"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66CB2236FC;
	Fri,  5 Sep 2025 07:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757056237; cv=none; b=b5M3EUttqdHFCJIg3GlvaLIRa9TlvoGZuSVCGvdBID8Ssw2wqCbxanl0f1G0bhhHH6zB55u1IgnNLqif8APFObXMMtWZVeULL6wy8PM4XWZvUud8bbbUVDyXis85QmN7s/qpLQ3seddjzK6dJQs+mudHMLD9YjMpG2IVQV8YucI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757056237; c=relaxed/simple;
	bh=q5WjBF13L5oQnI7c5sEm/rO8qll272llWzWVXGJfMi4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=eKuSZxyQWnMHdRFkyWdxd7VFg5WdmKY9j/ZJKmkTrRTiEH7Ic9fAqNWecYcQv2t47Z7DKFHBbP+R1iG+QBtEFgdXVRzOU4P94L/cl9OdRR7zDzODwaWZzXvTU0Ph/XsiokfAjxcPW3JD1PMDsPlX/h1H9Ow1ydx0toZCxrPIjAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FItSiSn+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584La2b4015017;
	Fri, 5 Sep 2025 07:10:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ocu/thbdN8oKyewRN3m8h/HBxcZFzQagxjLRb+ffRzM=; b=FItSiSn+rWi7mZnu
	+8tS3jopA8M808UGx+atuc2oiq7D/OfTp1uSGtqwhGFuVt6KvvOrCOKLM9sPKzf7
	Sccez4n/ZR6RSt2vNXF8n9YrBNQfejcPA7Y0hMVWNFt3JZvlKUyeY1X8GxSGx1n2
	T4YTdVIZ/DmfL48ghYo2oEucDrVoycFTWVQJFYMxCUSxtPkW2mcKXDs7CG70KLv/
	xm2yPc74mzmQhNxXNkc8elRIe9Z6EihpXV/u0SeVkr8ZKAu+tcsDvPZHZrzuiOR5
	cRiSjEDhIyaRPESZTe+s8o6ce8JTcQV5iDLYLDCvYZiXJrd0XZbHdH47BIcHd0kN
	+UQ+yg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnpjbj3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Sep 2025 07:10:31 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5857AUhZ027134
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 5 Sep 2025 07:10:30 GMT
Received: from [10.64.69.186] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Fri, 5 Sep
 2025 00:10:26 -0700
Message-ID: <8c97deb4-9ee3-4423-820b-3af7c520633a@quicinc.com>
Date: Fri, 5 Sep 2025 15:09:55 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] media: qcom: camss: tpg: Add TPG support for
 SA8775P and QCS8300
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Robert Foss
	<rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy
	<vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
References: <20250822-camss_tpg-v3-0-c7833a5f10d0@quicinc.com>
 <20250822-camss_tpg-v3-3-c7833a5f10d0@quicinc.com>
 <d40c5ab2-2195-462f-9fd4-8c519a43f032@oss.qualcomm.com>
Content-Language: en-US
From: Wenmeng Liu <quic_wenmliu@quicinc.com>
In-Reply-To: <d40c5ab2-2195-462f-9fd4-8c519a43f032@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: NYRrMz4J_SgzTIvM2NN51p7stpatYNdI
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68ba8ce7 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8
 a=dHi47c6dcDFpmLeH_GgA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: NYRrMz4J_SgzTIvM2NN51p7stpatYNdI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX8zlIm8Kk/4QI
 by3SYXKcdJxLjaZmFh/tp7zA7b7Y+jU1LdmgbVA94JLnT3xcReYuAqqqvjEztbvnie962dylZhm
 nOfcMA/fT9Qzlqzs6LfE5GlFIWf/c+zDO2b++BiS1x6w5OTk6XJSf9qi38GObz43q+Oi0bMOKAe
 JEBbD92LN/nCCuWbW1CFqh7GuN2FufpdqZe19JBqimqN367zx0rmT9g7DI/Y305/Zu5ugqMOIcS
 EgM1gYhyjyL//0ytR8OEhM3fh92a1diTmfD+RfxBSH85xxf+atXfEWBtPr3dCW9RWpFvOBtKWmN
 Yl/ufgOJs79FuGJvP34BvnEN7hl1ihGDJ6KEO5V9+ExcRYgjIksuALLcTm9Ug2ESN+oEv2zqdts
 HdYXoKHr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_02,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001



On 2025/9/3 20:16, Konrad Dybcio wrote:
> On 8/22/25 2:09 PM, Wenmeng Liu wrote:
>> Add support for TPG found on SA8775P and QCS8300.
>>
>> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
>> ---
> 
> [...]
> 
>> +#define TPG_HW_VERSION		0x0
>> +#define		HW_VERSION_STEPPING		0
>> +#define		HW_VERSION_REVISION		16
>> +#define		HW_VERSION_GENERATION		28
> 
> Please use GENMASK for defining bitfields, avoid tabs (just a space
> is fine, perhaps add one in front of #define to denote bitfields) and
> use FIELD_PREP/FIELD_GET accessors
> 
> Konrad
> 

Sure, will be updated in the next version.

Thanks,
Wenmeng

