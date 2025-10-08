Return-Path: <linux-media+bounces-43953-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 20567BC4717
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 12:51:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9A6664EA9B1
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 10:51:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0448F2F6190;
	Wed,  8 Oct 2025 10:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V3jdE+9W"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBCB2E7BDC
	for <linux-media@vger.kernel.org>; Wed,  8 Oct 2025 10:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759920665; cv=none; b=DCt86NZv+rDi0Li/NmzAbh2r5GxzjdXTAjUmU/ROlJp1lX2nAcHZqD6WukbBd2ZNWhhRIquWbLun62+7jx3wDazEbWrB3bY/CU5SNM3A0O+xMDtbcoOwwtHgt9uXvm9bRlZD9bthi5D5LfSiJMr/aE3SxFhT3DqMHV7jmRlVSnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759920665; c=relaxed/simple;
	bh=rCJS/DF0vAIK51Y7TrE45g6Mebgpbjw75rMElUhkPPc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CNlcIIFcfWN7dXrDB3PVXrB4k8a/sHjOiUVFaBVerlwzdollvm5MYoKGHK8ukRmOHnuOeVJiFm7YCbvLU5zRzR+sTf02YA/KZCSmBhFMaIj2wlKIf/YPzxbv26PfMlRLUKraI4D7fcPSGYH+tcmtl3l/pHdNUONX5Erf0v6Teuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V3jdE+9W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890fW0016028
	for <linux-media@vger.kernel.org>; Wed, 8 Oct 2025 10:51:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jfiMTH98PGOoSPZGb+t22lVD8sXYwM73ZIvPfeoWjUw=; b=V3jdE+9WAl1VHoRa
	nhSJBhLEArGwp7vQpNOl+Dkjj8LXh3GVFsL9yo7BZwHjnzG4xso7AJqVqVsfj3Pl
	liMT0HPFYuuK8qPQh2ZE6QteTEilUxczQOYPDqMSP4e6UqqJpKAs4oRhAHvIF3SO
	VyUl1Tl6fVbinboMlkZ7LD0eKwbJFLZxNX++XW9btnkQoFc+Vht8U2x2ExdkyVid
	81OaQXTX8YO5mNfCBkGGqg361xBLinONaRHYnK2hT7KY5gOhVVIcszxyABgSz7a4
	2n65Pf3XCfiWxdESWH1SK5SzMiClXislJiESx4lO5mwo6k6bdTbS5WZ1CWxE0N/6
	EMIG5w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtk7261b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 08 Oct 2025 10:51:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-853f011da26so241045185a.0
        for <linux-media@vger.kernel.org>; Wed, 08 Oct 2025 03:51:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759920661; x=1760525461;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jfiMTH98PGOoSPZGb+t22lVD8sXYwM73ZIvPfeoWjUw=;
        b=fKAhPa2BPrpTFP2ipaMnObjzYadHsYGRUWuSrtcnOXWML9vS2nPfdKTXydd7Y4pp3J
         +FObLzK9lm3vSNbRmnWLLeFps5emcSdI3Z/fBmhHUbKJHDzI0ZP49RMvNup6+XNgDWC1
         fQDpNvvSDykzLbhlOe0chsz204dievbHy2GGNtORubsP4d1/rChTNor9la/NLjD3ulhk
         RyEGg4DnL9eDGFXvf0I1JJEQnqEf/ngDIluL2qVieMnW0bv7R4Yy9UWzzFMVTuPB6Cxf
         Jkc/0ya+TDCL+b6uXq6YgtQs/WAvbW3oBuTfnHIW/aozXudMDqaFvWKy0QdWZIOhes6O
         vPEA==
X-Forwarded-Encrypted: i=1; AJvYcCX+JvWeNDsqwqihRXLo9/UWV+sEcuk6PYrAWcggdzoFz9veUrK/LLnJrhf1zyJizdkbu90WQJTLBcjxpw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAebsFm5FHhnlxXXY+8bp5tCls29lYrQGhoXjrI04TFfZX6WAC
	avOUYs1/B3s/T3XOzaZzI+W0OdYjYMBjL+zdmlYKBv2PfYHvguf5DYSigiTMnrcskVR78tMWxkF
	wrhCMmiieK8ihRonzS5G3GC6y3gLjljVyS6SXKKcQV3azb1GzMvDXczmhN6wjnF/hAA==
X-Gm-Gg: ASbGnctkX+mqRXLVtWSaou9lioYKQ8gZa11XAwbd754FPHcvcs5xNbPtEH75GXkyUst
	vPVW+dhYly7Bearpf61DW/DX0D8i9w876tBrbfEK7DmHvt1oF7D8HUvilsmlPvgKrJjahXEsp6P
	94EnUMQLLMvB4AuJaw/3GIhq5nCPh8mHsDkboThinBOslBYC0AlNRKmylJrBZrQJH2I7lRqXwr8
	G93VIHGKBMk5OyYp+g3Hn84yU860hWfuW59ih31vIoE+3kr08DSvlrm0kHNirKwJA1sUY9bKuiX
	BwHslGS5fBldurPqtgqe6i9eH7znSUcKtpGbbDnUbQZch471nG4TXGxsnccv0D9ohogctUEwOEC
	Ibtaa0ti9D/jvS1JU1ntY+hQNKL0=
X-Received: by 2002:a05:6214:4107:b0:774:48fb:f8f2 with SMTP id 6a1803df08f44-87b074d2d0bmr26033296d6.0.1759920661238;
        Wed, 08 Oct 2025 03:51:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGL1rSY/nbB1/t5g5hSYIbRk3avvqzjdnWKUPvH18AQ/zbzsVlznDqAFRvxOxM/XUEnY7OASQ==
X-Received: by 2002:a05:6214:4107:b0:774:48fb:f8f2 with SMTP id 6a1803df08f44-87b074d2d0bmr26033166d6.0.1759920660706;
        Wed, 08 Oct 2025 03:51:00 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6376b3b7225sm14212981a12.16.2025.10.08.03.50.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 03:51:00 -0700 (PDT)
Message-ID: <eb90f34c-4b63-4696-abf5-1d412d7bf263@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 12:50:57 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] media: qcom: camss: tpg: Add TPG support for
 SA8775P and QCS8300
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250925-camss_tpg-v4-0-d2eb099902c8@oss.qualcomm.com>
 <20250925-camss_tpg-v4-3-d2eb099902c8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250925-camss_tpg-v4-3-d2eb099902c8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxNyBTYWx0ZWRfX9d4RqbGBQyF4
 hxesavJLrZ/2+NByN3O53XCqQuw1CFT5m+gcW56JtYMDNTYgOSXQM+d++Xy7eCXHpmYsHOcTOB3
 f5dMNxRavY5Y71HVbwINxPKv9ZUueggHT3fMk0/2gLWu+qWnCM7L+6FPxoOj8b7Msvghh6FaU+t
 UyuIL/q30Ze2qK/f7mpHYFteIeDl1cBUyItskazQbqBKt4OdNa5bMfgv6ytr7uQtXWIV5kcgO8G
 9B4QyeXWIcTXbWh73uy4Sqqfoc16Fz+m7oVh/GTFaTKF+mo2p57vp64/QShiCuplyEJhXnMyiCH
 Vek8ZKjfHTpTWm9qEg0ZXNnUTzUmd7q5oF3M0jmLHK0K+tDzo96dtKWWntAEjyUqblg2zjCiY8S
 UCBISUNLRyFKOrM9xNHyJyn9NgixXQ==
X-Authority-Analysis: v=2.4 cv=do3Wylg4 c=1 sm=1 tr=0 ts=68e64216 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=_8ZK2gaWRgDgu38a0eYA:9
 a=QEXdDO2ut3YA:10 a=VIpMrH0tWCsA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: xdQzEE2EQH_V7Fp2lPrc-Ce-U4-PMXZA
X-Proofpoint-ORIG-GUID: xdQzEE2EQH_V7Fp2lPrc-Ce-U4-PMXZA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040017

On 9/25/25 2:32 AM, Wenmeng Liu wrote:
> Add support for TPG found on SA8775P and QCS8300.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---

[...]

> @@ -4350,6 +4413,7 @@ static const struct camss_resources msm8916_resources = {
>  	.ispif_res = &ispif_res_8x16,
>  	.vfe_res = vfe_res_8x16,
>  	.csiphy_num = ARRAY_SIZE(csiphy_res_8x16),
> +	.tpg_num = 0,

Uninitialized fields of partially-initialized structs default to zero,
i.e. drop all lines like this

Konrad

