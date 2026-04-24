Return-Path: <linux-media+bounces-59521-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPE1GwlY62nkKwAAu9opvQ
	(envelope-from <linux-media+bounces-59521-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 13:46:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BA76345DF8A
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 13:46:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 30668301E3E8
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 11:45:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA6DF3624CE;
	Fri, 24 Apr 2026 11:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KEErPifd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X0SG7a3E"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50CD27A462
	for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 11:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777031122; cv=none; b=qL8oaVkaE9OekvcfAH1p5RMel5uaXYaO3Z1oWoQe1Ig0p1dKsaz2wgWtiYM2D8RcmTULBE0Tz8QSgRA2XmiQWVv+MVtTQ45GyNX/nr+FYDziXGGAr88hcxffGUFwt8hZ6ObzX0CBxoP2jAp3n3iwPqsZ7iHDAtfWrXHYkuD5hNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777031122; c=relaxed/simple;
	bh=sUwdYkQp1oZ3EzBJbnMVR1gTk663wCA8A8zZnsUbQgQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oU8FI+S5p+d1MR/eNQQRcpZ8eYL0qEzdHXmFCmpD2nKTWdiprZLK1TZr9YmH7jlTKgqJGlULQcLNZN5titUR5+MDtKgXKx68+b6c87eBxesceagc5ih5kbAX/TTEi2oP5XnD9kv+AwQesVUNC97LT/KDbbGEbkppoKIpV5ujPpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KEErPifd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X0SG7a3E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O7CBmt1823612
	for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 11:45:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vKD+oIXo8r5i+72tQbUpEkekMjtbIYtq2yZlf7mfgso=; b=KEErPifdYn4zic/W
	+0SI2Cxb09hK+xb2nh4J1gZerJ3aNlQnxYHaQlbgVa08VCXZ+4T54lQTHE8E487F
	cCSzG0BcBokq8YT3neEZg7zNGhuQlxJR8iVdmo92VrP6mRait0WrN0DJmPMuFfaH
	yjSA4GIed25xK5BkjbDiwWinSrGkrsqst/ZysXd0TZoXuXNBO0hKyZxC9t1JcGL/
	OEQxmiKBTTihMWypvZa9l+Be22bVLesE2xCwtkcIokiB0+B+CY5Y2piY9RdblTSI
	GGmX0WB879Um7NO/Q+CnSgas3JjafGv3s2uw0iEA27A59O2a5BNOU8pikUrxggCf
	QzzUEA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqv5rtsst-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 11:45:17 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f6610a6c8so4093987b3a.2
        for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 04:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777031116; x=1777635916; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vKD+oIXo8r5i+72tQbUpEkekMjtbIYtq2yZlf7mfgso=;
        b=X0SG7a3EHJWlgp5ZvycitxgWunsI3LiIrNCi9YNVc/BzC/hpTG6vppMGYAW9iWztlF
         ho98MiZYx3/61+0NDmKubEUp2Y7+0FbeQtudIl37ogFSg9wmSdmzyem00JbmQvJNxLEM
         PwuFbkmG3TaZTfDEmpoy9AvYlm0VB6TUtBqfRdzF367+cgcdUTMEKhlETItjkKC9D3am
         kvig9eGgxQZYc2CaMGVXfOUw6EOFaRMRafJhYbr3t6TCq/X0rLdnSupa8iyKIjHpa+7j
         AOYoEgw4TIbMSUpDYwOoHfPRVQ0Eqk26EjPlGWkFiraAcg7QgNhA3kSbDsxhqZLGbatv
         BgUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777031116; x=1777635916;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vKD+oIXo8r5i+72tQbUpEkekMjtbIYtq2yZlf7mfgso=;
        b=nIlDhC+yEY9K6GlX9S9tdQ70X0PiyDq9SfAO9cwXQ1MpVsm6E3c6MYjUJTk3tVMb+g
         knjoa0E0LwiTK+1Wwc6/VttuxIuchd50VGRCQwaZmrNmMr/70unsequ/9d69f4Z2rhf/
         hH5uUXKSXpzwacdJmr2NUCvTwrlcAlsZ035pSoXH4r6ic55OgcVzFLDIULe7uXrZZ4TA
         NeCqw1un/WVvZyFClJ8z2iD4N57zIXTFV0BTxQIPPfyDxjz3MMCWGEQmASR9yVVipi+r
         cC4cRujOwvN4qUqTcF/w9AjxL98fUKmWytOQQYbJ4KYRHm1CIeUot5lKvjXSIVyKjld8
         M7Dw==
X-Forwarded-Encrypted: i=1; AFNElJ9WXOD8w+yiJFirqbucWQdOjav5U6Nz+QtY7F6jv1UH1itIhhQ2ukTs4/uRKGFlREqafY0lJ7bCwGuPdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg3BBIUMcLXcy0ebqp74vkhM5rLuAoHG54p3ObEBrqCbWrLdIW
	djhsdIafR/5IkK8Sn04TMK6GjV7mjqAdcMVlLl2/VHyMWq/ewdxJR+RoBfYRUSmKP8m288nnH0i
	fo+b3H3mpbImPzkz+8fCIft6d4CtWulIUJrdXTJPP3kzWWklIVBHI08X9ljm7vjjLzQ==
X-Gm-Gg: AeBDieuydqMb0w28KbTgt7qRDAWOHjyt20D2SM1+finfo+hduOyPU0iTkcyGQ1E/rb9
	n75sz7iTENCHAlvT7a2vpesq+tIfwu5PI/jgvNzX0hXXhHIRle/lHl7XH0rANpSuBScuCfgt1os
	ZjyMglOUd+3tJ+/Lm1KaDl5Y6c7Q7R0y7K4VaKC0fbOy2eAhgzDc+RDpcpoKsmXNImXySkCcaJ6
	tTu4j9DSbJ2EoUjSotat6eglMqJw9yVKDfhmNLnoIllHv3Chb4NrMC8OJLChikIvncbvvUnVLRw
	LPh1bUzneuKWR/G9LWs2Sm797tO31WgVceq4Zj00MXEWnkP/xXlrViVy+qhg00SlmC3E51HvSP1
	was5gb8SrRNXUdroaUsx29BRy5pNNSYJEhrK8oBK82aMZboFiTwQNHlcvCrMeI5io
X-Received: by 2002:a05:6a00:27a8:b0:82f:18fa:1668 with SMTP id d2e1a72fcca58-82f8c91e3cbmr31091280b3a.44.1777031116332;
        Fri, 24 Apr 2026 04:45:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:27a8:b0:82f:18fa:1668 with SMTP id d2e1a72fcca58-82f8c91e3cbmr31091150b3a.44.1777031115048;
        Fri, 24 Apr 2026 04:45:15 -0700 (PDT)
Received: from [10.239.60.18] ([106.192.26.241])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec04448sm27904931b3a.55.2026.04.24.04.45.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 04:45:14 -0700 (PDT)
Message-ID: <4c3fa710-f61a-4aad-622d-54909190cb9e@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 17:15:02 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 02/13] drivers: base: Add generic dma context bus
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        driver-core@lists.linux.dev, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260423-glymur-v2-0-0296bccb9f4e@oss.qualcomm.com>
 <20260423-glymur-v2-2-0296bccb9f4e@oss.qualcomm.com>
 <2026042346-trustable-register-095a@gregkh>
 <06c04947-e72e-679b-493b-e112d693f391@oss.qualcomm.com>
 <2026042422-deem-chemist-8d0f@gregkh>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <2026042422-deem-chemist-8d0f@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LqiiDHdc c=1 sm=1 tr=0 ts=69eb57cd cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=K3jt3zD9TrcZs+Uyli2v9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=qtrQGJdHBaugJqU6AYUA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: rm77SkKIKN5R-sSzf4MfJzuPsT_mbMz0
X-Proofpoint-GUID: rm77SkKIKN5R-sSzf4MfJzuPsT_mbMz0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDExMiBTYWx0ZWRfX3Mb2fOcyIPEK
 l7Ci7FXOt7+ng3uhIKuVsSymGi5Frj92F3I6qUlevz39gB4IO09OVSFHZ/Ik3s6BkV+q8twO/R8
 wjiOONlAdR//UV3zGq0WXmX14vpRly3/ifTXR8JlH9lfUCPFyjaLXvKC3HT0Z3lmFRNYCxMhexH
 sD88aQ/wohMfTroAnZNZX33yQCQ7jvKabw6G9CPV8bg6TIaq1VbsGmTY2+4CCrjiw7jsbDt6yS+
 hZ9CTS7BYaw9xrWz8/MRxrSQxi1V/V/MY+kzADpH2ZnBzLtekHhr/Vac9yV5v95TuqSAVgyfD5C
 ezUvQy+XKdExG46yzcw63OPd6UVN7quXM6YPYFxDI5rJllQ1bSDWQ/rR2JJWB0IqZTnGxpGGkd0
 xkKIf6AsUy3aWSTwRC/6jRPcrAVpEcaWcEyDgTC/VrR/8g5d/rK8qcoXdKXklE3tuAAWqOUbu2p
 b/T+hcRT6+fNbv+PtXQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240112
X-Rspamd-Queue-Id: BA76345DF8A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,8bytes.org,arm.com,linaro.org,nvidia.com,gmail.com,ffwll.ch,vger.kernel.org,lists.linux.dev,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-59521-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]


On 4/24/2026 4:43 PM, Greg Kroah-Hartman wrote:
> On Fri, Apr 24, 2026 at 04:01:13PM +0530, Vishnu Reddy wrote:
>> On 4/23/2026 7:07 PM, Greg Kroah-Hartman wrote:
>>> On Thu, Apr 23, 2026 at 06:59:31PM +0530, Vishnu Reddy wrote:
>>>> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>>>
>>>> When a driver needs to create virtual device at runtime and map it to
>>>> an IOMMU context for memory isolation, there is no common bus available
>>>> for this purpose. Each driver ends up implementing its own bus type,
>>>> leading to duplicated logic across multiple drivers.
>>>>
>>>> host1x driver implemented its own bus type to attach an IOMMU context to
>>>> a dynamically created device. The Iris VPU driver now has the same
>>>> requirement. Rather than duplicating the same bus logic again, a shared
>>>> bus type is introduced under drivers/base that multiple drivers can use
>>>> directly.
>>>>
>>>> The bus takes care of creating a device and attaching the IOMMU context
>>>> to it based on the client inputs.
>>>>
>>>> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>>> ---
>>>>  drivers/base/Kconfig            |  3 ++
>>>>  drivers/base/Makefile           |  1 +
>>>>  drivers/base/dma_context_bus.c  | 77 +++++++++++++++++++++++++++++++++++++++++
>>>>  include/linux/dma_context_bus.h | 26 ++++++++++++++
>>>>  4 files changed, 107 insertions(+)
>>> as you can not have a device on multiple busses at the same time, this
>>> makes no sense to me at all.  "dma context" is a bus-specific thing, so
>>> please add it to the bus that you are wanting it for.  It can't be a
>>> generic bus as that just doesn't work.
>>>
>>> Or what am I missing here?
>>>
>>> And why is DMA somehow "special" here from any other hardware attribute?
>> Let me give brief information which was discussed, in the initial series,
>> the iris VPU used platform bus for dynamically created devices and we got
>> the comment/suggestion from Robin to implement a proper bus_type with a
>> .dma_configure callback.
>>
>> https://lore.kernel.org/all/02b3d0f5-f94c-43cd-93af-97cfcf7751b1@arm.com/
>>
>> based on the discussion, implemented the dma_context_bus and used for iris
>> VPU devices instead of platform bus.
> Why not make a irus_vpu_bus where you can do what you want?
Initially iris_vpu_bus was introduced, and it was made generic based on the
discussion,

https://lore.kernel.org/all/20260227-kaanapali-iris-v2-3-850043ac3933@oss.qualcomm.com/
>> Here, the device have only one bus (dma_context_bus), not multiple buses.
>>
>> Regarding the "DMA" naming, the core operation of this bus is its
>> .dma_configure callback, which calls of_dma_configure_id() to map the device
>> to a corresponding IOMMU stream ID. The name "dma_context" reflects this
>> purpose.
>>
>> I am open to suggestions from you or Robin or anyone else, if there is a
>> better or preferred way to achieve this, I am happy to consider it and
>> rework the implementation accordingly.
> As there is only one user, just make this your own bus please and do all
> of the needed bus operations for your devices there (i.e. don't hang an
> "empty" device off of it.)
The reasoning behind to make it generic was to have more users - host1x,
Iris VPU, QDA on the generic context bus, instead of each of them having
their own. Let me know if you suggest to have the iris_vpu_bus.

QDA -
https://lore.kernel.org/all/20260224-qda-firstpost-v1-4-fe46a9c1a046@oss.qualcomm.com/
Iris VPU -
https://lore.kernel.org/all/20260227-kaanapali-iris-v2-3-850043ac3933@oss.qualcomm.com/
> thanks,
>
> greg k-h

