Return-Path: <linux-media+bounces-16387-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7B3954900
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2024 14:43:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 518BDB23611
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2024 12:43:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04E5C1B86C1;
	Fri, 16 Aug 2024 12:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZYtfJXs1"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDEF1B3F08;
	Fri, 16 Aug 2024 12:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723812169; cv=none; b=KFHTqDOJXyvBTELcr+bsb/ae13+8GvU811zauM12LYs1LG7cWhczDzGmObJDQp6zgwfIYZz64Vsv29wfc0Mm7mKl4mtIsjpk/yU9clqLv1TUO8pWnLEuD95bJjXGmnTrHECM7QR8fgjdVXdg2Sifgua4bHBT6+GghBg9R+c1ogY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723812169; c=relaxed/simple;
	bh=qY+BKcV1QJLSNJP2L18fdcbi6799Za9UeU7BvMK/iDQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tIqqfptHGkcMoDlPkVcNf19cnMgpMI2Iluj4H23NYuYZ80EASYYhhxY4wkVpE+jdY1LDWrkwMHYh0FXvtithKusgI+i20BgGOx9R9ztUYoAW3fXNYMQqZUV4BN22VoVl+cEVkAUGFdyuptEIkYPtK9g3aGpDstoNnHDSXMJqXrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZYtfJXs1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47G8ZSBf008617;
	Fri, 16 Aug 2024 12:42:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FSGM7Z7frwAZYrHwwjdoJgBdsi+vSGc631EYgUU93Ak=; b=ZYtfJXs1TMHjeIXJ
	7sCtWDBHLq3SvL+Z57SKw9nYPl+t+AMkrxjk2Zp4ouQ4CFSdqd0ycAmNr++x891o
	V685sYd1AEemHpWIlPDHj+zmv3EHyRmujqEP+AYPUJX+rLYWCzj0YDZUBxi/nqGX
	il3sf6nnUsQxR8wX9HLEW7YXygjY0d/a5HUlz0JBg3xH04W84p2oTeeCX5wLcQXe
	43wVbe0UmrZZ9DTrWxRvqmFAqNPz/txSHWFpK+OSvx0nY2jmWJRjlioPkrvCct4i
	XWTHdn5e5+PZ5fo3wh08K/aWncP/jw3xCX7QU5DDb1pFnqWmIt2/2YAf0bEznRsC
	LbNxsg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4123cugmpd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 12:42:42 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47GCgfQp005317
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 12:42:41 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 16 Aug
 2024 05:42:35 -0700
Message-ID: <de2c8fa3-afc1-4163-aae5-3868ca59e95e@quicinc.com>
Date: Fri, 16 Aug 2024 20:42:32 +0800
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
 <5ecbcd10-d9b7-4134-9666-6df790527b1f@quicinc.com>
 <56211603-de02-4b8f-a7c6-a4d80ace4e2f@linaro.org>
Content-Language: en-US
From: Depeng Shao <quic_depengs@quicinc.com>
In-Reply-To: <56211603-de02-4b8f-a7c6-a4d80ace4e2f@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Hxb6zIEHULxVFgXXJQV6tNkVTVIRFSCS
X-Proofpoint-ORIG-GUID: Hxb6zIEHULxVFgXXJQV6tNkVTVIRFSCS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-16_03,2024-08-16_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 clxscore=1015 mlxlogscore=999 priorityscore=1501 spamscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408160092

Hi Vladimir,

On 8/16/2024 5:31 AM, Vladimir Zapolskiy wrote:
> Hi Depeng.
> 
> On 8/15/24 18:43, Depeng Shao wrote:
>> Hi Vladimir,
>>
>>>>
>>>> Thanks for the confirmation, even though I add the rup_update and
>>>> buf_done function in later commits, it is still called in platform
>>>> specific code(camss-vfe-780.c), so I will keep as it is done today.
>>>
>>> let it be so.
>>>
>>> I have another ask about it, please move new camss_reg_update() out from
>>> camss.c into camss-csid.c, and camss_buf_done() from camss.c into camss-
>>> vfe.c
>>>
>>
>> The cross direct call has been removed by below commit, so it looks
>> strange if I add the cross direct call.
>>
>> media: qcom: camss: Decouple VFE from CSID
>> https://lore.kernel.org/lkml/20240522154659.510-9- 
>> quic_grosikop@quicinc.com/
> 
> This I don't understand, please elaborate. I don't ask for a "cross direct
> call", but you do introduce a CSID specific function in the generic camss.c
> and another VFE specific function in the same camss.c
> 

CSID calls vfe_get/vfe_put to power up/reset vfe hw in old code, but 
above decouple commit removes this cross direct call, this commit has 
been merged recently.

> What I ask is just move the current versions of camss_buf_done() and
> camss_reg_update() out from camss.c to the files, which are related to the
> sub-IP blocks, and of course move the function declarations from camss.h
> into camss-vfe.h and camss-csid.h respectively.
> 
> If possible there shall be no CSID or VFE specific specific code in 
> camss.c,
> and that fact is that it's possible.
> 

Yes, I understand what you mean. Let's take camss_buf_done as example, 
if we move camss_buf_done to camss-vfe.c, but this function is called in 
csid csid driver, so here will have a cross direct call again, 
camss_reg_update is same. Since the cross call is removed in above 
commit, then it will be strange if I do this again.

So, I moved them to camss.c

>> I use the v4l2_subdev_notify to do the cross communication in v1 and v2
>> series, but Bryan said, "The subdev notify is I think not the right fit
>> for this purpose within our driver.".
> 
> As far as I see all of that is irrelevant.
> 
>> Then I add an internal notify interface in camss structure, but Bryan
>> suggested to use direct call, so I add these functions directly in 
>> camss.c
>>
>> https://lore.kernel.org/all/236cfe43-8321-4168-8630- 
>> fb9528f581bd@linaro.org/
>>
> 

Thanks,
Depeng


