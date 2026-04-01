Return-Path: <linux-media+bounces-57863-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBOcNcwAzWlNZQYAu9opvQ
	(envelope-from <linux-media+bounces-57863-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 13:26:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A27FA3795C4
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 13:26:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0E7D1300B471
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2026 11:21:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 876073F7898;
	Wed,  1 Apr 2026 11:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n3d/GjPU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KSCwkHTr"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D836A39A803
	for <linux-media@vger.kernel.org>; Wed,  1 Apr 2026 11:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775042485; cv=none; b=bxNmcDKU2pcyMJR8ytdlFLhXRTy4pK5yhSsfifScCYOeu6ZKqqKJBenTIuHclbdN1fjqW/l0pZzHMZbb/UjzibwV3QPMaPzwOxsfNEP7udr/qaWsAgC3glejUK/oDnIn3/nGlcI9WvahkWkbDECOJl3xgXAf+tAw2y5nvOXU9rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775042485; c=relaxed/simple;
	bh=VMnhYYDUiaSfV3lX5JRhm4gQqAQh3ymN4z4y+uJ1Bss=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cYJlQP1uIDrcwQB/VjW2/g/0ga2gOyxMyDtoSdhpVvkKRIIWYFMSH7rgKbLYSroUmpWuhYOmJcD0y+2eukoUvX84viXzMpcaaLYs3kiR0AIhDCRxtl4OYn8mcwldahVkmVYWidRoM2PHAJM7jfmhH/uI/nzSHcDPvW+3p+W59So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n3d/GjPU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KSCwkHTr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6317ElKD4106686
	for <linux-media@vger.kernel.org>; Wed, 1 Apr 2026 11:21:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bSggxIu2zQD4DsBMlrluFZINoxno1QBalYiFALDNiKs=; b=n3d/GjPUdHAvz2CW
	58H63oyVg70eCSDzS7dQOgfiC8USySrryu3pXHoemDi5bx38eASlTcAJsAeTPxC3
	0yeC1PkMZjQ8djJXSGttCXqjQvr+pOsFHvyyO8G6AUUTB1gNhPQTtR0B4bGYE0Lr
	yyoljGFMQLcTwj65pvfraKcoQMhcycUvlR5gHZB7drZjH4JOatp4jJD7c64dUYoT
	EjpnjZRkfd+8G0X3ofKkmyJBHH3tGWVP6616I1q3F1ZhmMZkC4j6o8rAnteYbTq+
	llGFuJF/LFcPsGspSs8YNDOFi2IoNL83CVqG0EvWADxoG1KbPbEhhHbubif9d53n
	3LFBYQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8xt910cf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 01 Apr 2026 11:21:22 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82cdaf0f934so2684928b3a.0
        for <linux-media@vger.kernel.org>; Wed, 01 Apr 2026 04:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775042481; x=1775647281; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bSggxIu2zQD4DsBMlrluFZINoxno1QBalYiFALDNiKs=;
        b=KSCwkHTr+UQy0WT0lMbT57libRfCbahSHcDj9kwy/vJFpVJgqDMsT4S+3RHKW5fn3T
         AA63vUskwsv2L47VFUvZWl27emOFglwYYyv/5V8o+2WMaDgAuPNdKnfu3Ga/Q2aI2Eqc
         fQT/sJpk88oPBWo33SV5PIRWJ/dfrOak7fKSvN16k5c8O9N94QGVQOMy3LvOAzliJRhQ
         2qinwZW90ETAuTL0NtN1/dsCc0acNS+OCC8arcpWFC/LTSbyEaUlru5eWd9H1uCc+spF
         N1i/oTMvAijmtOzJVU+jN/RcsHN2uKXX8TmeIYb7BwQSrpopb/Hr7hqFxWcJkiG5LENv
         eDRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775042481; x=1775647281;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bSggxIu2zQD4DsBMlrluFZINoxno1QBalYiFALDNiKs=;
        b=mWe/LVfxwl+z2xgx6eSnAOtTv5ouz9zOLRVm3+2yZ857wWy18B6SzN3GG1V7CpN+tb
         +fbVRvr/Qbs3+ZKScPJOGgxCphkeTh+GfalN3o7D8MD4TnLb+ndpkgLDI//5KdTJSB8r
         3DIGUNsk4EKAtyx9Nxd5UKoxvRADtxavK8Z+lh/kcX8+uyN1oGWwcNy01zYT7Stcljw3
         VXY/Kv2ZR9UZihbmHV75s/IquJ/Lssq5695l8yUubNlygWg8t+iDC6Zol64L2j+1OAMD
         RWpfrkp4e1UhL6AZf2idFLSmcESvOnRJFt+m0+kZH+EgMkdLKbvpZAG4UjtVLxq8SiYk
         SL7A==
X-Forwarded-Encrypted: i=1; AJvYcCUkzntcGArPCir7xDMVD0NJb1cHO9tfC82ppeGQt/VLB6VUr7rZggGS07H4G7UATKlIlb72BsILZ/+d4A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4SLykLliWkEz/eMYYh9wy4s8b+uYXrHbUruOPMyrKv7NiTDQ3
	EOX2tUzRxwpiAZpOyi3O1H1xhcSeU0/KDSl5zHdMQOG0HaDdExrudtXr16uDLecNb6wP45jIJ4F
	ge2t9Jf+V+nI3E2rplhiozOgXLqjy0aDWOKx3LDTUR938Xyhx/+A74xTZhgjs97pUGg==
X-Gm-Gg: ATEYQzxT5HwQdZ3gPpUK1zzfyZrKRmgLMeZ1YkjeiAHw0FhysKAiFURehsT/oNds60i
	qk3Wp3Up6SK7CREpBGuqZqGgjDhV6uJ3py8o8V5dMWGA45qfLIpmijjyPpQhhEvrOed/BU/L/59
	sXJVJAw0kOCmjyU+ux8Yun5G6THsqBSD9NdH7AN/JDcTLMvdRH083fIbbn3jNsPjZHwkVSog+oW
	rynSr0PCIo1ELOTx/4VWq+AY8ruDjd4kKh4CGybWZdGKwtAhe/CzRCg64gF75kW1VmoRP30qnWM
	4PIufZK250DG0Isp3t95tFcsyJPjgbRBQX9hQ0Nzv57pjFjfpFcaxv4LTJsLeT1yrzxiDVXIj2x
	prJvhWabOOREOSWiBRpDpC0qo1XzRVAvwpzOFX5+RejXUsX/Z26rS3A==
X-Received: by 2002:a05:6a00:22d4:b0:82c:e601:3601 with SMTP id d2e1a72fcca58-82ce8ae56d4mr3725115b3a.42.1775042481336;
        Wed, 01 Apr 2026 04:21:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:22d4:b0:82c:e601:3601 with SMTP id d2e1a72fcca58-82ce8ae56d4mr3725063b3a.42.1775042480682;
        Wed, 01 Apr 2026 04:21:20 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.233.247])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82caf97abfesm12659643b3a.1.2026.04.01.04.21.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 04:21:20 -0700 (PDT)
Message-ID: <5e1f6af3-c6d3-936e-70fe-6f7ddd472304@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 16:51:11 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v5 2/5] media: iris: scale MMCX power domain on SM8250
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>, Jonathan Marek <jonathan@marek.ca>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20260209-iris-venus-fix-sm8250-v5-0-0a22365d3585@oss.qualcomm.com>
 <20260209-iris-venus-fix-sm8250-v5-2-0a22365d3585@oss.qualcomm.com>
 <5e2635ac-35de-645b-b5e7-235923f844ce@oss.qualcomm.com>
 <x5gv6dxdum5klzfjyo7xjqull6o43okkmkn7avssg26epbvrz6@z2brpssbk7iv>
 <0b41ee7c-83fe-d604-b750-8a5a0bd62bf8@oss.qualcomm.com>
 <CAPDyKFrO3DzfG0aW4z4w87j_iWM=3dpvp=2Wgr4MX1Bin5-6ZA@mail.gmail.com>
 <6yfn6ux3gbin2dtopdxxv4okinspueryuey5vfdq633gsewc6r@ttp56brnpgvr>
 <CAPDyKFpm7ujNw51dVpPaHCwssjgYe1JVBEyrQ_1CsPbDJuW0Ww@mail.gmail.com>
 <4fiyjcqt5smotudsfzyqrevxxnx3sf5grbgfluzkndbp2od6pq@vlyikcvl3xkb>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <4fiyjcqt5smotudsfzyqrevxxnx3sf5grbgfluzkndbp2od6pq@vlyikcvl3xkb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: HqgYH2jeU4Y2gtFUWFflE_yVgLAlNjQ1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDEwNCBTYWx0ZWRfX8BO3tPFJkYc0
 OTaJIRQBllR61dyJQ3NAgmtYQ0xBgqOro8F4gYCbe1cgyQ6qmBpFa9vAITrs7XufD3Znhcj3qP/
 GtyxqfcXQmLzmAN2+4fMfHPhrxal/M8WA5Qp0ttYOg3Aboh7M1XSqIzrX/yB7anKI/rpYGsCj0R
 XZ7HC/jGfamQZqs/D5AlOzcTKo/nr1yGy9c6w9UcGboz6LjOroILj2jqqvVF+D8trlyuUtKIHrc
 6FmxnAriSRhNlM5d+DVUXroPs23ZgiuqdKV0Bcd9qLceYfLXYhoHv/ki7tBnUXuas0XRJ/dh1sn
 v1S9NvdSDUt4EtsCaLDoZsUHpuJZeu68McLkFH1TZCsUmjoSxkT6TCZuGyeO6gZuIp+HQ7jStdP
 WfLVZma0XkI7khXSaPW6yIuoz8FAk0pmq73h4+CTCL+3V4PXsCdsWeKFB1FMPny6AM2Gcpze+Pf
 UyvzbZyb2F0x7KfYpJQ==
X-Proofpoint-ORIG-GUID: HqgYH2jeU4Y2gtFUWFflE_yVgLAlNjQ1
X-Authority-Analysis: v=2.4 cv=PoGergM3 c=1 sm=1 tr=0 ts=69ccffb2 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=5/Y9Gi2N1OwmQbPtUd2E/A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=cwlDSPEQxbFMGEvUi3wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010104
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57863-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A27FA3795C4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/1/2026 4:31 PM, Dmitry Baryshkov wrote:
> On Wed, Apr 01, 2026 at 12:46:01PM +0200, Ulf Hansson wrote:
>> On Tue, 31 Mar 2026 at 20:46, Dmitry Baryshkov
>> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>>
>>> On Tue, Mar 31, 2026 at 01:33:35PM +0200, Ulf Hansson wrote:
>>>> On Mon, 30 Mar 2026 at 15:06, Dikshita Agarwal
>>>> <dikshita.agarwal@oss.qualcomm.com> wrote:
>>>>>
>>>>>
>>>>>
>>>>> On 3/30/2026 4:45 PM, Dmitry Baryshkov wrote:
>>>>>> On Mon, Mar 30, 2026 at 10:55:02AM +0530, Dikshita Agarwal wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 2/9/2026 7:02 AM, Dmitry Baryshkov wrote:
>>>>>>>> On SM8250 most of the video clocks are powered by the MMCX domain, while
>>>>>>>> the PLL is powered on by the MX domain. Extend the driver to support
>>>>>>>> scaling both power domains, while keeping compatibility with the
>>>>>>>> existing DTs, which define only the MX domain.
>>>>>>>>
>>>>>>>> Fixes: 79865252acb6 ("media: iris: enable video driver probe of SM8250 SoC")
>>>>>>>> Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>>>>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>>>>>> ---
>>>>>>>>  drivers/media/platform/qcom/iris/iris_platform_gen1.c | 2 +-
>>>>>>>>  drivers/media/platform/qcom/iris/iris_probe.c         | 7 +++++++
>>>>>>>>  2 files changed, 8 insertions(+), 1 deletion(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
>>>>>>>> index df8e6bf9430e..aa71f7f53ee3 100644
>>>>>>>> --- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
>>>>>>>> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
>>>>>>>> @@ -281,7 +281,7 @@ static const struct bw_info sm8250_bw_table_dec[] = {
>>>>>>>>
>>>>>>>>  static const char * const sm8250_pmdomain_table[] = { "venus", "vcodec0" };
>>>>>>>>
>>>>>>>> -static const char * const sm8250_opp_pd_table[] = { "mx" };
>>>>>>>> +static const char * const sm8250_opp_pd_table[] = { "mx", "mmcx" };
>>>>>>>>
>>>>>>>>  static const struct platform_clk_data sm8250_clk_table[] = {
>>>>>>>>     {IRIS_AXI_CLK,  "iface"        },
>>>>>>>> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
>>>>>>>> index 7b612ad37e4f..74ec81e3d622 100644
>>>>>>>> --- a/drivers/media/platform/qcom/iris/iris_probe.c
>>>>>>>> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
>>>>>>>> @@ -64,6 +64,13 @@ static int iris_init_power_domains(struct iris_core *core)
>>>>>>>>             return ret;
>>>>>>>>
>>>>>>>>     ret =  devm_pm_domain_attach_list(core->dev, &iris_opp_pd_data, &core->opp_pmdomain_tbl);
>>>>>>>> +   /* backwards compatibility for incomplete ABI SM8250 */
>>>>>>>> +   if (ret == -ENODEV &&
>>>>>>>> +       of_device_is_compatible(core->dev->of_node, "qcom,sm8250-venus")) {
>>>>>>>> +           iris_opp_pd_data.num_pd_names--;
>>>>>>>> +           ret = devm_pm_domain_attach_list(core->dev, &iris_opp_pd_data,
>>>>>>>> +                                            &core->opp_pmdomain_tbl);
>>>>>>>> +   }
>>>>>>>>     if (ret < 0)
>>>>>>>>             return ret;
>>>>>>>>
>>>>>>>>
>>>>>>>
>>>>>>> Hitting below compilation error on latest kernel
>>>>>>>
>>>>>>> drivers/media/platform/qcom/iris/iris_probe.c: In function
>>>>>>> ‘iris_init_power_domains’:
>>>>>>> drivers/media/platform/qcom/iris/iris_probe.c:71:46: error: decrement of
>>>>>>> read-only member ‘num_pd_names’
>>>>>>>    71 |                 iris_opp_pd_data.num_pd_names--;
>>>>>>
>>>>>> See commit 7ad7f43e568b ("pmdomain: de-constify fields struct
>>>>>> dev_pm_domain_attach_data")
>>>>
>>>> The intent was for this patch to be part of v7.0-rc1, but I failed
>>>> with my pull-request to Linus.
>>>>
>>>> Instead this will be part of v7.1-rc1, assuming everything goes as expected.
>>>>
>>>> Is it possible to drop/defer these changes until v7.2?
>>>
>>> It would be very sad.
>>
>> Right.
>>
>> Since it's my mistake, let me reconsider. If I rebase my branch and
>> share the necessary commit through an immutable branch that you can
>> pull in. Would that work for you?
> 
> I think that question goes to Vikash, Dikshita, Bryan and linux-media
> maintainers.  Bryan, what is the plan for this patchset? Should Ulf
> rebase the branch? Or is this patchset delayed for some other reasons?

Its good to go, Bryan can comment as he will be raising the PR.

Thanks,
Dikshita
> 

