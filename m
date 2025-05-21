Return-Path: <linux-media+bounces-32963-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CD0ABE925
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 03:32:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 11A121BA20A3
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 01:32:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B2951ACEA5;
	Wed, 21 May 2025 01:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="omOKrpwf"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3654E28682;
	Wed, 21 May 2025 01:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747791133; cv=none; b=AB0Yid7uehfseMgWp33OSEUKiq63EOYoi6lADEY0SwJyM3Oa0xs2tF832U6quS4SW9TuIXugfjToOTEb2YQinLTo+Tp9Jk//G7RmQlvwLU9Nv8KhFMk1Y72p0CWMX0HLHz8qkzC2+6tCtV9elbOWuoARxVj5eU3XmwV6Nuh47WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747791133; c=relaxed/simple;
	bh=/C17F8NwaHps7gZMSvLoe7rxfL/GB/az1bxUkpKESoA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XZKQXAJPLYrq4Skib1z0pKj0yjhjDeordbs+xCAuWwRv587TuGkI5muTR7ywte77C0TzLT65el7Kofsmoc7qTwgzjPoE3MEnYzIseoDYbGEq7pEGxnkX+4418G9neYdl3PJVgxl+UE7KZjt45b2wlHUAaqbbr6G9CnAIGbhxaeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=omOKrpwf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGe2gb020685;
	Wed, 21 May 2025 01:32:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Apy6Eq56jMsxicEJZ6kB/VOVsoKc+Ruze4hqLTGV2TY=; b=omOKrpwfaSYdrMUR
	7MtZT8I2jIagq0v9x80EiF+ypR6mGZ1N8PukAeIZ7LAHI+E9KsVnQcsIFznAFmj1
	l0oJEhwwXdKC+tt43znqH1BNOLb9HGlE7lzw/shGjCsj0x8Idyz3bHK0dW1P9uNB
	AopIIJCWUpswp889ToNqLrP+URS4BzTDCcngi7debnDARFJ8+yq53pANqMtkpcgH
	PVc+eb50RK6W3RUcEGlI20DpQAyS4ou9WtmP+Apuoh2OOcm7DJhmXRuFlYFT/HQC
	bht3OX4o7u/6K/rkDMGtmgRJcuuTcKH7SJ4yiVIdDCLnQO5dm6iCqlT0DCLU3EGr
	TGlMfA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf014hc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 01:32:07 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54L1W6Yx024619
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 01:32:06 GMT
Received: from [10.253.11.26] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 20 May
 2025 18:32:03 -0700
Message-ID: <dabed183-6907-4483-8c79-616aafaf2851@quicinc.com>
Date: Wed, 21 May 2025 09:32:00 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qcs615: Enable camss for
 qcs615-adp-air
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <bryan.odonoghue@linaro.org>,
        <todor.too@gmail.com>, <rfoss@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>
References: <20250520-qcs615-adp-air-camss-v1-0-ac25ca137d34@quicinc.com>
 <20250520-qcs615-adp-air-camss-v1-2-ac25ca137d34@quicinc.com>
 <748f96f7-d690-4823-845f-67642db97a06@linaro.org>
Content-Language: en-US
From: Wenmeng Liu <quic_wenmliu@quicinc.com>
In-Reply-To: <748f96f7-d690-4823-845f-67642db97a06@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: uDDGAnk3pdo2ByOo7T_kePCB7wevCY7f
X-Proofpoint-ORIG-GUID: uDDGAnk3pdo2ByOo7T_kePCB7wevCY7f
X-Authority-Analysis: v=2.4 cv=ZP3XmW7b c=1 sm=1 tr=0 ts=682d2d17 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=sEs97sFUeVeiuFhqRTwA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDAxMyBTYWx0ZWRfXwcTIeP4LOMYL
 AdrIFGNSjTaWpm9WrTamLnio5XbmY5JERVRDTONAphkzCoieFEKN2ev42QpkU5q7Gw55aiy3iwz
 J2U7HWyNfpO/48j/VOCNOkhiR7Oe8ailJHs0deeLF/1BVuZwpba1ye97mcxWyy9nl8pnrC71Ms6
 blgZBnqYuqSk/RNUhjxV+LAoPvmcONFDzHERZWQ8DfMFMMxqY+K/Sc0UAri1OvqOQjd4z9b5cDR
 K9Bj2R5RoaZZF0+blp1dKhWSfBQ8hFK3vSqp7TDRFbHKk44azcUja7Z4ww7a2E1Seob9NY4CWjs
 ODtV50cq2S/ojqtkabKk0QhsJZSmgaQapLTvIYCm3HYgD6sWuSKEdliWLx8l5+you9XhQP/2r1T
 Y6+sfBWWuU3e86NCbV/ra/Ng3rG4Cxyj/2MWNuuot22SeIQQ4YSt+s2QhE8DMnarWCQZUrnw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_01,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 mlxlogscore=898 suspectscore=0 bulkscore=0
 impostorscore=0 phishscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505210013



On 2025/5/20 20:19, Vladimir Zapolskiy wrote:
> Hello Wenmeng,
> 
> On 5/20/25 11:56, Wenmeng Liu wrote:
>> This change enables camera driver for QCS615 ADP AIR board.
> 
> what is the rationale of enabling CAMSS on the board without giving any
> description of any sensors connected to the SoC?
> 

Hi Vladimir,

We can perform validation through the CSID TPG(Test Pattern Generator), 
so I enabled CAMSS.

Thanks,
Wenmeng

