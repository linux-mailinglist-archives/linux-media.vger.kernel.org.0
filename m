Return-Path: <linux-media+bounces-52660-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qC1+JKfpjWnG8gAAu9opvQ
	(envelope-from <linux-media+bounces-52660-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 15:54:31 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD8F12EA1B
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 15:54:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9B58F30DAE7A
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 14:50:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70FCB35C1AB;
	Thu, 12 Feb 2026 14:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YGE1H3k0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TBlh8iBs"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419BC35C1B7
	for <linux-media@vger.kernel.org>; Thu, 12 Feb 2026 14:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770907841; cv=none; b=IzAhmlDdU1Q5gCL5SIDHHzMvEPoRb+6MhTrMZk6mwi13oymtiuWSh9Xo15kNBy/GvKL2NzfTp10HVhjm+RQTJVr/IXAJgo6bNRW0Y2sUpc/HFnFXxPLAdynlk5fn6bqFckOlNC8l3jqrGeMilMRhhzdCFoP5omjEWP+EFsd7wqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770907841; c=relaxed/simple;
	bh=TbqN5JLaryI0tzOo31pgU0unhHmJom7G7NSzwMOHvdg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KFHAOLAfNHPnYx9KWeTsvUBursZBrThopevvIpZtcEZLad0drxBOc9M59bfSe2EKav//Alc56ydW34eZJFej2HBDb61oU8icUgY2PcG5mChlLBAhR1O1lCGO1gvuP2BS5SID+z2l39oV8Whjv1SQyX8zrk2gWnisbJDeqGw9JSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YGE1H3k0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TBlh8iBs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CDRfBA1580786
	for <linux-media@vger.kernel.org>; Thu, 12 Feb 2026 14:50:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mkdIQKCORgBHmpzhYnqV+lMcVLWl9ZTC9POI19y5zYg=; b=YGE1H3k0jIt8b2Z5
	qve/zApEkliL9nO2jVBRtekQPh9xxy+zcJ8htTv4AxHfh0f4Tw4qaqzBsbfE6ild
	MMjACNpbT4kxfADloceWMNtHXD3Qv53FIhB46RIVgdCmAb8QayM+FrZOn2nRtznP
	zhdRrV7hel0WlDwkM7ozc5ZdJ+ZVOwkEQ6Gdynvy0d+S9t6hrXdRgXWr120BR0iL
	ncmuhg6MdsGtGMWbv4TQPK35EqcsOoY5Ea0GR4OX2VHawv9JmbWSJSOhSQgYICT8
	HAFXN2iWLicopcuPrHv+ZCG/DUuPgSc77MCSASg3DvKXeA8J5hXHCrA7c9wHC/Ov
	Wv6Qkw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8y9buc0c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 12 Feb 2026 14:50:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb38a5dc3cso9919785a.3
        for <linux-media@vger.kernel.org>; Thu, 12 Feb 2026 06:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770907837; x=1771512637; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mkdIQKCORgBHmpzhYnqV+lMcVLWl9ZTC9POI19y5zYg=;
        b=TBlh8iBsrR0yERTWoCdf6IivWvqNhy/P22sMr++OCGTqqRtjBUxGhnSUy7oHPhzcIz
         c/uPw0a+DUNUrNFzs7kvb/38gHTpxreHgyokD9vE8FIVMfZ5oiz3ioWxlEmsRfbmQziM
         n+Upnbwsq3muPm17BEJ1NvgbSozcnulUa1KMWHqR2gGlO56pGHdIz+VtyoAkYaahWA5t
         dEpyS5bvHFedXS1t3aC+ozYHzMD9ku3iILYR5gWRYcRczf/5JLkO9dumhtGybFBnPiht
         5UvuZHaVVUhNyo9NNyXIzjwpzW1EcFUnwvK7W56QPvNA3ySy0OgA4ko0azCU2LlV06JJ
         dn0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770907837; x=1771512637;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mkdIQKCORgBHmpzhYnqV+lMcVLWl9ZTC9POI19y5zYg=;
        b=MRfydelx34LMGYAM5Wsl5D6dPuzj33Whrf8yfZIG7w5wZzIP52LukEsOPbfHB24hec
         qM0MD1wdQk6YF4vd8NZqxMEgeaLnwn1hsB86pvIXJzQLM+GeXj3Vr7lKmzUaMpcN16dl
         SlFZ7zTPXX8EkiEll6YEQ6AV/0GH7EPqC5jxdGebPkYTRIQYEQYSbTeXql85ULVHsw15
         AOIu3gfAwcj2jx3bCQ/9JEaKpKiuty1O0BZh3WSSKOIyhLUEkkIsfQWGzY2O1/En7lyj
         +zGjg1e+PzaqFRSRQ0+kubYObIfXsKZS73O4KFMadciWmhQ1Nh5Kzl3Tbig3390AoWOR
         aC5g==
X-Forwarded-Encrypted: i=1; AJvYcCX7sd/e25ovzRm2aWFiUvdNdX4Qz/LgCAb/fK2i+KLKXa7fFoHqTYvHhUOqi1ac4D+YzXLD+P7akM281g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsWzOFy+budahHB5eQnDMSDdkQss7EtTqmSmrKWENKWXyVknHI
	NaeCDTNBvDhyP6GkwxTuphOZkeTriGiaPl6lg1QTBgF06nPPYan0RQhw1N3E22vSSmdJCFAaf9K
	vks5Y+J/nkiIshP0jIO15+ab/AZzdzItjw+B+9edJgsnVfHtUBox0ZhaOP3/yzMLlGQ==
X-Gm-Gg: AZuq6aKFM1kHIWHzbzsfqG0XZ6VEeaa0C3zSGRiUOSQf+DVgxT5A0C4SuP+ygrl1g+J
	doydOh42Dop8x/o60Ws0nhqyODrFiYwppKIG7TCZF6KX7MzpM6ct90bv9HHei9KSldbOIkU4OrP
	rLKvnqCzIyp0mSGdLe8qEZQL2QI+yHa332/G5yVUG+2QozMf6gCAYDj9Db4vJqUPPu1+F37Ncxh
	+o2FZPxCb/tUyKEj3WEDoskKldf607uWatW/BJoDntelsoVFW00pUvrjx/tJzrQygOPCRnLp3/r
	w9FdVCwaAbgQkM6mq8cXaOMCRAHEqelX5ak6xa2v/iVEjJ8hdF+53Pw6eSGpyfHDhv8TwBVIo1A
	KMKWq+WELHwpKefjcAv4vu1Q5ImzfZekUREPX1Ynx+juGaiKbzaIjVZIEtafWDCjax1+bXD2r3W
	Zaju4=
X-Received: by 2002:a05:620a:198b:b0:8b2:6eba:c45d with SMTP id af79cd13be357-8cb33064bddmr293003085a.2.1770907837345;
        Thu, 12 Feb 2026 06:50:37 -0800 (PST)
X-Received: by 2002:a05:620a:198b:b0:8b2:6eba:c45d with SMTP id af79cd13be357-8cb33064bddmr293000385a.2.1770907836830;
        Thu, 12 Feb 2026 06:50:36 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f6e9a6a24sm164450766b.20.2026.02.12.06.50.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 06:50:35 -0800 (PST)
Message-ID: <c911c0de-a81c-4b29-a839-57867b618ec4@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 15:50:33 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: iris: Enable Gen2 HFI on SC7280
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260209-iris_sc7280_gen2_support-v1-0-390000a4fa39@oss.qualcomm.com>
 <20260209-iris_sc7280_gen2_support-v1-2-390000a4fa39@oss.qualcomm.com>
 <0da582a6-5bba-4450-99ec-cf57b67915e6@oss.qualcomm.com>
 <0a324898-092b-3e44-c35c-15de20b50f40@oss.qualcomm.com>
 <2uih6xdzarkwnvhlhv5kznmdwo4jorqvsrb7xxrxgr6vprx3ey@4kx45k5i3c4y>
 <6b9042c8-767e-0fdb-9012-f3790899509e@oss.qualcomm.com>
 <f9f40ac7-e6fe-41eb-92e4-311913567ef0@oss.qualcomm.com>
 <FaJyQ2c9oLW2a2qKHDI_zfRx4G_Ee4rzdjImb7o3bKnZAo7AzRDgokOBewYZCNdqexEEPhB6nmPEjkmS72Kalg==@protonmail.internalid>
 <b759fb04-22b7-cd5c-9e53-f4ffe9f37dc5@oss.qualcomm.com>
 <5ec260fd-b8ae-4c54-863f-de9e684bc543@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5ec260fd-b8ae-4c54-863f-de9e684bc543@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BbPVE7t2 c=1 sm=1 tr=0 ts=698de8be cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=_GnCpRreIiypi8OaDPIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: E-i2-KuhGoYf1K5mbdPaCfJjR7tiPSb7
X-Proofpoint-ORIG-GUID: E-i2-KuhGoYf1K5mbdPaCfJjR7tiPSb7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDExMyBTYWx0ZWRfX7mvc7C/5mGvw
 OP7muG5+gryQp+mVOuNYFeKvohlMyWy1OYAuLCXa8bBknvUAxPYJZX1jnf/AMrnr6LLzxXE+KnE
 QyXEswAzwpakFUYIA9gC9PsSeaM6nmqtWwvGV1qL9dIUjUDe9J8JZ1Saj2SBfBVGdv4lujZaBRM
 Ros67/CTNTD3hs4sX7LqfzKVwurkQ6HlkKn6VbeDh2Utta7Y0ICQio5qSJvh5ekflehu7TsGz3E
 EwdMAAnlqt385cdvHfq1nUdp0C9X0oDHbtC3Xls0g1d0SzNG1ZvHjom74dK30NLglnHLcfg5IBF
 A3pmOtUZcxOhWuNlO+U0LZxRCe+LekYYyZYnt3zFTkNhqpUN16yzOsuCW/fm3QDMXjY7izVN2a/
 m8YLhNnD5e7TUO4yfmOgut2j6Y4s7Q5Z542V2hKnuhZGwUF564i5DL06M9nbLBEdD5iiKxyGsGE
 xmgajDQ9I/pAh1P0Ckg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_04,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 phishscore=0 spamscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120113
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-52660-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+]
X-Rspamd-Queue-Id: 0DD8F12EA1B
X-Rspamd-Action: no action

On 2/12/26 2:27 PM, Bryan O'Donoghue wrote:
> On 12/02/2026 13:05, Dikshita Agarwal wrote:
>>
>>
>> On 2/12/2026 5:13 PM, Konrad Dybcio wrote:
>>> On 2/12/26 12:16 PM, Dikshita Agarwal wrote:
>>>>
>>>>
>>>> On 2/9/2026 6:05 PM, Dmitry Baryshkov wrote:
>>>>> On Mon, Feb 09, 2026 at 05:04:48PM +0530, Dikshita Agarwal wrote:
>>>>>>
>>>>>>
>>>>>> On 2/9/2026 3:32 PM, Konrad Dybcio wrote:
>>>>>>> On 2/9/26 10:45 AM, Dikshita Agarwal wrote:
>>>>>>>> SC7280 supports both Gen1 and Gen2 HFI firmware. The driver continues to
>>>>>>>> use Gen1 by default, but boards that intend to use Gen2 firmware can
>>>>>>>> opt‑in by specifying a Gen2 image through the Device Tree
>>>>>>>> 'firmware-name' property.
>>>>>>>>
>>>>>>>> Based on this property and the availability of the referenced
>>>>>>>> firmware binary, the driver selects the appropriate HFI generation and
>>>>>>>> updates its platform data accordingly. Boards that do not
>>>>>>>> specify a Gen2 firmware, or where the firmware is not present,
>>>>>>>> automatically fall back to Gen1.
>>>>>>>>
>>>>>>>> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>>>>>>>> ---
>>>
>>> [...]
>>>
>>>>>> To avoid accidental matches, I can switch to an exact filename match
>>>>>> instead. That way, only the specific Gen2 image (for example
>>>>>> "qcom/vpu/vpu20_p1_gen2.mbn") will trigger the Gen2 path, and boards that
>>>>>
>>>>> How do you detect that for the OEM-signed firmware, which can have
>>>>> random name?
>>>>>
>>>>>> want to use Gen2 can opt in by naming the firmware accordingly.
>>>>
>>>> I Explored on suggested alternative approaches and seeing some limitation
>>>> with the both of them:
>>>>
>>>> 1. Detecting Gen1/Gen2 by scanning the firmware blob (fw->data)
>>>> It is possible to parse QC_IMAGE_VERSION_STRING from the .mbn and  extract
>>>> the version string. The issues with this approach :
>>>>
>>>> - the version string has no explicit marker that identifies Gen1 vs Gen2.
>>>>
>>>> - This prefix is not a formal ABI, and it is not consistent across SoCs.
>>>> Each SoC family uses different naming patterns in the version string.
>>>>
>>>> Example : For SC7280 Gen1 we currently see:
>>>> QC_IMAGE_VERSION_STRING=video-firmware.1.0-<hash> while SM8250 has
>>>> QC_IMAGE_VERSION_STRING=VIDEO.VPU.1.0-00119-<>
>>>>
>>>> So the driver would need SoC‑specific string‑matching rules, which is hard
>>>> to maintain if we are looking for a design to address all available SOCs.
>>>
>>> The only SoC with such distinction today is kodiak. So we can simply check:
>>>
>>> if (kodiak && strstr(fw->data, "VIDEO.VPU.1.0.")
>>>     hfi = gen2;
>>
>> Agree, this works for Kodiak. However, Dmitry was also referring to other
>> SoCs that may support both Gen1 and Gen2, and at the moment there isn’t a
>> generic way to handle that check.
>>
>> Also, please note that the Kodiak Gen1 firmware uses the string
>> video-firmware.1.0, whereas Gen2 uses VIDEO.VPU.3.4.
>>
>>>
>>>
>>> Can we agree that VIDEO.VPU.x firmwares are hfigen2? If so, problem also
>>> solved for <=8450
>>>
>>
>> Nope. that's not true for all, SM8250 uses VIDEO.VPU.1.0 which is gen1.
>>
>> Thanks,
>> Dikshita
>>
>>> Konrad
> 
> I really don't see what the problem with Dikshita's proposal here is after all she literally controls the firmware name that goes to linux-firmware.

A vendor could name their gen1 binary i_really_wanted_gen2_but_didnt_get_it.mbn,
or perhaps "snapdragon_8_gen_2_venus.mbn" and we can't control it.

Plus I generally see relying on file*names* as a hack (in the same way that
Linux doesn't care about file extensions, but Windows blindly trusts them).
And there's oddball cases like with FW_LOADER_USER_HELPER

Konrad

