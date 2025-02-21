Return-Path: <linux-media+bounces-26613-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5EAA3FB5E
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 17:33:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 256448837A0
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 16:25:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A9ED1F1921;
	Fri, 21 Feb 2025 16:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="d0lk2H2a"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F4C1EF0B4;
	Fri, 21 Feb 2025 16:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740155144; cv=none; b=tJL/JM1vJYo7tvkZ06aFJo2xWRRn40PrCpJfD5SfOrEMqpOGRhkyFwpWAvqq1AmsxkRAEZiUA3y2/7Ve3gnHYl8gYtijHZC3fExy9j1iFJNfwSRett6rRT8sL2cutxniHleVYsOadx+oIojM9K7WETM9QVssYi9jorVdxkuKdtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740155144; c=relaxed/simple;
	bh=a0ahG7GNpc2Bh1FMZWerWXsz4xsO5Rzcg+40RjlizxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=CCGKWrHYLvpcJGgPyeWiLo9IhRlACyAlGjqev1gFecz4UyJDqoK8m303/f3v6WgXm009woXDbv6gMzBrdwd2r/HhSZcIjUcjUEDlXp8lDbkj6kgXmbqwxFOGO0o8Xr9BruZZrH5pPBhDApBGyRK7uQHPsOUvje4OdOsppi+vPD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=d0lk2H2a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51LD11uc015152;
	Fri, 21 Feb 2025 16:25:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yWWunlq9ptFdkWsR7BCovQgXo10nVfMQQtLgQu+W30I=; b=d0lk2H2aKd/Y0eSs
	xUvZXzShHlFW/4B2WGV/4cSHSTIIF8RlLDWERYs5kfnjm6vVqLkN4WF28Och6IDm
	arY8WISol9djwUjhtRe9NrgmMF9jyvProXpUW4yEFKZ6h2aTQ5H7Vk70XJm86GhR
	TyEJwObm4amEBE/bAsbT28TtUiOJFWrlbwg9f5bCAqdNjPqwzrAPkx27l6VuPISu
	8pR4H6C4cDESccLXP/7MXWhB8ULEgawnsandK18TUe8KVN4BqV9mhxOvtPocxfW9
	NhGWIGU4CO/pWzk2uo14lV+8bbA0OpHHGG1d5U6eSUi/8L+YqO/Ik726fqBXgqq8
	or/hig==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy4jmt4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 16:25:35 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51LGPY8w018373
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 16:25:34 GMT
Received: from [10.216.10.103] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 21 Feb
 2025 08:25:30 -0800
Message-ID: <47eb0aff-a486-10a5-0bbf-c18db03c81e1@quicinc.com>
Date: Fri, 21 Feb 2025 21:55:18 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 4/4] media: venus: hfi: add a check to handle OOB in
 sfr region
To: Tomasz Figa <tfiga@chromium.org>
CC: Hans Verkuil <hverkuil@xs4all.nl>,
        Stanimir Varbanov
	<stanimir.k.varbanov@gmail.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Stanimir Varbanov
	<stanimir.varbanov@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab+samsung@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
References: <20250207-venus_oob_2-v4-0-522da0b68b22@quicinc.com>
 <20250207-venus_oob_2-v4-4-522da0b68b22@quicinc.com>
 <e794c047-ab0e-4589-a1d2-0f73b813eacc@xs4all.nl>
 <b1721d46-ffbf-e21c-ce18-e96e3e8ee35f@quicinc.com>
 <CAAFQd5ABR8BwG_9JVPzzp+HZv6O=B9r-ipjKQHku7DdTGASetQ@mail.gmail.com>
Content-Language: en-US
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <CAAFQd5ABR8BwG_9JVPzzp+HZv6O=B9r-ipjKQHku7DdTGASetQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: z6XY414_3z239VBn3rot62zVG9y2qoJL
X-Proofpoint-ORIG-GUID: z6XY414_3z239VBn3rot62zVG9y2qoJL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_05,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 adultscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502210116


On 2/21/2025 9:25 AM, Tomasz Figa wrote:
> On Fri, Feb 21, 2025 at 12:56 AM Vikash Garodia
> <quic_vgarodia@quicinc.com> wrote:
>>
>>
>> On 2/20/2025 8:53 PM, Hans Verkuil wrote:
>>> On 2/7/25 09:24, Vikash Garodia wrote:
>>>> sfr->buf_size is in shared memory and can be modified by malicious user.
>>>> OOB write is possible when the size is made higher than actual sfr data
>>>> buffer. Cap the size to allocated size for such cases.
>>>>
>>>> Cc: stable@vger.kernel.org
>>>> Fixes: d96d3f30c0f2 ("[media] media: venus: hfi: add Venus HFI files")
>>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>>>> ---
>>>>  drivers/media/platform/qcom/venus/hfi_venus.c | 9 +++++++--
>>>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
>>>> index 6b615270c5dae470c6fad408c9b5bc037883e56e..c3113420d266e61fcab44688580288d7408b50f4 100644
>>>> --- a/drivers/media/platform/qcom/venus/hfi_venus.c
>>>> +++ b/drivers/media/platform/qcom/venus/hfi_venus.c
>>>> @@ -1041,18 +1041,23 @@ static void venus_sfr_print(struct venus_hfi_device *hdev)
>>>>  {
>>>>      struct device *dev = hdev->core->dev;
>>>>      struct hfi_sfr *sfr = hdev->sfr.kva;
>>>> +    u32 size;
>>>>      void *p;
>>>>
>>>>      if (!sfr)
>>>>              return;
>>>>
>>>> -    p = memchr(sfr->data, '\0', sfr->buf_size);
>>>> +    size = sfr->buf_size;
>>>
>>> If this is ever 0...
>>>
>>>> +    if (size > ALIGNED_SFR_SIZE)
>>>> +            size = ALIGNED_SFR_SIZE;
>>>> +
>>>> +    p = memchr(sfr->data, '\0', size);
>>>>      /*
>>>>       * SFR isn't guaranteed to be NULL terminated since SYS_ERROR indicates
>>>>       * that Venus is in the process of crashing.
>>>>       */
>>>>      if (!p)
>>>> -            sfr->data[sfr->buf_size - 1] = '\0';
>>>> +            sfr->data[size - 1] = '\0';
>>>
>>> ...then this will overwrite memory. It probably can't be 0, but a check or perhaps
>>> just a comment might be good. It looks a bit scary.
>> Thats correct, it would not be 0 as its a prefixed one [1]. I can put up a
>> comment here.
> 
> Couldn't a bug (or vulnerability) in the firmware actually still cause
> it to write 0 there?
Possible. Though the size is initialized in driver with "ALIGNED_SFR_SIZE",
there is a possibility that the same could get overwritten by a rogue firmware.
Kept a check in v5, which cache the value locally and then does the check before
using that value.

Regards
Vikash
>>
>> [1]
>> https://elixir.bootlin.com/linux/v6.14-rc3/source/drivers/media/platform/qcom/venus/hfi_venus.c#L836
>>>
>>> Regards,
>>>
>>>       Hans
>>>
>>>>
>>>>      dev_err_ratelimited(dev, "SFR message from FW: %s\n", sfr->data);
>>>>  }
>>>>
>> Regards,
>> Vikash

