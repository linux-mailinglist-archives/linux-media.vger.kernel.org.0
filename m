Return-Path: <linux-media+bounces-43137-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EB1B9E2AF
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 11:01:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F0AC97B2AFD
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 08:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D518264A74;
	Thu, 25 Sep 2025 09:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IbXvGQX8"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35FAF4502F
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 09:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758790882; cv=none; b=ZeIdFaC1YfyZomGcvNxaAMvJL7LZhYxu1eZ+d/1FQSadNkCex5FwQOKAtaUa27DS6uHEJwPYmUkbHJsWcUbHTq4YPK/u/wvhzhtC/+dUDx3+3y1etH3auFXyQN1rcmGVW4zMRxRwRoxI0iS4HaD8xbA6IW9e6ynXVZEF0zuA+XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758790882; c=relaxed/simple;
	bh=EG/AvOrhHFN3S+Jj8IoZt9yabjIQcx+99yVd/FA4AFI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RlRwJYTN1Gh2mS3n3+lxjKyNol5dgMngQZGzwY3/0Nao0M59mPcKfwvJ+7zfVEbgDVSbc7JXcxo6d6vn7rQjKokG0aW9m/KAd/d4wJ1dGIp0tk5I829ty6ymqKn5bTnZmEJXoflmb9ctXZxm80LpYSefnp/LkoyKFPIF+2867i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IbXvGQX8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ONx2M3018070
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 09:01:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nErVNH97ngZj0wOMSCyf5gNqUyVQBeaqG4w7YWWN0t8=; b=IbXvGQX8V1Ly1SAK
	QCenpoRmD7G9gW4DKCPihkJS/26uFuWTsY6DzaXaowj2MkajtHnPhckRXIhbNr8M
	ScsW56gf5klrc2IdAi5BPEjQbsM0bGkPUQzNrIca44ofaRXwmLdOgDBPgJNyaf+9
	rLPO/o0CrnXMYEhtxQ8IIZaC6eklBZsbwUZkLfJx+LXqRLMs4cV1FNKzvmuyZC0t
	Gfe+Agllrq+uKgiTpepP0eC4MH7JWZNP+kiKFr7sVdk6RSR2uEINPQbpbSqY4hkf
	WHFpFDqkOpzVFdo1qeSIhlLo+IvIJIRw/YQjtiZFa5U/gzU2P3EJWxgQnftXOL8r
	5UgDjw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3kkbedj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 09:01:20 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4dc37a99897so41321cf.3
        for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 02:01:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758790879; x=1759395679;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nErVNH97ngZj0wOMSCyf5gNqUyVQBeaqG4w7YWWN0t8=;
        b=Ux59gza4KMGVPfXklJ5xsg3LxiimfQN4PfCRc9ZfFvEjwlE9i4fJkd9N5MaS63ppbA
         uPbLJU+Z+xSycGd/JkZJ8C1VVcpJ/K8HljtwjAvhtmYWlV9HBh0u2JS5rX7J/5gbYFjH
         17NJ/1RzUHzSpEdHmcGe1uHD1gJiMWaL6wG1KC1ckT68JDhoMeX3620g+3v7wppYw5+x
         +H1nUSJKVxBVWOC8paIkhE/9sQbposUb2U5D1dKqNvPomw3yl99KU3AXW9HRhvGKBn0u
         P+oHY+z9QQarwckbr96BnFOfftwTN554hhhDfbocQAeA0G+jH8J5GAUR1RTZyQzIJSFS
         Uv8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWLS51c08v8/hQs0V2TaWBSRYMHwott0HAg8+wZfg7Qc10TgFLluC+6jdVKTes5xe1VRzdYCdQyOHLjjg==@vger.kernel.org
X-Gm-Message-State: AOJu0YykZhwN+ZSTC2JacPmfezXHFZ4X/mq3NNvoWy3s8GA2VpoT1Cux
	Dp44gznCzusYppOPmBEduBfKDsxHDHdxEFdCUuJd4Au9POTspSSN4WeztFBzKY9wulYakz4BQHn
	Q399xA0eMltqYk5dNilRZE23yhQCrtj7VU2EX22t3G4hYHoY0U606mok4xH4QwwDhfw==
X-Gm-Gg: ASbGncsKo7jFXLGv/qHaGRtJVP5Ee4CbOvRxdSwg6r3iycoKZ+EFryDaT8yO53/Xe1X
	gIneg0EiCANRQavchPWZRq3lxNYrKJhJOSg0c5gly6KIk/j1Hg78Qm5kP+qHQGAJqe02pJfwDE8
	OADMb9ywKc5161BvQ1GaVyuP2zqTIiBwggwP9ZB1E/z59LILfNJfQ+Obd2V03pDx93aZLDWqWlG
	52LFm7VY9SIhmirBs6qYkfNVcmFOFE9djPgjFijKlQez49fJr7Xnok6xg8WCXYaeeXBJ5ZIB3wv
	SEUyOQff3722RnWSkYsU54Qdlmp5MZ+LErNmpT2uASQFeBJf5sL6BLMASf8Qt6l9RjFrhTg1Fkj
	KQk3oaW8J22/fic9hGptVYw==
X-Received: by 2002:a05:622a:24a:b0:4d8:7b08:64b1 with SMTP id d75a77b69052e-4da488a2d68mr24551951cf.5.1758790878945;
        Thu, 25 Sep 2025 02:01:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIEEiaQAm71DQ+NEF1w75pObhl5w775CkYKjl3dcMT0LtvrfJMaGLfpVDOYjnPi8DQxbLxdw==
X-Received: by 2002:a05:622a:24a:b0:4d8:7b08:64b1 with SMTP id d75a77b69052e-4da488a2d68mr24551451cf.5.1758790878342;
        Thu, 25 Sep 2025 02:01:18 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b35446f7547sm122337066b.67.2025.09.25.02.01.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 02:01:17 -0700 (PDT)
Message-ID: <050b2cc8-ddbd-4a79-879e-4a2c9e7d95f0@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 11:01:15 +0200
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250925-knp_video-v1-3-e323c0b3c0cd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UKcyUicZ5ybsjUw7tI3KIsTKpixYdmlI
X-Proofpoint-ORIG-GUID: UKcyUicZ5ybsjUw7tI3KIsTKpixYdmlI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA4OSBTYWx0ZWRfX31jvoMq2gFhQ
 K4gmsUhDQzoGzw35J20tRezE7RCJBLCpbhcH7MI1IBTkKRGvGQ0hAeBlgU7PBV5yPQxuENY4ncX
 Y/JbPtomaetbj5LAbNpx6iaccR6H0+b3nD8BlvHUJbVZM4bDS83jeQ+V7z0GtY/MqkKhp12f6ZT
 tqEZv/7S7DBqji/laxtl7FGSWLY4uoUzK9UNQn3MCL+cLTgZlXNA5dU+NmvW5FDJPs4QtoIyt6Q
 n4z9f5WXKeDntzxRx2XeWBuep98RHsZV2+HRVcZi+uIBG2lA2JtJUuT0SWiRHLtQ5Hhww/Ec2Ri
 ROiJK0t/Tc0WcBIfTIdRzXRuef9Opo6QoMhtgPQDZ/H7CIgJXfdmD2bR8T+Z+SRkX9UpuTBqWFQ
 xbcYcili
X-Authority-Analysis: v=2.4 cv=BabY0qt2 c=1 sm=1 tr=0 ts=68d504e0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=i6MhSZCOMBc9aSuCptEA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220089

On 9/25/25 1:14 AM, Vikash Garodia wrote:
> vpu4 needs an additional configuration w.r.t CP regions. Make the CP
> configuration as array such that the multiple configuration can be
> managed per platform.
> 
> Co-developed-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
> Signed-off-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---

[...]

> -	ret = qcom_scm_mem_protect_video_var(cp_config->cp_start,
> -					     cp_config->cp_size,
> -					     cp_config->cp_nonpixel_start,
> -					     cp_config->cp_nonpixel_size);
> -	if (ret) {
> -		dev_err(core->dev, "protect memory failed\n");
> -		qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
> -		return ret;
> +	for (i = 0; i < core->iris_platform_data->tz_cp_config_data_size; i++) {
> +		cp_config = &core->iris_platform_data->tz_cp_config_data[i];
> +		ret = qcom_scm_mem_protect_video_var(cp_config->cp_start,
> +						     cp_config->cp_size,
> +						     cp_config->cp_nonpixel_start,
> +						     cp_config->cp_nonpixel_size);
> +		if (ret) {
> +			dev_err(core->dev, "protect memory failed\n");
> +			qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
> +			return ret;
> +		}
>  	}

Do we need to do any "un-protecting" when unrolling from an error?

Konrad

