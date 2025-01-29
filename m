Return-Path: <linux-media+bounces-25393-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 04057A2172D
	for <lists+linux-media@lfdr.de>; Wed, 29 Jan 2025 06:01:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26A753A535C
	for <lists+linux-media@lfdr.de>; Wed, 29 Jan 2025 05:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9562190059;
	Wed, 29 Jan 2025 05:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="R42X4Cns"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9661AAC9;
	Wed, 29 Jan 2025 05:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738126876; cv=none; b=JWiAwyHHcC8Y7ylwudj9VdvGrOhao6LSRMATAYZWLOK+BYaslQgQRUI5x4rtvuq2s/Yf2O1a5rY1CYnnoVzocSH835sNYw6MCYw77Ike4H6OQr9UM1PcMQmX0yvrjsNn7SlaPkT9e+ARn5CBGKEnSWqci2LEpAqvpNGIQaiMI6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738126876; c=relaxed/simple;
	bh=Mvk6Eo6dHZALzpk24hbc6yWQY29s1LCZHqcCs6qEv+0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Xdx67I3RawSPwccZDLMYtPqz41rf0RV8SC4Pe4h5GUEwM999qEricWR2/FuNXVXWwW6rroBuIWIbp4i0cZ1Rp+xh7aSZQNMSVcyDpyd5SVZDTjgdjX6BRifQLYRequ2ijNjfAmGX4Yn1gJYupB2fj9b4/0YPT7MYZ9QwOBnW9UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=R42X4Cns; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50T2gkEs007102;
	Wed, 29 Jan 2025 05:01:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kn8sYUMXhLcYjy9pXst/fGWS6zXhyaIo34n0ZnTEK5U=; b=R42X4CnsTByc7NtW
	4P8JbpBecB7uWGOzyELuaDryJR7vmqekfekQr9wl73zi3XNWtaK89Z5jf0xEW3w2
	1Y058m7+g+FU6qkdOgFOEQKjRlBKT65kpLlbM1IyHyVKpwLJS13vYEuCmlBNaZia
	vJojyoc8qIqR41e3rdpd0xGT/uYZB7gZHAavLR/pQspdkkmoF8j7n0MIQE1XCNeZ
	t2pDQt/YZ74OiFogT/iPYqL+XjIrlY35K/DudYCblSzJRIsN3GnEG5WsyEFXot5s
	uflpUfZIVMayfud5GLThtajkpcKNQZCFCv/wYEqs/I45l59jWExWEcKch3vgwCRM
	rXCIqg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44f3qth4aa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jan 2025 05:01:10 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50T519uW007024
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jan 2025 05:01:09 GMT
Received: from [10.206.111.70] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 28 Jan
 2025 21:01:07 -0800
Message-ID: <63fa1fdf-bb7b-4ef7-8b9b-93eb97eef937@quicinc.com>
Date: Wed, 29 Jan 2025 10:31:04 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: venus: fix OOB access issue while reading
 sequence changed events
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stanimir Varbanov
	<stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250104-venus-security-fixes-v1-0-9d0dd4594cb4@quicinc.com>
 <20250104-venus-security-fixes-v1-2-9d0dd4594cb4@quicinc.com>
 <2b0528f5-f9fa-4cfd-abda-a0e95ba4a2f1@linaro.org>
 <7a782ea9-f227-4f46-a757-b4b69f5c287f@quicinc.com>
 <0eab7323-ce86-40c7-9737-06eedcdf492d@linaro.org>
Content-Language: en-US
From: Vedang Nagar <quic_vnagar@quicinc.com>
In-Reply-To: <0eab7323-ce86-40c7-9737-06eedcdf492d@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: X0MF-fIce4eP1-3fTA2fFdVKQnvu-qIe
X-Proofpoint-ORIG-GUID: X0MF-fIce4eP1-3fTA2fFdVKQnvu-qIe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 malwarescore=0 phishscore=0 mlxlogscore=802 impostorscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501290039

Hi Bryan,

On 1/17/2025 4:02 PM, Bryan O'Donoghue wrote:
> On 17/01/2025 08:39, Vedang Nagar wrote:
>> Hi Bryan,
>>
>> On 1/6/2025 5:36 AM, Bryan O'Donoghue wrote:
>>> On 04/01/2025 05:41, Vedang Nagar wrote:
>>>> num_properties_changed is being read from the message queue but is
>>>> not validated. Value can be corrupted from the firmware leading to
>>>> OOB read access issues. Add fix to read the size of the packets as
>>>> well and crosscheck before reading from the packet.
>>>>
>>>> Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
>>> Please see Vikash's series on this.
>>>
>>> https://lore.kernel.org/linux-arm-msm/20241128-venus_oob_2-v2-2-483ae0a464b8@quicinc.com/
>>>
>>> it seems to have exactly the same patch title ?
>>>
>>> Is this patch supposed to be a follow-up to that patch ?
>>>
>>> https://lore.kernel.org/linux-arm-msm/20241128-venus_oob_2-v2-0-483ae0a464b8@quicinc.com/
>>>
>>> Expecting to see a V3 of the above. If the intention is to supersede that patch or some of those patches you should make clear here.
>> No, this is a different series having OOB fixes similar to ones posted by Vikash.
> 
> OK, please use a different patch title.
> 
> I understand the motive to repeat the patch title but, its confusing. If you added some text to make the OOB more specific then it would be possible to differentiate between.
> 
> "fix OOB access issue while reading sequence changed events 'in some location' || 'on some path'"
Got it, will update the patch title in the next version.
> 
> 
>>>
>>> On the switch statement I'd have two comments.
>>>
>>> #1 is everything really a " -= sizeof(u32)" ?
>> Yes, it's everytime " -= sizeof(u32) " since the first the first word read is ptype of size u32
>>> #2 if so then this ought to be factored out into a function
>>>     => functional decomposition
>> Sure, will fix this with decomposition into functions.
> 
> Is firmware sending a change event or updating a packet already in memory ?
Firmware is sending a change event in a new packet.
> 
> What is the nature of the change event and how do you guarantee the second read is valid when the first read can be considered invalid ?
> 
> i.e.
> 
> - Read - derive read value X.
> - Do some stuff.
> - Read - again to make sure length value is still X.
> - Do all sorts of other processing.
> 
> At which point is the sequence considered complete and the data considered "locked" and valid ?
With rouge firmware, the data can get invalid by the firmware during the second read but our intention is to avoid reading the out of bound data.
Whereas reading the invalid data will eventually lead to session_error at some point in future.
> 
> What happens if you get a subsequent change event once this procedure has completed ?
Either instance will go into error state or the same process will be repeated.
Please let us know if this is not a correct approach, or any other suggestions.

Regards,
Vedang Nagar
> 
> ---
> bod


