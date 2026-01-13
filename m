Return-Path: <linux-media+bounces-50504-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A8952D16D8B
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 07:31:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D903330248AF
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 06:30:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E15E26B2DA;
	Tue, 13 Jan 2026 06:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OV2sO88P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fxRU/RA4"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294F034FF77
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 06:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768285802; cv=none; b=A60+2oXsk6KZPz3RlPE7hxLrFRnBOxtnvVA21jDjVomgjFMkBMbNoAS9jJ8aKAPTkCSl3F3zY5bSt/GEXwDIY4yJ8KR/2lIq3Om7S2ANXaYGkyIL8CruVtaYyrWVpOo3kTrz2JeIlkWIcGQHQ50B/On98cgftepuvwZ42h59ypY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768285802; c=relaxed/simple;
	bh=Mx6pTFExw8gPMHpw53t0HCwZdh8m0w0yz/ltsxN5P3I=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=jun2Zzlw15H5lR8tn5Yy9M1/EgWZWkI92yW7vRsuNLxO6RkfQTMjWuKyn1sroINjz8qyXzwmSfmna66hwNHuIEp/eE5hkM0+1/X9IqN72gzGAkUrFDC0i2NHXz4uxufSvECGw9bYNUbniuMdE51q9CaMVtXGgmorxp1bZ26AU+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OV2sO88P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fxRU/RA4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D536iO2865791
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 06:29:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h3NBjLlMfndRt5hEY4bT8LlLMaIoupH7i0xqwnrQSeo=; b=OV2sO88PPE1+/1TT
	Eu9sdUlzbZ5Lz8bZop59ngmW0790VoPrWx26KGP5NVm4yOaWWioExZziaugTf5la
	K0DzLS4ujNxKvLLYQVDJGDEwuM6cJ0UHXUmrHogB86nKUNjpemPDBbH7FqxQTnYP
	rI0KJljGuctqySJHWxdNjDRIUNFoSKcfFD20Vv8yZsq8Bit2Mxm8eL+M7/0APa1Z
	t9SqXEPTGaAD8w3FzTz8u5n3GzchgR9ib0stfutxpD0nsb+xOu+1VdNXbiNlV6l5
	wSWv985pej34Ykkgm20ZEfnE0QDkxbyT2coRZ1A8/7KHvSKTE66YsbIfd8HFrE6E
	UXw7jg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnfjh87n9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 06:29:59 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a08cbeb87eso81646365ad.3
        for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 22:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768285798; x=1768890598; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h3NBjLlMfndRt5hEY4bT8LlLMaIoupH7i0xqwnrQSeo=;
        b=fxRU/RA4RjyVbBBs/2N5VggUmdLOjtdn3vHE6jcx10KJeP4D6nUgjyrZNPCmNQpseZ
         1D4+nNd/zmGN7Nb/i4HqJI/Drd7zFQb6wEiucrn/pVJgZMuWMiC+OS8GiGRpURYak+TC
         sVXuSl7SihUWtlfeCdmYD+/O2PgbfQbeSEQkqwtp6eiRFuJmdB6fHihCxuB/TGZMcyb9
         i3cp/aP5934n6eR8FL2FKIqhOYQ51m7m0FsRjzAHCdu0wKRtp7WUyMHjfuozTntEOJ1m
         vuLEv/XRd5rQ+pXXMUWN+RzI6kuu0cIWRhgQecDfeosCtVQmBOIihvyDbPaa6NYTM2Bs
         +ltA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768285798; x=1768890598;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h3NBjLlMfndRt5hEY4bT8LlLMaIoupH7i0xqwnrQSeo=;
        b=Kn+71qWBYEf1SmZQJ1y1aPvjFK6eLYAYbn8w7mjOXqqfzyrJV4YCoP2UkgJm+K9NRj
         JbHweWoqHKKtfGi/UK59V2yVc5YyF6UA+rRscG7VPospP00cOzSXXBPY8DR7RL46M81e
         dI2fpJQtlIW7lHQP6FCl6XNNCWakGWQYQmL3JvqqwsRTw2iAtIRw18KNms2Z+Ejp9uFo
         EnmPjwOB4zfSFvF31RbfOJckdy9/EfwmDJhuogctFk26CgbBVFGUHAtS8NV8Wabil4z2
         NsJdJ5q6T1wkFN1ncsJoUS+iG2uwrhkeRFnb1zwtLMUoAgX1LTpf9xboZWbyKRnzHJmO
         nruA==
X-Forwarded-Encrypted: i=1; AJvYcCVH4dI438bAowhG7iytJvAgd79Yq1TyJ0wZ8TLcGaEh/FzFUcFFdVFcWH74s0BY83iuwsp6U78zxtLIwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5J2pTaq09S48szPPCJa0xoFI1I6YDvaw3f7TtEw5+nVwCIeOv
	0IquR5eHjXiTFnaRtjp15aCZvI44lb2SdxDmMZPtiV/lim3WsBoJczexoDy/EULz2gyAVvMEAW7
	P5q3TBBhEZEKMQi+Z433Dh/baaT12ieS/NUAENjiBRewrfstJbCBoIkwc5psN6I7Umw==
X-Gm-Gg: AY/fxX4dqO5sEPBHxNejB/J8EG/5G6jFJWHwazvIf4GLG6mVBz/klHURuHFoynJ1wAG
	jeRd36J47vWEvnZkbdUXlgQ3dGyOJQ8LKKKyqspbjpXbPdYxEL1hkZaqRSEgbIdd/yKL4d359R6
	Hs5Lswxlrqs6xOnkmRgXHcD6JzmSjiI+7oxRvwTmXdmhi8WNPc+KIzUdK7lb0twLji5sNYHPMkF
	73q/9uK5VSWPClz77rSc/D5+AbdlKI4tH/G2RhVK/yTvPKvBNiwkyOgZEP6015+9YoI1FigyGwk
	Zp0XQuCaz1/DHnbDWU2EpJIIDqUXtebjZCzBEWeEZMMjkSthA3EdDSx6PCBhv/RE0GuThPNsytP
	x7VoBygE56omBI0lKcxBvN4ni0VROYQDqfDkHmXusfOjZQkwt/9y+ijHWtDvPT4XrYfgCEIZ9vS
	D0eUbF
X-Received: by 2002:a05:6a20:72a4:b0:341:6c8a:5218 with SMTP id adf61e73a8af0-3898f97adadmr17512450637.56.1768285798366;
        Mon, 12 Jan 2026 22:29:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHULNdwss15gu8iav6LwsrUNMVjCIONxFLkfJPwDS8zIEGbfiN5Tlvq4p7jMDjhVJQCaith1Q==
X-Received: by 2002:a05:6a20:72a4:b0:341:6c8a:5218 with SMTP id adf61e73a8af0-3898f97adadmr17512421637.56.1768285797895;
        Mon, 12 Jan 2026 22:29:57 -0800 (PST)
Received: from [10.249.19.160] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81dc51581e0sm11438486b3a.58.2026.01.12.22.29.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 22:29:57 -0800 (PST)
Message-ID: <258e30fe-7b23-47a4-b3c8-a38227fccdfd@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 14:29:53 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: wangao.wang@oss.qualcomm.com, quic_qiweil@quicinc.com,
        Renjiang Han <renjiang.han@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/6] media: qcom: iris: encoder feature enhancements
 batch2
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20260109-batch2_iris_encoder_enhancements-v3-0-196855ef32ba@oss.qualcomm.com>
 <e92d8c53-44b0-439a-bfaa-df16ad5d4934@linaro.org>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <e92d8c53-44b0-439a-bfaa-df16ad5d4934@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA1MSBTYWx0ZWRfXwBvv3S7sf1NR
 RufujQlNa3w7CkFmlhL0aarJxh6Fy3HtK6AKBS0Ga54/yJk4hOKvM9gUYnZfWgqHkU2HBVIiYfv
 WogZuA6ZbpEbc2CSbJIDQT82+p7hIp30iUu+RxR8BR4PgsRax2eo1t9im8sS9LOWJSZvYJwmMzS
 NvX49QrozLlTPcBXnlwiPjdYgZWGdHYAlUiePf6k0m1SB4fPE3HfI3rDpvgEAIq2ncPIIeLLZTm
 iDURtJJKIPJLMR2aoPonpdz97K7Onkydq25Cib1mUWtRdW8/+zw0eMsLoMM7xAXVVGM0FNK6kf6
 n8tu9ZTM1sHgf1DhtIZHATvjUWqS11kQz9ACtC0w+sA1UAcppax0pKtDuEW43I86zqMQXxNiwiO
 G0Hili6diu33sGfwpvXp0pEiHk3hsDvf9/Ekz+jZlHeXcRQ/i19l6lMtDtDrLiaZFoTCFmmAfzk
 URukHjQ/C5ogdqOk5wA==
X-Proofpoint-GUID: uMtyOsoR5-DlPbHrMRYSC1E2yy7KWwRv
X-Proofpoint-ORIG-GUID: uMtyOsoR5-DlPbHrMRYSC1E2yy7KWwRv
X-Authority-Analysis: v=2.4 cv=XJQ9iAhE c=1 sm=1 tr=0 ts=6965e667 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=MxFkaXIYAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=0lm2fl_es3ODOUIfHskA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=bWa-HqqoEbs8MZQ2NTq-:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130051



On 2026/1/9 23:02, Neil Armstrong wrote:
> 
> With the following reverted:
> 456c99da41cb ("media: iris: Add support for QC08C format for encoder")
> causing this: https://pasteboard.co/t8HmeNaIFMDR.png
> 
> Nevertheless, the changes are functional and output are visually 
> coherent with the parameters, so:
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
> 
> Thanks,
> Neil

Thank you for helping with testing on SM8650. Did you revert commit 
456c99da41cb because v4l2-ctl couldn’t run properly? There’s a change in 
v4l2-ctl that needs to be applied, please check.

https://lore.kernel.org/linux-media/20250918103235.4066441-1-dikshita.agarwal@oss.qualcomm.com/T/#u

-- 
Best Regards,
Wangao


