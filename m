Return-Path: <linux-media+bounces-16477-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C276956BA6
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2024 15:19:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D0A2283571
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2024 13:19:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EC6D16C6A5;
	Mon, 19 Aug 2024 13:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NvahcXJK"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3473B165F10;
	Mon, 19 Aug 2024 13:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724073535; cv=none; b=sUyfsal08wmTeFBNRON1UpeddpEOan5a/lA6/AlN0ocbbPZ1lj48z577IaIyH/OR059xtsVfQVGbnEGkLNljErAiMHAqwPGC/PXsTLBx+YrME46MTduviInYy3cwZk72G+5aysCpy/62Um4WgM4Vomiz9upbI8P/TK7ku6hSB6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724073535; c=relaxed/simple;
	bh=Gjpfi5nKsgoj+pCmMko/Vgml5378Gry13Qw98ZhnN6U=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JYftqz0rKt7ivdYEyDGPigj46PmeltR9NXZUbAp3fgAJPbEwKWjWZlbO8+REICALH6E3H2XE8TOqs6V9zobnyxFKbqa0f2MMT2Yg5oonvDU21jy5S/HBq9S4dEmPEoZ44WuRg9KV5G2rDrx/vEF8L+uCGMZfSduSZvXCJyGbEPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NvahcXJK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47JBVWt0006603;
	Mon, 19 Aug 2024 13:18:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6mQxHSIRcatyT6tYLO2pRV4iOc33QV6DUM65YYsU6UE=; b=NvahcXJK9vBitc27
	gdr11wzFy6njFb/oGe3jHhnr1q8AkgvsNPmlUqLbvfe4R0nne2uMBC2cSaLeOVwE
	RWW+nUs14ZrOdWhb45T75BYHqtb+XyVsY29p5H3SuYIkCLxsNrdtQ7/jep/Agf4G
	a8ro2UY32g4uRbVbR4KmxJzA+kLoxKkzOQHDgq0jIce2p0oHW65YEUVHMhWFbDer
	z6ifoLuIXURyDmsyQD0racoxZ76uGrzKLkRn73Hdn+NiE368vs0QHMAnOmiUi71P
	km0Bk7+Eg2qcInxG20yFReyaB+K4s8nK3c95gMfQncDidfBKFT07mJrSYM2ux34y
	xvdDkQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 412mmem7h4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Aug 2024 13:18:48 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47JDImHo024299
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Aug 2024 13:18:48 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 19 Aug
 2024 06:18:42 -0700
Message-ID: <6660e46e-14e5-4867-a1b2-d90660310b02@quicinc.com>
Date: Mon, 19 Aug 2024 21:18:40 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/13] media: qcom: camss: Add CSID Gen3 support for
 sm8550
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>, Yongsheng Li <quic_yon@quicinc.com>
References: <20240812144131.369378-1-quic_depengs@quicinc.com>
 <20240812144131.369378-13-quic_depengs@quicinc.com>
 <5b9af1ec-b327-43e1-ad36-067153f7fd98@linaro.org>
Content-Language: en-US
From: Depeng Shao <quic_depengs@quicinc.com>
In-Reply-To: <5b9af1ec-b327-43e1-ad36-067153f7fd98@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: kAXHfOPDtq56O3ctocBZKIGW3qR-Bzcs
X-Proofpoint-ORIG-GUID: kAXHfOPDtq56O3ctocBZKIGW3qR-Bzcs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_11,2024-08-19_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 mlxlogscore=990 priorityscore=1501 bulkscore=0 impostorscore=0
 adultscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408190089

Hi Bryan,

On 8/16/2024 10:45 PM, Bryan O'Donoghue wrote:
> On 12/08/2024 15:41, Depeng Shao wrote:
>> +    for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
>> +        if (csid->phy.en_vc & BIT(i)) {
>> +            writel(BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i),
>> +                        csid->base + CSID_BUF_DONE_IRQ_CLEAR);
>> +            writel(0x1 << IRQ_CMD_CLEAR, csid->base + CSID_IRQ_CMD);
> 
> IRQ_CMD_CLEAR is for the CSID block not per RDI.
> 

Sure, I will move IRQ_CMD_CLEAR outside of this loop.

> I think you need to move the write outside of this loop too.
> 
>> +            writel(BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i),
>> +                        csid->base + CSID_BUF_DONE_IRQ_MASK);
>> +        }
> 

Yes, this also can be moved to outside of the loop. I will update them.

Thanks,
Depeng


