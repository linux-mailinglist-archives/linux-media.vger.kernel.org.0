Return-Path: <linux-media+bounces-47464-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E5DC7318E
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 10:22:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1BC9F34CA47
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 09:22:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB6DA3101D3;
	Thu, 20 Nov 2025 09:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RnGMjYsr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hXv7VPgD"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41452DEA7D
	for <linux-media@vger.kernel.org>; Thu, 20 Nov 2025 09:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763630555; cv=none; b=CXzwFxJaX8S4S4pQIYywNSCP8YARBDnVah3ownpH5AXifd4JYlwTgnjQuMbDiGrYvLrEyVvP+4XgUNB9sJmFacSOIiqrOlkyG+Lq14dv7nv6Ih6ky75iFh2drt0IRQX6wcxDAWHLkNJ20dKA9bCjRfkaZWDsylhGVtKabMTzw3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763630555; c=relaxed/simple;
	bh=tSGXRzIAViCY+EvVlYPFI/aCyLbiIkPIKR5LrIQC/3Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QTAT5gnE6Tlup7QNIoG0fT5o8UNdwGtm8wqrqWgOMMWbDQwwctKT7EKb3nwJVv7b1dug7xO25tjgcMh0xTlwOS/1iOqymPLsZ3nLflzBjS/AAUkYytlIHBDmS1lUxKJljZGhWTdOaXfBgUu8RU7N3Kkjvp0CUTT6cVWwz1FAb0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RnGMjYsr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hXv7VPgD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AK4q6bh3844354
	for <linux-media@vger.kernel.org>; Thu, 20 Nov 2025 09:22:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yctz9IqhAPBQ+1a/mqNemQjJb/z4tq9vATArLX/6aOM=; b=RnGMjYsrmS/a6yDA
	y+VUGBRSlD+YJ7sSALJWzKzOS4igkSu9sZxkmIqjZb1k1OQI2nefh/zfS/tctSxy
	DBkAIx7JurZiHuu3fPdkbOgzq1ONYXKCRaemhaxf2aSKV/S46Kv/PAuu0wuUgKA2
	fBMsoFLO4sNiZ9nrHS3xd4TGqebZqGYzgGCFbC7sczN5W5W/IyshIIfwjhxmEAOt
	DPNJEqnv6PAAEKQWT/Kv3/C7GpOTgHq5PLAGRRuAgGU7P6sg6Qn+LLxplLn1MZ/3
	1yGshLdZtnSDNUY8H2BK0HSIpDSABAy0YmllcistKhSrGbXSNvW0ZguwUtzkTZV7
	Xip45g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahdpr3ff6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 20 Nov 2025 09:22:32 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee409f1880so1443061cf.1
        for <linux-media@vger.kernel.org>; Thu, 20 Nov 2025 01:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763630552; x=1764235352; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yctz9IqhAPBQ+1a/mqNemQjJb/z4tq9vATArLX/6aOM=;
        b=hXv7VPgDdhSPdgh23rqwYQHWHijD89gH0mHrnmB+NTeRfpxykULLSGFY16NktMJen9
         J1frZKLAoZgZUzJn84HPIQOkQrmXi0RwJjq46aZv83uqVsEPbVTp7UQ6NL/6PTNH/EAz
         ZX6vOiaqO2UPUNrsSRJ2r6eIUPLtKz/O4IZ2HLKDoMVuwgxwIk/pUV/Qy7i0DQ9xCf1n
         XXUxGT7YYLJZuZvQw/oylrzBJ0t+uwW3bAS0/gWD3zxO72wPAYwoP1qBfqbqG8bXzHVx
         8cKn3XhXXAORYM9CbJk/vVTq+PtKLQR3apXB6ht1DiZ0urfTrjiEP99AMfFIvPm2nxAj
         75Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763630552; x=1764235352;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yctz9IqhAPBQ+1a/mqNemQjJb/z4tq9vATArLX/6aOM=;
        b=Hmmjyy/cO92VtGmYPg4WgBvVHZOChLfgTZCoT6VxoQz5nyJ44WvrUgTU2Zdor3661v
         XcJATwXwGtbIb2G5CDLUj2qtNR48pHKSWMkV/8ous4nBpNbDksnyt26GxC50rjo8H6Fp
         RcRvr8912+MF4iFFSBj/UMhZ2cya40T1Mk/rU2xEonkXd7xGSzQ7Yh7soj7g4hQHo1l9
         Bryfi7N6vq88tkwaIl9MqudtNekXg+ja0jgX7fM4SOJefNoh3jbvrQ8M/BMdrvo8QGLt
         QOXgGmMuNtU5eCRH88lnlU0LjKJrxbsgE0GKNGGCfDVjb770XNNL7pvgon/cVSZXr0la
         OtRw==
X-Gm-Message-State: AOJu0YzgKHf2ORz3paYcyUmi51VJk5SH94HehZbgkpx8ip9o74v6PcrA
	jLKcqh5o9diKnxdWD+Wtx1NI4qPL0jNsJLFPVZ1zyPCFHtt3Acob23jSne92CZ7GxJ8wtiXWzry
	eqfuuFQ1Lu2aA7mW3XDspdf38NGSX9uwCxz2jq+7Y4f1k/a8WJxkwaifQl6PLCL3JQg==
X-Gm-Gg: ASbGncvG5K5R8hW69vQUWkgpUUfzKvMf6Isr1nSaCkVc2p3kLrvh8d0WDqcj8yyZMfc
	Tu6jOQOhGjMaBxBshL9u1NIFTtVVeWYKevIFhHNMHquZVEFWRoSerkHKZ94pvUJbdfPlEZ8R9lA
	6dzlTKdV600r/GElTBw7l7NN/VD3MFZrqNTfrH8ex08RmhPLB2+hFxRWLTQNk31p5W+N4+fOoeX
	TeDap6Ij7Y9aWLHrxp4KlV4M8Ao/5SeeWnGml95ODk39y2H2yQm4+x2wBVQMvCe97a9KgBjgdTM
	+P1URxbU0CrD2tzPYo0KZxoSjEBCFqMuYn+uFGtWgaeSskGB1lMfkbhIEzI+IBSJpnILhqJeA1y
	U6AODs5m+j6zJZArWqvdyRs/VUklT52pKeCeE0S/Ol70KGu2IoADMbEOBK/F25VxJJ+8=
X-Received: by 2002:a05:622a:1898:b0:4ee:4214:3226 with SMTP id d75a77b69052e-4ee4d46e7cemr7411281cf.6.1763630551938;
        Thu, 20 Nov 2025 01:22:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGAJO3aHE2R9ki5PG+spz966VyxtyYO6+zj+lYg+CQGNg6px0oTZFG+eeB/j7TFx+4fSV+xvQ==
X-Received: by 2002:a05:622a:1898:b0:4ee:4214:3226 with SMTP id d75a77b69052e-4ee4d46e7cemr7411101cf.6.1763630551522;
        Thu, 20 Nov 2025 01:22:31 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654cdd62bsm168359766b.5.2025.11.20.01.22.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 01:22:31 -0800 (PST)
Message-ID: <95ba4c5f-b973-44b0-98e5-f314336844ac@oss.qualcomm.com>
Date: Thu, 20 Nov 2025 10:22:29 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: venus: flip the venus/iris switch
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251119-venus-iris-flip-switch-v1-1-852369f66e36@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251119-venus-iris-flip-switch-v1-1-852369f66e36@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Uq5u9uwB c=1 sm=1 tr=0 ts=691eddd9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=DfD8mOSChUYQOWL1AdoA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDA1NiBTYWx0ZWRfX58jajd/O6DE/
 /vyXa3mIqL4APv9Dr2mJsYDADyCTS+n9w+/rNHEz8oWj1CVqkRi1xOFmF2lTllmVfGSFCYkDHkZ
 Fd1TPKEd4CH2mMXCThz8YBfyr7mLq6CtvvKRZce97FGB8JBatzoa+L/8SpkScfXh1o3JZF4EU90
 86nfYIFP7+ilGuriI9agPgNwIqe+SomnaR4yuvifnLVc44uG4giV3bDks0uwuAcjpRAiH4F+Iit
 d0ymb26YHoRng/WWCFGPCa3uZhD4clzMjMVed+sD6p0v3UviJOlBNvU2daEm1hYNjV/wyn5XxWp
 EYy+TpxJgC7KtwdPRwYpDGqR+KE/iSebh8yP+Tai6onuKkd8wjRcM+ZL3m/lnLA87LX+NRlKlS2
 DTXYotI6/MScK6xIGprYsZkkTEgejg==
X-Proofpoint-ORIG-GUID: CsKd7QRsmYNeDefbLIpbsE6mHD7x8vGU
X-Proofpoint-GUID: CsKd7QRsmYNeDefbLIpbsE6mHD7x8vGU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_03,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511200056

On 11/19/25 4:18 PM, Dmitry Baryshkov wrote:
> With the Iris and Venus driver having more or less feature parity for
> "HFI 6xx" platforms and with Iris gaining support for SC7280, flip the
> switch. Use Iris by default for SM8250 and SC7280, the platforms which
> are supported by both drivers, and use Venus only if Iris is not
> compiled at all. Use IS_ENABLED to strip out the code and data
> structures which are used by the disabled platforms.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Note: then intention is to land this in 6.20, which might let us to
> start dropping those platforms from the Venus driver in 6.21+.
> ---

[...]

>  MODULE_DEVICE_TABLE(of, venus_dt_match);
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index 7506f5d0f609ac8984ab90ba207e64750df8a9ec..c7acacaa53b880c66b11bba2cca8d625b4f8fb9d 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -54,8 +54,10 @@ enum vpu_version {
>  	VPU_VERSION_AR50,
>  	VPU_VERSION_AR50_LITE,
>  	VPU_VERSION_IRIS1,
> +#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
>  	VPU_VERSION_IRIS2,
>  	VPU_VERSION_IRIS2_1,
> +#endif

This feels a little overkill, but your changes look good

Konrad


