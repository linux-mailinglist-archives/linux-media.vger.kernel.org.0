Return-Path: <linux-media+bounces-21060-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 338049C07A2
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 14:35:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE3121F219BB
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 13:35:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B47E210186;
	Thu,  7 Nov 2024 13:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="o7sDvttj"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4472F1DDA3B;
	Thu,  7 Nov 2024 13:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730986527; cv=none; b=e3aY1uNbqYyZeTvnTuGxa32CUSLH7StPKsvDABX31g8TKD6Ge/YptpcyVT3kAkfTFXuSRlDkb7GC9vHLGtIy3ewDH4PBBQMeUJQy1tcBC9rYp4b2i0vO20BrwdlxLWTs8kM93eHWlH0CFBmOaCXKMtTnK9viPh0wd78uUnb8Gxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730986527; c=relaxed/simple;
	bh=t/8insjH7bY+cYWvmL+WQJVYVpnLLyzddSxl6LIwJJw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=jO3FcsTnqb6SqBBZ2ASNgiwk9lbgf2Tt9VKLW3tL9jjSZeC8JJKl+hVOGywMcngKN5NZm1Rfrx4a+X5g7FTuS7HzPi3QKbj/mTsxYNLprvCdBOPJlpKs+9OzBVkTo+MrseXBQawbKqjmVxMMWEDk75MVWD+4Gq0gf2Mf9r11c34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=o7sDvttj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A794YCn003803;
	Thu, 7 Nov 2024 13:35:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LZIOvvGsRXn0/wnKpU8mvrnl8iQ5RNd08gSeOGXnT9w=; b=o7sDvttjUN7UssHT
	i48jDHvj4uysSK9ZEvPsnMtKyoUckcVoLlZzS8yWksVVV7alnscV2Uoq1afpGq6/
	C02DR5pzPJBsbeEdqi11NJmM/4eIvp+V6NZqvU8UcOYLbjKptMNXpWZI5Yu09/Zr
	j53aADYYPdkqGxjMQLPed0QTPWjmQ08OUIwHSEoujRdqlovUEv7ClOjPnhFg2pj0
	a52qKmAnX0G8eNhis/9et3Nf2qhc/F8dCWHbr/u7nc1LJ02gwaSNF3cDK0J0UqcN
	n3/anhlguEARNUpR2M88CTb/1iubdv4qH+lkWeO0KPdV0FrNtm+nRU4EPIi7Z9a1
	qx5CCQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42qfdx7p0x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Nov 2024 13:35:21 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A7DZLgt008228
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 7 Nov 2024 13:35:21 GMT
Received: from [10.204.100.69] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 7 Nov 2024
 05:35:18 -0800
Message-ID: <781ea2fd-637f-b896-aad4-d70f43ad245c@quicinc.com>
Date: Thu, 7 Nov 2024 19:05:15 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/4] media: venus: hfi_parser: add check to avoid out of
 bound access
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stanimir Varbanov
	<stanimir.k.varbanov@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
References: <20241105-venus_oob-v1-0-8d4feedfe2bb@quicinc.com>
 <20241105-venus_oob-v1-1-8d4feedfe2bb@quicinc.com>
 <b2yvyaycylsxo2bmynlrqp3pzhge2tjvtvzhmpvon2lzyx3bb4@747g3erapcro>
 <81d6a054-e02a-7c98-0479-0e17076fabd7@quicinc.com>
 <ndlf4bsijb723cctkvd7hkwmo7plbzr3q2dhqc3tpyujbfcr3z@g4rvg5p7vhfs>
 <975f4ecd-2029-469a-8ecf-fbd6397547d4@linaro.org>
 <57544d01-a7c6-1ea6-d408-ffe1678e0b5e@quicinc.com>
 <ql6hftuo7udkqachofws6lcpwx7sbjakonoehm7zsh43kqndsf@rwmiwqngldn2>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <ql6hftuo7udkqachofws6lcpwx7sbjakonoehm7zsh43kqndsf@rwmiwqngldn2>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ccWNCJ483Y6ywBFH9EoYBJhldZv5z73l
X-Proofpoint-ORIG-GUID: ccWNCJ483Y6ywBFH9EoYBJhldZv5z73l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 mlxscore=0 bulkscore=0 spamscore=0 mlxlogscore=810
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411070105


On 11/7/2024 6:52 PM, Dmitry Baryshkov wrote:
> On Thu, Nov 07, 2024 at 06:32:33PM +0530, Vikash Garodia wrote:
>>
>> On 11/7/2024 5:37 PM, Bryan O'Donoghue wrote:
>>> On 07/11/2024 10:41, Dmitry Baryshkov wrote:
>>>>> init_codecs() parses the payload received from firmware and . I don't think we
>>>>> can control this part when we have something like this from a malicious firmware
>>>>> payload
>>>>> HFI_PROPERTY_PARAM_CODEC_SUPPORTED
>>>>> HFI_PROPERTY_PARAM_CODEC_SUPPORTED
>>>>> HFI_PROPERTY_PARAM_CODEC_SUPPORTED
>>>>> ...
>>>>> Limiting it to second iteration would restrict the functionality when property
>>>>> HFI_PROPERTY_PARAM_CODEC_SUPPORTED is sent for supported number of codecs.
>>>> If you can have a malicious firmware (which is owned and signed by
>>>> Qualcomm / OEM), then you have to be careful and skip duplicates. So
>>>> instead of just adding new cap to core->caps, you have to go through
>>>> that array, check that you are not adding a duplicate (and report a
>>>> [Firmware Bug] for duplicates), check that there is an empty slot, etc.
>>>>
>>>> Just ignoring the "extra" entries is not enough.
>> Thinking of something like this
>>
>> for_each_set_bit(bit, &core->dec_codecs, MAX_CODEC_NUM) {
>>     if (core->codecs_count >= MAX_CODEC_NUM)
>>         return;
>>     cap = &caps[core->codecs_count++];
>>     if (cap->codec == BIT(bit)) --> each code would have unique bitfield
>>         return;
> 
> This won't work and it's pretty obvious why.
Could you please elaborate what would break in above logic ?

> 
>>> +1
>>>
>>> This is a more rational argument. If you get a second message, you should surely
>>> reinit the whole array i.e. update the array with the new list, as opposed to
>>> throwing away the second message because it over-indexes your local storage..
>> That would be incorrect to overwrite the array with new list, whenever new
>> payload is received.
> 
> I'd say, don't overwrite the array. Instead the driver should extend it
> with the new information.
That is exactly the existing patch is currently doing.

Regards,
Vikash
> 
>>
>> Regards,
>> Vikash
> 

