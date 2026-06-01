Return-Path: <linux-media+bounces-63203-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJGdDKUeHWoeVwkAu9opvQ
	(envelope-from <linux-media+bounces-63203-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 07:54:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 85485619DFE
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 07:54:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 06F02303FF29
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 05:52:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 276DF3382FC;
	Mon,  1 Jun 2026 05:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JgFrh6Yo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S4H7h+Uq"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C457246BCD
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 05:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780293175; cv=none; b=bJsnsRjy0Q3KYyLboHhq4KTvfpc1fPPWbGydaxRs3KE0dEeqoCv6CnJOMwEIg98MEsE/5Op879zjUqQ658MR6nyPGwCqrNlvpJyiiNnYuLXkpIFPvJ26GhjM9TvcpCcOSA4435Lf5bUonhBv/9HwVswHpL426umtjkmOkqazAIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780293175; c=relaxed/simple;
	bh=MfzHraVuLyZV3po/8qGl5n1uLaihs5b0BUqLZYJ2VPQ=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Nz4iWQ8R18kv0vCysOkyylY2TmT1hOnb5tiec09ozEP9uGpwFiH7tiztT4ge2dJovZ/YVGaeyoDBNI/sGhBXEOIKqVzIp7F2c2ABSyoYK+nz2Cq5+niptsCu3/aPDrp9Q5NeIQVHnbriKX2FyV2RjnRq84vckXqHZX2tx3Tm5vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JgFrh6Yo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S4H7h+Uq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64VLJuO62881330
	for <linux-media@vger.kernel.org>; Mon, 1 Jun 2026 05:52:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LcnAs697VrlnzLquQDasRgSAeWnZHSj8hzCAtvsVObU=; b=JgFrh6YoXSyg1qR/
	q/rGizMoQhMhleHR2LlAZiMXkG0G8tkHatnkgxc1DwVFlMFyGiNGrKTTVxBXQG90
	7CHNisjXGNMVYrF3XnVfV+xiSs7sKz1UD6kG8lqZdPs6NIqG7Qgcf+ggk3qSpwtZ
	At7avHrFS7X492LOGN8yl2owh0gHsJqgLLOKW2uOm2F+iMC5bPqhqjceoYKThJ+F
	l3wIOhfYfZmwB/ox9/Q6xBxAjI7oRWBY5mqGkUl9IeXsj0XO5J2DhQROBz3FRaYN
	/Z1GcH6EVJLI+hNCO77OY7XQbhNBb3bdPsc9Pd574JdYUaLym1hQIlayjy8Yh0YL
	uN+Mig==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efs2hdrsx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 01 Jun 2026 05:52:53 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8525f0807aso12684412a12.3
        for <linux-media@vger.kernel.org>; Sun, 31 May 2026 22:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780293173; x=1780897973; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LcnAs697VrlnzLquQDasRgSAeWnZHSj8hzCAtvsVObU=;
        b=S4H7h+UqYB6he4lT8Cyz8PihVnIyS8JIuur3K3ZgBFzQUncP11bZCPBbgWypzFicKQ
         PL4L25tGiR5Yh55GKTcqWV/CP+BWFmjWyB/e/6ADXky1DpYo3yYh10fvrOxe2HrpUiNX
         LAwkqauMaaj3Nrj7okvajJ+s90XwJeH6+WS5ZgcN+yDsMOZt4wtdsb8MY11w3+ymHcGJ
         LCO9BBByvEZWJF6cUsPIrb8EmV9bQFxCoWemQPPuYrmUAo1GAUgzZ5fk2gFJPSMQnrDg
         LFXpEqLoSc+mlMeP48RHoyHjd27Vex11r/KsyzY5MPSJ2iGNl7i9xVFvGcdrENrjHSd+
         AE3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780293173; x=1780897973;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LcnAs697VrlnzLquQDasRgSAeWnZHSj8hzCAtvsVObU=;
        b=Xa6zgYzn04q8YbB9f61vvvrG9WHxH70qSBy1xI/sgYnYN/S8nSGKDoM6KQ8gk86HmM
         7yneio7ZMcQMKgIjopsseIAI1969MmOk8geYEzVVdcKc9y3MiQ1x8rSp17zEDOrOyJQ8
         VRoCFLA+rvzvQcen+C7tQcaBLZREgEG/wzi4hxX1DQKQZ/dU3jbg/49EqzR1TjVSkEgU
         3kWCZWWT0P9cB8HyymtUrDzqI0ztzGatoRQGElhKc+LVm/cVc+k+dAr7Go3Xp16IucgJ
         toVHCehvWwyJfkIc/NpuEezUD+bGNznIJn0aGSz0kJ34YTRWgTNCrmIYJhMZBJRaLysl
         1Lfw==
X-Forwarded-Encrypted: i=1; AFNElJ8OldlsusOJBLFLoYzwybbm+5UaBnUHFLSKDEKJTS233A2r9myW9zg1rsZFieFYtkGf92nqKjz8XNxYiA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6m+GqOcVLWfK+ankM5zBKm1ZflzLMZa6bGyEHNfp5jZIbsroj
	tSY3KQAyndiR3EMxzDfuaEEzNYgJuS/UEoYjHjnWymqQpX42/2o8zugd6RJti2dT0p6EjOZKFP0
	nryK5J5Yn8TFvL2fqXAX/iBV6Nyl4AKfDErMYlOB1H12WeuOPiZImR07w8hDDmXuDmg==
X-Gm-Gg: Acq92OGR7Zpq84t/TG+qUX7cIP98XEykm+lxLvHgYrfJklQxIfuVJs7i0Dc17kLIZKK
	xvte7C4SEIzO1WnSXIWpk4GppJCw2hIMVHCQ6gC5NX7aQovu6wBi5eL0aHjH8MFpQbWt012z+n/
	Qca6Bja8xlpt85u1ivFTBflzocmKuXWqaKzNFr6WVBHSA+QBKboeXZJHJOP5tIT5SOhdWQ2v+Gr
	3UxkK8TdOElXYd5A5WBpfbbOgt146XeH4jl7oqqM35O/ch+R1uERyaO23Y0183NlrRDGBhqFzTH
	Lm+O2RuTzGo7hNrc2oS7HbRASlp7eFKZrhViFJ0Tx3M0FpBhEqIjjlcHtqMlUDaWRvScvQZppEG
	OLBVIexieQTTH7W4lxwJLVnrR7AWbogTYM9kt0Fq7UkPA3aDnArsS4yWAmuTrxxAFz7qtdtMNJt
	MLtXznXp0sYiUTpA52L6Y7j4sDFM0=
X-Received: by 2002:a05:6a00:1485:b0:83e:f208:b0f8 with SMTP id d2e1a72fcca58-84225709021mr9336807b3a.47.1780293172716;
        Sun, 31 May 2026 22:52:52 -0700 (PDT)
X-Received: by 2002:a05:6a00:1485:b0:83e:f208:b0f8 with SMTP id d2e1a72fcca58-84225709021mr9336776b3a.47.1780293172222;
        Sun, 31 May 2026 22:52:52 -0700 (PDT)
Received: from [10.249.20.117] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214ce54b8sm8926009b3a.48.2026.05.31.22.52.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 May 2026 22:52:51 -0700 (PDT)
Message-ID: <e6df389b-cca9-481a-b2b9-5915cd6ff88a@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 13:52:46 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: wangao.wang@oss.qualcomm.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v4 0/6] media: qcom: iris: add support for decoding 10bit
 formats
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20260521-topic-sm8x50-iris-10bit-decoding-v4-0-8ff8fce3f904@linaro.org>
 <fa26f61e-86b6-4612-afae-7726e3b35c4b@oss.qualcomm.com>
 <12102d68-da35-47ea-a972-28cb6d54ce1c@linaro.org>
 <feb42925-5704-4266-8c3f-aa944fdbed28@oss.qualcomm.com>
 <12da2953-fe51-4999-9656-2b42a7897f91@oss.qualcomm.com>
 <c54e7f34-b3a7-47fa-843a-9930de04599e@linaro.org>
 <9148913b-a5cd-4730-beff-6c517ac4818e@oss.qualcomm.com>
 <3baa753a-f716-45da-b1aa-7406f4092578@linaro.org>
 <88f8519f-31d8-47db-b0d1-f1d0d8c9df1f@oss.qualcomm.com>
 <0fb85345-ea8c-4294-bf4b-220617c9f089@linaro.org>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <0fb85345-ea8c-4294-bf4b-220617c9f089@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA1NyBTYWx0ZWRfXxwjUZBHe2FoS
 vkK8vnWJRhi99z4/193cGGuSPROAw1Ym1QJdLwOYITWsG3gRXGo8DEXIGGhatebVS5QFtmcJlkl
 LwtCeVdylbPuxxLoOhgCvj/4gODDC4qxAajoFIzlnrtmDJWhG0YXmoicaO1rUYvBlMuC+h2QRAF
 IKHPnsX5mH/cWyG+7sCEh2l9r88K2RrQPQe02Z7Qdf8U3ZGIm1hQDJs4BkU33ijn7eoIcStNyWW
 1AC7FWGIO3hLt6H90I0yOUHDHOCdtvWl2qFouo2pzQB7MfDvZKeqTIXPz4Ed97H16dKTWMiN4RW
 nXZQ9XMv/3Wg1OjV+gAt66SdBcsUKi9+F20vap+3YsB2j6mb7AyViYdDEwevNnsOeBzWRVdTaDD
 LKV0TCvvJl6BqvHAV7KMLZ61JXl2mhf+04LfzZIzmXdF9QA2zMljbXZnI92h27GJw64/DcDTAYh
 8wBX4XG4ucSn6/N1gqg==
X-Proofpoint-ORIG-GUID: 7K-RIvuUyKHRQHa1WVE4trYhyUhaWZ1s
X-Proofpoint-GUID: 7K-RIvuUyKHRQHa1WVE4trYhyUhaWZ1s
X-Authority-Analysis: v=2.4 cv=UIvt2ify c=1 sm=1 tr=0 ts=6a1d1e35 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=785Dn-WPAAAA:8 a=9Z9kgQCjHYkt6ZcilowA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=b7-gl1MdSEcY02uTy1GE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010057
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-63203-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,larmoire.org:url,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 85485619DFE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 2026/5/29 21:25, Neil Armstrong wrote:
> On 5/29/26 12:33, Wangao Wang wrote:
>>
>>
>> On 2026/5/29 17:55, Neil Armstrong wrote:
>>> Hi,
>>>
>>> On 5/29/26 10:21, Wangao Wang wrote:
>>>>
>>>>
>>>> On 2026/5/28 21:26, Neil Armstrong wrote:
>>>>> Hi Wangao,
>>>>>
>>>>> On 5/27/26 06:15, Wangao Wang wrote:
>>>>>> I tested the v4 patch using the gst command you provided earlier. 
>>>>>> The decoded output still has the previous plane misalignment 
>>>>>> issue, but all frames are decoded successfully. When viewing the 
>>>>>> raw data with an image player at 1920x1080 resolution, the first 
>>>>>> frame looks correct but subsequent frames appear shifted. If 
>>>>>> viewed at 1920x1088 resolution, there are artifacts at the bottom 
>>>>>> of each frame. I've attached the images.
>>>>>>
>>>>>> Also, have you tested the 720p case? I can't get it to run on my end.
>>>>>
>>>>> Thanks for the report but I don't have access to the Purwa platform 
>>>>> you use,
>>>>> I've run test with multiple resolutions with display using P010
>>>>> and QC10, and ran fluster aswell and all passed on SM8550 and SM8650.
>>>>>
>>>>> I'll test it on the Hamoa T14S I have which should be the closest 
>>>>> to purwa,
>>>>> but it uses the same driver setup as SM8550 so I expected it to 
>>>>> work the same.
>>>>>
>>>>> Could you indicate which iris firmware you're using ?
>>>>>
>>>>> Could you try passing the fluster h265 main10 test suite with 
>>>>> gstreamer ?
>>>>>
>>>>> fluster download -c h.265
>>>>> fluster run -d GStreamer-H.265-V4L2 -ts JCT-VC-HEVC_V1 -q -s -j1
>>>>>
>>>>> The picture you send looks like there's a mismatch with the kernel
>>>>> and firmware setup of planes offsets.
>>>>> Could you check if there's a Purwa specific firmware property
>>>>> to set for 10bit decoding ?
>>>>>
>>>>> Neil
>>>>>
>>>>>>
>>>>
>>>> Hi Neil,
>>>>
>>>> I also tested on hamoa, and it has the same issue as purwa. The 
>>>> firmware used on purwa is vpu30_p1_s7.mbn.
>>>>
>>>> This is the result of fluster:
>>>> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WP_MAIN10_B_Toshiba_3 
>>>>       ... Success
>>>> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) 
>>>> WPP_A_ericsson_MAIN10_2       ... Success
>>>> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_A_ericsson_MAIN_2 
>>>>       ... Success
>>>> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) 
>>>> WPP_B_ericsson_MAIN10_2       ... Success
>>>> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_B_ericsson_MAIN_2 
>>>>       ... Success
>>>> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) 
>>>> WPP_C_ericsson_MAIN10_2       ... Success
>>>> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_C_ericsson_MAIN_2 
>>>>       ... Success
>>>> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) 
>>>> WPP_D_ericsson_MAIN10_2       ... Error
>>>> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_D_ericsson_MAIN_2 
>>>>       ... Error
>>>> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) 
>>>> WPP_E_ericsson_MAIN10_2       ... Success
>>>> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_E_ericsson_MAIN_2 
>>>>       ... Success
>>>> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) 
>>>> WPP_F_ericsson_MAIN10_2       ... Success
>>>> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_F_ericsson_MAIN_2 
>>>>       ... Success
>>>>
>>>
>>> Ok so this works fine, so I'm really wondering if your main10 HEVC is 
>>> not properly encoded.
>>>
>>> Could you try playing a well know HEVC main10 files ?
>>>
>>> For example I just tried the 1080p and 4k 10bit files on Hamoa + 
>>> fluster and it just worked as expected:
>>> https://larmoire.org/jellyfish/
>>> https://larmoire.org/jellyfish/media/jellyfish-10-mbps-hd-hevc-10bit.mkv
>>> https://larmoire.org/jellyfish/media/jellyfish-120-mbps-4k-uhd- 
>>> hevc-10bit.mkv
>>>
>>> Neil
>>
>> Could you provide the test commands? I tried both files and the 
>> results from gst still show anomalies, but the results from 
>> iris_test_app are normal. I'm wondering if there are any additional 
>> settings needed on the client side.
>>
>> Here are my test commands:
>> gst-launch-1.0 -v -m filesrc location=jellyfish-10-mbps-hd- 
>> hevc-10bit.mkv ! matroskademux ! h265parse ! v4l2h265dec ! filesink 
>> location=1080P_out.yuv
>> gst-launch-1.0 -v -m filesrc location=jellyfish-120-mbps-4k-uhd- 
>> hevc-10bit.mkv ! matroskademux ! h265parse ! v4l2h265dec ! filesink 
>> location=4K_out.yuv
>>
> 
> If I run those exact commands, I can correctly visualize the files with:
> gst-launch-1.0 -v -m filesrc location=1080P_out.yuv ! rawvideoparse 
> format=p010-10le width=1920 height=1080 frame-size=6266880 ! waylandsink
> gst-launch-1.0 -v -m filesrc location=4K_out.yuv ! rawvideoparse 
> format=p010-10le width=3840 height=2160 frame-size=25067520 ! waylandsink
> 
> I have to use the decoder full aligned buffer size because gst just 
> dumps the whole v4l2 buffer into filesink and frames are not tighly 
> packed together.
> 
> If you want to output tighly packed frames, this worked for me:
> gst-launch-1.0 -v -m filesrc location=jellyfish-10-mbps-hd- 
> hevc-10bit.mkv ! matroskademux ! h265parse ! v4l2h265dec ! rawvideoparse 
> format=p010-10le width=1920 height=1080 frame-size=6266880 ! filesink 
> location=1080P_out.yuv
> gst-launch-1.0 -v -m filesrc location=jellyfish-120-mbps-4k-uhd- 
> hevc-10bit.mkv.1 ! matroskademux ! h265parse ! v4l2h265dec ! 
> rawvideoparse format=p010-10le width=3840 height=2160 frame- 
> size=25067520 ! filesink location=4K_out.yuv
> 
> There's probably a better way I don't know, but in any case gstreamer 
> will only use the "frame-size" portion of each frame and process it.
> 
> For example, you can convert it nv12 and dump to file, it will then dump 
> only the nv12 data:
> gst-launch-1.0 -v -m filesrc location=jellyfish-10-mbps-hd- 
> hevc-10bit.mkv ! matroskademux ! h265parse ! v4l2h265dec ! 
> videoconvert ! video/x-raw, format=NV12 ! filesink location=1080P_out.yuv
> gst-launch-1.0 -v -m filesrc location=1080P_out.yuv ! rawvideoparse 
> format=nv12 width=1920 height=1080 ! waylandsink
> 
> If the plane offset/alignment was wrong, the convert frames would be 
> wrong and playback would also be wrong.
> 
> Neil

Thanks. Using the commands you provided, the output file no longer has 
the previous issues.

-- 
Best Regards,
Wangao


