Return-Path: <linux-media+bounces-67229-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AWfBOUCSUGol1wIAu9opvQ
	(envelope-from <linux-media+bounces-67229-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 08:33:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E10F8737BA1
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 08:33:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="pJ186v/t";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Io73CdqC;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67229-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67229-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BF8A53010C82
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 06:33:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F25CA3B38BB;
	Fri, 10 Jul 2026 06:33:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2523B14BF
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 06:32:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783665180; cv=none; b=YCTctWz7d5SmXC133sfrkER9eymOvLOBFE1TP3EBwxaF1agJ4uSLVRL0f5JbJcEx5XHP6cAv+k2oQtQMaqJk6+iHwVSxgcoGzECrdrWA8M0WOG8AVhw8jOgqnr1+pyyXEFEMYVCyxt5eYV4+hIzjB5dVBzpChqvL3Js6xy7WZQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783665180; c=relaxed/simple;
	bh=07CRYaFwVcxi7RFd2sA9/xbBpELq/H2DfkpGkFJ7eGg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cxcIi+eScF00Q8TAbKgqqrMiHa7RZ51OcDPokceh5hRqg6kTjCgMFvp0RZlcpUflXt4bAAfkqijoLEaMKoIXEU68qfhqC1QL1xrRXjl1TgrgNs6T3doO7I4zhd8S6WxbmjsXo9W8AbBd6NcNrtNG7TqWVYKo2Q7Cs/rzMm+d4uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pJ186v/t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Io73CdqC; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A3miUw3721105
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 06:32:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	njjAU7s9jTarzjwOlCAqHNCGF1bx0DdyM4v+tAuxULo=; b=pJ186v/tLcYTrcay
	FGdYfyJFJCJF52Kfa8SVy4YyOnsjjSXhxEIY0pEca/FDafdyRikiH9+zd4WhREay
	+1XdrUOejjzo2qzqTxYncNaAgF5c5UAjYxxIHWdZ6xCCLAV6OFDAv12q3DpvHlui
	XeAQE3EryGNKYSEP8HYQASOHnTKWOLrzNCutRcJEgGQU2KbW32ODeKGI+VnG9N4m
	U5amHpJVERLJ8h+B1k7l7K9EzBVEHQVLuWnx4G+z89s9CL+kbC4R8Oq9aHfxLviv
	RevcVztSQmnx65ApL8D67XAIQN3lYWBVnARAnfZYTDYOUZESfFMr5X19VV6C2CMH
	UrDMmw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fajwt9q9g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 06:32:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c26012cd0so6284851cf.0
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 23:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783665177; x=1784269977; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=njjAU7s9jTarzjwOlCAqHNCGF1bx0DdyM4v+tAuxULo=;
        b=Io73CdqCpddDPhNucES5pgFQd46an4kHqynnK+3SFyuzyfVbdGcNUqbLQw5KIwqwUS
         BAXXvJE4+gs7YGMtE9UgvmQ0seNscKsF7XeUTgp/+Wefl392QJ9b+Fgkkx2HXOvMeRLc
         qAVPbN59gcG7qJVv+xADPK1MxG/HcZswjGHzDp2h6IFNmH7npKDTnfBAXsGlnS/t6ncT
         U6FH2vgMN7vhnna5NuIsTHDVgzHTEfBMCiiaYXIYHcfyBy57Nj92+3ruUQkPsE/NA3Ky
         5gDJNEg2P5j0MprK4JVro3cEMrnsMkopx/dRFqy5m570xeQ7u6KnuxagXIe1v1TTmOeQ
         Bnsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783665177; x=1784269977;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=njjAU7s9jTarzjwOlCAqHNCGF1bx0DdyM4v+tAuxULo=;
        b=ptZlPlaa++PPVWZpdpU5/WG4UA2FJqs46ohlzskyqGa0nvNirik1V83Xz60Ei4Gw0k
         B+COybHRUrBU0NdlFFczxXvv0WPRMSED1jc2FcRqchfep2uNAHINwWmos81Gl/qlojeP
         /u8ZHtLj/5GPRAHRqN7KfsIa+j5MXyjPnUFz+ho+Z8Q9bzcqhKlbfFq/4OrvEjMQfoOs
         AY3q+xYgp1BUpsyVu5b41K+LLPsPpWy6XYNxqgVJrYSRAHiFFo52IVXixzTdCOEu7C9U
         qaiTuCYLRjwqQ1/mDDhLBvrfoiY7DUH0DtF5Fjsu99tmU8O8pF4lc8bmk54dLj508yJJ
         sdDQ==
X-Forwarded-Encrypted: i=1; AHgh+RpDNwLVfSay2smMx060Da65xky/ORCtevqTbw/i4ANZfnED/KSzfoGHS+MubzgCy9yATsIdKvCCgmEItQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvLtvO5DFisfFyMNAfyDDEWGRDT58PZtQhAtzj9Rs+jp1W2uJJ
	AfMOlVgtXegwd5RfYmzo8ZeD+vg1XLDRWdHW53kW3zSL65bxqRc1Y+xNlfnrmg/EjKXnrVXxi3g
	5dQabJ2tXj2Ijn4VDsmM6x0mhcHvTRqx34+cREVwacicYbQc8fdHAlajEdUZwUCBkfw==
X-Gm-Gg: AfdE7ckCOQ+LSjBcPPNnA7r0Fpp8hHpJEP0LJgN+Zp2UXImpQz9cPo9OojIzx4JBtRL
	PW4INrsQ2olfm3Tmy6WBR0dVHq5fZfDoU5eu5Ora9xxyoXIapQXXC26Pai+M1ydX066kI21Mm09
	0lLDPau1chzvwmjAd4Iu77ED4yUY8vm2siGwSjWn4g7h+zCYvm4KvaVx1TPkcuJWJzcvfJimHo3
	t69S+mO+J+7eK1MLNfzyPoyHsXHFeUuqPdW4LyqmX95JDiAvngW/Sq/qsi404zfnPFqf/Jc7WAq
	vJykGtj0jPD/XhAGXwMBxwXdfdgI2txTCK0f+OHAwRXnOGtA6iTryTENmC/O0Iab+/KJgbIj4FJ
	sqwESwS7cmkwpYOPSOu0JDrFVGkD34l4y5sqSFCCNpdwDfw==
X-Received: by 2002:a05:622a:1911:b0:51b:f563:f613 with SMTP id d75a77b69052e-51c8b450a23mr100882051cf.35.1783665177199;
        Thu, 09 Jul 2026 23:32:57 -0700 (PDT)
X-Received: by 2002:a05:622a:1911:b0:51b:f563:f613 with SMTP id d75a77b69052e-51c8b450a23mr100881871cf.35.1783665176789;
        Thu, 09 Jul 2026 23:32:56 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.253.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15f7137225sm96922466b.53.2026.07.09.23.32.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 23:32:55 -0700 (PDT)
Message-ID: <409c36d5-d445-4ce3-aa39-34bcb859f74f@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 12:02:46 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 06/11] media: iris: Add hooks for pixel and non-pixel
 context banks
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <20260709-vpu_iommu_iova_handling-v1-6-72bb62cb2dfd@oss.qualcomm.com>
 <osurkrrhqgkxtgv6lkose2n7ll5f3ofydl2gnjenogtyxaohvm@7ccuyiaeg2nm>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <osurkrrhqgkxtgv6lkose2n7ll5f3ofydl2gnjenogtyxaohvm@7ccuyiaeg2nm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XOYAjwhE c=1 sm=1 tr=0 ts=6a50921a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=MoCqpHF70WjPNMFBpltNPQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=w9QpbRTAcXsmfhfIaDkA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: Ka3UeObR5HK2ZrYs-UYLpMoHxvwZJQkP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA2MSBTYWx0ZWRfX2L11seHces3n
 8q4W6yHruyyMvHdKB20wt5jQFuRAJflocx8y69lhIgCqvQ1iEP0oHDr+CDZIhZgRsZIYrSGDpdz
 w/bUZwZBNMUUn6T26iFZNYo49pj8mMU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA2MSBTYWx0ZWRfXyo9uGUA7+iR1
 p+GanlK2F35FERQ0blfMXGTk9JaT2yS5dNNUOvFvsPiUMvxIfWl19cpC5igqMOdqSV7uKfW4+Y6
 qvPMRgd7SBS0eGTz9zJFKXdtcKzImO7kqfSLfm7lczU2Ostba2HmTh9rULN6Fq+zzipGEFxLOI8
 vHUChZK/vs7DZbhLbcIX3Sbdi8Z2axll4B8ZQhZUbfr6mtKLGkBXBE+Y+cy+ZBKKyz+b14ygPaI
 Ur+IEvW8vQcXKRBlZOCiSn3VOY9a9GBBjl5FXf0YO85h1cJocn6iUWXwiEGQfFMDV4amlRvSM/3
 OgnrIsgdexqCnC3CyA8eLhhZFi6pFcTflG7a7rkgN3rd0MstNKRNwEMNX2LptDXni0vlQUKhUWF
 r14QY834f8tGHRknJHuruKi/5VEv+htJcq+ig78aYEQL0DZ2F2cu0sgUlrSxx4aC2AUT6Zh21O7
 R7fHFYn1zHuYdPSNwfg==
X-Proofpoint-ORIG-GUID: Ka3UeObR5HK2ZrYs-UYLpMoHxvwZJQkP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_01,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100061
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67229-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E10F8737BA1



On 7/9/2026 6:44 PM, Dmitry Baryshkov wrote:
> On Thu, Jul 09, 2026 at 06:05:52PM +0530, Vikash Garodia wrote:
>> Iris platforms use separate context-bank devices for the pixel and
>> non-pixel domains. Add platform hooks to create and destroy those
>> subdevices, and wire them up for the affected platforms.
>>
>> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/iris/Makefile          |  1 +
>>   .../platform/qcom/iris/iris_platform_sm8550.c      | 71 ++++++++++++++++++++++
>>   .../platform/qcom/iris/iris_platform_sm8550.h      | 24 ++------
>>   .../media/platform/qcom/iris/iris_platform_vpu3x.c |  4 ++
>>   4 files changed, 80 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
>> index 48e415cbc4390bc596f6239fefa2a2ad2cd3a2bb..fd6bfe7e786be3f8a4885296fb11ba430ded6fd1 100644
>> --- a/drivers/media/platform/qcom/iris/Makefile
>> +++ b/drivers/media/platform/qcom/iris/Makefile
>> @@ -12,6 +12,7 @@ qcom-iris-objs += iris_buffer.o \
>>                iris_hfi_gen2_packet.o \
>>                iris_hfi_gen2_response.o \
>>                iris_hfi_queue.o \
>> +             iris_platform_sm8550.o \
> 
> No, it's not a separate platform.

This will be dropped, given that the callback would be made generic for 
vpu3x and would be implemented in iris_platform_vpu3x.c

> 
>>                iris_platform_vpu2.o \
>>                iris_platform_vpu3x.o \
>>                iris_power.o \
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..bea904a9249bafe1dfa11ff39155d1930402bf7c
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
>> @@ -0,0 +1,71 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#include "iris_core.h"
>> +#include "iris_platform_common.h"
>> +#include "iris_platform_sm8550.h"
>> +
>> +const char * const sm8550_clk_reset_table[] = { "bus" };
>> +
>> +const struct platform_clk_data sm8550_clk_table[] = {
>> +	{IRIS_AXI_CLK,  "iface"        },
>> +	{IRIS_CTRL_CLK, "core"         },
>> +	{IRIS_HW_CLK,   "vcodec0_core" },
>> +};
>> +
>> +struct platform_inst_caps platform_inst_cap_sm8550 = {
>> +	.min_frame_width = 96,
>> +	.max_frame_width = 8192,
>> +	.min_frame_height = 96,
>> +	.max_frame_height = 8192,
>> +	.max_mbpf = (8192 * 4352) / 256,
>> +	.mb_cycles_vpp = 200,
>> +	.mb_cycles_fw = 489583,
>> +	.mb_cycles_fw_vpp = 66234,
>> +	.max_frame_rate = MAXIMUM_FPS,
>> +	.max_operating_rate = MAXIMUM_FPS,
>> +};
>> +
>> +static int sm8550_init_cb_devs(struct iris_core *core)
>> +{
>> +	struct device *dev;
>> +
>> +	dev = iris_create_cb_dev(core, "non-pixel");
>> +	if (IS_ERR(dev))
>> +		return PTR_ERR(dev);
>> +
>> +	core->np_dev = dev;
>> +
>> +	dev = iris_create_cb_dev(core, "pixel");
>> +	if (IS_ERR(dev))
>> +		goto unreg_np_dev;
>> +
>> +	core->p_dev = dev;
>> +
>> +	return 0;
>> +
>> +unreg_np_dev:
>> +	if (core->np_dev)
>> +		platform_device_unregister(to_platform_device(core->np_dev));
>> +	core->np_dev = NULL;
>> +
>> +	return PTR_ERR(dev);
>> +}
>> +
>> +static void sm8550_deinit_cb_devs(struct iris_core *core)
>> +{
>> +	if (core->p_dev)
>> +		platform_device_unregister(to_platform_device(core->p_dev));
>> +	if (core->np_dev)
>> +		platform_device_unregister(to_platform_device(core->np_dev));
>> +
>> +	core->p_dev = NULL;
>> +	core->np_dev = NULL;
>> +}
>> +
>> +const struct iris_context_bank_ops sm8550_cb_ops = {
> 
> For a long time I have been asking to fix name prefixes. Now you are
> adding one more. No. Please write it as a rule of thumb. All new symbols
> in the iris driver should start with iris_.

Ack

> 
> Moreover, there is nothing sm8550-specific in these hooks. Enable them
> for all VPU3.x platforms uniformly.

Good observation, will change this something like below;
.cb_ops = &vpu3x_cb_ops,

and the callbacks can be added in iris_platform_vpu3x.c


> 
>> +	.init = sm8550_init_cb_devs,
>> +	.deinit = sm8550_deinit_cb_devs,
>> +};
> 

Regards,
Vikash

