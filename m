Return-Path: <linux-media+bounces-50447-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3433FD122D5
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 12:08:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C63A530CBA69
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 11:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CA983559EC;
	Mon, 12 Jan 2026 11:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U8PqZPCn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z9kQ9Xww"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CC727A123
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 11:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768215819; cv=none; b=HVRS08Uc9WpUYkSYBo2Z/jemvbyqE0uhPP/0EfWBqQgTK+aDGiG5FQ9SIswm7CF4zNRhZrKZeR+Yp5af9Oxx0UsPaL6T+vMuibRx9nykZ7dDZjkpguRgkvddhBMCELJ8vKoFR9Mv//8Z3l8zbeXQ8iUt5NlTOV69XZVh+vOEOcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768215819; c=relaxed/simple;
	bh=JqsqXZpd7O5tI1BnIo9kC/oyM7AhjL7oWrl/olmsm1A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pwqZbkCRXaahOQh5+URKigqiwkgNU/N+GEUMNjGqyVbN/6rtOMfPEStVz9JZQOrRy1Y1iWoiTBy9ibK4Y7NQdaOjMMdqv3kZvBKRIcm69HkWfTXfMYcKkRPPN1omFlsOR54dC3ARdECF8pCZKQdiRt44YNfTgYZ5uPQGjOoXuDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U8PqZPCn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z9kQ9Xww; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C9FQAZ1093212
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 11:03:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LWBS851Ia9wsg6R1V+UQBXWOrP4n0IYlCQF4mRhDCyI=; b=U8PqZPCnoYQtxf2y
	hLIzEGgTUpIZM14KIwdecISIcaTggrWPUAN625slcXr4PqCxf5PNL/LHZfvYjfy5
	NJAdb0AhdpFoSol8V+83MyABuqnayrBAgkLnxw6oUAnFVV0srYljUoN/ebOrJrQV
	EzJJyZikPnXUKaRn7LFbUmnQFTBrBvotwtQEEon+Uaumy8CGCu9cMHyftutpREFc
	RZh/dCixsrM4SJzlMdO6KRfKZpZO6f5QwTsEhXUEHU1kyHXDz7jvYTwi5xS5CBe8
	oUX4RPTdky3Hx21IjVtBllg8jdMDs4K7aqxbnjq+3zC0GvvvcZT+F136ZYhf2OU7
	r01RLA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmx5mgasw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 11:03:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b222111167so122851285a.1
        for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 03:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768215816; x=1768820616; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LWBS851Ia9wsg6R1V+UQBXWOrP4n0IYlCQF4mRhDCyI=;
        b=Z9kQ9XwwHPuQ5OKtVK5saXYygr9ZIZQAh7bv3KKGQNIqE3AT2F61sfL8MDetW4ZIQ0
         RbbF2KthK+M2zmIYjIreRo02r+J4QBucRQj+5D97DnufI7evBoed9gH10umI7HkHAztZ
         WdsjiQqvTiA7mAaYuDjsXUg+rucD7hVgAeX33eM/HNTliDbNp8LcQ6HILC++hOTmCmNY
         Xa+8sgtAJv10Wem4czt0SNYQNgrakOWltfN4PXWS6F6ltrAH2NP/ojKbL7KLweZnly7O
         8BFz4f+8CtP1g747LZyMAb/QuQOoO724FPckPyfBXpdnbtkBIOdfAN+Sp/bWE7zRSwmJ
         Lt9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768215816; x=1768820616;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LWBS851Ia9wsg6R1V+UQBXWOrP4n0IYlCQF4mRhDCyI=;
        b=K/irNMK8wa91waBHDytUFJXkOVNlrOy25O6KOBhcv8ZCbqVRbiGwouyjw/KM/Ns4Wf
         Ly0MrzQkOPZzaaDDpzNUgIwqOfPYp4eM8CL8rdAEZBV9nlrXZDoUeTVTLow/VRNIix0z
         /rR9lF9AOWSxoIt2eZLt/dQok/0WGxApJ2YVuvHhWt1+l2fpmyKi965EkybdM+8bN+Nn
         Fy7R4XOsDeb7yRQ2Df9Hrtq7OgtTyu8A9Cz2rcFIZwaz/AW5P8EEV6ZLnibGbPdbxJ1T
         rmKmBICo8DEYvn4x3T2FyRzTS2Yrm5QwFQ12/tRQHphIZiHXxlZmSRq19ZmzbzGFQN7u
         kaqA==
X-Forwarded-Encrypted: i=1; AJvYcCW2iKkTb3XjeZotTrobfWHJHajDIC1IZM3Bk/eSMmxDniYcxj6iPAOZGICOQwtcMzJtrw87as1WsV0SAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRX1OgzqQsQ45oPbN2HKvvgxN07IJnI0NlqtxDJuTruvgp0P9g
	5pdZYxo4R7PN1d9DGwNaC1k2q8wd411DDiSA4hgJ/w9v2GX43qTEVbGuh+gZC4ha/FAoq6BEKBv
	rqE83Nm0a1A+NUXMBDpoL7regBj9wp4Xgid8qGx36yhMGSZ4z7bgW/E2y7LMbV0HtWQ==
X-Gm-Gg: AY/fxX7q/o9NBaHNF84P+LZjEOay8y2GD8hH3WeQ+2csTjTl+ramZw84qfwD5NVJiCi
	YDFN0T+vziQ8/N0P4y6t1SzDymNGn4aXVjx6CghkZk47WOZEMUKPDI+SNkeyGLGwwIVn0vwYoaR
	W4vrnYpyy5KuVVtAigy0L/zpq0p8HEaC2mgBqX6U/68s2gdjAgnACFqW2gh5CyJoc3ZZzUA2y4T
	1hU7XGWImdrqKvb6hYpz03OOl1cdqjato4VHbkdS01c73iUwQNkFg9wkO7PYnr2uKUelUi9QfXA
	5uK6L9HLB6UVXmm6yO5kamQgYK8Cy/rhR5ZV89WBwiRZiuTR4UUywvJYrnXwmAsppUgRf/4o0e4
	soMbht07/TABrSM0xgnq+lLpzlHfxF66v7mUA9YoXkoXMx/ADSLB/lPVEAdnAW4bzcI4=
X-Received: by 2002:a05:620a:1723:b0:89f:5a1b:1ec9 with SMTP id af79cd13be357-8c389365bfemr1829828785a.1.1768215816240;
        Mon, 12 Jan 2026 03:03:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHl0UVgSxwCS98Z+ig6bZpztO1J9kTdmMnC/XwdizBlsBUoDqYEdx77+tSRUDHZhCuXlzH3vQ==
X-Received: by 2002:a05:620a:1723:b0:89f:5a1b:1ec9 with SMTP id af79cd13be357-8c389365bfemr1829824185a.1.1768215815664;
        Mon, 12 Jan 2026 03:03:35 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a56962esm1921632266b.66.2026.01.12.03.03.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 03:03:34 -0800 (PST)
Message-ID: <29d2b989-2040-45b8-97ef-58fbbd1d15da@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 12:03:31 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/11] media: iris: don't specify bank_spreading in the
 source code
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
 <20260110-iris-ubwc-v1-7-dd70494dcd7b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260110-iris-ubwc-v1-7-dd70494dcd7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4NyBTYWx0ZWRfX9jFXCFXWCdfs
 LUv0IbdiZF5VoLQYptczzX1D1Lsw7urXyt9uPbKAFJrvm57j3TQww00xlrfQ6/X+2uQhG5GsJPS
 gYzXiVmkLGiSZbrRfeFjK69tKPNOFvHhCD0bSaw55+tFG8ZGgpYhi8xMuoOD37PT8oGznR/TfWf
 NNUKDrGCQbXWR6r8ATIQ5skbTajtUDYQ3UR1P5ETV60vBZc6ZxbZkg9mTItmA7x1CLPMK7XcDYo
 2pcyME41M7etVRPxbyQOl1/LDlNBW7n9VKVzaEzcxiQzxSU1d0566NDulNbbuSoDAlNe03lkyll
 0oGfTN8sqxZVSOmdhjoLNMupbn4DWs2YSnMZJlfpp5by1RSh0ablRn6uEKVvs247coihUZFI8X7
 CJdUBEbgIwPo+jrIRu5VoLpRQZuEXzEvHatyr6JmY32DHhSgfJoa4D0nqR///rwuEAeXg9zzuQb
 KBvBjSR5QZVvMYnA0Rw==
X-Proofpoint-ORIG-GUID: a5edXGIdSVdMTX4n2UwA6WNNaR4q-4Qx
X-Proofpoint-GUID: a5edXGIdSVdMTX4n2UwA6WNNaR4q-4Qx
X-Authority-Analysis: v=2.4 cv=Q8zfIo2a c=1 sm=1 tr=0 ts=6964d509 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ss-qTuU1ZYQsC6pQTdcA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 spamscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120087

On 1/10/26 8:37 PM, Dmitry Baryshkov wrote:
> The UBWC bank spreading is specified both in the Iris driver and in the
> platform UBWC config. Use the platform UBWC configuration instead of
> specifying it directly in the source.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


