Return-Path: <linux-media+bounces-16346-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA1F9535EB
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2024 16:44:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35B161F21EB4
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2024 14:44:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D45BE1B4C35;
	Thu, 15 Aug 2024 14:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="e8gEoXIz"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5A41A4F3B;
	Thu, 15 Aug 2024 14:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723732939; cv=none; b=TltORHNvzQ0e44F5mziB95pIeNNPlDN2KWXdVlqx6qY3FYQ74A+1/OWlh3rozn8Z5XctWaTQXR3fpfQHXnO7m9J40JkzPYe1DUWqU7x6uThldUDSzDNKzNVpEm2O5/UMe+mQIr6KUj+CtCf9Kfp918TKOwTAZxd+LkO7nYJuwMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723732939; c=relaxed/simple;
	bh=t+pO7N5Z6JtmiS6ojDZxc9cP8xXS67WNZzSbC144FPc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Xi+huLliX21bDZ4ooUxX/OUQ/LFVj9KXJPZSJ1e084HBHpFCYZC/ke4kmHsyYdAqw+Z54/BRIMO3wrEGFi+CQNb9lnGlFQR7NXvywxAEeap5FK0GlMw0HU0Kdh1WKnfnu/qeW4/0cCoS4f539pf7LidwebcHGqmgmDcA16M+x/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=e8gEoXIz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47F2i0E4025516;
	Thu, 15 Aug 2024 14:42:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	emXGD2ixoz9xo1hqs7NNv/4icoml3oxrGVHnw8YysrA=; b=e8gEoXIzUj9TMddo
	Q38y2I8lLTeJGo4l3YWEc2rbmwZco93y7K3hieKgMEgBMiHzVJLEF/4H/80agKp4
	TQGCyrsfFWs7foG0L+kqPVgGv2mLxMJlDxpZ3AY94IiA1aVRZg6qUicjXP2pqLE9
	DPsj78RoqLhtxnZH1cgWSFEsNFuTDiLQEpN92dHHYy2/CEAK+qjARN/IHQZpc2tM
	DUG5pwum8NTpw2Lj+1CTu1eeCS7ZsA3PS5U/TkKQ/JsuCcHBpxzzKAWjFhzprDzs
	Ofi3HAimGrxHnFwHpX6s0DYDmAQgOiGFPdnWaLcQ/IVT6+4Lh7AfmSv3NxbAZcAD
	ypi9JA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 411957sf0k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Aug 2024 14:42:12 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47FEgAFv020324
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Aug 2024 14:42:10 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 15 Aug
 2024 07:42:05 -0700
Message-ID: <82200889-a98d-4815-bc31-f81b15d02513@quicinc.com>
Date: Thu, 15 Aug 2024 22:42:03 +0800
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
Content-Language: en-US
From: Depeng Shao <quic_depengs@quicinc.com>
In-Reply-To: <b0787142-0f85-4616-9895-72e33f21c2da@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5fnvQgpmZ2cdt8aN5eXx9DA6pgQgeeuE
X-Proofpoint-ORIG-GUID: 5fnvQgpmZ2cdt8aN5eXx9DA6pgQgeeuE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-15_07,2024-08-15_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 suspectscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408150107

Hi Vladimir,

On 8/15/2024 7:20 AM, Vladimir Zapolskiy wrote:

>>
>>>> +void camss_reg_update(struct camss *camss, int hw_id, int port_id,
>>>> bool is_clear)
>>>
>>>> +{
>>>> +    struct csid_device *csid;
>>>> +
>>>> +    if (hw_id < camss->res->csid_num) {
>>>> +        csid = &(camss->csid[hw_id]);
>>>> +
>>>> +        csid->res->hw_ops->reg_update(csid, port_id, is_clear);
>>>> +    }
>>>> +}
>>>> +
>>>
>>> Please add the new exported function camss_reg_update() in a separate
>>> preceding commit.

>>
>> Thanks for your comments, I will address them in new series.
>>
>> But I have some concern about above comment, you want to add a separate
>> commit for camss_reg_update, maybe camss_buf_done also need to do this,
>> but I guess I will get new comments from Krzysztof if I make a separate
>> change, Krzysztof posted few comments in v3 series, he asked, "must
>> organize your patches in logical junks" and the code must have a user.
>>
>> Please check below comments.
>>
>> https://lore.kernel.org/all/e1b298df-05da-4881- 
>> a628-149a8a625544@kernel.org/
>>
>> https://lore.kernel.org/all/d0f8b72d-4355-43cd-a5f9- 
>> c44aab8147e5@kernel.org/
> 
> Krzysztof is absolutely right in his two comments.
> 
>  From what I see there is a difference between his concerns and mine ones
> though, Krzysztof points to unused data, which should raise a build time
> warning, and I asked to make a separate commit for a non-static function,
> I believe it'll be removed by the linker silently...
> 
> The potential runtime logic change introduced by camss_reg_update() in the
> generic code is not trivial, which opens an option to update/fix it lately
> referencing a commit from generic domain rather than platform specific one.
> 
> If someone for whatever reasons wants to merge a new generic and shared
> camss_reg_update() function within a the platform specific code/commit,
> I won't strongly object, let it be merged together then.
> 
>>
>> Or I don't add reg update and buf done functionality in
>> camss-csid-gen3.c and camss-vfe-780.c firstly, then add them in a later
>> commit.
>>
>> Could you please comment on whether this is acceptable? Please also help
>> to common on if one commit to add them or need two separate commits, one
>> is for reg update and the other one is for buf done.
>>
> 
> I would prefer to see two more separate commits within non-platform 
> specific
> code, however as I stated above if it causes anyone's concerns, including
> your own, let it be kept as it is done today. Eventually we do discuss
> a non-functional change.
> 

Thanks for the confirmation, even though I add the rup_update and 
buf_done function in later commits, it is still called in platform 
specific code(camss-vfe-780.c), so I will keep as it is done today.

Thanks,
Depeng


