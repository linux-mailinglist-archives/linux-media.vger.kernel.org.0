Return-Path: <linux-media+bounces-50870-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2B4D305F5
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 12:28:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 436223007651
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 11:28:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99581374193;
	Fri, 16 Jan 2026 11:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G65dgMtl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DKZPwTkY"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B24936D510
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 11:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768562888; cv=none; b=gVVpcVtiit/IDcS1q8RHQjGMEN9ZBzZcHhwkhq405vCKFaCroiR+gAFkFYUTVc/t3UnHYGud81rv9SZJhdu0cpDNwRyuRI0t4qDcBB1zrHNz75ZxHMy4QTtjb54J4aDERzhHviWitE6ZkVjFhcZGsCak2GUIuJdK5cQ9j944pMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768562888; c=relaxed/simple;
	bh=0utBFb8mqa8Nlq+uIrOaYId6hVjNADQWomDlQChWteI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D0dPp3tAL48frtspDLTaxLnZQ/eyl8zh4NpXMgvQ24wtboYz83ktBKTFLIK7MTqILz2BAjai+gm0wpPpL4x+8cOHKWFEpUZHbRKWxbhs/gyoMTm/g8u4XFcron6SwxL6VqqbYiIAFZZJm2jAr7/sHhLNMnD7ZDiPTr9YA5fz+kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G65dgMtl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DKZPwTkY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G8MMtl3892921
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 11:28:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rqT8MD/WUeSfxRuizcbAkisgMvVNCMar3GwucXQStqE=; b=G65dgMtlpKJjzoMr
	sb2EwBgroIGgvbcR0G6WoOWrPrDY5+1I7lIbFWUf4pLbgLLkCS7gCYLJH9l3+Bx8
	gF3gdpQX5ALCv4B2CUtRqfcEjt4EtfWvnVFIBjfU7cRstmTx1UVytC1t+9n2ft/q
	zMuFUYTsFz67z34rUfxpGtvbW3xhpC1rclX8Xy6CKUZQfXpoMSDoh9VsVuv0XR33
	zUw3glwxFesp6biDYgdVnLzl7KoWYzpzNIgkDgDOjHV0ZDtge4sjW277d8SIdlE4
	QnKrhr/ZcPC8tSbghsFGDL5QTu8sFevWz0qDzSzKofVW1plIy82lgxujtLJdfL2n
	gGQ+5w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq9b09xgm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 11:28:02 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0c495fc7aso19441835ad.3
        for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 03:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768562882; x=1769167682; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rqT8MD/WUeSfxRuizcbAkisgMvVNCMar3GwucXQStqE=;
        b=DKZPwTkYB/BumA/z3eVn1GA8IWkxwKZ7iehhBf45RnnTUBjajI8sZyzTsSSM3JTGzB
         85zKlRHmLYnQKgIghU8OxGy8DoO8y6GQZx3jAkIUl04KN9+1xjdAiZ4O7lyZQEQZ5mJU
         VFFYVEk5W3ZvoukYeTxomJUY8YdJcM5xOWP2Q7AHALPWKlD1secvHq0CQj+GQjON3cfY
         qd8GYWoxyLTp1SSKiQlQd4F6D6Ecx+Mi84rd6616xntMFDMSOZUk9ueBiemfm2UJK6CP
         UIjkeHg8M5CrZwZGoVhTvg9qtQlDBkARIiO/SHt44HFRR+jB6UzPToo6wrmNgvZoqrDF
         z/tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768562882; x=1769167682;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rqT8MD/WUeSfxRuizcbAkisgMvVNCMar3GwucXQStqE=;
        b=kpO+Ru2JfxCnUOiIpb4x0/xMsFBsnMjfsPf7dKrqC41sCxaJApvK5SsvhJeIK8VRt6
         ByWdsTiIVg+7GKl+JkoTEwFSMSIZwusEalN8ohAjJ0I0I88pLQ2ubCCGadfPDVYPyogg
         FApRlk0NZz0i7wc2osb6fSeq+kQI6aqem5M4+23E6r4S6MxuJRn6WN8g1tMhLVGQSD1M
         xaxsYWZNzUxWdrFVIYiNabfsjpyd1DnSwqoHcYdZ4ioBKakeHIyRy2CfD/aRehrYtYck
         Grxm4QYGUIa336AhY6UqHd5iSGA9Qcd+Vd09hy7NCDa/SPjsYOK5/CE0QxkHXpHcq/UE
         2h+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUu8VCmrD2hmXXGfd6zwkaMsBZAwEetUqhe/LmT/bvDgA+0y3z1CEgseV75n8B62d/q0aVat73XsQixGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyB0dWxJ7autGkYGA3zS4fZBgC+DBgixxgeEf0DSloQuX9iwk+2
	p2INEQiFJ8uFNb/RA9B1Y2R+53SEXIFCVkPUfvx9Lw6mQ/gX5Le6QL1k3KqXFk+Uag5tR3x3ajY
	+rQuYOcYf/PCaFc9nlMjhHydkcfpqWQjSaEMPLiw/tdGnCD0DwcYOu+S2fzm5V++rOg==
X-Gm-Gg: AY/fxX6+bx/b8W8a+5mcQH3Uo7PJEQumY5MRFAhInRNIlonHixVsL+6WJRRySx1flhs
	t3qv4FF5ScxaNDewLcC/LGesCDHFngbn+BZFdg9eL6bC/hzFR7Jkg3vbiVkEmlI0/Lm2gT+LLyF
	J6cdioZm0jN6Ef2/KDhPIwMmRDZpP/TNRFBH+m4NfODTN64Ar0cBPNUzpj5PoKEnDrHPfWnPiqM
	r6Pc2734NBzlQbvc/LEpt+YHmt/H8tOmSU2lq7Xp20/zx2ch3tq6pxNeVrkRUCfNR1hVmscZ7vp
	OGDyx946X1u85/VPBB0VuCQ9RZK0GaBfjnPLkrMFcD4Gxl/GSabAXom600iLxNPybflBBE6k14n
	+wFKu24vzaO4n571gT2zxiCppTlpJpS8/VI1ysXuujn8=
X-Received: by 2002:a17:903:2ed0:b0:2a3:ee53:d201 with SMTP id d9443c01a7336-2a7174f8e23mr25051345ad.12.1768562881829;
        Fri, 16 Jan 2026 03:28:01 -0800 (PST)
X-Received: by 2002:a17:903:2ed0:b0:2a3:ee53:d201 with SMTP id d9443c01a7336-2a7174f8e23mr25051195ad.12.1768562881362;
        Fri, 16 Jan 2026 03:28:01 -0800 (PST)
Received: from [10.204.101.164] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190aa5besm19506575ad.15.2026.01.16.03.27.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 03:28:00 -0800 (PST)
Message-ID: <035e9f34-f28f-47fd-ac36-6277171b0e28@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 16:57:55 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] media: iris: Introduce vpu ops for vpu4 with
 necessary hooks
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
References: <20251210-knp_video-v4-0-8d11d840358a@oss.qualcomm.com>
 <20251210-knp_video-v4-6-8d11d840358a@oss.qualcomm.com>
 <54b29b03-4166-60d9-d553-d0e655749da4@oss.qualcomm.com>
 <98481299-4db3-41f3-a974-d9d0075d92e0@kernel.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <98481299-4db3-41f3-a974-d9d0075d92e0@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vd8vcn6R-cTRVLuAIQMUwv6rHY8T-HrS
X-Proofpoint-ORIG-GUID: vd8vcn6R-cTRVLuAIQMUwv6rHY8T-HrS
X-Authority-Analysis: v=2.4 cv=TcmbdBQh c=1 sm=1 tr=0 ts=696a20c2 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=StH3JvDaWCOc6R5yz7oA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA4MiBTYWx0ZWRfX9PclCvE1xR6R
 pBzc/I0WzET1pvP8nxjgD8UTw9AMoYsRIj+s4dqot/NGyg+uOppWwQT76I+4E9NR157Bt7zOiFd
 qRk9LXcVwbm8efzmemrcs84sNsAsZ2BKzr13MuES2FFomM6ITiqAUuPMGox8TEhY7jIEFgqbUfT
 jg9bizEeHMDmTq6DNgC4iPae/Z+EEdwnWM7gvVZvAya31pGabW7mGH3pehsu+YIr0GakTpCzlxV
 GN25kz5dxQLJbgvolWa8iZ4RV9NjufNh0NAOfqND/zsBO39QGR9RZldpqAOHIx8IbXnBVM7CBBj
 XyHJyBid1Tw/P/xliPQK7Rx6qZlMjLif5EpuJCcaTfTkEawtpVjxkR0y+wdFzmYZSwjg0oCq73B
 B0XRRFatB3tJv3Ml7PxpZaJkqNRPs+kUGVBQhwn/JwvmCfVCBTH57RIELLlSGwrwtzVhoECm/sH
 94JIakJlyCzE0BJgFsQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160082


On 1/16/2026 4:16 PM, Krzysztof Kozlowski wrote:
> On 16/01/2026 10:51, Dikshita Agarwal wrote:
>>
>>
>> On 12/10/2025 6:06 PM, Vikash Garodia wrote:
>>> Add power sequence for vpu4 by reusing from previous generation wherever
>>> possible. Hook up vpu4 op with vpu4 specific implemtation or resue from
>>> earlier generation wherever feasible, like clock calculation in this
>>> case.
>>>
>>> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>> ---
>>>   drivers/media/platform/qcom/iris/Makefile          |   1 +
>>>   .../platform/qcom/iris/iris_platform_common.h      |   7 +
>>>   drivers/media/platform/qcom/iris/iris_vpu4x.c      | 369 +++++++++++++++++++++
>>>   drivers/media/platform/qcom/iris/iris_vpu_common.h |   1 +
>>>   4 files changed, 378 insertions(+)
>>>
>>
>> Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> 
> 
> Thank you for reviewing this code. I would like to point that it took
> one month for Qualcomm to review this Qualcomm patch and in the same
> time Vikash is sending emails (more than one!) that Bryan does not
> review that fast as expected.

Firstly, the ask to Bryan have been to pull patches (not stressed on 
review part), infact, even fixes are waiting for merge window while they 
can easily go into RCs. This part of the process need some improvement.

I have also appreciated him when he pulled long series for initial codec 
enablement, i think you missed those part.

> 
> I do not find it acceptable approach to harass community reviewers that
> way. Even if you do it internally, not on the lists.
> 
> I think this review timeline is final argument for Vikash to stop
> pushing such narratives and complains, because your review is expected
> to be BEFORE the maintainer upper in the upstream flow.

My understanding is that, if maintainer raise patches, then its more of 
reviews from community and having RB tag from any of community member or 
no open comments implies the series is good to go.

This series is lying there for a month without any open comment, there 
is nothing pending here to pull them.

Regards,
Vikash
> 
> Best regards,
> Krzysztof


