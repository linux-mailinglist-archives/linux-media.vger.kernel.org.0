Return-Path: <linux-media+bounces-50864-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A4BD2F99B
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 11:33:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E94330B6028
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 10:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0337435C1BC;
	Fri, 16 Jan 2026 10:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iv6JwJfA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pnq5QjR9"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F2E35FF69
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 10:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768559528; cv=none; b=uSNL92zIpyWbofA7ePYC43pqN1gFuTDOlVQDYLSjgsbLIcwb/AHoQalOdAcJadlAmFBLuiytEC1G5MFlOSPYwdQZGn7oCVII2SLzre1vR81qEbl8B9XYrSMGKL/5968q2lCq8iO5OABlkqe5mWTf0svzDM0F36sA6geIt/CQ9z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768559528; c=relaxed/simple;
	bh=/Cx7V5d/qObJUyBY9jlVvQ8ZZP50XCxdpJR7+g4EbCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pl75wVBTckgNwFbYy4s2kFWrtr+qqrphVvdFliv2nJ8Y+OBUqSXxSAWHPPdOiQb/55JDfob9v6G+Z9uSn5XjBiqttqqBT51PwPDNQs+RZ3AAl1Ay8L8UQfWB7UkiGJrIdBebKnDKMU7imb/uFoQTJVIVOfdgBfFvT26CxnhxvN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iv6JwJfA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pnq5QjR9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G810N24015934
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 10:32:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	952Y3ub3hNvwTYEtHfS96ADhtWIoX8HVuHXXqCwpINc=; b=iv6JwJfANV98Tvl1
	LQm81yzPFtLSjzBMX9cTKqZSEhVr/Kwfp4UNegqU6wZG/tsaRUUR443ordZzO8s7
	RhJ5ByFbwrXZm7Fp9mjRkg0aPjK4EALl8HuajU57sLHbn8ednQQbvvNn4zuJ5Nap
	FaxgbbSIdrX3Lb3HNWrOh1pHYo2MoeGVgHjLUKDxWZ3y0mwESqF6DFnbIUcCsoHy
	4ReSw5HlIjHKzMYL6i6RMeeiiB8psZZKXAPCRzFRf74Iw+tHyNrqIQ22yzfw+yD4
	0DjCpVTkECsJUiUHZkKqC+vrhx34MYW4VTnVR+CTs9I3EAPIHdtrYOxuF/ELJeCF
	P2S0aQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq98y9seg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 10:32:05 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34c64cd48a8so1938889a91.0
        for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 02:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768559525; x=1769164325; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=952Y3ub3hNvwTYEtHfS96ADhtWIoX8HVuHXXqCwpINc=;
        b=Pnq5QjR9FZXo15nhhAZVE1XTBx1pPlBarGAYQe2mLmGwq+NIfLgliGBoHVKPXEu/ZC
         cMOofyRmzCfGS8b0cGa+gc4SRLov4qHEyDyitvIWFFedtXgsUVd59bG9f9PjTUz3Ndqw
         6NeSy/Cvxy6ZpAKkUjiPim99DFxfYdteRCbEWxvhwoTg9G3zOhpINsQBwFHp0X3/5yej
         +1/X0uAs0pzq76RxZWtK7NLI7pRQnf8LkLTusrs98V0QjLKww2vi0DeUA0zsTHLhsCUH
         vFuI1CRs/V/m+KwHOkrF45tBNsqEkHEjzm8m9bk8AXCVrQb7iZL847c8Y7M7AqHbn15c
         RZUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768559525; x=1769164325;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=952Y3ub3hNvwTYEtHfS96ADhtWIoX8HVuHXXqCwpINc=;
        b=B/HCRB+2YgIAMYGiXphUF8NN6JMNS1hKsr1NSLUYp4F/5QiRInToWyDEv0DKmKCWD7
         ElzZkhkR2NgagrIFkkNESIrP5mWKwlyvJb0du2AVjjtiWbZ98hp7ef7A1/5WG6hu6eyG
         HXvWPC0mivO1PT2R76FE8JCxWM9KK3ZWugddJwvn/zhNQrXwvrFQoOh7dRnFsGaOcW+9
         DQof55khbRnHuL8zGXMP+DA1iUl1ymRgKOcAGsF1LbS0bpUUVtwu3lM9Ie5W2MIKAyEJ
         YtQf18+G6vZmCUF04uzyKJFTubw5yTa1bOeHvGzViLY+8KWOQC2QhLkVd5thYzEShaUR
         GUTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZM9dhH1EMTtZQbw8LLV4hJrDYk+HvsQqiyp2LGaX9YJIxRoP8bXfuPovJTuXy5QKwQEWuWI3SbrmCpA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh4ITzKH3bYpdWQARRUaArL+qmeumfca0Lkyp10ksRfSeWFPQN
	6VTE6PRoLMsOK1+/Vh5k3DCfvAZ9kjfErsVaNHVA7hh3N5MvmBCzQg+WvqBjNmhLtGMThJMTPop
	EraEgSbkGD/v04+0nYRGU6lQ+MaZaCvy19/YOfY7tIR5sfffJ1fyLFwrgBwMWtnK3rw==
X-Gm-Gg: AY/fxX6FeNAqF+fA5yb54R7+6adtqsatMnKQJYU1nArqJIyDT54VFery4OL1ihM1OMi
	RVLQuS8Q+QZuc5PqLWc/bGO5SbRHwfIWkMlqDjS19KambnQTqRw7uXty68kEfu2trUdvsDIe8bZ
	uK7W3L0ATHj/sjiL2u39l0Whz2wbCxs0K1AaHhU7fxZbzeePhhF+bkluaUEaQL5tlRl1EHk8F4J
	0PmWfgIV8HQTZs+ySd8tBr2wWoa0feB7+Cg3alV1mkH5ImHjc12MS9fTznqJ4rbJ4NN0a/WolI8
	e3DqBw0E/p0+nzissRLFLtWn+2GZ6plOmmA+Vyg/ZfHcvzgAkgiq4r68J5nHR+JVq2hrIM1lMuB
	3hoNwc7+jOezND0+0uMnfM8tvUtIINrUMB7b6UovlHA==
X-Received: by 2002:a17:90b:180c:b0:349:8116:a2d9 with SMTP id 98e67ed59e1d1-35272f96be6mr2269131a91.19.1768559524732;
        Fri, 16 Jan 2026 02:32:04 -0800 (PST)
X-Received: by 2002:a17:90b:180c:b0:349:8116:a2d9 with SMTP id 98e67ed59e1d1-35272f96be6mr2269111a91.19.1768559524275;
        Fri, 16 Jan 2026 02:32:04 -0800 (PST)
Received: from [10.0.0.3] ([106.222.229.125])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c5edf24dd2bsm1763003a12.10.2026.01.16.02.31.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 02:32:03 -0800 (PST)
Message-ID: <9dbabf2f-e2eb-ffad-7cf9-f452a10e7628@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 16:01:58 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 3/6] media: iris: Introduce buffer size calculations
 for vpu4
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
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20251210-knp_video-v4-0-8d11d840358a@oss.qualcomm.com>
 <20251210-knp_video-v4-3-8d11d840358a@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20251210-knp_video-v4-3-8d11d840358a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FscIPmrq c=1 sm=1 tr=0 ts=696a13a5 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=blWSk0AuXjsE0o78ys1YMg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=AadUnATRwRICCIMr-X0A:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: QsZ1lhGsTcyK6JAIoU6rqIx5ukajF2gw
X-Proofpoint-GUID: QsZ1lhGsTcyK6JAIoU6rqIx5ukajF2gw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA3OCBTYWx0ZWRfX15Th8CQ+faez
 lI+f4BAjzZaicKdzyDxEZUamhXOeonighDUx7HBRZzEo74MCK9MApHO9/giyQsltHgDpgnBU9dA
 FrcAj09TopVFCD79pWw9PC7dYkMfhD+TR9GKVkK39dwGLQNv2cf4Hu4m9H3zcWmaBIM/7RMryfE
 718Cc/q3gB72kdD6mdThmmV8QZ2F6HGqDLek78NJ9O3HcHQXvCdmacBcKLLWCPp/yCfr2f9r6kO
 bEltVZGyywytMCdzNwR1g56oi/o25cXLWK8o7NXhtDqD9b3ogvvH40YrvR0h5aUJUBT7o0unrko
 jhQjDgYXaKtJu/KqKMvzBC7T0rOvid2q2Z9v54tIYgbh2gZved6yFDZjFHSXmNEAHA1EeamcWk9
 6u7iCZ12zWP7zQQuvmMfQj6Lw8+GeXIT5JFi/3+JXCHtc/Oxq7FnJWXqOsrCOT/ANBVJlXoUBOl
 RwDOOKUb80GLyNkhsbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160078



On 12/10/2025 6:06 PM, Vikash Garodia wrote:
> Introduces vp4 buffer size calculation for both encoder and decoder.
> Reuse the buffer size calculation which are common, while adding the
> vpu4 ones separately.
> 
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 342 +++++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  24 ++
>  2 files changed, 366 insertions(+)
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

