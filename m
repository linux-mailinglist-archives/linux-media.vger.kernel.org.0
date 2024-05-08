Return-Path: <linux-media+bounces-11159-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD3C8C01A3
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2024 18:03:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 51B4FB23BAF
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2024 16:03:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D083C12881C;
	Wed,  8 May 2024 16:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GK+PApwa"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D8C7D3F5;
	Wed,  8 May 2024 16:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715184183; cv=none; b=DTa1uEuiJbaCHTOWM6nwodI/pNhOBmBwNZFHuDcy61F1Ue5USUeBj4NbrgXvRn1AQtIyudePxU9S2KE3ZdUUVbL4xfFYY0pgsfH4c0ywQ8wUMWVaALNZzfROHFDwG707O/EjsyAwMQdUa5mQeJ4ORXSk8FbuwiwNtgktG4O3qco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715184183; c=relaxed/simple;
	bh=Ll//VoVDHZZOpR+aC8rbiPwa8StXmqBY7O2t8/fT3GU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SM4eFbb8UIV1Y1jSKZ468Rc8mOn2KcMljQTbaL6PURzydf1QJkfyDVsLEiLH/dUYkCaPEmTWY4V+3x4Oo0ctIquz/JvbDCOMTdcAKcQ2NLdm1RtATP+FiZ0VwGJdTaDsMbH7CDDIw2fmq+xJPW7Ok17BoLTRRAjzCIHc7w/lIRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GK+PApwa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 448CXSot007031;
	Wed, 8 May 2024 16:02:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=5unaZ1aut5Ect8Grm4yjqfdOthp6O3qSBIJ4/C/C1Qc=; b=GK
	+PApwapkhkbgTIXok4S9h+tje4wnCF0ILDGac/w9C7mpo3Im6RLxJTDei4+zRuzY
	AZduja2UoIUsj+tnyHDuLNH8vpx5xHPpuvbwjQ5PGNzrwi8Gfmg54NzI7fNiRbYS
	q3g4uoHsQ2KdxqPtK+8B/QPVXzNk404AiJf8KqNma7vdPBcjSUBgZujYgioNIJk8
	vc67YlUWDAJijyvltJFb47fucpTfcO3qPda13jyMR0n4/CWtfOLk+DPgTbJQQTj7
	dcxviIIrI5NpiRxlI0lwti084YC7emkdBKT7AWuWm3NvN7c29df82cCTWroEc7pn
	lUwPnml9TgvMRvX791ig==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y09geggsr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 May 2024 16:02:43 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 448G2gYX013228
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 May 2024 16:02:42 GMT
Received: from [10.251.44.50] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 May 2024
 09:02:40 -0700
Message-ID: <ca8865e9-b41c-49a6-a7b0-39b133be34a1@quicinc.com>
Date: Wed, 8 May 2024 19:02:37 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: i2c: Fix imx412 exposure control
Content-Language: en-US
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        "Paul J. Murphy" <paul.j.murphy@intel.com>,
        "Martina
 Krasteva" <quic_mkrastev@quicinc.com>,
        Daniele Alessandrelli
	<daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab
	<mchehab+huawei@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240506-b4-linux-next-camss-x13s-mmsol-integration-in-test-imx577-fix-v2-1-2e665f072f8f@linaro.org>
 <dvyed4grpazqk7a3tz6dqwpkd76ghtrt4euinxt3kycdeh63ez@ljgfjsfhypix>
 <20a0300a-ac16-456c-840a-e272f49050a8@linaro.org>
 <bppn2qglcya3xbfy7uey5cgybyanxthhweqv7foojwi5rvqwmk@temzdedvecfe>
From: "Gjorgji Rosikopulos (Consultant)" <quic_grosikop@quicinc.com>
In-Reply-To: <bppn2qglcya3xbfy7uey5cgybyanxthhweqv7foojwi5rvqwmk@temzdedvecfe>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: OUqYi_vGtUfi6vG2GY9tWITrKDw_geNk
X-Proofpoint-ORIG-GUID: OUqYi_vGtUfi6vG2GY9tWITrKDw_geNk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-08_09,2024-05-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0 malwarescore=0
 mlxlogscore=991 impostorscore=0 clxscore=1011 adultscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405080116

Hi Bryan, Jacopo,

On 5/8/2024 3:43 PM, Jacopo Mondi wrote:
> Hi Bryan
> 
> On Wed, May 08, 2024 at 01:30:31PM GMT, Bryan O'Donoghue wrote:
>> On 08/05/2024 09:02, Jacopo Mondi wrote:
>>> Hi Bryan
>>>
>>> On Mon, May 06, 2024 at 11:38:26PM GMT, Bryan O'Donoghue wrote:
>>>> Currently we have the following algorithm to calculate what value should be
>>>> written to the exposure control of imx412.
>>>>
>>>> lpfr = imx412->vblank + imx412->cur_mode->height;
>>>> shutter = lpfr - exposure;
>>>>
>>>> The 'shutter' value is given to IMX412_REG_EXPOSURE_CIT however, the above
>>>> algorithm will result in the value given to IMX412_REG_EXPOSURE_CIT
>>>> decreasing as the requested exposure value from user-space goes up.
>>>>
>>>> e.g.
>>>> [ 2255.713989] imx412 20-001a: Received exp 1608, analog gain 0
>>>> [ 2255.714002] imx412 20-001a: Set exp 1608, analog gain 0, shutter 1938, lpfr 3546
>>>> [ 2256.302770] imx412 20-001a: Received exp 2586, analog gain 100
>>>> [ 2256.302800] imx412 20-001a: Set exp 2586, analog gain 100, shutter 960, lpfr 3546
>>>> [ 2256.753755] imx412 20-001a: Received exp 3524, analog gain 110
>>>> [ 2256.753772] imx412 20-001a: Set exp 3524, analog gain 110, shutter 22, lpfr 3546
>>>>
>>>> This behaviour results in the image having less exposure as the requested
>>>> exposure value from user-space increases.
>>>>
>>>> Other sensor drivers such as ov5675, imx218, hid556 and others take the
>>>> requested exposure value and directly.
>>>
>>> has the phrase been truncated or is it me reading it wrong ?
>>
>> Sod's law says no matter how many times you send yourself a patch before
>> sending it to LKML you'll find a typo ~ 2 seconds after reading your patch
>> on LKML.
>>
> 
> Sounds familiar enough
> 
>>
>>>> Looking at the range of imx sensors, it appears this particular error has
>>>> been replicated a number of times but, I haven't so far really drilled into
>>>> each sensor.
>>>
>>> Ouch, what other driver have the same issue ?
>>
>> So without data sheet or sensor its hard to say if these are correct or
>> incorrect, it's the same basic calculation though.
>>
>> drivers/media/i2c/imx334.c::imx334_update_exp_gain()
>>
>>         lpfr = imx334->vblank + imx334->cur_mode->height;
>>         shutter = lpfr - exposure;
>>
>>         ret = imx334_write_reg(imx334, IMX334_REG_SHUTTER, 3, shutter);
>>
>>
>> drivers/media/i2c/imx335.c::imx335_update_exp_gain()
>>
>>         lpfr = imx335->vblank + imx335->cur_mode->height;
>>         shutter = lpfr - exposure;
>>
>>         ret = imx335_write_reg(imx335, IMX334_REG_SHUTTER, 3, shutter);
>>
>>
>> Looking again I'm inclined to believe the imx334/imx335 stuff is probably
>> correct for those sensors, got copied to imx412/imx577 and misapplied to the
>> EXPOSURE control in imx412.
>>
> 
> Without datasheet/devices it really is hard to tell. Cargo cult at
> play most probably.

I have explained in previous email. But i will post here as well :-)


As far as i know this issue is only for this imx412 sensor driver.
The sensor driver for imx412 was submitted along with imx335 and imx334,
maybe after all the reworking this was missed.
imx334 and imx335 are using shutter for setting the exposure from where
this calculation is taken.

However imx412 uses number of lines for exposure.

Reviewed-by: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>

~Gjorgji

> 
>>
>>>> -	ret = imx412_write_reg(imx412, IMX412_REG_EXPOSURE_CIT, 2, shutter);
>>>> +	ret = imx412_write_reg(imx412, IMX412_REG_EXPOSURE_CIT, 2, exposure);
>>>
>>> No datasheet here, can you confirm the IMX412_REG_EXPOSURE_CIT
>>> register is actually in lines ?
>>
>>
>> Looks like.
>>
>> From downstream "coarseIntgTimeAddr"
>>
>> imx577_sensor.xml
>>     <coarseIntgTimeAddr>0x0202</coarseIntgTimeAddr>
>>
>> imx586/imx586_sensor.cpp
>> pRegSettingsInfo->regSetting[regCount].registerAddr  =
>> pExposureData->pRegInfo->coarseIntgTimeAddr + 1;
>>
>> pRegSettingsInfo->regSetting[regCount].registerData  = (lineCount & 0xFF);
>>
>>> Apart from that, as the CID_EXPOSURE control limit are correctly
>>> updated when a new VBLANK is set by taking into account the exposure
>>> margins, I think writing the control value to the register is the
>>> right thing to do (if the register is in lines of course)
>>>
>>> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>>>
>>> Thanks
>>>    j
>>>
>>
>> If that's good enough I'll fix the typo and apply your RB.
> 
> Sure
> 
> Thanks
>   j
> 
>>
>> ---
>> bod
>>
> 

