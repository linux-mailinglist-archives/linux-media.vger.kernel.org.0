Return-Path: <linux-media+bounces-50453-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E978D1230E
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 12:12:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF78530BB24B
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 11:08:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16E74355806;
	Mon, 12 Jan 2026 11:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fJQHfpSe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bg/SOhbP"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33464355047
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 11:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768216100; cv=none; b=Mkq3tgifo3zR0X6cQ0Kw8cXBx+F6bha+dC6NHxXZw0uexrhGBbOmjikGC1e6C6BYBrKYofY9maWpye5elP9oZzKiESU2sZuN82Ill4e+8UQo/dOVZW0wfLj4UqOc03SP7vVhKdR5CmtCkHn9/H9L4qH6BjXVMTu7+5SKO2glZGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768216100; c=relaxed/simple;
	bh=iUASacHpIkllyuDdafnv4uOGpug6041+SXdNyxM1PcQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CSFcA+1K1m9HKo6I4Ye4uAkmxrUyJ96yNNtWyaJPuySeNl9HVmye3GUnEX3bahMGdTdsEvTpadMjXccA0gfacC+mk3d2vvlSUbPfIUtW1Uz3kLY4ivrGJq26dIAplFLdKgn3s/oDNwJC9K1hmkei1QaUmhKlL2/AZiTXyabbStE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fJQHfpSe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bg/SOhbP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C9FQBJ1093212
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 11:08:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SpjQ3UXs8yQYCWMwewPG2bxBVEtUl6oOH+rM/TylefY=; b=fJQHfpSeuBqfKrpE
	+U76b0Y/C5CNDcOEO16jhYn7gsUWw5M5SyfoeD7RZz83e2GbkjBk5j9Z5HHNJq0o
	7SXY8gqctzhAjSqBIX1uxwTB1VkRfZVwnqkO/49Flw64eDiqYtgjK0BFoyrw+qU5
	uLhgS4+F58sOUhrT4B6gWwAUgjPQirB14Ky5Xo5Q3oc2udvaQ4YPgML0KFm1gbkV
	6ayXwkjzQjRphjlfI1zAc4ipzUfNMy0sSLvZtMj6AUB4FA1eOhiM6+cxP1KpLBaw
	wvFnFv/Mnde00HLfaZbenRF9mj66huix+rlXmnufKcypQY72FWCE0ME/1xGpPWVN
	CjQp0w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmx5mgb7e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 11:08:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b9fb4c55f0so131424685a.3
        for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 03:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768216097; x=1768820897; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SpjQ3UXs8yQYCWMwewPG2bxBVEtUl6oOH+rM/TylefY=;
        b=bg/SOhbPX/tbukMxuX+MEePJTGuV6WVlvYt5tsxEyBzT0TEhqearkoYAgGJi09+KCR
         kx3nd7/P5D3l/FIcjdT7+jHSW/p4+jy3WTLbZbhmIjd+GP/rzUAKlWCoybDtnOTMyThd
         Rcinc3fxVeZM28+hzci4KA2NsAIsEay/n6YlD2ZngvyMhbLEdKpnnY+IShOlzoWhkmFP
         j56xztLhm2PcsI26xPSn+2sTX5n+OdBQUxXonxdcF8nmv3US+KZRmNBNj4Bg0+EzB2MB
         IGvBpTLZXyCDBxr4b+d2PNrvCLYj+d7tthXe+1nuj6VTLUs1z/RxUfcd3nDqrAKDYjmR
         GjXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768216097; x=1768820897;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SpjQ3UXs8yQYCWMwewPG2bxBVEtUl6oOH+rM/TylefY=;
        b=ExO7/zl0n+O6h7Q/FZaDyxbFQFHSvs/Ght/A8+jxPafTupbtzImpBHfHx/wC96x1Hd
         TNDsHKqg7ygViayd9WNtHvfPl+K4z+cRrZsjMiDTrz5Apdb487MVguAyIsHyQSXLLzhd
         COvUuzRYAx10qRFhm5nbSiqxvnzTwyqYoYF9fd8ASFY9GgI0FZGmNwK/X6OrJk0iyfDJ
         4uIpI2k/dLzR0VKQj0NF+OlRAXUnScQih7g3pxex6DDVR6RrIkUKk+eEkGEgabLcFdRi
         Zdx/u6ip9i8PTbpcrUQn8FuMf/ruDpU00dYpRCUKqXS/mY5F02FEYsG+bPuo5VkR4YEx
         1ESg==
X-Forwarded-Encrypted: i=1; AJvYcCUPY2olvup75UJFZlDD9DabKluHmPLIfFZWmKzcZVpwSv3A+c+c6xibbxcxSI4pgu/orGz+arMkJiYw/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzWYh50PsxIZ7wjvDzdxgLO+HuHcmag6W980BcmFABIrZW0HET
	VNi245Al43FIqemJvuJyO3gf1iS8h+IjpRvr/m6VaA5wYQU90GSBJhdG5DJVtRjJgfLuFPDksul
	AadGokfeqQcBUh/v/Q6u/fK4JLzLQpbu/4t5Vp5XGnSwzjDqI3u4SacJ0YLwEm8UUjA==
X-Gm-Gg: AY/fxX5zEVleMWOe0mKmBn1rW0CETJClYC8SMvrJ7klP6/MTUj8zA5G1fdWAIc4hi0I
	P68QXTniJrJ+x5JRwTUxmKsBaT63NlH+BULtY+C1b6Oq8ZtsyO4hnL2wxffF3j2SENgWiEDzRe5
	CP+a/z0t/pqnLGnfgDZROvctaC4z1KQcKY28OYMLBoI1LlRkL6sx1VFHPdNhZcp5x/NW5dw8c/3
	CsAh2O+52zqxgxq5LVqz9nmjaVuFF7i4r5TYzwYKTcsuy+TA/E3bsjktShiSM88eYn8IbmToJHO
	2p7MRV8PX8xDaLLaRP4h5E8aNzYzyXKwJYopsen5sxEoN/CNgZMV+PGjfIESTeThL86hne+JKl0
	YkpBhXvsMMMmFvoQDIMmdV5wvxVs13NCoifEXHvpc1vhvAeaQx4/+yAMHgVvOu62AyXc=
X-Received: by 2002:a05:620a:1901:b0:8b2:e177:fb18 with SMTP id af79cd13be357-8c3893fd199mr1758457885a.9.1768216097441;
        Mon, 12 Jan 2026 03:08:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHBH4pb5/3BYG/cAuJcv/xavCclwNEZZzBJQcWjCGzKwsMo2DvYPIaRbeYOzCTWmrWy3hc+mw==
X-Received: by 2002:a05:620a:1901:b0:8b2:e177:fb18 with SMTP id af79cd13be357-8c3893fd199mr1758453385a.9.1768216096987;
        Mon, 12 Jan 2026 03:08:16 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8724197145sm173031466b.11.2026.01.12.03.08.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 03:08:16 -0800 (PST)
Message-ID: <5594210c-ce25-40ac-9b5c-69c97eb0bd72@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 12:08:13 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] soc: qcom: ubwc: add helper to get min_acc length
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org
References: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
 <20260110-iris-ubwc-v1-2-dd70494dcd7b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260110-iris-ubwc-v1-2-dd70494dcd7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4OCBTYWx0ZWRfX+oT7zItwXWpx
 14WPcvXJhslgu2NmFMVJFrywCfkyrChRIT8l0kmU+PUu7fguOzqMJPcQLla/OhWNI5fQlZAZG2u
 iY0ji9xgaBsBEJVO9p6gdc9uvmtLBpUEpie/uSxGTtfrUKI4NsBEslnP6M80Fc6u8OiTAQP48RW
 4OoDJya6nS1LBzf0TTWVVI9St5mAdg8MbDaKdqNUAYe5yz+YKOQ/K1Yb14+IC2jA5ub2uk0lJAv
 Ag/98A7cLgBtkMESm9T7GdyfKQzcDhX7IfIeisKZMa8PuneyFOgbRgeI0/I+9YUqjUJGA4+dTBV
 Idyh+Y2OBXItFchfAwpTH8SC8ZtaD+SCnWnBkZ5XgLPPpX0vcsFd4uxkNwhRxLh/kn1SaJKNADe
 3jiLfUVmzY5QJWL5OLu/2Pru3NopW2sNFLyDoDZ5VWBJg9Epa4OM13E4zDLvlRjcPTiLOVb3AGS
 oZFgrTps5QaTPhFvB9Q==
X-Proofpoint-ORIG-GUID: xnkgv0Nu-jkyn0tTzAOfARLkTbaWMYwl
X-Proofpoint-GUID: xnkgv0Nu-jkyn0tTzAOfARLkTbaWMYwl
X-Authority-Analysis: v=2.4 cv=Q8zfIo2a c=1 sm=1 tr=0 ts=6964d622 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=_A-17BlWpzFJNOduaeEA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 spamscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120088

On 1/10/26 8:37 PM, Dmitry Baryshkov wrote:
> MDSS and GPU drivers use different approaches to get min_acc length.
> Add helper function that can be used by all the drivers.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  include/linux/soc/qcom/ubwc.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
> index f052e241736c..50d891493ac8 100644
> --- a/include/linux/soc/qcom/ubwc.h
> +++ b/include/linux/soc/qcom/ubwc.h
> @@ -74,4 +74,11 @@ static inline bool qcom_ubwc_get_ubwc_mode(const struct qcom_ubwc_cfg_data *cfg)
>  	return ret;
>  }
>  
> +static inline bool qcom_ubwc_min_acc_length_64b(const struct qcom_ubwc_cfg_data *cfg)
> +{
> +	return cfg->ubwc_enc_version == UBWC_1_0 &&
> +		(cfg->ubwc_dec_version == UBWC_2_0 ||
> +		 cfg->ubwc_dec_version == UBWC_3_0);

Are you sure this is a correct heuristic?

Konrad

