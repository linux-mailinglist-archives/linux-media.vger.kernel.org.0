Return-Path: <linux-media+bounces-43245-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61ACFBA3855
	for <lists+linux-media@lfdr.de>; Fri, 26 Sep 2025 13:45:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5AEA37A960E
	for <lists+linux-media@lfdr.de>; Fri, 26 Sep 2025 11:43:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 235002DC77A;
	Fri, 26 Sep 2025 11:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="opsE6fbD"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438A82773DB
	for <linux-media@vger.kernel.org>; Fri, 26 Sep 2025 11:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758887091; cv=none; b=Z1rVHsWW1zP3VGtHtA+VN4QtsCayQOtRR11k5GUINaSYneMGdT6bUihZdFC4QBU/Am56y5lmZMx645PxAoVSz9vgKusGyp1GT4Yjzi5ELzIyQIGh+H0FLOuc6yk0fVSrgBCbnUv9asHuj/R51b70Wj0Cuk5t5/EypPDm3azwH+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758887091; c=relaxed/simple;
	bh=jafD62n3oYEBDKuYo3x5ICEIx1nzpV4cTgn3R7efROY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L9vd+hzHcIK/rwuRavWdkAZNoSzPdf3tRNZzwmYOjXPH6fRwOIt9US0CJYNBLc6NuA/vQuDz0G6cKlVGoFskGGcQGZqp2H6uBL21GpFIixM76rO+93sFi2nLybrQXR0DzHhYl6l6E78LITA8LVKau0cfvj/CYLTEU6R34G9Lnkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=opsE6fbD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q8vZOe018154
	for <linux-media@vger.kernel.org>; Fri, 26 Sep 2025 11:44:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oazNeDOXBpNTA9CUERHFDVRMmm0DeM7PNOxF45++cQo=; b=opsE6fbDl/ENPXKt
	eCNa+YeipF2nS9vJmn3AXtZPRjm4GimhVqxxO6Wsw+f3gMIa5ePU1+gTBuwnZ95g
	WYtJdTV3oBtxadZOm/V4gknB+XIp2C+XhhC3dDFzuU+u2Fywvryx9r8lmGXYOEso
	V7aFtgWi4t+naiCCsMehgHb2GAwQx8bES1caEN1fUVhxB5JGUyBGiu76swQGMe8T
	y0Fm0JGFExvF9j38+y38IBpef9F5ONhoOhz67QYC6b7qbleQrf4MNF8E/iuadvuB
	jkRCHlUCwXcrA/Wj+mAM33G1yrUjPm+MJz/IX0WvKIIh+xNR0LeZnN0ivZEhGrP0
	pr7/hg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0taqng-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 26 Sep 2025 11:44:48 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4dc37a99897so3617341cf.3
        for <linux-media@vger.kernel.org>; Fri, 26 Sep 2025 04:44:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758887087; x=1759491887;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oazNeDOXBpNTA9CUERHFDVRMmm0DeM7PNOxF45++cQo=;
        b=vwIl3+7MyAYjReOIKT4xuKi7CVEd2h7BEhWFeUSyJjJKA1AKsrJFAr3zSHHfCqd80o
         msxk8cXG6cRK10z7GfaAAYQ2Wpjx3w9F+y1OO+8tsqW0hFHROOuu8aIbzwEC/Ac+naJ+
         9skSozZ+Mf+xQOXND3XE9Ux2H3uHedOBPnVBlhRcfVh/ydKs3n0D7ZrA2TtHXGB9R8hg
         nymxo+uAyHi9CNCtDspr57cPMzr5hRq7xMPeWouyprUAB8cWKq4QHxxYfyDtprDMc7/o
         xaxvO+NjOtjRyLKS2jaqnNon+xu/jK1U+5VdRTrK0M1TpY9FyIDWqewKJGk13jgUsDUQ
         e8QA==
X-Forwarded-Encrypted: i=1; AJvYcCUD4VEtoRDIUFBIhKMu84gCxgySh3EMeeNVHW1gn8KYFJUviEKNLBNCW5UQiCgcxYeNbWY1r+4g78w58g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEPPecUqKuWK+ige2y2knqea6UOnan7cBxIJC8OSivjfup4HWf
	wn4rBBO2YKn7K/reiGSI1GuZxyfCIifq8LyfMSOkfjD9rxi6/uwjdFhBfDznfUDsyZIcGRob1OL
	uSfvoONGoOnNuUexS4JYWChVLidZDZFFDMaHq0hGskI9NFGCqvK++v2bYnQNADN6V2g==
X-Gm-Gg: ASbGncsh9xYtRoJmAA4ytArziT20noUx+d61BETiKc9UqBxxUxZIYpSsydCCw4Rlw/o
	jh1n+DZQgil0sPXTN2biavEj9LkkqTw4hR84/YpVCTlhlyZOLmWQRzg/UjCdUOqQRTmMhuz4J/r
	447IOvywx56Q/NyNVUgQ4mieRtGo7b6/Q0S8tXuwzQhAhltoiCQf/ZWOjVN7UiJ/Lmi5LN/Zoq6
	W77lSqQ81ifTGiJUap0r0TNhYc3Josr9AwmlbLYeDuGNTYjyACMav+ELfmZjhzW7brnkd8iqlPJ
	tVwKn6kCRtwDQq6yHlfurG7aozqkPqLtdGSq0JND5OOaJ8JG3jgB+PHuWixkJNd9YbMfnq5HVwX
	hs/XxW/YsOAbAVgsqf9/1jg==
X-Received: by 2002:ac8:57c9:0:b0:4d8:85db:314 with SMTP id d75a77b69052e-4da4bfc05b4mr56721221cf.11.1758887087280;
        Fri, 26 Sep 2025 04:44:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUJgskH5/9pO1Sz5CQgZsxdYJG0av5mRyh8GQfkS2NLlVmdflNR0Y7Vg+ttb4L9svIeMZhPg==
X-Received: by 2002:ac8:57c9:0:b0:4d8:85db:314 with SMTP id d75a77b69052e-4da4bfc05b4mr56720871cf.11.1758887086719;
        Fri, 26 Sep 2025 04:44:46 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b353f86f974sm353684466b.40.2025.09.26.04.44.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 04:44:46 -0700 (PDT)
Message-ID: <ccb57be5-7f8a-4008-a650-4683d34bfeff@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 13:44:43 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] media: iris: Add support for multiple TZ CP configs
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <quic_bvisredd@quicinc.com>
References: <20250925-knp_video-v1-0-e323c0b3c0cd@oss.qualcomm.com>
 <20250925-knp_video-v1-3-e323c0b3c0cd@oss.qualcomm.com>
 <050b2cc8-ddbd-4a79-879e-4a2c9e7d95f0@oss.qualcomm.com>
 <94f6754f-cc56-09c5-3730-3f36c22e4786@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <94f6754f-cc56-09c5-3730-3f36c22e4786@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vgoHizumfjn-j54s2iIz1CBk9KQr-j90
X-Proofpoint-GUID: vgoHizumfjn-j54s2iIz1CBk9KQr-j90
X-Authority-Analysis: v=2.4 cv=Jvz8bc4C c=1 sm=1 tr=0 ts=68d67cb0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=-AzuYhFZr7sfLd3NIz8A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX+ilcdr8pcC5Y
 vQ1k4t7xDPp61kNYDkYo5TCckeZOilagQG+HOCPNR6tVvU1Qi6EBogxrYo8FcixGNb1pcfvLWTy
 WrNlLbG/K/E2aYg1KAI83yi0wkfmcvYDKTV58meGgZxOyJInGOPXdJIq6bEzujNHN/lkgiK7uOa
 /KxByJ7z5ReDAKm9QpDawhm60CVVcxDC5OytP/wWkhNmSXy7ebE+eWf0l+KZd6iHUXx4PvLiKWw
 KDAIazuaXvw3YszftiD1sRmzRWfbD2uW1AfiP0QPupclQZb+/R9u0B9RzMDBYbiZXnJGbBlVHP8
 t56Iz/UZ9tqplvQ4Ugnv0QdTgVeY3CgQwQGXQTDNFev71ITbwjx136qi/RDVrK7Ccj+1KTKARLi
 lJYp1XizHnKm1yJadaBq+Y9IJ76NgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_03,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

On 9/25/25 9:27 PM, Vikash Garodia wrote:
> 
> On 9/25/2025 2:31 PM, Konrad Dybcio wrote:
>> On 9/25/25 1:14 AM, Vikash Garodia wrote:
>>> vpu4 needs an additional configuration w.r.t CP regions. Make the CP
>>> configuration as array such that the multiple configuration can be
>>> managed per platform.
>>>
>>> Co-developed-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
>>> Signed-off-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
>>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> -	ret = qcom_scm_mem_protect_video_var(cp_config->cp_start,
>>> -					     cp_config->cp_size,
>>> -					     cp_config->cp_nonpixel_start,
>>> -					     cp_config->cp_nonpixel_size);
>>> -	if (ret) {
>>> -		dev_err(core->dev, "protect memory failed\n");
>>> -		qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
>>> -		return ret;
>>> +	for (i = 0; i < core->iris_platform_data->tz_cp_config_data_size; i++) {
>>> +		cp_config = &core->iris_platform_data->tz_cp_config_data[i];
>>> +		ret = qcom_scm_mem_protect_video_var(cp_config->cp_start,
>>> +						     cp_config->cp_size,
>>> +						     cp_config->cp_nonpixel_start,
>>> +						     cp_config->cp_nonpixel_size);
>>> +		if (ret) {
>>> +			dev_err(core->dev, "protect memory failed\n");
>>> +			qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
>>> +			return ret;
>>> +		}
>>>  	}
>>
>> Do we need to do any "un-protecting" when unrolling from an error?
> 
> Not needed for unwinding part.

Thanks for confirming

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

