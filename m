Return-Path: <linux-media+bounces-22765-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBDD9E6456
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 03:42:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10D8E1882907
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 02:42:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E0B2187FF4;
	Fri,  6 Dec 2024 02:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="p4FSEVb5"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794EE13B79F;
	Fri,  6 Dec 2024 02:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733452918; cv=none; b=sbf2t38oR3epo7JXvwilj0r7PEYZVp5w6T1MlDvQUyDzLAplKOGa6J2RJwCeZ/5oU80DnR9j5LbpvIslYrg+rJUv9QuIFD/tmyU69PVI35KD8GdNr3WqUavuWCVk6iM1fQTtyxk2lv/GIBQPLC/sjWC2Rt5OgR0zrt3FnLL5bFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733452918; c=relaxed/simple;
	bh=hkie6Td8aEmmxDU5EiE/XMo50yGxSzw65h7xvc96+4o=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GVTz3hUFDBIp214XJ9cg8yJjc+zr6/Vx2kyFsg5xUHjofhAETnRiqxD8a5zIJ6+yD+otY+YQUeRvB2iaczuGtj9IjqIt0XN5F4DdroTJBiAKvrosBxjYZyVc3l59H4KGhrwRnj7fxBmUtseDPqoRdT0TR8HGM8FUIATXTKZPz7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=p4FSEVb5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5Haoib031775;
	Fri, 6 Dec 2024 02:41:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O7uxeireVXoOnF+HmfpyGHhXAGMRGVBD95AHOPH1eaY=; b=p4FSEVb5FgPXjDbS
	rHUUKYRpq1UvmZFnRfkFI+fcK9eHKM9Ywt3SaivaXIRdo3E85XLWPDNlnbaooJ9Q
	wAV3fF0sHrq9mjBW4AAX9CentZTOX/J5OgiXrQTigSIRS9QKQOMMXCvWJzuHvf3q
	9W1UUj+bORFIUo3pGSb0JR3Ks2DqDZdTHinqLBiUN024q+g/NlLBjbQlFvoSPYCB
	yRhcQK1BJrUrBQlJnNfl2q/P9XJEtFDwqPw/omquzBTGrTOIBVoUp8fnM6ow6Y0l
	Udi+eRzrfMZSSkDfG5K46O4d6EBt2Vy4tLS97D5faILxfIH62T2cIbiRHzP9jK6v
	FI5yYQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43be171n39-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 02:41:52 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B62fbUJ007549
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 02:41:37 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Dec 2024
 18:41:31 -0800
Message-ID: <0ebebd30-92e8-4018-b81d-05e171a9593a@quicinc.com>
Date: Fri, 6 Dec 2024 10:41:27 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/16] media: qcom: camss: Add support for VFE hardware
 version Titan 780
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
 <20241205155538.250743-17-quic_depengs@quicinc.com>
 <94a753ab-9fe6-43b4-aa50-cf94a55db8f9@linaro.org>
Content-Language: en-US
From: Depeng Shao <quic_depengs@quicinc.com>
In-Reply-To: <94a753ab-9fe6-43b4-aa50-cf94a55db8f9@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 21tYrCYe0ARKZDvqUdGockcl8uNblfLb
X-Proofpoint-ORIG-GUID: 21tYrCYe0ARKZDvqUdGockcl8uNblfLb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501 mlxscore=0
 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060018

Hi Bryan,

On 12/6/2024 8:18 AM, Bryan O'Donoghue wrote:
> Just to re-illustriate the point
> 
> "[PATCH 16/16] media: qcom: camss: Add support for VFE hardware version 
> Titan 780"
> 
> You have CSID 780 + sm8550 in the CSID patch but VFE for Titan 780.
> 
> Just "VFE 780" please
> 

Sure, I will update the title to "media: qcom: camss: Add support for 
VFE 780".

And, csid patch title will be "media: qcom: camss: Add support for CSID 
780".

> 
> Assuming you update the title of the patch, you can add:
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


Thanks,
Depeng

