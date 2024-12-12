Return-Path: <linux-media+bounces-23278-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 359A39EE34D
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 10:42:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AEF4828266E
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 09:42:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 351A4210F56;
	Thu, 12 Dec 2024 09:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ImlmS5sT"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C30E2101A2;
	Thu, 12 Dec 2024 09:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733996514; cv=none; b=NGsP5zU9ldBJzkES6ikxygvR7giAGyf0I/G3bUrjYgPNsw0z+THs17bTDsse9THHmH6TZqNHPd2E76BqIvX3DWi5UJStaaZAvseXAdFO9xFQScTNtflyaV7KkQdassc9e9LUVbuCSS12dbJmprSzSHUwU23g2CxZ2Wr9Nduhcsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733996514; c=relaxed/simple;
	bh=P4x70ZGm++1hRMsj6Htrcow4CvLTL9GRHvSCtADYFY8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rr7ROCz7fev9MmszAkfvffV+OxfBzg2XxLnZ5DcLfAVZHbcLEKPwlelEQ0FvHZNO9iMghIAC/0eXjoc/J78Tw23dh+9zUxZZ41Buputjlaym7S4wOqrTfCEMlxVQ6UgLw66GpRcOBd38Air0buI7NCB59U8KRB6FNVSwnx/ohd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ImlmS5sT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC81FsI003601;
	Thu, 12 Dec 2024 09:41:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IAJYMGceS7Gj1MhSVuVPvmJIGMepzo4iLHRILK3EzNk=; b=ImlmS5sT66eRLmgF
	+4TiAl3ceZLX45j3wsPSbc40Iy8aDL5BlIbFmz9G+OiBeQpsTZFi+hQIUZBm9aeP
	v+bE0/9NWfNTeIJh5DHUJLGxy6/xGMmMbEaNWwdYN1T2ytMVGBBEjXohA0pOCWev
	SLZQqZaF1Mks6FbjO5MauFc/X1ofdyDgErHo9lGgSngVLBkGI+PXwMiwq4cN7o1A
	M8aW243qM3zIY+fXe/YegdNWI5uDXQHwbgTGcHvu9Rzy1Ut457/9PpREhNqSvHf+
	lE7vBTShsVdhLh0OF23Ei/M+93FAZoebCGHyb6zNApkhy/yqdDQA37Vnbd7EzInz
	L1owMg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ee3nfyta-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 09:41:47 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BC9flIC006313
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 09:41:47 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 12 Dec
 2024 01:41:41 -0800
Message-ID: <8f2aa73c-f9d3-4523-8595-c35d5ca6f4f7@quicinc.com>
Date: Thu, 12 Dec 2024 17:41:38 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/16] media: qcom: camss: Add callback API for RUP update
 and buf done
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <quic_eberman@quicinc.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>
References: <20241211140738.3835588-1-quic_depengs@quicinc.com>
 <20241211140738.3835588-10-quic_depengs@quicinc.com>
 <1ac23fa1-fc35-45fb-9338-d5f304c869ba@linaro.org>
Content-Language: en-US
From: Depeng Shao <quic_depengs@quicinc.com>
In-Reply-To: <1ac23fa1-fc35-45fb-9338-d5f304c869ba@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: v6MpkaUc7-_dadEUCvG1mu0SIyanfY62
X-Proofpoint-ORIG-GUID: v6MpkaUc7-_dadEUCvG1mu0SIyanfY62
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 mlxscore=0 impostorscore=0
 mlxlogscore=939 lowpriorityscore=0 adultscore=0 clxscore=1015 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412120068

Hi Vladimir,

On 12/12/2024 9:09 AM, Vladimir Zapolskiy wrote:
> Hi Depeng and Bryan.
> 
> On 12/11/24 16:07, Depeng Shao wrote:
>> The RUP registers and buf done irq are moved from the IFE to CSID 
>> register
>> block on recent CAMSS implementations. Add callbacks structure to wrapper
>> the location change with minimum logic disruption.
>>
>> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> It's unexpected to see two your Signed-off-by: tags, either one is invalid
> or the authorship of the change shall be changed appropriately.
> 

Thanks for pointing out this, I will update it based on Bryan's suggestion.

Thanks,
Depeng


