Return-Path: <linux-media+bounces-11186-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3558C0C18
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 09:48:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 64510B22C3D
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 07:47:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83E68149C69;
	Thu,  9 May 2024 07:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="E7bvP6ke"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0B513C9A9;
	Thu,  9 May 2024 07:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715240869; cv=none; b=eZTbW3FvkVIVSbWlVZSKfzcC1BV78MwkMmYtmyX7LFNg0YER2e2FdrPH+Ot+XY1LKsd3dqsDBLkAzTN/rp+h4UrB4zhOs+fXAAzjwIgs7RQTq0m7qrabQJ7UIVHJCM577BA4vitOov3YuyVFMLqGTVZl4VI03t+ONtrrH3gPrus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715240869; c=relaxed/simple;
	bh=WSpinETt9ddM11kZM/g7bBn58Ik9E4gtbJ2CZCu87TQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Mp+bD8GUDXNS/t3sfU+SjBOE+ist2bMRTYku7chmXs2ViamEeETTPJPpTWGQ/LGosoX6VwxC3X63j6TBwkGcifKaQ6BDcse3okwflPy5f2mXgg5aAbq/z9Pwrh+h6o5kCLKJFwbdiVcn4GwOqUQooFKM1c9pVOtFUMSbphwTB2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=E7bvP6ke; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4497AOWq002489;
	Thu, 9 May 2024 07:47:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=OOkO59AaVpUJrC9ZzlQ801CtxogZJTDH0rDydpTKqFE=; b=E7
	bvP6keAtfoFcnS49e7bEoSoWWCg+OPdwfPjGlfeTTAyeGpsVd7fWf1v8qtDIX+Hk
	3pORv9C2eTpOvbvYr2dJ8rXT5goxaPUDuA4YlKs9vIpsxKFK6oNAp5/xr9YMY3Yh
	z2grXBM/OXRgqAFjV3Vw4bJ2J62fslmDtQTfxM+LEg34ECe3vebsYkO3HoWIGl8G
	JN0wIhrMnM3rFPttENK04r3j42fje3cRVT7h2nAljHbmPovkZUEu7snSxHO+gm0q
	Y7Qovds73luxhWmrdsVAgh9fVcNXtE1WdQLcdmLGjv9dnGFLVGPqKpoW0MgDkMD9
	wSfaECaxkZDK+VT0xWBg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y07u8tbdu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 May 2024 07:47:38 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4497lbV3031137
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 May 2024 07:47:37 GMT
Received: from [10.251.44.50] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 9 May 2024
 00:47:34 -0700
Message-ID: <2a244afe-db2a-4b4a-a770-5664c887c8ef@quicinc.com>
Date: Thu, 9 May 2024 10:47:32 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: i2c: Fix imx412 exposure control
Content-Language: en-US
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>
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
 <171518540550.191612.743149233311332771@ping.linuxembedded.co.uk>
From: "Gjorgji Rosikopulos (Consultant)" <quic_grosikop@quicinc.com>
In-Reply-To: <171518540550.191612.743149233311332771@ping.linuxembedded.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: enAwVmUTNyEDS3ZRPNOhhkDun1VwGkvD
X-Proofpoint-ORIG-GUID: enAwVmUTNyEDS3ZRPNOhhkDun1VwGkvD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-09_03,2024-05-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 adultscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405010000
 definitions=main-2405090052

Hi Kieran,

On 5/8/2024 7:23 PM, Kieran Bingham wrote:
> Quoting Jacopo Mondi (2024-05-08 13:43:34)
>> Hi Bryan
>>
>> On Wed, May 08, 2024 at 01:30:31PM GMT, Bryan O'Donoghue wrote:
>>> On 08/05/2024 09:02, Jacopo Mondi wrote:
>>>> Hi Bryan
>>>>
>>>> On Mon, May 06, 2024 at 11:38:26PM GMT, Bryan O'Donoghue wrote:
>>>>> Currently we have the following algorithm to calculate what value should be
>>>>> written to the exposure control of imx412.
>>>>>
>>>>> lpfr = imx412->vblank + imx412->cur_mode->height;
>>>>> shutter = lpfr - exposure;
>>>>>
>>>>> The 'shutter' value is given to IMX412_REG_EXPOSURE_CIT however, the above
>>>>> algorithm will result in the value given to IMX412_REG_EXPOSURE_CIT
>>>>> decreasing as the requested exposure value from user-space goes up.
>>>>>
>>>>> e.g.
>>>>> [ 2255.713989] imx412 20-001a: Received exp 1608, analog gain 0
>>>>> [ 2255.714002] imx412 20-001a: Set exp 1608, analog gain 0, shutter 1938, lpfr 3546
>>>>> [ 2256.302770] imx412 20-001a: Received exp 2586, analog gain 100
>>>>> [ 2256.302800] imx412 20-001a: Set exp 2586, analog gain 100, shutter 960, lpfr 3546
>>>>> [ 2256.753755] imx412 20-001a: Received exp 3524, analog gain 110
>>>>> [ 2256.753772] imx412 20-001a: Set exp 3524, analog gain 110, shutter 22, lpfr 3546
>>>>>
>>>>> This behaviour results in the image having less exposure as the requested
>>>>> exposure value from user-space increases.
>>>>>
>>>>> Other sensor drivers such as ov5675, imx218, hid556 and others take the
>>>>> requested exposure value and directly.
>>>>
>>>> has the phrase been truncated or is it me reading it wrong ?
>>>
>>> Sod's law says no matter how many times you send yourself a patch before
>>> sending it to LKML you'll find a typo ~ 2 seconds after reading your patch
>>> on LKML.
>>>
>>
>> Sounds familiar enough
>>
>>>
>>>>> Looking at the range of imx sensors, it appears this particular error has
>>>>> been replicated a number of times but, I haven't so far really drilled into
>>>>> each sensor.
>>>>
>>>> Ouch, what other driver have the same issue ?
>>>
>>> So without data sheet or sensor its hard to say if these are correct or
>>> incorrect, it's the same basic calculation though.
>>>
>>> drivers/media/i2c/imx334.c::imx334_update_exp_gain()
>>>
>>>         lpfr = imx334->vblank + imx334->cur_mode->height;
>>>         shutter = lpfr - exposure;
>>>
>>>         ret = imx334_write_reg(imx334, IMX334_REG_SHUTTER, 3, shutter);
>>>
>>>
>>> drivers/media/i2c/imx335.c::imx335_update_exp_gain()
>>>
>>>         lpfr = imx335->vblank + imx335->cur_mode->height;
>>>         shutter = lpfr - exposure;
>>>
>>>         ret = imx335_write_reg(imx335, IMX334_REG_SHUTTER, 3, shutter);
> 
> Is this a copy / paste error (IMX334), or are you using a downstream/alternative
> driver?

Those drivers was posted as part of intel keembay project upstream effort.

The drivers where verified but they had some rework during the internal
review process. And it seems there was copy/paste error on imx412 (which
i also missed during the review).

To remove the confusion. there are no issues with imx334 and imx335,
those sensors are using shutter for setting exposure time.

With this change imx412 is also working fine it was verified on our side.

> 
> Upstream implements this:
> 
> /**
>  * imx335_update_exp_gain() - Set updated exposure and gain
>  * @imx335: pointer to imx335 device
>  * @exposure: updated exposure value
>  * @gain: updated analog gain value
>  *
>  * Return: 0 if successful, error code otherwise.
>  */
> static int imx335_update_exp_gain(struct imx335 *imx335, u32 exposure, u32 gain)
> {
> 	u32 lpfr, shutter;
> 	int ret;
> 
> 	lpfr = imx335->vblank + imx335->cur_mode->height;
> 	shutter = lpfr - exposure;
> 
> 	dev_dbg(imx335->dev, "Set exp %u, analog gain %u, shutter %u, lpfr %u\n",
> 		exposure, gain, shutter, lpfr);
> 
> 	ret = imx335_write_reg(imx335, IMX335_REG_HOLD, 1, 1);
> 	if (ret)
> 		return ret;
> 
> 	ret = imx335_write_reg(imx335, IMX335_REG_LPFR, 3, lpfr);
> 	if (ret)
> 		goto error_release_group_hold;
> 
> 	ret = imx335_write_reg(imx335, IMX335_REG_SHUTTER, 3, shutter);
> 	if (ret)
> 		goto error_release_group_hold;
> 
> 	ret = imx335_write_reg(imx335, IMX335_REG_AGAIN, 2, gain);
> 
> error_release_group_hold:
> 	imx335_write_reg(imx335, IMX335_REG_HOLD, 1, 0);
> 
> 	return ret;
> }
> 
>>>
>>>
>>> Looking again I'm inclined to believe the imx334/imx335 stuff is probably
>>> correct for those sensors, got copied to imx412/imx577 and misapplied to the
>>> EXPOSURE control in imx412.
> 
> We're directly using the IMX335 driver in mainline on the i.MX8MP (and
> also validated on Raspberry Pi 5). AGC is operational on both those
> platforms with the sensor, so I have no reason to believe there is any
> error in the upstream driver:
> 
>  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/i2c/imx335.c

That is correct, there are no issues with imx334 and imx335.

~Gjorgji

> 
> 
> --
> Kieran
> 
> 
>>>
>>
>> Without datasheet/devices it really is hard to tell. Cargo cult at
>> play most probably.
>>
>>>
>>>>> - ret = imx412_write_reg(imx412, IMX412_REG_EXPOSURE_CIT, 2, shutter);
>>>>> + ret = imx412_write_reg(imx412, IMX412_REG_EXPOSURE_CIT, 2, exposure);
>>>>
>>>> No datasheet here, can you confirm the IMX412_REG_EXPOSURE_CIT
>>>> register is actually in lines ?
>>>
>>>
>>> Looks like.
>>>
>>> From downstream "coarseIntgTimeAddr"
>>>
>>> imx577_sensor.xml
>>>     <coarseIntgTimeAddr>0x0202</coarseIntgTimeAddr>
>>>
>>> imx586/imx586_sensor.cpp
>>> pRegSettingsInfo->regSetting[regCount].registerAddr  =
>>> pExposureData->pRegInfo->coarseIntgTimeAddr + 1;
>>>
>>> pRegSettingsInfo->regSetting[regCount].registerData  = (lineCount & 0xFF);
>>>
>>>> Apart from that, as the CID_EXPOSURE control limit are correctly
>>>> updated when a new VBLANK is set by taking into account the exposure
>>>> margins, I think writing the control value to the register is the
>>>> right thing to do (if the register is in lines of course)
>>>>
>>>> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>>>>
>>>> Thanks
>>>>    j
>>>>
>>>
>>> If that's good enough I'll fix the typo and apply your RB.
>>
>> Sure
>>
>> Thanks
>>   j
>>
>>>
>>> ---
>>> bod
>>>
> 

