Return-Path: <linux-media+bounces-47730-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DCAC8827F
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 06:31:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EC5CE346973
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 05:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E6E4279327;
	Wed, 26 Nov 2025 05:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XRP89Zvm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YHAnGSEI"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008484C9D
	for <linux-media@vger.kernel.org>; Wed, 26 Nov 2025 05:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764135093; cv=none; b=ZycdGqa1w2dIrLHsa1T+8fEZf2utK92fYV3W/sD1Q3mr99pujq/1lGg+F5lk0pCrEVIfXsqUYx0H/w8Tfkh+mNbjEMkA8MmrWcMQ+fniU0miAp3dYtp4oB0ZTWLh8tPPinlyE2/jlwsE02MZLF84/LOOC76ITgQtNpK/OgrfLhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764135093; c=relaxed/simple;
	bh=pq08AGFvIrFOBLkqwOno9CpWZWBlKVvaF1cIJeyz39k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IkHmjEZDzZw8VfEGa0FzmZAb3ACDDFnUMPNDm4xwghVz2mwsly8JjtFutE10j9HxSiZcU9Fo0QIpOCPRhA3BJypqSMrYwdyuTDa6gFNXsGvn4K52vXZjU/Ls1Tuhgr+un52VHLxsnJjgyNRGueSPjwZKtGlZlx04gGzICExOA8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XRP89Zvm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YHAnGSEI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APGgGHv3587183
	for <linux-media@vger.kernel.org>; Wed, 26 Nov 2025 05:31:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Oz/fYXRZJxgg9b9hF5h78+FliUMrFoNhzYrQ0iWh7Tc=; b=XRP89ZvmLVTV+9ZO
	qujl+jzj/+wtYJa7lAULyRRiIQmNaLSusq/4fgwkQtCG2H+6lM6cI1ST8/GxU6ha
	LOTqO9A0V3bUO+QZ4T8qrteJ7EbmGp7+4oJCfSl4VBRaQzt0gotz5T/BHh8QIKge
	3XSRb4KC/tSGTs93D/vwhnvcOKYWJDBCUhGeWRZlq/Fg0aa035zioebOMEm6s8i+
	P28MeSEecVZ7b141Cl8dHynMEfnsWYYzG681JOb35th9PJfbaRr6REyG0nSICNrf
	2rTltn5QyhoUZo0TYG8kvtQwWD7NJr9/VTeSYIoYNgDxsFrPrN4wvdNiKwQqXbHG
	XhlXSQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ang791q2w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 26 Nov 2025 05:31:31 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-297df52c960so159007005ad.1
        for <linux-media@vger.kernel.org>; Tue, 25 Nov 2025 21:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764135090; x=1764739890; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Oz/fYXRZJxgg9b9hF5h78+FliUMrFoNhzYrQ0iWh7Tc=;
        b=YHAnGSEI3GnwDNM7K/V+0AN98qM0vT5b610KMLLNNg82561tkeF0++dgFfZUBZHTOB
         fDlDn06Y4aGrziJ8m/oz12geGaSiCjtaD2ghBc3+7Qe9ba/A8KLJcE7eB9vtuG4bSp9w
         U7JLv2ofyBmByLiWxvMXuI/XL75ksIPecy3nNCOeo0KRfgGVX5jCXOkdKqV8xMFrtA5R
         4o+D0sNJQhgCJwIoF4FSL2SY0KfEmCf9Cy8HLPR5mjcE0KJSI6hzW6oBvK8FygKRDwmF
         kNskxhoMypCc/H7jqQs98v17C3Iox5NRmOq/uMjWMp9FXRRoNIPQtH5ke3tw5G07gmSJ
         735Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764135090; x=1764739890;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oz/fYXRZJxgg9b9hF5h78+FliUMrFoNhzYrQ0iWh7Tc=;
        b=phvdWDTHP8/REx83GRFMldM1esAmnnhy+ceT12YwcwJiTw9xDa+Rx+Re72BwFIGabA
         sNTyC1l+u3m+feW0iKLI8HMZuaOkWDcw1Xc8PjBPvWvVZUj107ttS+Sk0HlakiF/PXcp
         tfb+nPDIaXjHKVdZsC60zh8tem+08b16hdCgbxVMIp7dahsqQO8D8jnzZ7H2LlDqYxgK
         XYiFww55j4wejpizqUB89P2YBSucZaJaWeVs3n3CYmJq5OOM3VPPSUe1X3hzmK2vHjdK
         0QQavQw73rmlAZutCmVNQ0HmfU1YD4OGQmGxA/eWaATPhTF75iWAg6m3oLYFU53bTvOA
         A4+g==
X-Forwarded-Encrypted: i=1; AJvYcCXSBVHUV/IEWqPqoAYMYsoRAKRxcVEPYUxlkS9gTpUoaTfmwWXT++iddCO73XM1vV5ZnNvjdjvi7HesSw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzfo8N8diIOsOfdAj0+i7i6aReSHrRbk3EyuXNxGywso/7B8ePf
	EWaRoIANFHUEWsGG97eSpVakhsFM5EB/+LBETy/eDXWah5mU1Jcg/6CTA0GLd4cgsRcHcaPxDyP
	YCwlbZPzz7tFVVYwMapeFbV+iKVG6VntXrf4hR/fZlMf1c0GDQKKzCq8GfVBJ9gYhFQ==
X-Gm-Gg: ASbGnct60Vm7+65u5YBQwsS/ar59el7GtHUUT0NQ3v3e5mYAKd5ijH4IQPPukEcjqsc
	H6DVebV9/E5HVcPMru3VeZHTIomoygOIP0PqK2z204jl3mPl63dYlm0q+4WA7j6KqQgDjUUr8MS
	1zrqYyUNjyn4g1Ai3cEwmyaNGta3tB9CdqdIzwQrRxLcIH8qd+HBQGnzxYeN/GVtTduTTgUXuwa
	WrBQ+ol2fzBy2umuIZhZSDfGwi07m9hzrr34Enis2FOVSVhiIsbNi9gz6JOk271oome1s2+Riru
	NqAqtC/zO1CCEJuAU+a8LkCtG+xmaXfoSgwZC1ZbhM6jU1x45+82Yss3Bf0OT3U607iq81t7Z9Z
	tmBayay2j79q8tO557qNKTb8zVBGweeDoieHj0OFEgw==
X-Received: by 2002:a17:903:2ac5:b0:295:9871:81dd with SMTP id d9443c01a7336-29b6bedb625mr184590015ad.25.1764135090418;
        Tue, 25 Nov 2025 21:31:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGU5az0gzS/5N/piHae1Dirr78cTP7cS2wFoPm6L+3htwFnXwqyqtvUhe1OT3gow3iDtPhM+A==
X-Received: by 2002:a17:903:2ac5:b0:295:9871:81dd with SMTP id d9443c01a7336-29b6bedb625mr184589775ad.25.1764135089942;
        Tue, 25 Nov 2025 21:31:29 -0800 (PST)
Received: from [10.0.0.3] ([106.222.230.111])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b107effsm187485025ad.14.2025.11.25.21.31.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 21:31:29 -0800 (PST)
Message-ID: <791d7bb3-a96a-ed5c-a59c-90cbbd712ffa@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 11:01:25 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] media: venus: assign unique bus_info strings for encoder
 and decoder
Content-Language: en-US
To: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
Cc: vikash.garodia@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251121184306.218169-1-jorge.ramirez@oss.qualcomm.com>
 <e409f318-cd50-5a7d-7f46-a928ea544597@oss.qualcomm.com>
 <aSWmeZHmeUWs1NwY@trex>
 <35d86818-8b50-1c0e-40a0-5f80c4b24a32@oss.qualcomm.com>
 <aSYdUzpqX38xxywI@trex>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <aSYdUzpqX38xxywI@trex>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=P9Q3RyAu c=1 sm=1 tr=0 ts=692690b3 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=12FOtvgV4D2gsqRYbU+y8g==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=xOd6jRPJAAAA:8 a=EUspDBNiAAAA:8
 a=jy-4xleNOOuNcfXGUj4A:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: l0cEIW9vhhEnwxpLrAnwgvFNvbpbB_wO
X-Proofpoint-ORIG-GUID: l0cEIW9vhhEnwxpLrAnwgvFNvbpbB_wO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA0MyBTYWx0ZWRfX4JuKTugIKNS9
 o18PPATUZ6wni8HTwO2Rq+f7jK9vZh5uuEJpt6ClsRguammp/SqFrW7cjSNlS/4+BIM1pwPy4iG
 xi30JLy9YG9sTj/7vpc4SwAf9LogbJxOtfXqONPQ+53pjnJCi8XImQzUJS2S0FdJGMYg1CkjLxB
 rwv/UDjpkb9xqT0yTSMmH2eG8r1Lzz3VrnPTLK2p1aE0Y4VfRdQV+PF9QJ1IhBV7utXVXAqWKBT
 Ec37NoRXWO/Pqm8vcQ8VZ9BsuFBUt1strZZc2XtStaUE6dZfXGWTFuCaxAu1tFe7yB9hMv+P5Pp
 x0UVbIvJpQNb5WSpUAmJJQxqBYjy7aEPOir/oXXtEqAsxn5i3U9+JGOFv0MMPugWi2HoZljUms4
 OT0XYNLXpogfvwNK2bRQ7qwHbnZ4EA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260043



On 11/26/2025 2:49 AM, Jorge Ramirez wrote:
> On 25/11/25 18:39:14, Dikshita Agarwal wrote:
>>
>>
>> On 11/25/2025 6:22 PM, Jorge Ramirez wrote:
>>> On 25/11/25 13:59:56, Dikshita Agarwal wrote:
>>>>
>>>>
>>>> On 11/22/2025 12:13 AM, Jorge Ramirez-Ortiz wrote:
>>>>> The Venus encoder and decoder video devices currently report the same
>>>>> bus_info string ("platform:qcom-venus").
>>>>>
>>>>> Assign unique bus_info identifiers by appending ":dec" and ":enc" to the
>>>>> parent device name. With this change v4l2-ctl will display two separate
>>>>> logical devices
>>>>>
>>>>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
>>>>> ---
>>>>>  drivers/media/platform/qcom/venus/vdec.c | 5 +++++
>>>>>  drivers/media/platform/qcom/venus/venc.c | 5 +++++
>>>>>  2 files changed, 10 insertions(+)
>>>>>
>>>>> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
>>>>> index 4a6641fdffcf..63f6ae1ff6ac 100644
>>>>> --- a/drivers/media/platform/qcom/venus/vdec.c
>>>>> +++ b/drivers/media/platform/qcom/venus/vdec.c
>>>>> @@ -433,9 +433,14 @@ vdec_g_selection(struct file *file, void *fh, struct v4l2_selection *s)
>>>>>  static int
>>>>>  vdec_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
>>>>>  {
>>>>> +	struct venus_inst *inst = to_inst(file);
>>>>> +	struct venus_core *core = inst->core;
>>>>> +
>>>>>  	strscpy(cap->driver, "qcom-venus", sizeof(cap->driver));
>>>>>  	strscpy(cap->card, "Qualcomm Venus video decoder", sizeof(cap->card));
>>>>>  	strscpy(cap->bus_info, "platform:qcom-venus", sizeof(cap->bus_info));
>>>>> +	snprintf(cap->bus_info, sizeof(cap->bus_info),
>>>>> +		 "platform:%s:dec", dev_name(core->dev));
>>>>
>>>> Is there a reason to keep both strscpy() and snprintf() for cap->bus_info?
>>>> The second call to snprintf() seems to overwrite the value set by
>>>> strscpy(), making the first assignment redundant. Would it be cleaner to
>>>> remove the strscpy() line and rely solely on snprintf()?
>>>
>>> argh, my bad, you are right. will fix.
>>>
>>> perhaps we should just have instead
>>>
>>> decoder:
>>> strscpy(cap->bus_info,"platform:qcom-venus-dec", sizeof(cap->bus_info));
>>>
>>> encoder:
>>> strscpy(cap->bus_info, "platform:qcom-venus-enc",sizeof(cap->bus_info)); on the encoder
>>>
>>> I suppose the additional info provided by the dev_name is not really
>>> important to consumers.
>>
>> In-fact, we don't even need to fill the bus_info, received a similar
>> comment on iris [1]
>> [1]:
>> https://lore.kernel.org/linux-media/c4350128-a05c-47af-a7e7-2810171cd311@xs4all.nl/
> 
> 
> Nope, that is wrong. 
> 
> if we dont fill bus_info we will end up with the following again:
> 
> root@qrb2210-rb1-core-kit:~# v4l2-ctl --list-devices
> Qualcomm Venus video encoder (platform:5a00000.video-codec):
> 	 /dev/video0
> 	 /dev/video1  
> 
> instead of something like this:
> 
> root@qrb2210-rb1-core-kit:~# v4l2-ctl --list-devices
> Qualcomm Venus video decoder (platform:qcom-venus_dec):
> 	 /dev/video1
> 
> Qualcomm Venus video encoder (platform:qcom-venus_enc):
> 	 /dev/video0

Got it.

Thanks,
Dikshita

