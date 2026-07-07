Return-Path: <linux-media+bounces-66863-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 95f0CJsXTWreuwEAu9opvQ
	(envelope-from <linux-media+bounces-66863-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 17:13:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C7471D1CA
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 17:13:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="A/TwjlHq";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hcKUjerc;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66863-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66863-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4404130E3F05
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 15:01:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DEC7367B90;
	Tue,  7 Jul 2026 15:01:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D450D37266E
	for <linux-media@vger.kernel.org>; Tue,  7 Jul 2026 15:01:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783436473; cv=none; b=DYCFJc4+IE5tZbdBxcqz/3MV8eitY3jfParXIQ0wbqhRx0cMpXF8t667TPv5ZXS4ZOEADJQapxJ0kVOzM/eIyH9G0EzaeIhp3bRL9D4jFLdG7YnXZaaZIJJTd3F5dh7yNp009RkDr6PyaPDE9GC86vcemQCxdFHt6yWq9b7rCm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783436473; c=relaxed/simple;
	bh=+D/GGUvcOsimqDxyfbKlcMTFoXoX4b6/62l9AGfFEj0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pO6y3R10VEFRKFEy3ivqg//7yaunD2em0XXNOizAjo1sP15b4LlY6pdWAJkpmwbN9BN2a1WqeoWDzaqH08Gt/atkp8rYgEUSi0zHRipMRkGmNGzxYrVY1s3lwKgui5OTIFvymPeQrbxQ7F5xqsDXBL+MG6xxyuDRzuRPalM4xho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A/TwjlHq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hcKUjerc; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C8tho3542115
	for <linux-media@vger.kernel.org>; Tue, 7 Jul 2026 15:01:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ROX+UpJqvFR7fE/ZOEkvXIlyQXppUvkxvyHyF/TuUNk=; b=A/TwjlHq75KU/ZfW
	CEJVy/6uAXqhErvWZQH3r7SMvWy/EOLUEFWmmM/iNaNS9FsGg9UMPWtI442kAMJ2
	coSYWWVmTC4sdigS9xM4kr9hNfQjo8rkNJnja5XeIw5haUZc9pUI/HkBICOUW8mj
	5gZt4m/yLpTgZLgEh8BL4FOe9P33CUuZwPHv+xJMkAd5e7niKHo/oXm71RiqMqXb
	sMJbq0c37+cOidroAvWFNDmmAYbteU4b6E5b08bgVK7rkehwTHNzc9ov2Kuq1WL4
	viesWAegCBvxaSSrpU4AS8X5ZI+N1TA0VspkJRvvs5x8oObkzcyujjjlO3rRpGMx
	Q1AvIg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8su72kc1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 15:01:11 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8478d2bea7cso904886b3a.1
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 08:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783436470; x=1784041270; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ROX+UpJqvFR7fE/ZOEkvXIlyQXppUvkxvyHyF/TuUNk=;
        b=hcKUjerchCBhwZZK/MboygP9MVi7bAJyw42VPt+JJo2cPzzVKRKPaBRLZKZAAzUqsy
         l9MxRnfSW7CXUPoVgfK3+AfFdkbx4Rlm2cZnqt2ol4eeH8yjMXDg6fRFi6/ZqtuEfGW0
         7GIGkwH4bHKW/ZfhK2h00222bkdYB2t/UEa1RBO5cuw5JYSdWMwCcHIXsb9Lr/ask+nt
         h+EWFWqfWDtjKsFIJB4XYdAkCj2lT0+MdFkt1F/ldngZgtKluN+geFY8RDR5dikApKIu
         1U6i+oLAGvUDw5U5Q1c9k63dWdcXKyVgwz5ywUA88w1RUlZ/5Wsg5h6w8WrQ1Ws6nh9C
         CJmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783436470; x=1784041270;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ROX+UpJqvFR7fE/ZOEkvXIlyQXppUvkxvyHyF/TuUNk=;
        b=n5/RPBjjneSR6w/e18hY0erZbAxHYy02SN87uHkGWa4Ya/+JbVLjow9LijEFi+Cv5D
         y+AB7ehSwc+CtJiFMH4DkET4BFfBYvDvIQKWyN5Q7eUAgCQgXyy1vf1HVy7pFnh4g/Ti
         yWfXG1npdW5ikbJuhs2SnpIdFy80s+K2gcauBeFzhGXaeL82MOkZ+Ls4iW5IDwDkCv7n
         B4SSrei5XR8GGp9e0GtNNX5e9bvn4e7Cepj1USSYs8/DsU73dfRYa9lBsgZQNZ98rnq9
         4OzdaLTlwkdyoqJSfN1LVpcmcpj8cUWl8IJ6XbLUzvm8Wgj/M1KG2GxAr/tUT0EPCEaU
         RpMw==
X-Forwarded-Encrypted: i=1; AHgh+Rp/KXjB1PWew9PqkMd3tX/nIwoGC2oKO9NQGmsbaqYiJbryn/CwMcURskBh7DOyimBdAOBpG+1VnbxcCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCn1An0Ke9D42dT84cCCZjcTJyzM9Wl33jAnJz4o4VeCm0G/1X
	okF3pZDG45B4Yzq6gya3fD7IiAKCYWayx0fKsh2zkAsJPUlnxwz5oZpaMWbbTw7yzRFf2rdUER4
	GVuhubyCeGI4iVK0y6gXbDDEx4UZ0oReWxzwkulrF7DZeENvZu/KGXwo/c6IEQDFBDg==
X-Gm-Gg: AfdE7cmbgQLg4dBTv75AVZkkvNivMACs9Ur7AWWfRak57O/pIRIHqkydddCmU5mo+Cd
	RHc0N5kmhff3vVnJS+kIOorhEc6/V6MDlpGQ/7Q6L/GO/5u2zyHSBbozU8mKmSRSS+EUARzPeOo
	s2zpsd+cRvQ+IxTnqFLaa+2JaemHCFsoCtMlJxJne38VhL22GRXKwggSy7eDJTrzpY2SeuY7Unk
	y+fMOib8oUIW42mxvVQQGVogWkZ2GsVRTPnR7sFvlbfKgJLtEwSV/tRsfCIqNvLygPUPyfi76OC
	hyBotUGSJ7xJgnwGTsIJSwi8FSJjzCQm8s8Jbl2nSikVwsfNCO7m1rVeAZ7uqH0Tf/7h2+gH3dG
	NHjJ8W2uvt1hDC0wxovHUIqcPIvb9ltystKzo4hpaqO7d
X-Received: by 2002:a05:6a20:6a0b:b0:3bf:a8fa:a7b1 with SMTP id adf61e73a8af0-3c09b48c10cmr3970603637.37.1783436469186;
        Tue, 07 Jul 2026 08:01:09 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a0b:b0:3bf:a8fa:a7b1 with SMTP id adf61e73a8af0-3c09b48c10cmr3970553637.37.1783436468698;
        Tue, 07 Jul 2026 08:01:08 -0700 (PDT)
Received: from [10.204.101.214] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b6593c9a1sm10749401c88.2.2026.07.07.08.01.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 08:01:07 -0700 (PDT)
Message-ID: <ccc65b99-9045-438c-a4b3-2d3577f281b5@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 20:30:59 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/16] media: iris: Introduce buffer size calculations
 for AR50LT
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue
 <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
 <20260616-iris-ar50lt-v5-13-583b42770b6a@oss.qualcomm.com>
 <09f6f0bd-6bde-4dbf-9be7-623c17232b16@oss.qualcomm.com>
 <jzqblo74y775tml2zwj6lfwcij635wkjivegfccx7peg4m6gne@cgu2leollht3>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <jzqblo74y775tml2zwj6lfwcij635wkjivegfccx7peg4m6gne@cgu2leollht3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE0NyBTYWx0ZWRfXz13cWEzu1xTr
 Lf2BN999ANhNvDWmdMphAuCS1pCTI88RDh0+FYrsCTbk9PbHnYhfC4VMSYXmKyj2fIMaQ6eZIQu
 W9N+DqqlR2g9tUcaWxBwlIPW4ihOYif4MsQbt4u2uIIASQYLG7dIrcyuDQs3kBecBlQfNmN73xa
 ZH3Id1VakDyLwZZqeDbxjb4tuG+MSdlzgoUxLAlD7A5arvfFKI5lSZOenm99ombqqOAv0N8Q1mJ
 sWmBd+8KvZva/2BlHSYfz08PnKePF3Lv8bVz/VtbxBvoCdCUmS4sPi/YhR3oTUiLrNF2B3T0AN5
 WxqH38nd1vy4qP7ZIN8NjGLVcJEr+7rVrZfIuE+0YJa3vUFZysCQoAutvzjNyGY/1U5YElyIBuO
 QuXy46Nc7iFXOYFxGiQaT/MJm9pQ8kczKTQEcZKWswgnTMqLrDfj99ZPRXh+Q6v4ZY5WiwqE+MB
 FsKzq3bHwr6c2QT/kIA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE0NyBTYWx0ZWRfX0QQrUrkbY54Q
 b1Z+CKQ5Ss+5VwQzZ6Gleauj/BVs1XtHz5X7iz4ZXd5YSx7gSBRqsrYBRmzSFCvqPmlC3Su2y8Q
 kfSHuwJIiUBtr3925t+edZwwWyzTUhU=
X-Proofpoint-GUID: qHUSqpaSpKuJx36JfrlPiK5njeziS9FE
X-Proofpoint-ORIG-GUID: qHUSqpaSpKuJx36JfrlPiK5njeziS9FE
X-Authority-Analysis: v=2.4 cv=HN7z0Itv c=1 sm=1 tr=0 ts=6a4d14b7 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=FtO3_dRub200-A8TgkkA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070147
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66863-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C1C7471D1CA



On 7/1/2026 7:19 PM, Dmitry Baryshkov wrote:
> On Wed, Jun 24, 2026 at 08:40:02PM +0530, Vikash Garodia wrote:
>>
>>
>> On 6/16/2026 5:34 AM, Dmitry Baryshkov wrote:
>>> From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>>>
>>> Introduces AR50LT  buffer size calculation for both encoder and
>>> decoder. Reuse the buffer size calculation which are common, while
>>> adding the AR50LT specific ones separately.
>>>
>>> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>>    drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 401 +++++++++++++++++++++
>>>    drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  37 ++
>>>    2 files changed, 438 insertions(+)
>>>
>>> @@ -507,6 +734,13 @@ u32 hfi_buffer_line_vp9d(u32 frame_width, u32 frame_height, u32 _yuv_bufcount_mi
>>>    	return _lb_size + vpss_lb_size + 4096;
>>>    }
>>> +static inline
>>> +u32 hfi_buffer_line_vp9d_ar50lt(u32 frame_width, u32 frame_height, u32 _yuv_bufcount_min,
>>> +				bool is_opb, u32 num_vpp_pipes)
>>> +{
>>> +	return hfi_ar50lt_vp9d_lb_size(frame_width, frame_height, num_vpp_pipes);
>>
>> pls keep same name across like "hfi_buffer_line_vp9d_ar50lt" and
>> "hfi_ar50lt_vp9d_lb_size" or combine these 2 apis, as the one just calls the
>> other.
> 
> I think, Sashiko pointout a different issue here. Should I be calling
> size_vpss_lb() to take is_opb into account?

The comment is generalizing the ar50 with other iris variants, we dont 
need that for AR50LT variants.

> 
>>
>>> +}
>>> +
>>>    static u32 hfi_buffer_line_h264d(u32 frame_width, u32 frame_height,
>>>    				 bool is_opb, u32 num_vpp_pipes)
>>>    {
> 

Regards,
Vikash

