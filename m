Return-Path: <linux-media+bounces-16351-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B85495377E
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2024 17:43:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD7C51C250C4
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2024 15:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F3A21B1427;
	Thu, 15 Aug 2024 15:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="b9HMzwuU"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0391AD3F7;
	Thu, 15 Aug 2024 15:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723736597; cv=none; b=DheTcl6+U+K8dWOl1neWrIBEIJozMwmE5372qLSLIa6dgH8GDwBoT+IGon+iHKuV4wr2NCxAf9NdlSq+jZ6oTeymzm28IcuFKJZgb6nl76m4F1O8EK+OjigSXSucqq3CQTP9fvy6JHImQNIrjO+JHYS91qGVFGkgawOTqspRPLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723736597; c=relaxed/simple;
	bh=tBcHQi3i5KC4GbpIUxL7ctt8uCWrcYcOXO6IpVSWLr0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Dibc5BPYUfJCpAUfBvR1N4r+KPiWT/AIgGEnCmUf/saHG12NROCvB+YgxxOwxu8zAYtmnJhY2BRM4q//iw5n3wTbs3R7g8owBOY6rEvTLL4VSMMQFKRayJXnedvxrH9nNs+F4Iubp4mN9BJl5eS3egpXeB3f4eIQ6nfr/InQwZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=b9HMzwuU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47F7GjGx027121;
	Thu, 15 Aug 2024 15:43:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cc5I816aayP0mBk0qxI4DbcgcOavj8/4JMXIypN4nOM=; b=b9HMzwuUBChD3jXQ
	Dxv888teONxnPTj9jKz48fhmnK+UurW3UBh1XdWARlsIUEChOaVCTGowNEuzSUiC
	xadUvrfIv0ffcLcsfbhDc4Z34vLQoXjWujFIOfEcUIX2egqh4+jIjbJYbqaU8exz
	rKJPC1N+TOUNRm2xTFUzQzLNZRyZkf546ImqZqfGOSAgW2QSPtJXe5aOouRvXG+s
	DHcXxZCfGfMHpf0KA9voAJAP83JJkR55TLZyCLYxFWC7/h1LnOG7laOLqGoCfG57
	f2pzh3mshTBy+TMs0v6B7UAgkp9h6zH+TbHSh2snINaoZ4mY6+Fvu1UL4L6gVKsW
	HlfYBQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 411d5696n8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Aug 2024 15:43:11 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47FFhA9e009900
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Aug 2024 15:43:10 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 15 Aug
 2024 08:43:04 -0700
Message-ID: <5ecbcd10-d9b7-4134-9666-6df790527b1f@quicinc.com>
Date: Thu, 15 Aug 2024 23:43:02 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/13] media: qcom: camss: Add support for VFE hardware
 version Titan 780
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>, Yongsheng Li <quic_yon@quicinc.com>
References: <20240812144131.369378-1-quic_depengs@quicinc.com>
 <20240812144131.369378-14-quic_depengs@quicinc.com>
 <4b745c1a-33d9-472a-97af-153a2a7c8721@linaro.org>
 <2de0b7a8-b879-49e9-9656-ec86f29ce559@quicinc.com>
 <b0787142-0f85-4616-9895-72e33f21c2da@linaro.org>
 <82200889-a98d-4815-bc31-f81b15d02513@quicinc.com>
 <7130beef-7787-42a1-85c8-f27574241ba7@linaro.org>
Content-Language: en-US
From: Depeng Shao <quic_depengs@quicinc.com>
In-Reply-To: <7130beef-7787-42a1-85c8-f27574241ba7@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: SOKR9LGmzhsvDDb1iqN5A6exNM_nnP1n
X-Proofpoint-ORIG-GUID: SOKR9LGmzhsvDDb1iqN5A6exNM_nnP1n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-15_08,2024-08-15_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408150114

Hi Vladimir,

>>
>> Thanks for the confirmation, even though I add the rup_update and
>> buf_done function in later commits, it is still called in platform
>> specific code(camss-vfe-780.c), so I will keep as it is done today.
> 
> let it be so.
> 
> I have another ask about it, please move new camss_reg_update() out from
> camss.c into camss-csid.c, and camss_buf_done() from camss.c into camss- 
> vfe.c
> 

The cross direct call has been removed by below commit, so it looks 
strange if I add the cross direct call.

media: qcom: camss: Decouple VFE from CSID
https://lore.kernel.org/lkml/20240522154659.510-9-quic_grosikop@quicinc.com/

I use the v4l2_subdev_notify to do the cross communication in v1 and v2 
series, but Bryan said, "The subdev notify is I think not the right fit 
for this purpose within our driver.".
Then I add an internal notify interface in camss structure, but Bryan 
suggested to use direct call, so I add these functions directly in camss.c

https://lore.kernel.org/all/236cfe43-8321-4168-8630-fb9528f581bd@linaro.org/

Thanks,
Depeng

