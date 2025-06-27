Return-Path: <linux-media+bounces-36053-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6512BAEABD5
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 02:43:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE61B562E4B
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 00:42:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9864C1E49F;
	Fri, 27 Jun 2025 00:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IToItY4L"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031F7E55B
	for <linux-media@vger.kernel.org>; Fri, 27 Jun 2025 00:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750984995; cv=none; b=jytPT4uF9mWa7ZnJf6UcR+NyPiBiFIdg8MNmya65DMGI+TIMqvoVS0LqWvjho+zpcKbZvfQWZV+z6nXjJFj/T7bJNBd5Mf7l6EAHcnLjVkukpsNJnukVXjXj6nDy6I82p+ynSXQZ3OqFSQ5t1hPXQHkkV2Lok/fxgFrUyLwMXMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750984995; c=relaxed/simple;
	bh=RxhgcxNVID0sgf/oC6xERaF2gkjuquriALvaig0OY0A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dieUluMWotY+FWndcpXg0SE7obXX9cclh+NtTgA49CI4VhYK6HibBu9NaDoYCRRoI8S5KCabQT5IGLKSb2N08HonlY18iBawaK3DXrBYq/2DY+X1WaoSsP3qeWXBY7Px0EMOL+sOMdUHzyUAGR2k/VVnnGmr9w11YZyNKzkA6D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IToItY4L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QJ0PTt002547
	for <linux-media@vger.kernel.org>; Fri, 27 Jun 2025 00:43:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RxhgcxNVID0sgf/oC6xERaF2gkjuquriALvaig0OY0A=; b=IToItY4Lwzj1s6Kt
	h/IhEoakhEmsSH2F4muogJbU0iEA2QIZSJp4GFYOzx28PULeMwbikjBBDbFQlxOn
	WBd4xhB75QgL4tZtiZo+aXu33HyMrhIX//51Aq7Y5T5N1uxDMndsTsxrYnNY6qie
	IDb+isz4IXvJGZj53FlmEQzj6dqSCpuJ0+BugBN6X5EuXejtbN+UBjr9+KejVkGc
	T2kM2iU9h61Ca2fUpSvYPUHhNJISa2D6LYcNaGLoLqphqT3Mnv0xFAZdNJPzdD0X
	ks0t4jP746Z0nN3jltcYMqtI8C/xxWJHxwx2B7Z39htoJIrcgfIKcqb4Rk1VXnYM
	HTSeuw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47emcmxrg2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Jun 2025 00:43:12 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4a5a9791fa9so5336851cf.1
        for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 17:43:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750984991; x=1751589791;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RxhgcxNVID0sgf/oC6xERaF2gkjuquriALvaig0OY0A=;
        b=YcJwOqC3QXc+aiPz6Kt94MOgnPK1AYsJ201s+W8tZcYTuJQ7VG/8PHGFGfpW36S6Wi
         +WqlrH3BPc3gDDk+TC5xrquPL5eHlh9t71/DtnEvOBJYJbb5SiMMMLwerFitnKP7Vkym
         MRbMpvXVQy/9JzMDgdOekCa+uXq8oevcfa1M8UxVUgDeopDLkf2U5wBPeaeckP7HiD0s
         TiwhTL1XpOan4zLWSjoBw7pBQpk+C/3KwXoMF+MFXDfdYWywf81SCaUIxMhfhuT/NT5V
         edBC2AWx0Oo+WxMMgodgJN12VQdH3L51a/Qhpo7NVXA1sIj/A5KmRSLHgfs8ATEFqGtp
         d3Iw==
X-Forwarded-Encrypted: i=1; AJvYcCVHbYD/CyKcPxZXBZr97aV0IxAuoMySwP0dhJTwT6f05Kwoi9hd3RMcYgI2ZOT5nOnSl+WVRBKXQRkCsA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtzBxNI/GSlZWzhp0y+pLFjwaETLhRGs2wv77f15JDxmqpXzit
	ZTB/Ww5uGJm+Xak6q5HRZLn3tnBZvMVu/pVQwwRbuUHtm11oZANQMNtYBo6zIjOnnbBHsF/V9ry
	dTiSYEg/Dp/K2TcKoNAaOea2nWFswok3eKZCSJ5c9CIriJ8Seo4y50TMFdAiZx6a72w==
X-Gm-Gg: ASbGncsH2KJT0yftiNI0FxnlXMR3UFiESFrxr+wdocSUsZIHv3kGDolVdDSd3SdsO+z
	WrpIOXMGviHEfuOTvxQ5BdV8UJstZsxpaQz+5kuIXRAWwdJh+N3lxh672vzS3gelzRu7T9xxmag
	tkKYwX5vGZn7olP71qjoYWYf3S/6olrzwBxEmFZEd6+66c79hW+0OZ5wXavgpEid70FHzvvIwPx
	cEDcDjsrjIIHGHT/hSsDPn/Um9oeSUs4TCIc+JSlMMMW60rOMFVrG334q2p3C3S2wgvInzIsQVK
	/htITcvd29XDet+AbcgZXnHlbDyvdwzhPpOv4WHc8w5lcjVRldmCww8ct1Nd/Q/zq5Nzyom/HR/
	bFY0=
X-Received: by 2002:a05:622a:414:b0:4a4:35f2:a02d with SMTP id d75a77b69052e-4a7fcaae8b6mr11320571cf.7.1750984990736;
        Thu, 26 Jun 2025 17:43:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKNXI92cpFXVO0lV4wZlSgkD56FesYlOoMlNbr8h9q8T2Ti999UIq92tdwTKqeE/60aWjs2g==
X-Received: by 2002:a05:622a:414:b0:4a4:35f2:a02d with SMTP id d75a77b69052e-4a7fcaae8b6mr11320421cf.7.1750984990209;
        Thu, 26 Jun 2025 17:43:10 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b35dsm24433866b.13.2025.06.26.17.43.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 17:43:09 -0700 (PDT)
Message-ID: <0975cd75-2363-44b9-8ae8-b2430799ab78@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 02:43:07 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: Remove extraneous -supply postfix on
 supply names
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        vladimir.zapolskiy@linaro.org
References: <20250626012433.261328-1-bryan.odonoghue@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250626012433.261328-1-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5aHwJzCaiS7vbSvRcvTb2htdnJg2PEO9
X-Proofpoint-ORIG-GUID: 5aHwJzCaiS7vbSvRcvTb2htdnJg2PEO9
X-Authority-Analysis: v=2.4 cv=J+eq7BnS c=1 sm=1 tr=0 ts=685de920 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=OGg3twXR7MAiZJUF5pEA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDAwNCBTYWx0ZWRfXzLISaz2oF9cV
 3WilxtZ58xcpCmrxKRnoMOqfu2fJZCOH3m4yLAcrUhIzr8Py5yHU8JJc6dJmsgM6QVYYxVspK5l
 O3Q2vqdIUtCKh39XKynqeLFKOo9BU4MRVcg1tL+GPICkSysLed22S3+PtThXFfjxi5ymITTlhb9
 Ah0fYLTy360usI5RilI7ldtgXuXRPhokmjgMP2ZbRu08Zsyj/Gh2CewHSrxybyw4+HOGNPUWBNm
 TOP2Kk4jPAmfuzwP+4ws8rRLlmeF7ts1e7W9iccunOdKBJuqRsg9xQmTy6GhAOHbi9D/0RLE5lu
 U1IOMWH1fixvFRFIltcC+UGn84CyoMyyCL+MVETnLhhuvilxntK2CcX8ge0Ew+HoqRHLnrPejTv
 UEFjrQMaG56FTclfps7fJgOP0n0ruv/9cmAFc1Sxi4eq12QROR14UL4naBF9TBTmQDBzOG6U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_01,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=705 adultscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270004

On 6/26/25 3:24 AM, Bryan O'Donoghue wrote:
> The -supply postfix is wrong but wasn't noticed on the CRD devices or
> indeed the Dell devices, however on Lenovo devices the error comes up.

Please give the commit message another shot, perhaps with "PM" in the
commit date above ;)

For the code:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

