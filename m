Return-Path: <linux-media+bounces-50856-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 307B6D2EFCC
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 10:47:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 804003035CFB
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 09:47:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74D8F35C1B3;
	Fri, 16 Jan 2026 09:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AVFYAr/G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AKFM066H"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BE3219A8E
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 09:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768556855; cv=none; b=SjoQ8D3+QP2SM0M1R85t9QplCwq+Zi1xnq0Cqxi+fEqRddHzfIq7GNGPWrCJst3o05oDsqAw6r1jty+izP4m2wyF2hTMMkMb/KNy8VizLwGYnJCpT4aqov7JxY5YogRRj52QGbfdl5AfdPfSgllmjyg3TNE0zf23HWkw6JFGVT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768556855; c=relaxed/simple;
	bh=FrH51ccNgNjnJHpV2c2Dp8Yi8KNRcZjTD3zuBK4PjoA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oaAo8paxTExI9AwyB916AwiicoF3VrIvdhcWpR9fBCNvw+pW9xeTBxSMIPSpN7Ol2ozN0/1LjAxwCrNFkOfp1kULc/PcIwUSEHCHaW+9wsspxMiHZItVz2a91ZVS+zkzyzddnpey1BktKUKP8YqciT0vF1keNQJoBgebrgaY8mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AVFYAr/G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AKFM066H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G7e7oO3583180
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 09:47:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kelGpve6vDB1Q7G0lH4/Aem3uOt/FIByHaY9xLBdYIQ=; b=AVFYAr/Gw5Yz3bl8
	K7C5l1gyJ4PKGi1okicuuCGpsX8ipgbTZmOYXejOWeGBj+K4vWWoHzSQSvNGrQUG
	31CZZj8+/zLia7+rVLJlwE9dR/HpPMeJwDv8K80MazFnsmmIsuX83D13r0lZyZlc
	2esbOKFfhYI/zed8AMjXCyftC0oMDdgz4xpWqI6H4xaa5ItTcAWuO3aMrBsL/1ci
	1N/6R1OTQYqo7HvwT37Rf5XIY/f2GX5T4QP59SKzkYVn02b4bX/6wJ1Gmd0MJyWD
	wgwfP3njtrpr4oZNh+ml4IP3+e/khTpRqE2FfzHYD+Y1LXfVqQw7HWASCwnFR6lj
	EkzSvg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq9ayspnd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 09:47:33 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29f25e494c2so20773325ad.0
        for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 01:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768556852; x=1769161652; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kelGpve6vDB1Q7G0lH4/Aem3uOt/FIByHaY9xLBdYIQ=;
        b=AKFM066H7rHRJOYY/3W8RhDEc3G6n3FsDsg902EdHiYUrFyIyY3PJtf6akIG3Gv4kX
         KDXrOuKHx2YFm3g0AllX90qwFDbF1piU5EHfn5IWNhYxlpA4NIlPs4Dt5KW/W+xUzRVt
         +milq4l3CtjRRMNYK16chgIH+60YAge5L2XfcBUF1wNy6euweBFp/4Mz9wyBBely/c5/
         0uxxzbLBV0UP/yx+zbg5Xm0fWMo5B+Hb1VX62NvhIbxDqlGyP1goxNaaKWpRW5BO166d
         Hbz813yW/E0D8E8vJtRGlLBSsx+NIU0YkBCeYOPadAg6Drr3w8UOX8udBaTGT7XGWoTV
         9wug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768556852; x=1769161652;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kelGpve6vDB1Q7G0lH4/Aem3uOt/FIByHaY9xLBdYIQ=;
        b=VQq/T8NfjDA1kbGEA6PY0Xqz9PZ/Znlc+YTD3PyfPTBW4pWvnIwqDNWQlF1V2YSu/n
         aEm1UP1RQJc8/88YxC3PEmzj2aK5YNGvoOzo71jS4VBgp5E/BaQbzvW9C43E95AVpyCA
         fSSOYprWVHBiLYah5QSG0JCxzlr8jT52W7N81G6ElUvZOa7NWyQZ0HsJPvpqbwG9Aaxr
         lRlxWrLBWmdDLJpguaK9b55FtxnfNPhJlS0jn0fHJ8SdycgfGWEr/rVsYmBSqBN0BxYF
         c36zc2jD9CQhmX+jVOUG4xT23J2u/u9QuhevqVn2R1cUpchE51t5QAnCJ0wBwWa0VrvB
         KmMA==
X-Forwarded-Encrypted: i=1; AJvYcCVd02TlhK9XG9+huHLHq6cbfsvMUh9vsETuwPN2pEjqUruQ5236ZStPaDIgn/c2TpUfuNpipaSEXR9yCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSRa7whXWVb4Q10Wc5wrGt0yXvQGkpAPS9XZ1FgqTY/F/b8JsO
	i5QzymekNqXVtQXxCSWEA1RNFIE7SPcPtNtmlzFpCRyeTSZZmBcGHXm5gEki1Klf2hLjRT8Ea8j
	Rj0qAjcpKB6x9+hTuRYJ0DDaXq8nqbbpkHjA3fvdKoSyW/qS/w3BN9UNdX8I3OGRJ3w==
X-Gm-Gg: AY/fxX5Nqs957R+04jd3EqqndGyM2H37M1wSilw06dHnn7fJX9oOGiDgBc/Vb8qxxrI
	TBet52ow8V9Wovw7X28E38LbyBC9QyGHB2tgBGNqqSxXvKunTWqkruVevEBtr7OFiRmIgZsdy7X
	opdtqCE97n9ivzaxJakQimEjj63YWWB+LeIQyxBYUhl5BGCOXOL3dRJEdsGxpStrvfJ4wBDB9kJ
	iF6khc5PKO6Wt09BlAO+gMkUbl57x9WZkahb6GzvHPBqGj3TUG2mX9vCfw9UKo/WQB4Ybvb8dOn
	nw2eftt1KOY1YWhFURkRh/hwOz/emv4FTftJnb+VVTkAu6DOlJU1NNjJzxDXK45TkoJYpXdSTem
	U1D2x/2UP3tbfcaOXkFh7nZKpeTyVMcRFcBkFT/2aOw==
X-Received: by 2002:a17:902:f650:b0:2a3:ccfc:4de5 with SMTP id d9443c01a7336-2a700978f8bmr64216915ad.5.1768556852623;
        Fri, 16 Jan 2026 01:47:32 -0800 (PST)
X-Received: by 2002:a17:902:f650:b0:2a3:ccfc:4de5 with SMTP id d9443c01a7336-2a700978f8bmr64216715ad.5.1768556852164;
        Fri, 16 Jan 2026 01:47:32 -0800 (PST)
Received: from [10.0.0.3] ([106.222.229.125])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193dd582sm16631335ad.52.2026.01.16.01.47.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 01:47:31 -0800 (PST)
Message-ID: <de160d43-91a0-a527-f0fa-a3ba6d7121f5@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 15:17:25 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 5/6] media: iris: Move vpu35 specific api to common to
 use for vpu4
Content-Language: en-US
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20251210-knp_video-v4-0-8d11d840358a@oss.qualcomm.com>
 <20251210-knp_video-v4-5-8d11d840358a@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20251210-knp_video-v4-5-8d11d840358a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LMHd5ctXeHMx9XSCpqhCAzrjpmlmxpwe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA3MiBTYWx0ZWRfXw/M5R8/CqoMx
 ONcjwIUxnG6HvFNPdt7LjvSSiLacDUsKDsZrbIX+eQjUVgLq1DnhFq9D0WRSzvGk+nGwj7EYGSm
 OUO1BoncJr2BzrIVfVMLjcCIm3EgNEnv6Tc82OEVTXo619kg93Fyy3JHTeVzPtFwYZGSuL9+xoJ
 j16S7KiEnb/dVSgLRjuXIbaXXVjUVn+a8nNmVL42QILv36cuhMJ7lqh/jWHCq0mYEJKCzD+AjEK
 zaGZMtcmPRILsF6qe0JhWJw0pi03fJojjuqa3g7YzsxqC0putK+X6e/JcclfuIigfYM4TU7dVRt
 CXlfEsFufSXhiZVQofHFLPLW8QFkO59f+4wlhXqdhs89EEpNe4iAo2ZofjfpRKazzQoq05106X7
 4uXvhFIKsAlZKUVNFBsspdUAld/e4lRk2YY5UCIg7b7vRqyecajeoao8aacjoXRLmzB/dN1KRDo
 PccNg6twXaVwaSAdZPw==
X-Proofpoint-GUID: LMHd5ctXeHMx9XSCpqhCAzrjpmlmxpwe
X-Authority-Analysis: v=2.4 cv=NfDrFmD4 c=1 sm=1 tr=0 ts=696a0935 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=blWSk0AuXjsE0o78ys1YMg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=hqVnMPCZWYgSQcfks7QA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160072



On 12/10/2025 6:06 PM, Vikash Garodia wrote:
> Some of the sequence and calculations for vpu4 is identical to vpu35,
> namely power sequence for vpu controller and the clock frequency
> calculation. Move those to common file that can be shared for both vpu35
> and vpu4. This patch prepares for power sequence for vpu4 which is added
> in subsequent patch.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_vpu3x.c      | 157 +--------------------
>  drivers/media/platform/qcom/iris/iris_vpu_common.c | 141 ++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_vpu_common.h |   4 +
>  3 files changed, 151 insertions(+), 151 deletions(-)
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

