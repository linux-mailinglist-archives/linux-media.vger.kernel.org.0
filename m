Return-Path: <linux-media+bounces-57143-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OC4WC3MixWmC7AQAu9opvQ
	(envelope-from <linux-media+bounces-57143-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 13:11:31 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C52B2335011
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 13:11:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0A600308E4CE
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 12:07:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B911E3E4C88;
	Thu, 26 Mar 2026 12:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CS5Cf4ZQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cu/VAH7V"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A043F789A
	for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 12:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774526826; cv=none; b=dnXDOgo+an+v8EFImk73TC8e9W1vLADqP85la1CrAtWQ5GB6M+Eq3lTGII/igk1abYR7hqkP00F6mRuKCrJRcWlUy7PkkEHVoe3GthPr8cqKshGPvwpzPCQD4yOy+IYDhg1HFK2Col/wnoSlkBZV/XAWy4GSA4CY0SqsgDFifPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774526826; c=relaxed/simple;
	bh=VGmkSRhf8QPXnE2EoJZ/NS89R0xqWBWWZdZZHt2XNvA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=jFBTVUjqO4wMEXL1IZJ7LPjDB4neztMjPyHlTYLjg4Rm9p1yB4IjNXEtgNI7pSbRx0UImQ2b+C1PhlHZDk2b/cksjb5LztvP7tYoFWwiFPB7ivH0X9VYUXnv/mtu4DHYC4vO5hqBr84B6AAvgV0e2qshBoctaXowqQgX9YTU/8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CS5Cf4ZQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cu/VAH7V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q6uH8B1061708
	for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 12:07:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XDhl88bVqyu17xGfeK+lPA3g2oinqiNwhpJk9qPpcJg=; b=CS5Cf4ZQl7JNnLDM
	y17ZXm3Jha3AxHkbB2RhqX5xrhGsNn3MmB7ZLDDoYk/Q9wFnYY4pZPel50pRNWeB
	g0uMxT66bmeWOvruEPFxg7NEXsDbnz7zwbfYhuvLnEut7YCWjs4nCE9AFDEVrAFj
	DGfbmU1i6TGlvIsSug/T/nTEWhHpLXtLB0lkhjrpRBLqZVyppGFRkS9mqI8P+Moi
	F6OYXNH5iKLx5O9rJ313Bx0VOB068IffHnO3Ckesk40HdXSJVTZdZftYEfwykvSM
	uoDgGD6USX17X/yj9Vz7FnG/PTcCz0fXxJnIb+YpVp2wic0MpCkY80LEn2mitPP2
	IuEAWQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4qksthxh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 12:07:02 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b802961ecso14809091cf.1
        for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 05:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774526822; x=1775131622; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XDhl88bVqyu17xGfeK+lPA3g2oinqiNwhpJk9qPpcJg=;
        b=cu/VAH7VEszfH+MyJXXqyMxBZe6gZwFvC1cbcaWH02dGICS0zHahBbYL9liY6kFu0l
         j+z5oJTisXBTpMHehj3f6qWlrR6hay2LQfEmpdU4m28XJ2HATArM+u43/IjpaazRsT1E
         DgNZd5fXT42j59UJZF/PKiEYQ2+y4W1X4U37wmAKt6VwlG5558Z0GfEegc1R10Gjg2UI
         C2M84Jdmi4uQVJC28t9F+2HiB3QoQGEjP1XbN+4OqlY7Sf/AGQWry6i9/5HnUlycftf0
         uFH54L2bX+LpkuDZmD7Drg0pJ4lyq5F9wcv9+Y1uSM9SNzeWQPo3GSxf+XJjVyq4Fidz
         S3cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774526822; x=1775131622;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XDhl88bVqyu17xGfeK+lPA3g2oinqiNwhpJk9qPpcJg=;
        b=LguKqarW/UOxyAfCyvxrEfhRarYPZqinet8YtEET3AqHqCH6u275MoEiO6Y0Do0PJI
         Ds189hii0Pgb8WBC7mkm22t5K2dsI34GCo/Uv0Ytb39JHVSTbs+YlV5FP/8TnRxboR1X
         fyQ2Rjad0IopgpcRyl/Wnf1CzWG8W5dq7JqQEwcfPWQiCTRzdTtgme8VYOoZlR20Yb9x
         FGAgRtMwo054idteBSGUuXbfiJD3Wmmf2iHJIjq2xcbccBP8igpMqbKjv9lj6L9b3jFL
         rxYq1oPykrUjZnqOXVOEXdGaDgXRdozBe96t5aOV72MXmJHrsr7M3wHicqdXmfZX0IM1
         iF1g==
X-Forwarded-Encrypted: i=1; AJvYcCW/hu44Ie5Es0wXCXhF4da1SmoeZnDZ0Ly3yBw9d+RAADINnMcEImVwhjgqGlQQvTw5YR+ybopgEZ7bkw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJSyYZ7n0gqaD/Bbxhud0j5xf8jPcLcCrsHFngSu30Pl+y8tvt
	ATJihU6oNw0S0WlrR5lRvEIJECQPfJ8Ht5/HT4cPx16lbCfvf9U6hVXqDKhF3Ik2etNnic9L2QH
	ZUWYSeD3mbLWGD10cjoWUhQx75O5ZiL89g0txXU4X5F+G7xVzSEqPgJfrGX+f6VufGQ==
X-Gm-Gg: ATEYQzw9s5ERwEJgyqjdW5s8eUJf3o4PPLvsqEoQjvuyT0CvVKwTFQ5cYhKy8RJnUmL
	l+NyziplVSKmq5wR3nUhUeCoALRHSYJLbntW+Ne4OxSLiH8wSuXXsLiqbL14sL9Mz2Er88na5Dw
	OLgXwF/KsJxVE8gGnRQ+YSg3NcClyNasmWL+4VPDBL14MvpAnJkhCbTDGhyTdGTuwcllxJWpSae
	WccgYr/whWAHdOGa0lk5RNVtJvu77pJ5gnGBUIf1ibgE2HCryJD5K0Cy7rLPkitgtcxcECPRERv
	eohZipmqKcznfoVws425BrM3/pUHbC/pHkjzzYey78PoThjMjhNWZnGbUo7p4m82C62RQLP5Q7B
	kylKooNXxTagzegWsePIo7DJLP371rCnbDMdVJMo/2hPTbh7p5rlHPsgN+T4H7iBmIsNdmO06QF
	DmIXsjsAxC70yXdsL+boEm3ZdrG2AVX6c8ZNhc0k1lfQvaW+vi2QAylldLSFvcKjkLG7idmwZbW
	IZ54s/7uIhRRHU4
X-Received: by 2002:a05:622a:492:b0:50b:3ff3:f489 with SMTP id d75a77b69052e-50b80e36161mr94928471cf.34.1774526821993;
        Thu, 26 Mar 2026 05:07:01 -0700 (PDT)
X-Received: by 2002:a05:622a:492:b0:50b:3ff3:f489 with SMTP id d75a77b69052e-50b80e36161mr94927811cf.34.1774526821403;
        Thu, 26 Mar 2026 05:07:01 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b203ef851sm109201466b.45.2026.03.26.05.07.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 05:07:00 -0700 (PDT)
Message-ID: <7fc31426-3157-49c7-a30d-dcd7b181fcc6@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 13:06:59 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [RFC PATCH 2/3] media: qcom: camss: Add CAMSS Offline Processing
 Engine driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        vladimir.zapolskiy@linaro.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, robh@kernel.org, krzk+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mchehab@kernel.org
References: <20260323125824.211615-1-loic.poulain@oss.qualcomm.com>
 <m61yNNvSrw6AIq7_-g2h7VQLmGJ_5iCLg5JTlfQDcL5LlBq37ifAeXw-K3AlRBck5Mb4uVQq0pzeBNAybQNk4w==@protonmail.internalid>
 <20260323125824.211615-3-loic.poulain@oss.qualcomm.com>
 <1ba54ec0-be51-4694-a79b-f272e76303d2@kernel.org>
 <X-Lw_zi1o015-V1Cv4dY_ik6SfTB8TTcLmn1l-Ta7UviYTJ6gwMBn4B4ulYwjd_Aetul5xUt0T6ln9E-Hl5h4g==@protonmail.internalid>
 <CAFEp6-3ziXJTYADOFj--rZL5TumroXuW+=SnUQ9XakRxHT-ypg@mail.gmail.com>
 <12194cc0-0960-486c-be7e-1a22d95de340@kernel.org>
 <rj2vb725he4yzfvjifzyxqpbqk5oztfaafp7sg2qes4qz3mlaz@z5dyoqod56d7>
Content-Language: en-US, nl
In-Reply-To: <rj2vb725he4yzfvjifzyxqpbqk5oztfaafp7sg2qes4qz3mlaz@z5dyoqod56d7>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA4NCBTYWx0ZWRfX5Qj+nGfTs7vh
 CJycIlLmmFEsHmk4prTwuA/FZxlR7zHCT0/I4tDMnLCW3y3MHUqo0y2gjXt+NDdfBNc4c/TQtxT
 HXByxJN36H5LrYgi34KexV/EpQql3zVtDME1rM08XfzmYXHgEzr34gJidHhSBmgmt5O1EEYLpLE
 aD28rYJ1DHH2leVsaEnQOmX6DXZMWegKtUmNtAG+zC1AN9fBaHJhkHJboS6qCNGxz6No+fQio4m
 T6SC725369ciOX0UrpKVppAfna9+2l5SpM86mLH1lld/ez7UVGWOhsj50Q+XXtujgzVSrrK3vjM
 0SH5o92Nt8nGPfO05ZGfxOLbkNGokumUjVYHOXRyE/1yTBKEnZqtNQzG91GnQ7LM9HM2CB6Y5Et
 6RBk/BDRaKetBu6TGKATqWjbLsjkrToPTeD11votgSPs0aXiG6YPkDzI7M/MqWtTZIHYGUSZ6VP
 fsR7mOYPMmFAG6JdhUA==
X-Proofpoint-ORIG-GUID: 39sG1MS19dsqirBqxXKDV25wpI5JGo-K
X-Authority-Analysis: v=2.4 cv=eOMeTXp1 c=1 sm=1 tr=0 ts=69c52166 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=RCPHVYlSrOQLcUI7fhoA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 39sG1MS19dsqirBqxXKDV25wpI5JGo-K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260084
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57143-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_NO_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C52B2335011
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Dmitry,

On 24-Mar-26 22:27, Dmitry Baryshkov wrote:
> On Tue, Mar 24, 2026 at 11:00:21AM +0000, Bryan O'Donoghue wrote:
>> On 23/03/2026 15:31, Loic Poulain wrote:

<snip>

>>> As far as I understand, CDM could also be implemented in a generic way
>>> within CAMSS, since other CAMSS blocks make use of CDM as well.
>>> This is something we should discuss further.
>> My concern is even conservatively if each module adds another 10 ? writes by
>> the time we get to denoising, sharpening, lens shade correction, those
>> writes could easily look more like 100.
>>
>> What user-space should submit is well documented data-structures which then
>> get translated into CDM buffers by the OPE and IFE for the various bits of
>> the pipeline.
> 
> I hope here you have accent on the well-documented (ideally some kind of
> the vendor-independent ABI).

The plan is to use the new extensible generic v4l2 ISP parameters
API for this:

https://docs.kernel.org/6.19/driver-api/media/v4l2-isp.html

What this does is basically divide the parameter buffer (which
is just a mmap-able bunch of bytes) into variable sized packets/
blocks with each block having a small header, with a type field.

And then we can have say CCMv1 type for the CCM on the OPE and
if with some future hardware the format of the CCM (say different
fixpoint format) ever changes we can simply define a new CCMv2
and then the parameter buffer can be filled with different
versions of different parameter blocks depending on the hw.

And on the kernel side there are helpers to parse this, you
simply pass a list of the types the current hw supports
+ per type data-callback functions.

And then your CCMv1 or CCMv2 helper will get called with
the matching parameter-data.

So this way we can easily add new hw support without needing
to change the existing API, we can simply extend the list
of parameter types as needed.

Regards,

Hans


