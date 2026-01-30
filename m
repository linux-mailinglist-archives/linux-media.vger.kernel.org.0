Return-Path: <linux-media+bounces-51846-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HSkGNuwfGmbOQIAu9opvQ
	(envelope-from <linux-media+bounces-51846-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 14:23:39 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FA8BAF51
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 14:23:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0266303DD1E
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 13:20:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EE492DF143;
	Fri, 30 Jan 2026 13:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BYeZBNDG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C8zpEcG0"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2F923EA8E
	for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 13:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769779246; cv=none; b=Ol7NZpqO12FYQbNz2HC60H+uYQNXSZ2/w680kTRKgOJ8mWo3J9ttYGDaV8Jf2EOj36mY7bQcP4Ptfafp3Bjl4D70KC/5tKN/A9cfm/+AFSO/SQzi/oI0fpkpc1nutv/Jq3xPIvPX2cjUGoKOXyCR82UPgX87SuTV8liVMsnzYeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769779246; c=relaxed/simple;
	bh=EaqD6SfOKolG+MO1MDcVF1TeavU1LSwcT9JiQiI5Jdo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NS3rVtG1Ni0RIa9rftyQY8SR29MdzQRzU5iWYcXtHx5bCicAaKIAWFZBFdMY45+oYMvISLfzWTkxkB9bUxtmVI8h6RbN9Zt+xs1jnstwiepRCxHV17cbw4t8KVw6u75uuRo8jCVTqi4aN2wXzF30h3+HOY7HKWpFpTQKuZ/DhcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BYeZBNDG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C8zpEcG0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60UA0TAh486271
	for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 13:20:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ffAKUQYU8hiP0qsEBrR55+wKps5ZZZvi+nuNwqzUIUA=; b=BYeZBNDGlvZVo0GI
	27Laaf8mUI5deFPPV+ossT0Mxt6PlcRvzYO7VxrgyFyCpjHLIWOFnm6ro2Icd52/
	PemwURBFR7Jfi9Xka0aU2VBpNHhx8EsTtEpNoS2cXaYgt2lYuQFBfdKC6ZknlL3A
	4oGE6p9aglAne0/Mp2fWpvLLANl8hNgq1hfWedpOND2wvj1BVNpdePwnc47EWTGi
	gcWIW4LfUhqVl0Qtk3nUDWYe0Ea5HbGlX1Xr8FuKh/a/aX+aZdIaObU0vZAoqx+A
	zA1FcGrPcujh+reiOOV2xWfcX6NPObYWS3mB14tOoEX3k/qyc+v1t6w8HYf/EnO1
	VGh+IA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0gtnj6qf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 13:20:44 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-81f3ed6e935so3419533b3a.3
        for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 05:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769779243; x=1770384043; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ffAKUQYU8hiP0qsEBrR55+wKps5ZZZvi+nuNwqzUIUA=;
        b=C8zpEcG0xPQI8BKBlIiuN4xAsJJZX99bdu8eBFq/dsx8IChenbfuH/4ONlq+oKaNJh
         AbC269I2ticy/s0QPby4B1N8RqngS+52K+OsBYpCNeqkokmqw4Ld2ajiW1RVOW3blKsB
         AzBLZdMhrxFZxvQd9pU8b03jWb/eqy66//7ULppp66+CneAD1uguKFHZndLzs39AYJXh
         xPpBqlLRsPBPgDY47NlEkQpn6MV5aMfQy9YzhbEDnOSvrG2snqsJFoGrsYU5HXqS0Cvb
         sD5ClfmYt2IJXCaBUzYs7hhT5zU3tvxlZSSzj/nbHzdFy2iA7Ub6o7jjCvrksUf9ZMxc
         aPHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769779243; x=1770384043;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ffAKUQYU8hiP0qsEBrR55+wKps5ZZZvi+nuNwqzUIUA=;
        b=EDpXSk8JD8km7trWvbkeMpQPEHXdn3Zj/SfULlyXvIhsE0vjSTbnkA20D+BHBcNy/s
         QCY8xhnqqcmvthnTObhWKsvzsfKfmPskVXi5T2GdxVhZ6CvY+vKDNCS+bbppoBdz2ecR
         eQUz3bqEj9jzi0nSS0JLWkjkk3GEBAmxYq3z+bHGISpqR2bfMCQVHzTAfLW4JEozqg+S
         T9Cvi8Qg5tfIhoV1oi56p9jneqDS8pMgBx8b27VBph3qogD7bSVExb8i2Cqn8NT094GT
         y8Tq7TGSCQ3hZPlbNpoUdDo5X+NTSypHY1PY/09GDR7HrSEjB+bRcrY36j8eYhPw+XTt
         FKMQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+BN+bcOHlj0a8/lZQPLks5Rwi0ctzTdAQJGTBETOJUKQYkyeBaM2IkEilqhnIymJ6zCo50E0mbOvR+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVKFpZvqfYtVEXmL3Jxf8xDHbIj7klV3fBSlssXNu3NCBmQPQ6
	QwGo8tpJUAR9FXgq4z3jClZSaP1QyYF1S+JQOHNAwunViFnG2Bj+WWmD51F4++bxUE+G7IAfFFv
	IC5A8XhzRG9YulrS3Ll8qn+mJOWDOJUlCmnNO7a9kqlB7updJJJdZpHEArnF/nQk94A==
X-Gm-Gg: AZuq6aKxI6AlXDqLITEyRuZqBTAqoJTnwUkvv/bIE2kBsX3rhaSgSsENpbIOch0fB35
	9wMOXjVHCULES/XEQvJl6wPmwnVmFVbN/b7nr+c+C8/itsr5/Av+kUfn4XTJWix14RuAEclOSPQ
	UG6qsZHz2yT2e8sUc473H3DU1Y/t67hU80AfeGl23VAWgca/2VV8V6ZsVrnDh6WJvSsp2pDPMB5
	Ul64QF/JzpXG79Z0uXjfmRrqJzCXTv7oOdCCsMNnjcQUPeAnMKvFjwHnmPbm6tZzByImrm9PlpH
	R0xZ87gsNG5+8rN9ac32kqACMMVCeFZM2wisl8TO/+jZBqIgdEFwEmfJKMpHGhGiEJ4DC2grjDj
	tg+sUwUb4W1DMUPdQC529k/gXJSuCpBhKSMbF4/E=
X-Received: by 2002:a05:6a00:3e02:b0:81f:57a1:68f with SMTP id d2e1a72fcca58-823ab72de5emr3410088b3a.47.1769779243251;
        Fri, 30 Jan 2026 05:20:43 -0800 (PST)
X-Received: by 2002:a05:6a00:3e02:b0:81f:57a1:68f with SMTP id d2e1a72fcca58-823ab72de5emr3410052b3a.47.1769779242631;
        Fri, 30 Jan 2026 05:20:42 -0800 (PST)
Received: from [10.0.0.3] ([106.222.235.0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379c21112sm8127449b3a.54.2026.01.30.05.20.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 05:20:42 -0800 (PST)
Message-ID: <1204a2a4-18bb-f43b-6974-a19d238ff74b@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 18:50:35 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 2/7] media: iris: introduce SM8350 and SC8280XP support
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>
References: <20260125-iris-sc8280xp-v3-0-d21861a9ea33@oss.qualcomm.com>
 <20260125-iris-sc8280xp-v3-2-d21861a9ea33@oss.qualcomm.com>
 <b9fb16db-8a16-420c-bb55-850c39301f1d@oss.qualcomm.com>
 <kffcydlqdhkm5q7lip522isb7toa4jtmnzjvmctpsv5pc2ozat@o2laeofbthwc>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <kffcydlqdhkm5q7lip522isb7toa4jtmnzjvmctpsv5pc2ozat@o2laeofbthwc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 8H5SI6eH9fbHwyCuZM3GU65u_zj9tk2q
X-Authority-Analysis: v=2.4 cv=FPcWBuos c=1 sm=1 tr=0 ts=697cb02c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=6cH4IgXjao/mkWo6W7aGpA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=i3vytz1KKoUbyb35L_EA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 8H5SI6eH9fbHwyCuZM3GU65u_zj9tk2q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDEwOSBTYWx0ZWRfX156hIeu3tIa7
 tH2utUXSwDpt2HutATi1U2wAnKtL4kDYBNzOQpSDZ1RViP8A+bQtaWUm8vxsVzR1yifi+RYNIs0
 m61LlF3YKZGvQA1vJGqa82Na8GLwFUajdzBaBv5Tn68BEyMqCSKLf0rUJ4t19v4HKJKjvhb55kE
 MGwIza936L1CxsuN2N8g2Ww2YxQjI6+ZXFYoIm0A5kyULl5KQelnV0D6uO2tZKKdySY3yMad1mt
 ROHWFz+yZu7TS4BFkkbZj+VHcydnLjnYL/OpVygjcPk7mtV5urBQnfuKFrXkhIUUtPerxZx60n/
 QdmQTGWnUHp/Xz+QIFA9k3yPIC81OSqhF9ajh6F/HXrjZsIPM01E4j+S9y3pAf19E7YHvNeNdde
 YfRw4cvEr8EfyOzSMaAx5zXkdQBhh789+nXwUfgCiRDTEXp+5pxwuRZc2nEK+HXKyL3SCZ37Zt1
 3oK/6Cn0lraRSgGB4Ag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300109
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51846-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B8FA8BAF51
X-Rspamd-Action: no action



On 1/26/2026 4:25 PM, Dmitry Baryshkov wrote:
> On Mon, Jan 26, 2026 at 10:50:56AM +0100, Konrad Dybcio wrote:
>> On 1/25/26 4:32 PM, Dmitry Baryshkov wrote:
>>> SM8350 and SC8280XP have an updated version of the Iris2 core also
>>> present on the SM8250 and SC7280 platforms. Add necessary platform data
>>> to utilize the core on those two platforms.
>>>
>>> The iris_platform_gen1.c is now compiled unconditionally, even if Venus
>>> driver is enabled, but SM8250 and SC7280 are still disabled in
>>> iris_dt_match.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> +static void iris_set_sm8350_preset_registers(struct iris_core *core)
>>> +{
>>> +	u32 val;
>>> +
>>> +	val = readl(core->reg_base + 0xb0088);
>>> +	val &= ~0x11;
>>> +	writel(val, core->reg_base + 0xb0088);
>>
>> Can we "open-source" what this write does?
> 
> I'd leave this question to Vikash. Hopefully he can comment if I can
> open these bits or not.

This register controls the clock halt states for several IRIS sub‑cores.
A bit value of 1 halts the clock, and 0 enables it.
During power‑on, we clear bits 0 and 4 to unhalt/enable the corresponding
core clocks.

Thanks,
Dikshita
> 

