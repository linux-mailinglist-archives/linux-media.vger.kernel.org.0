Return-Path: <linux-media+bounces-66965-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lD+SLTYZTmrEDAIAu9opvQ
	(envelope-from <linux-media+bounces-66965-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 11:32:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FB1723C45
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 11:32:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=K2hn9CrK;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IftStQ3+;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66965-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66965-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A8EA2300826E
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 09:32:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D62F40F8EB;
	Wed,  8 Jul 2026 09:32:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6B43B42CF
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 09:32:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783503148; cv=none; b=OychJB0Jy2XDnntldAk5S1P+g9gSzVbK6+dE7OvnykBNX9kbgd+H7Rm4SV1N6qoM/NFmab7qi16Z+5Yrspn2NsCARMMK+xtp6ny3htepjNVc/IQWgpMKwJ0sh9rbG0J/r6WqrnqnmmNX8uLPh6RWjMu+jfMDyAkNtaJ0rh7VAoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783503148; c=relaxed/simple;
	bh=HpvpQU54Un1Qaf41SoPs991kafvyRNbO+FyHycN/Xcc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cF1djqaJmG9fzwLNFDr7Z63a1Kshlf669xEjagtONhmXUnYkoIC58p228plfuzab4yMh8WLjaZpFLqNytPV/trbPGUPO6mInsMshhOHfu7C7UaYC01qms9jVCCYx5b0yVOW/uEXzfglmAUNWXkptpKpb4R1VhLUDXKSsOj1CIbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K2hn9CrK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IftStQ3+; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668895nF2070542
	for <linux-media@vger.kernel.org>; Wed, 8 Jul 2026 09:32:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	50cC+lOjwWBBzURdhgiGe83iDGJQETCnagLzadfseh4=; b=K2hn9CrKuH4OIFYN
	Pw2po+0uWxDCmtVqJ6dRlKCw00jCXJKDE9Dhl7X4sAO0jXOf7xYAm7RBkNKp5pYJ
	tltOANfZcoccFJN06FbE8AwEtiEzao3LrV7l5a/Rqn7b4XjgNyqz6zAfse+IZV3C
	nqWyDygB3bJxdAp5J7xHX3LiXINDa1PKy67WE3cNyFgqXmzVCiFRiOnsFiIHKGHf
	yIT7QLvISSINSYnKo6o137426tvANHwNoyJOBq7TLMk+iDCaBcmExkuujBPdjwpZ
	6U8KkPniPm/TKDcMDSFbSscaNOOpsFypFSuJVinoYsieFYq85WdqPKHVYWSXoGJi
	4VXxDg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9be59yug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 09:32:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1b4d961dso4933121cf.1
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 02:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783503141; x=1784107941; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=50cC+lOjwWBBzURdhgiGe83iDGJQETCnagLzadfseh4=;
        b=IftStQ3+yoD+rlRMn598ZDbe8qaNTs2npF2C+yV4tOt1S9ipaHqASOVhj1SF0sHM37
         QF8xUy5QuxsMqzaw+a9Q/xBC/6qrJYg7E8cNL8njcZstTg8s7iQEadS94V3LXtDFsg22
         UONN0hTV5xS+nAa2zqYopPeYXO8j+sOSOi12wHcuNoyEu/57fDr99cR6Vbwx0VhsuxM/
         DGqjvqqAbjCTuG+Ll7JbdEIKfs7n7hSU/zVFiEjw4/kLTwRA19UYWKomxKYN7gLgfhRP
         GVPpfc+s/sO+7aSUiSEPxmO8xfhfcOJzRQG4Z6U/11I6K05m2TsUQ/h+5sMxnhw4ZtEj
         xvPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783503141; x=1784107941;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=50cC+lOjwWBBzURdhgiGe83iDGJQETCnagLzadfseh4=;
        b=o7Y9usa6KsJdjtm/o90yNEYaeK4t9awC8HPX7T7gjbk2YnWugDlXggPmmldjm1vM9R
         0ONbmmznLwSl6CyHrndL1xXFNok2LKL8q4I9ugrne5RSTlpE10J4JpAyRTiOhYMxGvlQ
         8UX+7BJBJWr9O4Qir36ycaPsU7PoqqoO8Arit5zDzfAOGGAIEmvVBqh5fz8/nbG1Fqi3
         kkS+JYZCtMug7051O7LMbFmBrDA+gQPHOjDw8h3/ykrcOwSd7BxYPPhS6hW3CL3aQo3m
         W0loVo5iFeoHvy4+SzGj81nTKDGqj8ZEU7aTxKFbMFurjE/ssq9mXMBR3n1szY9ECVNF
         CPiA==
X-Forwarded-Encrypted: i=1; AHgh+RoQp+HWmlT2oGU0R0lLqXswJvHuyL48423Kvdy2XIOA/CIomTqh8kesI5XfUAyFkvV5CxL7eX5KCjsL7A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yylj0ZJiinPLVzUTK2IPZZt7lzzex0TDuHFMuilK8ZmWl+HuyYh
	pyUKKfYo+sTxmh4agdZ5yKvZiaNhQd8n2gq/IUO2s1/aAEX0wVdgRYxj4jaq1n83e8wqHgths5y
	sCXqbaVWTMLw+FjMIrv+qCKeTnatWuSZFHX8pVTjZAIYIrdtVIEaSsGb6G4fRFDv44w==
X-Gm-Gg: AfdE7clOEirymVEqjFQwImyhuqNHUewhgC7rWDArLBxxnacxpbnBfiNpYif10slL0cQ
	8TDK/BgJ92MbxHwJiOcupEGUxZNfxz8pMm6v+wrRuGqSd5Y+8LkYNrye4TPFSaURAKaeNLaoJiR
	4L6rAENGbrtLnQOgK60qb5tU4rYM855pEgjTV4IaqNxw5v0+7Sa3V1HOqyaD07ReKGsP8OaL3ok
	BiiJMrO/yC6Ug7uwbHrAVg5wPtxr5e3ljU0FpEwoxuYjYIJPUjBhYFAuLTT/Ka/0GaWrDVVgw4B
	BGPHeopE6fdkkb10VqjmNBSSVEeJTIpA9P46X7iwcUcQ8f5WMvEghdhyEZVzS2gzOQaNn6axbyd
	sLzZqRez0jE81VtEKkuefsPIGB89P72gYOxcVWvYvGVFeUIxn/E8qre1xxMessxvtYdFRke6j4j
	uKa/yeg0BF
X-Received: by 2002:a05:622a:5599:b0:51c:291:82eb with SMTP id d75a77b69052e-51c7a4a9933mr65537661cf.14.1783503140781;
        Wed, 08 Jul 2026 02:32:20 -0700 (PDT)
X-Received: by 2002:a05:622a:5599:b0:51c:291:82eb with SMTP id d75a77b69052e-51c7a4a9933mr65537311cf.14.1783503140245;
        Wed, 08 Jul 2026 02:32:20 -0700 (PDT)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ce1b374asm82248066b.60.2026.07.08.02.32.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 02:32:19 -0700 (PDT)
Message-ID: <dd34b44d-396e-4267-b383-e4f8d20f8ef4@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 12:32:17 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        linux-media@vger.kernel.org
Cc: bryan.odonoghue@linaro.org, loic.poulain@oss.qualcomm.com,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-6-atanas.filipov@oss.qualcomm.com>
 <51a0abf2-2a72-4551-894b-2c2de91ba0c2@linaro.org>
 <74a5b549-987c-4dac-a1a0-ff81150cd6ab@oss.qualcomm.com>
 <56f1fd7e-42bc-4034-81dc-302cb7c22951@linaro.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <56f1fd7e-42bc-4034-81dc-302cb7c22951@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GJc41ONK c=1 sm=1 tr=0 ts=6a4e1925 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=WedJO_QhFF0jeLZjxQ4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA5MSBTYWx0ZWRfX2OZ49pFp+HaP
 jMhUGNmd9Xo/SFTHGY24afVHCWkNOlCM4ZOJWVR8AL/2y9+e+602KLVB7+HOTEpKKAnpkTMY1ry
 JkC4atwu1fL1pBJQJZ679YmpHBgxOEY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA5MSBTYWx0ZWRfX7dA3UwTWg0RD
 DdwznkWwcNRjvtIgutk63efwerb7qhP6+D7SL3eu7WVC6jCL9XBqknKnf07ZwXjBjqR6YoaDUo5
 uVcSi30gBI3yePYSga11xNUpUj893wvo5x0nRbo+qa5tXDbhlnZlml/MLF6FLlYy7xlHOWQtwBQ
 1DEBD11KYMcF7ZdUCJX3EdoW5HROAszQJlbJRTBXNqIXDGaHaTCsyVzSWDb4DMtwr2N2a1o8rkh
 6xJSvBx5pdFccBTLIPcEutYrner2MljvqiewnU9SU2mJN6MQ0NqAaZWSJncJ9/HFgG8jMOnZ+VH
 kzhsBRZV6DTRvdRwlUAONjKYaA2KHlecJbpPPELgGkPGu+RY8KIaDw8TcMhO6Ezl7UWB+vqbN7C
 P00p2U9ssEsAi6f5wmnRW47nXZ+Oqzu1rvLH008ldHQfT9CHbZ0OOntkRsVvmH5vkbQyWxyAuAL
 vvi3FNAmrNo+ybwjz4w==
X-Proofpoint-ORIG-GUID: wkltmEyhZEcs_rkQHXhP9mOwkEgLtZmE
X-Proofpoint-GUID: wkltmEyhZEcs_rkQHXhP9mOwkEgLtZmE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080091
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66965-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vladimir.zapolskiy@linaro.org,m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[gjorgji.rosikopulos@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gjorgji.rosikopulos@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 48FB1723C45

Hi Vlad,

On 7/8/2026 11:47 AM, Vladimir Zapolskiy wrote:
> Hi Gjorgji.
> 
> On 7/7/26 16:24, Gjorgji Rosikopulos (Consultant) wrote:
>> Hi Vlad,
>>
>> On 7/6/2026 10:46 AM, Vladimir Zapolskiy wrote:
>> <snip>
>>>>
>>>> +            interconnects = <&gem_noc MASTER_AMPSS_M0
>>>> QCOM_ICC_TAG_ACTIVE_ONLY
>>>> +                             &config_noc SLAVE_CAMERA_CFG
>>>> QCOM_ICC_TAG_ACTIVE_ONLY>,
>>>> +                            <&mmss_noc MASTER_CAMNOC_HF
>>>> QCOM_ICC_TAG_ALWAYS
>>>> +                             &mc_virt SLAVE_EBI_CH0
>>>> QCOM_ICC_TAG_ALWAYS>,
>>>> +                            <&mmss_noc MASTER_CAMNOC_SF
>>>> QCOM_ICC_TAG_ALWAYS
>>>> +                             &mc_virt SLAVE_EBI_CH0
>>>> QCOM_ICC_TAG_ALWAYS>;
>>>> +            interconnect-names = "cpu-cfg",
>>>> +                                 "hf-mnoc",
>>>> +                                 "sf-mnoc";
>>>
>>> This is the topic, which may raise a disagreement, but I'll repeat my
>>> position about the need to remove all "CAMSS bus" specific resources from
>>> the device node, they are found and should be allocated on parent's side.
>>
>> The interconnect has functionality to handle bw requests from different
>> clients.
>>
>> Yes the best will be to have camss interconnect, so jpeg and other hw's
>> to vote
>>
>> on that (actually it is possible in icc framework) but what is the
>> benefit of moving
>>
>> those to camss? Is it not better to create camss icc. I understand
>> you want them to be on parent side. But how to vote on bw? Most of the
>> time it
> 
> Let's concentrate on hardware bindings description, no APIs, votes etc.
> at this point of discussion.
I agree but there should be an API for icc voting which Jpeg need to use,
currently it is fixed to some values, but voting need to become dynamic
at some point of time, because it depends on runtime parameters, resolution
format etc.> 
> There is SM8250 CAMSS device, which serves as a hierarchical parent (or
> could be considered as a "bus" device) to this new JPEG encoder device
> and probably to a number of future IPs under CAMSS. All CAMSS sub-devices
> get hardware descriptions as children device tree nodes of CAMSS parent
> device tree node naturally.
I agree the device tree is best to represent real hw topology. > 
> Copying of the same identical information about clocks, interconnects
> and power domains from the hierarchical parent device to children devices
> is not needed, and practically it only lowers signal-to-noise ratio.
Here also i tend to agree.> 
> Since information about the actual defect in hardware description is
> reported, the problem can and should be avoided, the handling of a better
> hardware description and dealing with any kind of complexity will be done
> in the CAMSS and/or CAMSS children drivers.
> 
> If you need to get a bit more formal point of view on the matter, I'd
> prefer to see descriptions of hardware properties organised in a tree
> topology rather than in the originally proposed star topology. By doing
> it the system complexity is reduced from N to 1.

Maybe I'm missing the whole picture of your proposal, but I want to add my
point of view on this matter.

The JPEG encoder HW block has no dependency on the other processing HW
blocks in the camera subsystem

It shares resources like camnoc, clocks, GDSC, etc.,
but does not share anything with the other HW processing blocks. For me, 
the JPEG driver should not have SW architectural dependencies on CAMSS.

The shared resources within the camera subsystem are reference-counted,
the only exception is clock rates, which are set based on the last set_rate
call — but I think that could be handled by migrating the clocks to be
represented as an icc-clk provider, to keep the higher clock and maintain
the needed policy.

What I think would be best (just a proposal) is to introduce a new camera-icc
provider that handles all these resources — camera operates on bandwidth
anyway, and rate calculations should be done in icc, since the  infrastructure
for that already exists in the icc framework. But I think this has already been
discussed with Atanas, so maybe there's no need to go over it again.

I'm not sure how to move forward with the JPEG encoder changes.

I see two different proposals:
1. Independent sub-nodes (Bryan's direction) — I honestly like this one more.
2. CAMSS handling the resources currently managed by the other frameworks.
There are good arguments for this too.

Bryan, as maintainer, can you say which direction to post next? :-)

Apart from t


Regards,
~Gjorgji

