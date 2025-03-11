Return-Path: <linux-media+bounces-28048-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C23E8A5CCA4
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 18:47:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE65D17B07D
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 17:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E2F226389A;
	Tue, 11 Mar 2025 17:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Kv3vv+V7"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C774262D2C;
	Tue, 11 Mar 2025 17:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741715239; cv=none; b=tkshutNG/lTmtnLTZft8YcGUxxcs0Fg3w0JZKWEz7s/n8z1XcgLahu3M8liKSsvhjsRfYnhO9Bp/lwDm6BGIocPYOumtlbS/+i46DAivZFQHsR42PTXgKhp1MEoxf6xUCoqxqkhblSbnob1M0taUGuS3l7iExXdO9EOmmXFq3Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741715239; c=relaxed/simple;
	bh=ller/jF40I2PeAHtTc9aN51gI+/jDyDYgF8J1WuNz14=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JJNRIoyPD/bRzhpmqMcrBWozc+0WvqIPMrwoVlPSXLNrh5gXsZumNqnV+EAvsDyCQkfjmFn+ta1AWZyhbYp/TiTX4YeW260w5l336To4ZkjZjOBTR1ttgqkBXkwjakAlMClPi+wS6Bp2QpqHAKaWj27h1KkxSnaAdbHRgaapYpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Kv3vv+V7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52BD0LAI029532;
	Tue, 11 Mar 2025 17:47:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m4bTi103PR1qOqcJp3CYevL2i5earH629nNCcbiv3jk=; b=Kv3vv+V7ea8lM/cg
	XtIOGlQ9E44xDrI2zDZd0Vq+C9DM0lXM3B3Wd5Fk0IW+ivIk+Jyj5YtKYCjJ/LuY
	jBXF38EUBveKKVHCLfk4hfo9uVZkXJpnSSu7dIAHytqvvUTUMq0RRfIp0N1e77Sx
	e+7gGbuBfQBDif9hPfDy+X9epSQ7fAF68L8zPHO1fvb1WYBaZb8OMqK0Cl4IXILI
	vVp4b0rMwqnQeOX4E3lwoo2QBkV73Das3txeK4p5bX/Y9MFNmPWj7qQx+4T8Ej5o
	W67o4/d0WUglAdBAleoTTqxEhc6xuukArIKNLw4lxQHoSf0KfvZyQ8gVdfxRoK31
	ZUjeag==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458f6ahk8g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 17:47:14 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52BHlDmH020411
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 17:47:13 GMT
Received: from [10.216.38.182] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 11 Mar
 2025 10:47:09 -0700
Message-ID: <40d1a27e-aee9-bd68-a82b-a51ef8ccde05@quicinc.com>
Date: Tue, 11 Mar 2025 23:17:06 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/4] dt-bindings: media: qcom,sm8550-iris: update power
 domain name
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
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
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250311-dtbinding-v1-0-5c807d33f7ae@quicinc.com>
 <20250311-dtbinding-v1-1-5c807d33f7ae@quicinc.com>
 <607f842d-07b5-4c1f-ad26-0fd34e6e605b@kernel.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <607f842d-07b5-4c1f-ad26-0fd34e6e605b@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=WsDRMcfv c=1 sm=1 tr=0 ts=67d07722 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=963PLJbrCG0W5q-lhu8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: hFBdlSlsYbkdhfF8fncfCc8hwWlkStJR
X-Proofpoint-ORIG-GUID: hFBdlSlsYbkdhfF8fncfCc8hwWlkStJR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_05,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 impostorscore=0 phishscore=0 mlxscore=0 mlxlogscore=774 clxscore=1015
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503110113


On 3/11/2025 11:03 PM, Krzysztof Kozlowski wrote:
> On 11/03/2025 13:03, Vikash Garodia wrote:
>> Not all platforms has a collapsible mx, so use the more generic naming
>> of mx in the binding.
>>
> 
> No, neither tested, nor justified. Read the file. How many platforms do
> you have there? One. Out of this one platform you claim not all of them
> have MX collapsible, so you want MX?
Let say we have one which is non-collapsible, what should be the way in that
case to use the bindings which differ only in the MX/MXC part ?
Regards,
Vikash
> 
> Best regards,
> Krzysztof

